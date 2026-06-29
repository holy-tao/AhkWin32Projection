#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The MSG_INFO_0 structure specifies a message alias.
 * @see https://learn.microsoft.com/windows/win32/api/lmmsg/ns-lmmsg-msg_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct MSG_INFO_0 {
    #StructPack 8

    /**
     * Pointer to a Unicode string that specifies the alias to which the message is to be sent. The constant LEN specifies the maximum number of characters in the string.
     */
    msgi0_name : PWSTR

}
