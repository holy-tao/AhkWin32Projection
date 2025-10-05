#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1017 structure contains the network announce rate associated with the specified server.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1017
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1017 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the network announce rate, in seconds. This rate determines how often the server is announced to other computers on the network. 
     * 
     * 
     * 
     * 
     * For more information about how much the announce rate can vary from the period of time specified by this member, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_info_1018">SERVER_INFO_1018</a>.
     * @type {Integer}
     */
    sv1017_announce {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
