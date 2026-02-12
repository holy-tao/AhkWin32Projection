#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Receives network data on a connected registered I/O TCP socket or a bound registered I/O UDP socket for use with the Winsock registered I/O extensions.
 * @remarks
 * An application can use the **RIOReceive** function to receive network data into any buffer completely contained within a single registered buffer. The **Offset** and **Length** members of the [**RIO\_BUF**](../mswsockdef/ns-mswsockdef-rio_buf.md) structure pointed to by the *pData* parameter determine where the network data is received in the buffer.
 * 
 * Once the **RIOReceive** function is called, the buffer passed in the *pData* parameter including the [**RIO\_BUFFERID**](/windows/win32/winsock/rio-bufferid) in the **BufferId** member of [**RIO\_BUF**](../mswsockdef/ns-mswsockdef-rio_buf.md) structure must remain valid for the duration of the receive operation.
 * 
 * In order to avoid race conditions, a buffer associated with a receive request should not be read or written before the request completes. This includes using the buffer as the source for a send request or the destination for another receive request. Portions of a registered buffer not associated with any receive request are not included in this restriction.
 * 
 * The *Flags* parameter can be used to influence the behavior of the **RIOReceive** function invocation beyond the options specified for the associated socket. The behavior of this function is determined by a combination of any socket options set on the socket associated with the *SocketQueue* parameter and the values specified in the *Flags* parameter.
 * 
 * > [!Note]  
 * > The function pointer to the **RIOReceive** function must be obtained at run time by making a call to the [**WSAIoctl**](../winsock2/nf-winsock2-wsaioctl.md) function with the **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** opcode specified. The input buffer passed to the **WSAIoctl** function must contain **WSAID\_MULTIPLE\_RIO**, a globally unique identifier (GUID) whose value identifies the Winsock registered I/O extension functions. On success, the output returned by the **WSAIoctl** function contains a pointer to the [**RIO\_EXTENSION\_FUNCTION\_TABLE**](./ns-mswsock-rio_extension_function_table.md) structure that contains pointers to the Winsock registered I/O extension functions. The **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** IOCTL is defined in the *Ws2def.h* header file. The **WSAID\_MULTIPLE\_RIO** GUID is defined in the *Mswsock.h* header file.
 * 
 *  
 * 
 * **Windows Phone 8:** This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
 * 
 * **Windows 8.1** and **Windows Server 2012 R2**: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswsock/nc-mswsock-lpfn_rioreceive
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPFN_RIORECEIVE extends IUnknown {

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
     * @param {RIO_RQ} SocketQueue 
     * @param {Pointer<RIO_BUF>} pData 
     * @param {Integer} DataBufferCount 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} RequestContext 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(SocketQueue, pData, DataBufferCount, Flags, RequestContext) {
        SocketQueue := SocketQueue is Win32Handle ? NumGet(SocketQueue, "ptr") : SocketQueue

        RequestContextMarshal := RequestContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", SocketQueue, "ptr", pData, "uint", DataBufferCount, "uint", Flags, RequestContextMarshal, RequestContext, "int")
        return result
    }
}
