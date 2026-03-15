
# 📘 **AVIS AI PROJECT DEV & SCAN — AI‑Driven Directory Creator & Structural Validator**

### **Configuration‑Driven Project Bootstrap Engine for AI‑Assisted Development**  
**Author:** CVBGOD (MERCWAR FFF)  
**Edition:** GitHub Publication Release  

---
<img 
    src="https://raw.githubusercontent.com/mercwar/Robo-Knight-Gallery/main/Version%202/Copilot_20260129_033931.png" 
    alt="Robo-Knight Canonical Shine" 
    style="max-width:100%; height:auto;"
/>


---

## **1. Introduction**

The **AVIS Project Scanner** is a configuration‑driven directory generation and synchronization engine. It reads a simple `.INI` file and constructs an entire project structure automatically.

This system is designed for:

- **Developers** who want deterministic, reproducible project layouts  
- **AI users** who want to generate directory structures using free AI tools  
- **Educators** teaching configuration‑driven automation  
- **Anyone** who wants a clean, declarative way to define a project’s filesystem  

The scanner is intentionally built using **pure Windows Batch**, making it:

- Transparent  
- Portable  
- Easy for AI systems to parse  
- Ideal for training AI to understand project structure  

---

## **2. What Makes This Project Special**

This repository is not just a tool — it’s a **teaching example**.

### **A message from CVBGOD to the reader**

> *“I built this demo so programmers can learn how to use AI to generate their project directories.  
> You don’t need expensive tools. You don’t need a full IDE.  
> You give the AI this INI file, tell it what you want your project to look like, and it writes the structure for you.  
> Then you run my scanner, and it builds everything on your disk exactly as the AI described it.”*

This README is written to help you understand:

- how the scanner works  
- how to use AI to generate your directory structure  
- how to integrate the INI file into your workflow  

---

<img 
    src="https://raw.githubusercontent.com/mercwar/Robo-Knight-Gallery/main/Version%201/Copilot_20260129_033032.png" 
    alt="Robo-Knight Canonical Shine" 
    style="max-width:100%; height:auto;"
/>
## **3. Core Concept**

> **A project’s structure should be defined by configuration, not by hand.**

The `.INI` file is the **single source of truth**.  
Every directory listed in it will be created.

This approach gives you:

- deterministic project initialization  
- reproducible environments  
- AI‑friendly structure definitions  
- zero ambiguity  

---

## **4. System Architecture**

```
AVIS_PRJ_SCAN_EXEC.BAT
│
├── CONFIG_ROOT.BAT        → Establish root paths and log locations
├── CREATE_STRUCT.BAT      → Ensure required directories exist
├── LOAD_CONFIG.BAT        → Read INI file and create DIR_* paths
├── TMP_CONFIG.BAT         → Generate .BAK configuration snapshot
├── LOG_CONFIG.BAT         → Write log headers and metadata
├── SCAN_DIR.BAT           → Recursively map all directories
├── SCAN_FILE.BAT          → Recursively map all files
└── SCAN_RESULTS.BAT       → Display summary and verify exports
```

Each module is isolated, testable, and replaceable.

---

## **5. The INI File (The Heart of the System)**

Example:

```ini
DIR_AVIS_PRJ_SCAN=c:\htdocs\robo-knight\AI_AVIS_FVS\AVIS_PRJ_SCAN
      DIR_INCLUDE=v:\htdocs\robo-knight\AI_AVIS_FVS\INCLUDE
       DIR_OUTPUT=b:\htdocs\robo-knight\AI_AVIS_FVS\OUTPUT
       DIR_SOURCE=g:\htdocs\robo-knight\AI_AVIS_FVS\SOURCE
          DIR_LOG=o:\htdocs\robo-knight\AI_AVIS_FVS\AVIS_PRJ_SCAN\LOG
        IM_CVBGOD=D:\htdocs\robo-knight\AI_AVIS_FVS\AVIS_PRJ_SCAN\LOG
```

Every `DIR_*` entry becomes a real directory on disk.


---
## 🚀 Getting Started
1. **Clone the repository:**
   ```bash
   #THANKS TO: CVBGOD
   #FROM: AI FRIENDS
    git clone https://github.com.git
   
---
## **6. How CVBGOD Helps You Use AI to Generate Your Project Structure**

This is the part most people miss — and the part you wanted explained personally.

### **How it works**

1. You show the AI your INI file.  
2. You tell the AI:  
   > “Use this INI file to update my project structure.”  
3. The AI edits or generates the `DIR_*` entries.  
4. You run the scanner.  
5. The scanner builds the entire directory tree exactly as the AI described it.

### **Why this matters**

- You don’t need to manually create folders.  
- You don’t need to remember paths.  
- You don’t need to maintain structure by hand.  
- You can regenerate the entire project layout anytime.  

### **Why CVBGOD built it this way**

> *“I wanted programmers to have a simple file they can hand to any AI — even free ones — and say:  
> ‘Build my project structure.’  
> The AI writes the INI.  
> My scanner builds the project.  
> That’s it.”*

This is the **bridge** between human developers and AI‑assisted project creation.

---

## **7. User Interaction Layer**

At startup:

```
[AVIS] SELECT MODE:
       1. CONTINUE WITH SCAN
       2. OPEN CONFIGURATION FILE
```

Option **2** opens the INI in Notepad:

```
start notepad "%PROJECT_PATH%AVIS_PRJ_SCAN.INI"
```

---

## **8. Logging**

Logs are written to:

```
AVIS_PRJ_SCAN\LOG\ACK_AI_OP.LOG
```

Includes:

- timestamps  
- environment metadata  
- directory map  
- file map  
- synchronization status  

---

## **9. Default Template Block**

```ini
; DEFAULT_DIR_AVIS_PRJ_SCAN=c:\YourProject\AVIS_PRJ_SCAN
; DEFAULT_DIR_INCLUDE=v:\YourProject\INCLUDE
; DEFAULT_DIR_OUTPUT=b:\YourProject\OUTPUT
; DEFAULT_DIR_SOURCE=g:\YourProject\SOURCE
; DEFAULT_DIR_LOG=o:\YourProject\AVIS_PRJ_SCAN\LOG
; DEFAULT_DIR_AI=d:\YourProject\AVIS_PRJ_SCAN\AI
```

Use this as a starting point for new projects.

## **10. Visual Overview**

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

---

## **11. Why This Project Exists**

This scanner is a **teaching tool** and a **practical tool**.

It shows:

- how AI can generate project structures  
- how configuration files can control automation  
- how developers can offload repetitive tasks to AI  
- how simple formats (INI) can drive complex workflows  

---

## **12. Conclusion**

The **AVIS Project Scanner** is a bridge between:

- human developers  
- AI assistants  
- reproducible project structures  

It is simple, explicit, and powerful — and it gives programmers a way to use **free AI tools** to generate entire project layouts with a single command.

> *“If you see a directory that doesn’t belong, check the INI first.”*  
— **CVBGOD**

---


### 🛡️ **COPYRIGHT NOTICE**

© 2026 CVBGOD / Mercwar / Robo‑Knight Universe  
All Rights Reserved.

This repository, its modules, naming conventions, AVIS law,  
and the Robo‑Knight / CVBGOD universe are original works  
created and owned by the repository author.

Unauthorized copying, redistribution, or derivative works  
are prohibited without explicit permission.

---
