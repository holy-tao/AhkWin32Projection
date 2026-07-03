#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PGPE_DISABLE_EVENT2 {
    value : IntPtr

    __value {
        set {
            if (value is PGPE_DISABLE_EVENT2) {
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
     * @param {Pointer<Void>} _ObjectContext 
     * @returns {NTSTATUS} 
     */
    Call(_Context, _ObjectContext) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        _ObjectContextMarshal := _ObjectContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, _ObjectContextMarshal, _ObjectContext, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PGPE_DISABLE_EVENT2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGPE_DISABLE_EVENT2 {
        /**
         * Creates a PGPE_DISABLE_EVENT2 pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
