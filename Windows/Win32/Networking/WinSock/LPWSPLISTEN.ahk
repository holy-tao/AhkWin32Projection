#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPListen function establishes a socket to listen for incoming connections.
 * @remarks
 * To accept connections, a socket is first created with <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsocket">LPWSPSocket</a> bound to a local address with <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspbind">LPWSPBind</a></b>, a backlog for incoming connections is specified with **LPWSPListen**, and then the connections are accepted with **[LPWSPAccept](nc-ws2spi-lpwspaccept.md)**. **LPWSPListen** applies only to sockets that are connection oriented (for example, SOCK_STREAM). The socket <i>s</i> is put into passive mode where incoming connection requests are acknowledged and queued pending acceptance by the Windows Sockets SPI client.
 * 
 * This function is typically used by servers that could have more than one connection request at a time: if a connection request arrives with the queue full, the client will receive an error with an indication of <a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAECONNREFUSED">WSAECONNREFUSED</a>.
 * 
 * **LPWSPListen** should continue to function rationally when there are no available descriptors. It should accept connections until the queue is emptied. If descriptors become available, a later call to **LPWSPListen** or **[LPWSPAccept](nc-ws2spi-lpwspaccept.md)** will refill the queue to the current or most recent backlog, if possible, and resume listening for incoming connections.
 * 
 * A Windows Sockets SPI client can call **LPWSPListen** more than once on the same socket. This has the effect of updating the current backlog for the listening socket. Should there be more pending connections than the new <i>backlog</i> value, the excess pending connections will be reset and dropped.
 * 
 * The <i>backlog</i> parameter is limited (silently) to a reasonable value as determined by the service provider. Illegal values are replaced by the nearest legal value. There is no standard provision to find out the actual backlog value.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwsplisten
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPLISTEN extends IUnknown {

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
     * @param {Integer} backlog 
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
    Invoke(s, backlog, lpErrno) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s

        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "int", backlog, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
