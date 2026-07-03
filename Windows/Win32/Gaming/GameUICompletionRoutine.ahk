#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Do not use. This API is only supported for Xbox developers. (GameUICompletionRoutine)
 * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nc-gamingtcui-gameuicompletionroutine
 * @namespace Windows.Win32.Gaming
 */
export default struct GameUICompletionRoutine {
    value : IntPtr

    __value {
        set {
            if (value is GameUICompletionRoutine) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESULT} returnCode Type: <b>HRESULT</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer<Void>} _context Type: <b>VOID*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(returnCode, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, "int", returnCode, _contextMarshal, _context)
    }

    /**
     * A GameUICompletionRoutine that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GameUICompletionRoutine {
        /**
         * Creates a GameUICompletionRoutine pointer that invokes the given AHK function when called.
         * @param {Func("int", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int", "ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
