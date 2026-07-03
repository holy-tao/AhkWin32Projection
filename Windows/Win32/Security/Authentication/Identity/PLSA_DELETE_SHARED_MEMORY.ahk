#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_DELETE_SHARED_MEMORY {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_DELETE_SHARED_MEMORY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} SharedMem 
     * @returns {BOOLEAN} 
     */
    Call(SharedMem) {
        SharedMemMarshal := SharedMem is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SharedMemMarshal, SharedMem, BOOLEAN)
        return result
    }

    /**
     * A PLSA_DELETE_SHARED_MEMORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_DELETE_SHARED_MEMORY {
        /**
         * Creates a PLSA_DELETE_SHARED_MEMORY pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOLEAN])
        }

        __Delete() => CallbackFree(this.value)
    }
}
