#Requires AutoHotkey v2.0.0 64-bit

/**
 * These flags are used with the SHRestricted function.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ne-shlobj_core-restrictions
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class RESTRICTIONS{

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static REST_NONE => 0

    /**
     * If nonzero, the system administrator has forbidden access to the <b>Run</b> command on the <b>Start</b> menu. Applications should remove similar functionality.  For example, a browser with an address bar should deny attempts by the user to type the path of a local file into the address bar.
     * @type {Integer (Int32)}
     */
    static REST_NORUN => 1

    /**
     * If nonzero, the system administrator has forbidden access to the <b>Shut Down</b> command on the <b>Start</b> menu. Applications should remove the ability to shut down or restart the computer.
     * @type {Integer (Int32)}
     */
    static REST_NOCLOSE => 2

    /**
     * If nonzero, the system administrator has requested that applications do not save their state at exit for restoration the next time they are run. Applications should disable saving their window position and settings.
     * @type {Integer (Int32)}
     */
    static REST_NOSAVESET => 4

    /**
     * If nonzero, the system administrator has forbidden access to the Windows Explorer <b>File</b> menu. Applications should remove similar functionality.
     * @type {Integer (Int32)}
     */
    static REST_NOFILEMENU => 8

    /**
     * If nonzero, the system administrator has forbidden access to <b>Control Panel</b>, <b>Printers</b>, and <b>Network and Dial up Connections</b>. Applications should prevent users from viewing those folders.
     * @type {Integer (Int32)}
     */
    static REST_NOSETFOLDERS => 16

    /**
     * If nonzero,  the system administrator has forbidden access to taskbar settings. Applications should prevent users from changing those settings.
     * @type {Integer (Int32)}
     */
    static REST_NOSETTASKBAR => 32

    /**
     * If nonzero,  the system administrator has specified that all icons on the desktop should be hidden. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NODESKTOP => 64

    /**
     * If nonzero, the system administrator has indicated that the user should not be enabled to search for files. Applications should remove similar functionality.
     * @type {Integer (Int32)}
     */
    static REST_NOFIND => 128

    /**
     * A 32-bit value that specifies the drives that should not be displayed to the user.  Bit 0 corresponds to drive A, up to bit 25 which corresponds to drive Z. Applications that display a list of drives should remove drives that have their corresponding bits set.
     * @type {Integer (Int32)}
     */
    static REST_NODRIVES => 256

    /**
     * A 32-bit value that specifies the drives for which AutoRun should be disabled.  Bit 0 corresponds to drive A, up to bit 25 which corresponds to drive Z. Applications should not offer to AutoRun any drive that has its corresponding bit set.
     * @type {Integer (Int32)}
     */
    static REST_NODRIVEAUTORUN => 512

    /**
     * A 32-bit value that specifies the drive types for which AutoRun should be disabled.  The bits are numbered according to the return value of <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getdrivetypea">GetDriveType</a>.  For example, bit <b>DRIVE_CDROM</b> disables AutoRun on CD-ROM drives. Applications should not offer to AutoRun any drive whose type has its corresponding bit set.
     * @type {Integer (Int32)}
     */
    static REST_NODRIVETYPEAUTORUN => 1024

    /**
     * If nonzero, the system administrator has removed <b>Network Neighborhood</b> (also known as <b>My Network Places</b>) from the Shell namespace. Applications should disable functionality that enables the user to browse the network.
     * @type {Integer (Int32)}
     */
    static REST_NONETHOOD => 2048

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static REST_STARTBANNER => 4096

    /**
     * If nonzero, the system administrator has restricted the programs the user can run.  Only programs listed under the registry key <b>HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer</b> can be run either from the <b>Run</b> dialog box, by double-clicking, or by selecting from the <b>File</b> menu. Applications should prevent users from running programs not listed under that key. Applications that use the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecutea">ShellExecute</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecuteexa">ShellExecuteEx</a> functions to run programs do not need to take any special action because those functions check the policy.
     * @type {Integer (Int32)}
     */
    static REST_RESTRICTRUN => 8192

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOPRINTERTABS => 16384

    /**
     * If nonzero, the system administrator has disabled the user's ability to delete printers. Applications should remove the ability to delete printers.
     * @type {Integer (Int32)}
     */
    static REST_NOPRINTERDELETE => 32768

    /**
     * If nonzero, the system administrator has disabled the user's ability to add printers. Applications should remove the ability to add printers.
     * @type {Integer (Int32)}
     */
    static REST_NOPRINTERADD => 65536

    /**
     * If nonzero, subfolders of the <b>Start</b> menu and <b>Programs</b> menu are not shown on the top of the classic <b>Start</b> menu, the <b>Programs</b> list on the classic <b>Start</b> menu, or the <b>All Programs</b> list on the <b>Start</b> menu. Applications that enumerate the contents of the <b>Start</b> menu should avoid subfolders.  If nonzero, this flag does not restrict any menus other than those listed here; in particular, <b>My Computer</b> can still expand.
     * @type {Integer (Int32)}
     */
    static REST_NOSTARTMENUSUBFOLDERS => 131072

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static REST_MYDOCSONNET => 262144

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOEXITTODOS => 524288

    /**
     * If nonzero, the system administrator has forbidden the use of unapproved Shell extensions. Applications should not instantiate Shell extensions unless they are marked as approved by the system administrator.  For more information, see <a href="https://docs.microsoft.com/windows/desktop/shell/handlers">Creating Shell Extension Handlers</a>.
     * @type {Integer (Int32)}
     */
    static REST_ENFORCESHELLEXTSECURITY => 1048576

    /**
     * If nonzero, the system does not attempt to reconnect mapped network drives when resolving a broken shortcut to a file or folder on a mapped network drive. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_LINKRESOLVEIGNORELINKINFO => 2097152

    /**
     * If nonzero, indicates the system administrator has forbidden access to the <b>CSIDL_COMMON_STARTMENU</b> or <b>CSIDL_COMMON_PROGRAMS</b> folders on the <b>Start</b> menu. Applications that enumerate the contents of the <b>Start</b> menu should avoid those folders.
     * @type {Integer (Int32)}
     */
    static REST_NOCOMMONGROUPS => 4194304

    /**
     * If nonzero, the administrator has required that folders be opened in a separate process.  This overrides and disables the corresponding setting in the <b>Folder Options</b> dialog box. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_SEPARATEDESKTOPPROCESS => 8388608

    /**
     * If nonzero, the system administrator has removed the <b>Web</b> tab from the desktop <b>Properties</b> dialog box. Applications do not need to perform any special actions. <b>Windows XP and later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOWEB => 16777216

    /**
     * If nonzero, the system administrator has forbidden access to context menus for the taskbar. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOTRAYCONTEXTMENU => 33554432

    /**
     * If nonzero, the system administrator has forbidden access to context menus for Shell objects. Applications should disable context menus for Shell objects.
     * @type {Integer (Int32)}
     */
    static REST_NOVIEWCONTEXTMENU => 67108864

    /**
     * If nonzero, the system administrator has denied users the ability to map or disconnect network drives. Applications should remove the ability to map or disconnect network drives.
     * @type {Integer (Int32)}
     */
    static REST_NONETCONNECTDISCONNECT => 134217728

    /**
     * If 1, the system administrator has removed the <b>Log Off</b> option from the <b>Start</b> menu.  If 2, the system administrator has forced the <b>Log Off</b> option to be shown. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_STARTMENULOGOFF => 268435456

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOSETTINGSASSIST => 536870912

    /**
     * If nonzero, the system administrator has removed the Internet Explorer icon from the desktop. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOINTERNETICON => 1073741825

    /**
     * If nonzero, the system administrator has disabled recent document history. Applications must disable all MRU lists, such as those that are often displayed on the <b>File</b> menu. Adherence to this setting is mandatory for Windows logo compliance.
     * @type {Integer (Int32)}
     */
    static REST_NORECENTDOCSHISTORY => 1073741826

    /**
     * If nonzero, the system administrator has removed the <b>Recent Documents</b> menu from the <b>Start</b> menu. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NORECENTDOCSMENU => 1073741827

    /**
     * If nonzero, the system administrator has disabled the ability to create web content on the desktop. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOACTIVEDESKTOP => 1073741828

    /**
     * If nonzero, the system administrator has disabled the ability to change web content on the desktop. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOACTIVEDESKTOPCHANGES => 1073741829

    /**
     * If nonzero, the system administrator has removed the <b>Favorites</b> menu from the <b>Start</b> menu. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOFAVORITESMENU => 1073741830

    /**
     * If nonzero, the system administrator has required that recent document history and related history information be deleted when the user logs off. Applications should erase recent document history when they exit.
     * @type {Integer (Int32)}
     */
    static REST_CLEARRECENTDOCSONEXIT => 1073741831

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static REST_CLASSICSHELL => 1073741832

    /**
     * If nonzero, the system administrator has disabled the ability to customize the appearance of Windows Explorer folders. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOCUSTOMIZEWEBVIEW => 1073741833

    /**
     * If nonzero, the system administrator has disabled the ability to set the wallpaper to any image that is not a bitmap (*.bmp) image. Applications that enable the user to change desktop wallpaper should disable web content. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOHTMLWALLPAPER => 1073741840

    /**
     * If nonzero, the system administrator has disabled the ability to change the desktop wallpaper. Applications should disable corresponding functionality.
     * @type {Integer (Int32)}
     */
    static REST_NOCHANGINGWALLPAPER => 1073741841

    /**
     * If nonzero, the system administrator has disabled desktop components. Applications that create or modify desktop components should disable this functionality. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NODESKCOMP => 1073741842

    /**
     * If nonzero, the system administrator has disabled the ability to create desktop components. Applications that create desktop components should disable this functionality.
     * @type {Integer (Int32)}
     */
    static REST_NOADDDESKCOMP => 1073741843

    /**
     * If nonzero, the system administrator has disabled the ability to delete desktop components. Applications that delete desktop components should disable this functionality. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NODELDESKCOMP => 1073741844

    /**
     * If nonzero, the system administrator has disabled the ability to close desktop components. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOCLOSEDESKCOMP => 1073741845

    /**
     * If nonzero, the system administrator has disabled the ability to drag, drop, or close desktop bands. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOCLOSE_DRAGDROPBAND => 1073741846

    /**
     * If nonzero, the system administrator has disabled the ability to move a desktop band. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOMOVINGBAND => 1073741847

    /**
     * If nonzero, indicates the system administrator has disabled the ability to modify desktop components. Applications that modify desktop components should disable this functionality. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOEDITDESKCOMP => 1073741848

    /**
     * If nonzero, the system administrator has disabled heuristic file searching when resolving broken shortcuts. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NORESOLVESEARCH => 1073741849

    /**
     * If nonzero, the system administrator has disabled the use of the link tracking service when resolving broken shortcuts. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NORESOLVETRACK => 1073741850

    /**
     * If nonzero, the system administrator has forced Shell file copy operations to copy the ACL with the file rather than inheriting the ACL from the target folder. Applications that use the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shfileoperationa">SHFileOperation</a> function do not need to perform any special actions. Applications that copy files manually should ensure that the source ACL is copied.
     * @type {Integer (Int32)}
     */
    static REST_FORCECOPYACLWITHFILE => 1073741851

    /**
     * If nonzero, the system administrator has disabled the ability to uncheck the <b>Remind me until I update the current version</b> checkbox in the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/nf-shlobj-softwareupdatemessagebox">SoftwareUpdateMessageBox</a> function. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOFORGETSOFTWAREUPDATE => 1073741853

    /**
     * If nonzero, the system administrator has disabled the ability to change settings for web content on the desktop. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOSETACTIVEDESKTOP => 1073741854

    /**
     * If nonzero, the system administrator has hidden the <b>Windows Update</b> shortcut on the <b>Start</b> menu. Applications that enumerate the contents of the <b>Start</b> menu should not show the <b>Windows Update</b> shortcut to the user.
     * @type {Integer (Int32)}
     */
    static REST_NOUPDATEWINDOWS => 1073741855

    /**
     * If nonzero, the system administrator has disabled the ability to make changes to the <b>Start</b> menu. Applications should disable any feature that enables the user to reorganize their <b>Start</b> menu.
     * @type {Integer (Int32)}
     */
    static REST_NOCHANGESTARMENU => 1073741856

    /**
     * If nonzero, the system administrator has denied access to the <b>Folder Options</b> dialog box. Applications that display <b>Folder Options</b> in <b>Control Panel</b> should disable this functionality.
     * @type {Integer (Int32)}
     */
    static REST_NOFOLDEROPTIONS => 1073741857

    /**
     * If nonzero, the system administrator has disabled the ability to search for computers on the network. Applications should remove the ability to search for computers on the network.
     * @type {Integer (Int32)}
     */
    static REST_HASFINDCOMPUTERS => 1073741858

    /**
     * If nonzero, the system administrator has disabled personalized menus. Applications should not hide infrequently-used menu commands.
     * @type {Integer (Int32)}
     */
    static REST_INTELLIMENUS => 1073741859

    /**
     * If nonzero, the system administrator has disabled the <b>Run in separate memory space</b> option in the <b>Run</b> dialog. Applications that provide similar functionality should remove the corresponding checkbox.
     * @type {Integer (Int32)}
     */
    static REST_RUNDLGMEMCHECKBOX => 1073741860

    /**
     * If nonzero, the system administrator has removed the list of incomplete setup operations from the "Add/Remove Windows Components" section of the <b>Add/Remove Programs</b> dialog box. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_ARP_ShowPostSetup => 1073741861

    /**
     * If nonzero, the system administrator has removed <b>Synchronize All</b> from the <b>Start</b> menu. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOCSC => 1073741862

    /**
     * If nonzero, the system administrator has denied access to <b>Control Panel</b>. Applications should disable any functionality that runs <c>Control Panel</c>.
     * @type {Integer (Int32)}
     */
    static REST_NOCONTROLPANEL => 1073741863

    /**
     * If nonzero, the system administrator has indicated that the <b>Network Neighborhood</b> should include the computer workgroup. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_ENUMWORKGROUP => 1073741864

    /**
     * If nonzero, the system administrator has denied access to the <b>Add/Remove Programs</b> dialog box. Applications should disable any functionality that runs the <b>Add/Remove Programs</b> dialog box. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_ARP_NOARP => 1073741865

    /**
     * If nonzero, the system administrator has denied access to the <b>Change or Remove Programs</b> section of the <b>Add/Remove Programs</b> dialog box. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_ARP_NOREMOVEPAGE => 1073741866

    /**
     * If nonzero, the system administrator has denied access to the <b>Add Programs</b> section of the <b>Add/Remove Programs</b> dialog box. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_ARP_NOADDPAGE => 1073741867

    /**
     * If nonzero, the system administrator has denied access to the <b>Add/Remove Windows Components</b> section of the <b>Add/Remove Programs</b> dialog box. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_ARP_NOWINSETUPPAGE => 1073741868

    /**
     * If nonzero, the system administrator has specified that Windows Installer shortcuts that refer to applications that are available but not yet installed should be displayed on the <b>Start</b> menu in gray. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_GREYMSIADS => 1073741869

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOCHANGEMAPPEDDRIVELABEL => 1073741870

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOCHANGEMAPPEDDRIVECOMMENT => 1073741871

    /**
     * A 32-bit value that specifies the maximum number of documents to be retained in the <b>Recent Documents</b> menu.  If this value is zero, then the system administrator has not specified any maximum, and applications can choose a default. If this value is nonzero, applications should restrict their <b>Recent Documents</b> list to the specified number of items.
     * @type {Integer (Int32)}
     */
    static REST_MaxRecentDocs => 1073741872

    /**
     * If nonzero, the system administrator has removed the <b>Network Connections</b> menu from the <b>Start</b> menu. Applications should hide lists of network and dial-up connections.
     * @type {Integer (Int32)}
     */
    static REST_NONETWORKCONNECTIONS => 1073741873

    /**
     * If nonzero, the system administrator has forced the <b>Log Off</b> command onto the <b>Start</b> menu. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_FORCESTARTMENULOGOFF => 1073741874

    /**
     * If nonzero, the system administrator has disabled folder HTML templates (Windows 2000) or folder tasks (Windows XP) in Windows Explorer. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOWEBVIEW => 1073741875

    /**
     * If nonzero, the system administrator has disabled the ability to customize the appearance of Windows Explorer folders. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOCUSTOMIZETHISFOLDER => 1073741876

    /**
     * If nonzero, the system administrator has disabled the ability to encrypt and decrypt files and folders. Applications should not call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-encryptfilea">EncryptFile</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-decryptfilea">DecryptFile</a>.
     * @type {Integer (Int32)}
     */
    static REST_NOENCRYPTION => 1073741877

    /**
     * If nonzero, the system administrator has disabled the ability to view files marked System and Hidden ("super-hidden files"), overriding the <b>fShowSuperHidden</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-shellstatea">SHELLSTATE</a> structure. Applications should not show files that have both the FILE_ATTRIBUTE_SYSTEM and FILE_ATTRIBUTE_HIDDEN attributes to the user.
     * @type {Integer (Int32)}
     */
    static REST_DONTSHOWSUPERHIDDEN => 1073741879

    /**
     * If nonzero, the system administrator has disabled the <b>Search</b> button in the Windows Explorer toolbar. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOSHELLSEARCHBUTTON => 1073741880

    /**
     * If nonzero, the system administrator has disabled the <b>Hardware</b> tab in the <b>Drive</b>, <b>Mouse</b>, <b>Keyboard</b>, and <b>Multimedia</b> property sheets. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOHARDWARETAB => 1073741881

    /**
     * If nonzero, the system administrator has disabled the automatic prompt for automatic credentials when installing an application. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NORUNASINSTALLPROMPT => 1073741882

    /**
     * If nonzero, the system administrator has disabled the automatic prompt for automatic credentials when installing an application from a network path. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_PROMPTRUNASINSTALLNETPATH => 1073741883

    /**
     * If nonzero, the system administrator has removed the <b>Manage</b> command from the <b>My Computer</b> context menu. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOMANAGEMYCOMPUTERVERB => 1073741884

    /**
     * If nonzero, the system administrator has restricted the programs the user can run.  Programs listed under the registry key 
     *                             
     *                                <b>HKEY_CURRENT_USER</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Windows</b>&#92;<b>CurrentVersion</b>&#92;<b>Policies</b>&#92;<b>Explorer</b>&#92;<b>DisallowRun</b>may not be run from the <b>Run</b> dialog box, by double-clicking, or by selecting from the <b>File</b> menu.  Programs are listed by their full path (for example, "C:\Windows\system32\cmd.exe"). Applications should prevent users from running programs listed under that key. Applications that use the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecutea">ShellExecute</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecuteexa">ShellExecuteEx</a> function to run programs do not need to take any special action because those functions will check the policy.
     * @type {Integer (Int32)}
     */
    static REST_DISALLOWRUN => 1073741886

    /**
     * If nonzero, the system administrator has disabled the <b>Welcome to Windows</b> program that is run when a user logs on. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOWELCOMESCREEN => 1073741887

    /**
     * If nonzero, the system administrator has restricted the control panel applications the user can run.  In order to be run, a control panel application must be listed under the registry key 
     *                                <b>HKEY_CURRENT_USER</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Windows</b>&#92;<b>CurrentVersion</b>&#92;<b>Policies</b>&#92;<b>Explorer</b>&#92;<b>RestrictCpl</b>. The control panel application can be listed either under its display name (for example, "Mouse") or under its filename (for example, "main.cpl"). Applications that launch control panel applications should prevent users from running control panel applications not listed under that key.
     * @type {Integer (Int32)}
     */
    static REST_RESTRICTCPL => 1073741888

    /**
     * If nonzero, the system administrator has restricted the control panel applications the user can run.  In order to be run, a control panel application must not be listed under the registry key 
     *                                <b>HKEY_CURRENT_USER</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Windows</b>&#92;<b>CurrentVersion</b>&#92;<b>Policies</b>&#92;<b>Explorer</b>&#92;<b>DisallowCpl</b>. The control panel application can be listed either under its display name (for example, "Mouse") or under its filename (for example, "main.cpl"). Applications that launch control panel applications should prevent users from running control panel applications listed under that key.
     * @type {Integer (Int32)}
     */
    static REST_DISALLOWCPL => 1073741889

    /**
     * If nonzero, the system administrator has disabled balloon tips that are displayed by the <b>Start</b> menu. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOSMBALLOONTIP => 1073741890

    /**
     * If nonzero, the system administrator has removed the <b>Help</b> option from the <b>Start</b> menu. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOSMHELP => 1073741891

    /**
     * If nonzero, the system administrator has disabled the keyboard shortcut associated with the Windows logo key. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOWINKEYS => 1073741892

    /**
     * If nonzero, the system administrator has specified that unencrypted files and folders moved into an encrypted folder should remain unencrypted instead of inheriting the encryption attribute from the enclosing folder. Applications that move files and folders should unencrypt them if they were originally unencrypted and are moved into an encrypted folder. Applications that use the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shfileoperationa">SHFileOperation</a> function to move files do not need to perform any special actions because the <b>SHFileOperation</b> function respects this policy.
     * @type {Integer (Int32)}
     */
    static REST_NOENCRYPTONMOVE => 1073741893

    /**
     * If nonzero, the system administrator has disabled the execution of programs listed in the 
     *                    <b>HKEY_LOCAL_MACHINE</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Windows</b>&#92;<b>CurrentVersion</b>&#92;<b>Run</b>registry key. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOLOCALMACHINERUN => 1073741894

    /**
     * If nonzero, the system administrator has disabled the execution of programs listed in the 
     *                    <b>HKEY_CURRENT_USER</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Windows</b>&#92;<b>CurrentVersion</b>&#92;<b>Run</b>registry key. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOCURRENTUSERRUN => 1073741895

    /**
     * If nonzero, the system administrator has disabled the execution of programs listed in the 
     *                    <b>HKEY_LOCAL_MACHINE</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Windows</b>&#92;<b>CurrentVersion</b>&#92;<b>RunOnce</b>registry key. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOLOCALMACHINERUNONCE => 1073741896

    /**
     * If nonzero, the system administrator has disabled the execution of programs listed in the 
     *                    <b>HKEY_CURRENT_USER</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Windows</b>&#92;<b>CurrentVersion</b>&#92;<b>RunOnce</b>registry key. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOCURRENTUSERRUNONCE => 1073741897

    /**
     * If nonzero, the system administrator has forced web content to be enabled on the desktop. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_FORCEACTIVEDESKTOPON => 1073741898

    /**
     * A 32-bit value that specifies the drives the user cannot open or drop files into. Bit 0 corresponds to drive A, up to bit 25 which corresponds to drive Z. Applications that enable the user to open folders or drop files should prevent the user from opening a folder on a restricted drive or dropping files onto a restricted drive.
     * @type {Integer (Int32)}
     */
    static REST_NOVIEWONDRIVE => 1073741900

    /**
     * Windows XP, Windows<b>2003, or IE_BACKCOMPAT_VERSION defined.</b> If nonzero, the system administrator has disabled automatic searching for network folders and printers, overriding the <i>fNoNetCrawling</i> member of the <b>SHELLSTATE</b> structure. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NONETCRAWL => 1073741901

    /**
     * Windows XP, Windows<b>2003 or IE_BACKCOMPAT_VERSION defined.</b> If nonzero, the system administrator has hidden the <b>Shared Documents</b> icon in <b>My Computer</b>. Applications should hide access to CSIDL_COMMON_DOCUMENTS. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOSHAREDDOCUMENTS => 1073741902

    /**
     * If nonzero, the system administrator has hidden the <b>My Documents</b> icon on the <b>Start</b> menu. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOSMMYDOCS => 1073741903

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has hidden the <b>My Pictures</b> icon on the <b>Start</b> menu. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOSMMYPICS => 1073741904

    /**
     * <b>Windows XP or later.</b> A 32-bit value that specifies the drives for which the <b>Recycle Bin</b> should be forced to be enabled.  The system typically disables the <b>Recycle Bin</b> on drives that are not local fixed drives.  Bit 0 corresponds to drive A, up to bit 25 which corresponds to drive Z. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_ALLOWBITBUCKDRIVES => 1073741905

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has hidden the <b>Back</b> and <b>Forward</b> buttons in the Internet Explorer toolbar. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NONLEGACYSHELLMODE => 1073741906

    /**
     * <b>Windows XP or later.</b> Ignored.
     * @type {Integer (Int32)}
     */
    static REST_NOCONTROLPANELBARRICADE => 1073741907

    /**
     * <b>Windows XP or later.</b> Ignored.
     * @type {Integer (Int32)}
     */
    static REST_NOSTARTPAGE => 1073741908

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has forced all taskbar icons to be visible, even if they are inactive, overriding the user's decision to hide inactive taskbar icons. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOAUTOTRAYNOTIFY => 1073741909

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled grouping of similar taskbar buttons, overriding the user's decision to enable taskbar button grouping. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOTASKGROUPING => 1073741910

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled CD burning. Applications should disable any CD-burning capabilities.
     * @type {Integer (Int32)}
     */
    static REST_NOCDBURNING => 1073741911

    /**
     * <b>
     *               Windows 2000 SP3 or later.</b> If nonzero, the system administrator has disabled the <b>System Properties</b> dialog box. Applications should not launch the <b>System Properties</b> dialog box.
     * @type {Integer (Int32)}
     */
    static REST_MYCOMPNOPROP => 1073741912

    /**
     * <b>
     *               Windows 2000 SP3 or later.</b> If nonzero, the system administrator has disabled the ability to view properties of the <b>My Documents</b> folder. Applications should not redirect the <b>My Documents</b> folder.
     * @type {Integer (Int32)}
     */
    static REST_MYDOCSNOPROP => 1073741913

    /**
     * <b>
     *               Windows XP or later.</b> If nonzero, the system administrator has disabled the Windows XP <b>Start</b> menu. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOSTARTPANEL => 1073741914

    /**
     * <b>Windows XP or later.</b> If 1, the system administrator has disabled the <b>Themes</b> and <b>Appearance</b> pages from the <b>Desktop Properties</b> dialog box. Applications should not change system colors and appearance.
     * @type {Integer (Int32)}
     */
    static REST_NODISPLAYAPPEARANCEPAGE => 1073741915

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled the <b>Themes</b> page from the <b>Desktop Properties</b> dialog. Applications should not change visual styles.
     * @type {Integer (Int32)}
     */
    static REST_NOTHEMESTAB => 1073741916

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled the ability to change visual styles. Applications should not change visual styles.
     * @type {Integer (Int32)}
     */
    static REST_NOVISUALSTYLECHOICE => 1073741917

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled the ability to change font sizes from the <b>Appearance</b> page on the Desktop Properties dialog box. Applications should not change system metrics.
     * @type {Integer (Int32)}
     */
    static REST_NOSIZECHOICE => 1073741918

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled the ability to change system colors from the <b>Appearance</b> page on the <b>Desktop Properties</b> dialog box. Applications should not change system colors.
     * @type {Integer (Int32)}
     */
    static REST_NOCOLORCHOICE => 1073741919

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has forced a specific visual style. Applications should not change visual styles.
     * @type {Integer (Int32)}
     */
    static REST_SETVISUALSTYLE => 1073741920

    /**
     * <b>
     *               Windows 2000 SP3 or later.</b> If nonzero, the default working directory for programs run from the Run dialog is not forced to the user's home directory. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_STARTRUNNOHOMEPATH => 1073741921

    /**
     * Windows XP, Windows <b>2003.</b> If nonzero, the system administrator has hidden the user name on the Windows XP <b>Start</b> menu. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOUSERNAMEINSTARTPANEL => 1073741922

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has hidden the <b>My Computer</b> icon. Applications should not permit access to the <b>My Computer</b> icon.
     * @type {Integer (Int32)}
     */
    static REST_NOMYCOMPUTERICON => 1073741923

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has hidden the <b>Network Places</b> icon on the <b>Start</b> menu. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOSMNETWORKPLACES => 1073741924

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has hidden the list of "pinned" items on the <b>Start</b> menu. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOSMPINNEDLIST => 1073741925

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has hidden the <b>My Music</b> icon on the <b>Start</b> menu. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOSMMYMUSIC => 1073741926

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has hidden the <b>Eject</b> command on the <b>Start</b> menu. Applications should not enable the user to eject the computer.
     * @type {Integer (Int32)}
     */
    static REST_NOSMEJECTPC => 1073741927

    /**
     * <b>
     *               Windows XP or later.</b> If nonzero, the system administrator has hidden the <b>All Programs</b> item on the Windows XP <b>Start</b> menu. Applications should not show the contents of the <b>Start</b> menu folder to the user.
     * @type {Integer (Int32)}
     */
    static REST_NOSMMOREPROGRAMS => 1073741928

    /**
     * <b>
     *               Windows XP or later.</b> If nonzero, the system administrator has hidden the list of most frequently used programs on the Windows XP <b>Start</b> menu. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOSMMFUPROGRAMS => 1073741929

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has hidden all taskbar notification icons, regardless of activity. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOTRAYITEMSDISPLAY => 1073741930

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has hidden all taskbar toolbars, such as <b>Quick Launch</b>. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOTOOLBARSONTASKBAR => 1073741931

    /**
     * <b>
     *               Windows 2000 SP3 or later.</b> If nonzero, the system administrator has hidden the <b>Set Program Access</b> and <b>Defaults</b> shortcut on the <b>Start</b> menu. Applications that enumerate the contents of the <b>Start</b> menu should not show the <b>Set Program Access</b> and <b>Defaults</b> shortcut to the user.
     * @type {Integer (Int32)}
     */
    static REST_NOSMCONFIGUREPROGRAMS => 1073741935

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has hidden the clock on the taskbar, overriding any user preference. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_HIDECLOCK => 1073741936

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled taskbar warnings when disk space has become low. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOLOWDISKSPACECHECKS => 1073741937

    /**
     * <b>Windows 2000 Service Pack 4 (SP4) or later.</b> If nonzero, the system administrator has disabled the <b>Entire Network</b> icon in <b>Network Places</b>. Applications should remove the ability to browse domain resources.
     * @type {Integer (Int32)}
     */
    static REST_NOENTIRENETWORK => 1073741938

    /**
     * Windows XP, Windows<b>2003.</b> If nonzero, the system administrator has disabled the desktop cleaner. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NODESKTOPCLEANUP => 1073741939

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has required that deleted files be removed immediately instead of being placed in the <b>Recycle Bin</b>, overriding any user preference. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_BITBUCKNUKEONDELETE => 1073741940

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled the user's ability to specify whether confirmation dialogs should be displayed when files are moved to the <b>Recycle Bin</b>. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_BITBUCKCONFIRMDELETE => 1073741941

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled the user's ability to view or modify <b>Recycle Bin</b> properties. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_BITBUCKNOPROP => 1073741942

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled the user's ability to view or modify the desktop wallpaper. Applications should remove the ability to change the desktop wallpaper.
     * @type {Integer (Int32)}
     */
    static REST_NODISPBACKGROUND => 1073741943

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled the user's ability to view or modify screensaver settings. Applications should remove the ability to change the screensaver or screensaver settings.
     * @type {Integer (Int32)}
     */
    static REST_NODISPSCREENSAVEPG => 1073741944

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled the user's ability to view or modify screen color depth and resolution settings. Applications should remove the ability to change display color depth and resolution.
     * @type {Integer (Int32)}
     */
    static REST_NODISPSETTINGSPG => 1073741945

    /**
     * <b>Windows XP or later.</b> Ignored.
     * @type {Integer (Int32)}
     */
    static REST_NODISPSCREENSAVEPREVIEW => 1073741946

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled the <b>Display Properties</b> dialog box in <b>Control Panel</b>. Applications should remove the ability to change system colors, metrics, visual styles, font size, desktop wallpaper, screensaver, screensaver settings, screen color depth, or display resolution.
     * @type {Integer (Int32)}
     */
    static REST_NODISPLAYCPL => 1073741947

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled the "Run As" command for Shell objects. Applications should remove corresponding functionality.
     * @type {Integer (Int32)}
     */
    static REST_HIDERUNASVERB => 1073741948

    /**
     * <b>Windows XP or later.</b> If nonzero, the system administrator has disabled caching of thumbnails. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOTHUMBNAILCACHE => 1073741949

    /**
     * <b>
     *               Windows XP SP1 or later, or IE_BACKCOMPAT_VERSION defined.</b>
     *              If nonzero, the system administrator has specified that filenames should be sorted with the <b>StringCompare</b> function instead of the <b>StrCmpLogical</b> function. Applications that sort filenames should sort accordingly.  (This policy does not apply to Windows 2000.)
     * @type {Integer (Int32)}
     */
    static REST_NOSTRCMPLOGICAL => 1073741950

    /**
     * <b>
     *               Windows XP SP1 or later service pack, Windows Server 2003 or IE_BACKCOMPAT_VERSION defined.</b> Disables the Windows Publishing Wizard (WPW).<b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOPUBLISHWIZARD => 1073741951

    /**
     * <b>
     *               Windows XP SP1 or later, or IE_BACKCOMPAT_VERSION defined.</b> Disables the Online Prints Wizard (OPW). <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_NOONLINEPRINTSWIZARD => 1073741952

    /**
     * <b>
     *               Windows XP SP1 or later, or IE_BACKCOMPAT_VERSION defined.</b>
     *              Disables the web specified services for both the Online Prints Wizard (OPW) and the Windows Publishing Wizard (WPW).
     * @type {Integer (Int32)}
     */
    static REST_NOWEBSERVICES => 1073741953

    /**
     * <b>
     *               Windows 2000 SP3 or later, Windows XP, or Windows Server 2003.</b> If nonzero, the system administrator has granted permission for unregistered web view templates to be displayed. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_ALLOWUNHASHEDWEBVIEW => 1073741954

    /**
     * If nonzero, the system administrator has granted permission for old web view templates (created prior to Windows XP) to be converted to Windows XP templates. Applications do not need to perform any special actions. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_ALLOWLEGACYWEBVIEW => 1073741955

    /**
     * <b>
     *               Windows 2000 SP3 or later, Windows XP, or Windows Server 2003.</b> If nonzero, the system administrator has reduced web view security to the level that existed in Windows 2000 SP2 or earlier. Applications do not need to perform any special actions.  (This policy does not apply to Windows 2000 SP2 or earlier.) <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_REVERTWEBVIEWSECURITY => 1073741956

    /**
     * <b>Windows 2000 Service Pack 4 (SP4) or later.</b> If nonzero, the ShellExec function checks if the current process and target process are console processes that can inherit handles.
     * @type {Integer (Int32)}
     */
    static REST_INHERITCONSOLEHANDLES => 1073741958

    /**
     * <b>
     *               Windows XP SP2 or later.</b> Do not register network change events recursively. This helps to avoid network traffic.
     * @type {Integer (Int32)}
     */
    static REST_NOREMOTERECURSIVEEVENTS => 1073741961

    /**
     * <b>
     *               Windows XP SP2 or later.</b> Do not notify for remote change notifications.
     * @type {Integer (Int32)}
     */
    static REST_NOREMOTECHANGENOTIFY => 1073741969

    /**
     * <b>
     *               Windows XP SP2 or later.</b> Do not enumerate the entire network.
     * @type {Integer (Int32)}
     */
    static REST_NOENUMENTIRENETWORK => 1073741971

    /**
     * <b>
     *               Windows XP SP2 or later.</b> If nonzero, the system administrator has removed the ability to resolve file associations using the Internet. The option <b>Use the web service to find the appropriate program</b> is unavailable in the dialog displayed when the user selects <b>Open With</b> or double-clicks an unassociated file type.
     * @type {Integer (Int32)}
     */
    static REST_NOINTERNETOPENWITH => 1073741973

    /**
     * <b>
     *               Windows XP SP2 or later.</b> In <b>Network Places</b>, if the provider returns ERROR_BAD_NET_NAME, do not retry.
     * @type {Integer (Int32)}
     */
    static REST_DONTRETRYBADNETNAME => 1073741979

    /**
     * <b>
     *               Windows XP SP2 or later, Windows Server 2003.</b> Re-enable legacy support for file.{guid} junctions in file system folders.
     * @type {Integer (Int32)}
     */
    static REST_ALLOWFILECLSIDJUNCTIONS => 1073741980

    /**
     * <b>
     *               Windows XP SP2 or later.</b> Disable the <b>Install Universal Plug and Play (UPnP)</b> task in <b>My Network Places</b>.
     * @type {Integer (Int32)}
     */
    static REST_NOUPNPINSTALL => 1073741981

    /**
     * If nonzero, the system administrator has removed the option to list individual patches in Add/Remove Programs. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_ARP_DONTGROUPPATCHES => 1073741996

    /**
     * If nonzero, the system administrator has removed the option to choose the programs page. <b>Windows Vista or later</b>: Not used.
     * @type {Integer (Int32)}
     */
    static REST_ARP_NOCHOOSEPROGRAMSPAGE => 1073741997

    /**
     * <b>Not supported under Windows Vista or later</b>. If nonzero, the system administrator has removed the <b>Disconnect</b> option from the <b>Start</b> menu and <b>Task Manager</b>. Applications should remove the ability to disconnect users from a Terminal Server session.
     * @type {Integer (Int32)}
     */
    static REST_NODISCONNECT => 1090519041

    /**
     * <b>Not supported under Windows Vista and later</b>. If nonzero, the system administrator has removed the <b>Windows Security</b> option from the <b>Start</b> menu and <b>Task Manager</b>. Applications do not need to perform any special actions.
     * @type {Integer (Int32)}
     */
    static REST_NOSECURITY => 1090519042

    /**
     * <b>Not supported under Windows Vista and later</b>. If nonzero, the system administrator has removed the ability to change file associations. Applications should not enable users to change file associations arbitrarily.
     * @type {Integer (Int32)}
     */
    static REST_NOFILEASSOCIATE => 1090519043

    /**
     * <b>
     *               Windows XP SP2 only. Not supported under Windows Vista or later.</b> Allows the user to toggle the position of the Comment and the Computer Name.
     * @type {Integer (Int32)}
     */
    static REST_ALLOWCOMMENTTOGGLE => 1090519044
}
