#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The BCRYPT_MULTI_OBJECT_LENGTH_STRUCT structure contains information to determine the size of the pbHashObject buffer for the BCryptCreateMultiHash function.
 * @remarks
 * 
  * The size of the <i>pbHashObject</i> buffer for the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptcreatemultihash">BCryptCreateMultiHash</a> function is the following: <c>cbPerObject + (number of hash states) * cbPerElement</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bcrypt/ns-bcrypt-bcrypt_multi_object_length_struct
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_MULTI_OBJECT_LENGTH_STRUCT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of bytes needed for the object overhead.
     * @type {Integer}
     */
    cbPerObject {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of bytes needed for each element of the object.
     * @type {Integer}
     */
    cbPerElement {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
