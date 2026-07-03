#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Retrieves the number of correct samples required by the engine adapter to construct an enrollment template.
 * @remarks
 * If an engine adapter requires a different number of samples in different situations, you should return the largest number. For example, if a fingerprint engine requires more swipes for an index finger than for a thumb, return the number required for the index finger.
 * 
 * The value returned by the <i>SampleHint</i> parameter specifies the number of correct samples required. Because of bad captures, the actual number of samples required during enrollment may be larger than the number specified.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_sample_hint_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN) {
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
     * @returns {Pointer} Pointer to a variable that receives the number of required samples.
     */
    Call(Pipeline) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, "ptr*", &SampleHint := 0, "HRESULT")
        return SampleHint
    }

    /**
     * A PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN {
        /**
         * Creates a PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN pointer that invokes the given AHK function when called.
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
