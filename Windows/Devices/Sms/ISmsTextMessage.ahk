#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ISmsBinaryMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * This interface manipulates a decoded SMS text message. It provides direct access to the plain text body of the message, as well as key header properties, such as time stamp.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
  * 
  * > [!NOTE]
  * > This class and its methods are supported for the maintenance of legacy desktop apps that used it in earlier versions of Windows. If you do use this class, then you must specify the **Windows.Devices.Sms.LegacySmsApiContract** in your app's manifest. Don't use this class if you're developing a new app for Windows. Instead, use the APIs in this namespace that don't require the **Windows.Devices.Sms.LegacySmsApiContract**.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismstextmessage
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsTextMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsTextMessage
     * @type {Guid}
     */
    static IID => Guid("{d61c904c-a495-487f-9a6f-971548c5bc9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Timestamp", "get_PartReferenceId", "get_PartNumber", "get_PartCount", "get_To", "put_To", "get_From", "put_From", "get_Body", "put_Body", "get_Encoding", "put_Encoding", "ToBinaryMessages"]

    /**
     * Retrieves the timestamp of the message. It is determined locally for a constructed message instance or from the service center timestamp of a received message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismstextmessage.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Indicates a reference value that can be used if the message is part of a multi-part message. If this message belongs to a multi-part message, the [PartNumber](smstextmessage_partnumber.md) value can be used to reconstruct the full original message, and each part of that message will have the same value for [PartReferenceId](smstextmessage_partreferenceid.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismstextmessage.partreferenceid
     * @type {Integer} 
     */
    PartReferenceId {
        get => this.get_PartReferenceId()
    }

    /**
     * Retrieves the part number of a multi-part message if this message is part of a multi-part message. It can be used to reconstruct the original message by joining the parts together, in conjunction with the PartReferenceId and PartCount properties.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismstextmessage.partnumber
     * @type {Integer} 
     */
    PartNumber {
        get => this.get_PartNumber()
    }

    /**
     * Retrieves the total number of parts in the original message if the message is part of a multi-part message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismstextmessage.partcount
     * @type {Integer} 
     */
    PartCount {
        get => this.get_PartCount()
    }

    /**
     * Specifies the recipient phone number of this message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismstextmessage.to
     * @type {HSTRING} 
     */
    To {
        get => this.get_To()
        set => this.put_To(value)
    }

    /**
     * Specifies the phone number of the sender of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismstextmessage.from
     * @type {HSTRING} 
     */
    From {
        get => this.get_From()
        set => this.put_From(value)
    }

    /**
     * Specifies the plain text body of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismstextmessage.body
     * @type {HSTRING} 
     */
    Body {
        get => this.get_Body()
        set => this.put_Body(value)
    }

    /**
     * Specifies the encoding type that has been set to use when sending this message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismstextmessage.encoding
     * @type {Integer} 
     */
    Encoding {
        get => this.get_Encoding()
        set => this.put_Encoding(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PartReferenceId() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PartNumber() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PartCount() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_To() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_To(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_From() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_From(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Body() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Body(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Encoding() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Encoding(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reads a message in the specified format and places the results in a new instance of a binary message.
     * @param {Integer} format A value from the [SmsDataFormat](smsdataformat.md) enumeration.
     * @returns {IVectorView<ISmsBinaryMessage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismstextmessage.tobinarymessages
     */
    ToBinaryMessages(format) {
        result := ComCall(18, this, "int", format, "ptr*", &messages := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ISmsBinaryMessage, messages)
    }
}
