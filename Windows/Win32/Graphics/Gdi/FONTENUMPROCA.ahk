#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\LOGFONTA.ahk" { LOGFONTA }
#Import ".\TEXTMETRICA.ahk" { TEXTMETRICA }

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @charset ANSI
 */
export default struct FONTENUMPROCA {
    value : IntPtr

    __value {
        set {
            if (value is FONTENUMPROCA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LOGFONTA>} param0 
     * @param {Pointer<TEXTMETRICA>} param1 
     * @param {Integer} param2 
     * @param {LPARAM} param3 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, LOGFONTA.Ptr, param0, TEXTMETRICA.Ptr, param1, UInt32, param2, LPARAM, param3, Int32)
        return result
    }

    /**
     * A FONTENUMPROCA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FONTENUMPROCA {
        /**
         * Creates a FONTENUMPROCA pointer that invokes the given AHK function when called.
         * @param {Func(LOGFONTA, TEXTMETRICA, UInt32, LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LOGFONTA.Ptr, TEXTMETRICA.Ptr, UInt32, LPARAM, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
