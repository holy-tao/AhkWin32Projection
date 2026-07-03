#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the prototype for the callback function used by dynamic structure array (DSA) and dynamic pointer array (DPA) functions.
 * @remarks
 * Alternate names for this callback are <b>PFNDPAENUMCALLBACK</b> and <b>PFNDSAENUMCALLBACK</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nc-dpa_dsa-pfndaenumcallback
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PFNDAENUMCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFNDAENUMCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} p Type: <b>void*</b>
     * 
     *  A pointer to the structure to be enumerated.
     * @param {Pointer<Void>} pData Type: <b>void*</b>
     * 
     * The value that was passed in the <i>pData</i> parameter to function <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nf-dpa_dsa-dsa_enumcallback">DSA_EnumCallback</a>.
     * @returns {Integer} Type: <b>int</b>
     * 
     * The return value is used to determine whether to terminate or continue the iteration. A return value of zero indicates that the iteration should stop; nonzero indicates that the iteration should continue.
     */
    Call(p, pData) {
        pMarshal := p is VarRef ? "ptr" : "ptr"
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pMarshal, p, pDataMarshal, pData, Int32)
        return result
    }

    /**
     * A PFNDAENUMCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNDAENUMCALLBACK {
        /**
         * Creates a PFNDAENUMCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
