#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCESVC_CALLBACK_INFO.ahk" { SCESVC_CALLBACK_INFO }
#Import ".\SCESVC_CONFIGURATION_INFO.ahk" { SCESVC_CONFIGURATION_INFO }

/**
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct PF_UpdateService {
    value : IntPtr

    __value {
        set {
            if (value is PF_UpdateService) {
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
     * @param {Pointer<SCESVC_CONFIGURATION_INFO>} ServiceInfo 
     * @returns {Integer} 
     */
    Call(pSceCbInfo, ServiceInfo) {
        result := DllCall(this.value, SCESVC_CALLBACK_INFO.Ptr, pSceCbInfo, SCESVC_CONFIGURATION_INFO.Ptr, ServiceInfo, UInt32)
        return result
    }

    /**
     * A PF_UpdateService that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_UpdateService {
        /**
         * Creates a PF_UpdateService pointer that invokes the given AHK function when called.
         * @param {Func(SCESVC_CALLBACK_INFO, SCESVC_CONFIGURATION_INFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SCESVC_CALLBACK_INFO.Ptr, SCESVC_CONFIGURATION_INFO.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
