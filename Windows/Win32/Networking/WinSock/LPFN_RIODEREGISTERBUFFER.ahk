#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RIO_BUFFERID.ahk" { RIO_BUFFERID }

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
 * @see https://learn.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rioderegisterbuffer
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPFN_RIODEREGISTERBUFFER {
    value : IntPtr

    __value {
        set {
            if (value is LPFN_RIODEREGISTERBUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {RIO_BUFFERID} BufferId A descriptor identifying a registered buffer.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(BufferId) {
        DllCall(this.value, RIO_BUFFERID, BufferId)
    }

    /**
     * A LPFN_RIODEREGISTERBUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFN_RIODEREGISTERBUFFER {
        /**
         * Creates a LPFN_RIODEREGISTERBUFFER pointer that invokes the given AHK function when called.
         * @param {Func(RIO_BUFFERID) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RIO_BUFFERID, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
