#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RIO_BUFFERID.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Registers a RIO\_BUFFERID, a registered buffer descriptor, with a specified buffer for use with the Winsock registered I/O extensions.
 * @remarks
 * The **RIORegisterBuffer** function creates a registered buffer identifier for a specified buffer. When a buffer is registered, the virtual memory pages containing the buffer will be locked into physical memory.
 * 
 * If several small, non-contiguous buffers are registered, the physical memory footprint for the buffers may effectively be as large as an entire memory page per registration. In these cases it may be beneficial to allocate multiple request buffers together.
 * 
 * There is also a small amount of overhead in physical memory used for the buffer registration itself. So if there are many allocations aggregated into single larger allocation, the physical memory footprint may be reduced further by aggregating the buffer registrations as well. In this case the application may need to take extra care to ensure that the buffers are eventually deregistered, but not while any send or receive requests are outstanding.
 * 
 * A portion of a registered buffer is passed to the [**RIOSend**](./nc-mswsock-lpfn_riosend.md), [**RIOSendEx**](./nc-mswsock-lpfn_riosendex.md), [**RIOReceive**](./nc-mswsock-lpfn_rioreceive.md), and [**RIOReceiveEx**](./nc-mswsock-lpfn_rioreceiveex.md) functions in the *pData* parameter for sending or receiving data.
 * 
 * When the buffer identifier is no longer needed, call the [**RIODeregisterBuffer**](./nc-mswsock-lpfn_rioderegisterbuffer.md) function to deregister the buffer identifier.
 * 
 * > [!Note]  
 * > The function pointer to the **RIORegisterBuffer** function must be obtained at run time by making a call to the [**WSAIoctl**](../winsock2/nf-winsock2-wsaioctl.md) function with the **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** opcode specified. The input buffer passed to the **WSAIoctl** function must contain **WSAID\_MULTIPLE\_RIO**, a globally unique identifier (GUID) whose value identifies the Winsock registered I/O extension functions. On success, the output returned by the **WSAIoctl** function contains a pointer to the [**RIO\_EXTENSION\_FUNCTION\_TABLE**](./ns-mswsock-rio_extension_function_table.md) structure that contains pointers to the Winsock registered I/O extension functions. The **SIO\_GET\_MULTIPLE\_EXTENSION\_FUNCTION\_POINTER** IOCTL is defined in the *Ws2def.h* header file. The **WSAID\_MULTIPLE\_RIO** GUID is defined in the *Mswsock.h* header file.
 * 
 *  
 * 
 * **Windows Phone 8:** This function is supported for Windows Phone Store apps on Windows Phone 8 and later.
 * 
 * **Windows 8.1** and **Windows Server 2012 R2**: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswsock/nc-mswsock-lpfn_rioregisterbuffer
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPFN_RIOREGISTERBUFFER extends IUnknown {

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
     * @param {PSTR} DataBuffer 
     * @param {Integer} DataLength 
     * @returns {RIO_BUFFERID} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(DataBuffer, DataLength) {
        DataBuffer := DataBuffer is String ? StrPtr(DataBuffer) : DataBuffer

        result := ComCall(3, this, "ptr", DataBuffer, "uint", DataLength, "ptr")
        resultHandle := RIO_BUFFERID({Value: result}, True)
        return resultHandle
    }
}
