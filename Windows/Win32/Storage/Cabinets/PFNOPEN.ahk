#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNOPEN {
    value : IntPtr

    __value {
        set {
            if (value is PFNOPEN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} pszFile 
     * @param {Integer} oflag 
     * @param {Integer} pmode 
     * @returns {Pointer} 
     */
    Call(pszFile, oflag, pmode) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := DllCall(this.value, "ptr", pszFile, Int32, oflag, Int32, pmode, IntPtr)
        return result
    }

    /**
     * A PFNOPEN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNOPEN {
        /**
         * Creates a PFNOPEN pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, Int32, Int32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [PSTR, Int32, Int32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
