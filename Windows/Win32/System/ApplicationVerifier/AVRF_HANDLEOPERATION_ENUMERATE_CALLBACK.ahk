#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AVRF_HANDLE_OPERATION.ahk" { AVRF_HANDLE_OPERATION }

/**
 * Receives information related to the enumeration of handle traces.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/nc-avrfsdk-avrf_handleoperation_enumerate_callback
 * @namespace Windows.Win32.System.ApplicationVerifier
 */
export default struct AVRF_HANDLEOPERATION_ENUMERATE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is AVRF_HANDLEOPERATION_ENUMERATE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<AVRF_HANDLE_OPERATION>} HandleOperation A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ns-avrfsdk-avrf_handle_operation">AVRF_HANDLE_OPERATION</a> structure containing information related to the enumeration of handle traces.
     * @param {Pointer<Void>} EnumerationContext A pointer to a user-defined information related to the context of the enumeration that is passed in when the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/nf-avrfsdk-verifierenumerateresource">VerifierEnumerateResource</a> function is invoked.
     * @param {Pointer<Integer>} EnumerationLevel A pointer to a value that informs the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/nf-avrfsdk-verifierenumerateresource">VerifierEnumerateResource</a> function to either continue or stop the enumeration operation. These values are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ne-avrfsdk-eheapenumerationlevel">eHeapEnumerationLevel</a> enum.
     * @returns {Integer} This function returns error codes or other values defined by the application.
     */
    Call(HandleOperation, EnumerationContext, EnumerationLevel) {
        EnumerationContextMarshal := EnumerationContext is VarRef ? "ptr" : "ptr"
        EnumerationLevelMarshal := EnumerationLevel is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, AVRF_HANDLE_OPERATION.Ptr, HandleOperation, EnumerationContextMarshal, EnumerationContext, EnumerationLevelMarshal, EnumerationLevel, UInt32)
        return result
    }

    /**
     * A AVRF_HANDLEOPERATION_ENUMERATE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends AVRF_HANDLEOPERATION_ENUMERATE_CALLBACK {
        /**
         * Creates a AVRF_HANDLEOPERATION_ENUMERATE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(AVRF_HANDLE_OPERATION, "ptr", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [AVRF_HANDLE_OPERATION.Ptr, "ptr", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
