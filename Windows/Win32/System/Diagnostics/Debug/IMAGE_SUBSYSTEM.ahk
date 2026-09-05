#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class IMAGE_SUBSYSTEM extends Win32Enum {

    /**
     * Native name: IMAGE_SUBSYSTEM_UNKNOWN
     * @type {Integer (UInt16)}
     */
    static UNKNOWN => 0

    /**
     * Native name: IMAGE_SUBSYSTEM_NATIVE
     * @type {Integer (UInt16)}
     */
    static NATIVE => 1

    /**
     * Native name: IMAGE_SUBSYSTEM_WINDOWS_GUI
     * @type {Integer (UInt16)}
     */
    static WINDOWS_GUI => 2

    /**
     * Native name: IMAGE_SUBSYSTEM_WINDOWS_CUI
     * @type {Integer (UInt16)}
     */
    static WINDOWS_CUI => 3

    /**
     * Native name: IMAGE_SUBSYSTEM_OS2_CUI
     * @type {Integer (UInt16)}
     */
    static OS2_CUI => 5

    /**
     * Native name: IMAGE_SUBSYSTEM_POSIX_CUI
     * @type {Integer (UInt16)}
     */
    static POSIX_CUI => 7

    /**
     * Native name: IMAGE_SUBSYSTEM_NATIVE_WINDOWS
     * @type {Integer (UInt16)}
     */
    static NATIVE_WINDOWS => 8

    /**
     * Native name: IMAGE_SUBSYSTEM_WINDOWS_CE_GUI
     * @type {Integer (UInt16)}
     */
    static WINDOWS_CE_GUI => 9

    /**
     * Native name: IMAGE_SUBSYSTEM_EFI_APPLICATION
     * @type {Integer (UInt16)}
     */
    static EFI_APPLICATION => 10

    /**
     * Native name: IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER
     * @type {Integer (UInt16)}
     */
    static EFI_BOOT_SERVICE_DRIVER => 11

    /**
     * Native name: IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER
     * @type {Integer (UInt16)}
     */
    static EFI_RUNTIME_DRIVER => 12

    /**
     * Native name: IMAGE_SUBSYSTEM_EFI_ROM
     * @type {Integer (UInt16)}
     */
    static EFI_ROM => 13

    /**
     * Native name: IMAGE_SUBSYSTEM_XBOX
     * @type {Integer (UInt16)}
     */
    static XBOX => 14

    /**
     * Native name: IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION
     * @type {Integer (UInt16)}
     */
    static WINDOWS_BOOT_APPLICATION => 16

    /**
     * Native name: IMAGE_SUBSYSTEM_XBOX_CODE_CATALOG
     * @type {Integer (UInt16)}
     */
    static XBOX_CODE_CATALOG => 17
}
