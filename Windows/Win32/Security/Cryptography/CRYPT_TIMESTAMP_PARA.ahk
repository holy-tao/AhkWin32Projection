#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Defines additional parameters for the time stamp request.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_timestamp_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_TIMESTAMP_PARA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Optional. A pointer to a null-terminated character string that contains the Time Stamping Authority (TSA) policy under which the time stamp token
     * should be provided.
     * @type {Pointer<Ptr>}
     */
    pszTSAPolicyId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A Boolean value that specifies whether the TSA must include the certificates
     * used to sign the time stamp token in the response .
     * @type {Integer}
     */
    fRequestCerts {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Optional. A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that contains the nonce value used by the client to verify the
     * timeliness of the response when no local clock is available.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Nonce{
        get {
            if(!this.HasProp("__Nonce"))
                this.__Nonce := CRYPT_INTEGER_BLOB(this.ptr + 16)
            return this.__Nonce
        }
    }

    /**
     * The number of elements in the array pointed to by the <b>rgExtension</b> member.
     * @type {Integer}
     */
    cExtension {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures that contain extension information that is passed in the request.
     * @type {Pointer<CERT_EXTENSION>}
     */
    rgExtension {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
