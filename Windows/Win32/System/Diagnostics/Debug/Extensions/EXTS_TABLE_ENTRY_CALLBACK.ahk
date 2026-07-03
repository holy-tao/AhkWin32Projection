#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXTS_TABLE_ENTRY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is EXTS_TABLE_ENTRY_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} Entry 
     * @param {Pointer<Void>} _Context 
     * @returns {BOOLEAN} 
     */
    Call(Entry, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Int64, Entry, _ContextMarshal, _Context, BOOLEAN)
        return result
    }

    /**
     * A EXTS_TABLE_ENTRY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXTS_TABLE_ENTRY_CALLBACK {
        /**
         * Creates a EXTS_TABLE_ENTRY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(Int64, "ptr") => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, "ptr", BOOLEAN])
        }

        __Delete() => CallbackFree(this.value)
    }
}
