#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MBN_SMS_FILTER structure contains the values that describe a set of SMS messages.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ns-mbnapi-mbn_sms_filter
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_SMS_FILTER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_sms_flag">MBN_SMS_FLAG</a> value that 	specifies the message class.
     * @type {Integer}
     */
    flag {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Contains the index of a particular message in device memory.  This value is only meaningful when <b>flag</b> is set to 	<b>MBN_SMS_FLAG_INDEX</b>.  The maximum range of this value is from 1 to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd323170(v=vs.85)">MaxMessageIndex</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsconfiguration">IMbnSmsConfiguration</a>.
     * @type {Integer}
     */
    messageIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
