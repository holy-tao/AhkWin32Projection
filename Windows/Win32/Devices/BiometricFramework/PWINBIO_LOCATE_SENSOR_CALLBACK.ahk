#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Returns results from the asynchronous WinBioLocateSensorWithCallback function.
 * @see https://learn.microsoft.com/windows/win32/api/winbio/nc-winbio-pwinbio_locate_sensor_callback
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PWINBIO_LOCATE_SENSOR_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PWINBIO_LOCATE_SENSOR_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} LocateCallbackContext Pointer to a buffer defined by the application and passed to the <i>LocateCallbackContext</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiolocatesensorwithcallback">WinBioLocateSensorWithCallback</a> function. The buffer is not modified by the framework or the biometric unit. Your application can use the data to help it determine what actions to perform or to maintain additional information about the biometric capture.
     * @param {HRESULT} OperationStatus Error code returned by the capture operation.
     * @param {Integer} UnitId Biometric unit ID number.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(LocateCallbackContext, OperationStatus, UnitId) {
        LocateCallbackContextMarshal := LocateCallbackContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, LocateCallbackContextMarshal, LocateCallbackContext, "int", OperationStatus, UInt32, UnitId)
    }

    /**
     * A PWINBIO_LOCATE_SENSOR_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINBIO_LOCATE_SENSOR_CALLBACK {
        /**
         * Creates a PWINBIO_LOCATE_SENSOR_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "int", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int", UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
