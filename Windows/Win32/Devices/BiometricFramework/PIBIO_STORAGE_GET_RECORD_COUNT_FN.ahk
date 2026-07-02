#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Retrieves the number of template records in the pipeline result set.
 * @remarks
 * The number of records currently in the result set is determined by the most recent call to the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_query_by_content_fn">StorageAdapterQueryByContent</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_query_by_subject_fn">StorageAdapterQueryBySubject</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_storage_get_record_count_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_GET_RECORD_COUNT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_GET_RECORD_COUNT_FN) {
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
     * @returns {Pointer} Pointer to a variable that receives the number of template records in the result set.
     */
    Call(Pipeline) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, "ptr*", &RecordCount := 0, "HRESULT")
        return RecordCount
    }

    /**
     * A PIBIO_STORAGE_GET_RECORD_COUNT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_GET_RECORD_COUNT_FN {
        /**
         * Creates a PIBIO_STORAGE_GET_RECORD_COUNT_FN pointer that invokes the given AHK function when called.
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
