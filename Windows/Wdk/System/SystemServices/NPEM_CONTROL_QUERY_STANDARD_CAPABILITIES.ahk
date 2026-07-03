#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NPEM_CAPABILITY_STANDARD.ahk" { NPEM_CAPABILITY_STANDARD }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct NPEM_CONTROL_QUERY_STANDARD_CAPABILITIES {
    value : IntPtr

    __value {
        set {
            if (value is NPEM_CONTROL_QUERY_STANDARD_CAPABILITIES) {
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
     * @param {Pointer<NPEM_CAPABILITY_STANDARD>} StandardCapabilities 
     * @returns {NTSTATUS} 
     */
    Call(_Context, StandardCapabilities) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, NPEM_CAPABILITY_STANDARD.Ptr, StandardCapabilities, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A NPEM_CONTROL_QUERY_STANDARD_CAPABILITIES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NPEM_CONTROL_QUERY_STANDARD_CAPABILITIES {
        /**
         * Creates a NPEM_CONTROL_QUERY_STANDARD_CAPABILITIES pointer that invokes the given AHK function when called.
         * @param {Func("ptr", NPEM_CAPABILITY_STANDARD) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", NPEM_CAPABILITY_STANDARD.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
