#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXTENSION_CONTROL_BLOCK.ahk" { EXTENSION_CONTROL_BLOCK }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct PFN_HTTPEXTENSIONPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFN_HTTPEXTENSIONPROC) {
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
     * @returns {Integer} 
     */
    Call(pECB) {
        result := DllCall(this.value, EXTENSION_CONTROL_BLOCK.Ptr, pECB, UInt32)
        return result
    }

    /**
     * A PFN_HTTPEXTENSIONPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_HTTPEXTENSIONPROC {
        /**
         * Creates a PFN_HTTPEXTENSIONPROC pointer that invokes the given AHK function when called.
         * @param {Func(EXTENSION_CONTROL_BLOCK) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [EXTENSION_CONTROL_BLOCK.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
