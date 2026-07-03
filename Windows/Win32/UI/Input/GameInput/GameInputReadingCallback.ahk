#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IGameInputReading.ahk" { IGameInputReading }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputReadingCallback {
    value : IntPtr

    __value {
        set {
            if (value is GameInputReadingCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} callbackToken 
     * @param {Pointer<Void>} _context 
     * @param {IGameInputReading} reading 
     * @param {Boolean} hasOverrunOccurred 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(callbackToken, _context, reading, hasOverrunOccurred) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, Int64, callbackToken, _contextMarshal, _context, "ptr", reading, Int32, hasOverrunOccurred)
    }

    /**
     * A GameInputReadingCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GameInputReadingCallback {
        /**
         * Creates a GameInputReadingCallback pointer that invokes the given AHK function when called.
         * @param {Func(Int64, "ptr", "ptr", Int32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, "ptr", "ptr", Int32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
