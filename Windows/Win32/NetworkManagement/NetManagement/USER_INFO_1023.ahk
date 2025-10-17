#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_1023 structure contains the name of the server to which network logon requests should be sent. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_1023
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1023 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a Unicode string that contains the name of the server to which logon requests for the user account should be sent. The user account is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. 
     * 
     * 
     * 
     * 
     * Server names should be preceded by two backslashes (\\). To indicate that the logon request can be handled by any logon server, specify an asterisk (\\*) for the server name. A null string indicates that requests should be sent to the domain controller.
     * @type {PWSTR}
     */
    usri1023_logon_server {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
