#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPGetPeerName function gets the address of the peer to which a socket is connected.
 * @remarks
 * The **LPWSPGetPeerName** function supplies the name of the peer connected to the socket <i>s</i> and stores it in the structure <b><a href="https://docs.microsoft.com/windows/win32/winsock/sockaddr-2">sockaddr</a></b> referenced by <i>name</i>. It can be used only on a connected socket. For datagram sockets, only the name of a peer specified in a previous <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspconnect">LPWSPConnect</a></b> call will be returned and any name specified by a previous <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsendto">LPWSPSendTo</a></b> call will not be returned by **LPWSPGetPeerName**.
 * 
 * On return, the <i>namelen</i> parameter contains the actual size of the name returned in bytes.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspgetpeername
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPGETPEERNAME extends IUnknown {

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
