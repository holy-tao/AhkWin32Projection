#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_EVENT.ahk" { WINBIO_EVENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Returns results from the asynchronous WinBioRegisterEventMonitor function.
 * @see https://learn.microsoft.com/windows/win32/api/winbio/nc-winbio-pwinbio_event_callback
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PWINBIO_EVENT_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PWINBIO_EVENT_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} EventCallbackContext Pointer to a buffer defined by the application and passed to the <i>EventCallbackContext</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioregistereventmonitor">WinBioRegisterEventMonitor</a> function. The buffer is not modified by the framework or the biometric unit. Your application can use the data to help it determine what actions to perform or to maintain additional information about the biometric capture.
     * @param {HRESULT} OperationStatus Error code returned by the capture operation.
     * @param {Pointer<WINBIO_EVENT>} Event Pointer to a WINBIO_EVENT value. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-event-constants">WINBIO_EVENT Constants</a>.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(EventCallbackContext, OperationStatus, Event) {
        EventCallbackContextMarshal := EventCallbackContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, EventCallbackContextMarshal, EventCallbackContext, "int", OperationStatus, WINBIO_EVENT.Ptr, Event)
    }

    /**
     * A PWINBIO_EVENT_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINBIO_EVENT_CALLBACK {
        /**
         * Creates a PWINBIO_EVENT_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "int", WINBIO_EVENT) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int", WINBIO_EVENT.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
