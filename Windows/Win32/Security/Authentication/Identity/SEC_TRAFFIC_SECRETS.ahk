#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SEC_TRAFFIC_SECRET_TYPE.ahk" { SEC_TRAFFIC_SECRET_TYPE }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains the traffic secrets for a connection.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_traffic_secrets
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_TRAFFIC_SECRETS {
    #StructPack 4

    /**
     * THe negotiated symmetric key algorithm (e.g. **BCRYPT_AES_ALGORITHM**).
     */
    SymmetricAlgId : WCHAR[64]

    /**
     * The negotiated symmetric key algorithm chaining mode (e.g. **BCRYPT_CHAIN_MODE_GCM** or **BCRYPT_CHAIN_MODE_CCM**).
     */
    ChainingMode : WCHAR[64]

    /**
     * The negotiated hash algorithm (e.g. **BCRYPT_SHA256_ALGORITHM** or **BCRYPT_SHA384_ALGORITHM**).
     */
    HashAlgId : WCHAR[64]

    /**
     * They size (in bytes) of the symmetric key to derive from this traffic secret.
     */
    KeySize : UInt16

    /**
     * The size (in bytes) of the IV to derive from this traffic secret.
     */
    IvSize : UInt16

    /**
     * The offset of the first byte of the TLS message sequence to be protected with a key derived from **TrafficSecret**. Use **0** to indicate the first byte of the buffer.
     */
    MsgSequenceStart : UInt16

    /**
     * The offset of the last byte of the TLS message sequence to be protected with a key derived from **TrafficSecret**. Use **0** if the secret is for the encryption of application data or decryption of incoming records.
     */
    MsgSequenceEnd : UInt16

    /**
     * The type of traffic secret from the [TRAFFIC_SECRET_TYPE](ne-sspi-sec_traffic_secret_type.md) enumeration.
     */
    TrafficSecretType : SEC_TRAFFIC_SECRET_TYPE

    /**
     * The size (in bytes) of the traffic secret.
     */
    TrafficSecretSize : UInt16

    /**
     * Traffic secret of type **TrafficSecretType**, **TrafficSecretSize** bytes long, used to derive write key and IV for message protection.
     */
    TrafficSecret : Int8[1]

}
