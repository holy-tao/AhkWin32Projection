#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the short vector information.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_short_vector
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_SHORT_VECTOR {
    #StructPack 4

    /**
     * Each element is a short.
     */
    ShortArrayOffset : UInt32

    /**
     * The number of characters.
     */
    ShortArrayCount : UInt16

}
