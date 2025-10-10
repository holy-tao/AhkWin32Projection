#Requires AutoHotkey v2.0.0 64-bit

/**
 * Encrypted app package options.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/ne-appxpackaging-appx_encrypted_package_options
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_ENCRYPTED_PACKAGE_OPTIONS{

    /**
     * No options.
     * @type {Integer (Int32)}
     */
    static APPX_ENCRYPTED_PACKAGE_OPTION_NONE => 0

    /**
     * Option to use diffusion.
     * @type {Integer (Int32)}
     */
    static APPX_ENCRYPTED_PACKAGE_OPTION_DIFFUSION => 1

    /**
     * Option to add page hashes.
     * @type {Integer (Int32)}
     */
    static APPX_ENCRYPTED_PACKAGE_OPTION_PAGE_HASHING => 2
}
