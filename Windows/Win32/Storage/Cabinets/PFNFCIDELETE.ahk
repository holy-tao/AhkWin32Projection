#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNFCIDELETE {
    value : IntPtr

    __value {
        set {
            if (value is PFNFCIDELETE) {
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
     * @param {Pointer<Integer>} err 
     * @param {Pointer<Void>} pv 
     * @returns {Integer} 
     */
    Call(pszFile, err, pv) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        errMarshal := err is VarRef ? "int*" : "ptr"
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", pszFile, errMarshal, err, pvMarshal, pv, Int32)
        return result
    }

    /**
     * A PFNFCIDELETE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNFCIDELETE {
        /**
         * Creates a PFNFCIDELETE pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, "int*", "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [PSTR, "int*", "ptr", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
