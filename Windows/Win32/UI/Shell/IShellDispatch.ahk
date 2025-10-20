#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDispatch extends IDispatch{
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
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Application(ppid) {
        result := ComCall(7, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    get_Parent(ppid) {
        result := ComCall(8, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vDir 
     * @param {Pointer<Folder>} ppsdf 
     * @returns {HRESULT} 
     */
    NameSpace(vDir, ppsdf) {
        result := ComCall(9, this, "ptr", vDir, "ptr", ppsdf, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    BrowseForFolder(Hwnd, Title, Options, RootFolder, ppsdf) {
        Title := Title is String ? BSTR.Alloc(Title).Value : Title

        result := ComCall(10, this, "int", Hwnd, "ptr", Title, "int", Options, "ptr", RootFolder, "ptr", ppsdf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppid 
     * @returns {HRESULT} 
     */
    Windows(ppid) {
        result := ComCall(11, this, "ptr", ppid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vDir 
     * @returns {HRESULT} 
     */
    Open(vDir) {
        result := ComCall(12, this, "ptr", vDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vDir 
     * @returns {HRESULT} 
     */
    Explore(vDir) {
        result := ComCall(13, this, "ptr", vDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MinimizeAll() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UndoMinimizeALL() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FileRun() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TileVertically() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TileHorizontally() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShutdownWindows() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Suspend() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EjectPC() {
        result := ComCall(22, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetTime() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TrayProperties() {
        result := ComCall(24, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Help() {
        result := ComCall(25, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FindFiles() {
        result := ComCall(26, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FindComputer() {
        result := ComCall(27, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RefreshMenu() {
        result := ComCall(28, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDir 
     * @returns {HRESULT} 
     */
    ControlPanelItem(bstrDir) {
        bstrDir := bstrDir is String ? BSTR.Alloc(bstrDir).Value : bstrDir

        result := ComCall(29, this, "ptr", bstrDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
