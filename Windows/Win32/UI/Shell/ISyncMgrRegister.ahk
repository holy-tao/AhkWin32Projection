#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods so that an application can register with the synchronization manager. This can be achieved either through the ISyncMgrRegister interface or by registering directly in the registry.
 * @remarks
 * 
 * The handler must be a standard OLE server. It must register the standard OLE keys for an InProc OLE server in addition to the SyncMgr key.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mobsync/nn-mobsync-isyncmgrregister
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrRegister extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrRegister
     * @type {Guid}
     */
    static IID => Guid("{6295df42-35ee-11d1-8707-00c04fd93327}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterSyncMgrHandler", "UnregisterSyncMgrHandler", "GetHandlerRegistrationInfo"]

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
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrregister-registersyncmgrhandler
     */
    RegisterSyncMgrHandler(clsidHandler, pwszDescription, dwSyncMgrRegisterFlags) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(3, this, "ptr", clsidHandler, "ptr", pwszDescription, "uint", dwSyncMgrRegisterFlags, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrregister-unregistersyncmgrhandler
     */
    UnregisterSyncMgrHandler(clsidHandler, dwReserved) {
        result := ComCall(4, this, "ptr", clsidHandler, "uint", dwReserved, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrregister-gethandlerregistrationinfo
     */
    GetHandlerRegistrationInfo(clsidHandler, pdwSyncMgrRegisterFlags) {
        pdwSyncMgrRegisterFlagsMarshal := pdwSyncMgrRegisterFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", clsidHandler, pdwSyncMgrRegisterFlagsMarshal, pdwSyncMgrRegisterFlags, "HRESULT")
        return result
    }
}
