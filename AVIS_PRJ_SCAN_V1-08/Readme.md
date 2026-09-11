# 📘 **README.md — AVIS PROJECT SCANNER**

### **Configuration-Driven Project Bootstrap Engine for AI-Assisted Development**

**Author:** CVBGOD (MERCWAR FFF)
**Edition:** GitHub Publication Release

---

## 1️⃣ Introduction

The **AVIS Project Scanner** is a configuration-driven directory generation and synchronization engine built entirely in **pure Windows Batch**.

It reads a simple `.INI` configuration file and automatically constructs a complete project directory structure based on its contents.

This system is designed for:

* Developers who want deterministic, reproducible project layouts
* AI users generating project scaffolds from prompts
* Educators teaching configuration-based automation
* Anyone who prefers declarative filesystem design

Because it is written in **native Windows Batch**, it is:

* Transparent
* Portable
* AI-parsable
* Dependency-free
* Easy to audit

---

## 2️⃣ What Makes This Project Unique

This repository is both a **utility** and a **teaching framework**.

It demonstrates how:

* A simple configuration file can control a full directory system
* AI can generate filesystem layouts safely
* Automation can be driven without external frameworks

### A message from CVBGOD

> “You don’t need expensive tools.
> You don’t need a complex IDE.
> Give an AI this INI file.
> Tell it how you want your project structured.
> Run the scanner.
> Your project appears exactly as defined.”

This project exists to show how **AI-assisted development can remain deterministic and reproducible**.

---

## 3️⃣ Core Concept

> **The filesystem should be defined by configuration — not manual creation.**

The `.INI` file acts as the **single source of truth**.

Every `DIR_*` entry becomes a real directory on disk.

Benefits:

* Deterministic initialization
* Reproducible environments
* AI-friendly structure definitions
* Zero ambiguity

If a directory exists, it must exist in the INI.

---

## 4️⃣ System Architecture

```
AVIS_PRJ_SCAN_EXEC.BAT
│
├── CONFIG_ROOT.BAT        → Establish root paths and log locations
├── CREATE_STRUCT.BAT      → Ensure required directories exist
├── LOAD_CONFIG.BAT        → Read INI file and create DIR_* paths
├── TMP_CONFIG.BAT         → Generate configuration snapshot (.BAK)
├── LOG_CONFIG.BAT         → Write log headers and metadata
├── SCAN_DIR.BAT           → Recursively map all directories
├── SCAN_FILE.BAT          → Recursively map all files
└── SCAN_RESULTS.BAT       → Display summary and verify exports
```

Each module is:

* Isolated
* Replaceable
* Testable
* Expandable

This modular layout makes the scanner easy to maintain and extend.

---

## 5️⃣ The INI File (System Core)

Example configuration:

```ini
DIR_AVIS_PRJ_SCAN=H:\htdocs\robo-knight\AI_AVIS_FVS\AVIS_PRJ_SCAN
DIR_INCLUDE=H:\htdocs\robo-knight\AI_AVIS_FVS\INCLUDE
DIR_OUTPUT=H:\htdocs\robo-knight\AI_AVIS_FVS\OUTPUT
DIR_SOURCE=H:\htdocs\robo-knight\AI_AVIS_FVS\SOURCE
DIR_LOG=H:\htdocs\robo-knight\AI_AVIS_FVS\AVIS_PRJ_SCAN\LOG
```

Each `DIR_*` entry is:

1. Parsed
2. Validated
3. Created if missing

No directory is created outside configuration scope.

---

## 6️⃣ Using AI to Generate Your Project Structure

This is the intended workflow.

### Step-by-Step

1. Provide your `.INI` file to an AI system.
2. Instruct the AI to modify or expand `DIR_*` entries.
3. Review changes.
4. Save the file.
5. Run the scanner.

The scanner creates exactly what the configuration describes.

### Why This Matters

* No manual folder creation
* No path memorization
* No structure drift
* Regenerable environments

You can recreate your entire project layout at any time from a single file.

---

## 7️⃣ User Interaction Layer

On startup:

```
[AVIS] SELECT MODE:
       1. CONTINUE WITH SCAN
       2. OPEN CONFIGURATION FILE
       3. READ LOG FILE
```

Option 2 opens the configuration file:

```
start notepad "%PROJECT_PATH%AVIS_PRJ_SCAN.INI"
```

Option 3 opens the log file:

```
start notepad "%PROJECT_PATH%LOG\ACK_AI_OP.LOG"
```

---

## 8️⃣ Logging System

Log output location:

```
AVIS_PRJ_SCAN\LOG\ACK_AI_OP.LOG
```

Log contents include:

* Execution timestamps
* Environment metadata
* Directory mapping
* File mapping
* Synchronization state

Logs provide a complete trace of scanner operations.

---

## 9️⃣ Default Template Block

Starter template:

```ini
; DEFAULT_DIR_AVIS_PRJ_SCAN=c:\YourProject\AVIS_PRJ_SCAN
; DEFAULT_DIR_INCLUDE=v:\YourProject\INCLUDE
; DEFAULT_DIR_OUTPUT=b:\YourProject\OUTPUT
; DEFAULT_DIR_SOURCE=g:\YourProject\SOURCE
; DEFAULT_DIR_LOG=o:\YourProject\AVIS_PRJ_SCAN\LOG
; DEFAULT_DIR_AI=d:\YourProject\AVIS_PRJ_SCAN\AI
```

Uncomment and modify as needed.

---

## 🔟 Visual Structure Overview

```
+---------------------------+
|      AVIS_PRJ_SCAN        |
+---------------------------+
           |
           +-- LOG\
           |    └-- ACK_AI_OP.LOG
           |
           +-- INCLUDE\
           |      └-- BEGIN\
           |            └-- KB\
           |
           +-- SOURCE\
           |      └-- BEGIN\
           |            └-- KB\
           |
           └-- OUTPUT\
```

This structure is entirely configuration-driven.

---

## 1️⃣1️⃣ Design Philosophy

This project demonstrates:

* Configuration over manual control
* Automation through simple formats
* AI-assisted reproducibility
* Deterministic scaffolding

It is intentionally minimalistic and explicit.

---

## 1️⃣2️⃣ Conclusion

The **AVIS Project Scanner** bridges:

* Human developers
* AI assistants
* Reproducible filesystem architecture

It is:

* Simple
* Deterministic
* Transparent
* Regenerable

> “If you see a directory, check the INI first.”
> — **CVBGOD**
