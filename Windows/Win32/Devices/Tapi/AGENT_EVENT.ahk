#Requires AutoHotkey v2.0.0 64-bit

/**
 * The AGENT_EVENT enum describes agent events. The ITAgentEvent::get_Event method returns a member of this enum to indicate the type of agent event that occurred.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/ne-tapi3cc-agent_event
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class AGENT_EVENT{

    /**
     * The agent is unable to handle calls.
     * @type {Integer (Int32)}
     */
    static AE_NOT_READY => 0

    /**
     * The agent is able to handle calls.
     * @type {Integer (Int32)}
     */
    static AE_READY => 1

    /**
     * The agent is active handling an ACD call.
     * @type {Integer (Int32)}
     */
    static AE_BUSY_ACD => 2

    /**
     * The agent is active handling an incoming non-ACD call.
     * @type {Integer (Int32)}
     */
    static AE_BUSY_INCOMING => 3

    /**
     * The agent is active handling an outgoing non-ACD call.
     * @type {Integer (Int32)}
     */
    static AE_BUSY_OUTGOING => 4

    /**
     * Unknown state.
     * @type {Integer (Int32)}
     */
    static AE_UNKNOWN => 5
}
