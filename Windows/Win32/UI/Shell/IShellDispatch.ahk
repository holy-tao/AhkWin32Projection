#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * 
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
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Application(ppid) {
        result := ComCall(7, this, "ptr*", ppid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Parent(ppid) {
        result := ComCall(8, this, "ptr*", ppid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vDir 
     * @param {Pointer<Folder>} ppsdf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-namespace
     */
    NameSpace(vDir, ppsdf) {
        result := ComCall(9, this, "ptr", vDir, "ptr*", ppsdf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Hwnd 
     * @param {BSTR} Title 
     * @param {Integer} Options 
     * @param {VARIANT} RootFolder 
     * @param {Pointer<Folder>} ppsdf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-browseforfolder
     */
    BrowseForFolder(Hwnd, Title, Options, RootFolder, ppsdf) {
        Title := Title is String ? BSTR.Alloc(Title).Value : Title

        result := ComCall(10, this, "int", Hwnd, "ptr", Title, "int", Options, "ptr", RootFolder, "ptr*", ppsdf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-windows
     */
    Windows(ppid) {
        result := ComCall(11, this, "ptr*", ppid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vDir 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-open
     */
    Open(vDir) {
        result := ComCall(12, this, "ptr", vDir, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vDir 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-explore
     */
    Explore(vDir) {
        result := ComCall(13, this, "ptr", vDir, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-minimizeall
     */
    MinimizeAll() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-undominimizeall
     */
    UndoMinimizeALL() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-filerun
     */
    FileRun() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Cascades the specified child windows of the specified parent window.
     * @returns {HRESULT} Type: <b>WORD</b>
     * 
     * If the function succeeds, the return value is the number of windows arranged.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-cascadewindows
     */
    CascadeWindows() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-tilevertically
     */
    TileVertically() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-tilehorizontally
     */
    TileHorizontally() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-shutdownwindows
     */
    ShutdownWindows() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-suspend
     */
    Suspend() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-ejectpc
     */
    EjectPC() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-settime
     */
    SetTime() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-trayproperties
     */
    TrayProperties() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-help
     */
    Help() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-findfiles
     */
    FindFiles() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-findcomputer
     */
    FindComputer() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-refreshmenu
     */
    RefreshMenu() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDir 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch-controlpanelitem
     */
    ControlPanelItem(bstrDir) {
        bstrDir := bstrDir is String ? BSTR.Alloc(bstrDir).Value : bstrDir

        result := ComCall(29, this, "ptr", bstrDir, "HRESULT")
        return result
    }
}
