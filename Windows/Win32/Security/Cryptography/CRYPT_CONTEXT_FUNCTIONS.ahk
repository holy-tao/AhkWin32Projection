#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a set of cryptographic functions for a CNG configuration context.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-crypt_context_functions
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_CONTEXT_FUNCTIONS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of elements in the <b>rgpszFunctions</b> array.
     * @type {Integer}
     */
    cFunctions {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of pointers to null-terminated Unicode strings that contain the identifiers of the cryptographic functions contained in this set. The <b>cFunctions</b> member contains the number of elements in this array.
     * @type {Pointer<Char>}
     */
    rgpszFunctions {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
