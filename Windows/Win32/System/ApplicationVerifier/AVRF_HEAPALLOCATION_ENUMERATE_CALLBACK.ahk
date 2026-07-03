#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AVRF_HEAP_ALLOCATION.ahk" { AVRF_HEAP_ALLOCATION }

/**
 * Receives information related to heap allocations.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/nc-avrfsdk-avrf_heapallocation_enumerate_callback
 * @namespace Windows.Win32.System.ApplicationVerifier
 */
export default struct AVRF_HEAPALLOCATION_ENUMERATE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is AVRF_HEAPALLOCATION_ENUMERATE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<AVRF_HEAP_ALLOCATION>} HeapAllocation A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ns-avrfsdk-avrf_heap_allocation">AVRF_HEAP_ALLOCATION</a> structure containing information about the heap to be enumerated.
     * @param {Pointer<Void>} EnumerationContext A pointer to user-defined information in the context of the enumeration that is passed in when the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/nf-avrfsdk-verifierenumerateresource">VerifierEnumerateResource</a> function is invoked.
     * @param {Pointer<Integer>} EnumerationLevel A pointer to a value that informs the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/nf-avrfsdk-verifierenumerateresource">VerifierEnumerateResource</a> function to either continue or stop the enumeration operation. These values are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ne-avrfsdk-eheapenumerationlevel">eHeapEnumerationLevel</a> enum.
     * @returns {Integer} This function returns error codes or other values defined by the application.
     */
    Call(HeapAllocation, EnumerationContext, EnumerationLevel) {
        EnumerationContextMarshal := EnumerationContext is VarRef ? "ptr" : "ptr"
        EnumerationLevelMarshal := EnumerationLevel is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, AVRF_HEAP_ALLOCATION.Ptr, HeapAllocation, EnumerationContextMarshal, EnumerationContext, EnumerationLevelMarshal, EnumerationLevel, UInt32)
        return result
    }

    /**
     * A AVRF_HEAPALLOCATION_ENUMERATE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends AVRF_HEAPALLOCATION_ENUMERATE_CALLBACK {
        /**
         * Creates a AVRF_HEAPALLOCATION_ENUMERATE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(AVRF_HEAP_ALLOCATION, "ptr", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [AVRF_HEAP_ALLOCATION.Ptr, "ptr", "uint*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
