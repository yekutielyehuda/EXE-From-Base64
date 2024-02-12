# Base64 Executable Decoder and Runner (exe-from-base64.ps1)

## Description:

The `exe-from-base64.ps1` PowerShell script is an invaluable asset for penetration testers and information security researchers, designed to bypass antivirus restrictions by decoding and executing Base64-encoded binary files directly from within a PowerShell environment. By providing a seamless method for running files that may be flagged or blocked by antivirus software, this script empowers security professionals to conduct comprehensive security assessments and penetration tests with greater efficacy and flexibility.

## Features:

- **Antivirus Evasion**: Enables the execution of files that may trigger antivirus alerts or be blocked by antivirus software by decoding and executing Base64-encoded binaries directly within a PowerShell environment.
- **Stealthy Execution**: By bypassing traditional file execution methods, the script offers a stealthy approach to running potentially malicious files, allowing testers to evade detection and assessment interference by security solutions.
- **Execution Control**: Provides options to immediately execute the decoded executable or save it for later use, offering flexibility in testing scenarios and control over execution parameters.
- **Customizable Flags**: Allows for the passing of additional flags to the executable when running, enabling customization and fine-tuning of execution parameters to suit specific testing requirements.
- **Security-Conscious Design**: Facilitates the secure handling of potentially malicious files by encoding them in Base64 format within the script, mitigating risks associated with file exposure and interception during testing activities.

## Usage:

```
vbnet

```

```vbnet
Usage: ./exe-from-base64.ps1 [-h] [-r] [-exeFlags <flags>]

Options:
     -h    Show this help message and exit
     -r    Run the exe immediately after decoding
     -exeFlags    Additional flags to pass to the executable when running

```

## Example:

```
bash

```

```bash
./exe-from-base64.ps1 -r -exeFlags "smb -id user -p password"

```

This command decodes the Base64-encoded executable and runs it with the provided flags, facilitating the execution of potentially blocked files in scenarios involving SMB authentication. This example was used to run [NetExec](https://github.com/Pennyw0rth/NetExec) to bypass AV.

## Why it's Good for Penetration Testers and Information Security Researchers:

1. **Antivirus Evasion**: Enables the execution of files that may be flagged or blocked by antivirus software, providing testers with a powerful tool to assess security posture and identify vulnerabilities without interference.
2. **Stealth and Discretion**: Offers a stealthy approach to file execution, allowing testers to avoid detection and maintain discretion during security assessments and penetration tests.
3. **Flexibility and Control**: Provides options for customizing execution parameters and control flow, empowering testers to adapt the script to a variety of testing scenarios and environments with precision and control.
4. **Security-Conscious Design**: Prioritizes secure handling of potentially malicious files by embedding them within the script and eliminating the need for external dependencies, minimizing risks associated with file exposure and interception during testing activities.

---

## Note:

The Base64 encoded content is not present in the script, it should be manually added to the designated location within the script (line 42).
