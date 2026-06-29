#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The MSG_INFO_1 structure specifies a message alias. This structure exists only for compatibility. Message forwarding is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/lmmsg/ns-lmmsg-msg_info_1
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct MSG_INFO_1 {
    #StructPack 8

    /**
     * Pointer to a Unicode string that specifies the alias to which the message is to be sent. The constant LEN specifies the maximum number of characters in the string.
     */
    msgi1_name : PWSTR

    /**
     * This member must be zero.
     */
    msgi1_forward_flag : UInt32

    /**
     * This member must be <b>NULL</b>.
     */
    msgi1_forward : PWSTR

}
