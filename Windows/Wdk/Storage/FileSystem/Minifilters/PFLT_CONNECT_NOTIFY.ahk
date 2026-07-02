#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFLT_PORT.ahk" { PFLT_PORT }
#Import "..\..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_CONNECT_NOTIFY {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_CONNECT_NOTIFY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PFLT_PORT} ClientPort 
     * @param {Pointer<Void>} ServerPortCookie 
     * @param {Integer} ConnectionContext 
     * @param {Integer} SizeOfContext 
     * @param {Pointer<Pointer<Void>>} ConnectionPortCookie 
     * @returns {NTSTATUS} 
     */
    Call(ClientPort, ServerPortCookie, ConnectionContext, SizeOfContext, ConnectionPortCookie) {
        ServerPortCookieMarshal := ServerPortCookie is VarRef ? "ptr" : "ptr"
        ConnectionPortCookieMarshal := ConnectionPortCookie is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, PFLT_PORT, ClientPort, ServerPortCookieMarshal, ServerPortCookie, IntPtr, ConnectionContext, UInt32, SizeOfContext, ConnectionPortCookieMarshal, ConnectionPortCookie, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PFLT_CONNECT_NOTIFY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_CONNECT_NOTIFY {
        /**
         * Creates a PFLT_CONNECT_NOTIFY pointer that invokes the given AHK function when called.
         * @param {Func(PFLT_PORT, "ptr", IntPtr, UInt32, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PFLT_PORT, "ptr", IntPtr, UInt32, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
