#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PENUMERATE_SYSTEM_LOCKS {
    value : IntPtr

    __value {
        set {
            if (value is PENUMERATE_SYSTEM_LOCKS) {
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
     * @param {Integer} Flags 
     * @param {Pointer<KDEXTS_LOCK_CALLBACKROUTINE>} Callback 
     * @param {Pointer<Void>} _Context 
     * @returns {HRESULT} 
     */
    Call(Client, Flags, Callback, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", Client, UInt32, Flags, "ptr", Callback, _ContextMarshal, _Context, "HRESULT")
        return result
    }

    /**
     * A PENUMERATE_SYSTEM_LOCKS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PENUMERATE_SYSTEM_LOCKS {
        /**
         * Creates a PENUMERATE_SYSTEM_LOCKS pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "ptr", "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "ptr", "ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
