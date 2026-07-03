#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSEC_LIST_ENTRY.ahk" { KSEC_LIST_ENTRY }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PKSEC_DEREFERENCE_LIST_ENTRY {
    value : IntPtr

    __value {
        set {
            if (value is PKSEC_DEREFERENCE_LIST_ENTRY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<KSEC_LIST_ENTRY>} Entry 
     * @param {Pointer<Integer>} Delete 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Entry, Delete) {
        DeleteMarshal := Delete is VarRef ? "char*" : "ptr"

        DllCall(this.value, KSEC_LIST_ENTRY.Ptr, Entry, DeleteMarshal, Delete)
    }

    /**
     * A PKSEC_DEREFERENCE_LIST_ENTRY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PKSEC_DEREFERENCE_LIST_ENTRY {
        /**
         * Creates a PKSEC_DEREFERENCE_LIST_ENTRY pointer that invokes the given AHK function when called.
         * @param {Func(KSEC_LIST_ENTRY, "char*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [KSEC_LIST_ENTRY.Ptr, "char*", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
