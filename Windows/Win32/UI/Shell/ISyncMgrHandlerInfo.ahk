#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow a handler to provide property and state information to Sync Center.
 * @remarks
 * 
  * Handlers should always implement this interface, generally on the same object that implements <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrhandler">ISyncMgrHandler</a>. By implementing <b>ISyncMgrHandlerInfo</b>, the set of properties can be changed without requiring the handler to be recompiled. It also provides type-safe access to the properties.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrhandlerinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrHandlerInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMgrHandlerInfo
     * @type {Guid}
     */
    static IID => Guid("{4ff1d798-ecf7-4524-aa81-1e362a0aef3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "GetTypeLabel", "GetComment", "GetLastSyncTime", "IsActive", "IsEnabled", "IsConnected"]

    /**
     * 
     * @param {Pointer<Integer>} pnType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-gettype
     */
    GetType(pnType) {
        pnTypeMarshal := pnType is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pnTypeMarshal, pnType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszTypeLabel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-gettypelabel
     */
    GetTypeLabel(ppszTypeLabel) {
        result := ComCall(4, this, "ptr", ppszTypeLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszComment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-getcomment
     */
    GetComment(ppszComment) {
        result := ComCall(5, this, "ptr", ppszComment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftLastSync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-getlastsynctime
     */
    GetLastSyncTime(pftLastSync) {
        result := ComCall(6, this, "ptr", pftLastSync, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-isactive
     */
    IsActive() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-isenabled
     */
    IsEnabled() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-isconnected
     */
    IsConnected() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
