#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Transmits in-memory data or file data over a connected socket.
 * @remarks
 * The 
 * <b>TransmitPackets</b> function is optimized according to the operating system on which it is used:
 * 
 * 
 * <ul>
 * <li>On Windows server editions, the 
 * <b>TransmitPackets</b> function is optimized for high performance.</li>
 * <li>On Windows client editions, the 
 * <b>TransmitPackets</b> function is optimized for minimum memory and resource utilization.</li>
 * </ul>
 * 
 * 
 * The maximum number of bytes that can be transmitted using a single call to the <b>TransmitPackets</b> function is 2,147,483,646, the maximum value for a 32-bit integer minus 1. If an application needs to transmit data larger than 2,147,483,646 bytes, then multiple calls to the <b>TransmitPackets</b> function can be used with each call transferring no more than 2,147,483,646 bytes. 
 * 
 * 
 * <div class="alert"><b>Note</b>  The function pointer for the 
 * <b>TransmitPackets</b> function must be obtained at run time by making a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaioctl">WSAIoctl</a> function with the <b>SIO_GET_EXTENSION_FUNCTION_POINTER</b> opcode specified. The input buffer passed to the <b>WSAIoctl</b> function must contain <b>WSAID_TRANSMITPACKETS</b>, a globally unique identifier (GUID) whose value identifies the <b>TransmitPackets</b> extension function. On success, the output returned by the <b>WSAIoctl</b> function contains a pointer to the <b>TransmitPackets</b> function. The <b>WSAID_TRANSMITPACKETS</b> GUID is defined in the <i>Mswsock.h</i> header file.</div>
 * <div> </div>
 * 
 * 
 * Expect better performance results when using the 
 * <b>TransmitPackets</b> function on Windows Server 2003.
 * 
 * When <i>lpOverlapped</i> is not <b>NULL</b>, overlapped I/O might not finish before the 
 * <b>TransmitPackets</b> function returns. When this occurs, the 
 * <b>TransmitPackets</b> function returns fails, and a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsagetlasterror">WSAGetLastError</a> function returns ERROR_IO_PENDING, allowing the caller to continue processing while the transmission completes.
 * 
 * <div class="alert"><b>Note</b>   All I/O initiated by a given thread is canceled when that thread exits. For overlapped sockets, pending asynchronous operations can fail if the thread is closed before the  operations complete. See <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitthread">ExitThread</a> for more information.</div>
 * <div> </div>
 * When the 
 * <b>TransmitPackets</b> function returns <b>TRUE</b> or returns <b>FALSE</b> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-wsagetlasterror">WSAGetLastError</a> returns ERROR_IO_PENDING, Windows sets the event specified by the <b>hEvent</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure or the socket specified by <i>hSocket</i> to the signaled state, and upon completion, delivers notification to any completion port associated with the socket. Use 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsagetoverlappedresult">WSAGetOverlappedResult</a>, or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> to retrieve final status and number of bytes transmitted.
 * 
 * TransmitPackets and Asynchronous Procedure Calls (APCs)
 * 
 * Use of the TF_USE_KERNEL_APC flag can deliver significant performance benefits. If the thread initiating the 
 * <b>TransmitPackets</b> function call is being used for heavy computations, it is possible, though unlikely, that APCs could be prevented from launching.
 * 
 * <div class="alert"><b>Note</b>  There is a difference between kernel and user-mode APCs:<ul>
 * <li>Kernel APCs launch when a thread is in a wait state.</li>
 * <li>User-mode APCs launch when a thread is in an alertable wait state.</li>
 * </ul>
 * </div>
 * <div> </div>
 * <b>Windows Phone 8:</b> This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
 * 
 * <b>Windows 8.1</b> and <b>Windows Server 2012 R2</b>: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswsock/nc-mswsock-lpfn_transmitpackets
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPFN_TRANSMITPACKETS extends IUnknown {

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
     * @param {SOCKET} hSocket 
     * @param {Pointer<TRANSMIT_PACKETS_ELEMENT>} lpPacketArray 
     * @param {Integer} nElementCount 
     * @param {Integer} nSendSize 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @param {Integer} dwFlags 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hSocket, lpPacketArray, nElementCount, nSendSize, lpOverlapped, dwFlags) {
        hSocket := hSocket is Win32Handle ? NumGet(hSocket, "ptr") : hSocket

        result := ComCall(3, this, "ptr", hSocket, "ptr", lpPacketArray, "uint", nElementCount, "uint", nSendSize, "ptr", lpOverlapped, "uint", dwFlags, "int")
        return result
    }
}
