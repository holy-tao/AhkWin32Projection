#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct WDS_CLI_FIRMWARE_TYPE {
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
    static WDS_CLI_FIRMWARE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static WDS_CLI_FIRMWARE_BIOS => 1

    /**
     * @type {Integer (Int32)}
     */
    static WDS_CLI_FIRMWARE_EFI => 2
}
