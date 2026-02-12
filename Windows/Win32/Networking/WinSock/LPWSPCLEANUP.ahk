#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPWSPCleanup function terminates use of the Windows Sockets service provider.
 * @remarks
 * The Windows Sockets 2 SPI client is required to perform a successful <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wspstartup">**WSPStartup**</a> call before it can use Winsock service providers. When it has completed the use of Winsock service providers, the SPI client will call **LPWSPCleanup** to deregister itself from a Winsock service provider and allow the service provider to free any resources allocated on behalf of the Windows Sockets 2 client. It is permissible for SPI clients to make more than one **WSPStartup** call. For each **WSPStartup** call, a corresponding **LPWSPCleanup** call will also be issued. Only the final **LPWSPCleanup** for the service provider does the actual cleanup; the preceding calls simply decrement an internal reference count in the Winsock service provider.
 * 
 * When the internal reference count reaches zero and actual cleanup operations commence, any pending blocking or asynchronous calls issued by any thread in this process are canceled without posting any notification messages or signaling any event objects. Any pending overlapped send and receive operations (<a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsend">**LPWSPSend**</a>, <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspsendto">**LPWSPSendTo**</a>, <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecv">**LPWSPRecv**</a>, <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwsprecvfrom">**LPWSPRecvFrom**</a> with an overlapped socket) issued by any thread in this process are also canceled without setting the event object or invoking the completion routine, if specified. In this case, the pending overlapped operations fail with the error status WSA_OPERATION_ABORTED. Any sockets open when **LPWSPCleanup** is called are reset and automatically deallocated as if <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nc-ws2spi-lpwspclosesocket">**LPWSPCloseSocket**</a> was called; sockets that have been closed with **LPWSPCloseSocket** but still have pending data to be sent are not affected, but the pending data is still sent.
 * 
 * This function should not return until the service provider DLL is prepared to be unloaded from memory. In particular, any data remaining to be transmitted must either already have been sent or be queued for transmission by portions of the transport stack that will not be unloaded from memory along with the service provider's DLL.
 * 
 * A Winsock service provider must be prepared to deal with a process that terminates without invoking **LPWSPCleanup** (for example, as a result of an error). A Winsock service provider must ensure that **LPWSPCleanup** leaves things in a state in which the Ws2_32.dll can immediately invoke <a href="https://docs.microsoft.com/windows/win32/api/ws2spi/nf-ws2spi-wspstartup">**WSPStartup**</a> to reestablish Winsock usage.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpwspcleanup
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSPCLEANUP extends IUnknown {

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
    Invoke(lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, lpErrnoMarshal, lpErrno, "int")
        return result
    }
}
