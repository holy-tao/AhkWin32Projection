#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\SOCKET.ahk" { SOCKET }
#Import ".\WSANETWORKEVENTS.ahk" { WSANETWORKEVENTS }

/**
 * The LPWSPEnumNetworkEvents function reports occurrences of network events for the indicated socket.
 * @remarks
 * This function is used to report which network events have occurred for the indicated socket since the last invocation of this function. It is intended for use in conjunction with [LPWSPEventSelect](./nc-ws2spi-lpwspeventselect.md) and [LPWSPAsyncSelect](./nc-ws2spi-lpwspasyncselect.md), which associate an event object with one or more network events. Recording of network events commences when **LPWSPEventSelect** or **LPWSPAsyncSelect** is called with a nonzero <i>lNetworkEvents</i> argument, and remains in effect until another corresponding call is made to **LPWSPEventSelect** or **LPWSPAsyncSelect** with the <i>lNetworkEvents</i> argument set to zero.
 * 
 * **LPWSPEnumNetworkEvents** only reports network activity and errors nominated through <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspeventselect">LPWSPEventSelect</a></b>. See the descriptions of <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspselect">LPWSPSelect</a></b> and **[LPWSPAsyncSelect](nc-ws2spi-lpwspasyncselect.md)** to find out how those functions report network activity and errors.
 * 
 * The socket's internal record of network events is copied to the structure referenced by <i>lpNetworkEvents</i>, whereafter the internal network events record is cleared. If <i>hEventObject</i> is non-null, the indicated event object is also reset. The Windows Sockets provider guarantees that the operations of copying the network event record, clearing it, and resetting any associated event object are atomic, such that the next occurrence of a nominated network event will cause the event object to become set. In the case of this function returning SOCKET_ERROR, the associated event object is not reset and the record of network events is not cleared.
 * 
 * The <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsanetworkevents">WSANETWORKEVENTS</a> structure is defined on the <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsanetworkevents">WSANETWORKEVENTS</a> reference page.
 * 
 * The **lNetworkEvents** member of the <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsanetworkevents">WSANETWORKEVENTS</a> structure indicates which of the FD_XXX network events have occurred. The <i>iErrorCode</i> array is used to contain any associated error codes, with array index corresponding to the position of event bits in **lNetworkEvents**. The identifiers such as FD_READ_BIT and FD_WRITE_BIT can be used to index the <i>iErrorCode</i> array.
 * 
 * Note that only those elements of the <i>iErrorCode</i> array are set that correspond to the bits set in the **lNetworkEvents** member. Other members are not modified (this is important for backward compatibility with the Windows Socket 2 SPI clients that are not aware of new FD_ROUTING_INTERFACE_CHANGE and FD_ADDRESS_LIST_CHANGE events).
 * 
 * The following error codes can be returned along with the respective network event.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspenumnetworkevents
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSPENUMNETWORKEVENTS {
    value : IntPtr

    __value {
        set {
            if (value is LPWSPENUMNETWORKEVENTS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SOCKET} s Descriptor identifying the socket.
     * @param {HANDLE} hEventObject Optional handle identifying an associated event object to be reset.
     * @param {Pointer<WSANETWORKEVENTS>} lpNetworkEvents Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsanetworkevents">WSANETWORKEVENTS</a> structure that is filled with a record of occurred network events and any associated error codes. The **WSANETWORKEVENTS** structure is defined in the following text.
     * @param {Pointer<Integer>} lpErrno Pointer to the error code.
     * @returns {Integer} The return value is zero if the operation was successful. Otherwise, the value SOCKET_ERROR is returned, and a specific error number is available in <i>lpErrno</i>.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Meaning</th>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENETDOWN">WSAENETDOWN</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The network subsystem has failed.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEINVAL">WSAEINVAL</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that one of the specified parameters was invalid.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEINPROGRESS">WSAEINPROGRESS</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * A blocking Windows Sockets call is in progress, or the service provider is still processing a callback function.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%">
     * <dl>                                              
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAENOTSOCK">WSAENOTSOCK</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The descriptor is not a socket.
     * </td>
     * </tr>
     * </table>
     */
    Call(s, hEventObject, lpNetworkEvents, lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, SOCKET, s, HANDLE, hEventObject, WSANETWORKEVENTS.Ptr, lpNetworkEvents, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWSPENUMNETWORKEVENTS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSPENUMNETWORKEVENTS {
        /**
         * Creates a LPWSPENUMNETWORKEVENTS pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, HANDLE, WSANETWORKEVENTS, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, HANDLE, WSANETWORKEVENTS.Ptr, "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
