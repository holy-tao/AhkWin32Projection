#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Returns results from the asynchronous WinBioVerifyWithCallback function.
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
 * @see https://learn.microsoft.com/windows/win32/api/winbio/nc-winbio-pwinbio_verify_callback
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PWINBIO_VERIFY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PWINBIO_VERIFY_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} VerifyCallbackContext Pointer to a buffer defined by the application and passed to the <i>VerifyCallbackContext</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioverifywithcallback">WinBioVerifyWithCallback</a> function. The buffer is not modified by the framework or the biometric unit. Your application can use the data to help it determine what actions to perform or to maintain additional information about the biometric capture.
     * @param {HRESULT} OperationStatus Error code returned by the capture operation.
     * @param {Integer} UnitId Biometric unit ID number.
     * @param {BOOLEAN} Match A Boolean value that specifies whether the captured sample matched the user identity specified by the <i>Identity</i> parameter.
     * @param {Integer} RejectDetail Additional information about the failure, if any, to perform the operation. For more information,  see Remarks.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(VerifyCallbackContext, OperationStatus, UnitId, Match, RejectDetail) {
        VerifyCallbackContextMarshal := VerifyCallbackContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, VerifyCallbackContextMarshal, VerifyCallbackContext, "int", OperationStatus, UInt32, UnitId, BOOLEAN, Match, UInt32, RejectDetail)
    }

    /**
     * A PWINBIO_VERIFY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINBIO_VERIFY_CALLBACK {
        /**
         * Creates a PWINBIO_VERIFY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "int", UInt32, BOOLEAN, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int", UInt32, BOOLEAN, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
