#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SOCKET_ADDRESS.ahk

/**
 * The SOCKET_ADDRESS_LIST structure defines a variable-sized list of transport addresses.
 * @remarks
 * 
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
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd877219(v=vs.85)">SIO_ADDRESS_LIST_QUERY</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2def/ns-ws2def-socket_address_list
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKET_ADDRESS_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of transport addresses in the list.
     * @type {Integer}
     */
    iAddressCount {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

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
     * @type {Array<SOCKET_ADDRESS>}
     */
    Address{
        get {
            if(!this.HasProp("__AddressProxyArray"))
                this.__AddressProxyArray := Win32FixedArray(this.ptr + 8, 1, SOCKET_ADDRESS, "")
            return this.__AddressProxyArray
        }
    }
}
