#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MBN_SMS_FLAG.ahk" { MBN_SMS_FLAG }

/**
 * The MBN_SMS_FILTER structure contains the values that describe a set of SMS messages.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ns-mbnapi-mbn_sms_filter
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_SMS_FILTER {
    #StructPack 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_sms_flag">MBN_SMS_FLAG</a> value that 	specifies the message class.
     */
    flag : MBN_SMS_FLAG

    /**
     * Contains the index of a particular message in device memory.  This value is only meaningful when <b>flag</b> is set to 	<b>MBN_SMS_FLAG_INDEX</b>.  The maximum range of this value is from 1 to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd323170(v=vs.85)">MaxMessageIndex</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsconfiguration">IMbnSmsConfiguration</a>.
     */
    messageIndex : UInt32

}
