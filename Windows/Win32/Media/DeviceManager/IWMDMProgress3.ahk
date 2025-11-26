#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMProgress2.ahk

/**
 * The optional, application-implemented IWMDMProgress3 interface extends IWMDMProgress2 by providing additional input parameters to specify which event is being monitored, and to allow for context-specific information.Applications that implement this callback interface should provide an implementation for methods corresponding to IWMDMProgress and IWMDMProgress2 for backward compatibility, in addition to the new methods.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmprogress3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMProgress3 extends IWMDMProgress2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMProgress3
     * @type {Guid}
     */
    static IID => Guid("{21de01cb-3bb4-4929-b21a-17af3f80f658}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin3", "Progress3", "End3"]

    /**
     * The Begin3 method is called by Windows Media Device Manager to indicate that an operation is about to begin.
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
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmprogress3-begin3
     */
    Begin3(EventId, dwEstimatedTicks, pContext) {
        result := ComCall(7, this, "ptr", EventId, "uint", dwEstimatedTicks, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * The Progress3 method is called by Windows Media Device Manager to indicate the status of an action in progress.
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
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmprogress3-progress3
     */
    Progress3(EventId, dwTranspiredTicks, pContext) {
        result := ComCall(8, this, "ptr", EventId, "uint", dwTranspiredTicks, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * The End3 method is called by Windows Media Device Manager to indicate that an operation has finished.
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
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmprogress3-end3
     */
    End3(EventId, hrCompletionCode, pContext) {
        result := ComCall(9, this, "ptr", EventId, "int", hrCompletionCode, "ptr", pContext, "HRESULT")
        return result
    }
}
