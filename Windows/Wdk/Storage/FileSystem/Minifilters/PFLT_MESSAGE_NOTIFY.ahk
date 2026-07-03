#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_MESSAGE_NOTIFY {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_MESSAGE_NOTIFY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} PortCookie 
     * @param {Integer} InputBuffer 
     * @param {Integer} InputBufferLength 
     * @param {Integer} OutputBuffer 
     * @param {Integer} OutputBufferLength 
     * @param {Pointer<Integer>} ReturnOutputBufferLength 
     * @returns {NTSTATUS} 
     */
    Call(PortCookie, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength, ReturnOutputBufferLength) {
        PortCookieMarshal := PortCookie is VarRef ? "ptr" : "ptr"
        ReturnOutputBufferLengthMarshal := ReturnOutputBufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, PortCookieMarshal, PortCookie, IntPtr, InputBuffer, UInt32, InputBufferLength, IntPtr, OutputBuffer, UInt32, OutputBufferLength, ReturnOutputBufferLengthMarshal, ReturnOutputBufferLength, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PFLT_MESSAGE_NOTIFY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_MESSAGE_NOTIFY {
        /**
         * Creates a PFLT_MESSAGE_NOTIFY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32, IntPtr, UInt32, "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, IntPtr, UInt32, "uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
