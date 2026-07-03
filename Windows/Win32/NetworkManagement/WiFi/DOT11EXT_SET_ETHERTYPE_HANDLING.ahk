#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOT11_PRIVACY_EXEMPTION.ahk" { DOT11_PRIVACY_EXEMPTION }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_SET_ETHERTYPE_HANDLING {
    value : IntPtr

    __value {
        set {
            if (value is DOT11EXT_SET_ETHERTYPE_HANDLING) {
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
     * @param {Integer} uMaxBackLog 
     * @param {Integer} uNumOfExemption 
     * @param {Pointer<DOT11_PRIVACY_EXEMPTION>} pExemption 
     * @param {Integer} uNumOfRegistration 
     * @param {Pointer<Integer>} pusRegistration 
     * @returns {Integer} 
     */
    Call(hDot11SvcHandle, uMaxBackLog, uNumOfExemption, pExemption, uNumOfRegistration, pusRegistration) {
        pusRegistrationMarshal := pusRegistration is VarRef ? "ushort*" : "ptr"

        result := DllCall(this.value, HANDLE, hDot11SvcHandle, UInt32, uMaxBackLog, UInt32, uNumOfExemption, DOT11_PRIVACY_EXEMPTION.Ptr, pExemption, UInt32, uNumOfRegistration, pusRegistrationMarshal, pusRegistration, UInt32)
        return result
    }

    /**
     * A DOT11EXT_SET_ETHERTYPE_HANDLING that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DOT11EXT_SET_ETHERTYPE_HANDLING {
        /**
         * Creates a DOT11EXT_SET_ETHERTYPE_HANDLING pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, UInt32, DOT11_PRIVACY_EXEMPTION, UInt32, "ushort*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, UInt32, DOT11_PRIVACY_EXEMPTION.Ptr, UInt32, "ushort*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
