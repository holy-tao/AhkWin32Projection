#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods so that an application can register with the synchronization manager. This can be achieved either through the ISyncMgrRegister interface or by registering directly in the registry.
 * @remarks
 * The handler must be a standard OLE server. It must register the standard OLE keys for an InProc OLE server in addition to the SyncMgr key.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/nn-mobsync-isyncmgrregister
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrRegister extends IUnknown {
    /**
     * The interface identifier for ISyncMgrRegister
     * @type {Guid}
     */
    static IID := Guid("{6295df42-35ee-11d1-8707-00c04fd93327}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrRegister interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterSyncMgrHandler     : IntPtr
        UnregisterSyncMgrHandler   : IntPtr
        GetHandlerRegistrationInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrRegister.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers a handler with the synchronization manager when the handler has items to synchronize.
     * @param {Pointer<Guid>} clsidHandler Type: <b>REFCLSID</b>
     * 
     * The CLSID of the handler that should be registered to do synchronizations.
     * @param {PWSTR} pwszDescription Type: <b>LPCWSTR</b>
     * 
     * Text identifying the handler. This parameter may be <b>NULL</b>.
     * @param {Integer} dwSyncMgrRegisterFlags Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values E_INVALIDARG, E_UNEXPECTED, and E_OUTOFMEMORY, as well as the following:
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
     * The handler was successfully registered.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrregister-registersyncmgrhandler
     */
    RegisterSyncMgrHandler(clsidHandler, pwszDescription, dwSyncMgrRegisterFlags) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(3, this, Guid.Ptr, clsidHandler, "ptr", pwszDescription, "uint", dwSyncMgrRegisterFlags, "HRESULT")
        return result
    }

    /**
     * Removes a handler's class identifier (CLSID) from the registration. A handler should call this when it no longer has any items to synchronize.
     * @param {Pointer<Guid>} clsidHandler Type: <b>REFCLSID</b>
     * 
     * The CLSID of the handler that should be unregistered.
     * @param {Integer} dwReserved Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values E_INVALIDARG, E_UNEXPECTED, and E_OUTOFMEMORY, as well as the following:
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
     * The handler was successfully removed from the registry with SyncMgr.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrregister-unregistersyncmgrhandler
     */
    UnregisterSyncMgrHandler(clsidHandler, dwReserved) {
        result := ComCall(4, this, Guid.Ptr, clsidHandler, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * Called by the registered application's handler to get current registration information.
     * @param {Pointer<Guid>} clsidHandler Type: <b>REFCLSID</b>
     * 
     * The CLSID of the handler.
     * @param {Pointer<Integer>} pdwSyncMgrRegisterFlags Type: <b>LPDWORD</b>
     * 
     * Returns registration flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrregisterflags">SYNCMGRREGISTERFLAGS</a> enumeration that indicate events for which the handler is registered to be notified.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values E_INVALIDARG, E_UNEXPECTED, and E_OUTOFMEMORY, as well as the following:
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
     * Call was successful, the handler is registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call was not successful, the handler is not registered.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrregister-gethandlerregistrationinfo
     */
    GetHandlerRegistrationInfo(clsidHandler, pdwSyncMgrRegisterFlags) {
        pdwSyncMgrRegisterFlagsMarshal := pdwSyncMgrRegisterFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, Guid.Ptr, clsidHandler, pdwSyncMgrRegisterFlagsMarshal, pdwSyncMgrRegisterFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncMgrRegister.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterSyncMgrHandler := CallbackCreate(GetMethod(implObj, "RegisterSyncMgrHandler"), flags, 4)
        this.vtbl.UnregisterSyncMgrHandler := CallbackCreate(GetMethod(implObj, "UnregisterSyncMgrHandler"), flags, 3)
        this.vtbl.GetHandlerRegistrationInfo := CallbackCreate(GetMethod(implObj, "GetHandlerRegistrationInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterSyncMgrHandler)
        CallbackFree(this.vtbl.UnregisterSyncMgrHandler)
        CallbackFree(this.vtbl.GetHandlerRegistrationInfo)
    }
}
