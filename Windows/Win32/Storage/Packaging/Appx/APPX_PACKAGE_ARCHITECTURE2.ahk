#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the processor architectures supported by a package.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/ne-appxpackaging-appx_package_architecture2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_PACKAGE_ARCHITECTURE2 extends Win32Enum{

    /**
     * The x86, 32-bit processor architecture.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_ARCHITECTURE2_X86 => 0

    /**
     * The ARM processor architecture.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_ARCHITECTURE2_ARM => 5

    /**
     * The x64, 64-bit processor architecture.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_ARCHITECTURE2_X64 => 9

    /**
     * Any  processor architecture.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_ARCHITECTURE2_NEUTRAL => 11

    /**
     * The 64-bit ARM processor architecture.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_ARCHITECTURE2_ARM64 => 12

    /**
     * A 32-bit app package that runs on a 64-bit ARM processor.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_ARCHITECTURE2_X86_ON_ARM64 => 14

    /**
     * Unknown app package architecture.
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGE_ARCHITECTURE2_UNKNOWN => 65535
}
