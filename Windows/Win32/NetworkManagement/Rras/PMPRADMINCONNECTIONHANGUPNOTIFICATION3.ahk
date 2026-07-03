#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RAS_CONNECTION_0.ahk" { RAS_CONNECTION_0 }
#Import ".\RAS_CONNECTION_1.ahk" { RAS_CONNECTION_1 }
#Import ".\RAS_CONNECTION_2.ahk" { RAS_CONNECTION_2 }
#Import ".\RAS_CONNECTION_3.ahk" { RAS_CONNECTION_3 }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PMPRADMINCONNECTIONHANGUPNOTIFICATION3 {
    value : IntPtr

    __value {
        set {
            if (value is PMPRADMINCONNECTIONHANGUPNOTIFICATION3) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RAS_CONNECTION_0>} param0 
     * @param {Pointer<RAS_CONNECTION_1>} param1 
     * @param {Pointer<RAS_CONNECTION_2>} param2 
     * @param {Pointer<RAS_CONNECTION_3>} param3 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1, param2, param3) {
        DllCall(this.value, RAS_CONNECTION_0.Ptr, param0, RAS_CONNECTION_1.Ptr, param1, RAS_CONNECTION_2.Ptr, param2, RAS_CONNECTION_3.Ptr, param3)
    }

    /**
     * A PMPRADMINCONNECTIONHANGUPNOTIFICATION3 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMPRADMINCONNECTIONHANGUPNOTIFICATION3 {
        /**
         * Creates a PMPRADMINCONNECTIONHANGUPNOTIFICATION3 pointer that invokes the given AHK function when called.
         * @param {Func(RAS_CONNECTION_0, RAS_CONNECTION_1, RAS_CONNECTION_2, RAS_CONNECTION_3) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RAS_CONNECTION_0.Ptr, RAS_CONNECTION_1.Ptr, RAS_CONNECTION_2.Ptr, RAS_CONNECTION_3.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
