## How This Works

This ransomware contains two malicious programs:

1. **Data Collection**: Collects important and sensitive system data and sends it to the `/home/attacker/loot/` directory. This directory is created by `setup.sh`.
2. **File Encryption**: Scans the system for files named "important_file" and encrypts them. `setup.sh` generates some "important_file" for testing.



## Notes

1. You only need to run `setup.sh` **once**. After running `setup.sh`, you only need `attack.sh` and `README.md` for auditing. All other files will be deleted.
2. Run auditing **after** `setup.sh`. There is no need to audit the execution of `setup.sh`.



## How to Use

1. Give execution permission to `setup.sh` and `attack.sh`:
    ```sh
    chmod +x attack.sh setup.sh
    ```
2. Run `setup.sh`:
    ```sh
    ./setup.sh
    ```
3. Start your auditing tool.
4. Run `attack.sh`:
    ```sh
    ./attack.sh
    ```
5. Stop auditing and analyze the audit logs.