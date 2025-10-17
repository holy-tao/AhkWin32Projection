#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to provide options for the Optimal Asymmetric Encryption Padding (OAEP) scheme.
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ns-bcrypt-bcrypt_oaep_padding_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_OAEP_PADDING_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to a null-terminated Unicode string that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic algorithm</a> to use to create the padding. This algorithm must be a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing algorithm</a>.
     * @type {PWSTR}
     */
    pszAlgId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The address of a buffer that contains the data to use to create the padding. The <b>cbLabel</b> member contains the size of this buffer.
     * @type {Pointer<Byte>}
     */
    pbLabel {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Contains the number of bytes in the <b>pbLabel</b> buffer to use to create the padding.
     * @type {Integer}
     */
    cbLabel {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
