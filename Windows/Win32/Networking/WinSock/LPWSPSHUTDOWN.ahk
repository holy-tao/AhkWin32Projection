#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPShutdown function disables sends and/or receives on a socket.
 * @remarks
 * The **LPWSPShutdown** function is used on all types of sockets to disable reception, transmission, or both.
 * 
 * If <i>how</i> is SD_RECEIVE, subsequent receives on the socket will be disallowed. This has no effect on the lower protocol layers. For TCP sockets, if there is still data queued on the socket waiting to be received, or data arrives subsequently, the connection is reset, since the data cannot be delivered to the user. For UDP sockets, incoming datagrams are accepted and queued. In no case will an ICMP error packet be generated.
 * 
 * If <i>how</i> is SD_SEND, subsequent sends on the socket are disallowed. For TCP sockets, a FIN will be sent. Setting <i>how</i> to SD_BOTH disables both sends and receives as described above.
 * 
 * Note that **LPWSPShutdown** does not close the socket, and resources attached to the socket will not be freed until <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspclosesocket">LPWSPCloseSocket</a></b> is invoked.
 * 
 * > [!Note]  
 * > The **LPWSPShutdown** function does not block regardless of the SO_LINGER setting on the socket. A Windows Sockets SPI client should not rely on being able to reuse a socket after it has been shut down. In particular, a Windows Sockets service provider is not required to support the use of <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> on such a socket.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspshutdown
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPSHUTDOWN extends IUnknown {

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
     * @param {Integer} how 
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
    Invoke(s, how, lpErrno) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s

        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "int", how, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
