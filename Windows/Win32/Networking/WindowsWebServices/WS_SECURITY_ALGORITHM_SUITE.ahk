#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the security algorithms and key lengths to be used with WS-Security. This setting is relevant to message security bindings and mixed-mode security bindings.
 * @remarks
 * 
  * When key derivation is used, the key length restrictions apply to the
  * source security token from which the signing or encryption derived
  * token are derived.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_security_algorithm_suite
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_ALGORITHM_SUITE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Algorithm to use for XML canonicalization, such as the exclusive XML
     * canonicalization algorithm. 
     * Setting this value to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a> will default to 
     * <b>WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE</b>.
     * @type {Integer}
     */
    canonicalizationAlgorithm {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Algorithm to use for message part digests, such as SHA-1, SHA-256,
     * SHA-384, or SHA-512. 
     * Setting this value to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a> will default to 
     * <b>WS_SECURITY_ALGORITHM_DIGEST_SHA1</b>.
     * @type {Integer}
     */
    digestAlgorithm {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Algorithm to use for message authentication codes (also known as MACs
     * or symmetric signatures) such as HMAC-SHA1, HMAC-SHA256, HMAC-SHA384, or HMAC-SHA512. 
     * Setting this value to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a> will default to 
     * <b>WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1</b>.
     * @type {Integer}
     */
    symmetricSignatureAlgorithm {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Algorithm to use for asymmetric signatures. 
     * Setting this value to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a> will default to 
     * <b>WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1</b>.
     * @type {Integer}
     */
    asymmetricSignatureAlgorithm {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Algorithm to use for message part encryption. Reserved for future use. Should be set to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a>.
     * @type {Integer}
     */
    encryptionAlgorithm {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Algorithm to use for deriving keys from other symmetric keys. 
     * Setting this value to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a> will default to 
     * <b>WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1</b>.
     * @type {Integer}
     */
    keyDerivationAlgorithm {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Algorithm to use for encrypting symmetric keys with other symmetric
     * keys. Reserved for future use. Should be set to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a>.
     * @type {Integer}
     */
    symmetricKeyWrapAlgorithm {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Algorithm to use for encrypting symmetric keys with asymmetric
     *                   keys. Setting this value to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DEFAULT</a> will default to
     *                   <b>WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_OAEP</b>.
     * @type {Integer}
     */
    asymmetricKeyWrapAlgorithm {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * The minimum key length (in bits) of symmetric key security tokens. 
     * Setting this value to 0 will default to 128 bits.
     * @type {Integer}
     */
    minSymmetricKeyLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The maximum key length (in bits) of symmetric key security tokens. 
     * Setting this value to 0 will default to 512 bits.
     * @type {Integer}
     */
    maxSymmetricKeyLength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The minimum key length (in bits) of asymmetric key security tokens.
     * Setting this value to 0 will default to 1024 bits.
     * @type {Integer}
     */
    minAsymmetricKeyLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The maximum key length (in bits) of asymmetric key security tokens.
     * Setting this value to 0 will default to 16384 bits.
     * @type {Integer}
     */
    maxAsymmetricKeyLength {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Algorithm properties. Reserved for future use. Should be set to <b>NULL</b>.
     * @type {Pointer<WS_SECURITY_ALGORITHM_PROPERTY>}
     */
    properties {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Number of entries in properties array. Reserved for future use. Should be set to 0.
     * @type {Integer}
     */
    propertyCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
