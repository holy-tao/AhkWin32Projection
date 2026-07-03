#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct PFN_DIAL_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DIAL_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {PSTR} param1 
     * @param {Integer} param2 
     * @param {Pointer<Integer>} param3 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param3Marshal := param3 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HWND, param0, "ptr", param1, UInt32, param2, param3Marshal, param3, UInt32)
        return result
    }

    /**
     * A PFN_DIAL_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DIAL_HANDLER {
        /**
         * Creates a PFN_DIAL_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func(HWND, PSTR, UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, PSTR, UInt32, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
