#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1503 structure specifies the number of search operations that can be carried out simultaneously.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_1503
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1503 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the number of search operations that can be carried out simultaneously.
     * @type {Integer}
     */
    sv1503_opensearch {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
