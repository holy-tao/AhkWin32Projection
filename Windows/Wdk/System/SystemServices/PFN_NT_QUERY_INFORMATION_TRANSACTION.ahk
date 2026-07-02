#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\System\SystemServices\TRANSACTION_INFORMATION_CLASS.ahk" { TRANSACTION_INFORMATION_CLASS }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PFN_NT_QUERY_INFORMATION_TRANSACTION {
    value : IntPtr

    __value {
        set {
            if (value is PFN_NT_QUERY_INFORMATION_TRANSACTION) {
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
     * @param {TRANSACTION_INFORMATION_CLASS} TransactionInformationClass 
     * @param {Integer} TransactionInformation 
     * @param {Integer} TransactionInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    Call(TransactionHandle, TransactionInformationClass, TransactionInformation, TransactionInformationLength, ReturnLength) {
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, TransactionHandle, TRANSACTION_INFORMATION_CLASS, TransactionInformationClass, IntPtr, TransactionInformation, UInt32, TransactionInformationLength, ReturnLengthMarshal, ReturnLength, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PFN_NT_QUERY_INFORMATION_TRANSACTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_NT_QUERY_INFORMATION_TRANSACTION {
        /**
         * Creates a PFN_NT_QUERY_INFORMATION_TRANSACTION pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, TRANSACTION_INFORMATION_CLASS, IntPtr, UInt32, "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, TRANSACTION_INFORMATION_CLASS, IntPtr, UInt32, "uint*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
