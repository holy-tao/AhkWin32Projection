#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsAppMessage.ahk
#Include .\ISmsMessageBase.ahk
#Include ..\..\..\Guid.ahk

/**
 * The interface for manipulating an SMS Application message. Application messages are those which cannot be characterized as any other message type.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsAppMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsAppMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsAppMessage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The timestamp of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * The telephone number of the recipient of this message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.to
     * @type {HSTRING} 
     */
    To {
        get => this.get_To()
        set => this.put_To(value)
    }

    /**
     * The telephone number of the sender of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.from
     * @type {HSTRING} 
     */
    From {
        get => this.get_From()
    }

    /**
     * The plain text body of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.body
     * @type {HSTRING} 
     */
    Body {
        get => this.get_Body()
        set => this.put_Body(value)
    }

    /**
     * The number to be dialed in reply to a received SMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.callbacknumber
     * @type {HSTRING} 
     */
    CallbackNumber {
        get => this.get_CallbackNumber()
        set => this.put_CallbackNumber(value)
    }

    /**
     * Indicates whether an SMS delivery status report was sent by the SMSC.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.isdeliverynotificationenabled
     * @type {Boolean} 
     */
    IsDeliveryNotificationEnabled {
        get => this.get_IsDeliveryNotificationEnabled()
        set => this.put_IsDeliveryNotificationEnabled(value)
    }

    /**
     * The retry attempt count for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.retryattemptcount
     * @type {Integer} 
     */
    RetryAttemptCount {
        get => this.get_RetryAttemptCount()
        set => this.put_RetryAttemptCount(value)
    }

    /**
     * The encoding used to send the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.encoding
     * @type {Integer} 
     */
    Encoding {
        get => this.get_Encoding()
        set => this.put_Encoding(value)
    }

    /**
     * The port number of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.portnumber
     * @type {Integer} 
     */
    PortNumber {
        get => this.get_PortNumber()
        set => this.put_PortNumber(value)
    }

    /**
     * The Teleservice identifier for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.teleserviceid
     * @type {Integer} 
     */
    TeleserviceId {
        get => this.get_TeleserviceId()
        set => this.put_TeleserviceId(value)
    }

    /**
     * The Protocol identifier for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.protocolid
     * @type {Integer} 
     */
    ProtocolId {
        get => this.get_ProtocolId()
        set => this.put_ProtocolId(value)
    }

    /**
     * Reads or writes the binary part of the Application message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.binarybody
     * @type {IBuffer} 
     */
    BinaryBody {
        get => this.get_BinaryBody()
        set => this.put_BinaryBody(value)
    }

    /**
     * The message type of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.messagetype
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
    }

    /**
     * The device ID of the device that received the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * The class of the cellular device that received the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.cellularclass
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
    }

    /**
     * The message class of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.messageclass
     * @type {Integer} 
     */
    MessageClass {
        get => this.get_MessageClass()
    }

    /**
     * Gets the ICCID (Integrated Circuit Card Identifier) of the SIM that received the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsappmessage.simiccid
     * @type {HSTRING} 
     */
    SimIccId {
        get => this.get_SimIccId()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Constructor. Used to create an [SmsAppMessage](smsappmessage.md) prior to sending it.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsAppMessage")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.get_Timestamp()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_To() {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.get_To()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_To(value) {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.put_To(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_From() {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.get_From()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Body() {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.get_Body()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Body(value) {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.put_Body(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallbackNumber() {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.get_CallbackNumber()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CallbackNumber(value) {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.put_CallbackNumber(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDeliveryNotificationEnabled() {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.get_IsDeliveryNotificationEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDeliveryNotificationEnabled(value) {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.put_IsDeliveryNotificationEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RetryAttemptCount() {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.get_RetryAttemptCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RetryAttemptCount(value) {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.put_RetryAttemptCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Encoding() {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.get_Encoding()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Encoding(value) {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.put_Encoding(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PortNumber() {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.get_PortNumber()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PortNumber(value) {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.put_PortNumber(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TeleserviceId() {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.get_TeleserviceId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TeleserviceId(value) {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.put_TeleserviceId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtocolId() {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.get_ProtocolId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProtocolId(value) {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.put_ProtocolId(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_BinaryBody() {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.get_BinaryBody()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_BinaryBody(value) {
        if (!this.HasProp("__ISmsAppMessage")) {
            if ((queryResult := this.QueryInterface(ISmsAppMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsAppMessage := ISmsAppMessage(outPtr)
        }

        return this.__ISmsAppMessage.put_BinaryBody(value)
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
