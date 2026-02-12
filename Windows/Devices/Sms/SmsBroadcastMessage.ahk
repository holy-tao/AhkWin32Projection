#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsBroadcastMessage.ahk
#Include .\ISmsMessageBase.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a broadcast SMS message.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsBroadcastMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsBroadcastMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsBroadcastMessage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the timestamp of the broadcast SMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the recipient phone number of the broadcast SMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.to
     * @type {HSTRING} 
     */
    To {
        get => this.get_To()
    }

    /**
     * Gets the body of the broadcast SMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.body
     * @type {HSTRING} 
     */
    Body {
        get => this.get_Body()
    }

    /**
     * Gets the channel associated with the broadcast SMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.channel
     * @type {Integer} 
     */
    Channel {
        get => this.get_Channel()
    }

    /**
     * Gets the geographical scope associated with this broadcast SMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.geographicalscope
     * @type {Integer} 
     */
    GeographicalScope {
        get => this.get_GeographicalScope()
    }

    /**
     * Gets a code value associated with this broadcast SMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.messagecode
     * @type {Integer} 
     */
    MessageCode {
        get => this.get_MessageCode()
    }

    /**
     * Gets the update number associated with this broadcast SMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.updatenumber
     * @type {Integer} 
     */
    UpdateNumber {
        get => this.get_UpdateNumber()
    }

    /**
     * Gets the type of this broadcast SMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.broadcasttype
     * @type {Integer} 
     */
    BroadcastType {
        get => this.get_BroadcastType()
    }

    /**
     * True when the broadcast SMS message is an emergency alert.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.isemergencyalert
     * @type {Boolean} 
     */
    IsEmergencyAlert {
        get => this.get_IsEmergencyAlert()
    }

    /**
     * True when a user popup is requested by this broadcast SMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.isuserpopuprequested
     * @type {Boolean} 
     */
    IsUserPopupRequested {
        get => this.get_IsUserPopupRequested()
    }

    /**
     * Gets the message type of the broadcast SMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.messagetype
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
    }

    /**
     * Gets the device ID of the device that received the broadcast SMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the cellular class of this broadcast message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.cellularclass
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
    }

    /**
     * Gets the message class associated with this broadcast SMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.messageclass
     * @type {Integer} 
     */
    MessageClass {
        get => this.get_MessageClass()
    }

    /**
     * Gets the ICCID (Integrated Circuit Card Identifier) of the SIM that received the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcastmessage.simiccid
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
        if (!this.HasProp("__ISmsBroadcastMessage")) {
            if ((queryResult := this.QueryInterface(ISmsBroadcastMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsBroadcastMessage := ISmsBroadcastMessage(outPtr)
        }

        return this.__ISmsBroadcastMessage.get_Timestamp()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_To() {
        if (!this.HasProp("__ISmsBroadcastMessage")) {
            if ((queryResult := this.QueryInterface(ISmsBroadcastMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsBroadcastMessage := ISmsBroadcastMessage(outPtr)
        }

        return this.__ISmsBroadcastMessage.get_To()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Body() {
        if (!this.HasProp("__ISmsBroadcastMessage")) {
            if ((queryResult := this.QueryInterface(ISmsBroadcastMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsBroadcastMessage := ISmsBroadcastMessage(outPtr)
        }

        return this.__ISmsBroadcastMessage.get_Body()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Channel() {
        if (!this.HasProp("__ISmsBroadcastMessage")) {
            if ((queryResult := this.QueryInterface(ISmsBroadcastMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsBroadcastMessage := ISmsBroadcastMessage(outPtr)
        }

        return this.__ISmsBroadcastMessage.get_Channel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GeographicalScope() {
        if (!this.HasProp("__ISmsBroadcastMessage")) {
            if ((queryResult := this.QueryInterface(ISmsBroadcastMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsBroadcastMessage := ISmsBroadcastMessage(outPtr)
        }

        return this.__ISmsBroadcastMessage.get_GeographicalScope()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageCode() {
        if (!this.HasProp("__ISmsBroadcastMessage")) {
            if ((queryResult := this.QueryInterface(ISmsBroadcastMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsBroadcastMessage := ISmsBroadcastMessage(outPtr)
        }

        return this.__ISmsBroadcastMessage.get_MessageCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UpdateNumber() {
        if (!this.HasProp("__ISmsBroadcastMessage")) {
            if ((queryResult := this.QueryInterface(ISmsBroadcastMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsBroadcastMessage := ISmsBroadcastMessage(outPtr)
        }

        return this.__ISmsBroadcastMessage.get_UpdateNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BroadcastType() {
        if (!this.HasProp("__ISmsBroadcastMessage")) {
            if ((queryResult := this.QueryInterface(ISmsBroadcastMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsBroadcastMessage := ISmsBroadcastMessage(outPtr)
        }

        return this.__ISmsBroadcastMessage.get_BroadcastType()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEmergencyAlert() {
        if (!this.HasProp("__ISmsBroadcastMessage")) {
            if ((queryResult := this.QueryInterface(ISmsBroadcastMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsBroadcastMessage := ISmsBroadcastMessage(outPtr)
        }

        return this.__ISmsBroadcastMessage.get_IsEmergencyAlert()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUserPopupRequested() {
        if (!this.HasProp("__ISmsBroadcastMessage")) {
            if ((queryResult := this.QueryInterface(ISmsBroadcastMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsBroadcastMessage := ISmsBroadcastMessage(outPtr)
        }

        return this.__ISmsBroadcastMessage.get_IsUserPopupRequested()
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
