#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SYNCMGRLOGERRORINFO.ahk" { SYNCMGRLOGERRORINFO }
#Import ".\SYNCMGRPROGRESSITEM.ahk" { SYNCMGRPROGRESSITEM }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that manage the synchronization process.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * This interface is implemented by the synchronization manager to receive status, error, and progress information and display the user interface during the synchronization process.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Applications should call the methods of this interface as often as possible and must call it before starting each new ItemID to check whether the user has canceled an individual item.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/nn-mobsync-isyncmgrsynchronizecallback
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISyncMgrSynchronizeCallback extends IUnknown {
    /**
     * The interface identifier for ISyncMgrSynchronizeCallback
     * @type {Guid}
     */
    static IID := Guid("{6295df41-35ee-11d1-8707-00c04fd93327}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMgrSynchronizeCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ShowPropertiesCompleted : IntPtr
        PrepareForSyncCompleted : IntPtr
        SynchronizeCompleted    : IntPtr
        ShowErrorCompleted      : IntPtr
        EnableModeless          : IntPtr
        Progress                : IntPtr
        LogError                : IntPtr
        DeleteLogError          : IntPtr
        EstablishConnection     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMgrSynchronizeCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the registered application's handler before or after its ShowProperties operation is completed.
     * @remarks
     * It is acceptable for the registered application's handler to call this method before returning from the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-showproperties">ShowProperties</a> method.
     * 
     * This method should not be called if the registered application's handler does not return a success code from the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-showproperties">ShowProperties</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-showpropertiescompleted
     */
    ShowPropertiesCompleted(hr) {
        result := ComCall(3, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * Called by a registered handler of an application after the PrepareForSync method is complete.
     * @remarks
     * A registered handler of an application should return as soon as possible from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-prepareforsync">PrepareForSync</a> method, and then call this method to notify the synchronization manager  that the registered application is preparing for synchronization.
     * 
     * It is acceptable for the registered handler of an application to call this method before returning from the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-prepareforsync">PrepareForSync</a> method.
     * 
     * The registered handler of an application should not call this method if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-prepareforsync">PrepareForSync</a> method returns any value that is different from S_OK.
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
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-prepareforsynccompleted
     */
    PrepareForSyncCompleted(hr) {
        result := ComCall(4, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * Called by an application when its Synchronize method is complete.
     * @remarks
     * A registered handler of an application should return from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-synchronize">Synchronize</a> method as soon as possible, and then call this method to notify the synchronization manager that the synchronization process is complete.
     * 
     * It is acceptable for a registered handler of an application to call this method before returning from the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-synchronize">Synchronize</a> method.
     * 
     * However, the registered handler of an application should not call this method if the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-synchronize">Synchronize</a> method returns any value that is different from S_OK.
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
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-synchronizecompleted
     */
    SynchronizeCompleted(hr) {
        result := ComCall(5, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * Called by the registered application's handler before or after its PrepareForSync operation has been completed.
     * @remarks
     * The <i>pItemIDs</i> parameter is an [in] parameter and the calling function owns the memory pointed to by it. SyncMgr makes a copy of the array before returning.
     * 
     * The registered application's handler should return from the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-showerror">ShowError</a> method as soon as possible and then call this method to notify SyncMgr that it has completed processing the <b>ShowError</b> call.
     * 
     * It is acceptable for the registered application's handler to call this method 
     * before returning from the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-showerror">ShowError</a> method.
     * 
     * The registered application's handler should not call this method unless a success code is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/nf-mobsync-isyncmgrsynchronize-showerror">ShowError</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-showerrorcompleted
     */
    ShowErrorCompleted(hr, cItems, pItemIDs) {
        result := ComCall(6, this, "int", hr, "uint", cItems, Guid.Ptr, pItemIDs, "HRESULT")
        return result
    }

    /**
     * Called by the registered application before and after any dialog boxes are displayed from within the PrepareForSync and Synchronize methods.
     * @remarks
     * To request permission to display a dialog box, the registered application first calls <b>ISyncMgrSynchronizeCallback::EnableModeless</b> with <i>fEnable</i> set to <b>TRUE</b>. If S_OK is returned, the registered application may display the dialog box. Once the dialog box has been displayed, the registered application must call <b>ISyncMgrSynchronizeCallback::EnableModeless</b> with <i>fEnable</i> set to <b>FALSE</b> to notify SyncMgr that other items may now display user interface elements.
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
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-enablemodeless
     */
    EnableModeless(fEnable) {
        result := ComCall(7, this, BOOL, fEnable, "HRESULT")
        return result
    }

    /**
     * Called by a registered application to update the progress information and determine whether an operation should continue.
     * @remarks
     * Registered applications should call this method to provide normal feedback even when the <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrflag">SYNCMGRFLAG_MAYBOTHERUSER</a> flag is set.
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
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-progress
     */
    Progress(ItemID, pSyncProgressItem) {
        result := ComCall(8, this, Guid.Ptr, ItemID, SYNCMGRPROGRESSITEM.Ptr, pSyncProgressItem, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-logerror
     */
    LogError(dwErrorLevel, pszErrorText, pSyncLogError) {
        pszErrorText := pszErrorText is String ? StrPtr(pszErrorText) : pszErrorText

        result := ComCall(9, this, "uint", dwErrorLevel, "ptr", pszErrorText, SYNCMGRLOGERRORINFO.Ptr, pSyncLogError, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-deletelogerror
     */
    DeleteLogError(ErrorID, dwReserved) {
        result := ComCall(10, this, Guid.Ptr, ErrorID, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * Called by the registered application's handler when a network connection is required.
     * @remarks
     * SyncMgr should use the default autodial connection if <i>pwszConnection</i> is <b>NULL</b>.
     * 
     * When an instance of <b>EstablishConnection</b> is called by a handler, SyncMgr tries to establish the connection. If a subsequent 
     * <b>EstablishConnection</b> is called then SyncMgr attempts the new connection without causing the previous connection to stop responding. All connections remain until all handlers have finished synchronizing. After all handlers have synchronized, then any opened connections are closed by SyncMgr.
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
     * @see https://learn.microsoft.com/windows/win32/api/mobsync/nf-mobsync-isyncmgrsynchronizecallback-establishconnection
     */
    EstablishConnection(pwszConnection, dwReserved) {
        pwszConnection := pwszConnection is String ? StrPtr(pwszConnection) : pwszConnection

        result := ComCall(11, this, "ptr", pwszConnection, "uint", dwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncMgrSynchronizeCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShowPropertiesCompleted := CallbackCreate(GetMethod(implObj, "ShowPropertiesCompleted"), flags, 2)
        this.vtbl.PrepareForSyncCompleted := CallbackCreate(GetMethod(implObj, "PrepareForSyncCompleted"), flags, 2)
        this.vtbl.SynchronizeCompleted := CallbackCreate(GetMethod(implObj, "SynchronizeCompleted"), flags, 2)
        this.vtbl.ShowErrorCompleted := CallbackCreate(GetMethod(implObj, "ShowErrorCompleted"), flags, 4)
        this.vtbl.EnableModeless := CallbackCreate(GetMethod(implObj, "EnableModeless"), flags, 2)
        this.vtbl.Progress := CallbackCreate(GetMethod(implObj, "Progress"), flags, 3)
        this.vtbl.LogError := CallbackCreate(GetMethod(implObj, "LogError"), flags, 4)
        this.vtbl.DeleteLogError := CallbackCreate(GetMethod(implObj, "DeleteLogError"), flags, 3)
        this.vtbl.EstablishConnection := CallbackCreate(GetMethod(implObj, "EstablishConnection"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShowPropertiesCompleted)
        CallbackFree(this.vtbl.PrepareForSyncCompleted)
        CallbackFree(this.vtbl.SynchronizeCompleted)
        CallbackFree(this.vtbl.ShowErrorCompleted)
        CallbackFree(this.vtbl.EnableModeless)
        CallbackFree(this.vtbl.Progress)
        CallbackFree(this.vtbl.LogError)
        CallbackFree(this.vtbl.DeleteLogError)
        CallbackFree(this.vtbl.EstablishConnection)
    }
}
