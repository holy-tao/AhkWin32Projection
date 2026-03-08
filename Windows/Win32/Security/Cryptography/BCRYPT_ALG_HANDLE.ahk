#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Win32Handle.ahk

/**
 * The provider will perform the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">Hash-Based Message Authentication Code</a> (HMAC) algorithm with the specified hash algorithm. This flag is only used by hash algorithm providers.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/nf-bcrypt-bcryptopenalgorithmprovider
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_ALG_HANDLE extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => [0]

    /**
     * @type {Pointer<Void>}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
