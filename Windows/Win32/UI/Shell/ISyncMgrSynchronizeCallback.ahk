#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that manage the synchronization process.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * This interface is implemented by the synchronization manager to receive status, error, and progress information and display the user interface during the synchronization process.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * Applications should call the methods of this interface as often as possible and must call it before starting each new ItemID to check whether the user has canceled an individual item.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mobsync/nn-mobsync-isyncmgrsynchronizecallback
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISyncMgrSynchronizeCallback extends IUnknown{
    /**
     * The interface identifier for ISyncMgrSynchronizeCallback
     * @type {Guid}
     */
    static IID => Guid("{6295df41-35ee-11d1-8707-00c04fd93327}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    ShowPropertiesCompleted(hr) {
        result := ComCall(3, this, "int", hr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    PrepareForSyncCompleted(hr) {
        result := ComCall(4, this, "int", hr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    SynchronizeCompleted(hr) {
        result := ComCall(5, this, "int", hr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @param {Integer} cItems 
     * @param {Pointer<Guid>} pItemIDs 
     * @returns {HRESULT} 
     */
    ShowErrorCompleted(hr, cItems, pItemIDs) {
        result := ComCall(6, this, "int", hr, "uint", cItems, "ptr", pItemIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    EnableModeless(fEnable) {
        result := ComCall(7, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ItemID 
     * @param {Pointer<SYNCMGRPROGRESSITEM>} pSyncProgressItem 
     * @returns {HRESULT} 
     */
    Progress(ItemID, pSyncProgressItem) {
        result := ComCall(8, this, "ptr", ItemID, "ptr", pSyncProgressItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwErrorLevel 
     * @param {PWSTR} pszErrorText 
     * @param {Pointer<SYNCMGRLOGERRORINFO>} pSyncLogError 
     * @returns {HRESULT} 
     */
    LogError(dwErrorLevel, pszErrorText, pSyncLogError) {
        pszErrorText := pszErrorText is String ? StrPtr(pszErrorText) : pszErrorText

        result := ComCall(9, this, "uint", dwErrorLevel, "ptr", pszErrorText, "ptr", pSyncLogError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ErrorID 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    DeleteLogError(ErrorID, dwReserved) {
        result := ComCall(10, this, "ptr", ErrorID, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszConnection 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    EstablishConnection(pwszConnection, dwReserved) {
        pwszConnection := pwszConnection is String ? StrPtr(pwszConnection) : pwszConnection

        result := ComCall(11, this, "ptr", pwszConnection, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
