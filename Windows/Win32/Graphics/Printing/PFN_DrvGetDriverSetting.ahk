#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_DrvGetDriverSetting {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvGetDriverSetting) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pdriverobj 
     * @param {PSTR} Feature 
     * @param {Integer} pOutput 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pcbNeeded 
     * @param {Pointer<Integer>} pdwOptionsReturned 
     * @returns {BOOL} 
     */
    Call(pdriverobj, Feature, pOutput, cbSize, pcbNeeded, pdwOptionsReturned) {
        Feature := Feature is String ? StrPtr(Feature) : Feature

        pdriverobjMarshal := pdriverobj is VarRef ? "ptr" : "ptr"
        pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
        pdwOptionsReturnedMarshal := pdwOptionsReturned is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, pdriverobjMarshal, pdriverobj, "ptr", Feature, IntPtr, pOutput, UInt32, cbSize, pcbNeededMarshal, pcbNeeded, pdwOptionsReturnedMarshal, pdwOptionsReturned, BOOL)
        return result
    }

    /**
     * A PFN_DrvGetDriverSetting that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvGetDriverSetting {
        /**
         * Creates a PFN_DrvGetDriverSetting pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PSTR, IntPtr, UInt32, "uint*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PSTR, IntPtr, UInt32, "uint*", "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
