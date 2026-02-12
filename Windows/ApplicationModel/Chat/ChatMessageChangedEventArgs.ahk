#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents event parameters used by the event handler that processes message change events.
 * @remarks
 * Obtain an instance of this object in the handler to the [MessageChanged](chatmessagestore_messagechanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechangedeventargs
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatMessageChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatMessageChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * The message changed event handler that an application registers with the message store receives a deferral object in the event parameters. The GetDeferral method registers a change deferral and allows an application to take action related to the change before the message store completes the change.
     * @remarks
     * The chat application receives a [ChatMessageChangedDeferral class](chatmessagechangeddeferral.md) object when requested by GetDeferral. Deferrals are only available if the application has a change event handler added to the [MessageChanged](chatmessagestore_messagechanged.md) event of the [ChatMessageStore class](chatmessagestore.md). The [ChatMessageChangedDeferral class](chatmessagechangeddeferral.md) received in the parameters for the event handler is retained for later use to notify the message store that actions related to the changer are complete.
     * @returns {ChatMessageChangedDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagechangedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IChatMessageChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IChatMessageChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageChangedEventArgs := IChatMessageChangedEventArgs(outPtr)
        }

        return this.__IChatMessageChangedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
