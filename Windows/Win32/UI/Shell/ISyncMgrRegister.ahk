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
     * 
     * @param {Pointer<Guid>} clsidHandler 
     * @param {PWSTR} pwszDescription 
     * @param {Integer} dwSyncMgrRegisterFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrregister-registersyncmgrhandler
     */
    RegisterSyncMgrHandler(clsidHandler, pwszDescription, dwSyncMgrRegisterFlags) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(3, this, "ptr", clsidHandler, "ptr", pwszDescription, "uint", dwSyncMgrRegisterFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsidHandler 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrregister-unregistersyncmgrhandler
     */
    UnregisterSyncMgrHandler(clsidHandler, dwReserved) {
        result := ComCall(4, this, "ptr", clsidHandler, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsidHandler 
     * @param {Pointer<Integer>} pdwSyncMgrRegisterFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrregister-gethandlerregistrationinfo
     */
    GetHandlerRegistrationInfo(clsidHandler, pdwSyncMgrRegisterFlags) {
        result := ComCall(5, this, "ptr", clsidHandler, "uint*", pdwSyncMgrRegisterFlags, "HRESULT")
        return result
    }
}
