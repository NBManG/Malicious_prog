##How this work:
This ransomware contains 2 malicious programs. One will collect some important and sensitive system data, and then send these data into the /home/attacker/loot/ directory. This is a new directory that will be generated by setup.sh. The other will scan through the system files and trying to find the file with name "important_file" and encrypt them. Setup.sh will generate some "important_file" for testing.



##How to use:
1. Give execution permission to setup.sh and attack.sh:
	`chmod +x attack.sh setup.sh`

2. Run setup.sh:
	`./setup.sh`

3. Start your auditing tool

4. Run attack.sh:
	`./attack.sh`

5. Stop auditing and analyze the audit logs
