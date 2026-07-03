#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct PDETECT_PROGRESS_NOTIFY {
    value : IntPtr

    __value {
        set {
            if (value is PDETECT_PROGRESS_NOTIFY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} ProgressNotifyParam 
     * @param {Integer} DetectComplete 
     * @returns {BOOL} 
     */
    Call(ProgressNotifyParam, DetectComplete) {
        ProgressNotifyParamMarshal := ProgressNotifyParam is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, ProgressNotifyParamMarshal, ProgressNotifyParam, UInt32, DetectComplete, BOOL)
        return result
    }

    /**
     * A PDETECT_PROGRESS_NOTIFY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDETECT_PROGRESS_NOTIFY {
        /**
         * Creates a PDETECT_PROGRESS_NOTIFY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
