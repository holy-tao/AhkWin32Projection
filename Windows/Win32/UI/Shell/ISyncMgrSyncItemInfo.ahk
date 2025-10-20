#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide property and state information for a single sync item.
 * @remarks
 * 
  * By representing these properties as an interface, the set of properties can be changed later without recompiling the handler. The interface also provides type-safe access to the properties.
  * 
  * Items should always implement this interface, usually on the same object that implements <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrsyncitem">ISyncMgrSyncItem</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-isyncmgrsynciteminfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrSyncItemInfo extends IUnknown{
    /**
     * The interface identifier for ISyncMgrSyncItemInfo
     * @type {Guid}
     */
    static IID => Guid("{e7fd9502-be0c-4464-90a1-2b5277031232}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} ppszTypeLabel 
     * @returns {HRESULT} 
     */
    GetTypeLabel(ppszTypeLabel) {
        result := ComCall(3, this, "ptr", ppszTypeLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszComment 
     * @returns {HRESULT} 
     */
    GetComment(ppszComment) {
        result := ComCall(4, this, "ptr", ppszComment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftLastSync 
     * @returns {HRESULT} 
     */
    GetLastSyncTime(pftLastSync) {
        result := ComCall(5, this, "ptr", pftLastSync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsEnabled() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsConnected() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
