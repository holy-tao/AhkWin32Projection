#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPSend function sends data on a connected socket.
 * @remarks
 * The **LPWSPSend** function is used to write outgoing data from one or more buffers on a connection-oriented socket specified by <i>s</i>. It can also be used, however, on connectionless sockets that have a stipulated default peer address established through the <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> function.
 * 
 * For overlapped sockets (created using <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsocket">LPWSPSocket</a> with flag WSA_FLAG_OVERLAPPED) this will occur using overlapped I/O, unless both <i>lpOverlapped</i> and <i>lpCompletionRoutine</i> are null in which case the socket is treated as a nonoverlapped socket. A completion indication will occur (invocation of the completion routine or setting of an event object) when the supplied buffer(s) have been consumed by the transport. If the operation does not complete immediately, the final completion status is retrieved through the completion routine or <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetoverlappedresult">LPWSPGetOverlappedResult</a>.
 * 
 * For nonoverlapped sockets, the parameters <i>lpOverlapped</i>, <i>lpCompletionRoutine</i>, and <i>lpThreadId</i> are ignored and **LPWSPSend** adopts the regular synchronous semantics. Data is copied from the supplied buffer(s) into the transport's buffer. If the socket is nonblocking and stream oriented, and there is not sufficient space in the transport's buffer, **LPWSPSend** will return with only part of the supplied buffers having been consumed. Given the same buffer situation and a blocking socket, **LPWSPSend** will block until all of the supplied buffer contents have been consumed.
 * 
 * The array of <a href="https://docs.microsoft.com/windows/win32/api/ws2def/ns-ws2def-wsabuf">WSABUF</a> structures pointed to by the <i>lpBuffers</i> parameter is transient. If this operation completes in an overlapped manner, it is the service provider's responsibility to capture these **WSABUF** structures before returning from this call. This enables applications to build stack-based **WSABUF** arrays.
 * 
 * For message-oriented sockets, care must be taken not to exceed the maximum message size of the underlying provider, which can be obtained by getting the value of socket option SO_MAX_MSG_SIZE. If the data is too long to pass atomically through the underlying protocol the error <b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEMSGSIZE">WSAEMSGSIZE</a></b> is returned, and no data is transmitted.
 * 
 * Note that the successful completion of a **LPWSPSend** does not indicate that the data was successfully delivered.
 * 
 * <i>dwFlags</i> can be used to influence the behavior of the function invocation beyond the options specified for the associated socket. That is, the semantics of this function are determined by the socket options and the <i>dwFlags</i> parameter. The latter is constructed by using the bitwise OR operator with any of the following values.
 * 
 * 
 * 
 * | Value          | Meaning                                                                                                                                                                                                                                |
 * |----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | MSG_DONTROUTE | Specifies that the data should not be subject to routing. A Windows Sockets service provider can choose to ignore this flag;.                                                                                                          |
 * | MSG_OOB       | Sends OOB data (stream-style socket such as SOCK_STREAM only).                                                                                                                                                                        |
 * | MSG_PARTIAL   | Specifies that <i>lpBuffers</i> only contains a partial message. Note that the error code [WSAEOPNOTSUPP](/windows/win32/winsock/windows-sockets-error-codes-2#wsaeopnotsupp) will be returned for messages that do not support partial message transmissions. |
 * 
 * 
 * 
 *  
 * 
 *  
 * 
 * If an overlapped operation completes immediately, **LPWSPSend** returns a value of zero and the <i>lpNumberOfBytesSent</i> parameter is updated with the number of bytes sent. If the overlapped operation is successfully initiated and will complete later, **LPWSPSend** returns SOCKET_ERROR and indicates error code [WSA_IO_PENDING](/windows/win32/winsock/windows-sockets-error-codes-2#wsa-io-pending). In this case, <i>lpNumberOfBytesSent</i> is not updated. When the overlapped operation completes the amount of data transferred is indicated either through the <i>cbTransferred</i> parameter in the completion routine (if specified), or through the <i>lpcbTransfer</i> parameter in <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetoverlappedresult">LPWSPGetOverlappedResult</a>.
 * 
 * Providers must allow this function to be called from within the completion routine of a previous <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">LPWSPRecv</a></b>, <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecvfrom">LPWSPRecvFrom</a></b>, **LPWSPSend** or <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsendto">LPWSPSendTo</a></b> function. However, for a given socket, I/O completion routines cannot be nested. This permits time-sensitive data transmissions to occur entirely within a preemptive context.
 * 
 * The <i>lpOverlapped</i> parameter must be valid for the duration of the overlapped operation. If multiple I/O operations are simultaneously outstanding, each must reference a separate overlapped structure. The <b><a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaoverlapped">WSAOverlapped</a></b> structure is defined in its own reference page.
 * 
 * If the <i>lpCompletionRoutine</i> parameter is null, the service provider signals the **hEvent** member of <i>lpOverlapped</i> when the overlapped operation completes if it contains a valid event object handle. The Windows Sockets SPI client can use <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetoverlappedresult">LPWSPGetOverlappedResult</a> to wait or poll on the event object.
 * 
 * If <i>lpCompletionRoutine</i> is not null, the **hEvent** member is ignored and can be used by the Windows Sockets SPI client to pass context information to the completion routine. A client that passes a non-null <i>lpCompletionRoutine</i> and later calls **WSAGetOverlappedResult** for the same overlapped I/O request may not set the <i>fWait</i> parameter for that invocation of **WSAGetOverlappedResult** to **TRUE**. In this case the usage of the **hEvent** member is undefined, and attempting to wait on the **hEvent** member would produce unpredictable results.
 * 
 * A service provider arranges for a function to be executed in the proper thread and process context by calling <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wpuqueueapc">WPUQueueApc</a></b>. This function can be called from any process and thread context, even a context different from the thread and process that was used to initiate the overlapped operation.
 * 
 * A service provider arranges for a function to be executed in the proper thread by calling <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wpuqueueapc">WPUQueueApc</a></b>. Note that this function must be invoked while in the context of the same process (but not necessarily the same thread) that was used to initiate the overlapped operation. It is the service provider's responsibility to arrange for this process context to be active prior to calling **WPUQueueApc**.
 * 
 * The <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wpuqueueapc">WPUQueueApc</a></b> function takes as input parameters a pointer to a <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/ns-ws2spi-wsathreadid">WSATHREADID</a></b> structure (supplied to the provider through the <i>lpThreadId</i> input parameter), a pointer to an APC function to be invoked, and a context value that is subsequently passed to the APC function. Because only a single context value is available, the APC function itself cannot be the client specified–completion routine. The service provider must instead supply a pointer to its own APC function that uses the supplied context value to access the needed result information for the overlapped operation, and then invokes the client specified–completion routine.
 * 
 * The prototype for the client-supplied completion routine is as follows.
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
 * The CompletionRoutine is a placeholder for a client supplied function name. <i>dwError</i> specifies the completion status for the overlapped operation as indicated by <i>lpOverlapped</i>. <i>cbTransferred</i> specifies the number of bytes sent. No flag values are currently defined and the <i>dwFlags</i> value will be zero. This function does not return a value.
 * 
 * The completion routines can be called in any order, though not necessarily in the same order that the overlapped operations are completed. However, the service provider guarantees to the client that posted buffers are sent in the same order they are supplied.
 * 
 * > [!Note]  
 * > All I/O initiated by a given thread is canceled when that thread exits. For overlapped sockets, pending asynchronous operations can fail if the thread is closed before the operations complete. See <b><a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-exitthread">ExitThread</a></b> for more information.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspsend
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPSEND extends IUnknown {

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
     * @param {Pointer<Integer>} lpNumberOfBytesSent 
     * @param {Integer} dwFlags 
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
    Invoke(s, lpBuffers, dwBufferCount, lpNumberOfBytesSent, dwFlags, lpOverlapped, lpCompletionRoutine, lpThreadId, lpErrno) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s

        lpNumberOfBytesSentMarshal := lpNumberOfBytesSent is VarRef ? "uint*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "ptr", lpBuffers, "uint", dwBufferCount, lpNumberOfBytesSentMarshal, lpNumberOfBytesSent, "uint", dwFlags, "ptr", lpOverlapped, "ptr", lpCompletionRoutine, "ptr", lpThreadId, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
