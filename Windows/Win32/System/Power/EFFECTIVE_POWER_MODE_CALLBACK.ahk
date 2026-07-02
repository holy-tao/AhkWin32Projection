#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EFFECTIVE_POWER_MODE.ahk" { EFFECTIVE_POWER_MODE }

/**
 * Function class for effective power mode callback.
 * @remarks
 * Immediately after registration, this callback will be invoked with the current value of the power setting. If the registration occurs while the power setting is changing, you may receive multiple callbacks; the last callback is the most recent update.
 * @see https://learn.microsoft.com/windows/win32/api/powersetting/nf-powersetting-effective_power_mode_callback
 * @namespace Windows.Win32.System.Power
 */
export default struct EFFECTIVE_POWER_MODE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is EFFECTIVE_POWER_MODE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {EFFECTIVE_POWER_MODE} _Mode Indicates the effective power mode the system is running in
     * @param {Pointer<Void>} _Context User-specified opaque context. This context would have been passed in at registration in PowerRegisterForEffectivePowerModeNotifications.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Mode, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, EFFECTIVE_POWER_MODE, _Mode, _ContextMarshal, _Context)
    }

    /**
     * A EFFECTIVE_POWER_MODE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EFFECTIVE_POWER_MODE_CALLBACK {
        /**
         * Creates a EFFECTIVE_POWER_MODE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(EFFECTIVE_POWER_MODE, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [EFFECTIVE_POWER_MODE, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
