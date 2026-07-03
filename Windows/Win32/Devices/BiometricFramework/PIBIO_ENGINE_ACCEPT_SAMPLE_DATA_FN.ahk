#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Accepts a raw biometric sample and extracts a feature set.
 * @remarks
 * The feature set created by calling this function is retained in the biometric unit pipeline after the function returns. It replaces any previous feature set.
 * 
 * The sensor adapter implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_push_data_to_engine_fn">SensorAdapterPushDataToEngine</a> function should use the following wrapper function (defined in Winbio_adapter.h) to call <i>EngineAdapterAcceptSampleData</i>:
 * 
 * 
 * ```cpp
 * HRESULT WbioEngineAcceptSampleData(
 * __inout PWINBIO_PIPELINE Pipeline,
 * __in PWINBIO_BIR SampleBuffer,
 * __in SIZE_T SampleSize,
 * __in WINBIO_BIR_PURPOSE Purpose,
 * __out PWINBIO_REJECT_DETAIL RejectDetail
 * );
 * ```
 * 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure that is passed in  the <i>SampleBuffer</i> parameter  is the property of the sensor adapter. Because the sensor adapter controls the lifetime of the <b>WINBIO_BIR</b> object, the <i>EngineAdapterAcceptSampleData</i> function must not attempt to deallocate the structure or save a pointer to it.  By not saving the pointer, you prevent other parts of the engine adapter from attempting to use the <b>WINBIO_BIR</b> structure after the <i>EngineAdapterAcceptSampleData</i> function returns.
 * 
 * If the <b>Offset</b> field of the <b>StandardDataBlock</b> member of the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure is greater than zero (indicating that the BIR contains a biometric sample in the standard data format), the <b>BiometricDataFormat</b> field of the <b>HeaderBlock</b> member must be set as follows:
 * 
 * <ul>
 * <li>The <b>Owner</b> field must be <b>WINBIO_ ANSI_381_FORMAT_OWNER</b>.</li>
 * <li>The <b>Type</b> field must be <b>WINBIO_ANSI_381_FORMAT_TYPE</b>.</li>
 * </ul>
 * This is the only standard data format supported by the Windows Biometric Framework.
 * 
 * The Windows Biometric Framework also assumes that the <b>HeaderBlock</b> member (a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir-header">WINBIO_BIR_HEADER</a> structure) contains the <b>DataFlags</b> and <b>Purpose</b> values used by the sensor adapter to capture the sample.
 * 
 * Fingerprint sensors processing fingerprint samples and rejecting bad swipes in the Engine Adapter should also use valid values for <b>WINBIO_BIR_PURPOSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_accept_sample_data_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN) {
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
     * @param {Integer} SampleBuffer Pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure that contains the biometric sample to be processed.
     * @param {Pointer} SampleSize A <b>SIZE_T</b> value that contains the size of the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure returned in the <i>SampleBuffer</i> parameter.
     * @param {Integer} Purpose 
     * @returns {Integer} A pointer to a <b>WINBIO_REJECT_DETAIL</b> value that receives additional information about the failure to process a biometric sample. If the operation succeeded, this parameter is set to zero. The following values are defined for fingerprint samples:
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
    Call(Pipeline, SampleBuffer, SampleSize, Purpose) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, IntPtr, SampleBuffer, IntPtr, SampleSize, Int8, Purpose, "uint*", &RejectDetail := 0, "HRESULT")
        return RejectDetail
    }

    /**
     * A PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN {
        /**
         * Creates a PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, IntPtr, IntPtr, Int8) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, IntPtr, IntPtr, Int8, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
