#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpGetTbalSupplementalCredsFn {
    value : IntPtr

    __value {
        set {
            if (value is SpGetTbalSupplementalCredsFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {LUID} LogonId 
     * @param {Pointer<Integer>} SupplementalCredsSize 
     * @param {Pointer<Pointer<Void>>} SupplementalCreds 
     * @returns {NTSTATUS} 
     */
    Call(LogonId, SupplementalCredsSize, SupplementalCreds) {
        SupplementalCredsSizeMarshal := SupplementalCredsSize is VarRef ? "uint*" : "ptr"
        SupplementalCredsMarshal := SupplementalCreds is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, LUID, LogonId, SupplementalCredsSizeMarshal, SupplementalCredsSize, SupplementalCredsMarshal, SupplementalCreds, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpGetTbalSupplementalCredsFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpGetTbalSupplementalCredsFn {
        /**
         * Creates a SpGetTbalSupplementalCredsFn pointer that invokes the given AHK function when called.
         * @param {Func(LUID, "uint*", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LUID, "uint*", "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
