#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN6_ADDR.ahk" { IN6_ADDR }

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
 */
export default struct SOCKADDR_IN6_W2KSP1 {
    #StructPack 4

    /**
     * The address family for the transport address. This member should always be set to AF_INET6.
     */
    sin6_family : Int16

    /**
     * A transport protocol port number.
     */
    sin6_port : UInt16

    /**
     * The IPv6 flow information.
     */
    sin6_flowinfo : UInt32

    /**
     * An 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/in6addr/ns-in6addr-in6_addr">IN6_ADDR</a> structure that contains an IPv6 transport
     *      address.
     */
    sin6_addr : IN6_ADDR

    /**
     * A ULONG representation of the IPv6 scope identifier that is defined in the 
     *       <b>sin6_scope_struct</b> member.
     */
    sin6_scope_id : UInt32

}
