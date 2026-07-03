#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\KDEXT_HANDLE_INFORMATION.ahk" { KDEXT_HANDLE_INFORMATION }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct KDEXT_DUMP_HANDLE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is KDEXT_DUMP_HANDLE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<KDEXT_HANDLE_INFORMATION>} HandleInfo 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} _Context 
     * @returns {BOOLEAN} 
     */
    Call(HandleInfo, Flags, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, KDEXT_HANDLE_INFORMATION.Ptr, HandleInfo, UInt32, Flags, _ContextMarshal, _Context, BOOLEAN)
        return result
    }

    /**
     * A KDEXT_DUMP_HANDLE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends KDEXT_DUMP_HANDLE_CALLBACK {
        /**
         * Creates a KDEXT_DUMP_HANDLE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(KDEXT_HANDLE_INFORMATION, UInt32, "ptr") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [KDEXT_HANDLE_INFORMATION.Ptr, UInt32, "ptr", BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
