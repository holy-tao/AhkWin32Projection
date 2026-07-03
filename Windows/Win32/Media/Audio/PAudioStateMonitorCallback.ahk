#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IAudioStateMonitor.ahk" { IAudioStateMonitor }

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct PAudioStateMonitorCallback {
    value : IntPtr

    __value {
        set {
            if (value is PAudioStateMonitorCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IAudioStateMonitor} audioStateMonitor 
     * @param {Pointer<Void>} _context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(audioStateMonitor, _context) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, "ptr", audioStateMonitor, _contextMarshal, _context)
    }

    /**
     * A PAudioStateMonitorCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PAudioStateMonitorCallback {
        /**
         * Creates a PAudioStateMonitorCallback pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
