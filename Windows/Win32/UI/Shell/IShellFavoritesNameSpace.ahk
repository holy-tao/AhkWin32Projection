#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellFavoritesNameSpace extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellFavoritesNameSpace
     * @type {Guid}
     */
    static IID => Guid("{55136804-b2de-11d1-b9f2-00a0c98bc547}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MoveSelectionUp", "MoveSelectionDown", "ResetSort", "NewFolder", "Synchronize", "Import", "Export", "InvokeContextMenuCommand", "MoveSelectionTo", "get_SubscriptionsEnabled", "CreateSubscriptionForSelection", "DeleteSubscriptionForSelection", "SetRoot"]

    /**
     * @type {VARIANT_BOOL} 
     */
    SubscriptionsEnabled {
        get => this.get_SubscriptionsEnabled()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveSelectionUp() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveSelectionDown() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetSort() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NewFolder() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Causes the UI Automation provider to stop listening for mouse or keyboard input.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns S_OK if successful or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nf-uiautomationcoreapi-synchronizedinputpattern_cancel
     */
    Synchronize() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * An application-defined callback function used with WriteEncryptedFileRaw. The system calls ImportCallback one or more times, each time to retrieve a portion of a backup file's data.
     * @remarks
     * The system calls the <b>ImportCallback</b> function until the 
     *      callback function indicates there is no more data to restore. To indicate that there is no more data to be 
     *      restored, set <i>*ulLength</i> to 0 and use a return code of 
     *      <b>ERROR_SUCCESS</b>. You can use the application-defined context block for internal tracking 
     *      of information such as the file handle and the current offset in the file.
     * @returns {HRESULT} If the function succeeds, it must set the return value to <b>ERROR_SUCCESS</b>, and set 
     *        the value pointed to by the <i>ulLength</i> parameter to the number of bytes copied into 
     *        <i>pbData</i>.
     * 
     * When the end of the backup file is reached, set <i>ulLength</i> to zero to tell the system 
     *        that the entire file has been processed.
     * 
     * If the function fails, set the return value to a nonzero error code defined in WinError.h. For 
     *        example, if this function fails because an API that it calls fails, you can set the return value to the value 
     *        returned by <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for the failed API.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nc-winbase-pfe_import_func
     */
    Import() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * An application-defined callback function used with ReadEncryptedFileRaw.
     * @remarks
     * You can use the application-defined context block for internal tracking of information such as the file handle 
     *      and the current offset in the file.
     * @returns {HRESULT} If the function succeeds, it must set the return value to <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, set the return value to a nonzero error code defined in WinError.h. For 
     *        example, if this function fails because an API that it calls fails, you can set the return value to the value 
     *        returned by <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for the failed API.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nc-winbase-pfe_export_func
     */
    Export() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strCommand 
     * @returns {HRESULT} 
     */
    InvokeContextMenuCommand(strCommand) {
        strCommand := strCommand is String ? BSTR.Alloc(strCommand).Value : strCommand

        result := ComCall(14, this, "ptr", strCommand, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveSelectionTo() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_SubscriptionsEnabled() {
        result := ComCall(16, this, "short*", &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    CreateSubscriptionForSelection() {
        result := ComCall(17, this, "short*", &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    DeleteSubscriptionForSelection() {
        result := ComCall(18, this, "short*", &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * 
     * @param {BSTR} bstrFullPath 
     * @returns {HRESULT} 
     */
    SetRoot(bstrFullPath) {
        bstrFullPath := bstrFullPath is String ? BSTR.Alloc(bstrFullPath).Value : bstrFullPath

        result := ComCall(19, this, "ptr", bstrFullPath, "HRESULT")
        return result
    }
}
