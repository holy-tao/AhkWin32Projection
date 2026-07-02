#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Specifies an app-defined callback function that notifies the app when the app is entering or leaving a suspended state.
 * @see https://learn.microsoft.com/windows/win32/api/appnotify/nc-appnotify-pappstate_change_routine
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PAPPSTATE_CHANGE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PAPPSTATE_CHANGE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BOOLEAN} Quiesced Type: <b>BOOLEAN</b>
     * 
     * <b>TRUE</b> if the app is entering the suspended state; <b>FALSE</b> if the app is leaving the suspended state.
     * @param {Pointer<Void>} _Context Type: <b>PVOID</b>
     * 
     * A pointer to data that the app can save when suspending and use upon resuming. This value is supplied by the <a href="https://docs.microsoft.com/windows/desktop/api/appnotify/nf-appnotify-registerappstatechangenotification">RegisterAppStateChangeNotification</a> function. This is commonly a "this" pointer.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Quiesced, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, BOOLEAN, Quiesced, _ContextMarshal, _Context)
    }

    /**
     * A PAPPSTATE_CHANGE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PAPPSTATE_CHANGE_ROUTINE {
        /**
         * Creates a PAPPSTATE_CHANGE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(BOOLEAN, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BOOLEAN, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
