#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the traffic secrets for a connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_traffic_secrets
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_TRAFFIC_SECRETS extends Win32Struct
{
    static sizeof => 400

    static packingSize => 4

    /**
     * THe negotiated symmetric key algorithm (e.g. **BCRYPT_AES_ALGORITHM**).
     * @type {String}
     */
    SymmetricAlgId {
        get => StrGet(this.ptr + 0, 63, "UTF-16")
        set => StrPut(value, this.ptr + 0, 63, "UTF-16")
    }

    /**
     * The negotiated symmetric key algorithm chaining mode (e.g. **BCRYPT_CHAIN_MODE_GCM** or **BCRYPT_CHAIN_MODE_CCM**).
     * @type {String}
     */
    ChainingMode {
        get => StrGet(this.ptr + 128, 63, "UTF-16")
        set => StrPut(value, this.ptr + 128, 63, "UTF-16")
    }

    /**
     * The negotiated hash algorithm (e.g. **BCRYPT_SHA256_ALGORITHM** or **BCRYPT_SHA384_ALGORITHM**).
     * @type {String}
     */
    HashAlgId {
        get => StrGet(this.ptr + 256, 63, "UTF-16")
        set => StrPut(value, this.ptr + 256, 63, "UTF-16")
    }

    /**
     * They size (in bytes) of the symmetric key to derive from this traffic secret.
     * @type {Integer}
     */
    KeySize {
        get => NumGet(this, 384, "ushort")
        set => NumPut("ushort", value, this, 384)
    }

    /**
     * The size (in bytes) of the IV to derive from this traffic secret.
     * @type {Integer}
     */
    IvSize {
        get => NumGet(this, 386, "ushort")
        set => NumPut("ushort", value, this, 386)
    }

    /**
     * The offset of the first byte of the TLS message sequence to be protected with a key derived from **TrafficSecret**. Use **0** to indicate the first byte of the buffer.
     * @type {Integer}
     */
    MsgSequenceStart {
        get => NumGet(this, 388, "ushort")
        set => NumPut("ushort", value, this, 388)
    }

    /**
     * The offset of the last byte of the TLS message sequence to be protected with a key derived from **TrafficSecret**. Use **0** if the secret is for the encryption of application data or decryption of incoming records.
     * @type {Integer}
     */
    MsgSequenceEnd {
        get => NumGet(this, 390, "ushort")
        set => NumPut("ushort", value, this, 390)
    }

    /**
     * The type of traffic secret from the [TRAFFIC_SECRET_TYPE](ne-sspi-sec_traffic_secret_type.md) enumeration.
     * @type {Integer}
     */
    TrafficSecretType {
        get => NumGet(this, 392, "int")
        set => NumPut("int", value, this, 392)
    }

    /**
     * The size (in bytes) of the traffic secret.
     * @type {Integer}
     */
    TrafficSecretSize {
        get => NumGet(this, 396, "ushort")
        set => NumPut("ushort", value, this, 396)
    }

    /**
     * Traffic secret of type **TrafficSecretType**, **TrafficSecretSize** bytes long, used to derive write key and IV for message protection.
     * @type {Array<Byte>}
     */
    TrafficSecret{
        get {
            if(!this.HasProp("__TrafficSecretProxyArray"))
                this.__TrafficSecretProxyArray := Win32FixedArray(this.ptr + 398, 1, Primitive, "char")
            return this.__TrafficSecretProxyArray
        }
    }
}
