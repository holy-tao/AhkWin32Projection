#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AGENTHANDLER_EVENT enumeration (tapi3cc.h) describes agent handler events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/ne-tapi3cc-agenthandler_event
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct AGENTHANDLER_EVENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A new AgentHandler object has been added.
     * @type {Integer (Int32)}
     */
    static AHE_NEW_AGENTHANDLER => 0

    /**
     * An AgentHandler object has been removed.
     * @type {Integer (Int32)}
     */
    static AHE_AGENTHANDLER_REMOVED => 1
}
