#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves the hash of the completed enrollment template in the pipeline.
 * @remarks
 * The template hashed by this function must be the completed enrollment template that will be stored in the database when <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_commit_enrollment_fn">EngineAdapterCommitEnrollment</a> is called. You must not hash one of the intermediate captured samples.
 * 
 * The algorithm used to generate the template hash is that which was selected by the most recent call, on this pipeline, to <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_hash_algorithm_fn">EngineAdapterSetHashAlgorithm</a>.
 * 
 * The memory that contains the hash is owned and managed by the engine adapter after the <i>EngineAdapterGetEnrollmentHash</i> function returns successfully. The engine adapter must keep the buffer address valid until the Framework calls any of the following functions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_clear_context_fn">EngineAdapterClearContext</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_commit_enrollment_fn">EngineAdapterCommitEnrollment</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_discard_enrollment_fn">EngineAdapterDiscardEnrollment</a>
 * </li>
 * </ul>
 * The engine adapter must also maintain a separate hash buffer for each pipeline.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_get_enrollment_hash_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN extends IUnknown {

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
     * @param {Pointer<Pointer<Integer>>} HashValue 
     * @param {Pointer<Pointer>} HashSize 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, HashValue, HashSize) {
        HashValueMarshal := HashValue is VarRef ? "ptr*" : "ptr"
        HashSizeMarshal := HashSize is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, HashValueMarshal, HashValue, HashSizeMarshal, HashSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
