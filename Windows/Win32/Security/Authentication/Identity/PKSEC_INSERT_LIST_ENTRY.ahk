#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSEC_LIST_ENTRY.ahk" { KSEC_LIST_ENTRY }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PKSEC_INSERT_LIST_ENTRY {
    value : IntPtr

    __value {
        set {
            if (value is PKSEC_INSERT_LIST_ENTRY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} List 
     * @param {Pointer<KSEC_LIST_ENTRY>} Entry 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(List, Entry) {
        ListMarshal := List is VarRef ? "ptr" : "ptr"

        DllCall(this.value, ListMarshal, List, KSEC_LIST_ENTRY.Ptr, Entry)
    }

    /**
     * A PKSEC_INSERT_LIST_ENTRY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PKSEC_INSERT_LIST_ENTRY {
        /**
         * Creates a PKSEC_INSERT_LIST_ENTRY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", KSEC_LIST_ENTRY) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", KSEC_LIST_ENTRY.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
