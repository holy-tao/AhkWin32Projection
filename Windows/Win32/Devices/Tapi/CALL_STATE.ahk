#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CALL_STATE enum is used by the ITCallInfo::get_CallState and ITCallStateEvent::get_State methods.
 * @remarks
 * Following is a table of all valid call state transitions.
 * 
 * <table>
 * <tr>
 * <th>From state</th>
 * <th>To state</th>
 * </tr>
 * <tr>
 * <td>CS_IDLE</td>
 * <td>
 * <dl>
 * <dt>INPROGRESS</dt>
 * <dt>CONNECTED</dt>
 * <dt>DISCONNECTED</dt>
 * <dt>OFFERING</dt>
 * <dt>HOLD</dt>
 * </dl>
 * </td>
 * </tr>
 * <tr>
 * <td>CS_INPROGRESS</td>
 * <td>
 * <dl>
 * <dt>CONNECTED</dt>
 * <dt>DISCONNECTED</dt>
 * <dt>HOLD</dt>
 * </dl>
 * </td>
 * </tr>
 * <tr>
 * <td>CS_CONNECTED</td>
 * <td>
 * <dl>
 * <dt>HOLD</dt>
 * <dt>DISCONNECTED</dt>
 * </dl>
 * </td>
 * </tr>
 * <tr>
 * <td>CS_DISCONNECTED</td>
 * <td>Nothing—call should be freed</td>
 * </tr>
 * <tr>
 * <td>CS_OFFERING</td>
 * <td>
 * <dl>
 * <dt>CONNECTED</dt>
 * <dt>DISCONNECTED</dt>
 * <dt>HOLD</dt>
 * </dl>
 * </td>
 * </tr>
 * <tr>
 * <td>CS_HOLD</td>
 * <td>
 * <dl>
 * <dt>CONNECTED</dt>
 * <dt>DISCONNECTED</dt>
 * </dl>
 * </td>
 * </tr>
 * <tr>
 * <td>CS_QUEUED</td>
 * <td>
 * <dl>
 * <dt>CONNECTED</dt>
 * <dt>DISCONNECTED</dt>
 * <dt>HOLD</dt>
 * </dl>
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-call_state
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class CALL_STATE extends Win32Enum{

    /**
     * The call has been created, but 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itbasiccallcontrol-connect">Connect</a> has not been called yet. A call can never transition into the idle state. This is the initial state for both incoming and outgoing calls.
     * @type {Integer (Int32)}
     */
    static CS_IDLE => 0

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itbasiccallcontrol-connect">Connect</a> has been called, and the service provider is working on making a connection. This state is valid only on outgoing calls. This message is optional, because a service provider may have a call transition directly to the connected state.
     * @type {Integer (Int32)}
     */
    static CS_INPROGRESS => 1

    /**
     * Call has been connected to the remote end and communication can take place.
     * @type {Integer (Int32)}
     */
    static CS_CONNECTED => 2

    /**
     * Call has been disconnected. There are several causes for disconnection. See the table of valid call state transitions below.
     * @type {Integer (Int32)}
     */
    static CS_DISCONNECTED => 3

    /**
     * A new call has appeared, and is being offered to an application. If the application has owner privileges on the call, it can either call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itbasiccallcontrol-answer">Answer</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itbasiccallcontrol-disconnect">Disconnect</a> while the call is in the offering state. Current call privilege can be determined by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itcallinfo-get_privilege">ITCallInfo::get_Privilege</a>.
     * @type {Integer (Int32)}
     */
    static CS_OFFERING => 4

    /**
     * The call is in the hold state.
     * @type {Integer (Int32)}
     */
    static CS_HOLD => 5

    /**
     * The call is queued.
     * @type {Integer (Int32)}
     */
    static CS_QUEUED => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CS_LASTITEM => 6
}
