#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents information about a recoverable error.
 * @remarks
 * To communicate additional information that is not supported by this interface, implement an object that inherits from <b>IRecoverableErrorData</b> and also from a custom interface. When the application receives the <b>IRecoverableErrorData</b> object in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isynccallback-onrecoverableerror">ISyncCallback::OnRecoverableError</a> method, the application can call <b>QueryInterface</b> on the <b>IRecoverableErrorData</b> object to obtain the custom interface.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-irecoverableerrordata
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IRecoverableErrorData extends IUnknown {
    /**
     * The interface identifier for IRecoverableErrorData
     * @type {Guid}
     */
    static IID := Guid("{b37c4a0a-4b7d-4c2d-9711-3b00d119b1c8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRecoverableErrorData interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize          : IntPtr
        GetItemDisplayName  : IntPtr
        GetErrorDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRecoverableErrorData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the object by using the specified display name of the item that caused the error and a description of the error.
     * @param {PWSTR} pcszItemDisplayName The display name of the item that caused the error.
     * @param {PWSTR} pcszErrorDescription The description of the error.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Provider-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerrordata-initialize
     */
    Initialize(pcszItemDisplayName, pcszErrorDescription) {
        pcszItemDisplayName := pcszItemDisplayName is String ? StrPtr(pcszItemDisplayName) : pcszItemDisplayName
        pcszErrorDescription := pcszErrorDescription is String ? StrPtr(pcszErrorDescription) : pcszErrorDescription

        result := ComCall(3, this, "ptr", pcszItemDisplayName, "ptr", pcszErrorDescription, "HRESULT")
        return result
    }

    /**
     * Gets the display name of the item that caused the error.
     * @param {PWSTR} pszItemDisplayName Returns the display name of the item that caused the error.
     * @param {Pointer<Integer>} pcchItemDisplayName Specifies the number of characters in <i>pszItemDisplayName</i>. Returns the required number of characters for <i>pszItemDisplayName</i> when <i>pcchItemDisplayName</i> is too small; otherwise, returns the number of characters written.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pszItemDisplayName</i> is too small. In this case, the required number of characters is returned in <i>pcchItemDisplayName</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Provider-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerrordata-getitemdisplayname
     */
    GetItemDisplayName(pszItemDisplayName, pcchItemDisplayName) {
        pszItemDisplayName := pszItemDisplayName is String ? StrPtr(pszItemDisplayName) : pszItemDisplayName

        pcchItemDisplayNameMarshal := pcchItemDisplayName is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pszItemDisplayName, pcchItemDisplayNameMarshal, pcchItemDisplayName, "HRESULT")
        return result
    }

    /**
     * Gets the description of the error.
     * @param {PWSTR} pszErrorDescription Returns the description of the error.
     * @param {Pointer<Integer>} pcchErrorDescription Specifies the number of characters in <i>pszErrorDescription</i>. Returns the required number of characters for <i>pszErrorDescription</i> when <i>pcchErrorDescription</i> is too small; otherwise, returns the number of characters written.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pszErrorDescription</i> is too small. In this case, the required number of characters is returned in <i>pcchErrorDescription</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Provider-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerrordata-geterrordescription
     */
    GetErrorDescription(pszErrorDescription, pcchErrorDescription) {
        pszErrorDescription := pszErrorDescription is String ? StrPtr(pszErrorDescription) : pszErrorDescription

        pcchErrorDescriptionMarshal := pcchErrorDescription is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pszErrorDescription, pcchErrorDescriptionMarshal, pcchErrorDescription, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRecoverableErrorData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetItemDisplayName := CallbackCreate(GetMethod(implObj, "GetItemDisplayName"), flags, 3)
        this.vtbl.GetErrorDescription := CallbackCreate(GetMethod(implObj, "GetErrorDescription"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetItemDisplayName)
        CallbackFree(this.vtbl.GetErrorDescription)
    }
}
