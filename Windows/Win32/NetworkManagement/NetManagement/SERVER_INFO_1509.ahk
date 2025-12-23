#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1509 structure specifies the maximum raw mode buffer size.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1509
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1509 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the maximum raw mode buffer size, in bytes.
     * @type {Integer}
     */
    sv1509_maxrawbuflen {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
