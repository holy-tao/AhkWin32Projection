#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSAPROTOCOL_INFOW.ahk" { WSAPROTOCOL_INFOW }

/**
 * The LPWSPAddressToString function converts all components of a sockaddr structure into a human-readable numeric string representation of the address. This is used mainly for display purposes.
 * @remarks
 * A layered service provider supplies an implementation of this function, but it is also a client of this function if and when it calls 
 * **LPWSPAddressToString** of the next layer in the protocol chain. Some special considerations apply to the <i>lpProtocolInfo</i> parameter as it is propagated down through the layers of the protocol chain.
 * 
 * If the next layer in the protocol chain is another layer, then, when the next layer's 
 * **LPWSPAddressToString** is called, this layer must pass to the next layer a <i>lpProtocolInfo</i> parameter that references the same unmodified 
 * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure with the same unmodified chain information. However, if the next layer is the base protocol (that is, the last element in the chain), this layer performs a substitution when calling the base provider's 
 * **LPWSPAddressToString**. In this case, the base provider's 
 * **WSAPROTOCOL_INFO** structure should be referenced by the <i>lpProtocolInfo</i> parameter. One vital benefit of this policy is that base service providers do not have to be aware of protocol chains.
 * 
 * This same propagation policy applies when propagating a 
 * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure through a layered sequence of other functions such as 
 * [LPWSPDuplicateSocket](nc-ws2spi-lpwspduplicatesocket.md), 
 * <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wspstartup">WSPStartup</a>, 
 * [LPWSPSocket](nc-ws2spi-lpwspsocket.md), or 
 * [LPWSPStringToAddress](nc-ws2spi-lpwspstringtoaddress.md).
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspaddresstostring
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSPADDRESSTOSTRING {
    value : IntPtr

    __value {
        set {
            if (value is LPWSPADDRESSTOSTRING) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} lpsaAddress Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure to translate into a string.
     * @param {Integer} dwAddressLength Length of the address of <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a>, in bytes.
     * @param {Pointer<WSAPROTOCOL_INFOW>} lpProtocolInfo (required) 
     * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure associated with the provider that will do the translation.
     * @param {PWSTR} lpszAddressString Buffer that receives the human-readable address string..
     * @param {Pointer<Integer>} lpdwAddressStringLength Length of the <i>AddressString</i> buffer, in bytes. Returns the length of the string actually copied into the buffer. If the supplied buffer is not large enough, the function fails with a specific error of 
     * <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEFAULT</a> and this parameter is updated with the required size, in bytes.
     * @param {Pointer<Integer>} lpErrno Pointer to the error code.
     * @returns {Integer} If no error occurs, 
     * **LPWSPAddressToString** returns zero. Otherwise, it returns SOCKET_ERROR, and a specific error code is available in <i>lpErrno</i>.
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEFAULT</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified AddressString buffer is too small. Pass in a larger buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINVAL</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified address is not a valid socket address, or its address family is not supported by the provider, or the specified <i>lpProtocolInfo</i> did not refer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure supported by the provider.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     */
    Call(lpsaAddress, dwAddressLength, lpProtocolInfo, lpszAddressString, lpdwAddressStringLength, lpErrno) {
        lpszAddressString := lpszAddressString is String ? StrPtr(lpszAddressString) : lpszAddressString

        lpdwAddressStringLengthMarshal := lpdwAddressStringLength is VarRef ? "uint*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, IntPtr, lpsaAddress, UInt32, dwAddressLength, WSAPROTOCOL_INFOW.Ptr, lpProtocolInfo, "ptr", lpszAddressString, lpdwAddressStringLengthMarshal, lpdwAddressStringLength, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWSPADDRESSTOSTRING that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSPADDRESSTOSTRING {
        /**
         * Creates a LPWSPADDRESSTOSTRING pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, WSAPROTOCOL_INFOW, PWSTR, "uint*", "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, WSAPROTOCOL_INFOW.Ptr, PWSTR, "uint*", "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
