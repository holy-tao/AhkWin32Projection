#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_QUERY_CONNECTION_GROUP_RESULT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cHosts {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<WINHTTP_HOST_CONNECTION_GROUP>}
     */
    pHostConnectionGroups {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
