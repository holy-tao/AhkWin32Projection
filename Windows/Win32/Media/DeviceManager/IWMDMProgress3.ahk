#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\OPAQUECOMMAND.ahk" { OPAQUECOMMAND }
#Import ".\IWMDMProgress2.ahk" { IWMDMProgress2 }

/**
 * The optional, application-implemented IWMDMProgress3 interface extends IWMDMProgress2 by providing additional input parameters to specify which event is being monitored, and to allow for context-specific information.Applications that implement this callback interface should provide an implementation for methods corresponding to IWMDMProgress and IWMDMProgress2 for backward compatibility, in addition to the new methods.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmprogress3
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IWMDMProgress3 extends IWMDMProgress2 {
    /**
     * The interface identifier for IWMDMProgress3
     * @type {Guid}
     */
    static IID := Guid("{21de01cb-3bb4-4929-b21a-17af3f80f658}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDMProgress3 interfaces
    */
    struct Vtbl extends IWMDMProgress2.Vtbl {
        Begin3    : IntPtr
        Progress3 : IntPtr
        End3      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDMProgress3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Begin3 method is called by Windows Media Device Manager to indicate that an operation is about to begin.
     * @remarks
     * The application returns S_OK to indicate that an operation should be continued and WMDM_E_USER_CANCELLED to indicate that the operation should be cancelled. If the application is using block mode and returns WMDM_E_USER_CANCELLED, then Windows Media Device Manager will return this same error to the application.
     * @param {Guid} EventId A <b>GUID</b> identifying the operation that will begin. Possible values are shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Event
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>SCP_EVENTID_ACQSECURECLOCK</td>
     * <td>Windows Media Device Manager is acquiring a secure clock from server.</td>
     * </tr>
     * <tr>
     * <td>SCP_EVENTID_NEEDTOINDIV</td>
     * <td>The device is being individualized. This is not currently used.</td>
     * </tr>
     * <tr>
     * <td>SCP_EVENTID_DRMINFO</td>
     * <td>
     * This event ID is used to notify the application with the version DRM header found in the content for each file.
     * 
     * The OPAQUECOMMAND structure returned has the <b>guidCommand</b> member set to SCP_PARAMID_DRMVERSION.
     * 
     * In addition, the OPAQUECOMMAND specifies one of the following flags:
     * 
     * WMDM_SCP_DRMINFO_NOT_DRMPROTECTED
     * 
     * WMDM_SCP_DRMINFO_V1HEADER
     * 
     * WMDM_SCP_DRMINFO_V2HEADER
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>EVENT_WMDM_CONTENT_TRANSFER</td>
     * <td>Content is being transferred to or from the device.</td>
     * </tr>
     * </table>
     * @param {Integer} dwEstimatedTicks <b>DWORD</b> specifying the estimated number of ticks that are needed for the operation to complete. The number of ticks passed in <i>dwEstimatedTicks</i> is an estimate of how many ticks are needed for the operation to complete. During the course of the operation, the <b>Progress3</b> method is called to indicate how many ticks have transpired. Applications can use the estimate to configure display mechanisms that show progress.
     * @param {Pointer<OPAQUECOMMAND>} pContext Pointer to an <a href="https://docs.microsoft.com/windows/desktop/WMDM/opaquecommand">OPAQUECOMMAND</a> structure containing a command sent to the device without being handled by Windows Media Device Manager. This parameter is optional and can be <b>NULL</b>.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
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
     * The operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Device Manager should cancel the current operation without waiting for it to finish. If the application is using block mode, then Windows Media Device Manager will return this error to the application.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmprogress3-begin3
     */
    Begin3(EventId, dwEstimatedTicks, pContext) {
        result := ComCall(7, this, Guid, EventId, "uint", dwEstimatedTicks, OPAQUECOMMAND.Ptr, pContext, "HRESULT")
        return result
    }

    /**
     * The Progress3 method is called by Windows Media Device Manager to indicate the status of an action in progress.
     * @remarks
     * The interface that owns the method that is implementing an operation calls the <b>Progress3</b> method as the operation defined by the method is carried out. The intention is that <b>Progress3</b> will be called once per estimated tick. However, the <i>dwTranspiredTicks</i> parameter must be checked on each call because the operation being performed may not guarantee one call for each estimated tick.
     * 
     * The application returns S_OK to the calling method to indicate that the operation should continue. The application returns WMDM_E_USER_CANCELLED to indicate that the operation should be canceled. If the application is using block mode and returns WMDM_E_USER_CANCELLED, then Windows Media Device Manager will return this same error to the application.
     * @param {Guid} EventId <b>GUID</b> specifying the event ID for which progress notifications are being sent. Possible values are shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Event
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>SCP_EVENTID_ACQSECURECLOCK</td>
     * <td>Windows Media Device Manager is acquiring a secure clock from server.</td>
     * </tr>
     * <tr>
     * <td>SCP_EVENTID_NEEDTOINDIV</td>
     * <td>The device is being individualized. This is not currently used.</td>
     * </tr>
     * <tr>
     * <td>SCP_EVENTID_DRMINFO</td>
     * <td>
     * This event ID is used to notify the application with the version DRM header found in the content for each file.
     * 
     * The OPAQUECOMMAND structure returned has the <i>guidCommand</i> parameter set to SCP_PARAMID_DRMVERSION.
     * 
     * In addition, the data specifies one of the following flags:
     * 
     * WMDM_SCP_DRMINFO_NOT_DRMPROTECTED
     * 
     * WMDM_SCP_DRMINFO_V1HEADER
     * 
     * WMDM_SCP_DRMINFO_V2HEADER
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>EVENT_WMDM_CONTENT_TRANSFER</td>
     * <td>Content is being transferred to or from the device.</td>
     * </tr>
     * </table>
     * @param {Integer} dwTranspiredTicks <b>DWORD</b> specifying the number of ticks that have transpired so far.
     * @param {Pointer<OPAQUECOMMAND>} pContext Pointer to an <a href="https://docs.microsoft.com/windows/desktop/WMDM/opaquecommand">OPAQUECOMMAND</a> structure containing a command sent directly to the device without being handled by Windows Media Device Manager. This parameter is optional and can be <b>NULL</b>. If the event is SCP_EVENTID_DRMINFO, the data in this parameter will have the SCP_PARAMID_DRMVERSION GUID.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
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
     * The operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Device Manager should cancel the current operation without waiting for it to finish. If the application is using block mode, then Windows Media Device Manager will return this error to the application.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmprogress3-progress3
     */
    Progress3(EventId, dwTranspiredTicks, pContext) {
        result := ComCall(8, this, Guid, EventId, "uint", dwTranspiredTicks, OPAQUECOMMAND.Ptr, pContext, "HRESULT")
        return result
    }

    /**
     * The End3 method is called by Windows Media Device Manager to indicate that an operation has finished.
     * @remarks
     * The interface that owns the method that is implementing an operation calls <b>End3</b> when the operation defined by the method is completed.
     * @param {Guid} EventId A <b>GUID</b> specifying the event that is ending. Possible values are shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Event
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>SCP_EVENTID_ACQSECURECLOCK</td>
     * <td>Windows Media Device Manager is acquiring a secure clock from server.</td>
     * </tr>
     * <tr>
     * <td>SCP_EVENTID_NEEDTOINDIV</td>
     * <td>The device is being individualized. This is not currently used.</td>
     * </tr>
     * <tr>
     * <td>SCP_EVENTID_DRMINFO</td>
     * <td>
     * This event ID is used to notify the application with the version DRM header found in the content for each file.
     * 
     * The OPAQUECOMMAND structure returned has the <b>guidCommand</b> member set to SCP_PARAMID_DRMVERSION.
     * 
     * In addition, the data specifies one of the following flags:
     * 
     * WMDM_SCP_DRMINFO_NOT_DRMPROTECTED
     * 
     * WMDM_SCP_DRMINFO_V1HEADER
     * 
     * WMDM_SCP_DRMINFO_V2HEADER
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>EVENT_WMDM_CONTENT_TRANSFER</td>
     * <td>Content is being transferred to or from the device.</td>
     * </tr>
     * </table>
     * @param {HRESULT} hrCompletionCode <b>HRESULT</b> specifying the completion code of the operation that was in progress. The <i>hrCompletionCode</i> parameter is the return code of the operation that ended. This parameter can be any <b>HRESULT</b>, including standard COM error codes, Win32 error codes converted to <b>HRESULT</b>, or Windows Media Device Manager error codes.
     * @param {Pointer<OPAQUECOMMAND>} pContext Pointer to an <a href="https://docs.microsoft.com/windows/desktop/WMDM/opaquecommand">OPAQUECOMMAND</a> structure containing a command sent directly to the device without being handled by Windows Media Device Manager. This parameter is optional and can be <b>NULL</b>. The context structure is a way for the component to send any relevant data with the event to the application. The component sending this structure should define how the application can interpret this data structure.
     * @returns {HRESULT} Windows Media Device Manager ignores any return code returned by the <b>End3</b> method because the current operation is finished or cancelled before this method is called.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmprogress3-end3
     */
    End3(EventId, hrCompletionCode, pContext) {
        result := ComCall(9, this, Guid, EventId, "int", hrCompletionCode, OPAQUECOMMAND.Ptr, pContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMDMProgress3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin3 := CallbackCreate(GetMethod(implObj, "Begin3"), flags, 4)
        this.vtbl.Progress3 := CallbackCreate(GetMethod(implObj, "Progress3"), flags, 4)
        this.vtbl.End3 := CallbackCreate(GetMethod(implObj, "End3"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin3)
        CallbackFree(this.vtbl.Progress3)
        CallbackFree(this.vtbl.End3)
    }
}
