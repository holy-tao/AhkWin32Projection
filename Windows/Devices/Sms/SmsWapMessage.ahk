#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsWapMessage.ahk
#Include .\ISmsMessageBase.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an SMS WAP push message.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * Pass the [DeviceId](smswapmessage_deviceid.md) property to [SmsDevice.FromIdAsync](smsdevice_fromidasync_1322863552.md) to activate the device and retrieve additional message details.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smswapmessage
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsWapMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsWapMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsWapMessage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the timestamp of the [SmsWapMessage](smswapmessage.md).
     * 
     * The Timestamp property is determined locally for a constructed message instance or from the service center timestamp of a received message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smswapmessage.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the recipient phone number of this [SmsWapMessage](smswapmessage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smswapmessage.to
     * @type {HSTRING} 
     */
    To {
        get => this.get_To()
    }

    /**
     * Gets the phone number of the sender of the [SmsWapMessage](smswapmessage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smswapmessage.from
     * @type {HSTRING} 
     */
    From {
        get => this.get_From()
    }

    /**
     * Gets the value of the X-Wap-Application-Id header of the [SmsWapMessage](smswapmessage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smswapmessage.applicationid
     * @type {HSTRING} 
     */
    ApplicationId {
        get => this.get_ApplicationId()
    }

    /**
     * Gets the value of the **Content-Type** header in the [SmsWapMessage](smswapmessage.md). Header parameters can be found in the [Headers](smswapmessage_headers.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smswapmessage.contenttype
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
    }

    /**
     * Gets the binary body of the blob in the [SmsWapMessage](smswapmessage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smswapmessage.binarybody
     * @type {IBuffer} 
     */
    BinaryBody {
        get => this.get_BinaryBody()
    }

    /**
     * Gets the header name-value pairs of the WAP push message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smswapmessage.headers
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Headers {
        get => this.get_Headers()
    }

    /**
     * Gets the message type of the [SmsWapMessage](smswapmessage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smswapmessage.messagetype
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
    }

    /**
     * Gets the device information ID of the [SmsDevice](smsdevice.md) that receives the [SmsWapMessage](smswapmessage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smswapmessage.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the cellular class of the SMS device that received the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smswapmessage.cellularclass
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
    }

    /**
     * Gets the message class of the [SmsWapMessage](smswapmessage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smswapmessage.messageclass
     * @type {Integer} 
     */
    MessageClass {
        get => this.get_MessageClass()
    }

    /**
     * Gets the ICCID (Integrated Circuit Card Identifier) of the SIM that received the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smswapmessage.simiccid
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
        if (!this.HasProp("__ISmsWapMessage")) {
            if ((queryResult := this.QueryInterface(ISmsWapMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsWapMessage := ISmsWapMessage(outPtr)
        }

        return this.__ISmsWapMessage.get_Timestamp()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_To() {
        if (!this.HasProp("__ISmsWapMessage")) {
            if ((queryResult := this.QueryInterface(ISmsWapMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsWapMessage := ISmsWapMessage(outPtr)
        }

        return this.__ISmsWapMessage.get_To()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_From() {
        if (!this.HasProp("__ISmsWapMessage")) {
            if ((queryResult := this.QueryInterface(ISmsWapMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsWapMessage := ISmsWapMessage(outPtr)
        }

        return this.__ISmsWapMessage.get_From()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ApplicationId() {
        if (!this.HasProp("__ISmsWapMessage")) {
            if ((queryResult := this.QueryInterface(ISmsWapMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsWapMessage := ISmsWapMessage(outPtr)
        }

        return this.__ISmsWapMessage.get_ApplicationId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentType() {
        if (!this.HasProp("__ISmsWapMessage")) {
            if ((queryResult := this.QueryInterface(ISmsWapMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsWapMessage := ISmsWapMessage(outPtr)
        }

        return this.__ISmsWapMessage.get_ContentType()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_BinaryBody() {
        if (!this.HasProp("__ISmsWapMessage")) {
            if ((queryResult := this.QueryInterface(ISmsWapMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsWapMessage := ISmsWapMessage(outPtr)
        }

        return this.__ISmsWapMessage.get_BinaryBody()
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Headers() {
        if (!this.HasProp("__ISmsWapMessage")) {
            if ((queryResult := this.QueryInterface(ISmsWapMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsWapMessage := ISmsWapMessage(outPtr)
        }

        return this.__ISmsWapMessage.get_Headers()
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
