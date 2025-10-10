#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a prioritized array of supported capabilities.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_smime_capabilities
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_SMIME_CAPABILITIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Count of elements in the <b>rgCapability</b> array.
     * @type {Integer}
     */
    cCapability {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Prioritized array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_smime_capability">CRYPT_SMIME_CAPABILITY</a> structures each indicating a capability or preference of a user.
     * @type {Pointer<CRYPT_SMIME_CAPABILITY>}
     */
    rgCapability {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
