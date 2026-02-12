#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sends network data on a connected registered I/O TCP socket or a bound registered I/O UDP socket for use with the Winsock registered I/O extensions.
 * @remarks
 * An application can use the **RIOSend** function to send network data from any buffer completely contained within a single registered buffer. The **Offset** and **Length** members of the [**RIO\_BUF**](../mswsockdef/ns-mswsockdef-rio_buf.md) structure pointed to by the *pData* parameter determine the network data to be sent from the buffer.
 * 
 * The buffer associated with a send operation must not be used concurrently with another send or receive operation. The buffer, and buffer registration, must remain valid for the duration of a send operation. This means that you should not pass the same PRIO\_BUF to a RIOSend(Ex) request when one is already pending. Only after an in-flight RIOSend(Ex) request is complete should you re-use the same PRIO\_BUF (either with the same offset or with a different offset and length). Furthermore, when send data references a registered buffer (either a portion or the entire buffer), the entire registered buffer must not be used until the send has completed. This includes using a portion of the registered buffer for a receive operation or another send operation.
 * 
 * The *Flags* parameter can be used to influence the behavior of the **RIOSend** function beyond the options specified for the associated socket. The behavior of this function is determined by a combination of any socket options set on the socket associated with the *SocketQueue* parameter and the values specified in the *Flags* parameter.
 * 
 * > [!Note]  
 * > The function pointer to the **RIOSend** function must be obtained at run time by making a call to the [**WSAIoctl**](../winsock2/nf-winsock2-wsaioctl.md) function with the **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** opcode specified. The input buffer passed to the **WSAIoctl** function must contain **WSAID\_MULTIPLE\_RIO**, a globally unique identifier (GUID) whose value identifies the Winsock registered I/O extension functions. On success, the output returned by the **WSAIoctl** function contains a pointer to the [**RIO\_EXTENSION\_FUNCTION\_TABLE**](./ns-mswsock-rio_extension_function_table.md) structure that contains pointers to the Winsock registered I/O extension functions. The **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** IOCTL is defined in the *Ws2def.h* header file. The **WSAID\_MULTIPLE\_RIO** GUID is defined in the *Mswsock.h* header file.
 * 
 *  
 * 
 * **Windows Phone 8:** This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
 * 
 * **Windows 8.1** and **Windows Server 2012 R2**: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswsock/nc-mswsock-lpfn_riosend
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPFN_RIOSEND extends IUnknown {

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
