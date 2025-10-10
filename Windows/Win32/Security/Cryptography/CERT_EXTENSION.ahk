#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * The CERT_EXTENSION structure contains the extension information for a certificate, Certificate Revocation List (CRL) or Certificate Trust List (CTL).
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_extension
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_EXTENSION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">Object identifier</a> (OID) that specifies the structure of the extension data contained in the <b>Value</b> member. For specifics on extension OIDs and their related structures, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-structures">X.509 Certificate Extension Structures</a>.
     * @type {Pointer<Byte>}
     */
    pszObjId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * If <b>TRUE</b>, any limitations specified by the extension in the <b>Value</b> member of this structure are imperative. If <b>FALSE</b>, limitations set by this extension can be ignored.
     * @type {Integer}
     */
    fCritical {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_OBJID_BLOB</a> structure that contains the encoded extension data. The <b>cbData</b> member of <b>Value</b> indicates the length in bytes of the <b>pbData</b> member. The <b>pbData</b> member byte string is the encoded extension.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := CRYPT_INTEGER_BLOB(this.ptr + 16)
            return this.__Value
        }
    }
}
