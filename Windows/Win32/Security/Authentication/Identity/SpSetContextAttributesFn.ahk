#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpSetContextAttributesFn {
    value : IntPtr

    __value {
        set {
            if (value is SpSetContextAttributesFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ContextHandle 
     * @param {Integer} ContextAttribute 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {NTSTATUS} 
     */
    Call(ContextHandle, ContextAttribute, _Buffer, BufferSize) {
        result := DllCall(this.value, IntPtr, ContextHandle, UInt32, ContextAttribute, IntPtr, _Buffer, UInt32, BufferSize, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpSetContextAttributesFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpSetContextAttributesFn {
        /**
         * Creates a SpSetContextAttributesFn pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, IntPtr, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, IntPtr, UInt32, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
