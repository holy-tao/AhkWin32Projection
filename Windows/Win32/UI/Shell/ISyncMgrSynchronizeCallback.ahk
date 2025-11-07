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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowPropertiesCompleted", "PrepareForSyncCompleted", "SynchronizeCompleted", "ShowErrorCompleted", "EnableModeless", "Progress", "LogError", "DeleteLogError", "EstablishConnection"]

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-showpropertiescompleted
     */
    ShowPropertiesCompleted(hr) {
        result := ComCall(3, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-prepareforsynccompleted
     */
    PrepareForSyncCompleted(hr) {
        result := ComCall(4, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-synchronizecompleted
     */
    SynchronizeCompleted(hr) {
        result := ComCall(5, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @param {Integer} cItems 
     * @param {Pointer<Guid>} pItemIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-showerrorcompleted
     */
    ShowErrorCompleted(hr, cItems, pItemIDs) {
        result := ComCall(6, this, "int", hr, "uint", cItems, "ptr", pItemIDs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-enablemodeless
     */
    EnableModeless(fEnable) {
        result := ComCall(7, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ItemID 
     * @param {Pointer<SYNCMGRPROGRESSITEM>} pSyncProgressItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-progress
     */
    Progress(ItemID, pSyncProgressItem) {
        result := ComCall(8, this, "ptr", ItemID, "ptr", pSyncProgressItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwErrorLevel 
     * @param {PWSTR} pszErrorText 
     * @param {Pointer<SYNCMGRLOGERRORINFO>} pSyncLogError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-logerror
     */
    LogError(dwErrorLevel, pszErrorText, pSyncLogError) {
        pszErrorText := pszErrorText is String ? StrPtr(pszErrorText) : pszErrorText

        result := ComCall(9, this, "uint", dwErrorLevel, "ptr", pszErrorText, "ptr", pSyncLogError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ErrorID 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-deletelogerror
     */
    DeleteLogError(ErrorID, dwReserved) {
        result := ComCall(10, this, "ptr", ErrorID, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszConnection 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-establishconnection
     */
    EstablishConnection(pwszConnection, dwReserved) {
        pwszConnection := pwszConnection is String ? StrPtr(pwszConnection) : pwszConnection

        result := ComCall(11, this, "ptr", pwszConnection, "uint", dwReserved, "HRESULT")
        return result
    }
}
