#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Selects a hash algorithm for use in subsequent operations.
 * @remarks
 * The Windows Biometric Framework calls this function to configure a biometric unit every time the unit is added to a sensor pool.
 * 
 *  Because a hash algorithm is selected on a per-pipeline basis, the engine adapter must store the selected algorithm in a private pipeline context.
 * 
 * The engine adapter must keep track of the most recent algorithm selected and use this algorithm when processing calls to the following functions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_verify_feature_set_fn">EngineAdapterVerifyFeatureSet</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_identify_feature_set_fn">EngineAdapterIdentifyFeatureSet</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_get_enrollment_hash_fn">EngineAdapterGetEnrollmentHash</a>
 * </li>
 * </ul>
 * The algorithm chosen by this function must remain selected until the next time <i>EngineAdapterSetHashAlgorithm</i> is called, or until the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_detach_fn">EngineAdapterDetach</a> method is called. In particular, calls to the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_clear_context_fn">EngineAdapterClearContext</a> function should not affect the selected algorithm.
 * 
 * Only the SHA1 hash algorithm is used by the Windows Biometric Framework. The OID string value for this algorithm is "1.3.14.3.2.26". For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_hash_algorithms_fn">EngineAdapterQueryHashAlgorithms</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_hash_algorithm_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_SET_HASH_ALGORITHM_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_SET_HASH_ALGORITHM_FN) {
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
     * @param {Pointer} AlgorithmBufferSize The size, in bytes, of the buffer specified by the <i>AlgorithmBuffer</i> parameter.
     * @param {Pointer<Integer>} AlgorithmBuffer Pointer to a <b>NULL</b>-terminated ANSI string that contains the object identifier of the hash algorithm to select. Call the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_hash_algorithms_fn">EngineAdapterQueryHashAlgorithms</a> function to retrieve an array of the supported algorithm object identifiers (OIDs).
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The engine adapter does not support template hashing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The engine adapter does not support the hash algorithm specified by the <i>AlgorithmBuffer</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, AlgorithmBufferSize, AlgorithmBuffer) {
        AlgorithmBufferMarshal := AlgorithmBuffer is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, IntPtr, AlgorithmBufferSize, AlgorithmBufferMarshal, AlgorithmBuffer, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_SET_HASH_ALGORITHM_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_SET_HASH_ALGORITHM_FN {
        /**
         * Creates a PIBIO_ENGINE_SET_HASH_ALGORITHM_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, IntPtr, "char*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, IntPtr, "char*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
