#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Tells the Engine Adapter which person to track for the current enrollment operation.
 * @remarks
 * For some biometric factors (such as WINBIO_TYPE_FACIAL_FEATURES), there can be multiple people in camera frame at the same time. During an enrollment operation, it’s necessary for the enrollment application to select one specific person to enroll. The enrollment application does this by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioenrollselect">WinBioEnrollSelect</a> function. The Windows Biometric Framework then calls the engine adapter’s <b>EngineAdapterSetEnrollmentSelector</b> function with this information.
 * 
 * The engine adapter should store this value and use it to track the proper person during the course of the enrollment.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_enrollment_selector_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure associated with the biometric unit performing the operation.
     * @param {Integer} SelectorValue The enrollment selector value to use.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it must return one of the following <b>HRESULT</b> values to indicate the error.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Pipeline</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, SelectorValue) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, Int64, SelectorValue, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN {
        /**
         * Creates a PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, Int64) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, Int64, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
