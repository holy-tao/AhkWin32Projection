#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the possible settings required for voice activation to function.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentvoiceactivationprerequisitekind
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ConversationalAgentVoiceActivationPrerequisiteKind extends Win32Enum{

    /**
     * Access to the microphone.
     * @type {Integer (Int32)}
     */
    static MicrophonePermission => 0

    /**
     * Known conversational agents.
     * @type {Integer (Int32)}
     */
    static KnownAgents => 1

    /**
     * The conversational agent permissions.
     * @type {Integer (Int32)}
     */
    static AgentAllowed => 2

    /**
     * The registered app capabilities.
     * @type {Integer (Int32)}
     */
    static AppCapability => 3

    /**
     * Background task registration.
     * @type {Integer (Int32)}
     */
    static BackgroundTaskRegistration => 4

    /**
     * Policy support for conversational agents.
     * @type {Integer (Int32)}
     */
    static PolicyPermission => 5
}
