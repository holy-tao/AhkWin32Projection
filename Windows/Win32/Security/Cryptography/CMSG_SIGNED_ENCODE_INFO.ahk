#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information to be passed to CryptMsgOpenToEncode if dwMsgType is CMSG_SIGNED.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cmsg_signed_encode_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_SIGNED_ENCODE_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Size of this structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of elements in the <b>rgSigners</b> array.
     * @type {Integer}
     */
    cSigners {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Array of pointers to 
     * 			   <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_signer_encode_info">CMSG_SIGNER_ENCODE_INFO</a>structures each holding signer information.
     * @type {Pointer<CMSG_SIGNER_ENCODE_INFO>}
     */
    rgSigners {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Number of elements in the <b>rgCertEncoded</b> array.
     * @type {Integer}
     */
    cCertEncoded {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Array of pointers to 
     *               <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_BLOB</a> 
     * 				  structures, each containing an encoded certificate.
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    rgCertEncoded {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Number of elements in the <b>rgCrlEncoded</b> array.
     * @type {Integer}
     */
    cCrlEncoded {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Array of pointers to 
     *                 <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRL_BLOB</a> structures, each containing an encoded CRL.
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    rgCrlEncoded {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 48
    }
}
