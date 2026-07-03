#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Called by the Windows Biometric Framework to determine which of the Sensor Adapter’s calibration formats the Engine Adapter wants to use.
 * @remarks
 * This method is called once during configuration of the biometric unit. After a calibration format has been selected, it cannot be changed.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_select_calibration_format_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN) {
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
     * @param {Pointer<Guid>} FormatArray Address of an array of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/winbio_ioctl/ns-winbio_ioctl-_winbio_capture_parameters">WINBIO_UUID</a> items identifying the calibration data formats supported by the Sensor Adapter. The Engine Adapter is expected to choose one of these formats for its calibration data.
     * @param {Pointer} FormatCount Value indicating the number of UUIDs in the <i>FormatArray</i> parameter.
     * @param {Pointer<Guid>} SelectedFormat Address of a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/winbio_ioctl/ns-winbio_ioctl-_winbio_capture_parameters">WINBIO_UUID</a> item where the <b>EngineAdapterSelectCalibrationFormat</b> method will store the UUID of the selected calibration format. This must be one of the UUIDs in the <i>FormatArray</i> parameter.
     * @returns {Pointer} Address of a variable where the <b>EngineAdapterSelectCalibrationFormat</b> method will store the maximum size (in bytes) of any calibration data it plans to return to the Sensor Adapter. The maximum size of this buffer must be 4096 bytes or less.
     */
    Call(Pipeline, FormatArray, FormatCount, SelectedFormat) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, Guid.Ptr, FormatArray, IntPtr, FormatCount, Guid.Ptr, SelectedFormat, "ptr*", &MaxBufferSize := 0, "HRESULT")
        return MaxBufferSize
    }

    /**
     * A PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN {
        /**
         * Creates a PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, Guid, IntPtr, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, Guid.Ptr, IntPtr, Guid.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
