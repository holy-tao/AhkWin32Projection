#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Contains an array of CRYPT_DATA_BLOB structures.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_blob_array
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_BLOB_ARRAY {
    #StructPack 8

    /**
     * The number of elements in the <b>rgBlob</b> array.
     */
    cBlob : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structures that contains the data blobs.
     */
    rgBlob : CRYPT_INTEGER_BLOB.Ptr

}
