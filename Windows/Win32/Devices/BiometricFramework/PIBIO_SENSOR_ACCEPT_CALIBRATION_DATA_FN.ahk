#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Passes calibration data from the engine adapter to the sensor adapter.
 * @remarks
 * This method is called during a dynamic calibration loop.
 * 
 * The memory holding the calibration buffer belongs to the Windows Biometric Framework, and the Sensor Adapter must not keep any pointers to this buffer once the <b>SensorAdapterAcceptCalibrationData</b> method returns.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_accept_calibration_data_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN) {
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
     * @param {Integer} CalibrationBuffer Pointer to the buffer that contains the calibration data.
     * @param {Pointer} CalibrationBufferSize The size in bytes of the calibration buffer.
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
     * <dt><b>E_some_error </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Any error code will cause the Biometric Service to discontinue the dynamic calibration loop and abort the capture operation.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, CalibrationBuffer, CalibrationBufferSize) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, IntPtr, CalibrationBuffer, IntPtr, CalibrationBufferSize, "HRESULT")
        return result
    }

    /**
     * A PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN {
        /**
         * Creates a PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, IntPtr, IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, IntPtr, IntPtr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
