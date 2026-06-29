#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Contains an arbitrary list of encoded BLOBs.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_sequence_of_any
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_SEQUENCE_OF_ANY {
    #StructPack 8

    /**
     * Number of elements in the <b>rgValue</b> array.
     */
    cValue : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DER_BLOB</a> structures.
     */
    rgValue : CRYPT_INTEGER_BLOB.Ptr

}
