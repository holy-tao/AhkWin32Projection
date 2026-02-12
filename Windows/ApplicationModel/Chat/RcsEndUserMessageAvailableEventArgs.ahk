#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRcsEndUserMessageAvailableEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the data for a [MessageAvailableChanged](rcsendusermessagemanager_messageavailablechanged.md) event.
 * @remarks
 * The system creates an instance of this class and passes it as an argument to the [MessageAvailableChanged](rcsendusermessagemanager_messageavailablechanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessageavailableeventargs
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class RcsEndUserMessageAvailableEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRcsEndUserMessageAvailableEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRcsEndUserMessageAvailableEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a Boolean value indicating if a new message is available.
     * @remarks
     * There could be more than one message to be displayed. The service controls how many and the order in which to display them. You should block all Rich Communication Services (RCS) functionality while the service is displaying these messages, until a notification with this flag set to FALSE arrives.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessageavailableeventargs.ismessageavailable
     * @type {Boolean} 
     */
    IsMessageAvailable {
        get => this.get_IsMessageAvailable()
    }

    /**
     * Gets the actual message to display, or empty if [IsMessageAvailable](rcsendusermessageavailableeventargs_ismessageavailable.md) is FALSE.
     * @remarks
     * If[IsMessageAvailable](rcsendusermessageavailableeventargs_ismessageavailable.md) is **True**, then this will contain the message to display. If [IsMessageAvailable](rcsendusermessageavailableeventargs_ismessageavailable.md) is **False**, then this will be an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessageavailableeventargs.message
     * @type {RcsEndUserMessage} 
     */
    Message {
        get => this.get_Message()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMessageAvailable() {
        if (!this.HasProp("__IRcsEndUserMessageAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IRcsEndUserMessageAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsEndUserMessageAvailableEventArgs := IRcsEndUserMessageAvailableEventArgs(outPtr)
        }

        return this.__IRcsEndUserMessageAvailableEventArgs.get_IsMessageAvailable()
    }

    /**
     * 
     * @returns {RcsEndUserMessage} 
     */
    get_Message() {
        if (!this.HasProp("__IRcsEndUserMessageAvailableEventArgs")) {
            if ((queryResult := this.QueryInterface(IRcsEndUserMessageAvailableEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsEndUserMessageAvailableEventArgs := IRcsEndUserMessageAvailableEventArgs(outPtr)
        }

        return this.__IRcsEndUserMessageAvailableEventArgs.get_Message()
    }

;@endregion Instance Methods
}
