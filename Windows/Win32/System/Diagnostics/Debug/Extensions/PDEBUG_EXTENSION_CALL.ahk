#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PDEBUG_EXTENSION_CALL {
    value : IntPtr

    __value {
        set {
            if (value is PDEBUG_EXTENSION_CALL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @param {PSTR} Args 
     * @returns {HRESULT} 
     */
    Call(Client, Args) {
        Args := Args is String ? StrPtr(Args) : Args

        result := DllCall(this.value, "ptr", Client, "ptr", Args, "HRESULT")
        return result
    }

    /**
     * A PDEBUG_EXTENSION_CALL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDEBUG_EXTENSION_CALL {
        /**
         * Creates a PDEBUG_EXTENSION_CALL pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PSTR, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
