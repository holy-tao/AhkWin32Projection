#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct FIRMWARE_TABLE_PROVIDER {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static ACPI => 1094930505

    /**
     * @type {Integer (UInt32)}
     */
    static FIRM => 1179210317

    /**
     * @type {Integer (UInt32)}
     */
    static RSMB => 1381190978
}
