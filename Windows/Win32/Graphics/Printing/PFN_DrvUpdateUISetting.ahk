#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_DrvUpdateUISetting {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvUpdateUISetting) {
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
     * @param {Pointer<Void>} pOptItem 
     * @param {Integer} dwPreviousSelection 
     * @param {Integer} dwMode 
     * @returns {BOOL} 
     */
    Call(pdriverobj, pOptItem, dwPreviousSelection, dwMode) {
        pdriverobjMarshal := pdriverobj is VarRef ? "ptr" : "ptr"
        pOptItemMarshal := pOptItem is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pdriverobjMarshal, pdriverobj, pOptItemMarshal, pOptItem, UInt32, dwPreviousSelection, UInt32, dwMode, BOOL)
        return result
    }

    /**
     * A PFN_DrvUpdateUISetting that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvUpdateUISetting {
        /**
         * Creates a PFN_DrvUpdateUISetting pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", UInt32, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", UInt32, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
