#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvQuerySpoolType {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvQuerySpoolType) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {DHPDEV} _dhpdev 
     * @param {PWSTR} pwchType 
     * @returns {BOOL} 
     */
    Call(_dhpdev, pwchType) {
        pwchType := pwchType is String ? StrPtr(pwchType) : pwchType

        result := DllCall(this.value, DHPDEV, _dhpdev, "ptr", pwchType, BOOL)
        return result
    }

    /**
     * A PFN_DrvQuerySpoolType that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvQuerySpoolType {
        /**
         * Creates a PFN_DrvQuerySpoolType pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, PWSTR) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, PWSTR, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
