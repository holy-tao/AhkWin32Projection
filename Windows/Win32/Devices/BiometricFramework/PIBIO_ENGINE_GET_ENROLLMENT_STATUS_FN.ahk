#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Determines whether the enrollment object is ready to be committed to the pipeline.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_get_enrollment_status_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN) {
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
     * @returns {Integer} A pointer to a <b>WINBIO_REJECT_DETAIL</b> value that receives additional information about the failure to update the enrollment object. If the last update was successful, you should set this variable to zero.
     */
    Call(Pipeline) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, "uint*", &RejectDetail := 0, "HRESULT")
        return RejectDetail
    }

    /**
     * A PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN {
        /**
         * Creates a PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN pointer that invokes the given AHK function when called.
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
