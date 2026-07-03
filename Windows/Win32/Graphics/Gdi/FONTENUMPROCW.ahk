#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\LOGFONTW.ahk" { LOGFONTW }
#Import ".\TEXTMETRICW.ahk" { TEXTMETRICW }

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @charset Unicode
 */
export default struct FONTENUMPROCW {
    value : IntPtr

    __value {
        set {
            if (value is FONTENUMPROCW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LOGFONTW>} param0 
     * @param {Pointer<TEXTMETRICW>} param1 
     * @param {Integer} param2 
     * @param {LPARAM} param3 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, LOGFONTW.Ptr, param0, TEXTMETRICW.Ptr, param1, UInt32, param2, LPARAM, param3, Int32)
        return result
    }

    /**
     * A FONTENUMPROCW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FONTENUMPROCW {
        /**
         * Creates a FONTENUMPROCW pointer that invokes the given AHK function when called.
         * @param {Func(LOGFONTW, TEXTMETRICW, UInt32, LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LOGFONTW.Ptr, TEXTMETRICW.Ptr, UInt32, LPARAM, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
