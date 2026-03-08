#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates and manages a communication channel used by applications and components that are hosted by the print spooler.
 * @remarks
 * For an application to receive notifications from a Print Spooler-hosted component, it must provide an <b>IPrintAsyncNotifyCallback</b> object when it registers for notifications.
 * 
 * A Print Spooler-hosted component that opens a bidirectional communication channel with a listening application must provide an <b>IPrintAsyncNotifyCallback</b> object.
 * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nn-prnasnot-iprintasyncnotifycallback
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintAsyncNotifyCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintAsyncNotifyCallback
     * @type {Guid}
     */
    static IID => Guid("{7def34c1-9d92-4c99-b3b3-db94a9d4191b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnEventNotify", "ChannelClosed"]

    /**
     * Alerts a listener that a notification is available on a specified channel. This method is called by the print system.
     * @remarks
     * To deliver a notification, the print spooler will call the <b>OnEventNotify</b> method of the <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nn-prnasnot-iprintasyncnotifycallback">IPrintAsyncNotifyCallback</a> object provided by the listening application at the time it registered for notifications. For unidirectional notifications, <i>pChannel</i> is <b>NULL</b>. For bidirectional channels, <i>pChannel</i> points to an <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nn-prnasnot-iprintasyncnotifychannel">IPrintAsyncNotifyChannel</a> to be used by a listening application to send a notification in response. The listener will do this by calling the <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-sendnotification">SendNotification</a> method of the <b>IPrintAsyncNotifyChannel</b>.
     * @param {IPrintAsyncNotifyChannel} pChannel A pointer to the channel used by the sender and the listener.
     * @param {IPrintAsyncNotifyDataObject} pData A pointer to the object that contains the notification data and its size and type.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Severity</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>SUCCESS</td>
     * <td>The function completed successfully.</td>
     * </tr>
     * <tr>
     * <td>INTERNAL_NOTIFICATION_QUEUE_IS_FULL</td>
     * <td>ERROR</td>
     * <td>The Print Spooler cannot hold any more queued notifications. By default, the maximum size of the queue is 10 notifications. When this error is returned, the listening application is not processing the notifications as fast as they are being sent. This notification should either be resent or discarded. </td>
     * </tr>
     * </table>
     *  
     * 
     * The return values are COM error codes. Because this function might complete the operation successfully yet return an HRESULT other than S_OK you should use the SUCCEEDED or FAILED macro to determine the success of the call. To get the specific HRESULT that was returned by the function, use the HRESULT_CODE macro.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for other possible return values.
     * 
     * For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * 
     * The following code example shows how these macros can be used to evaluate the return value.
     * 
     * 
     * ```cpp
     * if (SUCCEEDED(hr)){
     *   // Call was successful 
     * }
     * 
     * if (FAILED(hr)) {
     *   // Call failed 
     * }
     * 
     * if (FAILED(hr)) {
     *   // Call failed, check HRESULT value returned
     *   switch (HRESULT_CODE(hr)){
     *     case INTERNAL_NOTIFICATION_QUEUE_IS_FULL:
     *       // Some action 
     *       break;
     *     default:
     *       // Default action 
     *       break;
     *   }
     * } else {
     *   // Call succeeded 
     * }
     * 
     * ```
     * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-iprintasyncnotifycallback-oneventnotify
     */
    OnEventNotify(pChannel, pData) {
        result := ComCall(3, this, "ptr", pChannel, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Advises one member of a communication channel to notify the other member that the channel is being closed.
     * @remarks
     * When a component that is hosted by the print spooler closes a communication channel with a listening application, the component should call the <b>ChannelClosed</b> method of the <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nn-prnasnot-iprintasyncnotifycallback">IPrintAsyncNotifyCallback</a> object, which the listening application provided at the time it registered for notifications. If the print server crashes, the print spooler will attempt to call the <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifycallback-oneventnotify">OnEventNotify</a> method of the <b>IPrintAsyncNotifyCallback</b> object provided by the listening application. It will send a notification of type NOTIFICATION_RELEASE.
     * 
     * If the listening application closes a bidirectional communication channel, it should call the <b>ChannelClosed</b> method of the <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nn-prnasnot-iprintasyncnotifycallback">IPrintAsyncNotifyCallback</a> object provided by the component when it created the channel. If the listening application crashes, the print spooler will call the <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifycallback-oneventnotify">OnEventNotify</a> method of the <b>IPrintAsyncNotifyCallback</b> object provided by the  component that is hosted by the print spooler. It will send a notification of type NOTIFICATION_RELEASE.
     * @param {IPrintAsyncNotifyChannel} pChannel A pointer to the channel used by the sender and the listener.
     * @param {IPrintAsyncNotifyDataObject} pData A pointer to the object that contains the notification data or response.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Severity</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>SUCCESS</td>
     * <td>This function completed successfully.</td>
     * </tr>
     * <tr>
     * <td>CHANNEL_ALREADY_CLOSED</td>
     * <td>ERROR</td>
     * <td>The channel has already been closed.</td>
     * </tr>
     * </table>
     *  
     * 
     * The return values are COM error codes. Because this function might complete the operation successfully yet return an HRESULT other than S_OK you should use the SUCCEEDED or FAILED macro to determine the success of the call. To get the specific HRESULT that was returned by the function, use the HRESULT_CODE macro.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for other possible return values.
     * 
     * For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * 
     * The following code example shows how these macros can be used to evaluate the return value.
     * 
     * 
     * ```cpp
     * 
     * if (SUCCEEDED(hr)){
     *   // Call was successful 
     * }
     * 
     * if (FAILED(hr)) {
     *   // Call failed 
     * }
     * 
     * if (FAILED(hr)) {
     *   // Call failed, check HRESULT value returned
     *   switch (HRESULT_CODE(hr)){
     *     case CHANNEL_ALREADY_CLOSED:
     *       // Some action 
     *       break;
     *     default:
     *       // Default action 
     *       break;
     *   }
     * } else {
     *   // Call succeeded 
     * }
     * 
     * ```
     * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-iprintasyncnotifycallback-channelclosed
     */
    ChannelClosed(pChannel, pData) {
        result := ComCall(4, this, "ptr", pChannel, "ptr", pData, "HRESULT")
        return result
    }
}
