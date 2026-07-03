#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11EXT_IHV_CONNECTIVITY_PROFILE.ahk" { DOT11EXT_IHV_CONNECTIVITY_PROFILE }
#Import ".\DOT11EXT_IHV_SECURITY_PROFILE.ahk" { DOT11EXT_IHV_SECURITY_PROFILE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_SET_CURRENT_PROFILE {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_SET_CURRENT_PROFILE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hDot11SvcHandle 
     * @param {HANDLE} hConnectSession 
     * @param {Pointer<DOT11EXT_IHV_CONNECTIVITY_PROFILE>} pIhvConnProfile 
     * @param {Pointer<DOT11EXT_IHV_SECURITY_PROFILE>} pIhvSecProfile 
     * @returns {Integer} 
     */
    Call(hDot11SvcHandle, hConnectSession, pIhvConnProfile, pIhvSecProfile) {
        result := DllCall(this.value, HANDLE, hDot11SvcHandle, HANDLE, hConnectSession, DOT11EXT_IHV_CONNECTIVITY_PROFILE.Ptr, pIhvConnProfile, DOT11EXT_IHV_SECURITY_PROFILE.Ptr, pIhvSecProfile, UInt32)
        return result
    }

    /**
     * A DOT11EXT_SET_CURRENT_PROFILE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_SET_CURRENT_PROFILE {
        /**
         * Creates a DOT11EXT_SET_CURRENT_PROFILE pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, HANDLE, DOT11EXT_IHV_CONNECTIVITY_PROFILE, DOT11EXT_IHV_SECURITY_PROFILE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, HANDLE, DOT11EXT_IHV_CONNECTIVITY_PROFILE.Ptr, DOT11EXT_IHV_SECURITY_PROFILE.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
