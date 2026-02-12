#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IConversationalAgentSystemStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event data for the [SystemStateChanged](conversationalagentsession_systemstatechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsystemstatechangedeventargs
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ConversationalAgentSystemStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IConversationalAgentSystemStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IConversationalAgentSystemStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the system state that changed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.conversationalagentsystemstatechangedeventargs.systemstatechangetype
     * @type {Integer} 
     */
    SystemStateChangeType {
        get => this.get_SystemStateChangeType()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SystemStateChangeType() {
        if (!this.HasProp("__IConversationalAgentSystemStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IConversationalAgentSystemStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConversationalAgentSystemStateChangedEventArgs := IConversationalAgentSystemStateChangedEventArgs(outPtr)
        }

        return this.__IConversationalAgentSystemStateChangedEventArgs.get_SystemStateChangeType()
    }

;@endregion Instance Methods
}
