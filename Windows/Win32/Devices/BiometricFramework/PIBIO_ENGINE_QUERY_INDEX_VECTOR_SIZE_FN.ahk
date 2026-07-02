#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Retrieves the size of the index vector used by the engine adapter.
 * @remarks
 * The index vector is used by the engine adapter to index the available biometric templates.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_index_vector_size_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN) {
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
     * @returns {Pointer} Address of a variable that receives the number of array elements in the index vector.
     */
    Call(Pipeline) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, "ptr*", &IndexElementCount := 0, "HRESULT")
        return IndexElementCount
    }

    /**
     * A PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN {
        /**
         * Creates a PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN pointer that invokes the given AHK function when called.
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
