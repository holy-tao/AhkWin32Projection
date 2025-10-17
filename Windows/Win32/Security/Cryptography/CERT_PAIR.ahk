#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * The CERT_PAIR structure contains a certificate and its pair cross certificate.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_pair
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_PAIR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * An optional <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_BLOB</a> structure that contains a certificate. If the <b>cbData</b> member of <b>Forward</b> is zero, the certificate may be empty.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Forward{
        get {
            if(!this.HasProp("__Forward"))
                this.__Forward := CRYPT_INTEGER_BLOB(0, this)
            return this.__Forward
        }
    }

    /**
     * An optional <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_BLOB</a> structure that contains a certificate. If the <b>cbData</b> member of <b>Reverse</b> is zero, the certificate may be empty.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Reverse{
        get {
            if(!this.HasProp("__Reverse"))
                this.__Reverse := CRYPT_INTEGER_BLOB(16, this)
            return this.__Reverse
        }
    }
}
