#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HSE_VERSION_INFO.ahk" { HSE_VERSION_INFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct PFN_GETEXTENSIONVERSION {
    value : IntPtr

    __value {
        set {
            if (value is PFN_GETEXTENSIONVERSION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<HSE_VERSION_INFO>} pVer 
     * @returns {BOOL} 
     */
    Call(pVer) {
        result := DllCall(this.value, HSE_VERSION_INFO.Ptr, pVer, BOOL)
        return result
    }

    /**
     * A PFN_GETEXTENSIONVERSION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_GETEXTENSIONVERSION {
        /**
         * Creates a PFN_GETEXTENSIONVERSION pointer that invokes the given AHK function when called.
         * @param {Func(HSE_VERSION_INFO) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HSE_VERSION_INFO.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
