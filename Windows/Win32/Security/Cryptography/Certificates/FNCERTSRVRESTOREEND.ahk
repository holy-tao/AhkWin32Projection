#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct FNCERTSRVRESTOREEND {
    value : IntPtr

    __value {
        set {
            if (value is FNCERTSRVRESTOREEND) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} hbc 
     * @returns {HRESULT} 
     */
    Call(hbc) {
        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, hbcMarshal, hbc, "HRESULT")
        return result
    }

    /**
     * A FNCERTSRVRESTOREEND that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FNCERTSRVRESTOREEND {
        /**
         * Creates a FNCERTSRVRESTOREEND pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
