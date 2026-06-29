#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct DEVELOPER_DRIVE_ENABLEMENT_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static DeveloperDriveEnablementStateError => 0

    /**
     * @type {Integer (Int32)}
     */
    static DeveloperDriveEnabled => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeveloperDriveDisabledBySystemPolicy => 2

    /**
     * @type {Integer (Int32)}
     */
    static DeveloperDriveDisabledByGroupPolicy => 3
}
