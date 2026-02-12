#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies each possible [AgentState](conversationalagentsession_agentstate.md) for a digital assistant.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentstate
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ConversationalAgentState extends Win32Enum{

    /**
     * The [ConversationalAgent](windows_applicationmodel_conversationalagent.md) is not actively processing input or speaking to the user.
     * @type {Integer (Int32)}
     */
    static Inactive => 0

    /**
     * The [ConversationalAgent](windows_applicationmodel_conversationalagent.md) is verifying the activation signal that activated it.
     * @type {Integer (Int32)}
     */
    static Detecting => 1

    /**
     * The [ConversationalAgent](windows_applicationmodel_conversationalagent.md) is actively processing input.
     * @type {Integer (Int32)}
     */
    static Listening => 2

    /**
     * The [ConversationalAgent](windows_applicationmodel_conversationalagent.md) is acting on the user's input and awaiting an outcome to continue the agent interaction.
     * @type {Integer (Int32)}
     */
    static Working => 3

    /**
     * The [ConversationalAgent](windows_applicationmodel_conversationalagent.md) is actively speaking to the user.
     * @type {Integer (Int32)}
     */
    static Speaking => 4

    /**
     * The [ConversationalAgent](windows_applicationmodel_conversationalagent.md) is concurrently processing input and speaking to the user.
     * @type {Integer (Int32)}
     */
    static ListeningAndSpeaking => 5
}
