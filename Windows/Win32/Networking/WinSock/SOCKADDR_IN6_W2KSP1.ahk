#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN6_ADDR.ahk

/**
 * The SOCKADDR_IN6_W2KSP1 (ws2ipdef.h) structure specifies a transport address and port for the AF_INET6 address family.
 * @remarks
 * All of the data in the SOCKADDR_IN6 structure, except for the address family, must be specified in
 *     network-byte-order (big-endian).
 * 
 * The size of the SOCKADDR_IN6 structure is too large to fit in the memory space that is provided by a 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-sockaddr">SOCKADDR</a> structure. For a structure that is
 *     guaranteed to be large enough to contain a transport address for all possible address families, see 
 *     [SOCKADDR_STORAGE](../ws2def/ns-ws2def-sockaddr_storage_lh.md).
 * @see https://learn.microsoft.com/windows/win32/api/ws2ipdef/ns-ws2ipdef-sockaddr_in6_w2ksp1
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKADDR_IN6_W2KSP1 extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * The address family for the transport address. This member should always be set to AF_INET6.
     * @type {Integer}
     */
    sin6_family {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * A transport protocol port number.
     * @type {Integer}
     */
    sin6_port {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The IPv6 flow information.
     * @type {Integer}
     */
    sin6_flowinfo {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/in6addr/ns-in6addr-in6_addr">IN6_ADDR</a> structure that contains an IPv6 transport
     *      address.
     * @type {IN6_ADDR}
     */
    sin6_addr{
        get {
            if(!this.HasProp("__sin6_addr"))
                this.__sin6_addr := IN6_ADDR(8, this)
            return this.__sin6_addr
        }
    }

    /**
     * A ULONG representation of the IPv6 scope identifier that is defined in the 
     *       <b>sin6_scope_struct</b> member.
     * @type {Integer}
     */
    sin6_scope_id {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
