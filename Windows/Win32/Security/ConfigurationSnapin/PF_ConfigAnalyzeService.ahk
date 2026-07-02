#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCESVC_CALLBACK_INFO.ahk" { SCESVC_CALLBACK_INFO }

/**
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct PF_ConfigAnalyzeService {
    value : IntPtr

    __value {
        set {
            if (value is PF_ConfigAnalyzeService) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SCESVC_CALLBACK_INFO>} pSceCbInfo 
     * @returns {Integer} 
     */
    Call(pSceCbInfo) {
        result := DllCall(this.value, SCESVC_CALLBACK_INFO.Ptr, pSceCbInfo, UInt32)
        return result
    }

    /**
     * A PF_ConfigAnalyzeService that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_ConfigAnalyzeService {
        /**
         * Creates a PF_ConfigAnalyzeService pointer that invokes the given AHK function when called.
         * @param {Func(SCESVC_CALLBACK_INFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SCESVC_CALLBACK_INFO.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
