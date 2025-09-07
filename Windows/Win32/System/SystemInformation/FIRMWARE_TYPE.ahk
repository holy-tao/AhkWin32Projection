#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a firmware type.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-firmware_type
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class FIRMWARE_TYPE{

    /**
     * The firmware type is unknown.
     * @type {Integer (Int32)}
     */
    static FirmwareTypeUnknown => 0

    /**
     * The computer booted in legacy BIOS mode.
     * @type {Integer (Int32)}
     */
    static FirmwareTypeBios => 1

    /**
     * The computer booted in UEFI mode.
     * @type {Integer (Int32)}
     */
    static FirmwareTypeUefi => 2

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static FirmwareTypeMax => 3
}
