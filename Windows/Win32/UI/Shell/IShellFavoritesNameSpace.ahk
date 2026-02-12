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
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveSelectionDown() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetSort() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NewFolder() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Synchronize Method (RDS)
     * @remarks
     * The *HandlerString* parameter may be null. What happens in this case depends on how the RDS server is configured. A handler string of "MSDFMAP.handler" indicates that the Microsoft supplied handler (Msdfmap.dll) should be used. A handler string of "MASDFMAP.handler,sample.ini" indicates that the Msdfmap.dll handler should be used and that the argument "sample.ini" should be passed to the handler. Msdfmap.dll will then interpret the argument as a direction to use the sample.ini to check the connection and query strings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/synchronize-method-rds
     */
    Synchronize() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nc-winbase-pfe_import_func
     */
    Import() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nc-winbase-pfe_export_func
     */
    Export() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} strCommand 
     * @returns {HRESULT} 
     */
    InvokeContextMenuCommand(strCommand) {
        if(strCommand is String) {
            pin := BSTR.Alloc(strCommand)
            strCommand := pin.Value
        }

        result := ComCall(14, this, "ptr", strCommand, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveSelectionTo() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_SubscriptionsEnabled() {
        result := ComCall(16, this, "short*", &pBool := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBool
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    CreateSubscriptionForSelection() {
        result := ComCall(17, this, "short*", &pBool := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBool
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    DeleteSubscriptionForSelection() {
        result := ComCall(18, this, "short*", &pBool := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBool
    }

    /**
     * 
     * @param {BSTR} bstrFullPath 
     * @returns {HRESULT} 
     */
    SetRoot(bstrFullPath) {
        if(bstrFullPath is String) {
            pin := BSTR.Alloc(bstrFullPath)
            bstrFullPath := pin.Value
        }

        result := ComCall(19, this, "ptr", bstrFullPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
