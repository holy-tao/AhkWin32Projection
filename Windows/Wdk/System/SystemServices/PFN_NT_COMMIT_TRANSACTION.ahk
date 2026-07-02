#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PFN_NT_COMMIT_TRANSACTION {
    value : IntPtr

    __value {
        set {
            if (value is PFN_NT_COMMIT_TRANSACTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} TransactionHandle 
     * @param {BOOLEAN} Wait 
     * @returns {NTSTATUS} 
     */
    Call(TransactionHandle, Wait) {
        result := DllCall(this.value, HANDLE, TransactionHandle, BOOLEAN, Wait, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PFN_NT_COMMIT_TRANSACTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_NT_COMMIT_TRANSACTION {
        /**
         * Creates a PFN_NT_COMMIT_TRANSACTION pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, BOOLEAN, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
