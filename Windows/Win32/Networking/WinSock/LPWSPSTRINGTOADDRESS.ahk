#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSAPROTOCOL_INFOW.ahk" { WSAPROTOCOL_INFOW }

/**
 * The WSPStringToAddress function converts a human-readable numeric string to a socket address structure (sockaddr) suitable to passing to Windows Sockets routines that take such a structure.
 * @remarks
 * A layered service provider supplies an implementation of this function, but it is also a client of this function if and when it calls 
 * **WSPStringToAddress** of the next layer in the protocol chain. Some special considerations apply to this function's <i>lpProtocolInfo</i> parameter as it is propagated down through the layers of the protocol chain.
 * 
 * If the next layer in the protocol chain is another layer, then when the next layer's 
 * **WSPStringToAddress** is called, this layer must pass to the next layer a <i>lpProtocolInfo</i> that references the same unmodified 
 * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure with the same unmodified chain information. However, if the next layer is the base protocol (that is, the last element in the chain), this layer performs a substitution when calling the base provider's 
 * **WSPStringToAddress**. In this case, the base provider's 
 * **WSAPROTOCOL_INFO** structure should be referenced by the <i>lpProtocolInfo</i> parameter.
 * 
 * One vital benefit of this policy is that base service providers do not have to be aware of protocol chains.
 * 
 * This same propagation policy applies when propagating a 
 * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure through a layered sequence of other functions such as 
 * [LPWSPAddressToString](nc-ws2spi-lpwspaddresstostring.md), 
 * [LPWSPDuplicateSocket](nc-ws2spi-lpwspduplicatesocket.md), 
 * <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wspstartup">WSPStartup</a>, or 
 * [LPWSPSocket](nc-ws2spi-lpwspsocket.md).
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspstringtoaddress
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSPSTRINGTOADDRESS {
    value : IntPtr

    __value {
        set {
            if (value is LPWSPSTRINGTOADDRESS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} AddressString Pointer to the zero-terminated, human-readable string to convert.
     * @param {Integer} AddressFamily Address family to which the string belongs, or AF_UNSPEC if it is unknown.
     * @param {Pointer<WSAPROTOCOL_INFOW>} lpProtocolInfo (required) Provider's 
     * <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAProtocol_Info</a> structure.
     * @param {Integer} lpAddress Buffer that is filled with a single 
     * <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure.
     * @param {Pointer<Integer>} lpAddressLength Length of the Address buffer, in bytes. Returns the size of the resultant <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure. If the supplied buffer is not large enough, the function fails with a specific error of <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEFAULT</a> and this parameter is updated with the required size in bytes.
     * @param {Pointer<Integer>} lpErrno Pointer to the error code.
     * @returns {Integer} If no error occurs, 
     * **WSPStringToAddress** returns zero. Otherwise, a value of SOCKET_ERROR is returned, and a specific error code is available in <i>lpErrno</i>.
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
     * The specified address buffer is too small, pass in a larger buffer.
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
     * Unable to translate the string into a 
     * <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a>, or the provider was unable to support the indicated address family, or the specified <i>lpProtocolInfo</i> did not refer to a 
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
    Call(AddressString, AddressFamily, lpProtocolInfo, lpAddress, lpAddressLength, lpErrno) {
        AddressString := AddressString is String ? StrPtr(AddressString) : AddressString

        lpAddressLengthMarshal := lpAddressLength is VarRef ? "int*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, "ptr", AddressString, Int32, AddressFamily, WSAPROTOCOL_INFOW.Ptr, lpProtocolInfo, IntPtr, lpAddress, lpAddressLengthMarshal, lpAddressLength, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWSPSTRINGTOADDRESS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSPSTRINGTOADDRESS {
        /**
         * Creates a LPWSPSTRINGTOADDRESS pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, Int32, WSAPROTOCOL_INFOW, IntPtr, "int*", "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, Int32, WSAPROTOCOL_INFOW.Ptr, IntPtr, "int*", "int*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
