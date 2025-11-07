#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies unique, system-independent values that identify special folders.
 * @remarks
 * 
 * The values in this enumeration are equivalent to their corresponding <a href="https://docs.microsoft.com/windows/desktop/shell/csidl">CSIDL</a> or <a href="https://docs.microsoft.com/windows/desktop/shell/knownfolderid">KNOWNFOLDERID</a> values, used in C++ applications. They supersede the use of environment variables for this purpose. Note that not all <b>CSIDL</b> or <b>KNOWNFOLDERID</b> values have an equivalent value in <b>ShellSpecialFolderConstants</b>.
 * 
 * > [!NOTE]
 * > Where a constant identifies a file system folder, a commonly used path is given as an example. However, there is no guarantee that this path will be used on any particular system.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shldisp/ne-shldisp-shellspecialfolderconstants
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ShellSpecialFolderConstants{

    /**
     * 0x00 (0). Windows desktop—the virtual folder that is the root of the namespace.
     * @type {Integer (Int32)}
     */
    static ssfDESKTOP => 0

    /**
     * 0x02 (2). File system directory that contains the user's program groups (which are also file system directories). A typical path is C:\Users&#92;<i>username</i>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs.
     * @type {Integer (Int32)}
     */
    static ssfPROGRAMS => 2

    /**
     * 0x03 (3). Virtual folder that contains icons for the Control Panel applications.
     * @type {Integer (Int32)}
     */
    static ssfCONTROLS => 3

    /**
     * 0x04 (4). Virtual folder that contains installed printers.
     * @type {Integer (Int32)}
     */
    static ssfPRINTERS => 4

    /**
     * 0x05 (5). File system directory that serves as a common repository for a user's documents. A typical path is C:\Users&#92;<i>username</i>\Documents.
     * @type {Integer (Int32)}
     */
    static ssfPERSONAL => 5

    /**
     * 0x06 (6). File system directory that serves as a common repository for the user's favorite URLs. A typical path is C:\Documents and Settings&#92;<i>username</i>\Favorites.
     * @type {Integer (Int32)}
     */
    static ssfFAVORITES => 6

    /**
     * 0x07 (7). File system directory that corresponds to the user's Startup program group. The system starts these programs whenever any user first logs into their profile after a reboot. A typical path is C:\Users&#92;<i>username</i>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\StartUp.
     * @type {Integer (Int32)}
     */
    static ssfSTARTUP => 7

    /**
     * 0x08 (8). File system directory that contains the user's most recently used documents. A typical path is C:\Users&#92;<i>username</i>\AppData\Roaming\Microsoft\Windows\Recent.
     * @type {Integer (Int32)}
     */
    static ssfRECENT => 8

    /**
     * 0x09 (9). File system directory that contains <b>Send To</b> menu items. A typical path is C:\Users&#92;<i>username</i>\AppData\Roaming\Microsoft\Windows\SendTo.
     * @type {Integer (Int32)}
     */
    static ssfSENDTO => 9

    /**
     * 0x0a (10). Virtual folder that contains the objects in the user's Recycle Bin.
     * @type {Integer (Int32)}
     */
    static ssfBITBUCKET => 10

    /**
     * 0x0b (11). File system directory that contains <b>Start</b> menu items. A typical path is C:\Users&#92;<i>username</i>\AppData\Roaming\Microsoft\Windows\Start Menu.
     * @type {Integer (Int32)}
     */
    static ssfSTARTMENU => 11

    /**
     * 0x10 (16). File system directory used to physically store the file objects that are displayed on the desktop. It is not to be confused with the desktop folder itself, which is a virtual folder. A typical path is C:\Documents and Settings&#92;<i>username</i>\Desktop.
     * @type {Integer (Int32)}
     */
    static ssfDESKTOPDIRECTORY => 16

    /**
     * 0x11 (17). My Computer—the virtual folder that contains everything on the local computer: storage devices, printers, and Control Panel. This folder can also contain mapped network drives.
     * @type {Integer (Int32)}
     */
    static ssfDRIVES => 17

    /**
     * 0x12 (18). Network Neighborhood—the virtual folder that represents the root of the network namespace hierarchy.
     * @type {Integer (Int32)}
     */
    static ssfNETWORK => 18

    /**
     * 0x13 (19). A file system folder that contains any link objects in the <b>My Network Places</b> virtual folder. It is not the same as ssfNETWORK, which represents the network namespace root. A typical path is C:\Users&#92;<i>username</i>\AppData\Roaming\Microsoft\Windows\Network Shortcuts.
     * @type {Integer (Int32)}
     */
    static ssfNETHOOD => 19

    /**
     * 0x14 (20). Virtual folder that contains installed fonts. A typical path is C:\Windows\Fonts.
     * @type {Integer (Int32)}
     */
    static ssfFONTS => 20

    /**
     * 0x15 (21). File system directory that serves as a common repository for document templates.
     * @type {Integer (Int32)}
     */
    static ssfTEMPLATES => 21

    /**
     * 0x16 (22). File system directory that contains the programs and folders that appear on the <b>Start</b> menu for all users. A typical path is C:\Documents and Settings\All Users\Start Menu. Valid only for Windows NT systems.
     * @type {Integer (Int32)}
     */
    static ssfCOMMONSTARTMENU => 22

    /**
     * 0x17 (23). File system directory that contains the directories for the common program groups that appear on the <b>Start</b> menu for all users. A typical path is C:\Documents and Settings\All Users\Start Menu\Programs. Valid only for Windows NT systems.
     * @type {Integer (Int32)}
     */
    static ssfCOMMONPROGRAMS => 23

    /**
     * 0x18 (24). File system directory that contains the programs that appear in the Startup folder for all users. A typical path is C:\Documents and Settings\All Users\Microsoft\Windows\Start Menu\Programs\StartUp. Valid only for Windows NT systems.
     * @type {Integer (Int32)}
     */
    static ssfCOMMONSTARTUP => 24

    /**
     * 0x19 (25). File system directory that contains files and folders that appear on the desktop for all users. A typical path is C:\Documents and Settings\All Users\Desktop. Valid only for Windows NT systems.
     * @type {Integer (Int32)}
     */
    static ssfCOMMONDESKTOPDIR => 25

    /**
     * 0x1a (26). <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776779(v=vs.85)">Version 4.71</a>. File system directory that serves as a common repository for application-specific data. A typical path is C:\Documents and Settings&#92;<i>username</i>\Application Data.
     * @type {Integer (Int32)}
     */
    static ssfAPPDATA => 26

    /**
     * 0x1b (27). File system directory that contains any link objects in the Printers virtual folder. A typical path is C:\Users&#92;<i>username</i>\AppData\Roaming\Microsoft\Windows\Printer Shortcuts.
     * @type {Integer (Int32)}
     */
    static ssfPRINTHOOD => 27

    /**
     * 0x1c (28). <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776779(v=vs.85)">Version 5.0</a>. File system directory that serves as a data repository for local (non-roaming) applications. A typical path is C:\Users&#92;<i>username</i>\AppData\Local.
     * @type {Integer (Int32)}
     */
    static ssfLOCALAPPDATA => 28

    /**
     * 0x1d (29). File system directory that corresponds to the user's non-localized Startup program group.
     * @type {Integer (Int32)}
     */
    static ssfALTSTARTUP => 29

    /**
     * 0x1e (30). File system directory that corresponds to the non-localized Startup program group for all users. Valid only for Windows NT systems.
     * @type {Integer (Int32)}
     */
    static ssfCOMMONALTSTARTUP => 30

    /**
     * 0x1f (31). File system directory that serves as a common repository for the favorite URLs shared by all users. Valid only for Windows NT systems.
     * @type {Integer (Int32)}
     */
    static ssfCOMMONFAVORITES => 31

    /**
     * 0x20 (32). File system directory that serves as a common repository for temporary Internet files. A typical path is C:\Users&#92;<i>username</i>\AppData\Local\Microsoft\Windows\Temporary Internet Files.
     * @type {Integer (Int32)}
     */
    static ssfINTERNETCACHE => 32

    /**
     * 0x21 (33). File system directory that serves as a common repository for Internet cookies. A typical path is C:\Documents and Settings&#92;<i>username</i>\Application Data\Microsoft\Windows\Cookies.
     * @type {Integer (Int32)}
     */
    static ssfCOOKIES => 33

    /**
     * 0x22 (34). File system directory that serves as a common repository for Internet history items.
     * @type {Integer (Int32)}
     */
    static ssfHISTORY => 34

    /**
     * 0x23 (35). <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776779(v=vs.85)">Version 5.0</a>. Application data for all users. A typical path is C:\Documents and Settings\All Users\Application Data.
     * @type {Integer (Int32)}
     */
    static ssfCOMMONAPPDATA => 35

    /**
     * 0x24 (36). <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776779(v=vs.85)">Version 5.0</a>. Windows directory. This corresponds to the %windir% or %SystemRoot% environment variables. A typical path is C:\Windows.
     * @type {Integer (Int32)}
     */
    static ssfWINDOWS => 36

    /**
     * 0x25 (37). <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776779(v=vs.85)">Version 5.0</a>. The System folder. A typical path is C:\Windows\System32.
     * @type {Integer (Int32)}
     */
    static ssfSYSTEM => 37

    /**
     * 0x26 (38). <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776779(v=vs.85)">Version 5.0</a>. Program Files folder. A typical path is C:\Program Files.
     * @type {Integer (Int32)}
     */
    static ssfPROGRAMFILES => 38

    /**
     * 0x27 (39). My Pictures folder. A typical path is C:\Users&#92;<i>username</i>\Pictures.
     * @type {Integer (Int32)}
     */
    static ssfMYPICTURES => 39

    /**
     * 0x28 (40). <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776779(v=vs.85)">Version 5.0</a>. User's profile folder.
     * @type {Integer (Int32)}
     */
    static ssfPROFILE => 40

    /**
     * 0x29 (41). <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776779(v=vs.85)">Version 5.0</a>. System folder. A typical path is C:\Windows\System32, or C:\Windows\Syswow32 on a 64-bit computer.
     * @type {Integer (Int32)}
     */
    static ssfSYSTEMx86 => 41

    /**
     * Do not use this field. Use the value 0x2a (42) in your code instead to specify the Program Files (x86) folder. A typical path is C:\Program Files, or C:\Program Files (x86) on a 64-bit computer. 
     * 
     * **Note:**  In the shldisp.h header, the **ssfPROGRAMFILESx86** field is erroneously assigned to the value 0x30 (48). This value specifies the folder for the Administrative Tools folder instead of the Program Files folder.
     * @type {Integer (Int32)}
     */
    static ssfPROGRAMFILESx86 => 48
}
