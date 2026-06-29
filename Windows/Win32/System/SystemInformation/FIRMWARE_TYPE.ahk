#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a firmware type.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-firmware_type
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct FIRMWARE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
