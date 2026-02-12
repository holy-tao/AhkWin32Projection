#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsStatusMessage.ahk
#Include .\ISmsMessageBase.ahk
#Include ..\..\..\Guid.ahk

/**
 * Encapsulates an SMS status message.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
  * 
  * To access a received status message, create a background task that is triggered by the SmsMessageReceived event. In that task, first use [SmsMessageReceivedTriggerDetails.MessageType](smsmessagereceivedtriggerdetails_messagetype.md) to determine that the message is a status message, then use the [SmsMessageReceivedTriggerDetails.StatusMessage](smsmessagereceivedtriggerdetails_textmessage.md) property to access the instance of this class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsstatusmessage
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsStatusMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsStatusMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsStatusMessage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the phone number the status message was sent to.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsstatusmessage.to
     * @type {HSTRING} 
     */
    To {
        get => this.get_To()
    }

    /**
     * Gets the phone number that sent the status message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsstatusmessage.from
     * @type {HSTRING} 
     */
    From {
        get => this.get_From()
    }

    /**
     * Gets the body of the status message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsstatusmessage.body
     * @type {HSTRING} 
     */
    Body {
        get => this.get_Body()
    }

    /**
     * The status code associated with this message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsstatusmessage.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the reference number of the status message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsstatusmessage.messagereferencenumber
     * @type {Integer} 
     */
    MessageReferenceNumber {
        get => this.get_MessageReferenceNumber()
    }

    /**
     * Gets the service center timestamp of the status message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsstatusmessage.servicecentertimestamp
     * @type {DateTime} 
     */
    ServiceCenterTimestamp {
        get => this.get_ServiceCenterTimestamp()
    }

    /**
     * The discharge time of the status message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsstatusmessage.dischargetime
     * @type {DateTime} 
     */
    DischargeTime {
        get => this.get_DischargeTime()
    }

    /**
     * Gets the message type of the status message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsstatusmessage.messagetype
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
    }

    /**
     * Gets the device identifier associated with the status message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsstatusmessage.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the cellular class of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsstatusmessage.cellularclass
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
    }

    /**
     * Gets the message class of the status message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsstatusmessage.messageclass
     * @type {Integer} 
     */
    MessageClass {
        get => this.get_MessageClass()
    }

    /**
     * Gets the ICCID (Integrated Circuit Card Identifier) of the SIM that received the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsstatusmessage.simiccid
     * @type {HSTRING} 
     */
    SimIccId {
        get => this.get_SimIccId()
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
    get_To() {
        if (!this.HasProp("__ISmsStatusMessage")) {
            if ((queryResult := this.QueryInterface(ISmsStatusMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsStatusMessage := ISmsStatusMessage(outPtr)
        }

        return this.__ISmsStatusMessage.get_To()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_From() {
        if (!this.HasProp("__ISmsStatusMessage")) {
            if ((queryResult := this.QueryInterface(ISmsStatusMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsStatusMessage := ISmsStatusMessage(outPtr)
        }

        return this.__ISmsStatusMessage.get_From()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Body() {
        if (!this.HasProp("__ISmsStatusMessage")) {
            if ((queryResult := this.QueryInterface(ISmsStatusMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsStatusMessage := ISmsStatusMessage(outPtr)
        }

        return this.__ISmsStatusMessage.get_Body()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__ISmsStatusMessage")) {
            if ((queryResult := this.QueryInterface(ISmsStatusMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsStatusMessage := ISmsStatusMessage(outPtr)
        }

        return this.__ISmsStatusMessage.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageReferenceNumber() {
        if (!this.HasProp("__ISmsStatusMessage")) {
            if ((queryResult := this.QueryInterface(ISmsStatusMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsStatusMessage := ISmsStatusMessage(outPtr)
        }

        return this.__ISmsStatusMessage.get_MessageReferenceNumber()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ServiceCenterTimestamp() {
        if (!this.HasProp("__ISmsStatusMessage")) {
            if ((queryResult := this.QueryInterface(ISmsStatusMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsStatusMessage := ISmsStatusMessage(outPtr)
        }

        return this.__ISmsStatusMessage.get_ServiceCenterTimestamp()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DischargeTime() {
        if (!this.HasProp("__ISmsStatusMessage")) {
            if ((queryResult := this.QueryInterface(ISmsStatusMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsStatusMessage := ISmsStatusMessage(outPtr)
        }

        return this.__ISmsStatusMessage.get_DischargeTime()
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
