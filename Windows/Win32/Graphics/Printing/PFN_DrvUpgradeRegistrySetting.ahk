#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_DrvUpgradeRegistrySetting {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvUpgradeRegistrySetting) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hPrinter 
     * @param {PSTR} pFeature 
     * @param {PSTR} pOption 
     * @returns {BOOL} 
     */
    Call(hPrinter, pFeature, pOption) {
        pFeature := pFeature is String ? StrPtr(pFeature) : pFeature
        pOption := pOption is String ? StrPtr(pOption) : pOption

        result := DllCall(this.value, HANDLE, hPrinter, "ptr", pFeature, "ptr", pOption, BOOL)
        return result
    }

    /**
     * A PFN_DrvUpgradeRegistrySetting that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvUpgradeRegistrySetting {
        /**
         * Creates a PFN_DrvUpgradeRegistrySetting pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, PSTR, PSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, PSTR, PSTR, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
