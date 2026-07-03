#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\DEVMODEA.ahk" { DEVMODEA }

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct LPFNDEVCAPS {
    value : IntPtr

    __value {
        set {
            if (value is LPFNDEVCAPS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} param0 
     * @param {PSTR} param1 
     * @param {Integer} param2 
     * @param {PSTR} param3 
     * @param {Pointer<DEVMODEA>} param4 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1
        param3 := param3 is String ? StrPtr(param3) : param3

        result := DllCall(this.value, "ptr", param0, "ptr", param1, UInt32, param2, "ptr", param3, DEVMODEA.Ptr, param4, UInt32)
        return result
    }

    /**
     * A LPFNDEVCAPS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNDEVCAPS {
        /**
         * Creates a LPFNDEVCAPS pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, PSTR, UInt32, PSTR, DEVMODEA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, PSTR, UInt32, PSTR, DEVMODEA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
