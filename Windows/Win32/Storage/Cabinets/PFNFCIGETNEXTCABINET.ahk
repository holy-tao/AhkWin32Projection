#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CCAB.ahk" { CCAB }

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct PFNFCIGETNEXTCABINET {
    value : IntPtr

    __value {
        set {
            if (value is PFNFCIGETNEXTCABINET) {
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
     * @param {Integer} cbPrevCab 
     * @param {Pointer<Void>} pv 
     * @returns {BOOL} 
     */
    Call(pccab, cbPrevCab, pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CCAB.Ptr, pccab, UInt32, cbPrevCab, pvMarshal, pv, BOOL)
        return result
    }

    /**
     * A PFNFCIGETNEXTCABINET that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNFCIGETNEXTCABINET {
        /**
         * Creates a PFNFCIGETNEXTCABINET pointer that invokes the given AHK function when called.
         * @param {Func(CCAB, UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [CCAB.Ptr, UInt32, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
