#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AGENTHANDLER_EVENT enum describes agent handler events. The ITAgentHandlerEvent::get_Event method returns a member of this enum to indicate the type of agent handler event that occurred.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/ne-tapi3cc-agenthandler_event
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class AGENTHANDLER_EVENT extends Win32Enum{

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
