#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPGetSockName function gets the local name for a socket.
 * @remarks
 * **LPWSPGetSockName** retrieves the current name for the specified socket descriptor in <i>name</i>. It is used on a bound and/or connected socket specified by the <i>s</i> parameter. The local association is returned. This call is especially useful when a <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> call has been made without doing a <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspbind">LPWSPBind</a></b> first; as this call provides the only means by which the local association that has been set by the service provider can be determined.
 * 
 * If a socket was bound to an unspecified address (for example, ADDR_ANY), indicating that any of the host's addresses within the specified address family should be used for the socket, **LPWSPGetSockName** will <i>not</i> necessarily return information about the host address, unless the socket has been connected with <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> or **[LPWSPAccept](nc-ws2spi-lpwspaccept.md)**. The Windows Sockets SPI client must not assume that an address will be specified unless the socket is connected. This is because for a multihomed host, the address that will be used for the socket is unknown until the socket is connected.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspgetsockname
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPGETSOCKNAME extends IUnknown {

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
     * @param {Pointer<Integer>} namelen 
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

        namelenMarshal := namelen is VarRef ? "int*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "ptr", name, namelenMarshal, namelen, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
