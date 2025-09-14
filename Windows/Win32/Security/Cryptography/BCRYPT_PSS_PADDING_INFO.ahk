#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to provide options for the Probabilistic Signature Scheme (PSS) padding scheme.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_pss_padding_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_PSS_PADDING_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode string that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic algorithm</a> to use to create the padding. This algorithm must be a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing algorithm</a>.
     * @type {Pointer<PWSTR>}
     */
    pszAlgId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size, in bytes, of the random salt to use for the padding.
     * @type {Integer}
     */
    cbSalt {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
