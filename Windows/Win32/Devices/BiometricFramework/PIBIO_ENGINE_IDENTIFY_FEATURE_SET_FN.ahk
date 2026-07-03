#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Builds a template from the current feature set and locates a matching template in the database.
 * @remarks
 * The algorithm used to generate the template hash is that which was selected by the most recent call, on this pipeline, to <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_hash_algorithm_fn">EngineAdapterSetHashAlgorithm</a>.
 * 
 * The hash value returned by this function, if any, is the hash of the enrollment template found in the database, not the matching template attached to the pipeline.
 * 
 * The <i>PayloadBlob</i> and <i>HashValue</i> buffers are owned and managed by the engine adapter after the <i>EngineAdapterIdentifyFeatureSet</i> function returns successfully. The engine adapter must keep the buffer address valid, for this pipeline, until the next call to <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_clear_context_fn">EngineAdapterClearContext</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_identify_feature_set_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN) {
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
     * @param {Pointer<WINBIO_IDENTITY>} Identity Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that contains the GUID or SID of the template recovered from the database. This value is returned only if a match is found.
     * @param {Pointer<Integer>} SubFactor A <b>WINBIO_BIOMETRIC_SUBTYPE</b> value that receives the sub-factor associated with the template in the database. See the Remarks section for more details. This value is returned only if a match is found.
     * @param {Pointer<Pointer<Integer>>} PayloadBlob Address of a variable that receives a pointer to the payload data saved with the template. If there is no payload data, set this value to <b>NULL</b>.
     * @param {Pointer<Pointer>} PayloadBlobSize Pointer to a variable that receives the size, in bytes, of the buffer specified by the <i>PayloadBlob</i> parameter. If there is no payload data, set this value to zero.
     * @param {Pointer<Pointer<Integer>>} HashValue Address of a variable that receives a pointer to the generated hash value for the template. If the engine adapter does not support hash generation, set this value to <b>NULL</b>.
     * @param {Pointer<Pointer>} HashSize Pointer to a variable that receives the size, in bytes, of the buffer specified  by the <i>HashValue</i> parameter. If the engine adapter does not support hash generation, set this value to zero.
     * @param {Pointer<Integer>} RejectDetail Pointer to a variable that receives additional information if a capture failure prevents the engine from performing a matching operation. If the most recent capture succeeded, set this parameter to zero. The following values are defined for fingerprint capture:
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
     * @returns {HRESULT} If the function succeeds, it returns S_OK to indicate that the last update succeeded and no additional feature sets are required to complete the template. If the function fails, it must return one of the following <b>HRESULT</b> values to indicate the error.
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
     * The <i>Pipeline</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b> WINBIO_E_BAD_CAPTURE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature set did not meet internal requirements of the engine adapter for an identification operation. Further information about the failure is specified by the <i>RejectDetail</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>WINBIO_E_UNKNOWN_ID</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature set in the pipeline does not correspond to any identity in the database.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, Identity, SubFactor, PayloadBlob, PayloadBlobSize, HashValue, HashSize, RejectDetail) {
        SubFactorMarshal := SubFactor is VarRef ? "char*" : "ptr"
        PayloadBlobMarshal := PayloadBlob is VarRef ? "ptr*" : "ptr"
        PayloadBlobSizeMarshal := PayloadBlobSize is VarRef ? "ptr*" : "ptr"
        HashValueMarshal := HashValue is VarRef ? "ptr*" : "ptr"
        HashSizeMarshal := HashSize is VarRef ? "ptr*" : "ptr"
        RejectDetailMarshal := RejectDetail is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, WINBIO_IDENTITY.Ptr, Identity, SubFactorMarshal, SubFactor, PayloadBlobMarshal, PayloadBlob, PayloadBlobSizeMarshal, PayloadBlobSize, HashValueMarshal, HashValue, HashSizeMarshal, HashSize, RejectDetailMarshal, RejectDetail, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN {
        /**
         * Creates a PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, WINBIO_IDENTITY, "char*", "ptr*", "ptr*", "ptr*", "ptr*", "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, WINBIO_IDENTITY.Ptr, "char*", "ptr*", "ptr*", "ptr*", "ptr*", "uint*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
