#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1538 structure specifies whether several MS-DOS File Control Blocks (FCBs) are placed in a single location.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1538
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1538 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies whether several MS-DOS File Control Blocks (FCBs) are placed in a single location accessible to the server.
     * @type {Integer}
     */
    sv1538_enablefcbopens {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
