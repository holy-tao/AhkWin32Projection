#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSASERVICECLASSINFOW.ahk" { WSASERVICECLASSINFOW }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Retrieves all the pertinent class information (schema) pertaining to the namespace provider.
 * @remarks
 * The W2_32.dll uses this function to implement the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsagetserviceclassnamebyclassida">WSAGetServiceClassNameByClassId</a> function, as well as to retrieve the namespace-specific information passed to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPLookupServiceBegin</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspsetservice">NSPSetService</a> functions.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpnspgetserviceclassinfo
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPNSPGETSERVICECLASSINFO {
    value : IntPtr

    __value {
        set {
            if (value is LPNSPGETSERVICECLASSINFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} lpProviderId A pointer to the [GUID](../guiddef/ns-guiddef-guid.md) of the specific namespace provider from which the service class schema is to be retrieved.
     * @param {Pointer<Integer>} lpdwBufSize On input, the size, in bytes, of the buffer pointed to by <i>lpServiceClassInfo</i> parameter. 
     * 
     * On output, if the function fails and the error is 
     * <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEFAULT</a>, this parameter specifies the minimum size, in bytes, of the buffer pointed to the <i>lpServiceClassInfo</i> parameter needed to retrieve the record.
     * @param {Pointer<WSASERVICECLASSINFOW>} lpServiceClassInfo Returns a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaserviceclassinfow">WSASERVICECLASSINFOW</a> structure that contains the service class to namespace-specific mapping information. The <i>lpServiceClassId</i> parameter must be filled to indicate which **WSASERVICECLASSINFOW** record should be returned.
     * @returns {Integer} If no error occurs, the **NSPGetServiceClassInfo** function returns **NO_ERROR** (zero). Otherwise, **SOCKET_ERROR** (–1) is returned and the namespace provider must set the appropriate error code using <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsasetlasterror">WSASetLastError</a>.
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSA_NOT_ENOUGH_MEMORY</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEACCES</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling routine does not have sufficient privileges to access the information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEFAULT</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The  buffer pointed to by the <i>lpServiceClass</i> parameter was too small to contain a <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaserviceclassinfow">WSASERVICECLASSINFOW</a> structure. The application needs to pass in a larger buffer.
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
     * The specified service class identifier or namespace provider identifier is not valid. This error is returned if the <i>lpProviderId</i>, <i>lpServiceClassId</i>, <i>lpdwBufSize</i>, or <i>lpServiceClassInfo</i> parameters are **NULL**.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not supported. This error is returned if the namespace provider does not implement this function. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSANO_DATA</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested name is valid, but no data of the requested type was found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSATYPE_NOT_FOUND</a></b></dl>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified class was not found.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(lpProviderId, lpdwBufSize, lpServiceClassInfo) {
        lpdwBufSizeMarshal := lpdwBufSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, Guid.Ptr, lpProviderId, lpdwBufSizeMarshal, lpdwBufSize, WSASERVICECLASSINFOW.Ptr, lpServiceClassInfo, Int32)
        return result
    }

    /**
     * A LPNSPGETSERVICECLASSINFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPNSPGETSERVICECLASSINFO {
        /**
         * Creates a LPNSPGETSERVICECLASSINFO pointer that invokes the given AHK function when called.
         * @param {Func(Guid, "uint*", WSASERVICECLASSINFOW) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, "uint*", WSASERVICECLASSINFOW.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
