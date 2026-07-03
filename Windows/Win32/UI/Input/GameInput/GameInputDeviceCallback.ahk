#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputDeviceStatus.ahk" { GameInputDeviceStatus }
#Import ".\IGameInputDevice.ahk" { IGameInputDevice }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputDeviceCallback {
    value : IntPtr

    __value {
        set {
            if (value is GameInputDeviceCallback) {
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
     * @param {IGameInputDevice} device 
     * @param {Integer} _timestamp 
     * @param {GameInputDeviceStatus} currentStatus 
     * @param {GameInputDeviceStatus} previousStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(callbackToken, _context, device, _timestamp, currentStatus, previousStatus) {
        _contextMarshal := _context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, Int64, callbackToken, _contextMarshal, _context, "ptr", device, Int64, _timestamp, GameInputDeviceStatus, currentStatus, GameInputDeviceStatus, previousStatus)
    }

    /**
     * A GameInputDeviceCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GameInputDeviceCallback {
        /**
         * Creates a GameInputDeviceCallback pointer that invokes the given AHK function when called.
         * @param {Func(Int64, "ptr", "ptr", Int64, GameInputDeviceStatus, GameInputDeviceStatus) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, "ptr", "ptr", Int64, GameInputDeviceStatus, GameInputDeviceStatus, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
