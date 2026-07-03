#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SECPKG_CALL_INFO.ahk" { SECPKG_CALL_INFO }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_GET_CALL_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_GET_CALL_INFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SECPKG_CALL_INFO>} Info 
     * @returns {BOOLEAN} 
     */
    Call(Info) {
        result := DllCall(this.value, SECPKG_CALL_INFO.Ptr, Info, BOOLEAN)
        return result
    }

    /**
     * A PLSA_GET_CALL_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_GET_CALL_INFO {
        /**
         * Creates a PLSA_GET_CALL_INFO pointer that invokes the given AHK function when called.
         * @param {Func(SECPKG_CALL_INFO) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SECPKG_CALL_INFO.Ptr, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
