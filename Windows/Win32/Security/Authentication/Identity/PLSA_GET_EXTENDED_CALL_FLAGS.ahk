#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_GET_EXTENDED_CALL_FLAGS {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_GET_EXTENDED_CALL_FLAGS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} Flags 
     * @returns {NTSTATUS} 
     */
    Call(Flags) {
        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, FlagsMarshal, Flags, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_GET_EXTENDED_CALL_FLAGS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_GET_EXTENDED_CALL_FLAGS {
        /**
         * Creates a PLSA_GET_EXTENDED_CALL_FLAGS pointer that invokes the given AHK function when called.
         * @param {Func("uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
