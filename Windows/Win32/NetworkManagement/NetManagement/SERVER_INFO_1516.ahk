#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1516 structure specifies whether the server is a reliable time source.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_1516
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1516 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies whether the server is a reliable time source.
     * @type {Integer}
     */
    sv1516_timesource {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
