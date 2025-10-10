#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN_ADDR.ahk

/**
 * The SOCKADDR_IN structure specifies a transport address and port for the AF_INET address family.
 * @remarks
 * 
  * All of the data in the SOCKADDR_IN structure, except for the address family, must be specified in
  *     network-byte-order (big-endian).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2def/ns-ws2def-sockaddr_in
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_IN extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The address family for the transport address. This member should always be set to AF_INET.
     * @type {Integer}
     */
    sin_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A transport protocol port number.
     * @type {Integer}
     */
    sin_port {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * An 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff556972(v=vs.85)">IN_ADDR</a> structure that contains an IPv4 transport
     *      address.
     * @type {IN_ADDR}
     */
    sin_addr{
        get {
            if(!this.HasProp("__sin_addr"))
                this.__sin_addr := IN_ADDR(this.ptr + 4)
            return this.__sin_addr
        }
    }

    /**
     * Reserved for system use. A WSK application should set the contents of this array to zero.
     * @type {String}
     */
    sin_zero {
        get => StrGet(this.ptr + 8, 7, "UTF-16")
        set => StrPut(value, this.ptr + 8, 7, "UTF-16")
    }
}
