#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNFCIOPEN {
    value : IntPtr

    __value {
        set {
            if (value is PFNFCIOPEN) {
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
     * @param {Pointer<Integer>} err 
     * @param {Pointer<Void>} pv 
     * @returns {Pointer} 
     */
    Call(pszFile, oflag, pmode, err, pv) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        errMarshal := err is VarRef ? "int*" : "ptr"
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", pszFile, Int32, oflag, Int32, pmode, errMarshal, err, pvMarshal, pv, IntPtr)
        return result
    }

    /**
     * A PFNFCIOPEN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNFCIOPEN {
        /**
         * Creates a PFNFCIOPEN pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, Int32, Int32, "int*", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [PSTR, Int32, Int32, "int*", "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
