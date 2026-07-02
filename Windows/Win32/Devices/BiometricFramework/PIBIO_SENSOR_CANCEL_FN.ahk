#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Cancels all pending sensor operations.
 * @remarks
 * Your implementation of this function should not wait for pending operations to complete.
 * 
 * If the sensor has no pending operations when this function is called, your implementation must return S_OK without changing the state of the pipeline.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_cancel_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_CANCEL_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_CANCEL_FN) {
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_INVALID_DEVICE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>SensorHandle</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure pointed to by the <i>Pipeline</i> argument is set to <b>INVALID_HANDLE_VALUE</b>.
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
     * A PIBIO_SENSOR_CANCEL_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_CANCEL_FN {
        /**
         * Creates a PIBIO_SENSOR_CANCEL_FN pointer that invokes the given AHK function when called.
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
