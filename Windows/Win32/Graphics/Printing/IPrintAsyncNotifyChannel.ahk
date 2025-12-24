#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a communication channel that components that are hosted by the print spooler use to send notifications to applications. If the channel is bidirectional, applications can use the same channel to send responses back to the component.
 * @remarks
 * 
 * Objects implementing this interface are created by the Print Spooler in response to a call of <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-createprintasyncnotifychannel">CreatePrintAsyncNotifyChannel</a> by a Print Spooler-hosted component.
 * 
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IPrintAsyncNotifyChannel::Release</a> only:
 * 
 * <ol>
 * <li>if it is an explicit match to an earlier <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IPrintAsyncNotifyChannel::AddRef</a> call.</li>
 * <li>if the channel is a UniDirectional channel and you are abandoning the pointer received in a successful call to <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-createprintasyncnotifychannel">CreatePrintAsyncNotifyChannel</a>.</li>
 * <li>if, after you created a BiDirectional channel or in the implementation of <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifycallback-oneventnotify">IPrintAsyncNotifyCallback::OnEventNotify</a> and:<ol>
 * <li>you did not call <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-sendnotification">IPrintAsyncNotifyChannel::SendNotification</a> or <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-closechannel">IPrintAsyncNotifyChannel::CloseChannel</a> OR</li>
 * <li>you did not retry a call to <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-sendnotification">IPrintAsyncNotifyChannel::SendNotification</a> or <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-closechannel">IPrintAsyncNotifyChannel::CloseChannel</a> that failed OR</li>
 * <li>on the server side, you did not retry a call to <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-sendnotification">IPrintAsyncNotifyChannel::SendNotification</a> that succeeded with the return value NO_LISTENER OR</li>
 * <li>on the client side, you did not retry a call to <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-sendnotification">IPrintAsyncNotifyChannel::SendNotification</a> that succeeded with return value CHANNEL_ACQUIRED.</li>
 * </ol>
 * </li>
 * </ol>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//prnasnot/nn-prnasnot-iprintasyncnotifychannel
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintAsyncNotifyChannel extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintAsyncNotifyChannel
     * @type {Guid}
     */
    static IID => Guid("{4a5031b1-1f3f-4db0-a462-4530ed8b0451}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendNotification", "CloseChannel"]

    /**
     * Sends a notification from a component that is hosted by the print spooler to one or more listening applications, or sends a response from an application back to a component.
     * @param {IPrintAsyncNotifyDataObject} pData A pointer to the content of the notification and its size and type.
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
     * <td>ASYNC_CALL_ALREADY_PARKED</td>
     * <td>ERROR</td>
     * <td>A notification cannot be sent because the recipient has not consumed the previous notification. </td>
     * </tr>
     * <tr>
     * <td>ASYNC_CALL_IN_PROGRESS</td>
     * <td>ERROR</td>
     * <td>The channel is busy with another notification or response.</td>
     * </tr>
     * <tr>
     * <td>ASYNC_NOTIFICATION_FAILURE</td>
     * <td>ERROR</td>
     * <td> None of the listeners on this channel are configured to receive this notification type or there was a problem allocating the resources necessary to complete this call.</td>
     * </tr>
     * <tr>
     * <td>CHANNEL_ACQUIRED</td>
     * <td>ERROR</td>
     * <td>Another listener has acquired this channel. The notification was not sent. The original listener will no longer receive notifications.</td>
     * </tr>
     * <tr>
     * <td>CHANNEL_ALREADY_CLOSED</td>
     * <td>ERROR</td>
     * <td>The notification could not be sent because the channel was closed prior to this call.</td>
     * </tr>
     * <tr>
     * <td>CHANNEL_NOT_OPENED</td>
     * <td>ERROR</td>
     * <td>The notification could not be sent because the channel was not opened prior to this call.</td>
     * </tr>
     * <tr>
     * <td>CHANNEL_WAITING_FOR_CLIENT_NOTIFICATION</td>
     * <td>ERROR</td>
     * <td>A notification cannot be sent because a response to the last notification has not been received.</td>
     * </tr>
     * <tr>
     * <td>INVALID_NOTIFICATION_TYPE</td>
     * <td>ERROR</td>
     * <td>The specified notification type is invalid.</td>
     * </tr>
     * <tr>
     * <td>MAX_NOTIFICATION_SIZE_EXCEEDED</td>
     * <td>ERROR</td>
     * <td>The maximum size of the notification data has been exceeded. By default, the maximum data size allowed is 10 megabytes. </td>
     * </tr>
     * <tr>
     * <td>NO_LISTENERS</td>
     * <td>SUCCESS</td>
     * <td>Indicates that there are no registered listening applications.</td>
     * </tr>
     * <tr>
     * <td>UNIRECTIONAL_NOTIFICATION_LOST</td>
     * <td>SUCCESS</td>
     * <td>One or more listeners did not receive this notification, but at least one listener did receive this notification. </td>
     * </tr>
     * </table>
     *  
     * 
     * The return values are COM error codes. Because this function might complete the operation successfully yet return an HRESULT other than S_OK you should use the SUCCEEDED or FAILED macro to determine the success of the call. To get the specific HRESULT that was returned by the function, use the HRESULT_CODE macro. The following code example shows how these macros can be used.
     * 
     * See <a href="/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for other possible return values.
     * 
     * For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * 
     * 
     * ```cpp
     * if (SUCCEEDED(hr)) {
     *   // Call succeeded, check HRESULT value returned
     *   switch (HRESULT_CODE(hr)){
     *     case S_OK:
     *       // Some action 
     *       break;
     *     case NO_LISTENERS:
     *       // Some action 
     *       break;
     *     case UNIRECTIONAL_NOTIFICATION_LOST:
     *       // Some action 
     *       break;
     *     default:
     *       // Default action 
     *       break;
     *   }
     * } else {
     *   // Call failed, check HRESULT value returned
     *   switch (HRESULT_CODE(hr)){
     *     case ASYNC_NOTIFICATION_FAILURE:
     *       // Some action 
     *       break;
     *     case CHANNEL_ALREADY_CLOSED:
     *       // Some action 
     *       break;
     *     case CHANNEL_NOT_OPENED:
     *       // Some action 
     *       break;
     *     //
     *     // ... Test for other error cases
     *     //    
     *     default:
     *       // Default action 
     *       break;
     *   }
     * }
     * 
     * ```
     * @see https://docs.microsoft.com/windows/win32/api//prnasnot/nf-prnasnot-iprintasyncnotifychannel-sendnotification
     */
    SendNotification(pData) {
        result := ComCall(3, this, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Closes the channel.
     * @param {IPrintAsyncNotifyDataObject} pData Pointer to a notification that specifies why the channel closed. This pointer can be <b>NULL</b>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Severity</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * S_OK
     * 
     * </td>
     * <td>
     * SUCCESS
     * 
     * </td>
     * <td>
     * The function completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * CHANNEL_ACQUIRED
     * 
     * </td>
     * <td>
     * ERROR
     * 
     * or
     * 
     * SUCCESS
     * 
     * </td>
     * <td>
     * Another listener on this channel has already responded.  Only the first respondent can continue the communication with the sender.
     * 
     *  If this HRESULT has an ERROR severity, the calling function should handle the error condition. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * CHANNEL_ALREADY_CLOSED
     * 
     * </td>
     * <td>
     * ERROR
     * 
     * or
     * 
     * SUCCESS
     * 
     * </td>
     * <td>
     * The channel has already closed. IPrintAsyncNotifyChannel::Release must not be called if this HRESULT is returned because the channel has already been closed and released.
     * 
     *  If this HRESULT has an ERROR severity, the calling function should handle the error condition. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>CHANNEL_CLOSED_BY_ANOTHER_LISTENER</td>
     * <td>ERROR</td>
     * <td>A listening application, other than the caller, closed the communication channel. </td>
     * </tr>
     * <tr>
     * <td>CHANNEL_CLOSED_BY_SAME_LISTENER</td>
     * <td>ERROR</td>
     * <td>The caller has already closed the communication channel.</td>
     * </tr>
     * <tr>
     * <td>INVALID_NOTIFICATION_TYPE</td>
     * <td>ERROR</td>
     * <td>The specified notification type is invalid. </td>
     * </tr>
     * </table>
     *  
     * 
     * The return values are COM error codes. Because this function might complete the operation successfully yet return an HRESULT other than S_OK you should use the SUCCEEDED or FAILED macro to determine the success of the call. To get the specific HRESULT that was returned by the function, use the HRESULT_CODE macro. The following code example shows how these macros can be used.
     * 
     * See <a href="/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for other possible return values.
     * 
     * For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * 
     * 
     * ```cpp
     * if (SUCCEEDED(hr)) {
     *   // Call succeeded, check HRESULT value returned
     *   switch (HRESULT_CODE(hr)){
     *     case CHANNEL_ACQUIRED:
     *       // Some action 
     *       break;
     *     case CHANNEL_ALREADY_CLOSED:
     *       // Some action 
     *       break;
     *     default:
     *       // Default action 
     *       break;
     *   }
     * } else {
     *   // Call failed, check HRESULT value returned
     *   switch (HRESULT_CODE(hr)){
     *     case CHANNEL_CLOSED_BY_ANOTHER_LISTENER:
     *       // Some action 
     *       break;
     *     case CHANNEL_CLOSED_BY_SAME_LISTENER:
     *       // Some action 
     *       break;
     *     case INVALID_NOTIFICATION_TYPE:
     *       // Some action 
     *       break;
     *     case CHANNEL_ACQUIRED:
     *       // This can be an error and a successful return
     *       //  some action 
     *       break;
     *     case CHANNEL_ALREADY_CLOSED:
     *       // This can be an error and a successful return
     *       //  some action 
     *       break;
     *     default:
     *       // Default action 
     *       break;
     *   }
     * }
     * 
     * ```
     * @see https://docs.microsoft.com/windows/win32/api//prnasnot/nf-prnasnot-iprintasyncnotifychannel-closechannel
     */
    CloseChannel(pData) {
        result := ComCall(4, this, "ptr", pData, "HRESULT")
        return result
    }
}
