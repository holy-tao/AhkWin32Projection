#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient4.ahk" { IDebugClient4 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_RELOAD_TRIAGER {
    value : IntPtr

    __value {
        set {
            if (value is EXT_RELOAD_TRIAGER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient4} Client 
     * @returns {HRESULT} 
     */
    Call(Client) {
        result := DllCall(this.value, "ptr", Client, "HRESULT")
        return result
    }

    /**
     * A EXT_RELOAD_TRIAGER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EXT_RELOAD_TRIAGER {
        /**
         * Creates a EXT_RELOAD_TRIAGER pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
