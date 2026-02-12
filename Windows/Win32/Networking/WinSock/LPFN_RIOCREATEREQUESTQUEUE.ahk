#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RIO_RQ.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/mswsock/nc-mswsock-lpfn_riocreaterequestqueue
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPFN_RIOCREATEREQUESTQUEUE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {SOCKET} Socket_ 
     * @param {Integer} MaxOutstandingReceive 
     * @param {Integer} MaxReceiveDataBuffers 
     * @param {Integer} MaxOutstandingSend 
     * @param {Integer} MaxSendDataBuffers 
     * @param {RIO_CQ} ReceiveCQ 
     * @param {RIO_CQ} SendCQ 
     * @param {Pointer<Void>} SocketContext 
     * @returns {RIO_RQ} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Socket_, MaxOutstandingReceive, MaxReceiveDataBuffers, MaxOutstandingSend, MaxSendDataBuffers, ReceiveCQ, SendCQ, SocketContext) {
        Socket_ := Socket_ is Win32Handle ? NumGet(Socket_, "ptr") : Socket_
        ReceiveCQ := ReceiveCQ is Win32Handle ? NumGet(ReceiveCQ, "ptr") : ReceiveCQ
        SendCQ := SendCQ is Win32Handle ? NumGet(SendCQ, "ptr") : SendCQ

        SocketContextMarshal := SocketContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", Socket_, "uint", MaxOutstandingReceive, "uint", MaxReceiveDataBuffers, "uint", MaxOutstandingSend, "uint", MaxSendDataBuffers, "ptr", ReceiveCQ, "ptr", SendCQ, SocketContextMarshal, SocketContext, "ptr")
        resultHandle := RIO_RQ({Value: result}, True)
        return resultHandle
    }
}
