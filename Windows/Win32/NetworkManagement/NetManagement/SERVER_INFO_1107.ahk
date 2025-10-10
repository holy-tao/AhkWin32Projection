#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1107 structure specifies the number of users that can simultaneously log on to the specified server.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_1107
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1107 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the number of users who can attempt to log on to the system server. Note that it is the license server that determines how many of these users can actually log on.
     * @type {Integer}
     */
    sv1107_users {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
