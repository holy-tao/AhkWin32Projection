#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncSessionState.ahk" { ISyncSessionState }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents additional information about the current synchronization session.
 * @remarks
 * An <b>ISyncSessionState2</b> object can be obtained by passing <b>IID_ISyncSessionState2</b> to the <b>QueryInterface</b> method of an <b>ISyncSessionState</b> object.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isyncsessionstate2
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncSessionState2 extends ISyncSessionState {
    /**
     * The interface identifier for ISyncSessionState2
     * @type {Guid}
     */
    static IID := Guid("{9e37cfa3-9e38-4c61-9ca3-ffe810b45ca2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncSessionState2 interfaces
    */
    struct Vtbl extends ISyncSessionState.Vtbl {
        SetProviderWithError  : IntPtr
        GetSessionErrorStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncSessionState2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates which provider caused synchronization to fail.
     * @remarks
     * The destination provider indicates which provider caused synchronization to fail during processing of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-iknowledgesyncprovider-processchangebatch">IKnowledgeSyncProvider::ProcessChangeBatch</a> method, by using <b>ISyncSessionState2::SetProviderWithError</b>. <b>ISyncSessionState2::SetProviderWithError</b> is used by an application to obtain the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncprovider">ISyncProvider</a> interface of the provider that caused the failure. The synchronization session can then query for other interfaces that are implemented by the provider, and call methods to handle the error.
     * @param {BOOL} fSelf <b>TRUE</b> when the provider that calls this method is the provider that caused the error. Otherwise,<b> FALSE</b>.
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
     * <dt><b>SYNC_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A synchronization session does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate2-setproviderwitherror
     */
    SetProviderWithError(fSelf) {
        result := ComCall(10, this, BOOL, fSelf, "HRESULT")
        return result
    }

    /**
     * Gets the error value that indicates why the synchronization session failed.
     * @param {Pointer<HRESULT>} phrSessionError The error value that indicates why the synchronization session failed.
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
     * <dt><b>E_POINTER
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncsessionstate2-getsessionerrorstatus
     */
    GetSessionErrorStatus(phrSessionError) {
        phrSessionErrorMarshal := phrSessionError is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, phrSessionErrorMarshal, phrSessionError, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncSessionState2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProviderWithError := CallbackCreate(GetMethod(implObj, "SetProviderWithError"), flags, 2)
        this.vtbl.GetSessionErrorStatus := CallbackCreate(GetMethod(implObj, "GetSessionErrorStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProviderWithError)
        CallbackFree(this.vtbl.GetSessionErrorStatus)
    }
}
