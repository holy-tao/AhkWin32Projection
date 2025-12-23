#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This AGENT_SESSION_STATE enumeration (tapi3cc.h) defines the agent session indicators used by the ITAgentSession::get_State and the ITAgentSession::put_State methods.
 * @remarks
 * Following is a table of all valid AgentSession state transitions.
 * 
 * <table>
 * <tr>
 * <th>From state</th>
 * <th>To state</th>
 * </tr>
 * <tr>
 * <td>ASST_NOT_READY</td>
 * <td>
 * <dl>
 * <dt>ASST_READY</dt>
 * <dt>ASST_SESSION_ENDED</dt>
 * </dl>
 * </td>
 * </tr>
 * <tr>
 * <td>ASST_READY</td>
 * <td>
 * <dl>
 * <dt>ASST_BUSY_ON_CALL</dt>
 * <dt>ASST_NOT_READY</dt>
 * <dt>ASST_SESSION_ENDED</dt>
 * </dl>
 * </td>
 * </tr>
 * <tr>
 * <td>ASST_BUSY_ON_CALL</td>
 * <td>
 * <dl>
 * <dt>ASST_BUSY_WRAPUP</dt>
 * <dt>ASST_READY</dt>
 * <dt>ASST_NOT_READY</dt>
 * <dt>ASST_SESSION_ENDED</dt>
 * </dl>
 * </td>
 * </tr>
 * <tr>
 * <td>ASST_BUSY_WRAPUP</td>
 * <td>
 * <dl>
 * <dt>ASST_READY</dt>
 * <dt>ASST_NOT_READY</dt>
 * <dt>ASST_SESSION_ENDED</dt>
 * </dl>
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/ne-tapi3cc-agent_session_state
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class AGENT_SESSION_STATE extends Win32Enum{

    /**
     * The agent is unable to handle calls for this session.
     * @type {Integer (Int32)}
     */
    static ASST_NOT_READY => 0

    /**
     * The agent is able to handle calls for this session.
     * @type {Integer (Int32)}
     */
    static ASST_READY => 1

    /**
     * The agent is active in this session handling an ACD call.
     * @type {Integer (Int32)}
     */
    static ASST_BUSY_ON_CALL => 2

    /**
     * The agent is active in this session handling the wrap-up of an ACD call.
     * @type {Integer (Int32)}
     */
    static ASST_BUSY_WRAPUP => 3

    /**
     * The session has completed.
     * @type {Integer (Int32)}
     */
    static ASST_SESSION_ENDED => 4
}
