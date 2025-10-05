#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1539 structure specifies whether the server processes raw Server Message Blocks (SMBs).
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1539
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1539 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies whether the server processes raw SMBs. If enabled, this member allows more data to be transferred per transaction and improves performance. However, it is possible that processing raw SMBs can impede performance on certain networks. The server maintains the value of this member.
     * @type {Integer}
     */
    sv1539_enableraw {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
