#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Closes an existing completion queue used for I/O completion notification by send and receive requests with the Winsock registered I/O extensions.
 * @remarks
 * The **RIOCloseCompletionQueue** function closes an existing completion queue used for I/O completion. The [**RIO\_CQ**](/windows/win32/winsock/riocqueue) passed in the *CQ* parameter is locked for writing by the kernel. The completion queue is marked as invalid, so that new completions cannot be added. Any new completions to be added are silently dropped. The application is expected to tracking any pending send or receive operations.
 * 
 * If an invalid completion queue is passed in the *CQ* parameter (**RIO\_INVALID\_CQ**, for example), this is ignored by the **RIOCloseCompletionQueue** function.
 * 
 * > [!Note]  
 * > The function pointer to the **RIOCloseCompletionQueue** function must be obtained at run time by making a call to the [**WSAIoctl**](../winsock2/nf-winsock2-wsaioctl.md) function with the **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** opcode specified. The input buffer passed to the **WSAIoctl** function must contain **WSAID\_MULTIPLE\_RIO**, a globally unique identifier (GUID) whose value identifies the Winsock registered I/O extension functions. On success, the output returned by the **WSAIoctl** function contains a pointer to the [**RIO\_EXTENSION\_FUNCTION\_TABLE**](./ns-mswsock-rio_extension_function_table.md) structure that contains pointers to the Winsock registered I/O extension functions. The **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** IOCTL is defined in the *Ws2def.h* header file. The **WSAID\_MULTIPLE\_RIO** GUID is defined in the *Mswsock.h* header file.
 * 
 *  
 * 
 * **Windows Phone 8:** This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
 * 
 * **Windows 8.1** and **Windows Server 2012 R2**: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswsock/nc-mswsock-lpfn_rioclosecompletionqueue
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPFN_RIOCLOSECOMPLETIONQUEUE extends IUnknown {

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
     * @param {RIO_CQ} CQ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(CQ) {
        CQ := CQ is Win32Handle ? NumGet(CQ, "ptr") : CQ

        ComCall(3, this, "ptr", CQ)
    }
}
