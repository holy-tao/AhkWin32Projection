#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTypeLabel", "GetComment", "GetLastSyncTime", "IsEnabled", "IsConnected"]

    /**
     * Gets a label for the item type. This typically provides the model of the device or an equivalent item-specific identity string.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a buffer containing the label string.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsynciteminfo-gettypelabel
     */
    GetTypeLabel() {
        result := ComCall(3, this, "ptr*", &ppszTypeLabel := 0, "HRESULT")
        return ppszTypeLabel
    }

    /**
     * Gets a string that contains commentary regarding the item.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to a buffer containing the comment string. This string is of maximum length MAX_SYNCMGR_NAME including the terminating null character.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsynciteminfo-getcomment
     */
    GetComment() {
        result := ComCall(4, this, "ptr*", &ppszComment := 0, "HRESULT")
        return ppszComment
    }

    /**
     * Gets the date and time when the item was last synchronized.
     * @returns {FILETIME} Type: <b>FILETIME*</b>
     * 
     * When this method returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure containing the date and time information.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsynciteminfo-getlastsynctime
     */
    GetLastSyncTime() {
        pftLastSync := FILETIME()
        result := ComCall(5, this, "ptr", pftLastSync, "HRESULT")
        return pftLastSync
    }

    /**
     * Generates a value that indicates whether the item is enabled.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the item is enabled; otherwise, S_FALSE.
     *                     
     *                     
     * 
     * If the item wants Sync Center to maintain the current state, it can return E_NOTIMPL. If any other value is returned, Sync Center sets the item's enabled state to the last known value and enables or disables the associated tasks as appropriate.
     * 
     * If either the SYNCMGR_ICM_QUERY_BEFORE_ENABLE or SYNCMGR_ICM_QUERY_BEFORE_DISABLE flags are set in the mask returned from <a href="/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getcapabilities">GetCapabilities</a>, the handler must manage its own enabled state and therefore must return either S_OK or S_FALSE. Any other return value will be considered an error.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsynciteminfo-isenabled
     */
    IsEnabled() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Generates a value that indicates whether the item�typically some type of external device�is connected.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the item is connected; otherwise, S_FALSE. An error returned by this method will be interpreted as S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-isyncmgrsynciteminfo-isconnected
     */
    IsConnected() {
        result := ComCall(7, this, "int")
        return result
    }
}
