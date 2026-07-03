#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_RUNTIME_FUNCTION_ENTRY.ahk" { IMAGE_RUNTIME_FUNCTION_ENTRY }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X64
 */
export default struct PGET_RUNTIME_FUNCTION_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PGET_RUNTIME_FUNCTION_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} ControlPc 
     * @param {Pointer<Void>} _Context 
     * @returns {Pointer<IMAGE_RUNTIME_FUNCTION_ENTRY>} 
     */
    Call(ControlPc, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Int64, ControlPc, _ContextMarshal, _Context, IMAGE_RUNTIME_FUNCTION_ENTRY.Ptr)
        return result
    }

    /**
     * A PGET_RUNTIME_FUNCTION_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_RUNTIME_FUNCTION_CALLBACK {
        /**
         * Creates a PGET_RUNTIME_FUNCTION_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(Int64, "ptr") => IMAGE_RUNTIME_FUNCTION_ENTRY.Ptr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, "ptr", IMAGE_RUNTIME_FUNCTION_ENTRY.Ptr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
