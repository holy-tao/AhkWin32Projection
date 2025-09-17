#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Defines a time stamp request structure that corresponds to the Abstract Syntax Notation One (ASN.1) definition of a TimeStampReq type.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_timestamp_request
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_TIMESTAMP_REQUEST extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * A <b>DWORD</b> value that specifies the version of the time stamp request.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains information about the algorithm used to calculate the hash.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    HashAlgorithm{
        get {
            if(!this.HasProp("__HashAlgorithm"))
                this.__HashAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 8)
            return this.__HashAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob">CRYPT_DER_BLOB</a> structure that specifies the hash values to be time stamped.
     * @type {CRYPT_INTEGER_BLOB}
     */
    HashedMessage{
        get {
            if(!this.HasProp("__HashedMessage"))
                this.__HashedMessage := CRYPT_INTEGER_BLOB(this.ptr + 32)
            return this.__HashedMessage
        }
    }

    /**
     * Optional. A pointer to a null-terminated string that specifies the Time Stamping Authority (TSA) policy under which the time stamp token should be provided.
     * @type {Pointer<Byte>}
     */
    pszTSAPolicyId {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Optional. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that contains the nonce value used by the client to verify the
     * timeliness of the response when no local clock is available.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Nonce{
        get {
            if(!this.HasProp("__Nonce"))
                this.__Nonce := CRYPT_INTEGER_BLOB(this.ptr + 56)
            return this.__Nonce
        }
    }

    /**
     * A Boolean value that indicates whether the TSA must include the certificates used to sign the time stamp token in the response.
     * @type {Integer}
     */
    fCertReq {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * The number of elements in the array pointed to by the <b>rgExtension</b> member.
     * @type {Integer}
     */
    cExtension {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures that contain extension information that is passed in the request.
     * @type {Pointer<CERT_EXTENSION>}
     */
    rgExtension {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
