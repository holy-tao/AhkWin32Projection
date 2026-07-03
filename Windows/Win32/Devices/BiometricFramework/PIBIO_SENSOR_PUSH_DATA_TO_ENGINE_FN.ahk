#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Makes the current contents of the sample buffer available to the engine adapter.
 * @remarks
 * Your implementation of this function should convert raw data contained in the  sample buffer into a standard <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure and push this structure to the engine  by using the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_accept_sample_data_fn">EngineAdapterAcceptSampleData</a> function. The correct way to do this is to call the <b>WbioEngineAcceptSampleData</b> helper function defined in Winbio_adapter.h header file.
 * 
 * 
 * If the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_accept_sample_data_fn">EngineAdapterAcceptSampleData</a> function returns WINBIO_E_BAD_CAPTURE, your implementation of <i>SensorAdapterPushDataToEngine</i> should return the <i>RejectDetail</i> value propagated by the engine adapter. 
 * 
 * 
 * The sensor adapter retains ownership of the sample buffer passed to <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_accept_sample_data_fn">EngineAdapterAcceptSampleData</a>. The sensor adapter is responsible for releasing this buffer at some point after <i>EngineAdapterAcceptSampleData</i> returns.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_push_data_to_engine_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN) {
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
     * @param {Integer} Purpose A value that specifies the properties of the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> structure that will be passed to the engine. This can be a bitwise <b>OR</b> of the following security and processing level flags:
     * 
     * 
     * <ul>
     * <li>WINBIO_PURPOSE_VERIFY</li>
     * <li>WINBIO_PURPOSE_IDENTIFY</li>
     * <li>WINBIO_PURPOSE_ENROLL</li>
     * <li>WINBIO_PURPOSE_ENROLL_FOR_VERIFICATION</li>
     * <li>WINBIO_PURPOSE_ENROLL_FOR_IDENTIFICATION</li>
     * </ul>
     * @param {Integer} Flags A value that specifies the format of the sample. This can be a bitwise <b>OR</b> of the following security and processing level flags:
     * 
     * 
     * * **WINBIO_DATA_FLAG_PRIVACY**
     * 
     * The sample should be encrypted.
     *             
     *             
     * * **WINBIO_DATA_FLAG_INTEGRITY**
     * 
     * The sample should be digitally signed or protected by a message authentication code (MAC).
     *             
     *             
     * * **WINBIO_DATA_FLAG_SIGNED**
     * 
     * If this flag and the <mark>WINBIO_DATA_FLAG_INTEGRITY</mark> flag are set, the sample should be signed. If this flag is not set but the <mark>WINBIO_DATA_FLAG_INTEGRITY</mark> flag is set, a MAC should be computed.
     *             
     *             
     * * **WINBIO_DATA_FLAG_RAW**
     * 
     * The sample should be placed in the <xref targtype="struct" rid="secbiomet.winbio_bir">WINBIO_BIR</xref> object in the format in which it was captured.
     * @returns {Integer} A pointer to a <b>WINBIO_REJECT_DETAIL</b> value that contains  information about the previous failure to capture a biometric sample and therefore the reason that the sample buffer is empty. If an earlier capture succeeded, this parameter is set to zero. The following values are defined for fingerprint capture:
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
    Call(Pipeline, Purpose, Flags) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, Int8, Purpose, Int8, Flags, "uint*", &RejectDetail := 0, "HRESULT")
        return RejectDetail
    }

    /**
     * A PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN {
        /**
         * Creates a PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, Int8, Int8) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, Int8, Int8, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
