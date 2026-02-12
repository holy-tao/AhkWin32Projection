#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Deregisters a registered buffer used with the Winsock registered I/O extensions.
 * @remarks
 * The **RIODeregisterBuffer** function deregisters a registered buffer. When a buffer is deregistered, the application is indicating that it is done with the buffer identifier passed in the *BufferId* parameter. Any subsequent calls to other functions that try to use this buffer identifier will fail.
 * 
 * If a buffer that is still in use is deregistered, the results are undefined. This is considered a serious error. In the [**RIORESULT**](../mswsockdef/ns-mswsockdef-rioresult.md) structure returned by the [**RIODequeueCompletion**](./nc-mswsock-lpfn_riodequeuecompletion.md) function, the status will be unchanged from the normal status. An application developer can detect this error condition using the Application Verifier tool.
 * 
 * If an invalid buffer identifier is passed in the *BufferId* parameter, this is ignored by the **RIODeregisterBuffer** function.
 * 
 * > [!Note]  
 * > The function pointer to the **RIODeregisterBuffer** function must be obtained at run time by making a call to the [**WSAIoctl**](../winsock2/nf-winsock2-wsaioctl.md) function with the **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** opcode specified. The input buffer passed to the **WSAIoctl** function must contain **WSAID\_MULTIPLE\_RIO**, a globally unique identifier (GUID) whose value identifies the Winsock registered I/O extension functions. On success, the output returned by the **WSAIoctl** function contains a pointer to the [**RIO\_EXTENSION\_FUNCTION\_TABLE**](./ns-mswsock-rio_extension_function_table.md) structure that contains pointers to the Winsock registered I/O extension functions. The **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** IOCTL is defined in the *Ws2def.h* header file. The **WSAID\_MULTIPLE\_RIO** GUID is defined in the *Mswsock.h* header file.
 * 
 *  
 * 
 * **Windows Phone 8:** This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
 * 
 * **Windows 8.1** and **Windows Server 2012 R2**: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswsock/nc-mswsock-lpfn_rioderegisterbuffer
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPFN_RIODEREGISTERBUFFER extends IUnknown {

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
     * @param {RIO_BUFFERID} BufferId 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(BufferId) {
        BufferId := BufferId is Win32Handle ? NumGet(BufferId, "ptr") : BufferId

        ComCall(3, this, "ptr", BufferId)
    }
}
