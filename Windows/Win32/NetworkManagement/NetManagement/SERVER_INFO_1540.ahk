#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1540 structure specifies whether the server allows redirected server drives to be shared.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_1540
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1540 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies whether the server allows redirected server drives to be shared.
     * @type {Integer}
     */
    sv1540_enablesharednetdrives {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
