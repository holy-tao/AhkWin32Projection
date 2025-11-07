#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SOCKADDR structure is a generic structure that specifies a transport address.
 * @remarks
 * 
 * The SOCKADDR structure is large enough to contain a transport address for most address families. For a
 *     structure that is guaranteed to be large enough to contain a transport address for all possible address
 *     families, see 
 *     [SOCKADDR_STORAGE](./ns-ws2def-sockaddr_storage_lh.md).
 * 
 * A WSK application typically does not access the 
 *     <b>sa_data</b> member directly. Instead, a pointer to a SOCKADDR structure is normally cast to a pointer
 *     to the specific SOCKADDR structure type that corresponds to a particular address family.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2def/ns-ws2def-sockaddr
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR extends Win32Struct
{
    static sizeof => 30

    static packingSize => 2

    /**
     * The address family for the transport address. For more information about supported address
     *      families, see 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/mt808757(v=vs.85)">WSK Address Families</a>.
     * @type {Integer}
     */
    sa_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * An array of 14 bytes that contains the transport address data.
     * @type {String}
     */
    sa_data {
        get => StrGet(this.ptr + 2, 13, "UTF-16")
        set => StrPut(value, this.ptr + 2, 13, "UTF-16")
    }
}
