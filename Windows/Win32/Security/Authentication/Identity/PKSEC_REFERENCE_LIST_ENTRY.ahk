#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSEC_LIST_ENTRY.ahk" { KSEC_LIST_ENTRY }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PKSEC_REFERENCE_LIST_ENTRY {
    value : IntPtr

    __value {
        set {
            if (value is PKSEC_REFERENCE_LIST_ENTRY) {
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
     * @param {Integer} Signature 
     * @param {BOOLEAN} RemoveNoRef 
     * @returns {NTSTATUS} 
     */
    Call(Entry, Signature, RemoveNoRef) {
        result := DllCall(this.value, KSEC_LIST_ENTRY.Ptr, Entry, UInt32, Signature, BOOLEAN, RemoveNoRef, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PKSEC_REFERENCE_LIST_ENTRY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PKSEC_REFERENCE_LIST_ENTRY {
        /**
         * Creates a PKSEC_REFERENCE_LIST_ENTRY pointer that invokes the given AHK function when called.
         * @param {Func(KSEC_LIST_ENTRY, UInt32, BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [KSEC_LIST_ENTRY.Ptr, UInt32, BOOLEAN, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
