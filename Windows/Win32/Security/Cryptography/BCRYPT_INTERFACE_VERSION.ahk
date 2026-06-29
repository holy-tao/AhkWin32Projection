#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains version information for a programmatic interface for a CNG provider.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcrypt_interface_version
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_INTERFACE_VERSION {
    #StructPack 2

    /**
     * The major version of the programmatic interface.
     */
    MajorVersion : UInt16

    /**
     * The minor version of the programmatic interface.
     */
    MinorVersion : UInt16

}
