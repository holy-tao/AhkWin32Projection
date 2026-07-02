#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MSIHANDLE.ahk" { MSIHANDLE }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PINSTALLUI_HANDLER_RECORD {
    value : IntPtr

    __value {
        set {
            if (value is PINSTALLUI_HANDLER_RECORD) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvContext 
     * @param {Integer} iMessageType 
     * @param {MSIHANDLE} hRecord 
     * @returns {Integer} 
     */
    Call(pvContext, iMessageType, hRecord) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvContextMarshal, pvContext, UInt32, iMessageType, MSIHANDLE, hRecord, Int32)
        return result
    }

    /**
     * A PINSTALLUI_HANDLER_RECORD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PINSTALLUI_HANDLER_RECORD {
        /**
         * Creates a PINSTALLUI_HANDLER_RECORD pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, MSIHANDLE) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, MSIHANDLE, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
