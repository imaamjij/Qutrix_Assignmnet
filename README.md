# Qutrix Assignment

Robot Framework automation for the Qutrix screening assignment.

## What is included

- `tests/ip_capture.robot` prints the laptop IPv4 address using PowerShell.
- `tests/qutrix_self_assessment.robot` opens Qutrix, follows the company/career flow, opens the self-assessment page, and saves a screenshot.

## Setup

Install the dependencies:

```powershell
python -m pip install -r requirements.txt
```

## Run

Capture IP address:

```powershell
robot tests/ip_capture.robot
```

Run the Qutrix browser flow:

```powershell
robot tests/qutrix_self_assessment.robot
```

The screenshot is written to `artifacts/qutrix_self_assessment.png`.
