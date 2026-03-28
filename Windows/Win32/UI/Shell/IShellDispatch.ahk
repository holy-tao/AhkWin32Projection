#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\Folder.ahk

/**
 * Represents an object in the Shell.
 * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDispatch extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellDispatch
     * @type {Guid}
     */
    static IID => Guid("{d8f015c0-c278-11ce-a49e-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Application", "get_Parent", "NameSpace", "BrowseForFolder", "Windows", "Open", "Explore", "MinimizeAll", "UndoMinimizeALL", "FileRun", "CascadeWindows", "TileVertically", "TileHorizontally", "ShutdownWindows", "Suspend", "EjectPC", "SetTime", "TrayProperties", "Help", "FindFiles", "FindComputer", "RefreshMenu", "ControlPanelItem"]

    /**
     * @type {IDispatch} 
     */
    Application {
        get => this.get_Application()
    }

    /**
     * @type {IDispatch} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Application() {
        result := ComCall(7, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(8, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * IShellDispatch.NameSpace method - Creates and returns a Folder object for the specified folder.
     * @remarks
     * This method is implemented and accessed through the [**Shell.NameSpace**](shell-namespace.md) method.
     * @param {VARIANT} vDir Type: **Variant**
     * 
     * The folder for which to create the [**Folder**](folder.md) object. This can be a string that specifies the path of the folder or one of the [**ShellSpecialFolderConstants**](/windows/desktop/api/Shldisp/ne-shldisp-shellspecialfolderconstants) values. Note that the constant names found in **ShellSpecialFolderConstants** are available in Visual Basic, but not in VBScript or JScript. In those cases, the numeric values must be used in their place.
     * @returns {Folder} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-namespace
     */
    NameSpace(vDir) {
        result := ComCall(9, this, "ptr", vDir, "ptr*", &ppsdf := 0, "HRESULT")
        return Folder(ppsdf)
    }

    /**
     * IShellDispatch.BrowseForFolder method - Creates a dialog box that enables the user to select a folder and then returns the selected folder's Folder object.
     * @remarks
     * This method is implemented and accessed through the [**Shell.BrowseForFolder**](shell-browseforfolder.md) method.
     * @param {Integer} _Hwnd 
     * @param {BSTR} Title 
     * @param {Integer} Options 
     * @param {VARIANT} RootFolder 
     * @returns {Folder} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-browseforfolder
     */
    BrowseForFolder(_Hwnd, Title, Options, RootFolder) {
        Title := Title is String ? BSTR.Alloc(Title).Value : Title

        result := ComCall(10, this, "int", _Hwnd, "ptr", Title, "int", Options, "ptr", RootFolder, "ptr*", &ppsdf := 0, "HRESULT")
        return Folder(ppsdf)
    }

    /**
     * IShellDispatch.Windows method - Creates and returns a ShellWindows object. This object represents a collection of all of the open windows that belong to the Shell.
     * @remarks
     * This method is implemented and accessed through the [**Shell.Windows**](shell-windows.md) method.
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-windows
     */
    Windows() {
        result := ComCall(11, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * IShellDispatch.Open method - Opens the specified folder.
     * @remarks
     * This method is implemented and accessed through the [**Shell.Open**](shell-open.md) method.
     * @param {VARIANT} vDir Type: **Variant**
     * 
     * A string that specifies the path of the folder or one of the [**ShellSpecialFolderConstants**](/windows/desktop/api/Shldisp/ne-shldisp-shellspecialfolderconstants) values. Note that the constant names found in **ShellSpecialFolderConstants** are available in Visual Basic, but not in VBScript or JScript. In those cases, the numeric values must be used in their place.
     * 
     * If *vDir* is set to one of the [**ShellSpecialFolderConstants**](/windows/desktop/api/Shldisp/ne-shldisp-shellspecialfolderconstants) and the special folder does not exist, this function will create the folder.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-open
     */
    Open(vDir) {
        result := ComCall(12, this, "ptr", vDir, "HRESULT")
        return result
    }

    /**
     * IShellDispatch.Explore method - Opens a specified folder in a Windows Explorer window.
     * @remarks
     * This method is implemented and accessed through the [**Shell.Explore**](shell-explore.md) method.
     * @param {VARIANT} vDir Type: **Variant**
     * 
     * The folder to be displayed. This can be a string that specifies the path of the folder or one of the [**ShellSpecialFolderConstants**](/windows/desktop/api/Shldisp/ne-shldisp-shellspecialfolderconstants) values. Note that the constant names found in **ShellSpecialFolderConstants** are available in Visual Basic, but not in VBScript or JScript. In those cases, the numeric values must be used in their place.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-explore
     */
    Explore(vDir) {
        result := ComCall(13, this, "ptr", vDir, "HRESULT")
        return result
    }

    /**
     * Minimizes all of the windows on the desktop. This method has the same effect as right-clicking the taskbar and selecting Minimize All Windows on older systems or clicking the Show Desktop icon on the taskbar.
     * @remarks
     * This method is implemented and accessed through the [**Shell.MinimizeAll**](shell-minimizeall.md) method.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-minimizeall
     */
    MinimizeAll() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Restores all desktop windows to the state they were in before the last MinimizeAll command.
     * @remarks
     * This method is implemented and accessed through the [**Shell.UndoMinimizeAll**](./shell-undominimizeall.md) method.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-undominimizeall
     */
    UndoMinimizeALL() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Displays the Run dialog to the user.
     * @remarks
     * This method is implemented and accessed through the [**Shell.FileRun**](shell-filerun.md) method.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-filerun
     */
    FileRun() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Cascades all of the windows on the desktop. This method has the same effect as right-clicking the taskbar and selecting Cascade windows.
     * @remarks
     * This method is implemented and accessed through the [**Shell.CascadeWindows**](shell-cascadewindows.md) method.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-cascadewindows
     */
    CascadeWindows() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Tiles all of the windows on the desktop vertically. This method has the same effect as right-clicking the taskbar and selecting Show windows side by side.
     * @remarks
     * This method is implemented and accessed through the [**Shell.TileVertically**](shell-tilevertically.md) method.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-tilevertically
     */
    TileVertically() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Tiles all of the windows on the desktop horizontally. This method has the same effect as right-clicking the taskbar and selecting Show windows stacked.
     * @remarks
     * This method is implemented and accessed through the [**Shell.TileHorizontally**](shell-tilehorizontally.md) method.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-tilehorizontally
     */
    TileHorizontally() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * IShellDispatch.ShutdownWindows method - Displays the Shut Down Windows dialog box. This is the same as clicking the Start menu and selecting Shut Down.
     * @remarks
     * This method is implemented and accessed through the [**Shell.ShutdownWindows**](shell-shutdownwindows.md) method.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-shutdownwindows
     */
    ShutdownWindows() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * IShellDispatch.Suspend method
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-suspend
     */
    Suspend() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * IShellDispatch.EjectPC method - Ejects the computer from its docking station. This is the same as clicking the Start menu and selecting Eject PC, if your computer supports this command.
     * @remarks
     * This method is implemented and accessed through the [**Shell.EjectPC**](shell-ejectpc.md) method.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-ejectpc
     */
    EjectPC() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * Displays the Date and Time dialog box. This method has the same effect as right-clicking the clock in the taskbar status area and selecting Adjust date/time.
     * @remarks
     * This method is implemented and accessed through the [**Shell.SetTime**](shell-settime.md) method.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-settime
     */
    SetTime() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * IShellDispatch.TrayProperties method - Displays the Taskbar and Start Menu Properties dialog box. This method has the same effect as right-clicking the taskbar and selecting Properties.
     * @remarks
     * This method is implemented and accessed through the [**Shell.TrayProperties**](shell-trayproperties.md) method.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-trayproperties
     */
    TrayProperties() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * Displays the Windows Help and Support window. This method has the same effect as clicking the Start menu and selecting Help and Support.
     * @remarks
     * This method is implemented and accessed through the [**Shell.Help**](shell-help.md) method.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-help
     */
    Help() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * Displays the Find: All Files dialog box. This is the same as clicking the Start menu and then selecting Search.
     * @remarks
     * This method is implemented and accessed through the [**Shell.FindFiles**](shell-findfiles.md) method.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-findfiles
     */
    FindFiles() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * IShellDispatch.FindComputer method Displays the Search Results Computers dialog box. The dialog box shows the result of the search for a specified computer.
     * @remarks
     * This method is implemented and accessed through the [**Shell.FindComputer**](shell-findcomputer.md) method.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-findcomputer
     */
    FindComputer() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * Learn about the IShellDispatch.RefreshMenu method, which refreshes the contents of the Start menu. Used only with systems preceding Windows XP.
     * @remarks
     * This method is implemented and accessed through the [**Shell.TrayProperties**](shell-trayproperties.md) method.
     * 
     * The functionality that **RefreshMenu** provides is handled automatically under Windows XP or later. Do not call this method on Windows XP or later.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-refreshmenu
     */
    RefreshMenu() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    /**
     * Runs the specified Control Panel application.
     * @remarks
     * This method is implemented and accessed through the [**Shell.ControlPanelItem**](shell-controlpanelitem.md) method.
     * @param {BSTR} bstrDir Type: **[**BSTR**](/previous-versions/windows/desktop/automat/bstr)**
     * 
     * The Control Panel application's file name.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-controlpanelitem
     */
    ControlPanelItem(bstrDir) {
        bstrDir := bstrDir is String ? BSTR.Alloc(bstrDir).Value : bstrDir

        result := ComCall(29, this, "ptr", bstrDir, "HRESULT")
        return result
    }
}
