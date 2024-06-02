# MikroTik Hotspot User Profile Script

This repository contains MikroTik scripts for hotspot user profiles to run on user login and on logout. The purpose of this script is to enable shared simple queue for mikrotik hotspot based on queue contention ratio and unknown targets. When a user logs in the on-login script adds the user IP to the parent target, this also checks the contention ratio of the shared package and increases tne MIR and CIR of the parent to ensure guaranteed bandwidth to the child dynamic queues. The logout script does the opposite i.e. removes the child target and shrinks the queue size. The script is designed to be used with MikroTik routers running RouterOS.

## Usage

1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/emmanuel-nike/mikrotik-ros-scripts
    ```

2. Navigate to the cloned repository:

    ```bash
    cd mikrotik-ros-scripts
    ```

3. Modify the scripts according to your specific requirements.

4. Upload the modified scripts to your MikroTik router.

5. Configure the hotspot settings on your MikroTik router to use the uploaded scripts for user profiles.

## License

This repository is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute the scripts as per the terms of the license.

## Contributing

Contributions are welcome! If you have any improvements or bug fixes, please submit a pull request.

## Disclaimer

Please note that the scripts provided in this repository are for educational and demonstration purposes only. Use them at your own risk. The author is not responsible for any misuse or damage caused by the scripts.
