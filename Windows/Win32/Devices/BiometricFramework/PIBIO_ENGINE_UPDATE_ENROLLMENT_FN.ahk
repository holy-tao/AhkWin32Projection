#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Adds the current feature set to the enrollment object.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_update_enrollment_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_UPDATE_ENROLLMENT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_UPDATE_ENROLLMENT_FN) {
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
     * @returns {Integer} Pointer to a <b>WINBIO_REJECT_DETAIL</b> value that receives  additional information about the failure to update the enrollment object. If the update succeeds, this value should be set to zero.
     */
    Call(Pipeline) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, "uint*", &RejectDetail := 0, "HRESULT")
        return RejectDetail
    }

    /**
     * A PIBIO_ENGINE_UPDATE_ENROLLMENT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_UPDATE_ENROLLMENT_FN {
        /**
         * Creates a PIBIO_ENGINE_UPDATE_ENROLLMENT_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
