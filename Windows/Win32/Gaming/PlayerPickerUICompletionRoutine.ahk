#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\System\WinRT\HSTRING.ahk" { HSTRING }

/**
 * Do not use. This API is only supported for Xbox developers. (PlayerPickerUICompletionRoutine)
 * @see https://learn.microsoft.com/windows/win32/api/gamingtcui/nc-gamingtcui-playerpickeruicompletionroutine
 * @namespace Windows.Win32.Gaming
 */
export default struct PlayerPickerUICompletionRoutine {
    value : IntPtr

    __value {
        set {
            if (value is PlayerPickerUICompletionRoutine) {
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
     * @param {Pointer<HSTRING>} selectedXuids Type: <b>const HSTRING*</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @param {Pointer} selectedXuidsCount Type: <b>size_t</b>
     * 
     * Do not use. This API is only supported for Xbox developers.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(returnCode, _context, selectedXuids, selectedXuidsCount) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, "int", returnCode, _contextMarshal, _context, HSTRING.Ptr, selectedXuids, IntPtr, selectedXuidsCount)
    }

    /**
     * A PlayerPickerUICompletionRoutine that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PlayerPickerUICompletionRoutine {
        /**
         * Creates a PlayerPickerUICompletionRoutine pointer that invokes the given AHK function when called.
         * @param {Func("int", "ptr", HSTRING, IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int", "ptr", HSTRING.Ptr, IntPtr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
