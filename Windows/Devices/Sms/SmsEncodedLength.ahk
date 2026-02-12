#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * This structure represents information about the length of an [SmsTextMessage](ismstextmessage.md) object when it is encoded as a PDU.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsencodedlength
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsEncodedLength extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The number of segments needed to encode the message.
     * @type {Integer}
     */
    SegmentCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of characters in the last segment of the encoded message.
     * @type {Integer}
     */
    CharacterCountLastSegment {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The estimated number of characters that can fit in one segment of the message.
     * @type {Integer}
     */
    CharactersPerSegment {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of bytes in the last segment of the encoded message.
     * @type {Integer}
     */
    ByteCountLastSegment {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of bytes in each segment of the message.
     * @type {Integer}
     */
    BytesPerSegment {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
