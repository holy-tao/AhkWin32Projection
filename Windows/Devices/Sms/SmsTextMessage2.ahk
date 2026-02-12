#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsTextMessage2.ahk
#Include .\ISmsMessageBase.ahk
#Include ..\..\..\Guid.ahk

/**
 * Encapsulates a decoded SMS text message. Prefer this class to the older [SmsTextMessage](smstextmessage_smstextmessage_1221375020.md) class.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
  * 
  * To send a text message, construct an instance of this class, set all appropriate fields, and send using [SmsDevice2.SendMessageAndGetResultAsync](smsdevice2_sendmessageandgetresultasync_123752871.md).
  * 
  * To access a received text message, create a background task that is triggered by the SmsMessageReceived event. In that task, first use [SmsMessageReceivedTriggerDetails.MessageType](smsmessagereceivedtriggerdetails_messagetype.md) to determine that the message is a text message, then use the [SmsMessageReceivedTriggerDetails.TextMessage](smsmessagereceivedtriggerdetails_textmessage.md) property to access the instance of this class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsTextMessage2 extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsTextMessage2

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsTextMessage2.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The timestamp of this message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets or sets the recipient phone number for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.to
     * @type {HSTRING} 
     */
    To {
        get => this.get_To()
        set => this.put_To(value)
    }

    /**
     * gets the phone number of the sender of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.from
     * @type {HSTRING} 
     */
    From {
        get => this.get_From()
    }

    /**
     * Gets or sets the body of the text message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.body
     * @type {HSTRING} 
     */
    Body {
        get => this.get_Body()
        set => this.put_Body(value)
    }

    /**
     * Gets or sets the encoding scheme used for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.encoding
     * @type {Integer} 
     */
    Encoding {
        get => this.get_Encoding()
        set => this.put_Encoding(value)
    }

    /**
     * Gets or sets the callback number for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.callbacknumber
     * @type {HSTRING} 
     */
    CallbackNumber {
        get => this.get_CallbackNumber()
        set => this.put_CallbackNumber(value)
    }

    /**
     * Gets or sets whether text message delivery notification is enabled for this message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.isdeliverynotificationenabled
     * @type {Boolean} 
     */
    IsDeliveryNotificationEnabled {
        get => this.get_IsDeliveryNotificationEnabled()
        set => this.put_IsDeliveryNotificationEnabled(value)
    }

    /**
     * Gets or sets the number of retry attempts for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.retryattemptcount
     * @type {Integer} 
     */
    RetryAttemptCount {
        get => this.get_RetryAttemptCount()
        set => this.put_RetryAttemptCount(value)
    }

    /**
     * Gets the teleservice identifier associated with this message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.teleserviceid
     * @type {Integer} 
     */
    TeleserviceId {
        get => this.get_TeleserviceId()
    }

    /**
     * Gets the protocol identifier for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.protocolid
     * @type {Integer} 
     */
    ProtocolId {
        get => this.get_ProtocolId()
    }

    /**
     * Gets the message type of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.messagetype
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
    }

    /**
     * Gets the device identifier for the device associated with the SMS text message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the cellular class of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.cellularclass
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
    }

    /**
     * Gets the message class of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.messageclass
     * @type {Integer} 
     */
    MessageClass {
        get => this.get_MessageClass()
    }

    /**
     * Gets the ICCID (Integrated Circuit Card Identifier) of the SIM that received the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage2.simiccid
     * @type {HSTRING} 
     */
    SimIccId {
        get => this.get_SimIccId()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Constructs a new, default instance of this class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsTextMessage2")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.get_Timestamp()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_To() {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.get_To()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_To(value) {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.put_To(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_From() {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.get_From()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Body() {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.get_Body()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Body(value) {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.put_Body(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Encoding() {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.get_Encoding()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Encoding(value) {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.put_Encoding(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallbackNumber() {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.get_CallbackNumber()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CallbackNumber(value) {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.put_CallbackNumber(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDeliveryNotificationEnabled() {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.get_IsDeliveryNotificationEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDeliveryNotificationEnabled(value) {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.put_IsDeliveryNotificationEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RetryAttemptCount() {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.get_RetryAttemptCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RetryAttemptCount(value) {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.put_RetryAttemptCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TeleserviceId() {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.get_TeleserviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtocolId() {
        if (!this.HasProp("__ISmsTextMessage2")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage2 := ISmsTextMessage2(outPtr)
        }

        return this.__ISmsTextMessage2.get_ProtocolId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageType() {
        if (!this.HasProp("__ISmsMessageBase")) {
            if ((queryResult := this.QueryInterface(ISmsMessageBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageBase := ISmsMessageBase(outPtr)
        }

        return this.__ISmsMessageBase.get_MessageType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ISmsMessageBase")) {
            if ((queryResult := this.QueryInterface(ISmsMessageBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageBase := ISmsMessageBase(outPtr)
        }

        return this.__ISmsMessageBase.get_DeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CellularClass() {
        if (!this.HasProp("__ISmsMessageBase")) {
            if ((queryResult := this.QueryInterface(ISmsMessageBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageBase := ISmsMessageBase(outPtr)
        }

        return this.__ISmsMessageBase.get_CellularClass()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageClass() {
        if (!this.HasProp("__ISmsMessageBase")) {
            if ((queryResult := this.QueryInterface(ISmsMessageBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageBase := ISmsMessageBase(outPtr)
        }

        return this.__ISmsMessageBase.get_MessageClass()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SimIccId() {
        if (!this.HasProp("__ISmsMessageBase")) {
            if ((queryResult := this.QueryInterface(ISmsMessageBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageBase := ISmsMessageBase(outPtr)
        }

        return this.__ISmsMessageBase.get_SimIccId()
    }

;@endregion Instance Methods
}
