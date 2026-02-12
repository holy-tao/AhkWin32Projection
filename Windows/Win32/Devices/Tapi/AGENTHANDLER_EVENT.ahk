#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AGENTHANDLER_EVENT enumeration (tapi3.h) describes agent handler events.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/ne-tapi3-agenthandler_event
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
