#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPBind function associates a local address (that is, name) with a socket.
 * @remarks
 * The **LPWSPBind** function is used on an unconnected connectionless or connection-oriented socket, before subsequent calls to the <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">**LPWSPConnect**</a> or <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsplisten">**LPWSPListen**</a> functions. When a socket is created with <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsocket">**LPWSPSocket**</a>, it exists in a namespace (address family), but it has no name or local address assigned. The **LPWSPBind** function establishes the local association of the socket by assigning a local name to an unnamed socket.
 * 
 * As an example, in the Internet address family, a name consists of three parts: the address family, a host address, and a port number that identifies the Winsock SPI client. In Windows Sockets 2, the <i>name</i> parameter is not strictly interpreted as a pointer to a <a href="https://docs.microsoft.com/windows/win32/winsock/sockaddr-2">**sockaddr**</a> structure. Service providers are free to regard it as a pointer to a block of memory of size <i>namelen</i>. The first two bytes in this block (corresponding to **sa_family** in the **sockaddr** declaration) must contain the address family that was used to create the socket. Otherwise, the error <a href="https://docs.microsoft.com/windows/win32/winsock/windows-sockets-error-codes-2#WSAEFAULT">WSAEFAULT</a></b> will be indicated.
 * 
 * If a Windows Sockets 2 SPI client does not care what local address is assigned to it, it will specify the manifest constant value **ADDR_ANY** for the **sa_data** member of the <i>name</i> parameter. This instructs the service provider to use any appropriate network address. For TCP/IP, if the port is specified as zero, the service provider will assign a unique port to the Winsock SPI client with a value between 1024 and 5000. The SPI client can use <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetsockname">**LPWSPGetSockName**</a> after **LPWSPBind** to learn the address and the port that has been assigned to it. However, note that if the Internet address is equal to INADDR_ANY, <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspgetsockopt">**LPWSPGetSockOpt**</a> will not necessarily be able to supply the address until the socket is connected, since several addresses can be valid if the host is multihomed.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspbind
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPBIND extends IUnknown {

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
     * @param {Pointer} name 
     * @param {Integer} namelen 
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
    Invoke(s, name, namelen, lpErrno) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s

        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "ptr", name, "int", namelen, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
