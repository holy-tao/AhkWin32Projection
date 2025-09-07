#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the processor architectures supported by a package. (APPX_PACKAGE_ARCHITECTURE)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ne-appxpackaging-appx_package_architecture
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_PACKAGE_ARCHITECTURE{

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
