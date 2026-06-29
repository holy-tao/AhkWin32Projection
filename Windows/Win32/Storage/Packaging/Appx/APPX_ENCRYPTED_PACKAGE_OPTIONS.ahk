#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Encrypted app package options.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ne-appxpackaging-appx_encrypted_package_options
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct APPX_ENCRYPTED_PACKAGE_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
