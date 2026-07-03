#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

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
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_verify_feature_set_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_VERIFY_FEATURE_SET_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_VERIFY_FEATURE_SET_FN) {
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
     * @param {Pointer<WINBIO_IDENTITY>} Identity Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that contains a GUID or SID that is expected to match that of the template recovered from the database.
     * @param {Integer} SubFactor A <b>WINBIO_BIOMETRIC_SUBTYPE</b> value that is expected to match that of the template recovered from the database.
     * See the Remarks section for more details.
     * @param {Pointer<BOOLEAN>} Match Pointer to a Boolean value that specifies whether the <i>Identity</i> and <i>SubFactor</i> parameters match those of the template recovered from the database. <b>TRUE</b> specifies that these values match.
     * @param {Pointer<Pointer<Integer>>} PayloadBlob Address of a variable that receives a pointer to the payload data saved with the template. If there is no payload data, set this value to <b>NULL</b>.
     * @param {Pointer<Pointer>} PayloadBlobSize Pointer to a value that receives the size, in bytes, of the buffer specified in the <i>PayloadBlob</i> parameter. If there is no payload data stored with the template, set this value to zero.
     * @param {Pointer<Pointer<Integer>>} HashValue Address of a variable that receives a pointer to the hash of the template. If the engine adapter does not support hash generation, set this value to <b>NULL</b>.
     * @param {Pointer<Pointer>} HashSize Pointer to a value that contains the size, in bytes, of the hash specified by the <i>HashValue</i> parameter. If the engine adapter does not support hash generation, set this value to zero.
     * @param {Pointer<Integer>} RejectDetail Pointer to a <b>WINBIO_REJECT_DETAIL</b> value that receives additional information if a capture failure prevents the engine from performing a matching operation. If the most-recent capture succeeded, set this parameter to zero. The following values are defined for fingerprint capture
     * 
     * <ul>
     * <li>WINBIO_FP_TOO_HIGH</li>
     * <li>WINBIO_FP_TOO_LOW</li>
     * <li>WINBIO_FP_TOO_LEFT</li>
     * <li>WINBIO_FP_TOO_RIGHT</li>
     * <li>WINBIO_FP_TOO_FAST</li>
     * <li>WINBIO_FP_TOO_SLOW</li>
     * <li>WINBIO_FP_POOR_QUALITY</li>
     * <li>WINBIO_FP_TOO_SKEWED</li>
     * <li>WINBIO_FP_TOO_SHORT</li>
     * <li>WINBIO_FP_MERGE_FAILURE</li>
     * </ul>
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
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified in the <i>SubFactor</i> parameter is not correct.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>   WINBIO_E_BAD_CAPTURE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature set did not meet the internal requirements of the engine adapter for a verification operation. Further information about the failure is specified by the <i>RejectDetail</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_NO_MATCH</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature set in the pipeline matches one stored in the database but it does not correspond to the combination of values passed in the <i>Identity</i> and <i>SubFactor</i> parameters.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, Identity, SubFactor, Match, PayloadBlob, PayloadBlobSize, HashValue, HashSize, RejectDetail) {
        MatchMarshal := Match is VarRef ? "char*" : "ptr"
        PayloadBlobMarshal := PayloadBlob is VarRef ? "ptr*" : "ptr"
        PayloadBlobSizeMarshal := PayloadBlobSize is VarRef ? "ptr*" : "ptr"
        HashValueMarshal := HashValue is VarRef ? "ptr*" : "ptr"
        HashSizeMarshal := HashSize is VarRef ? "ptr*" : "ptr"
        RejectDetailMarshal := RejectDetail is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, WINBIO_IDENTITY.Ptr, Identity, Int8, SubFactor, MatchMarshal, Match, PayloadBlobMarshal, PayloadBlob, PayloadBlobSizeMarshal, PayloadBlobSize, HashValueMarshal, HashValue, HashSizeMarshal, HashSize, RejectDetailMarshal, RejectDetail, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_VERIFY_FEATURE_SET_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_VERIFY_FEATURE_SET_FN {
        /**
         * Creates a PIBIO_ENGINE_VERIFY_FEATURE_SET_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, WINBIO_IDENTITY, Int8, BOOLEAN, "ptr*", "ptr*", "ptr*", "ptr*", "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, WINBIO_IDENTITY.Ptr, Int8, BOOLEAN.Ptr, "ptr*", "ptr*", "ptr*", "ptr*", "uint*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
