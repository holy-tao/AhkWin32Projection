#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @charset Unicode
 */
export default struct AMGETERRORTEXTPROCW {
    value : IntPtr

    __value {
        set {
            if (value is AMGETERRORTEXTPROCW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESULT} param0 
     * @param {PWSTR} param1 
     * @param {Integer} param2 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2) {
        param1 := param1 is String ? StrPtr(param1) : param1

        result := DllCall(this.value, "int", param0, "ptr", param1, UInt32, param2, BOOL)
        return result
    }

    /**
     * A AMGETERRORTEXTPROCW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends AMGETERRORTEXTPROCW {
        /**
         * Creates a AMGETERRORTEXTPROCW pointer that invokes the given AHK function when called.
         * @param {Func("int", PWSTR, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int", PWSTR, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
