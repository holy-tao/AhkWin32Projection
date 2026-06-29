#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the processor architectures supported by a package. (APPX_PACKAGE_ARCHITECTURE)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ne-appxpackaging-appx_package_architecture
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct APPX_PACKAGE_ARCHITECTURE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The x86 processor architecture.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_ARCHITECTURE_X86 => 0

    /**
     * The ARM processor architecture.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_ARCHITECTURE_ARM => 5

    /**
     * The x64 processor architecture.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_ARCHITECTURE_X64 => 9

    /**
     * Any  processor architecture.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_ARCHITECTURE_NEUTRAL => 11

    /**
     * The 64-bit ARM processor architecture.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_ARCHITECTURE_ARM64 => 12
}
