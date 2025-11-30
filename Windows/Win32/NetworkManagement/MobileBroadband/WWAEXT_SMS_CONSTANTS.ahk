#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_SMS_CONSTANTS enumerated type contains SMS constant values.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-wwaext_sms_constants
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class WWAEXT_SMS_CONSTANTS extends Win32Enum{

    /**
     * The message is not stored in device memory.  This constant is used by <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsreadmsgpdu">IMbnSmsReadMsgPdu</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsreadmsgtextcdma">IMbnSmsReadMsgTextCdma</a>.
     * @type {Integer (Int32)}
     */
    static MBN_MESSAGE_INDEX_NONE => 0

    /**
     * The device does not support SMS.  This constant is used by <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsconfiguration">IMbnSmsConfiguration</a>.
     * @type {Integer (Int32)}
     */
    static MBN_CDMA_SHORT_MSG_SIZE_UNKNOWN => 0

    /**
     * The maximum size of a CDMA short message.
     * @type {Integer (Int32)}
     */
    static MBN_CDMA_SHORT_MSG_SIZE_MAX => 160
}
