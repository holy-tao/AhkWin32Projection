#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PSHED_PLUGIN_ENABLE_NOTIFY_ERRORS {
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
    static PshedPiEnableNotifyErrorCreateNotifyEvent => 1

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiEnableNotifyErrorCreateSystemThread => 2

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiEnableNotifyErrorMax => 3
}
