#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Prepares the processing pipeline of the biometric unit for a new operation.E
 * @remarks
 * This purpose of this function is to reset the context to the state it was in immediately after a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_attach_fn">EngineAdapterAttach</a> function. The context is a reusable structure. The <b>EngineAdapterClearContext</b> function reinitializes the context but does not remove it from the pipeline.
 * 
 * Typical examples of the objects in the engine adapter context area that should be cleared include the following.
 * <table>
 * <tr>
 * <th>Object</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>Feature set</td>
 * <td>Contains a description of a biometric sample</td>
 * </tr>
 * <tr>
 * <td>Enrollment</td>
 * <td>Tracks the current state of an enrollment transaction.</td>
 * </tr>
 * <tr>
 * <td>Template</td>
 * <td>Biometric template created by the feature set or the enrollment object.</td>
 * </tr>
 * <tr>
 * <td>Comparison</td>
 * <td>Contains the result of a comparison between the template and the feature set.</td>
 * </tr>
 * <tr>
 * <td>Index vector</td>
 * <td>Contains a set of index values associated with the template.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_clear_context_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_CLEAR_CONTEXT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_CLEAR_CONTEXT_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure associated with the biometric unit performing the operation.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it must return one of the following <b>HRESULT</b> values to indicate the error.
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
     * The <i>Pipeline</i> argument cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_CLEAR_CONTEXT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_CLEAR_CONTEXT_FN {
        /**
         * Creates a PIBIO_ENGINE_CLEAR_CONTEXT_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
