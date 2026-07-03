#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The PIBIO_SENSOR_FINISH_CAPTURE_FN callback (winbio_adapter.h) retrieves a value that indicates whether the sensor indicator is on or off.
 * @remarks
 * The Windows Biometric Framework calls this function after it successfully calls <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_start_capture_fn">SensorAdapterStartCapture</a> or it calls <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_cancel_fn">SensorAdapterCancel</a>. It does not call this function if the call to <i>SensorAdapterStartCapture</i> fails.
 * 
 * When your implementation of this function  returns, the data in the pipeline should be ready for subsequent calls to functions such as <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_push_data_to_engine_fn">SensorAdapterPushDataToEngine</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_export_sensor_data_fn">SensorAdapterExportSensorData</a>.
 * 
 * This is a blocking function that should return only after the sensor I/O operation has succeeded, failed, or been canceled. Typically, you will make this function block by passing the <b>OVERLAPPED</b> structure in the sensor adapter context to the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function. The <b>hEvent</b> handle in the <b>OVERLAPPED</b> structure must be signaled when <i>SensorAdapterFinishCapture</i> returns. The <i>GetOverlappedResult</i> function sets this handle automatically when it detects the end of a sensor I/O operation. If your adapter uses some other mechanism to detect I/O completion, you must signal the event yourself.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_finish_capture_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_FINISH_CAPTURE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_FINISH_CAPTURE_FN) {
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
     * @returns {Integer} Pointer to a <b>WINBIO_REJECT_DETAIL</b> value that receives additional information about the failure to capture a biometric sample. If the operation succeeded, this parameter is set to zero. The following values are defined for fingerprint samples:
     * 
     * <ul>
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
     */
    Call(Pipeline) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, "uint*", &RejectDetail := 0, "HRESULT")
        return RejectDetail
    }

    /**
     * A PIBIO_SENSOR_FINISH_CAPTURE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_FINISH_CAPTURE_FN {
        /**
         * Creates a PIBIO_SENSOR_FINISH_CAPTURE_FN pointer that invokes the given AHK function when called.
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
