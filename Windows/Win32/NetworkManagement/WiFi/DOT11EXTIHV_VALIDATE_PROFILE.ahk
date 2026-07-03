#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11EXT_IHV_CONNECTIVITY_PROFILE.ahk" { DOT11EXT_IHV_CONNECTIVITY_PROFILE }
#Import ".\DOT11EXT_IHV_PROFILE_PARAMS.ahk" { DOT11EXT_IHV_PROFILE_PARAMS }
#Import ".\DOT11EXT_IHV_SECURITY_PROFILE.ahk" { DOT11EXT_IHV_SECURITY_PROFILE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXTIHV_VALIDATE_PROFILE {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXTIHV_VALIDATE_PROFILE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hIhvExtAdapter 
     * @param {Pointer<DOT11EXT_IHV_PROFILE_PARAMS>} pIhvProfileParams 
     * @param {Pointer<DOT11EXT_IHV_CONNECTIVITY_PROFILE>} pIhvConnProfile 
     * @param {Pointer<DOT11EXT_IHV_SECURITY_PROFILE>} pIhvSecProfile 
     * @param {Pointer<Integer>} pdwReasonCode 
     * @returns {Integer} 
     */
    Call(hIhvExtAdapter, pIhvProfileParams, pIhvConnProfile, pIhvSecProfile, pdwReasonCode) {
        pdwReasonCodeMarshal := pdwReasonCode is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, hIhvExtAdapter, DOT11EXT_IHV_PROFILE_PARAMS.Ptr, pIhvProfileParams, DOT11EXT_IHV_CONNECTIVITY_PROFILE.Ptr, pIhvConnProfile, DOT11EXT_IHV_SECURITY_PROFILE.Ptr, pIhvSecProfile, pdwReasonCodeMarshal, pdwReasonCode, UInt32)
        return result
    }

    /**
     * A DOT11EXTIHV_VALIDATE_PROFILE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXTIHV_VALIDATE_PROFILE {
        /**
         * Creates a DOT11EXTIHV_VALIDATE_PROFILE pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, DOT11EXT_IHV_PROFILE_PARAMS, DOT11EXT_IHV_CONNECTIVITY_PROFILE, DOT11EXT_IHV_SECURITY_PROFILE, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, DOT11EXT_IHV_PROFILE_PARAMS.Ptr, DOT11EXT_IHV_CONNECTIVITY_PROFILE.Ptr, DOT11EXT_IHV_SECURITY_PROFILE.Ptr, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
