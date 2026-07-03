#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct LPBMCALLBACKFN {
    value : IntPtr

    __value {
        set {
            if (value is LPBMCALLBACKFN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {LPARAM} param2 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, UInt32, param0, UInt32, param1, LPARAM, param2, BOOL)
        return result
    }

    /**
     * A LPBMCALLBACKFN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPBMCALLBACKFN {
        /**
         * Creates a LPBMCALLBACKFN pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, LPARAM, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
