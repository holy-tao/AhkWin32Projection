#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1523 structure specifies the length of time the server retains information about incomplete search operations.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_1523
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1523 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the length of time the server retains information about incomplete search operations.
     * @type {Integer}
     */
    sv1523_maxkeepsearch {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
