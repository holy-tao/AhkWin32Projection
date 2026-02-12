#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPEnumNetworkEvents function reports occurrences of network events for the indicated socket.
 * @remarks
 * This function is used to report which network events have occurred for the indicated socket since the last invocation of this function. It is intended for use in conjunction with [LPWSPEventSelect](./nc-ws2spi-lpwspeventselect.md) and [LPWSPAsyncSelect](./nc-ws2spi-lpwspasyncselect.md), which associate an event object with one or more network events. Recording of network events commences when **LPWSPEventSelect** or **LPWSPAsyncSelect** is called with a nonzero <i>lNetworkEvents</i> argument, and remains in effect until another corresponding call is made to **LPWSPEventSelect** or **LPWSPAsyncSelect** with the <i>lNetworkEvents</i> argument set to zero.
 * 
 * **LPWSPEnumNetworkEvents** only reports network activity and errors nominated through <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspeventselect">LPWSPEventSelect</a></b>. See the descriptions of <b><a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspselect">LPWSPSelect</a></b> and **[LPWSPAsyncSelect](nc-ws2spi-lpwspasyncselect.md)** to find out how those functions report network activity and errors.
 * 
 * The socket's internal record of network events is copied to the structure referenced by <i>lpNetworkEvents</i>, whereafter the internal network events record is cleared. If <i>hEventObject</i> is non-null, the indicated event object is also reset. The Windows Sockets provider guarantees that the operations of copying the network event record, clearing it, and resetting any associated event object are atomic, such that the next occurrence of a nominated network event will cause the event object to become set. In the case of this function returning SOCKET_ERROR, the associated event object is not reset and the record of network events is not cleared.
 * 
 * The <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsanetworkevents">WSANETWORKEVENTS</a> structure is defined on the <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsanetworkevents">WSANETWORKEVENTS</a> reference page.
 * 
 * The **lNetworkEvents** member of the <a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsanetworkevents">WSANETWORKEVENTS</a> structure indicates which of the FD_XXX network events have occurred. The <i>iErrorCode</i> array is used to contain any associated error codes, with array index corresponding to the position of event bits in **lNetworkEvents**. The identifiers such as FD_READ_BIT and FD_WRITE_BIT can be used to index the <i>iErrorCode</i> array.
 * 
 * Note that only those elements of the <i>iErrorCode</i> array are set that correspond to the bits set in the **lNetworkEvents** member. Other members are not modified (this is important for backward compatibility with the Windows Socket 2 SPI clients that are not aware of new FD_ROUTING_INTERFACE_CHANGE and FD_ADDRESS_LIST_CHANGE events).
 * 
 * The following error codes can be returned along with the respective network event.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspenumnetworkevents
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPENUMNETWORKEVENTS extends IUnknown {

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
     * @param {HANDLE} hEventObject 
     * @param {Pointer<WSANETWORKEVENTS>} lpNetworkEvents 
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
    Invoke(s, hEventObject, lpNetworkEvents, lpErrno) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s
        hEventObject := hEventObject is Win32Handle ? NumGet(hEventObject, "ptr") : hEventObject

        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "ptr", hEventObject, "ptr", lpNetworkEvents, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
