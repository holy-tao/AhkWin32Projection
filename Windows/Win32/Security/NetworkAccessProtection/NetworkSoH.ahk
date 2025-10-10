#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the wire SoH protocol.
 * @see https://docs.microsoft.com/windows/win32/api//naptypes/ns-naptypes-networksoh
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class NetworkSoH extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes, of the data blob in the range <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-type-constants">minNetworkSoHSize</a> to <b>maxNetworkSoHSize</b>.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A pointer to a data blob that contains the <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoH</a> structure in network byte order.
     * @type {Pointer<Byte>}
     */
    data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
