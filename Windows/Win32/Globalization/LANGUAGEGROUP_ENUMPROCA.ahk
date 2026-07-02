#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\PSTR.ahk" { PSTR }
#Import "..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Globalization
 * @charset ANSI
 */
export default struct LANGUAGEGROUP_ENUMPROCA {
    value : IntPtr

    __value {
        set {
            if (value is LANGUAGEGROUP_ENUMPROCA) {
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
     * @param {PSTR} param1 
     * @param {PSTR} param2 
     * @param {Integer} param3 
     * @param {Pointer} param4 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4) {
        param1 := param1 is String ? StrPtr(param1) : param1
        param2 := param2 is String ? StrPtr(param2) : param2

        result := DllCall(this.value, UInt32, param0, "ptr", param1, "ptr", param2, UInt32, param3, IntPtr, param4, BOOL)
        return result
    }

    /**
     * A LANGUAGEGROUP_ENUMPROCA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LANGUAGEGROUP_ENUMPROCA {
        /**
         * Creates a LANGUAGEGROUP_ENUMPROCA pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PSTR, PSTR, UInt32, IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PSTR, PSTR, UInt32, IntPtr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
