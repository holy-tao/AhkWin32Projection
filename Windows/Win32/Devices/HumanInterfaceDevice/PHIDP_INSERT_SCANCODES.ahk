#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct PHIDP_INSERT_SCANCODES {
    value : IntPtr

    __value {
        set {
            if (value is PHIDP_INSERT_SCANCODES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Integer} NewScanCodes 
     * @param {Integer} Length 
     * @returns {BOOLEAN} 
     */
    Call(_Context, NewScanCodes, Length) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, IntPtr, NewScanCodes, UInt32, Length, BOOLEAN)
        return result
    }

    /**
     * A PHIDP_INSERT_SCANCODES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PHIDP_INSERT_SCANCODES {
        /**
         * Creates a PHIDP_INSERT_SCANCODES pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
