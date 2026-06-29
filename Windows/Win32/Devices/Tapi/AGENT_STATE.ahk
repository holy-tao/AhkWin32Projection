#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AGENT_STATE enumeration (tapi3cc.h) is used by the ITAgent::put_State and ITAgent::get_State methods to describe the agent state.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/ne-tapi3cc-agent_state
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct AGENT_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
