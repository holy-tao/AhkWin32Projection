#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides access to one of the specialized callback functions for enumeration of either heap allocation or handle trace information.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/nc-avrfsdk-avrf_resource_enumerate_callback
 * @namespace Windows.Win32.System.ApplicationVerifier
 */
export default struct AVRF_RESOURCE_ENUMERATE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is AVRF_RESOURCE_ENUMERATE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} ResourceDescription A pointer to either an <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ns-avrfsdk-avrf_handle_operation">AVRF_HANDLE_OPERATION</a> structure or an <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ns-avrfsdk-avrf_heap_allocation">AVRF_HEAP_ALLOCATION</a> structure. Be sure to  cast this parameter to the correct structure type.
     * @param {Pointer<Void>} EnumerationContext A pointer to be passed to the resource-specific callback function.
     * @param {Pointer<Integer>} EnumerationLevel Specifies whether the enumeration operation should continue. This must be one of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ne-avrfsdk-eheapenumerationlevel">eHeapEnumerationLevel</a> enum.
     * @returns {Integer} This function returns error codes or other values defined by the application.
     */
    Call(ResourceDescription, EnumerationContext, EnumerationLevel) {
        ResourceDescriptionMarshal := ResourceDescription is VarRef ? "ptr" : "ptr"
        EnumerationContextMarshal := EnumerationContext is VarRef ? "ptr" : "ptr"
        EnumerationLevelMarshal := EnumerationLevel is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, ResourceDescriptionMarshal, ResourceDescription, EnumerationContextMarshal, EnumerationContext, EnumerationLevelMarshal, EnumerationLevel, UInt32)
        return result
    }

    /**
     * A AVRF_RESOURCE_ENUMERATE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends AVRF_RESOURCE_ENUMERATE_CALLBACK {
        /**
         * Creates a AVRF_RESOURCE_ENUMERATE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
