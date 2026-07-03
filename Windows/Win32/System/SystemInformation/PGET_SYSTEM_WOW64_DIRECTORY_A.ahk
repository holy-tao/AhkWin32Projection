#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.SystemInformation
 * @charset ANSI
 */
export default struct PGET_SYSTEM_WOW64_DIRECTORY_A {
    value : IntPtr

    __value {
        set {
            if (value is PGET_SYSTEM_WOW64_DIRECTORY_A) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} lpBuffer 
     * @param {Integer} uSize 
     * @returns {Integer} 
     */
    Call(lpBuffer, uSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        result := DllCall(this.value, "ptr", lpBuffer, UInt32, uSize, UInt32)
        return result
    }

    /**
     * A PGET_SYSTEM_WOW64_DIRECTORY_A that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_SYSTEM_WOW64_DIRECTORY_A {
        /**
         * Creates a PGET_SYSTEM_WOW64_DIRECTORY_A pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
