#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRcsEndUserMessage.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a Rich Communication Services (RCS) end user message.
 * @remarks
 * Call [RcsEndUserMessageAvailableEventArgs.Message](rcsendusermessageavailableeventargs_message.md) to instantiate this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessage
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class RcsEndUserMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRcsEndUserMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRcsEndUserMessage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the transport where this message originated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessage.transportid
     * @type {HSTRING} 
     */
    TransportId {
        get => this.get_TransportId()
    }

    /**
     * Gets the title of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessage.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * Gets the contents of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessage.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * Gets a Boolean value that specifies whether a PIN is required to be sent back with the response.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessage.ispinrequired
     * @type {Boolean} 
     */
    IsPinRequired {
        get => this.get_IsPinRequired()
    }

    /**
     * Gets the actions to which the user can respond.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessage.actions
     * @type {IVectorView<RcsEndUserMessageAction>} 
     */
    Actions {
        get => this.get_Actions()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportId() {
        if (!this.HasProp("__IRcsEndUserMessage")) {
            if ((queryResult := this.QueryInterface(IRcsEndUserMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsEndUserMessage := IRcsEndUserMessage(outPtr)
        }

        return this.__IRcsEndUserMessage.get_TransportId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IRcsEndUserMessage")) {
            if ((queryResult := this.QueryInterface(IRcsEndUserMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsEndUserMessage := IRcsEndUserMessage(outPtr)
        }

        return this.__IRcsEndUserMessage.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IRcsEndUserMessage")) {
            if ((queryResult := this.QueryInterface(IRcsEndUserMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsEndUserMessage := IRcsEndUserMessage(outPtr)
        }

        return this.__IRcsEndUserMessage.get_Text()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPinRequired() {
        if (!this.HasProp("__IRcsEndUserMessage")) {
            if ((queryResult := this.QueryInterface(IRcsEndUserMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsEndUserMessage := IRcsEndUserMessage(outPtr)
        }

        return this.__IRcsEndUserMessage.get_IsPinRequired()
    }

    /**
     * 
     * @returns {IVectorView<RcsEndUserMessageAction>} 
     */
    get_Actions() {
        if (!this.HasProp("__IRcsEndUserMessage")) {
            if ((queryResult := this.QueryInterface(IRcsEndUserMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsEndUserMessage := IRcsEndUserMessage(outPtr)
        }

        return this.__IRcsEndUserMessage.get_Actions()
    }

    /**
     * Asynchronously sends the user's selection back.
     * @param {RcsEndUserMessageAction} action Specifies the label of the action.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessage.sendresponseasync
     */
    SendResponseAsync(action) {
        if (!this.HasProp("__IRcsEndUserMessage")) {
            if ((queryResult := this.QueryInterface(IRcsEndUserMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsEndUserMessage := IRcsEndUserMessage(outPtr)
        }

        return this.__IRcsEndUserMessage.SendResponseAsync(action)
    }

    /**
     * Asynchronously sends the user's selection back with the specified PIN.
     * @param {RcsEndUserMessageAction} action Specifies the label of the action.
     * @param {HSTRING} pin The PIN to send.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsendusermessage.sendresponsewithpinasync
     */
    SendResponseWithPinAsync(action, pin) {
        if (!this.HasProp("__IRcsEndUserMessage")) {
            if ((queryResult := this.QueryInterface(IRcsEndUserMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsEndUserMessage := IRcsEndUserMessage(outPtr)
        }

        return this.__IRcsEndUserMessage.SendResponseWithPinAsync(action, pin)
    }

;@endregion Instance Methods
}
