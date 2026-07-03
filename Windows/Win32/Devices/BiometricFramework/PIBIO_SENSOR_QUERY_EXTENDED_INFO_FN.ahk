#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Determines the capabilities and limitations of the biometric sensor component.
 * @remarks
 * This method is called once during configuration of the biometric unit. 
 * 
 * It will also be called if a client application uses the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiogetproperty">WinBioGetProperty</a> function to query the value of the <b>WINBIO_PROPERTY_EXTENDED_SENSOR_INFO</b> property.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_query_extended_info_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN) {
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
     * @param {Integer} SensorInfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-extended-sensor-info">WINBIO_EXTENDED_SENSOR_INFO</a> structure that contains the sensor information returned by this function.
     * @param {Pointer} SensorInfoSize The specified size of the sensor information.
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
     * The <i>Pipeline</i> and <i>SensorInfo</i> parameters cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>SensorInfoSize</i> value is less than the size needed to return the sensor information.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, SensorInfo, SensorInfoSize) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, IntPtr, SensorInfo, IntPtr, SensorInfoSize, "HRESULT")
        return result
    }

    /**
     * A PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN {
        /**
         * Creates a PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, IntPtr, IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, IntPtr, IntPtr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
