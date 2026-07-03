#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The PIBIO_SENSOR_GET_INDICATOR_STATUS_FN callback function (winbio_adapter.h) retrieves a value that indicates whether the sensor indicator is on or off.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_get_indicator_status_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_GET_INDICATOR_STATUS_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_GET_INDICATOR_STATUS_FN) {
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
     * @returns {Integer} Pointer to a <b>WINBIO_INDICATOR_STATUS</b> value. This can be one of the following:
     * 
     * <ul>
     * <li>WINBIO_INDICATOR_ON</li>
     * <li>WINBIO_INDICATOR_OFF</li>
     * </ul>
     */
    Call(Pipeline) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, "uint*", &IndicatorStatus := 0, "HRESULT")
        return IndicatorStatus
    }

    /**
     * A PIBIO_SENSOR_GET_INDICATOR_STATUS_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_GET_INDICATOR_STATUS_FN {
        /**
         * Creates a PIBIO_SENSOR_GET_INDICATOR_STATUS_FN pointer that invokes the given AHK function when called.
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
