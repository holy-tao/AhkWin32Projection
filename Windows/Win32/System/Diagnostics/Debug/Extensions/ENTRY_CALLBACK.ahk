#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct ENTRY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is ENTRY_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} EntryAddress 
     * @param {Pointer<Void>} _Context 
     * @returns {HRESULT} 
     */
    Call(EntryAddress, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Int64, EntryAddress, _ContextMarshal, _Context, "HRESULT")
        return result
    }

    /**
     * A ENTRY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ENTRY_CALLBACK {
        /**
         * Creates a ENTRY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(Int64, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, "ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
