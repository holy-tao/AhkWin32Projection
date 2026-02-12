#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPGetOverlappedResult function returns the results of an overlapped operation on the specified socket.
 * @remarks
 * The results reported by the **LPWSPGetOverlappedResult** function are those of the specified socket's last overlapped operation to which the specified <b><a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaoverlapped">WSAOverlapped</a></b> structure was provided, and for which the operation's results were pending. A pending operation is indicated when the function that started the operation returns SOCKET_ERROR, and the <i>lpErrno</i> is WSA_IO_PENDING. When an I/O operation is pending, the function that started the operation resets the **hEvent** member of the **WSAOVERLAPPED** structure to the nonsignaled state. Then, when the pending operation has been completed, the system sets the event object to the signaled state.
 * 
 * If the <i>fWait</i> parameter is **TRUE**, **LPWSPGetOverlappedResult** determines whether the pending operation has been completed by blocking and waiting for the event object to be in the signaled state. A client may set the <i>fWait</i> parameter to **TRUE** only if it selected event-based completion notification when the I/O operation was requested. If another form of notification was selected, the usage of the **hEvent** member of the <b><a href="https://docs.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsaoverlapped">WSAOverlapped</a></b> structure is different, and setting <i>fWait</i> to **TRUE** causes unpredictable results.
 * 
 * > [!Note]  
 * > All I/O initiated by a given thread is canceled when that thread exits. For overlapped sockets, pending asynchronous operations can fail if the thread is closed before the operations complete. See <b><a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-exitthread">ExitThread</a></b> for more information.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspgetoverlappedresult
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPGETOVERLAPPEDRESULT extends IUnknown {

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
     * @param {Pointer<Integer>} lpcbTransfer 
     * @param {BOOL} fWait 
     * @param {Pointer<Integer>} lpdwFlags 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(s, lpOverlapped, lpcbTransfer, fWait, lpdwFlags, lpErrno) {
        s := s is Win32Handle ? NumGet(s, "ptr") : s

        lpcbTransferMarshal := lpcbTransfer is VarRef ? "uint*" : "ptr"
        lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", s, "ptr", lpOverlapped, lpcbTransferMarshal, lpcbTransfer, "int", fWait, lpdwFlagsMarshal, lpdwFlags, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
