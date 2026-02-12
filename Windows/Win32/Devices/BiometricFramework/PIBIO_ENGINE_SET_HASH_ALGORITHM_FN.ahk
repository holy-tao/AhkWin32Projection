#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_set_hash_algorithm_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_SET_HASH_ALGORITHM_FN extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @param {Pointer} AlgorithmBufferSize 
     * @param {Pointer<Integer>} AlgorithmBuffer 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, AlgorithmBufferSize, AlgorithmBuffer) {
        AlgorithmBufferMarshal := AlgorithmBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, "ptr", AlgorithmBufferSize, AlgorithmBufferMarshal, AlgorithmBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
