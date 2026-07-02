#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXTENSION_CONTROL_BLOCK.ahk" { EXTENSION_CONTROL_BLOCK }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct PFN_HSE_IO_COMPLETION {
    value : IntPtr

    __value {
        set {
            if (value is PFN_HSE_IO_COMPLETION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<EXTENSION_CONTROL_BLOCK>} pECB 
     * @param {Pointer<Void>} pContext 
     * @param {Integer} cbIO 
     * @param {Integer} dwError 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pECB, pContext, cbIO, dwError) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, EXTENSION_CONTROL_BLOCK.Ptr, pECB, pContextMarshal, pContext, UInt32, cbIO, UInt32, dwError)
    }

    /**
     * A PFN_HSE_IO_COMPLETION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_HSE_IO_COMPLETION {
        /**
         * Creates a PFN_HSE_IO_COMPLETION pointer that invokes the given AHK function when called.
         * @param {Func(EXTENSION_CONTROL_BLOCK, "ptr", UInt32, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [EXTENSION_CONTROL_BLOCK.Ptr, "ptr", UInt32, UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
