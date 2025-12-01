#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MBN_SMS_STATUS_INFO structure contains the status of the SMS message store of a device.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ns-mbnapi-mbn_sms_status_info
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_SMS_STATUS_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_sms_status_flag">MBN_SMS_STATUS_FLAG</a> values that specify the state of the message store.
     * @type {Integer}
     */
    flag {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the index of the last received message in the store.  This field is only meaningful when <b>flag</b> contains <b>MBN_SMS_FLAG_NEW_MESSAGE</b>.
     * @type {Integer}
     */
    messageIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
