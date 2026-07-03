#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_GET_SYMBOL32 {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_GET_SYMBOL32) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {PSTR} pchBuffer 
     * @param {Pointer<Integer>} pDisplacement 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(offset, pchBuffer, pDisplacement) {
        pchBuffer := pchBuffer is String ? StrPtr(pchBuffer) : pchBuffer

        pDisplacementMarshal := pDisplacement is VarRef ? "uint*" : "ptr"

        DllCall(this.value, UInt32, offset, "ptr", pchBuffer, pDisplacementMarshal, pDisplacement)
    }

    /**
     * A PWINDBG_GET_SYMBOL32 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_GET_SYMBOL32 {
        /**
         * Creates a PWINDBG_GET_SYMBOL32 pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, PSTR, "uint*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, PSTR, "uint*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
