#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\RIO_RQ.ahk" { RIO_RQ }

/**
 * Resizes a request queue to be either larger or smaller for use with the Winsock registered I/O extensions.
 * @remarks
 * The **RIOResizeRequestQueue** function resizes a request queue to be either larger or smaller. If the request queue already contains entries, those entries will be copied over to the new request queue.
 * 
 * A request queue has a required minimum size that is dependent on the current number of entries (number of sends and receives on the request queue). If an application calls the **RIOResizeRequestQueue** function and tries to set the queue too small for the number of existing entries, the call will fail and the queue will not be resized.
 * 
 * > [!Note]  
 * > The function pointer to the **RIOResizeRequestQueue** function must be obtained at run time by making a call to the [**WSAIoctl**](../winsock2/nf-winsock2-wsaioctl.md) function with the **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** opcode specified. The input buffer passed to the **WSAIoctl** function must contain **WSAID\_MULTIPLE\_RIO**, a globally unique identifier (GUID) whose value identifies the Winsock registered I/O extension functions. On success, the output returned by the **WSAIoctl** function contains a pointer to the [**RIO\_EXTENSION\_FUNCTION\_TABLE**](./ns-mswsock-rio_extension_function_table.md) structure that contains pointers to the Winsock registered I/O extension functions. The **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** IOCTL is defined in the *Ws2def.h* header file. The **WSAID\_MULTIPLE\_RIO** GUID is defined in the *Mswsock.h* header file.
 * 
 *  
 * 
 * **Windows Phone 8:** This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
 * 
 * **Windows 8.1** and **Windows Server 2012 R2**: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
 * @see https://learn.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rioresizerequestqueue
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPFN_RIORESIZEREQUESTQUEUE {
    value : IntPtr

    __value {
        set {
            if (value is LPFN_RIORESIZEREQUESTQUEUE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {RIO_RQ} RQ A descriptor that identifies an existing registered I/O socket descriptor (request queue) to resize.
     * @param {Integer} MaxOutstandingReceive The maximum number of outstanding sends allowed on the socket. This value can be larger or smaller than the original number.
     * 
     * This parameter is usually a small number for most applications.
     * @param {Integer} MaxOutstandingSend The maximum number of outstanding receives allowed on the socket. This value can be larger or smaller than the original number.
     * @returns {BOOL} If no error occurs, the **RIOResizeRequestQueue** function returns **TRUE**. Otherwise, a value of **FALSE** is returned, and a specific error code can be retrieved by calling the [**WSAGetLastError**](../winsock/nf-winsock-wsagetlasterror.md) function.
     * 
     * 
     * 
     * | Return code                                                                                                                                         | Description                                                                                                                                                                                                                                                           |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**[WSAEINVAL](/windows/win32/winsock/windows-sockets-error-codes-2#wsaeinval)**</dt> </dl>             | An invalid parameter was passed to the function. This error is returned if the *RQ* parameter is not valid (RIO\_INVALID\_RQ, for example). This error is also returned if both the *MaxOutstandingReceive* and *MaxOutstandingSend* parameters are zero. <br/> |
     * | <dl> <dt>**[WSAENOBUFS](/windows/win32/winsock/windows-sockets-error-codes-2#wsaenobufs)**</dt> </dl>           | Sufficient memory could not be allocated. This error is returned if memory could not be allocated for the resized request queue.<br/>                                                                                                                           |
     * | <dl> <dt>**[WSAETOOMANYREFS](/windows/win32/winsock/windows-sockets-error-codes-2#wsaetoomanyrefs)**</dt> </dl> | There are too many operations that still reference the request queue. Resizing of this request queue to be smaller is not possible at this time.<br/>                                                                                                           |
     */
    Call(RQ, MaxOutstandingReceive, MaxOutstandingSend) {
        result := DllCall(this.value, RIO_RQ, RQ, UInt32, MaxOutstandingReceive, UInt32, MaxOutstandingSend, BOOL)
        return result
    }

    /**
     * A LPFN_RIORESIZEREQUESTQUEUE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFN_RIORESIZEREQUESTQUEUE {
        /**
         * Creates a LPFN_RIORESIZEREQUESTQUEUE pointer that invokes the given AHK function when called.
         * @param {Func(RIO_RQ, UInt32, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RIO_RQ, UInt32, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
