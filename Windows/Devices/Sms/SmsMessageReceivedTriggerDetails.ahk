#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsMessageReceivedTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event details for the event raised when an SMS message is received.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * You access an SmsMessageReceivedTriggerDetails object through the function that you implement to handle the [SmsMessageRegistration.MessageReceived](smsmessageregistration_messagereceived.md) event.
 * 
 * Your filtering code is required to acknowledge each filtered message by calling [Drop](smsmessagereceivedtriggerdetails_drop_1201404469.md) or [Accept](smsmessagereceivedtriggerdetails_accept_1944939200.md) before it can process the next message.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagereceivedtriggerdetails
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsMessageReceivedTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsMessageReceivedTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsMessageReceivedTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The [SmsMessageType](smsmessagetype.md) of the received message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagereceivedtriggerdetails.messagetype
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
    }

    /**
     * When [MessageType](smsmessagereceivedtriggerdetails_messagetype.md) is **Text**, the message details for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagereceivedtriggerdetails.textmessage
     * @type {SmsTextMessage2} 
     */
    TextMessage {
        get => this.get_TextMessage()
    }

    /**
     * When [MessageType](smsmessagereceivedtriggerdetails_messagetype.md) is **Wap**, the message details for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagereceivedtriggerdetails.wapmessage
     * @type {SmsWapMessage} 
     */
    WapMessage {
        get => this.get_WapMessage()
    }

    /**
     * When [MessageType](smsmessagereceivedtriggerdetails_messagetype.md) is **App**, the message details for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagereceivedtriggerdetails.appmessage
     * @type {SmsAppMessage} 
     */
    AppMessage {
        get => this.get_AppMessage()
    }

    /**
     * When [MessageType](smsmessagereceivedtriggerdetails_messagetype.md) is **Broadcast**, the message details for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagereceivedtriggerdetails.broadcastmessage
     * @type {SmsBroadcastMessage} 
     */
    BroadcastMessage {
        get => this.get_BroadcastMessage()
    }

    /**
     * When [MessageType](smsmessagereceivedtriggerdetails_messagetype.md) is **Voicemail**, the message details for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagereceivedtriggerdetails.voicemailmessage
     * @type {SmsVoicemailMessage} 
     */
    VoicemailMessage {
        get => this.get_VoicemailMessage()
    }

    /**
     * When [MessageType](smsmessagereceivedtriggerdetails_messagetype.md) is **Status**, the message details for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagereceivedtriggerdetails.statusmessage
     * @type {SmsStatusMessage} 
     */
    StatusMessage {
        get => this.get_StatusMessage()
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
    get_MessageType() {
        if (!this.HasProp("__ISmsMessageReceivedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISmsMessageReceivedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageReceivedTriggerDetails := ISmsMessageReceivedTriggerDetails(outPtr)
        }

        return this.__ISmsMessageReceivedTriggerDetails.get_MessageType()
    }

    /**
     * 
     * @returns {SmsTextMessage2} 
     */
    get_TextMessage() {
        if (!this.HasProp("__ISmsMessageReceivedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISmsMessageReceivedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageReceivedTriggerDetails := ISmsMessageReceivedTriggerDetails(outPtr)
        }

        return this.__ISmsMessageReceivedTriggerDetails.get_TextMessage()
    }

    /**
     * 
     * @returns {SmsWapMessage} 
     */
    get_WapMessage() {
        if (!this.HasProp("__ISmsMessageReceivedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISmsMessageReceivedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageReceivedTriggerDetails := ISmsMessageReceivedTriggerDetails(outPtr)
        }

        return this.__ISmsMessageReceivedTriggerDetails.get_WapMessage()
    }

    /**
     * 
     * @returns {SmsAppMessage} 
     */
    get_AppMessage() {
        if (!this.HasProp("__ISmsMessageReceivedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISmsMessageReceivedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageReceivedTriggerDetails := ISmsMessageReceivedTriggerDetails(outPtr)
        }

        return this.__ISmsMessageReceivedTriggerDetails.get_AppMessage()
    }

    /**
     * 
     * @returns {SmsBroadcastMessage} 
     */
    get_BroadcastMessage() {
        if (!this.HasProp("__ISmsMessageReceivedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISmsMessageReceivedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageReceivedTriggerDetails := ISmsMessageReceivedTriggerDetails(outPtr)
        }

        return this.__ISmsMessageReceivedTriggerDetails.get_BroadcastMessage()
    }

    /**
     * 
     * @returns {SmsVoicemailMessage} 
     */
    get_VoicemailMessage() {
        if (!this.HasProp("__ISmsMessageReceivedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISmsMessageReceivedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageReceivedTriggerDetails := ISmsMessageReceivedTriggerDetails(outPtr)
        }

        return this.__ISmsMessageReceivedTriggerDetails.get_VoicemailMessage()
    }

    /**
     * 
     * @returns {SmsStatusMessage} 
     */
    get_StatusMessage() {
        if (!this.HasProp("__ISmsMessageReceivedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISmsMessageReceivedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageReceivedTriggerDetails := ISmsMessageReceivedTriggerDetails(outPtr)
        }

        return this.__ISmsMessageReceivedTriggerDetails.get_StatusMessage()
    }

    /**
     * Drops the filtered message, so that it is not passed on to the messaging app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagereceivedtriggerdetails.drop
     */
    Drop() {
        if (!this.HasProp("__ISmsMessageReceivedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISmsMessageReceivedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageReceivedTriggerDetails := ISmsMessageReceivedTriggerDetails(outPtr)
        }

        return this.__ISmsMessageReceivedTriggerDetails.Drop()
    }

    /**
     * Delivers the filtered message to the messaging app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagereceivedtriggerdetails.accept
     */
    Accept() {
        if (!this.HasProp("__ISmsMessageReceivedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISmsMessageReceivedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageReceivedTriggerDetails := ISmsMessageReceivedTriggerDetails(outPtr)
        }

        return this.__ISmsMessageReceivedTriggerDetails.Accept()
    }

;@endregion Instance Methods
}
