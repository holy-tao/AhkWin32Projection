#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WinSock\SOCKADDR.ahk" { SOCKADDR }

/**
 * Specifies the addresses (local and remote) used for a particular HTTP connection.
 * @remarks
 * Although the <b>pRemoteAddress</b> and <b>pLocalAddress</b> members are formally declared as <b>PSOCKADDR</b>, they are in fact <b>PSOCKADDR_IN</b> or <b>PSOCKADDR_IN6</b> types. Inspect the <b>sa_family</b> member, which is the same in all three structures, to determine how to access the address. If <b>sa_family</b> is equal to AF_INET, then the address is in IPv4 form and can be accessed by casting the members to <b>PSOCKADDR_IN</b>, but if <b>sa_family</b> equals AF_INET6, the address is in IPv6 form and you must cast them to <b>PSOCKADDR_IN6</b> before accessing the address. Both <b>pLocalAddress</b> and <b>pRemoteAddress</b> are always of the same type; that is they are either both of type <b>PSOCKADDR_IN</b> or both of type <b>PSOCKADDR_IN6</b>.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_transport_address
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_TRANSPORT_ADDRESS {
    #StructPack 8

    /**
     * A pointer to the remote IP address associated with this connection. For more information about how to access this address, see the Remarks section.
     */
    pRemoteAddress : SOCKADDR.Ptr

    /**
     * A pointer to the local IP address associated with this connection. For more information about how to access this address, see the Remarks section.
     */
    pLocalAddress : SOCKADDR.Ptr

}
