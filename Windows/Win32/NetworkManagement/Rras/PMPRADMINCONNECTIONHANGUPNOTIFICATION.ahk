#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RAS_CONNECTION_0.ahk" { RAS_CONNECTION_0 }
#Import ".\RAS_CONNECTION_1.ahk" { RAS_CONNECTION_1 }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PMPRADMINCONNECTIONHANGUPNOTIFICATION {
    value : IntPtr

    __value {
        set {
            if (value is PMPRADMINCONNECTIONHANGUPNOTIFICATION) {
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
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1) {
        DllCall(this.value, RAS_CONNECTION_0.Ptr, param0, RAS_CONNECTION_1.Ptr, param1)
    }

    /**
     * A PMPRADMINCONNECTIONHANGUPNOTIFICATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMPRADMINCONNECTIONHANGUPNOTIFICATION {
        /**
         * Creates a PMPRADMINCONNECTIONHANGUPNOTIFICATION pointer that invokes the given AHK function when called.
         * @param {Func(RAS_CONNECTION_0, RAS_CONNECTION_1) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RAS_CONNECTION_0.Ptr, RAS_CONNECTION_1.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
