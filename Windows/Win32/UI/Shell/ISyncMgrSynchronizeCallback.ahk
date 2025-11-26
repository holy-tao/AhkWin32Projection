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
     * Called by the registered application's handler before or after its ShowProperties operation is completed.
     * @param {HRESULT} hr Type: <b>HRESULT</b>
     * 
     * Whether the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-showproperties">ShowProperties</a> was successful.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
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
     * Call was completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronizecallback-showpropertiescompleted
     */
    ShowPropertiesCompleted(hr) {
        result := ComCall(3, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * Called by a registered handler of an application after the PrepareForSync method is complete.
     * @param {HRESULT} hr Type: <b>HRESULT</b>
     * 
     * The return value of the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-prepareforsync">PrepareForSync</a> method. If S_OK is returned, the synchronization manager calls <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-synchronize">Synchronize</a> for the item. If the <b>HRESULT</b> is set to anything other than S_OK, the synchronization manager releases the handler without calling the <b>Synchronize</b> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
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
     * The call is completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronizecallback-prepareforsynccompleted
     */
    PrepareForSyncCompleted(hr) {
        result := ComCall(4, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * Called by an application when its Synchronize method is complete.
     * @param {HRESULT} hr Type: <b>HRESULT</b>
     * 
     * The returned result from the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-synchronize">Synchronize</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
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
     * The call is completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronizecallback-synchronizecompleted
     */
    SynchronizeCompleted(hr) {
        result := ComCall(5, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * Called by the registered application's handler before or after its PrepareForSync operation has been completed.
     * @param {HRESULT} hr Type: <b>HRESULT</b>
     * 
     * Whether <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-showerror">ShowError</a> was successful. This value is S_SYNCMGR_RETRYSYNC if the registered application's handler requires SyncMgr to retry the synchronization. When this value is returned to SyncMgr both the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-prepareforsync">PrepareForSync</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-synchronize">Synchronize</a> methods are called again.
     * @param {Integer} cItems Type: <b>ULONG</b>
     * 
     * The number of items in the array pointed to by the <i>pItemIDs</i> parameter. This parameter is ignored unless <i>hrResult</i> is S_SYNCMGR_RETRYSYNC.
     * @param {Pointer<Guid>} pItemIDs Type: <b>const GUID*</b>
     * 
     * A pointer to the array of item IDs to pass to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-prepareforsync">PrepareForSync</a> in the event of a retry. This parameter is ignored unless <i>hrResult</i> is S_SYNCMGR_RETRYSYNC.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
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
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronizecallback-showerrorcompleted
     */
    ShowErrorCompleted(hr, cItems, pItemIDs) {
        result := ComCall(6, this, "int", hr, "uint", cItems, "ptr", pItemIDs, "HRESULT")
        return result
    }

    /**
     * Called by the registered application before and after any dialog boxes are displayed from within the PrepareForSync and Synchronize methods.
     * @param {BOOL} fEnable Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the registered application is requesting permission to display a dialog box or <b>FALSE</b> if the registered application has finished displaying a dialog box.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
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
     * Continue the synchronization.
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
     * The dialog box should not be displayed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronizecallback-enablemodeless
     */
    EnableModeless(fEnable) {
        result := ComCall(7, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * Called by a registered application to update the progress information and determine whether an operation should continue.
     * @param {Pointer<Guid>} ItemID Type: <b>REFGUID</b>
     * 
     * A reference to the item identifier for an item that is being updated.
     * @param {Pointer<SYNCMGRPROGRESSITEM>} pSyncProgressItem Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ns-mobsync-syncmgrprogressitem">SYNCMGRPROGRESSITEM</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ns-mobsync-syncmgrprogressitem">SYNCMGRPROGRESSITEM</a> structure that contains the updated progress information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
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
     * Continues the synchronization.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_SYNCMGR_CANCELITEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cancels the synchronization on a specified item, as soon as possible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_SYNCMGR_CANCELALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cancels the synchronization on all items that are associated with this application, as soon as possible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronizecallback-progress
     */
    Progress(ItemID, pSyncProgressItem) {
        result := ComCall(8, this, "ptr", ItemID, "ptr", pSyncProgressItem, "HRESULT")
        return result
    }

    /**
     * Called by a registered application to log information, warning, or an error message into the error tab on the synchronization manager status dialog box.
     * @param {Integer} dwErrorLevel Type: <b>DWORD</b>
     * 
     * The error level. Values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrloglevel">SYNCMGRLOGLEVEL</a> enumeration.
     * @param {PWSTR} pszErrorText Type: <b>LPCWSTR</b>
     * 
     * A pointer to error text to be displayed in the error tab.
     * @param {Pointer<SYNCMGRLOGERRORINFO>} pSyncLogError Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ns-mobsync-syncmgrlogerrorinfo">SYNCMGRLOGERRORINFO</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ns-mobsync-syncmgrlogerrorinfo">SYNCMGRLOGERRORINFO</a> structure that contains additional error information. Registered applications that do not provide this data can pass <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values E_INVALIDARG, E_UNEXPECTED, and E_OUTOFMEMORY, and  the following:
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
     * The error information is logged successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronizecallback-logerror
     */
    LogError(dwErrorLevel, pszErrorText, pSyncLogError) {
        pszErrorText := pszErrorText is String ? StrPtr(pszErrorText) : pszErrorText

        result := ComCall(9, this, "uint", dwErrorLevel, "ptr", pszErrorText, "ptr", pSyncLogError, "HRESULT")
        return result
    }

    /**
     * Called by the registered application's handler to delete a previously logged ErrorInformation, warning, or error message in the error tab on the synchronization manager status dialog box.
     * @param {Pointer<Guid>} ErrorID Type: <b>REFGUID</b>
     * 
     * The LogError to be deleted. If <i>ErrorID</i> is GUID_NULL all errors logged by the instance of the registered application's handler will be deleted.
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
     * The item was successfully deleted from the log.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronizecallback-deletelogerror
     */
    DeleteLogError(ErrorID, dwReserved) {
        result := ComCall(10, this, "ptr", ErrorID, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * Called by the registered application's handler when a network connection is required.
     * @param {PWSTR} pwszConnection Type: <b>LPCWSTR</b>
     * 
     * The name of the connection to dial.
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
     * The connection was successfully established.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mobsync/nf-mobsync-isyncmgrsynchronizecallback-establishconnection
     */
    EstablishConnection(pwszConnection, dwReserved) {
        pwszConnection := pwszConnection is String ? StrPtr(pwszConnection) : pwszConnection

        result := ComCall(11, this, "ptr", pwszConnection, "uint", dwReserved, "HRESULT")
        return result
    }
}
