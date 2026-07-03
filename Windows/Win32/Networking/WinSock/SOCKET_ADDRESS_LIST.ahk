#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKADDR.ahk" { SOCKADDR }
#Import ".\SOCKET_ADDRESS.ahk" { SOCKET_ADDRESS }

/**
 * The SOCKET_ADDRESS_LIST structure defines a variable-sized list of transport addresses.
 * @remarks
 * A WSK application passes a buffer to the 
 *     <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wsk/nc-wsk-pfn_wsk_control_socket">WskControlSocket</a> function when the WSK
 *     application queries the current list of local transport addresses that match a socket's address family.
 *     If the call to the 
 *     <b>WskControlSocket</b> function succeeds, the buffer contains a SOCKET_ADDRESS_LIST structure followed by
 *     the SOCKADDR structures for each of the local transport addresses that match the socket's address family.
 *     The WSK subsystem fills in the 
 *     <b>Address</b> array and sets the 
 *     <b>iAddressCount</b> member to the number of entries in the array. The 
 *     <b>lpSockaddr</b> pointers in each of the SOCKET_ADDRESS structures in the array point to the specific
 *     SOCKADDR structure type that corresponds to the address family that the WSK application specified when it
 *     created the socket.
 * 
 * For more information about querying the current list of local transport addresses, see 
 *     <a href="https://docs.microsoft.com/windows/win32/winsock/sio-address-list-query">SIO_ADDRESS_LIST_QUERY</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ws2def/ns-ws2def-socket_address_list
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKET_ADDRESS_LIST {
    #StructPack 8

    /**
     * The number of transport addresses in the list.
     */
    iAddressCount : Int32

    /**
     * A variable-sized array of SOCKET_ADDRESS structures. The SOCKET_ADDRESS structure is defined as
     *      follows:
     *      
     * 
     * 
     * ```
     * typedef struct _SOCKET_ADDRESS {
     *   LPSOCKADDR  lpSockaddr;
     *   INT  iSockaddrLength;
     * } SOCKET_ADDRESS, *PSOCKET_ADDRESS, *LPSOCKET_ADDRESS;
     * ```
     */
    Address : SOCKET_ADDRESS[1]

}
