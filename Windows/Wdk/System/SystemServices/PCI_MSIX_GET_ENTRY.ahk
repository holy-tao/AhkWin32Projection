#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_MSIX_GET_ENTRY {
    value : IntPtr

    __value {
        set {
            if (value is PCI_MSIX_GET_ENTRY) {
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
     * @param {Integer} TableEntry 
     * @param {Pointer<Integer>} MessageNumber 
     * @param {Pointer<BOOLEAN>} Masked 
     * @returns {NTSTATUS} 
     */
    Call(_Context, TableEntry, MessageNumber, Masked) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"
        MaskedMarshal := Masked is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt32, TableEntry, MessageNumberMarshal, MessageNumber, MaskedMarshal, Masked, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PCI_MSIX_GET_ENTRY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCI_MSIX_GET_ENTRY {
        /**
         * Creates a PCI_MSIX_GET_ENTRY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "uint*", BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "uint*", BOOLEAN.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
