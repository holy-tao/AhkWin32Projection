#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_MSIX_GET_TABLE_SIZE {
    value : IntPtr

    __value {
        set {
            if (value is PCI_MSIX_GET_TABLE_SIZE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<Integer>} TableSize 
     * @returns {NTSTATUS} 
     */
    Call(_Context, TableSize) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        TableSizeMarshal := TableSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, TableSizeMarshal, TableSize, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PCI_MSIX_GET_TABLE_SIZE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCI_MSIX_GET_TABLE_SIZE {
        /**
         * Creates a PCI_MSIX_GET_TABLE_SIZE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
