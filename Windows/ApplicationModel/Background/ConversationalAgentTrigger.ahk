#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that launches a background task for processing digital assistant communication through the Windows platform Agent Activation Runtime (AAR).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.conversationalagenttrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ConversationalAgentTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTrigger.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates an instance of a [ConversationalAgentTrigger](conversationalagenttrigger.md).
     * @remarks
     * If a [ConversationalAgentSignal](../windows.applicationmodel.conversationalagent/conversationalagentsignal.md) is detected while a [ConversationalAgentSession](../windows.applicationmodel.conversationalagent/conversationalagentsession.md) is **inactive**, the AAR raises a [ConversationalAgentTrigger](conversationalagenttrigger.md) background event. Your app can then use the Signal property to process the conversation.
     * 
     * If a [ConversationalAgentSignal](../windows.applicationmodel.conversationalagent/conversationalagentsignal.md) is detected while a [ConversationalAgentSession](../windows.applicationmodel.conversationalagent/conversationalagentsession.md) is **active** (listening, speaking, detecting), the AAR does not raise  a [ConversationalAgentTrigger](conversationalagenttrigger.md) background event. Instead, it raises the [SessionInterrupted](../windows.applicationmodel.conversationalagent/conversationalagentsession_sessioninterrupted.md) event to indicate that the digital assistant app should set itself to inactive and stop processing input. The digital assistant can then decide to ignore the new signal or use it in the [context](../windows.applicationmodel.conversationalagent/conversationalagentsignal_signalcontext.md) of the current session.
     * 
     * > [!NOTE]
     * > Some digital assistant sessions cannot be interrupted by another signal. For example, Cortana requires the user to issue a cancel or stop command to end the current session (the user cannot be in a Cortana session and issue commands to Alexa).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.ConversationalAgentTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
