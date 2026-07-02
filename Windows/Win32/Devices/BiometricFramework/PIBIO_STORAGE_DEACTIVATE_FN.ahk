#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Gives the Storage Adapter the chance to perform any work needed to put the storage component into an idle state.
 * @remarks
 * This method is called when the last client using this biometric unit has closed its session handle.
 * 
 * This method executes in the context of the same thread that activated the biometric unit and that processed all other requests for the unit.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_storage_deactivate_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_DEACTIVATE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_DEACTIVATE_FN) {
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
    Call(Pipeline) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, "HRESULT")
        return result
    }

    /**
     * A PIBIO_STORAGE_DEACTIVATE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_DEACTIVATE_FN {
        /**
         * Creates a PIBIO_STORAGE_DEACTIVATE_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
