#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CCAB.ahk" { CCAB }

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNFCIFILEPLACED {
    value : IntPtr

    __value {
        set {
            if (value is PFNFCIFILEPLACED) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CCAB>} pccab 
     * @param {PSTR} pszFile 
     * @param {Integer} cbFile 
     * @param {BOOL} fContinuation 
     * @param {Pointer<Void>} pv 
     * @returns {Integer} 
     */
    Call(pccab, pszFile, cbFile, fContinuation, pv) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CCAB.Ptr, pccab, "ptr", pszFile, Int32, cbFile, BOOL, fContinuation, pvMarshal, pv, Int32)
        return result
    }

    /**
     * A PFNFCIFILEPLACED that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNFCIFILEPLACED {
        /**
         * Creates a PFNFCIFILEPLACED pointer that invokes the given AHK function when called.
         * @param {Func(CCAB, PSTR, Int32, BOOL, "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [CCAB.Ptr, PSTR, Int32, BOOL, "ptr", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
