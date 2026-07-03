#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct NPEM_CONTROL_ENABLE_DISABLE {
    value : IntPtr

    __value {
        set {
            if (value is NPEM_CONTROL_ENABLE_DISABLE) {
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
     * @param {BOOLEAN} EnableNpem 
     * @returns {NTSTATUS} 
     */
    Call(_Context, EnableNpem) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, BOOLEAN, EnableNpem, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A NPEM_CONTROL_ENABLE_DISABLE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends NPEM_CONTROL_ENABLE_DISABLE {
        /**
         * Creates a NPEM_CONTROL_ENABLE_DISABLE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOLEAN, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
