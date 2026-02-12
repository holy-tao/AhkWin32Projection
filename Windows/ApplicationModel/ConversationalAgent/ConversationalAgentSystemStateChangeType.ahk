#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the possible state changes for the [SystemStateChanged](conversationalagentsession_systemstatechanged.md) event.
 * @remarks
 * For the current agent state, check [ConversationalAgentSession.AgentState](conversationalagentsession_agentstate.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsystemstatechangetype
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ConversationalAgentSystemStateChangeType extends Win32Enum{

    /**
     * When set, indicates that the authentication status of the user has changed (such as when a user locks or unlocks a system). Corresponds to [ConversationalAgentSession.IsUserAuthenticated](conversationalagentsession_isuserauthenticated.md).
     * @type {Integer (Int32)}
     */
    static UserAuthentication => 0

    /**
     * When set, indicates that the system's capability to turn on, or use, a display device has changed (this does not indicate whether or not the display is currently being used). Corresponds to [ConversationalAgentSession.IsScreenAvailable](conversationalagentsession_isscreenavailable.md).
     * @type {Integer (Int32)}
     */
    static ScreenAvailability => 1

    /**
     * When set, indicates that the system's capability to use status indicator lights has changed. 
     * 
     * Corresponds to [ConversationalAgentSession.IsIndicatorLightAvailable](conversationalagentsession_isindicatorlightavailable.md).
     * @type {Integer (Int32)}
     */
    static IndicatorLightAvailability => 2

    /**
     * When set, indicates voice activation availability has been changed through system settings or group policy. Corresponds to [ConversationalAgentSession.IsVoiceActivationAvailable](conversationalagentsession_isvoiceactivationavailable.md).
     * @type {Integer (Int32)}
     */
    static VoiceActivationAvailability => 3
}
