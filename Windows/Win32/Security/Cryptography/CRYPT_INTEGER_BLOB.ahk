#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CryptoAPI CRYPT_INTEGER_BLOB structure is used for an arbitrary array of bytes. It is declared in Wincrypt.h and provides flexibility for objects that can contain various data types.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_integer_blob
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_INTEGER_BLOB extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The count of bytes in the buffer pointed to by <i>pbData</i>.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a block of data bytes.
     * @type {Pointer<Integer>}
     */
    pbData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
