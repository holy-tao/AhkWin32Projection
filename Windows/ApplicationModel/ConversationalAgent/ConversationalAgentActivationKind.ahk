#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the supported agent activation types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentactivationkind
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ConversationalAgentActivationKind extends Win32Enum{

    /**
     * Activation in the voice activation preview.
     * @type {Integer (Int32)}
     */
    static VoiceActivationPreview => 0

    /**
     * Activation in normal window.
     * @type {Integer (Int32)}
     */
    static Foreground => 1
}
