#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CryptoAPI CRYPT_INTEGER_BLOB (dpapi.h) structure is used for an arbitrary array of bytes. It is declared in Wincrypt.h and provides flexibility for objects that can contain various data types. (CRYPT_INTEGER_BLOB)
 * @see https://learn.microsoft.com/windows/win32/api/dpapi/ns-dpapi-crypt_integer_blob
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_INTEGER_BLOB {
    #StructPack 8

    /**
     * The count of bytes in the buffer pointed to by <i>pbData</i>.
     */
    cbData : UInt32

    /**
     * A pointer to a block of data bytes.
     */
    pbData : IntPtr

}
