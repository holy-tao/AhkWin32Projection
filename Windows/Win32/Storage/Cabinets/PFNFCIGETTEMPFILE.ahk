#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNFCIGETTEMPFILE {
    value : IntPtr

    __value {
        set {
            if (value is PFNFCIGETTEMPFILE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} pszTempName 
     * @param {Integer} cbTempName 
     * @param {Pointer<Void>} pv 
     * @returns {BOOL} 
     */
    Call(pszTempName, cbTempName, pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, pszTempName, Int32, cbTempName, pvMarshal, pv, BOOL)
        return result
    }

    /**
     * A PFNFCIGETTEMPFILE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNFCIGETTEMPFILE {
        /**
         * Creates a PFNFCIGETTEMPFILE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, Int32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [IntPtr, Int32, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
