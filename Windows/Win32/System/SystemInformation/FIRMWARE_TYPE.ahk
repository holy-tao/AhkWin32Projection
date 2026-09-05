#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a firmware type.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-firmware_type
 * @namespace Windows.Win32.System.SystemInformation
 */
class FIRMWARE_TYPE extends Win32Enum {

    /**
     * The firmware type is unknown.
     * Native name: FirmwareTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The computer booted in legacy BIOS mode.
     * Native name: FirmwareTypeBios
     * @type {Integer (Int32)}
     */
    static Bios => 1

    /**
     * The computer booted in UEFI mode.
     * Native name: FirmwareTypeUefi
     * @type {Integer (Int32)}
     */
    static Uefi => 2

    /**
     * Not implemented.
     * Native name: FirmwareTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 3
}
