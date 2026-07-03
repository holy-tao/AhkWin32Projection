#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Gets a set of post-capture calibration data from the engine adapter.
 * @remarks
 * The <b>EngineAdapterQueryCalibrationData</b> method can independently control the biometric service’s repeat-capture behavior and the calibration behavior by setting <i>DiscardAndRepeatCapture</i> and <i>CalibrationBufferSize</i>, respectively.
 * 
 * <table>
 * <tr>
 * <th>Desired Behavior</th>
 * <th><i>DiscardAndRepeatCapture</i></th>
 * <th><i>CalibrationBufferSize</i></th>
 * </tr>
 * <tr>
 * <td>Repeat capture after calibration.</td>
 * <td><b>TRUE</b></td>
 * <td>Non-zero</td>
 * </tr>
 * <tr>
 * <td>Repeat capture without calibration.</td>
 * <td><b>TRUE</b></td>
 * <td>Zero</td>
 * </tr>
 * <tr>
 * <td>Continue processing the sample after calibration.</td>
 * <td><b>FALSE</b></td>
 * <td>Non-zero</td>
 * </tr>
 * <tr>
 * <td>Continue processing the sample without calibration.</td>
 * <td><b>FALSE</b></td>
 * <td>Zero</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_calibration_data_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN) {
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
     * @param {Pointer<BOOLEAN>} DiscardAndRepeatCapture Address of a Boolean value that must be set by the <b>EngineAdapterQueryCalibrationData</b> method. This value indicates what the biometric service should do with the current sample after calibration is complete.
     * 
     * <ul>
     * <li>
     * <b>TRUE</b> indicates that the captured biometric sample is unusable. The biometric service will discard the sample and collect a new one.
     * 
     * </li>
     * <li>
     * <b>FALSE</b> indicates that the sample is usable and the Engine should be instructed to perform further operations on it.
     * 
     * </li>
     * </ul>
     * @param {Integer} CalibrationBuffer Address of an empty buffer where the method is expected to write its calibration data. The memory holding this buffer belongs to the biometric service, and the Engine Adapter must not keep any pointers to this buffer once the <b>EngineAdapterQueryCalibrationData</b> method returns.
     * @param {Pointer<Pointer>} CalibrationBufferSize Address of a variable where the <b>EngineAdapterQueryCalibrationData</b> method will store the size (in bytes) of the calibration data it has written to <i>CalibrationBuffer</i>. This value must not exceed <i>MaxBufferSize</i>. 
     * 
     * If <b>EngineAdapterQueryCalibrationData</b> sets this value to zero, the contents of the <i>CalibrationBuffer</i> will be discarded without sending them to the Sensor Adapter. This is not an error condition; it simply indicates that the Engine Adapter doesn’t need to update the sensor’s calibration based on the current capture data.
     * @param {Pointer} MaxBufferSize A value indicating the maximum space (in bytes) available to the Engine Adapter in the <i>CalibrationBuffer</i>.
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
    Call(Pipeline, DiscardAndRepeatCapture, CalibrationBuffer, CalibrationBufferSize, MaxBufferSize) {
        DiscardAndRepeatCaptureMarshal := DiscardAndRepeatCapture is VarRef ? "char*" : "ptr"
        CalibrationBufferSizeMarshal := CalibrationBufferSize is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, DiscardAndRepeatCaptureMarshal, DiscardAndRepeatCapture, IntPtr, CalibrationBuffer, CalibrationBufferSizeMarshal, CalibrationBufferSize, IntPtr, MaxBufferSize, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN {
        /**
         * Creates a PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, BOOLEAN, IntPtr, "ptr*", IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, BOOLEAN.Ptr, IntPtr, "ptr*", IntPtr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
