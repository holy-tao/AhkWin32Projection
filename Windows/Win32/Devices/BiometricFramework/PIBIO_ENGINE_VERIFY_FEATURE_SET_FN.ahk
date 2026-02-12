#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Compares the template in the current feature set with a specific template in the database.
 * @remarks
 * The <i>SubFactor</i> parameter specifies the sub-factor associated with the biometric template. The Windows Biometric Framework supports only fingerprint capture and can use the following constants to represent sub-type information.
 * 
 * <ul>
 * <li>WINBIO_ANSI_381_POS_RH_THUMB</li>
 * <li>WINBIO_ANSI_381_POS_RH_INDEX_FINGER</li>
 * <li>WINBIO_ANSI_381_POS_RH_MIDDLE_FINGER</li>
 * <li>WINBIO_ANSI_381_POS_RH_RING_FINGER</li>
 * <li>WINBIO_ANSI_381_POS_RH_LITTLE_FINGER</li>
 * <li>WINBIO_ANSI_381_POS_LH_THUMB</li>
 * <li>WINBIO_ANSI_381_POS_LH_INDEX_FINGER</li>
 * <li>WINBIO_ANSI_381_POS_LH_MIDDLE_FINGER</li>
 * <li>WINBIO_ANSI_381_POS_LH_RING_FINGER</li>
 * <li>WINBIO_ANSI_381_POS_LH_LITTLE_FINGER</li>
 * <li>WINBIO_SUBTYPE_ANY</li>
 * </ul>
 * <div class="alert"><b>Important</b>  <p class="note">Do not attempt to validate the value supplied for the <i>SubFactor</i> parameter. The Windows Biometrics Service will validate the supplied value before passing it through to your implementation. If the value is <b>WINBIO_SUBTYPE_NO_INFORMATION</b> or <b>WINBIO_SUBTYPE_ANY</b>, then validate where appropriate.
 * 
 * </div>
 * <div> </div>
 * The algorithm used to generate the template hash is the one selected by the most recent call, on this pipeline, to the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_hash_algorithm_fn">EngineAdapterSetHashAlgorithm</a> function.
 * 
 * The hash value returned by this function, if any, is the hash of the enrollment template found in the database, not the matching template attached to the pipeline.
 * 
 * The <i>PayloadBlob</i> and <i>HashValue</i> buffers are owned and managed by the engine adapter after the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_identify_feature_set_fn">EngineAdapterIdentifyFeatureSet</a> function returns successfully. The engine adapter must keep the buffer address valid, for this pipeline, until the next call to <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_clear_context_fn">EngineAdapterClearContext</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_verify_feature_set_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_VERIFY_FEATURE_SET_FN extends IUnknown {

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
     * @param {Integer} SubFactor 
     * @param {Pointer<BOOLEAN>} Match 
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
    Invoke(Pipeline, Identity, SubFactor, Match, PayloadBlob, PayloadBlobSize, HashValue, HashSize, RejectDetail) {
        MatchMarshal := Match is VarRef ? "char*" : "ptr"
        PayloadBlobMarshal := PayloadBlob is VarRef ? "ptr*" : "ptr"
        PayloadBlobSizeMarshal := PayloadBlobSize is VarRef ? "ptr*" : "ptr"
        HashValueMarshal := HashValue is VarRef ? "ptr*" : "ptr"
        HashSizeMarshal := HashSize is VarRef ? "ptr*" : "ptr"
        RejectDetailMarshal := RejectDetail is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, "ptr", Identity, "char", SubFactor, MatchMarshal, Match, PayloadBlobMarshal, PayloadBlob, PayloadBlobSizeMarshal, PayloadBlobSize, HashValueMarshal, HashValue, HashSizeMarshal, HashSize, RejectDetailMarshal, RejectDetail, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
