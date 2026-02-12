#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsVoicemailMessage.ahk
#Include .\ISmsMessageBase.ahk
#Include ..\..\..\Guid.ahk

/**
 * Encapsulates an SMS voicemail message.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsvoicemailmessage
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsVoicemailMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsVoicemailMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsVoicemailMessage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The timestamp of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsvoicemailmessage.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * The phone number the message was sent to.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsvoicemailmessage.to
     * @type {HSTRING} 
     */
    To {
        get => this.get_To()
    }

    /**
     * Gets the body of the voicemail message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsvoicemailmessage.body
     * @type {HSTRING} 
     */
    Body {
        get => this.get_Body()
    }

    /**
     * Gets the number of available messages.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsvoicemailmessage.messagecount
     * @type {IReference<Integer>} 
     */
    MessageCount {
        get => this.get_MessageCount()
    }

    /**
     * Gets the type of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsvoicemailmessage.messagetype
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
    }

    /**
     * Gets the unique device identifier associated with the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsvoicemailmessage.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the cellular class of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsvoicemailmessage.cellularclass
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
    }

    /**
     * Gets the message class of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsvoicemailmessage.messageclass
     * @type {Integer} 
     */
    MessageClass {
        get => this.get_MessageClass()
    }

    /**
     * Gets the ICCID (Integrated Circuit Card Identifier) of the SIM that received the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsvoicemailmessage.simiccid
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
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ISmsVoicemailMessage")) {
            if ((queryResult := this.QueryInterface(ISmsVoicemailMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsVoicemailMessage := ISmsVoicemailMessage(outPtr)
        }

        return this.__ISmsVoicemailMessage.get_Timestamp()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_To() {
        if (!this.HasProp("__ISmsVoicemailMessage")) {
            if ((queryResult := this.QueryInterface(ISmsVoicemailMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsVoicemailMessage := ISmsVoicemailMessage(outPtr)
        }

        return this.__ISmsVoicemailMessage.get_To()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Body() {
        if (!this.HasProp("__ISmsVoicemailMessage")) {
            if ((queryResult := this.QueryInterface(ISmsVoicemailMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsVoicemailMessage := ISmsVoicemailMessage(outPtr)
        }

        return this.__ISmsVoicemailMessage.get_Body()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MessageCount() {
        if (!this.HasProp("__ISmsVoicemailMessage")) {
            if ((queryResult := this.QueryInterface(ISmsVoicemailMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsVoicemailMessage := ISmsVoicemailMessage(outPtr)
        }

        return this.__ISmsVoicemailMessage.get_MessageCount()
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
