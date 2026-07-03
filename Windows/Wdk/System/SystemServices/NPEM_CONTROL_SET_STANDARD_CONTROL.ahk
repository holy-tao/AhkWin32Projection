#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NPEM_CONTROL_STANDARD_CONTROL_BIT.ahk" { NPEM_CONTROL_STANDARD_CONTROL_BIT }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct NPEM_CONTROL_SET_STANDARD_CONTROL {
    value : IntPtr

    __value {
        set {
            if (value is NPEM_CONTROL_SET_STANDARD_CONTROL) {
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
     * @param {NPEM_CONTROL_STANDARD_CONTROL_BIT} StandardControl 
     * @param {BOOLEAN} Set 
     * @returns {NTSTATUS} 
     */
    Call(_Context, StandardControl, Set) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, NPEM_CONTROL_STANDARD_CONTROL_BIT, StandardControl, BOOLEAN, Set, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A NPEM_CONTROL_SET_STANDARD_CONTROL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NPEM_CONTROL_SET_STANDARD_CONTROL {
        /**
         * Creates a NPEM_CONTROL_SET_STANDARD_CONTROL pointer that invokes the given AHK function when called.
         * @param {Func("ptr", NPEM_CONTROL_STANDARD_CONTROL_BIT, BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", NPEM_CONTROL_STANDARD_CONTROL_BIT, BOOLEAN, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
