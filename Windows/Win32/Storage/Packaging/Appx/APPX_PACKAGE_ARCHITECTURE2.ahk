#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the processor architectures supported by a package. (APPX_PACKAGE_ARCHITECTURE2)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/ne-appxpackaging-appx_package_architecture2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class APPX_PACKAGE_ARCHITECTURE2 extends Win32Enum {

    /**
     * The x86, 32-bit processor architecture.
     * Native name: APPX_PACKAGE_ARCHITECTURE2_X86
     * @type {Integer (Int32)}
     */
    static X86 => 0

    /**
     * The ARM processor architecture.
     * Native name: APPX_PACKAGE_ARCHITECTURE2_ARM
     * @type {Integer (Int32)}
     */
    static ARM => 5

    /**
     * The x64, 64-bit processor architecture.
     * Native name: APPX_PACKAGE_ARCHITECTURE2_X64
     * @type {Integer (Int32)}
     */
    static X64 => 9

    /**
     * Any  processor architecture.
     * Native name: APPX_PACKAGE_ARCHITECTURE2_NEUTRAL
     * @type {Integer (Int32)}
     */
    static NEUTRAL => 11

    /**
     * The 64-bit ARM processor architecture.
     * Native name: APPX_PACKAGE_ARCHITECTURE2_ARM64
     * @type {Integer (Int32)}
     */
    static ARM64 => 12

    /**
     * A 32-bit app package that runs on a 64-bit ARM processor.
     * Native name: APPX_PACKAGE_ARCHITECTURE2_X86_ON_ARM64
     * @type {Integer (Int32)}
     */
    static X86_ON_ARM64 => 14

    /**
     * Unknown app package architecture.
     * Native name: APPX_PACKAGE_ARCHITECTURE2_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 65535
}
