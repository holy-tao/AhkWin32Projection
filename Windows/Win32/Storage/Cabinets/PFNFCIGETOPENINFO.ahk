#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNFCIGETOPENINFO {
    value : IntPtr

    __value {
        set {
            if (value is PFNFCIGETOPENINFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} pszName 
     * @param {Pointer<Integer>} pdate 
     * @param {Pointer<Integer>} ptime 
     * @param {Pointer<Integer>} pattribs 
     * @param {Pointer<Integer>} err 
     * @param {Pointer<Void>} pv 
     * @returns {Pointer} 
     */
    Call(pszName, pdate, ptime, pattribs, err, pv) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pdateMarshal := pdate is VarRef ? "ushort*" : "ptr"
        ptimeMarshal := ptime is VarRef ? "ushort*" : "ptr"
        pattribsMarshal := pattribs is VarRef ? "ushort*" : "ptr"
        errMarshal := err is VarRef ? "int*" : "ptr"
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, "ptr", pszName, pdateMarshal, pdate, ptimeMarshal, ptime, pattribsMarshal, pattribs, errMarshal, err, pvMarshal, pv, IntPtr)
        return result
    }

    /**
     * A PFNFCIGETOPENINFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNFCIGETOPENINFO {
        /**
         * Creates a PFNFCIGETOPENINFO pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, "ushort*", "ushort*", "ushort*", "int*", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [PSTR, "ushort*", "ushort*", "ushort*", "int*", "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
