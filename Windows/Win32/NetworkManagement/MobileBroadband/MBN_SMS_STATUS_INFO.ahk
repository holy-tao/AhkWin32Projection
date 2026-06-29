#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_SMS_STATUS_INFO structure contains the status of the SMS message store of a device.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ns-mbnapi-mbn_sms_status_info
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_SMS_STATUS_INFO {
    #StructPack 4

    /**
     * A bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_sms_status_flag">MBN_SMS_STATUS_FLAG</a> values that specify the state of the message store.
     */
    flag : UInt32

    /**
     * Contains the index of the last received message in the store.  This field is only meaningful when <b>flag</b> contains <b>MBN_SMS_FLAG_NEW_MESSAGE</b>.
     */
    messageIndex : UInt32

}
