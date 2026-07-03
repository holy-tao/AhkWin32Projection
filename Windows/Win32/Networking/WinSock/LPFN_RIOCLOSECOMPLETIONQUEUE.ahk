#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RIO_CQ.ahk" { RIO_CQ }

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
 * @see https://learn.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rioclosecompletionqueue
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPFN_RIOCLOSECOMPLETIONQUEUE {
    value : IntPtr

    __value {
        set {
            if (value is LPFN_RIOCLOSECOMPLETIONQUEUE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {RIO_CQ} CQ A descriptor identifying an existing completion queue.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(CQ) {
        DllCall(this.value, RIO_CQ, CQ)
    }

    /**
     * A LPFN_RIOCLOSECOMPLETIONQUEUE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFN_RIOCLOSECOMPLETIONQUEUE {
        /**
         * Creates a LPFN_RIOCLOSECOMPLETIONQUEUE pointer that invokes the given AHK function when called.
         * @param {Func(RIO_CQ) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RIO_CQ, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
