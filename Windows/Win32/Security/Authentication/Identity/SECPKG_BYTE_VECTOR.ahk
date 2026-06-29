#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the byte vector information.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_byte_vector
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_BYTE_VECTOR {
    #StructPack 4

    /**
     * Each element is a byte.
     */
    ByteArrayOffset : UInt32

    /**
     * The length of the byte array.
     */
    ByteArrayLength : UInt16

}
