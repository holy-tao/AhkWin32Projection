#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct WDS_CLI_IMAGE_PARAM_TYPE {
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
    static WDS_CLI_IMAGE_PARAM_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static WDS_CLI_IMAGE_PARAM_SPARSE_FILE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WDS_CLI_IMAGE_PARAM_SUPPORTED_FIRMWARES => 2
}
