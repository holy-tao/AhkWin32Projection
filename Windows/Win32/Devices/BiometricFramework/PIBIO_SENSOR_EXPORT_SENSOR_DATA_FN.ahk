#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_BIR.ahk" { WINBIO_BIR }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Retrieves the most recently captured biometric sample formatted as a standard WINBIO_BIR structure.
 * @remarks
 * You must allocate the buffer to be returned in the <i>SampleBuffer</i> parameter from the process heap by using the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function. Once created, this  buffer becomes the property of the Windows Biometric Framework. Because the Framework deallocates this memory when finished using it, your implementation of this function  must not attempt to deallocate the buffer or save a pointer to it.  By not saving the pointer, you prevent other parts of the engine adapter from attempting to use the buffer after this function returns.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_export_sensor_data_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN) {
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
     * @param {Pointer<Pointer<WINBIO_BIR>>} SampleBuffer Address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure that contains the sample.
     * @param {Pointer<Pointer>} SampleSize Pointer to a variable that receives the size, in bytes, of the buffer specified by the <i>SampleBuffer</i> parameter.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to create the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A mandatory pointer parameter is <b>NULL</b>.
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
     * The <b>SensorContext</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure pointed to by the <i>Pipeline</i> argument is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_NO_CAPTURE_DATA </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No capture data exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not currently implemented.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, SampleBuffer, SampleSize) {
        SampleBufferMarshal := SampleBuffer is VarRef ? "ptr*" : "ptr"
        SampleSizeMarshal := SampleSize is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, SampleBufferMarshal, SampleBuffer, SampleSizeMarshal, SampleSize, "HRESULT")
        return result
    }

    /**
     * A PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN {
        /**
         * Creates a PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, "ptr*", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, "ptr*", "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
