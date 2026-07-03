#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_CLOSE_SAM_USER {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_CLOSE_SAM_USER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} UserHandle 
     * @returns {NTSTATUS} 
     */
    Call(UserHandle) {
        UserHandleMarshal := UserHandle is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, UserHandleMarshal, UserHandle, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_CLOSE_SAM_USER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_CLOSE_SAM_USER {
        /**
         * Creates a PLSA_CLOSE_SAM_USER pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
