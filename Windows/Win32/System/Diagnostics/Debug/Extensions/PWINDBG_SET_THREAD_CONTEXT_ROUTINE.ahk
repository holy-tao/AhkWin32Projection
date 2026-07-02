#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\CONTEXT.ahk" { CONTEXT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_SET_THREAD_CONTEXT_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_SET_THREAD_CONTEXT_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Pointer<CONTEXT>} lpContext 
     * @param {Integer} cbSizeOfContext 
     * @returns {Integer} 
     */
    Call(Processor, lpContext, cbSizeOfContext) {
        result := DllCall(this.value, UInt32, Processor, CONTEXT.Ptr, lpContext, UInt32, cbSizeOfContext, UInt32)
        return result
    }

    /**
     * A PWINDBG_SET_THREAD_CONTEXT_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_SET_THREAD_CONTEXT_ROUTINE {
        /**
         * Creates a PWINDBG_SET_THREAD_CONTEXT_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, CONTEXT, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, CONTEXT.Ptr, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
