#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPRecvDisconnect function terminates reception on a socket and retrieves the disconnect data, if the socket is connection oriented.
 * @remarks
 * **LPWSPRecvDisconnect** is used on connection-oriented sockets to disable reception, and retrieve any incoming disconnect data from the remote party.
 * 
 * After this function has been successfully issued, subsequent receives on the socket will be disallowed. This has no effect on the lower protocol layers. For TCP, the TCP window is not changed and incoming data will be accepted (but not acknowledged) until the window is exhausted. For UDP, incoming datagrams are accepted and queued. In no case will an ICMP error packet be generated.
 * 
 * To successfully receive incoming disconnect data, a Windows Sockets SPI client must use other mechanisms to determine that the circuit has been closed. For example, a client needs to receive an FD_CLOSE notification, or get a zero return value, or a <b><a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEDISCON">WSAEDISCON</a></b> error code from <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">LPWSPRecv</a></b>.
 * 
 * Note that **LPWSPRecvDisconnect** does not close the socket, and resources attached to the socket will not be freed until <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspclosesocket">LPWSPCloseSocket</a></b> is invoked.
 * 
 * > [!Note]  
 * > **LPWSPRecvDisconnect** does not block regardless of the SO_LINGER setting on the socket. A Windows Sockets SPI client should not rely on being able to reuse a socket after it has been **LPWSPRecvDisconnect**ed. In particular, a Windows Sockets provider is not required to support the use of <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> on such a socket.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwsprecvdisconnect
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPRECVDISCONNECT extends IUnknown {

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
     * @param {Pointer<WSABUF>} lpInboundDisconnectData 
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
    Invoke(s, lpInboundDisconnectData, lpErrno) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s

        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "ptr", lpInboundDisconnectData, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
