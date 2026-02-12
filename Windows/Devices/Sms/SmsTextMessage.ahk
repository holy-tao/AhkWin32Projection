#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsTextMessage.ahk
#Include .\ISmsMessage.ahk
#Include .\ISmsTextMessageStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages a decoded SMS text message, providing direct access to the plain text body of the message, as well as key header properties, such as time stamp.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
  * 
  * > [!NOTE]
  * > This class and its methods are supported for the maintenance of legacy desktop apps that used it in earlier versions of Windows. If you do use this class, then you must specify the **Windows.Devices.Sms.LegacySmsApiContract** in your app's manifest. Don't use this class if you're developing a new app for Windows. Instead, use the APIs in this namespace that don't require the **Windows.Devices.Sms.LegacySmsApiContract**.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsTextMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsTextMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsTextMessage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Reads a binary message and decodes it. The results are placed in a new instance of a text message.
     * @param {SmsBinaryMessage} binaryMessage An instance of a binary message to decode.
     * @returns {SmsTextMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage.frombinarymessage
     */
    static FromBinaryMessage(binaryMessage) {
        if (!SmsTextMessage.HasProp("__ISmsTextMessageStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsTextMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsTextMessageStatics.IID)
            SmsTextMessage.__ISmsTextMessageStatics := ISmsTextMessageStatics(factoryPtr)
        }

        return SmsTextMessage.__ISmsTextMessageStatics.FromBinaryMessage(binaryMessage)
    }

    /**
     * Decodes a binary message and places the results in a new instance of a text message. This method represents the binary message as a reference to a buffer of bytes and a selection of how the buffer is encoded. Therefore, it can be used when the message did not originate directly from the device or as an instance of an [SmsBinaryMessage](smsbinarymessage.md) class.
     * @param {Integer} format An [SmsDataFormat](smsdataformat.md) enumerated value that identifies the format of a particular protocol description unit (PDU) buffer.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value An array of bytes containing the binary data to decode.
     * @returns {SmsTextMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage.frombinarydata
     */
    static FromBinaryData(format, value_length, value) {
        if (!SmsTextMessage.HasProp("__ISmsTextMessageStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsTextMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsTextMessageStatics.IID)
            SmsTextMessage.__ISmsTextMessageStatics := ISmsTextMessageStatics(factoryPtr)
        }

        return SmsTextMessage.__ISmsTextMessageStatics.FromBinaryData(format, value_length, value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Indicates the timestamp of the message. It is determined locally for a constructed message instance or from the service center timestamp of a received message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Indicates a reference value that can be used if the message is part of a multi-part message. If this message belongs to a multi-part message, the [PartNumber](smstextmessage_partnumber.md) value can be used to reconstruct the full original message, and each part of that message will have the same value for PartReferenceId.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage.partreferenceid
     * @type {Integer} 
     */
    PartReferenceId {
        get => this.get_PartReferenceId()
    }

    /**
     * Indicates the part number of a multi-part message if this message is part of a multi-part message. It can be used to reconstruct the original message by joining the parts together, in conjunction with the [PartReferenceId](smstextmessage_partreferenceid.md) and [PartCount](smstextmessage_partcount.md) properties.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage.partnumber
     * @type {Integer} 
     */
    PartNumber {
        get => this.get_PartNumber()
    }

    /**
     * Indicates the total number of parts in the original message if the message is part of a multi-part message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage.partcount
     * @type {Integer} 
     */
    PartCount {
        get => this.get_PartCount()
    }

    /**
     * Indicates the recipient phone number of this message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage.to
     * @type {HSTRING} 
     */
    To {
        get => this.get_To()
        set => this.put_To(value)
    }

    /**
     * Specifies the phone number of the sender of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage.from
     * @type {HSTRING} 
     */
    From {
        get => this.get_From()
        set => this.put_From(value)
    }

    /**
     * Specifies the plain text body of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage.body
     * @type {HSTRING} 
     */
    Body {
        get => this.get_Body()
        set => this.put_Body(value)
    }

    /**
     * Specifies the encoding type that has been set to use when sending this message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage.encoding
     * @type {Integer} 
     */
    Encoding {
        get => this.get_Encoding()
        set => this.put_Encoding(value)
    }

    /**
     * Indicates the ID of the SMS text message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Specifies the message class of a message. This message class typically originates on the network, not the mobile device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage.messageclass
     * @type {Integer} 
     */
    MessageClass {
        get => this.get_MessageClass()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [SmsTextMessage](smstextmessage.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsTextMessage")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ISmsTextMessage")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage := ISmsTextMessage(outPtr)
        }

        return this.__ISmsTextMessage.get_Timestamp()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PartReferenceId() {
        if (!this.HasProp("__ISmsTextMessage")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage := ISmsTextMessage(outPtr)
        }

        return this.__ISmsTextMessage.get_PartReferenceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PartNumber() {
        if (!this.HasProp("__ISmsTextMessage")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage := ISmsTextMessage(outPtr)
        }

        return this.__ISmsTextMessage.get_PartNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PartCount() {
        if (!this.HasProp("__ISmsTextMessage")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage := ISmsTextMessage(outPtr)
        }

        return this.__ISmsTextMessage.get_PartCount()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_To() {
        if (!this.HasProp("__ISmsTextMessage")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage := ISmsTextMessage(outPtr)
        }

        return this.__ISmsTextMessage.get_To()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_To(value) {
        if (!this.HasProp("__ISmsTextMessage")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage := ISmsTextMessage(outPtr)
        }

        return this.__ISmsTextMessage.put_To(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_From() {
        if (!this.HasProp("__ISmsTextMessage")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage := ISmsTextMessage(outPtr)
        }

        return this.__ISmsTextMessage.get_From()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_From(value) {
        if (!this.HasProp("__ISmsTextMessage")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage := ISmsTextMessage(outPtr)
        }

        return this.__ISmsTextMessage.put_From(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Body() {
        if (!this.HasProp("__ISmsTextMessage")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage := ISmsTextMessage(outPtr)
        }

        return this.__ISmsTextMessage.get_Body()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Body(value) {
        if (!this.HasProp("__ISmsTextMessage")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage := ISmsTextMessage(outPtr)
        }

        return this.__ISmsTextMessage.put_Body(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Encoding() {
        if (!this.HasProp("__ISmsTextMessage")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage := ISmsTextMessage(outPtr)
        }

        return this.__ISmsTextMessage.get_Encoding()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Encoding(value) {
        if (!this.HasProp("__ISmsTextMessage")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage := ISmsTextMessage(outPtr)
        }

        return this.__ISmsTextMessage.put_Encoding(value)
    }

    /**
     * Reads a message in the specified format and places the results in a new instance of a binary message.
     * @param {Integer} format A value from the SmsDataFormat enumeration.
     * @returns {IVectorView<ISmsBinaryMessage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smstextmessage.tobinarymessages
     */
    ToBinaryMessages(format) {
        if (!this.HasProp("__ISmsTextMessage")) {
            if ((queryResult := this.QueryInterface(ISmsTextMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsTextMessage := ISmsTextMessage(outPtr)
        }

        return this.__ISmsTextMessage.ToBinaryMessages(format)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__ISmsMessage")) {
            if ((queryResult := this.QueryInterface(ISmsMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessage := ISmsMessage(outPtr)
        }

        return this.__ISmsMessage.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageClass() {
        if (!this.HasProp("__ISmsMessage")) {
            if ((queryResult := this.QueryInterface(ISmsMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessage := ISmsMessage(outPtr)
        }

        return this.__ISmsMessage.get_MessageClass()
    }

;@endregion Instance Methods
}
