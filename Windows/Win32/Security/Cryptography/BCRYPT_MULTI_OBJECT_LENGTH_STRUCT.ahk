#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The BCRYPT_MULTI_OBJECT_LENGTH_STRUCT structure contains information to determine the size of the pbHashObject buffer for the BCryptCreateMultiHash function.
 * @remarks
 * The size of the <i>pbHashObject</i> buffer for the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptcreatemultihash">BCryptCreateMultiHash</a> function is the following: <c>cbPerObject + (number of hash states) * cbPerElement</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_multi_object_length_struct
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_MULTI_OBJECT_LENGTH_STRUCT {
    #StructPack 4

    /**
     * The number of bytes needed for the object overhead.
     */
    cbPerObject : UInt32

    /**
     * The number of bytes needed for each element of the object.
     */
    cbPerElement : UInt32

}
