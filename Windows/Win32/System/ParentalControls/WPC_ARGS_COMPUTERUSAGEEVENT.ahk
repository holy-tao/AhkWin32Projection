#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct WPC_ARGS_COMPUTERUSAGEEVENT {
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
    static WPC_ARGS_COMPUTERUSAGEEVENT_ID => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_COMPUTERUSAGEEVENT_TIMEUSED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_COMPUTERUSAGEEVENT_CARGS => 2
}
