#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Notifies the sensor adapter that a particular calibration data format has been selected by the engine adapter.
 * @remarks
 * The Sensor Adapter should store a copy of this UUID value for later use in interpreting the contents of any calibration buffers sent to its <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_accept_calibration_data_fn">SensorAdapterAcceptCalibrationData</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_set_calibration_format_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN) {
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
     * @param {Pointer<Guid>} Format Address of a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/winbio_ioctl/ns-winbio_ioctl-_winbio_capture_parameters">WINBIO_UUID</a> identifying the calibration data format selected by the Engine Adapter.
     * @returns {HRESULT} The function will return one of the following <b>HRESULT</b> values. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Sensor Adapter doesn’t support dynamic calibration. This is only treated as an error if the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_query_calibration_formats_fn">SensorAdapterQueryCalibrationFormats</a> method has previously indicated that the adapter supports dynamic calibration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_UNSUPPORTED_SENSOR_CALIBRATION_FORMAT </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The UUID specified in the <i>Format</i> parameter is not one of the ones supported by the Sensor Adapter. This error code will cause the Biometric Service to log the error and abort the configuration of the biometric unit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_some_other_error </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Any other error code will cause the Biometric Service to log the error and abort the configuration of the biometric unit.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, Format) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, Guid.Ptr, Format, "HRESULT")
        return result
    }

    /**
     * A PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN {
        /**
         * Creates a PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, Guid.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
