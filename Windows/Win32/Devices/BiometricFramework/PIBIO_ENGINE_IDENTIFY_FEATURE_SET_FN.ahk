#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Builds a template from the current feature set and locates a matching template in the database.
 * @remarks
 * The algorithm used to generate the template hash is that which was selected by the most recent call, on this pipeline, to <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_hash_algorithm_fn">EngineAdapterSetHashAlgorithm</a>.
 * 
 * The hash value returned by this function, if any, is the hash of the enrollment template found in the database, not the matching template attached to the pipeline.
 * 
 * The <i>PayloadBlob</i> and <i>HashValue</i> buffers are owned and managed by the engine adapter after the <i>EngineAdapterIdentifyFeatureSet</i> function returns successfully. The engine adapter must keep the buffer address valid, for this pipeline, until the next call to <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_clear_context_fn">EngineAdapterClearContext</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_identify_feature_set_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN extends IUnknown {

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
     * @param {Pointer<WINBIO_IDENTITY>} Identity 
     * @param {Pointer<Integer>} SubFactor 
     * @param {Pointer<Pointer<Integer>>} PayloadBlob 
     * @param {Pointer<Pointer>} PayloadBlobSize 
     * @param {Pointer<Pointer<Integer>>} HashValue 
     * @param {Pointer<Pointer>} HashSize 
     * @param {Pointer<Integer>} RejectDetail 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, Identity, SubFactor, PayloadBlob, PayloadBlobSize, HashValue, HashSize, RejectDetail) {
        SubFactorMarshal := SubFactor is VarRef ? "char*" : "ptr"
        PayloadBlobMarshal := PayloadBlob is VarRef ? "ptr*" : "ptr"
        PayloadBlobSizeMarshal := PayloadBlobSize is VarRef ? "ptr*" : "ptr"
        HashValueMarshal := HashValue is VarRef ? "ptr*" : "ptr"
        HashSizeMarshal := HashSize is VarRef ? "ptr*" : "ptr"
        RejectDetailMarshal := RejectDetail is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, "ptr", Identity, SubFactorMarshal, SubFactor, PayloadBlobMarshal, PayloadBlob, PayloadBlobSizeMarshal, PayloadBlobSize, HashValueMarshal, HashValue, HashSizeMarshal, HashSize, RejectDetailMarshal, RejectDetail, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
