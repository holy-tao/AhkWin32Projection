#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_EXTENDED_ENROLLMENT_PARAMETERS.ahk" { WINBIO_EXTENDED_ENROLLMENT_PARAMETERS }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Gives the engine adapter additional information about an enrollment operation.
 * @remarks
 * If the engine adapter successfully completes an <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_create_enrollment_fn">EngineAdapterCreateEnrollment</a> call, it will immediately receive a call to its <b>EngineAdapterSetEnrollmentParameters</b> function.
 * 
 *  This function specifies the subfactor to be used for the new enrollment template.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_enrollment_parameters_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN) {
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
     * @param {Pointer<WINBIO_EXTENDED_ENROLLMENT_PARAMETERS>} Parameters Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-extended-enrollment-parameters">WINBIO_EXTENDED_ENROLLMENT_PARAMETERS</a> structure containing the extended enrollment parameters to use.
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
    Call(Pipeline, Parameters) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, WINBIO_EXTENDED_ENROLLMENT_PARAMETERS.Ptr, Parameters, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN {
        /**
         * Creates a PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, WINBIO_EXTENDED_ENROLLMENT_PARAMETERS) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, WINBIO_EXTENDED_ENROLLMENT_PARAMETERS.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
