#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsFilterRule.ahk
#Include .\ISmsFilterRuleFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes an SMS filtering rule.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsFilterRule extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsFilterRule

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsFilterRule.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new, empty [SmsFilterRule](smsfilterrule.md).
     * @param {Integer} messageType An enumeration value specifying the message type that will match this rule.
     * @returns {SmsFilterRule} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule.#ctor
     */
    static CreateFilterRule(messageType) {
        if (!SmsFilterRule.HasProp("__ISmsFilterRuleFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsFilterRule")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsFilterRuleFactory.IID)
            SmsFilterRule.__ISmsFilterRuleFactory := ISmsFilterRuleFactory(factoryPtr)
        }

        return SmsFilterRule.__ISmsFilterRuleFactory.CreateFilterRule(messageType)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the message type of an SMS message that matches this filter rule.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule.messagetype
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
    }

    /**
     * Gets the IMSI prefixes for an SMS message that matches this rule.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule.imsiprefixes
     * @type {IVector<HSTRING>} 
     */
    ImsiPrefixes {
        get => this.get_ImsiPrefixes()
    }

    /**
     * Gets a list of device identifiers for an SMS message that matches this rule.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule.deviceids
     * @type {IVector<HSTRING>} 
     */
    DeviceIds {
        get => this.get_DeviceIds()
    }

    /**
     * Gets the sender numbers associated with an SMS message that matches this rule.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule.sendernumbers
     * @type {IVector<HSTRING>} 
     */
    SenderNumbers {
        get => this.get_SenderNumbers()
    }

    /**
     * Gets a list of the text message prefixes for an SMS message that matches this filter.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule.textmessageprefixes
     * @type {IVector<HSTRING>} 
     */
    TextMessagePrefixes {
        get => this.get_TextMessagePrefixes()
    }

    /**
     * Gets a list of port numbers associated with the SMS message that matches this rule.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule.portnumbers
     * @type {IVector<Integer>} 
     */
    PortNumbers {
        get => this.get_PortNumbers()
    }

    /**
     * The cellular class identifier for SMS messages that match this rule.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule.cellularclass
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
        set => this.put_CellularClass(value)
    }

    /**
     * Gets a list of protocol identifiers associated with the SMS message that matches this rule..
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule.protocolids
     * @type {IVector<Integer>} 
     */
    ProtocolIds {
        get => this.get_ProtocolIds()
    }

    /**
     * Gets the list of teleservice identifiers for an SMS message that matches this rule.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule.teleserviceids
     * @type {IVector<Integer>} 
     */
    TeleserviceIds {
        get => this.get_TeleserviceIds()
    }

    /**
     * Gets a list of WAP application identifiers for the SMS message that matches this rule.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule.wapapplicationids
     * @type {IVector<HSTRING>} 
     */
    WapApplicationIds {
        get => this.get_WapApplicationIds()
    }

    /**
     * Gets a list of WAP content types for the SMS message that matches this rule.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule.wapcontenttypes
     * @type {IVector<HSTRING>} 
     */
    WapContentTypes {
        get => this.get_WapContentTypes()
    }

    /**
     * Gets a list of broadcast types for an SMS message that matches this rule.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule.broadcasttypes
     * @type {IVector<Integer>} 
     */
    BroadcastTypes {
        get => this.get_BroadcastTypes()
    }

    /**
     * A list of broadcast channels that match this rule.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsfilterrule.broadcastchannels
     * @type {IVector<Integer>} 
     */
    BroadcastChannels {
        get => this.get_BroadcastChannels()
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
        if (!this.HasProp("__ISmsFilterRule")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRule := ISmsFilterRule(outPtr)
        }

        return this.__ISmsFilterRule.get_MessageType()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ImsiPrefixes() {
        if (!this.HasProp("__ISmsFilterRule")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRule := ISmsFilterRule(outPtr)
        }

        return this.__ISmsFilterRule.get_ImsiPrefixes()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_DeviceIds() {
        if (!this.HasProp("__ISmsFilterRule")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRule := ISmsFilterRule(outPtr)
        }

        return this.__ISmsFilterRule.get_DeviceIds()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_SenderNumbers() {
        if (!this.HasProp("__ISmsFilterRule")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRule := ISmsFilterRule(outPtr)
        }

        return this.__ISmsFilterRule.get_SenderNumbers()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_TextMessagePrefixes() {
        if (!this.HasProp("__ISmsFilterRule")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRule := ISmsFilterRule(outPtr)
        }

        return this.__ISmsFilterRule.get_TextMessagePrefixes()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_PortNumbers() {
        if (!this.HasProp("__ISmsFilterRule")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRule := ISmsFilterRule(outPtr)
        }

        return this.__ISmsFilterRule.get_PortNumbers()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CellularClass() {
        if (!this.HasProp("__ISmsFilterRule")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRule := ISmsFilterRule(outPtr)
        }

        return this.__ISmsFilterRule.get_CellularClass()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CellularClass(value) {
        if (!this.HasProp("__ISmsFilterRule")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRule := ISmsFilterRule(outPtr)
        }

        return this.__ISmsFilterRule.put_CellularClass(value)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_ProtocolIds() {
        if (!this.HasProp("__ISmsFilterRule")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRule := ISmsFilterRule(outPtr)
        }

        return this.__ISmsFilterRule.get_ProtocolIds()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_TeleserviceIds() {
        if (!this.HasProp("__ISmsFilterRule")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRule := ISmsFilterRule(outPtr)
        }

        return this.__ISmsFilterRule.get_TeleserviceIds()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_WapApplicationIds() {
        if (!this.HasProp("__ISmsFilterRule")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRule := ISmsFilterRule(outPtr)
        }

        return this.__ISmsFilterRule.get_WapApplicationIds()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_WapContentTypes() {
        if (!this.HasProp("__ISmsFilterRule")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRule := ISmsFilterRule(outPtr)
        }

        return this.__ISmsFilterRule.get_WapContentTypes()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_BroadcastTypes() {
        if (!this.HasProp("__ISmsFilterRule")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRule := ISmsFilterRule(outPtr)
        }

        return this.__ISmsFilterRule.get_BroadcastTypes()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_BroadcastChannels() {
        if (!this.HasProp("__ISmsFilterRule")) {
            if ((queryResult := this.QueryInterface(ISmsFilterRule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsFilterRule := ISmsFilterRule(outPtr)
        }

        return this.__ISmsFilterRule.get_BroadcastChannels()
    }

;@endregion Instance Methods
}
