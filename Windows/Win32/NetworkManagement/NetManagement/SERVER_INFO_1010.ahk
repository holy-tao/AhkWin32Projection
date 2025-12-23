#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1010 structure contains the auto-disconnect time associated with the specified server.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1010
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1010 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the auto-disconnect time, in minutes. 
     * 
     * 
     * 
     * 
     * If a session is idle longer than the period of time specified by this member, the server disconnects the session. If the value of this member is SV_NODISC, auto-disconnect is not enabled.
     * @type {Integer}
     */
    sv1010_disc {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
