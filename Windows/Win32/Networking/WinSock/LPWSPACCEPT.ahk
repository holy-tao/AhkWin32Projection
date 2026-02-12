#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SOCKET.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPAccept function conditionally accepts a connection based on the return value of a condition function.
 * @remarks
 * The **LPWSPAccept** function extracts the first connection on the queue of pending connections on socket <i>s</i>, and checks it against the condition function, provided the condition function is specified (that is, not null). The condition function must be executed in the same thread as this routine. If the condition function returns CF_ACCEPT, **LPWSPAccept** creates a new socket.
 * 
 * Newly created sockets have the same properties as the socket <i>s</i>, including network events registered with <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspasyncselect">**LPWSPAsyncSelect**</a> or with <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspeventselect">**LPWSPEventSelect**</a>. As described in <a href="https://docs.microsoft.com/windows/win32/winsock/descriptor-allocation-2">**DescriptorAllocation**</a>, when new socket descriptors are allocated, IFS providers must call <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wpumodifyifshandle">**WPUModifyIFSHandle**</a> and non-IFS providers must call <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wpucreatesockethandle">**WPUCreateSocketHandle**</a>.
 * 
 * If the condition function returns CF_REJECT, **LPWSPAccept** rejects the connection request. If the application's accept/reject decision cannot be made immediately, the condition function will return CF_DEFER to indicate that no decision has been made. No action about this connection request is to be taken by the service provider. When the application is ready to take action on the connection request, it will invoke **LPWSPAccept** again and return either CF_ACCEPT or CF_REJECT as a return value from the condition function.
 * 
 * For sockets that are in the (default) blocking mode, if no pending connections are present on the queue, **LPWSPAccept** blocks the caller until a connection is present. For sockets in nonblocking mode, if this function is called when no pending connections are present on the queue, **LPWSPAccept** returns the error code <a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEWOULDBLOCK">WSAEWOULDBLOCK</a>. The accepted socket cannot be used to accept more connections. The original socket remains open.
 * 
 * The parameter <i>addr</i> is a result parameter that is filled with the address of the connecting entity, as known to the service provider. The exact format of the <i>addr</i> parameter is determined by the address family in which the communication is occurring. The <i>addrlen</i> is a value-result parameter; it will initially contain the amount of space pointed to by <i>addr</i>. On return, it must contain the actual length (in bytes) of the address returned by the service provider. This call is used with connection-oriented socket types such as SOCK_STREAM. If <i>addr</i> and/or <i>addrlen</i> are equal to null, then no information about the remote address of the accepted socket is returned. Otherwise, these two parameters shall be filled in regardless of whether the condition function is specified or what it returns.
 * 
 * The prototype of the condition function is as follows.
 * 
 * ```cpp
 * int CALLBACK 
 * ConditionFunc( 
 *   IN     LPWSABUF    lpCallerId, 
 *   IN     LPWSABUF    lpCallerData, 
 *   IN OUT LPQOS       lpSQOS, 
 *   IN OUT LPQOS       lpGQOS,
 *   IN     LPWSABUF    lpCalleeId, 
 *   IN     LPWSABUF    lpCalleeData, 
 *   OUT    GROUP FAR * g, 	
 *   IN     DWORD_PTR   dwCallbackData
 * );
 * ```
 * 
 * The <i>lpCallerId</i> and <i>lpCallerData</i> are value parameters that must contain the address of the connecting entity and any user data that was sent along with the connection request. If no caller identifier or caller data is available, the corresponding parameter will be null. Many network protocols do not support connect-time caller data. Most conventional network protocols can be expected to support caller identifier information at connection-request time. The **buf** part of the <a href="https://docs.microsoft.com/windows/win32/api/ws2def/ns-ws2def-wsabuf">**WSABUF**</a> pointed to by <i>lpCallerId</i> points to a <a href="https://docs.microsoft.com/windows/win32/winsock/sockaddr-2">**sockaddr**</a>. The **sockaddr** is interpreted according to its address family (typically by casting the **sockaddr** to some type specific to the address family).
 * 
 * The <i>lpSQOS</i> parameter references the flow specifications for socket <i>s</i> specified by the caller, one for each direction, followed by any additional provider-specific parameters. The sending or receiving flow specification values will be ignored as appropriate for any unidirectional sockets. A null value for <i>lpSQOS</i> indicates that there is no caller-supplied QoS and that no negotiation is possible. A non-**NULL** <i>lpSQOS</i> pointer indicates that a QoS negotiation is to occur or that the provider is prepared to accept the QoS request without negotiation.
 * 
 * The <i>lpCalleeId</i> is a value parameter that contains the local address of the connected entity. The **buf** part of the <a href="https://docs.microsoft.com/windows/win32/api/ws2def/ns-ws2def-wsabuf">**WSABUF**</a> pointed to by <i>lpCalleeId</i> points to a <a href="https://docs.microsoft.com/windows/win32/winsock/sockaddr-2">**sockaddr**</a>. The **sockaddr** is interpreted according to its address family (typically by casting the **sockaddr** to some type specific to the address family).
 * 
 * The <i>lpCalleeData</i> is a result parameter used by the condition function to supply user data back to the connecting entity. The storage for this data must be provided by the service provider. The <i>lpCalleeData</i>-&gt;**len** initially contains the length of the buffer allocated by the service provider and pointed to by <i>lpCalleeData</i>-&gt;**buf**. A value of zero means passing user data back to the caller is not supported. The condition function will copy up to <i>lpCalleeData</i>-&gt;**len** bytes of data into <i>lpCalleeData</i>-&gt;**buf**, and then update <i>lpCalleeData</i>-&gt;**len** to indicate the actual number of bytes transferred. If no user data is to be passed back to the caller, the condition function will set <i>lpCalleeData</i>-&gt;**len** to zero. The format of all address and user data is specific to the address family to which the socket belongs.
 * 
 * The <i>dwCallbackData</i> parameter value passed to the condition function is the value passed as the <i>dwCallbackData</i> parameter in the original **LPWSPAccept** call. This value is interpreted only by the Windows Sockets 2 client. This allows a client to pass some context information from the **LPWSPAccept** call site through to the condition function, which provides the condition function with any additional information required to determine whether to accept the connection. A typical usage is to pass a (suitably cast) pointer to a data structure containing references to application-defined objects with which this socket is associated.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspaccept
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPACCEPT extends IUnknown {

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
     * @param {Pointer} addr 
     * @param {Pointer<Integer>} addrlen 
     * @param {Pointer<LPCONDITIONPROC>} lpfnCondition 
     * @param {Pointer} dwCallbackData 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {SOCKET} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(s, addr, addrlen, lpfnCondition, dwCallbackData, lpErrno) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s

        addrlenMarshal := addrlen is VarRef ? "int*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "ptr", addr, addrlenMarshal, addrlen, "ptr", lpfnCondition, "ptr", dwCallbackData, lpErrnoMarshal, lpErrno, "ptr")
        resultHandle := SOCKET({Value: result}, True)
        return resultHandle
    }
}
