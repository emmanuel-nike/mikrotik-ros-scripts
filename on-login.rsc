:local queueName "#_QUEUE_NAME_#" 
:local queues [/queue simple find parent=$queueName]
:local ts []
:foreach q in=$queues do={
    :local targets [/queue simple get $q target]
    :local disabled [/queue simple get $q disabled]
    :if ($disabled = false) do={
        :set ts ($ts, $targets)
    }
}
:local maxDownload 5000 #Max download speed in kbps
:local maxUpload 5000 #Max upload speed in kbps
if ([:len $ts] = 0) do={
    /queue simple set [find name=$queueName] target="#_INITIAL_TARGET_IP_#" max-limit=($maxDownload."k/".$maxUpload."k") limit-at=($maxDownload."k/".$maxUpload."k")
} else={
    :local ratio 2 #Contention ratio
    :local childCount [:len $ts]
    :if ($childCount = 0) do={
        :set childCount 1
    }
    :if ($ratio <= $childCount) do={
        :set maxDownload (($maxDownload / $ratio) * $childCount)
        :set maxUpload (($maxUpload / $ratio) * $childCount)
    }
    /queue simple set [find name=$queueName] target=$ts max-limit=($maxDownload."k/".$maxUpload."k") limit-at=($maxDownload."k/".$maxUpload."k")
}

:local listName "HS-BYPASS-LIST"
:local list [/ip firewall address-list find list=$listName address=$address]
:foreach l in=$list do={
        /ip firewall address-list remove $l
}

