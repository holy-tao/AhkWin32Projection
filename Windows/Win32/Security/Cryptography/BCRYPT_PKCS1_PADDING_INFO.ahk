#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Used to provide options for the PKCS
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ns-bcrypt-bcrypt_pkcs1_padding_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_PKCS1_PADDING_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode string that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic algorithm</a> to use to create the padding. This algorithm must be a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing algorithm</a>. When creating a signature, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) that corresponds to this algorithm is added to the <b>DigestInfo</b> element in the signature, and if this member is <b>NULL</b>, then the OID is not added. When verifying a signature, the verification fails if the OID that corresponds to this member is not the same as the OID in the signature. If there is no OID in the signature, then verification fails unless this member is <b>NULL</b>.
     * @type {PWSTR}
     */
    pszAlgId{
        get {
            if(!this.HasProp("__pszAlgId"))
                this.__pszAlgId := PWSTR(this.ptr + 0)
            return this.__pszAlgId
        }
    }
}
