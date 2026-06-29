#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PFN_WDS_CLI_CALLBACK_MESSAGE_ID {
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
    static WDS_CLI_MSG_START => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_CLI_MSG_COMPLETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_CLI_MSG_PROGRESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_CLI_MSG_TEXT => 3
}
