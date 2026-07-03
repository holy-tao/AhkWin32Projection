#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\DEVMODEA.ahk" { DEVMODEA }

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct LPFNDEVMODE {
    value : IntPtr

    __value {
        set {
            if (value is LPFNDEVMODE) {
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
     * @param {HMODULE} param1 
     * @param {Pointer<DEVMODEA>} param2 
     * @param {PSTR} param3 
     * @param {PSTR} param4 
     * @param {Pointer<DEVMODEA>} param5 
     * @param {PSTR} param6 
     * @param {Integer} param7 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7) {
        param3 := param3 is String ? StrPtr(param3) : param3
        param4 := param4 is String ? StrPtr(param4) : param4
        param6 := param6 is String ? StrPtr(param6) : param6

        result := DllCall(this.value, HWND, param0, HMODULE, param1, DEVMODEA.Ptr, param2, "ptr", param3, "ptr", param4, DEVMODEA.Ptr, param5, "ptr", param6, UInt32, param7, UInt32)
        return result
    }

    /**
     * A LPFNDEVMODE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNDEVMODE {
        /**
         * Creates a LPFNDEVMODE pointer that invokes the given AHK function when called.
         * @param {Func(HWND, HMODULE, DEVMODEA, PSTR, PSTR, DEVMODEA, PSTR, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, HMODULE, DEVMODEA.Ptr, PSTR, PSTR, DEVMODEA.Ptr, PSTR, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
