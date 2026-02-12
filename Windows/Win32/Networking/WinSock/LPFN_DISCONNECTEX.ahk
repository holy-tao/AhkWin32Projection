#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Closes a connection on a socket, and allows the socket handle to be reused.Note  This function is a Microsoft-specific extension to the Windows Sockets specification.
 * @remarks
 * The **DisconnectEx** function does not support datagram sockets. Therefore, the socket specified by *hSocket* must be connection-oriented, such as a SOCK\_STREAM, SOCK\_SEQPACKET, or SOCK\_RDM socket.
 * 
 * > [!Note]  
 * > The function pointer for the **DisconnectEx** function must be obtained at run time by making a call to the [**WSAIoctl**](../winsock2/nf-winsock2-wsaioctl.md) function with the **SIO\_GET\_EXTENSION\_FUNCTION\_POINTER** opcode specified. The input buffer passed to the **WSAIoctl** function must contain **WSAID\_DISCONNECTEX**, a globally unique identifier (GUID) whose value identifies the **DisconnectEx** extension function. On success, the output returned by the **WSAIoctl** function contains a pointer to the **DisconnectEx** function. The **WSAID\_DISCONNECTEX** GUID is defined in the *Mswsock.h* header file.
 * 
 * When <i>lpOverlapped</i> is not **NULL**, overlapped I/O might not finish before **DisconnectEx** returns, resulting in the **DisconnectEx** function returning **FALSE** and a call to the [**WSAGetLastError**](../winsock/nf-winsock-wsagetlasterror.md) function returning **ERROR\_IO\_PENDING**. This design enables the caller to continue processing while the disconnect operation completes. Upon completion of the request, Windows sets either the event specified by the <b>hEvent</b> member of the [**OVERLAPPED**](../minwinbase/ns-minwinbase-overlapped.md) structure, or the socket specified by *hSocket*, to the signaled state.
 * 
 * > [!Note]  
 * > All I/O initiated by a given thread is canceled when that thread exits. For overlapped sockets, pending asynchronous operations can fail if the thread is closed before the operations complete. See [**ExitThread**](../processthreadsapi/nf-processthreadsapi-exitthread.md) for more information.
 * 
 * The TIME\_WAIT state determines the time that must elapse before TCP can release a closed connection and reuse its resources. This interval between closure and release is known as the TIME\_WAIT state or 2MSL state. During this time, the connection can be reopened at much less cost to the client and server than establishing a new connection. The TIME\_WAIT behavior is specified in [RFC 793](https://www.ietf.org/rfc/rfc793.txt) which requires that TCP maintains a closed connection for an interval at least equal to twice the maximum segment lifetime (MSL) of the network. When a connection is released, its socket pair and internal resources used for the socket can be used to support another connection.
 * 
 * Windows TCP reverts to a TIME\_WAIT state subsequent to the closing of a connection. While in the TIME\_WAIT state, a socket pair cannot be re-used. The TIME\_WAIT period is configurable by modifying the following DWORD registry setting that represents the TIME\_WAIT period in seconds.
 * 
 * **HKEY\_LOCAL\_MACHINE**\\**System**\\**CurrentControlSet**\\**Services**\\**TCPIP**\\**Parameters**\\**TcpTimedWaitDelay**
 * 
 * By default, the MSL is defined to be 120 seconds. The TcpTimedWaitDelay registry setting defaults to a value 240 seconds, which represents 2 times the maximum segment lifetime of 120 seconds or 4 minutes. However, you can use this entry to customize the interval. Reducing the value of this entry allows TCP to release closed connections faster, providing more resources for new connections. However, if the value is too low, TCP might release connection resources before the connection is complete, requiring the server to use additional resources to re-establish the connection. This registry setting can be set from 0 to 300 seconds.
 * 
 * **Windows Phone 8:** This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
 * 
 * **Windows 8.1** and **Windows Server 2012 R2**: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswsock/nc-mswsock-lpfn_disconnectex
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPFN_DISCONNECTEX extends IUnknown {

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
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @param {Integer} dwFlags 
     * @param {Integer} dwReserved 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(s, lpOverlapped, dwFlags, dwReserved) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s

        result := ComCall(3, this, "ptr", s, "ptr", lpOverlapped, "uint", dwFlags, "uint", dwReserved, "int")
        return result
    }
}
