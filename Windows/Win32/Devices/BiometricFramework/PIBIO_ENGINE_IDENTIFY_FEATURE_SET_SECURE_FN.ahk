#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Called by the Windows Biometric Framework to build a template from the current feature set and locate a matching template in the database.
 * @remarks
 * The Authorization buffer contains the following SHA256_HMAC:
 * 
 * SHA256_HMAC(Key, SHA256(Nonce || 0xffffffe2 || SHA256(AccountSid)))
 * 
 * <ul>
 * <li>
 * Key
 * 
 * Key is the HMAC key passed in by <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_create_key_fn">EngineAdapterCreateKey</a>, and identified by the <i>KeyIdentifier</i> parameter.
 * 
 * </li>
 * <li>
 * Nonce
 * 
 * Nonce is the Nonce parameter.
 * 
 * </li>
 * <li>
 * 0xffffffe2
 * 
 * A 32-bit unsigned integer in big-endian format.
 * 
 * </li>
 * <li>
 * AccountSid
 * 
 * The account SID of the user referenced by the Identity parameter. The SID bytes can be obtained from the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure.
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_identify_feature_set_secure_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline Pointer to a WINBIO_PIPELINE structure associated with the biometric unit performing the operation.
     * @param {Pointer<Integer>} Nonce Pointer to a buffer that contains a nonce.
     * @param {Pointer} NonceSize Size, in bytes, of the buffer specified by the <i>Nonce</i> parameter.
     * @param {Pointer<Integer>} KeyIdentifier Pointer to a buffer that contains an identifier for the key from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_create_key_fn">EngineAdapterCreateKey</a>
     * @param {Pointer} KeyIdentifierSize Size, in bytes, of the buffer specified by the <i>KeyIdentifier</i> parameter.
     * @param {Pointer<WINBIO_IDENTITY>} Identity Pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that contains the SID of the template recovered from the database. This value is returned only if a match is found.
     * @param {Pointer<Integer>} SubFactor 
     * @param {Pointer<Integer>} RejectDetail Pointer to a variable that receives additional information if a capture failure prevents the engine from performing a matching operation. If the most recent capture succeeded, set this parameter to zero.
     * @param {Pointer<Pointer<Integer>>} Authorization An HMAC. See remarks section.
     * @param {Pointer<Pointer>} AuthorizationSize Size, in bytes, of the buffer specified by the <i>Authorization</i> parameter.
     * @returns {HRESULT} <b>WINBIO_E_INVALID_KEY_IDENTIFIER</b> must be returned in the case where the key cannot be used for whatever reason. When <b>WINBIO_E_INVALID_KEY_IDENTIFIER </b> is returned, the sensor and TPM will be re-provisioned.
     */
    Call(Pipeline, Nonce, NonceSize, KeyIdentifier, KeyIdentifierSize, Identity, SubFactor, RejectDetail, Authorization, AuthorizationSize) {
        NonceMarshal := Nonce is VarRef ? "char*" : "ptr"
        KeyIdentifierMarshal := KeyIdentifier is VarRef ? "char*" : "ptr"
        SubFactorMarshal := SubFactor is VarRef ? "char*" : "ptr"
        RejectDetailMarshal := RejectDetail is VarRef ? "uint*" : "ptr"
        AuthorizationMarshal := Authorization is VarRef ? "ptr*" : "ptr"
        AuthorizationSizeMarshal := AuthorizationSize is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, NonceMarshal, Nonce, IntPtr, NonceSize, KeyIdentifierMarshal, KeyIdentifier, IntPtr, KeyIdentifierSize, WINBIO_IDENTITY.Ptr, Identity, SubFactorMarshal, SubFactor, RejectDetailMarshal, RejectDetail, AuthorizationMarshal, Authorization, AuthorizationSizeMarshal, AuthorizationSize, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN {
        /**
         * Creates a PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, "char*", IntPtr, "char*", IntPtr, WINBIO_IDENTITY, "char*", "uint*", "ptr*", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, "char*", IntPtr, "char*", IntPtr, WINBIO_IDENTITY.Ptr, "char*", "uint*", "ptr*", "ptr*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
