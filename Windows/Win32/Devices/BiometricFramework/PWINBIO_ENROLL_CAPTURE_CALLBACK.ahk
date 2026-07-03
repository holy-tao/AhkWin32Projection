#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Called by the Windows Biometric Framework to return results from the asynchronous WinBioEnrollCaptureWithCallback function.
 * @remarks
 * Currently, the Windows Biometric Framework supports only fingerprint readers. Therefore, if an operation fails and returns additional information in a <b>WINBIO_REJECT_DETAIL</b> constant, it will be one of the following values:<ul>
 * <li>WINBIO_FP_TOO_HIGH</li>
 * <li>WINBIO_FP_TOO_LOW</li>
 * <li>WINBIO_FP_TOO_LEFT</li>
 * <li>WINBIO_FP_TOO_RIGHT</li>
 * <li>WINBIO_FP_TOO_FAST</li>
 * <li>WINBIO_FP_TOO_SLOW</li>
 * <li>WINBIO_FP_POOR_QUALITY</li>
 * <li>WINBIO_FP_TOO_SKEWED</li>
 * <li>WINBIO_FP_TOO_SHORT</li>
 * <li>WINBIO_FP_MERGE_FAILURE</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/winbio/nc-winbio-pwinbio_enroll_capture_callback
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PWINBIO_ENROLL_CAPTURE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PWINBIO_ENROLL_CAPTURE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} EnrollCallbackContext Pointer to a buffer defined by the application and passed to the <i>EnrollCallback</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioenrollcapturewithcallback">WinBioEnrollCaptureWithCallback</a> function. The buffer is not modified by the framework or the biometric unit. Your application can use the data to help it determine what actions to perform or to maintain additional information about the biometric capture.
     * @param {HRESULT} OperationStatus Error code returned by the capture operation.
     * @param {Integer} RejectDetail Additional information about the failure, if any, to perform the operation. For more information,  see Remarks.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(EnrollCallbackContext, OperationStatus, RejectDetail) {
        EnrollCallbackContextMarshal := EnrollCallbackContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, EnrollCallbackContextMarshal, EnrollCallbackContext, "int", OperationStatus, UInt32, RejectDetail)
    }

    /**
     * A PWINBIO_ENROLL_CAPTURE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINBIO_ENROLL_CAPTURE_CALLBACK {
        /**
         * Creates a PWINBIO_ENROLL_CAPTURE_CALLBACK pointer that invokes the given AHK function when called.
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
