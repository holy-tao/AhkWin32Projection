#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sends an IOCTL to a namespace service provider.
 * @remarks
 * The 
 * **NSPIoctl** function is used to send an I/O control code to a namespace provider in order to set or retrieve operating parameters associated with a query handle. The <i>hLookup</i> parameter is a handle to the namespace provider query previously returned by 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPLookupServiceBegin</a> function (not  a socket handle).
 * 
 * Any IOCTL sent to a namespace provider may block indefinitely, depending upon the implementation of the namespace. If an application cannot tolerate blocking in a 
 * **NSPIoctl** function call, overlapped I/O should be used and the <i>lpCompletion</i> parameter should point to a <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsacompletion">WSACOMPLETION</a> structure. To make a 
 * **NSPIoctl** function call nonblocking and return immediately, set the **Type** member of the **WSACOMPLETION** structure to **NSP_NOTIFY_IMMEDIATELY**.
 * 
 *  If <i>lpCompletion</i> is **NULL**, the 
 * **NSPIoctl** function executes as a blocking call. The namespace provider should return immediately and should not block. But each namespace provider is responsible for enforcing this behavior. 
 * 
 * The following IOCTL code is supported by several Microsoft namespace providers:
 * 
 * 
 * 
 * 
 * <dl>
 * <dt><a id="SIO_NSP_NOTIFY_CHANGE"></a><a id="sio_nsp_notify_change"></a></b>SIO_NSP_NOTIFY_CHANGE</b></dl>
 * <dd>
 * This operation checks if the results returned with previous calls using the <i>hLookup</i> parameter are still valid.  These previous calls include the initial call to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPLookupServiceBegin</a> function to retrieve the <i>hLookup</i> parameter.  These previous calls may also include calls to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicenext">NSPLookupServiceNext</a> function using the <i>hLookup</i> parameter. 
 * 
 * The Microsoft namespace providers that support this IOCTL include the following:
 * 
 * 
 *  
 * - NS_NLA - The Network Location Awareness (NLA) namespace provider. 
 * - NS_PNRPNAME - The Peer Name Resolution Protocol (PNRP) namespace provider. 
 * - NS_PNRPCLOUD - The Peer Name Resolution Protocol (PNRP) cloud namespace provider. 
 *  
 * 
 * 
 * Other non-Microsoft namespace providers may be installed that also support this IOCTL.
 * 
 * When the <i>lpCompletion</i> parameter is **NULL**, this IOCTL implements a  special behavior. If the <i>lpCompletion</i> parameter is **NULL** for this IOCTL, this operation is a poll and returns immediately. If the query set remains valid, 
 * <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEWOULDBLOCK</a> is returned as notification that the query set remains valid. If the query set has changed and is invalid, **NO_ERROR** is returned indicating success in polling for invalidation of the query set. 
 * 
 * If the <i>lpCompletion</i> parameter is not **NULL** and points to an <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsacompletion">WSACOMPLETION</a> structure, then the  **NSPIoctl** function returns <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSA_IO_PENDING</a> if the  overlapped operation was successfully initiated and completion will be indicated at a later time. The method specified in the **WSACOMPLETION** structure is used to notify the application if the query set is still valid. 
 * 
 * Not all name resolution protocols are able to support this feature, and therefore, this function call may fail with 
 * <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>. A query containing data from multiple providers cannot call this IOCTL, and will return 
 * <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSAEINVAL</a>.
 * 
 * The <i>lpvInBuffer</i>, <i>cbInBuffer</i>, <i>lpvOutBuffer</i>, and <i>cbOutBuffer</i> parameters are currently ignored by Microsoft namespace providers.
 * 
 * For single-threaded applications, a typical method to use the **NSPIoctl** function is as follows. Call the **NSPIoctl** function with the <i>dwControlCode</i> parameter set to **SIO_NSP_NOTIFY_CHANGE** with no completion routine (the <i>lpCompletion</i> parameter set to **NULL**) after every <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicenext">NSPLookupServiceNext</a> function  call to make sure the query data is still valid. If the data becomes invalid, call the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupserviceend">NSPLookupServiceEnd</a> function to close the query handle. Call the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPLookupServiceBegin</a> function to retrieve a new query handle and begin the query again.
 * 
 * For multithreaded applications, a typical method to use the **NSPIoctl** function is as follows. Call the **NSPIoctl** function with the <i>dwControlCode</i> parameter set to **SIO_NSP_NOTIFY_CHANGE** with a completion routine after the initial call to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPLookupServiceBegin</a> function. The application would use the mechanism for notification specified in the completion routine to be notified when data is no longer valid. One common mechanism is to use an event specified in the completion routine. If the data becomes invalid, call the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupserviceend">NSPLookupServiceEnd</a> function to close the query handle. Call the **NSPLookupServiceBegin** and the **NSPIoctl** functions to retrieve a new query handle and begin the query again.
 * 
 * Some protocols may simply cache the information locally and invalidate it after some time, in which case notification may be issued to indicate the local cache has been invalidated.
 * 
 * For name resolution protocols where changes are infrequent, it is possible for a namespace provider to indicate a global change event that may not be applicable to the query on which change notification was requested and issued.
 * 
 * </dd>
 * </dl>
 * 
 * 
 * Immediate poll operations are usually much less resource intensive since they do not require a notification object. In most cases, this is implemented as a simple Boolean variable check. Asynchronous notification, however, may necessitate the creation of dedicated worker threads and/or inter-process communication channels, depending on the implementation of the namespace provider service, and will incur processing overhead related to the notification object involved with signaling the change event.
 * 
 * To cancel an asynchronous notification request, end the original query with a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupserviceend">NSPLookupServiceEnd</a> function call on the affected query handle. Canceling the asynchronous notification for LUP_NOTIFY_HWND will not post any message, however, an overlapped operation will be completed and notification will be delivered with the error 
 * <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSA_OPERATION_ABORTED</a>.
 * 
 * <div class="alert">**Note**   All I/O initiated by a given thread is canceled when that thread exits. For overlapped sockets, pending asynchronous operations can fail if the thread is closed before the  operations complete. See <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitthread">ExitThread</a> for more information.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpnspioctl
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPNSPIOCTL extends IUnknown {

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
     * @param {HANDLE} hLookup 
     * @param {Integer} dwControlCode 
     * @param {Pointer} lpvInBuffer 
     * @param {Integer} cbInBuffer 
     * @param {Pointer} lpvOutBuffer 
     * @param {Integer} cbOutBuffer 
     * @param {Pointer<Integer>} lpcbBytesReturned 
     * @param {Pointer<WSACOMPLETION>} lpCompletion 
     * @param {Pointer<WSATHREADID>} lpThreadId 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hLookup, dwControlCode, lpvInBuffer, cbInBuffer, lpvOutBuffer, cbOutBuffer, lpcbBytesReturned, lpCompletion, lpThreadId) {
        hLookup := hLookup is Win32Handle ? NumGet(hLookup, "ptr") : hLookup

        lpcbBytesReturnedMarshal := lpcbBytesReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hLookup, "uint", dwControlCode, "ptr", lpvInBuffer, "uint", cbInBuffer, "ptr", lpvOutBuffer, "uint", cbOutBuffer, lpcbBytesReturnedMarshal, lpcbBytesReturned, "ptr", lpCompletion, "ptr", lpThreadId, "int")
        return result
    }
}
