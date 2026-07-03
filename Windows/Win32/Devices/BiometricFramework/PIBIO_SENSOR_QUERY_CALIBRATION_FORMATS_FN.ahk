#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Determines the set of calibration formats supported by the Sensor Adapter.
 * @remarks
 * This method is called once during the initial configuration of a biometric unit.
 * 
 * Each calibration format supported by the Sensor Adapter is identified by a separate UUID value.
 * 
 * This method executes in the context of an arbitrary RPC server thread.
 * 
 * If the Sensor Adapter doesn’t support dynamic calibration, it should return a value of <b>E_NOTIMPL</b>. The Windows Biometric Framework will not treat this as an error unless the Engine Adapter requires dynamic calibration. (For details, see the description of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_select_calibration_format_fn">EngineAdapterSelectCalibrationFormat</a> method.)
 * 
 * If this method returns a value of <b>S_OK</b>, <i>FormatArray</i> and <i>FormatCount</i> must be set. It is an error for this method to return <b>S_OK</b> along with a zero value for <i>FormatCount</i>. Doing so will cause the Windows Biometric Framework to log a <b>WINBIO_E_INVALID_CALIBRATION_FORMAT_ARRAY</b> error message and abort the configuration of the biometric unit.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_query_calibration_formats_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN) {
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
     * @param {Pointer<Guid>} FormatArray Address of an array of empty <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/winbio_ioctl/ns-winbio_ioctl-_winbio_capture_parameters">WINBIO_UUID</a> items. The <b>SensorAdapterQueryCalibrationFormats</b> method is expected to fill this array with one or more UUIDs identifying the calibration data formats known to the Sensor Adapter.
     * @param {Pointer} FormatArraySize A value indicating the number of slots available in <i>FormatArray</i>. The <b>SensorAdapterQueryCalibrationFormats</b> method must not attempt to write more than this number of elements into <i>FormatArray</i>, or the results will be unpredictable.
     * @returns {Pointer} Pointer to a variable that receives the number UUIDs returned in <i>FormatArray</i>. The <b>SensorAdapterQueryCalibrationFormats</b> method must set this value before returning.
     */
    Call(Pipeline, FormatArray, FormatArraySize) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, Guid.Ptr, FormatArray, IntPtr, FormatArraySize, "ptr*", &FormatCount := 0, "HRESULT")
        return FormatCount
    }

    /**
     * A PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN {
        /**
         * Creates a PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, Guid, IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, Guid.Ptr, IntPtr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
