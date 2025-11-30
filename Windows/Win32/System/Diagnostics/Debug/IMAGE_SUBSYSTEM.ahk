#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_SUBSYSTEM extends Win32Enum{

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_UNKNOWN => 0

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_NATIVE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_WINDOWS_GUI => 2

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_WINDOWS_CUI => 3

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_OS2_CUI => 5

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_POSIX_CUI => 7

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_NATIVE_WINDOWS => 8

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_WINDOWS_CE_GUI => 9

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_EFI_APPLICATION => 10

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER => 11

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER => 12

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_EFI_ROM => 13

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_XBOX => 14

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION => 16

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_SUBSYSTEM_XBOX_CODE_CATALOG => 17
}
