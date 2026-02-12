#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPRecvFrom function receives a datagram and stores the source address.
 * @remarks
 * The **LPWSPRecvFrom** function is used primarily on a connectionless socket specified by <i>s</i> The socket must not be connected. The local address of the socket must be known. This may be done explicitly through <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspbind">LPWSPBind</a></b> or implicitly through <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsendto">LPWSPSendTo</a></b> or <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspjoinleaf">LPWSPJoinLeaf</a></b>.
 * 
 * For overlapped sockets, this function is used to post one or more buffers into which incoming data will be placed as it becomes available on a (possibly connected) socket, after which the client-specified completion indication (invocation of the completion routine or setting of an event object) occurs. If the operation does not complete immediately, the final completion status is retrieved through the completion routine or <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetoverlappedresult">LPWSPGetOverlappedResult</a>. Also note that the values pointed to by <i>lpFrom</i> and <i>lpFromlen</i> are not updated until completion is indicated. Applications must not use or disturb these values until they have been updated, therefore the client must not use automatic (that is, stack-based) variables for these parameters.
 * 
 * If both <i>lpOverlapped</i> and <i>lpCompletionRoutine</i> are null, the socket in this function will be treated as a nonoverlapped socket.
 * 
 * For nonoverlapped sockets, the <i>lpOverlapped</i>, <i>lpCompletionRoutine</i>, and <i>lpThreadId</i> parameters are ignored. Any data that has already been received and buffered by the transport will be copied into the supplied user buffers. For the case of a blocking socket with no data currently having been received and buffered by the transport, the call will block until data is received according to the assigned blocking semantics for <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">LPWSPRecv</a></b>.
 * 
 * The supplied buffers are filled in the order in which they appear in the array pointed to by <i>lpBuffers</i>, and the buffers are packed so that no holes are created.
 * 
 * The array of <a href="https://docs.microsoft.com/windows/win32/api/ws2def/ns-ws2def-wsabuf">WSABUF</a> structures pointed to by the <i>lpBuffers</i> parameter is transient. If this operation completes in an overlapped manner, it is the service provider's responsibility to capture this array of pointers to **WSABUF** structures before returning from this call. This enables Windows Sockets SPI clients to build stack-based **WSABUF** arrays.
 * 
 * For connectionless socket types, the address from which the data originated is copied to the buffer pointed by <i>lpFrom</i>. On input, the value pointed to by <i>lpFromlen</i> is initialized to the size of this buffer, and is modified on completion to indicate the actual size of the address stored there.
 * 
 * As noted previously for overlapped sockets, the <i>lpFrom</i> and <i>lpFromlen</i> parameters are not updated until after the overlapped I/O has completed. The memory pointed to by these parameters must, therefore, remain available to the service provider and cannot be allocated on the Windows Sockets SPI client's stack frame. The <i>lpFrom</i> and <i>lpFromlen</i> parameters are ignored for connection-oriented sockets.
 * 
 * For byte stream-style sockets (for example, type SOCK_STREAM), incoming data is placed into the buffers until the buffers are filled, the connection is closed, or internally buffered data is exhausted. Regardless of whether or not the incoming data fills all the buffers, the completion indication occurs for overlapped sockets.
 * 
 * For message-oriented sockets, a single incoming message is placed into the supplied buffers, up to the total size of the buffers supplied, and the completion indication occurs for overlapped sockets. If the message is larger than the buffers supplied, the buffers are filled with the first part of the message. If the MSG_PARTIAL feature is supported by the service provider, the MSG_PARTIAL flag is set in <i>lpFlags</i> for the socket and subsequent receive operation(s) will retrieve the rest of the message. If MSG_PARTIAL is not supported but the protocol is reliable, **LPWSPRecvFrom** generates the error <b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEMSGSIZE">WSAEMSGSIZE</a></b> and a subsequent receive operation with a larger buffer can be used to retrieve the entire message. Otherwise, (that is, the protocol is unreliable and does not support MSG_PARTIAL), the excess data is lost, and **LPWSPRecvFrom** generates the error WSAEMSGSIZE.
 * 
 * The <i>lpFlags</i> parameter can be used to influence the behavior of the function invocation beyond the options specified for the associated socket. That is, the semantics of this function are determined by the socket options and the <i>lpFlags</i> parameter. The latter is constructed by using the bitwise OR operator with any of the following values.
 * 
 * 
 * 
 * | Value        | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
 * |--------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | MSG_PEEK    | Peeks at the incoming data. The data is copied into the buffer but is not removed from the input queue. This flag is valid only for nonoverlapped sockets.                                                                                                                                                                                                                                                                                                                                                             |
 * | MSG_OOB     | Processes Out of Band (OOB) data.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
 * | MSG_PARTIAL | This flag is for message-oriented sockets only. On output, indicates that the data supplied is a portion of the message transmitted by the sender. Remaining portions of the message will be supplied in subsequent receive operations. A subsequent receive operation with MSG_PARTIAL flag cleared indicates end of sender's message. As an input parameter, MSG_PARTIAL indicates that the receive operation should complete even if only part of a message has been received by the service provider.<br/> |
 * 
 * 
 * 
 *  
 * 
 *  
 * 
 * For message-oriented sockets, the MSG_PARTIAL bit is set in the <i>lpFlags</i> parameter if a partial message is received. If a complete message is received, MSG_PARTIAL is cleared in <i>lpFlags</i>. In the case of delayed completion, the value pointed to by <i>lpFlags</i> is not updated. When completion has been indicated the Windows Sockets SPI client should call <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetoverlappedresult">LPWSPGetOverlappedResult</a> and examine the flags pointed to by the <i>lpdwFlags</i> parameter.
 * 
 * If an overlapped operation completes immediately, <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">LPWSPRecv</a></b> returns a value of zero and the <i>lpNumberOfBytesRecvd</i> parameter is updated with the number of bytes received and the flag bits pointed by the <i>lpFlags</i> parameter are also updated. If the overlapped operation is successfully initiated and will complete later, **LPWSPRecv** returns SOCKET_ERROR and indicates error code [WSA_IO_PENDING](/windows/win32/winsock/windows-sockets-error-codes-2#wsa-io-pending). In this case, <i>lpNumberOfBytesRecvd</i> and <i>lpFlags</i> is not updated. When the overlapped operation completes, the amount of data transferred is indicated either through the <i>cbTransferred</i> parameter in the completion routine (if specified), or through the <i>lpcbTransfer</i> parameter in **LPWSPGetOverlappedResult**. Flag values are obtained by examining the <i>lpdwFlags</i> parameter of **LPWSPGetOverlappedResult**.
 * 
 * Providers must allow this function to be called from within the completion routine of a previous <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">LPWSPRecv</a></b>, **LPWSPRecvFrom**, <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsend">LPWSPSend</a></b>, or <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsendto">LPWSPSendTo</a></b> function. However, for a given socket, I/O completion routines cannot be nested. This permits time-sensitive data transmissions to occur entirely within a preemptive context.
 * 
 * The <i>lpOverlapped</i> parameter must be valid for the duration of the overlapped operation. If multiple I/O operations are simultaneously outstanding, each must reference a separate overlapped structure. The <b><a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaoverlapped">WSAOverlapped</a></b> structure is defined in its own reference page.
 * 
 * If the <i>lpCompletionRoutine</i> parameter is null, the service provider signals the **hEvent** member of <i>lpOverlapped</i> when the overlapped operation completes if it contains a valid event object handle. A Windows Sockets SPI client can use <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetoverlappedresult">LPWSPGetOverlappedResult</a> to wait or poll on the event object.
 * 
 * If <i>lpCompletionRoutine</i> is not null, the **hEvent** member is ignored and can be used by the Windows Sockets SPI client to pass context information to the completion routine. It is the service provider's responsibility to arrange for invocation of the client specified–completion routine when the overlapped operation completes. Since the completion routine must be executed in the context of the same thread that initiated the overlapped operation, it cannot be invoked directly from the service provider. The Ws2_32.dll offers an asynchronous procedure call (APC) mechanism to facilitate invocation of completion routines.
 * 
 * A service provider arranges for a function to be executed in the proper thread and process context by calling <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wpuqueueapc">WPUQueueApc</a></b>. This function can be called from any process and thread context, even a context different from the thread and process that was used to initiate the overlapped operation.
 * 
 * <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wpuqueueapc">WPUQueueApc</a></b> takes as input parameters a pointer to a <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/ns-ws2spi-wsathreadid">WSATHREADID</a></b> structure (supplied to the provider through the <i>lpThreadId</i> input parameter), a pointer to an APC function to be invoked, and a context value that is subsequently passed to the APC function. Because only a single context value is available, the APC function itself cannot be the client specified–completion routine. The service provider must instead supply a pointer to its own APC function that uses the supplied context value to access the needed result information for the overlapped operation, and then invokes the client specified–completion routine.
 * 
 * The prototype for the client-supplied completion routine is as follows:
 * 
 * ```cpp
 * void CALLBACK 
 * CompletionRoutine(  
 *   IN DWORD           dwError, 
 *   IN DWORD           cbTransferred, 
 *   IN LPWSAOVERLAPPED lpOverlapped, 
 *   IN DWORD           dwFlags 
 * );
 * ```
 * 
 * The CompletionRoutine is a placeholder for a client-supplied function name. <i>dwError</i> specifies the completion status for the overlapped operation as indicated by <i>lpOverlapped</i>. <i>cbTransferred</i> specifies the number of bytes received. <i>dwFlags</i> contains information that would have appeared in <i>lpFlags</i> if the receive operation had completed immediately. This function does not return a value.
 * 
 * The completion routines can be called in any order, though not necessarily in the same order that the overlapped operations are completed. However, the posted buffers are guaranteed to be filled in the same order they are supplied.
 * 
 * > [!Note]  
 * > All I/O initiated by a given thread is canceled when that thread exits. For overlapped sockets, pending asynchronous operations can fail if the thread is closed before the operations complete. See <b><a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-exitthread">ExitThread</a></b> for more information.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwsprecvfrom
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPRECVFROM extends IUnknown {

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
     * @param {SOCKET} s 
     * @param {Pointer<WSABUF>} lpBuffers 
     * @param {Integer} dwBufferCount 
     * @param {Pointer<Integer>} lpNumberOfBytesRecvd 
     * @param {Pointer<Integer>} lpFlags 
     * @param {Pointer} lpFrom 
     * @param {Pointer<Integer>} lpFromlen 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @param {Pointer<LPWSAOVERLAPPED_COMPLETION_ROUTINE>} lpCompletionRoutine 
     * @param {Pointer<WSATHREADID>} lpThreadId 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(s, lpBuffers, dwBufferCount, lpNumberOfBytesRecvd, lpFlags, lpFrom, lpFromlen, lpOverlapped, lpCompletionRoutine, lpThreadId, lpErrno) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s

        lpNumberOfBytesRecvdMarshal := lpNumberOfBytesRecvd is VarRef ? "uint*" : "ptr"
        lpFlagsMarshal := lpFlags is VarRef ? "uint*" : "ptr"
        lpFromlenMarshal := lpFromlen is VarRef ? "int*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "ptr", lpBuffers, "uint", dwBufferCount, lpNumberOfBytesRecvdMarshal, lpNumberOfBytesRecvd, lpFlagsMarshal, lpFlags, "ptr", lpFrom, lpFromlenMarshal, lpFromlen, "ptr", lpOverlapped, "ptr", lpCompletionRoutine, "ptr", lpThreadId, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
