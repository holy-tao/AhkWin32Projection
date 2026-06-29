#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_ALGORITHM_PROPERTY.ahk" { WS_SECURITY_ALGORITHM_PROPERTY }
#Import ".\WS_SECURITY_ALGORITHM_ID.ahk" { WS_SECURITY_ALGORITHM_ID }

/**
 * Defines the security algorithms and key lengths to be used with WS-Security. This setting is relevant to message security bindings and mixed-mode security bindings.
 * @remarks
 * When key derivation is used, the key length restrictions apply to the
 * source security token from which the signing or encryption derived
 * token are derived.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_algorithm_suite
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_ALGORITHM_SUITE {
    #StructPack 8

    /**
     * Algorithm to use for XML canonicalization, such as the exclusive XML
     * canonicalization algorithm. 
     * Setting this value to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a> will default to 
     * <b>WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE</b>.
     */
    canonicalizationAlgorithm : WS_SECURITY_ALGORITHM_ID

    /**
     * Algorithm to use for message part digests, such as SHA-1, SHA-256,
     * SHA-384, or SHA-512. 
     * Setting this value to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a> will default to 
     * <b>WS_SECURITY_ALGORITHM_DIGEST_SHA1</b>.
     */
    digestAlgorithm : WS_SECURITY_ALGORITHM_ID

    /**
     * Algorithm to use for message authentication codes (also known as MACs
     * or symmetric signatures) such as HMAC-SHA1, HMAC-SHA256, HMAC-SHA384, or HMAC-SHA512. 
     * Setting this value to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a> will default to 
     * <b>WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1</b>.
     */
    symmetricSignatureAlgorithm : WS_SECURITY_ALGORITHM_ID

    /**
     * Algorithm to use for asymmetric signatures. 
     * Setting this value to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a> will default to 
     * <b>WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1</b>.
     */
    asymmetricSignatureAlgorithm : WS_SECURITY_ALGORITHM_ID

    /**
     * Algorithm to use for message part encryption. Reserved for future use. Should be set to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a>.
     */
    encryptionAlgorithm : WS_SECURITY_ALGORITHM_ID

    /**
     * Algorithm to use for deriving keys from other symmetric keys. 
     * Setting this value to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a> will default to 
     * <b>WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1</b>.
     */
    keyDerivationAlgorithm : WS_SECURITY_ALGORITHM_ID

    /**
     * Algorithm to use for encrypting symmetric keys with other symmetric
     * keys. Reserved for future use. Should be set to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a>.
     */
    symmetricKeyWrapAlgorithm : WS_SECURITY_ALGORITHM_ID

    /**
     * Algorithm to use for encrypting symmetric keys with asymmetric
     *                   keys. Setting this value to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a> will default to
     *                   <b>WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_OAEP</b>.
     */
    asymmetricKeyWrapAlgorithm : WS_SECURITY_ALGORITHM_ID

    /**
     * The minimum key length (in bits) of symmetric key security tokens. 
     * Setting this value to 0 will default to 128 bits.
     */
    minSymmetricKeyLength : UInt32

    /**
     * The maximum key length (in bits) of symmetric key security tokens. 
     * Setting this value to 0 will default to 512 bits.
     */
    maxSymmetricKeyLength : UInt32

    /**
     * The minimum key length (in bits) of asymmetric key security tokens.
     * Setting this value to 0 will default to 1024 bits.
     */
    minAsymmetricKeyLength : UInt32

    /**
     * The maximum key length (in bits) of asymmetric key security tokens.
     * Setting this value to 0 will default to 16384 bits.
     */
    maxAsymmetricKeyLength : UInt32

    /**
     * Algorithm properties. Reserved for future use. Should be set to <b>NULL</b>.
     */
    properties : WS_SECURITY_ALGORITHM_PROPERTY.Ptr

    /**
     * Number of entries in properties array. Reserved for future use. Should be set to 0.
     */
    propertyCount : UInt32

}
