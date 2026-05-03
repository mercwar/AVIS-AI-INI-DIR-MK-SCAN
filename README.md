NOW BUILT INTO  [CYBORG-PROJECTS-EXPLORER](https://github.com/mercwar/CYBORG-PROJECT-EXPLORER) this project will no longer version.
# 📘 **AVIS PROJECT SCANNER v2.0**  
## **AI‑Driven Directory Creator • Structural Validator • Source‑Code Merge Printer**
<img 
    src="https://raw.githubusercontent.com/mercwar/Robo-Knight-Gallery/main/Version%204/Copilot_20260414_025028.png" 
    alt="Robo-Knight Canonical Shine" 
    style="max-width:100%; height:auto;"
/>


**Author:** CVBGOD (MERCWAR FFF)  
**Edition:** GitHub Publication Release  
**Core Upgrade:** *Version 2.0 introduces the new `SCAN CREATE SOURCE` + `SOURCE MERGE TXT PRINTER` engine.*

---

# 1. Introduction

The **AVIS Project Scanner** is a configuration‑driven project bootstrap engine.  
It reads a simple `.INI` file and constructs your entire project structure automatically — deterministically, reproducibly, and with zero ambiguity.

Version **2.0** introduces:

- **AI Source Code Copy Mode**  
- **Full Project Source Printer (`*.TXT` Merge Engine)**  
- **SCAN CREATE SOURCE** (new directory‑driven source export)  
- **Improved INI parsing**  
- **Cleaner logs**  
- **Faster directory walkers**

This system is built in **pure Windows Batch**, making it:

- transparent  
- portable  
- AI‑friendly  
- ideal for training AI to understand project structure  

---

# 2. What Makes This Project Special

This repository is both a **tool** and a **teaching artifact**.

### A message from CVBGOD:

> *“I built this so programmers can use AI to generate their project directories.  
> You don’t need expensive tools.  
> You give the AI the INI file.  
> The AI writes the structure.  
> My scanner builds it exactly as described.”*

```
██████╗ ██╗   ██╗██████╗  ██████╗  ██████╗ ██████╗
██╔════╝ ██║   ██║██╔══██╗██╔════╝ ██╔═══██╗██╔══██╗
██║      ██║   ██║██████╔╝██║  ███╗██║   ██║██║  ██║
██║      ╚██╗ ██╔╝██╔══██╗██║   ██║██║   ██║██║  ██║
╚██████╗  ╚████╔╝ ██████╔╝╚██████╔╝╚██████╔╝██████╔╝
 ╚═════╝   ╚═══╝  ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝

        AVIS PROJECT SCANNER v2.0
   AI‑DRIVEN STRUCTURE • SOURCE MERGE PRINTER
          CVBGOD • MERCWAR • FFF

```
This README explains:

- how the scanner works  
- how to use AI to generate your directory structure  
- how to integrate the INI file into your workflow  
- how the new **Source Merge Printer** works  

---

# 3. Core Concept

> **Your project structure should be defined by configuration — not by hand.**

The `.INI` file is the **single source of truth**.

Every `DIR_*` entry becomes a real directory.  
Every scan is deterministic.  
Every export is reproducible.

---

# 4. System Architecture (v2.0)

```
AVIS_PRJ_SCAN_EXEC.BAT
│
├── CONFIG_ROOT.BAT        → Establish root paths and log locations
├── CREATE_STRUCT.BAT      → Ensure required directories exist
├── LOAD_CONFIG.BAT        → Read INI file and create DIR_* variables
├── TMP_CONFIG.BAT         → Generate .BAK configuration snapshot
├── LOG_CONFIG.BAT         → Write log headers and metadata
├── SCAN_DIR.BAT           → Recursively map all directories
├── SCAN_FILE.BAT          → Recursively map all files
├── AVIS_PRJ_SCAN_REC.BAT  → **NEW**: Merge all project source into a single TXT
└── SCAN_RESULTS.BAT       → Display summary and verify exports
```

### 🔥 **NEW IN VERSION 2.0**
- **Source Code Merge Printer**  
  Creates a single `.TXT` file containing **all source code** from your project.  
  Perfect for:
  - AI ingestion  
  - offline review  
  - backups  
  - code audits  

- **SCAN CREATE SOURCE**  
  A new mode that builds a clean source tree for AI tools.

---

# 5. The INI File (The Heart of the System)

Example:

```ini
DIR_AVIS_PRJ_SCAN=c:\htdocs\robo-knight\AI_AVIS_FVS\AVIS_PRJ_SCAN
DIR_INCLUDE=v:\htdocs\robo-knight\AI_AVIS_FVS\INCLUDE
DIR_OUTPUT=b:\htdocs\robo-knight\AI_AVIS_FVS\OUTPUT
DIR_SOURCE=g:\htdocs\robo-knight\AI_AVIS_FVS\SOURCE
DIR_LOG=o:\htdocs\robo-knight\AI_AVIS_FVS\AVIS_PRJ_SCAN\LOG
IM_CVBGOD=D:\htdocs\robo-knight\AI_AVIS_FVS\AVIS_PRJ_SCAN\LOG
```

Every entry becomes a real directory.  
Every directory is validated.  
Every path is logged.

---
<img 
    src="https://raw.githubusercontent.com/mercwar/Robo-Knight-Gallery/main/Version%201/Copilot_20260129_033032.png" 
    alt="Robo-Knight Canonical Shine" 
    style="max-width:100%; height:auto;"
/>
# 6. How CVBGOD Designed AI Integration

This is the part most people miss.

### How you use AI with AVIS:

1. Show the AI your `.INI` file.  
2. Tell the AI:  
   > “Update my project structure using this INI.”  
3. The AI edits or generates the `DIR_*` entries.  
4. You run the scanner.  
5. The scanner builds the entire structure exactly as the AI described.

### Why this matters

- No manual folder creation  
- No path mistakes  
- No drift between machines  
- AI can regenerate the entire project layout anytime  

### Why CVBGOD built it this way

> *“I wanted a simple file any AI can understand.  
> The AI writes the INI.  
> My scanner builds the universe.”*

---

# 7. User Interaction Layer

Startup menu:

```
[AVIS] SELECT MODE:
       1. CONTINUE WITH SCAN
       2. OPEN CONFIGURATION FILE
       3. RUN SOURCE MERGE PRINTER (NEW)
```

Option **3** runs the new v2.0 merge engine:

```
AVIS_PRJ_SCAN_REC.BAT → OUTPUT\SOURCE_MERGE.TXT
```

---

# 8. Logging

Logs are written to:

```
AVIS_PRJ_SCAN\LOG\ACK_AI_OP.LOG
```

Includes:

- timestamps  
- environment metadata  
- directory map  
- file map  
- source merge results  
- synchronization status  

---

# 9. Default Template Block

```ini
; DEFAULT_DIR_AVIS_PRJ_SCAN=c:\YourProject\AVIS_PRJ_SCAN
; DEFAULT_DIR_INCLUDE=v:\YourProject\INCLUDE
; DEFAULT_DIR_OUTPUT=b:\YourProject\OUTPUT
; DEFAULT_DIR_SOURCE=g:\YourProject\SOURCE
; DEFAULT_DIR_LOG=o:\YourProject\AVIS_PRJ_SCAN\LOG
; DEFAULT_DIR_AI=d:\YourProject\AVIS_PRJ_SCAN\AI
```

Use this to bootstrap new projects.

---
<img 
    src="https://raw.githubusercontent.com/mercwar/Robo-Knight-Gallery/main/Version%202/Copilot_20260129_033931.png" 
    alt="Robo-Knight Canonical Shine" 
    style="max-width:100%; height:auto;"
/>
# 10. Visual Overview

```
+---------------------------+
|      AVIS_PRJ_SCAN        |
+---------------------------+
           |
           +-- LOG\
           |    └-- ACK_AI_OP.LOG
           |
           +-- LOG\
           |    └-- AVIS_PRJ_SCAN.txt
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
                  └-- SOURCE_MERGE.TXT   ← NEW
```

---

# 11. Why This Project Exists

The scanner is both **practical** and **educational**.

It demonstrates:

- AI‑generated project structures  
- configuration‑driven automation  
- reproducible environments  
- deterministic directory creation  
- simple formats powering complex workflows  

---

# 12. Conclusion

The **AVIS Project Scanner v2.0** is a bridge between:

- human developers  
- AI assistants  
- reproducible project structures  
- full‑project source exports  

It is explicit, deterministic, and powerful.

> *“If you see a directory that doesn’t belong, check the INI first.”*  
— **CVBGOD**

---

# 🛡️ COPYRIGHT NOTICE

© 2026 CVBGOD / Mercwar / Robo‑Knight Universe  
All Rights Reserved.

Unauthorized copying, redistribution, or derivative works  
are prohibited without explicit permission.

---


