#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RIO_CQ.ahk" { RIO_CQ }
#Import ".\RIO_RQ.ahk" { RIO_RQ }
#Import ".\SOCKET.ahk" { SOCKET }

/**
 * Creates a registered I/O socket descriptor using a specified socket and I/O completion queues for use with the Winsock registered I/O extensions.
 * @remarks
 * The **RIOCreateRequestQueue** function creates a registered I/O socket descriptor using a specified socket and I/O completion queues. An application must call **RIOCreateRequestQueue** to obtain a [**RIO\_RQ**](/windows/win32/winsock/riorqueue) for a Winsock socket before the application can use the [**RIOSend**](./nc-mswsock-lpfn_riosend.md), [**RIOSendEx**](./nc-mswsock-lpfn_riosendex.md), [**RIOReceive**](./nc-mswsock-lpfn_rioreceive.md), or [**RIOReceiveEx**](./nc-mswsock-lpfn_rioreceiveex.md) functions. In order to obtain a **RIO\_RQ**, the Winsock socket must be associated with completion queues for send and receive, although the same completion queue can be used for both.
 * 
 * Due to the finite size of completion queues, a socket may only be associated with a completion queue for send and receive operations if it guarantees not to exceed the capacity for total queued completions. Therefore, socket specific limits are established by the call to the **RIOCreateRequestQueue** function. These limits are used both during the **RIOCreateRequestQueue** call to verify sufficient space in the completion queues to accommodate the socket requests and during request initiation time to make sure that the request does not cause the socket to exceed its limits.
 * 
 * The send and receive queues can be associated with multiple sockets. The sizes of the send and receive queues must be greater than or equal to the send and receive sizes of all attached sockets. As request queues are closed by closing the sockets using the the [**closesocket**](../winsock/nf-winsock-closesocket.md) function, those slots will be freed up for use by other sockets.
 * 
 * > [!Note]  
 * > For purposes of efficiency, access to the completion queues ([**RIO\_CQ**](/windows/win32/winsock/riocqueue) structs) and request queues ([**RIO\_RQ**](/windows/win32/winsock/riorqueue) structs) are not protected by synchronization primitives. If you need to access a completion or request queue from multiple threads, access should be coordinated by a critical section, slim reader write lock or similar mechanism. This locking is not needed for access by a single thread. Different threads can access separate requests/completion queues without locks. The need for synchronization occurs only when multiple threads try to access the same queue. Synchronization is also required if multiple threads issue sends and receives on the same socket because the send and receive operations use the socket’s request queue.
 * 
 *  
 * 
 * When an application is finished using the [**RIO\_RQ**](/windows/win32/winsock/riorqueue), the application should call the [**closesocket**](../winsock/nf-winsock-closesocket.md) function to close the socket and free the associated resources.
 * 
 * > [!Note]  
 * > The function pointer to the **RIOCreateRequestQueue** function must be obtained at run time by making a call to the [**WSAIoctl**](../winsock2/nf-winsock2-wsaioctl.md) function with the **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** opcode specified. The input buffer passed to the **WSAIoctl** function must contain **WSAID\_MULTIPLE\_RIO**, a globally unique identifier (GUID) whose value identifies the Winsock registered I/O extension functions. On success, the output returned by the **WSAIoctl** function contains a pointer to the [**RIO\_EXTENSION\_FUNCTION\_TABLE**](./ns-mswsock-rio_extension_function_table.md) structure that contains pointers to the Winsock registered I/O extension functions. The **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** IOCTL is defined in the *Ws2def.h* header file. The **WSAID\_MULTIPLE\_RIO** GUID is defined in the *Mswsock.h* header file.
 * 
 *  
 * 
 * **Windows Phone 8:** This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
 * 
 * **Windows 8.1** and **Windows Server 2012 R2**: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
 * @see https://learn.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riocreaterequestqueue
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPFN_RIOCREATEREQUESTQUEUE {
    value : IntPtr

    __value {
        set {
            if (value is LPFN_RIOCREATEREQUESTQUEUE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SOCKET} _Socket A descriptor that identifies the socket.
     * @param {Integer} MaxOutstandingReceive The maximum number of outstanding receives allowed on the socket.
     * 
     * This parameter is usually a small number for most applications.
     * @param {Integer} MaxReceiveDataBuffers The maximum number of receive data buffers on the socket.
     * 
     * > [!Note]  
     * > For Windows 8 and Windows Server 2012 , this parameter must be **1**.
     * @param {Integer} MaxOutstandingSend The maximum number of outstanding sends allowed on the socket.
     * @param {Integer} MaxSendDataBuffers The maximum number of send data buffers on the socket.
     * 
     * > [!Note]  
     * > For Windows 8 and Windows Server 2012 , this parameter must be **1**.
     * @param {RIO_CQ} ReceiveCQ A descriptor that identifies the I/O completion queue to use for receive request completions.
     * @param {RIO_CQ} SendCQ A descriptor that identifies the I/O completion queue to use for send request completions.
     * 
     * This parameter may have the same value as the *ReceiveCQ* parameter.
     * @param {Pointer<Void>} SocketContext The socket context to associate with this request queue.
     * @returns {RIO_RQ} If no error occurs, the **RIOCreateRequestQueue** function returns a descriptor referencing a new request queue. Otherwise, a value of **RIO\_INVALID\_RQ** is returned, and a specific error code can be retrieved by calling the [**WSAGetLastError**](../winsock/nf-winsock-wsagetlasterror.md) function.
     * 
     * 
     * 
     * | Return code                                                                                                                                     | Description                                                                                                                                                                                                                                                                                                                                                                                                |
     * |-------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**[WSAEINVAL](/windows/win32/winsock/windows-sockets-error-codes-2#wsaeinval)**</dt> </dl>         | An invalid parameter was passed to the function. <br/> This error is returned if the *ReceiveCQ* or *SendCQ* parameters contained **RIO\_INVALID\_CQ**. This error is returned if both the *MaxOutstandingReceive* and *MaxOutstandingSend* parameters are zero. This error is also returned if the socket passed in the *Socket* parameter is in the process of initializing or closing.<br/> |
     * | <dl> <dt>**[WSAENOBUFS](/windows/win32/winsock/windows-sockets-error-codes-2#wsaenobufs)**</dt> </dl>       | Sufficient memory could not be allocated. This error is returned if there was insufficient memory to allocate the request queue based on the parameters. This error is also returned if the network session limit was exceeded. <br/>                                                                                                                                                                |
     * | <dl> <dt>**[WSAENOTSOCK](/windows/win32/winsock/windows-sockets-error-codes-2#wsaenotsock)**</dt> </dl>     | The descriptor is not a socket. This error is returned if the *Socket* parameter is not a valid socket.<br/>                                                                                                                                                                                                                                                                                         |
     * | <dl> <dt>**[WSAEOPNOTSUPP](/windows/win32/winsock/windows-sockets-error-codes-2#wsaeopnotsupp)**</dt> </dl> | The attempted operation is not supported for the type of object referenced. This error is returned for a socket in the *Socket* parameter for an unsupported socket type (**SOCK\_RAW**, for example)<br/>                                                                                                                                                                                           |
     */
    Call(_Socket, MaxOutstandingReceive, MaxReceiveDataBuffers, MaxOutstandingSend, MaxSendDataBuffers, ReceiveCQ, SendCQ, SocketContext) {
        SocketContextMarshal := SocketContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SOCKET, _Socket, UInt32, MaxOutstandingReceive, UInt32, MaxReceiveDataBuffers, UInt32, MaxOutstandingSend, UInt32, MaxSendDataBuffers, RIO_CQ, ReceiveCQ, RIO_CQ, SendCQ, SocketContextMarshal, SocketContext, RIO_RQ)
        return result
    }

    /**
     * A LPFN_RIOCREATEREQUESTQUEUE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFN_RIOCREATEREQUESTQUEUE {
        /**
         * Creates a LPFN_RIOCREATEREQUESTQUEUE pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, UInt32, UInt32, UInt32, UInt32, RIO_CQ, RIO_CQ, "ptr") => RIO_RQ} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, UInt32, UInt32, UInt32, UInt32, RIO_CQ, RIO_CQ, "ptr", RIO_RQ])
        }

        __Delete() => CallbackFree(this.value)
    }
}
