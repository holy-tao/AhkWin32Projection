#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the supported agent activation request result values.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentactivationresult
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ConversationalAgentActivationResult extends Win32Enum{

    /**
     * Activation was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Activation failed because the agent requesting the activation was not in dialog. For example, [ConversationalAgentState](conversationalagentstate.md) was inactive.
     * @type {Integer (Int32)}
     */
    static AgentInactive => 1

    /**
     * Activation failed because the display is not accessible. For example when the laptop lid is closed.
     * @type {Integer (Int32)}
     */
    static ScreenNotAvailable => 2

    /**
     * Activation failed because the agent was interrupted.
     * @type {Integer (Int32)}
     */
    static AgentInterrupted => 3
}
