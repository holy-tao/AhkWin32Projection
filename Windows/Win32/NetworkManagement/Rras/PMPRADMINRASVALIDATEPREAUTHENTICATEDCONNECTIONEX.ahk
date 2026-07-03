#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AUTH_VALIDATION_EX.ahk" { AUTH_VALIDATION_EX }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PMPRADMINRASVALIDATEPREAUTHENTICATEDCONNECTIONEX {
    value : IntPtr

    __value {
        set {
            if (value is PMPRADMINRASVALIDATEPREAUTHENTICATEDCONNECTIONEX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<AUTH_VALIDATION_EX>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, AUTH_VALIDATION_EX.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PMPRADMINRASVALIDATEPREAUTHENTICATEDCONNECTIONEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMPRADMINRASVALIDATEPREAUTHENTICATEDCONNECTIONEX {
        /**
         * Creates a PMPRADMINRASVALIDATEPREAUTHENTICATEDCONNECTIONEX pointer that invokes the given AHK function when called.
         * @param {Func(AUTH_VALIDATION_EX) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [AUTH_VALIDATION_EX.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
