#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_BIR.ahk" { WINBIO_BIR }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Retrieves a copy of the most recently processed feature set or template from the engine in a standard biometric information record.
 * @remarks
 * You must allocate the buffer to be returned in the <i>SampleBuffer</i> parameter from the process heap by using the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapalloc">HeapAlloc</a> function. After the buffer is created, it becomes the property of the Windows Biometric Framework. Because the Framework deallocates this memory when finished using it, your implementation of this function  must not attempt to deallocate the buffer or save a pointer to it.  By not saving the pointer, you prevent other parts of the engine adapter from attempting to use the buffer after this function returns.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_export_engine_data_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN) {
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
     * @param {Integer} Flags A value that specifies the properties of the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure returned by the engine. This can be a bitwise <b>OR</b> of the following security and processing level flags:
     * 
     * 
     *  **WINBIO_DATA_FLAG_PRIVACY**
     * 
     * The data is encrypted.
     *             
     *             
     * * **WINBIO_DATA_FLAG_INTEGRITY**
     * The data is digitally signed or protected by a message authentication code (MAC).
     *             
     *             
     * * **WINBIO_DATA_FLAG_SIGNED**
     * If this flag and the <mark>WINBIO_DATA_FLAG_INTEGRITY</mark> flag are set, the data is signed. If this flag is not set but the <mark>WINBIO_DATA_FLAG_INTEGRITY</mark> flag is set, a MAC is computed.
     *             
     *             
     * * **WINBIO_DATA_FLAG_RAW**
     * The data is in the format with which it was captured.
     *             
     *             
     * * **WINBIO_DATA_FLAG_INTERMEDIATE**
     * The data is not raw but has not been completely processed.
     *             
     *             
     * * **WINBIO_DATA_FLAG_PROCESSED**
     * The data has been processed.
     * @param {Pointer<Pointer<WINBIO_BIR>>} SampleBuffer Address of a variable that receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure that contains the feature set or template.
     * @param {Pointer<Pointer>} SampleSize Pointer to a variable that contains the size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure returned in the <i>SampleBuffer</i> parameter.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The engine adapter does not support the combination of flags specified by the  <i>Flags</i> parameter.
     * 
     * </td>
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
     * The pipeline does not contain the type of data required by the <i>Flags</i> parameter.
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
    Call(Pipeline, Flags, SampleBuffer, SampleSize) {
        SampleBufferMarshal := SampleBuffer is VarRef ? "ptr*" : "ptr"
        SampleSizeMarshal := SampleSize is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, Int8, Flags, SampleBufferMarshal, SampleBuffer, SampleSizeMarshal, SampleSize, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN {
        /**
         * Creates a PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, Int8, "ptr*", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, Int8, "ptr*", "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
