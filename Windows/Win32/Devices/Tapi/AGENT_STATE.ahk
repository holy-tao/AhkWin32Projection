#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AGENT_STATE enum is used by the ITAgent::put_State and ITAgent::get_State methods to describe the agent state.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/ne-tapi3cc-agent_state
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class AGENT_STATE extends Win32Enum{

    /**
     * Agent is not ready
     * @type {Integer (Int32)}
     */
    static AS_NOT_READY => 0

    /**
     * Agent is ready
     * @type {Integer (Int32)}
     */
    static AS_READY => 1

    /**
     * Agent is busy with an ACD call.
     * @type {Integer (Int32)}
     */
    static AS_BUSY_ACD => 2

    /**
     * Agent has a call incoming.
     * @type {Integer (Int32)}
     */
    static AS_BUSY_INCOMING => 3

    /**
     * Agent has a call that is outgoing.
     * @type {Integer (Int32)}
     */
    static AS_BUSY_OUTGOING => 4

    /**
     * Agent state unknown.
     * @type {Integer (Int32)}
     */
    static AS_UNKNOWN => 5
}
