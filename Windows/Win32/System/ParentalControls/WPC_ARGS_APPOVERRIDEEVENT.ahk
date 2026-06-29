#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct WPC_ARGS_APPOVERRIDEEVENT {
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
    static WPC_ARGS_APPOVERRIDEEVENT_USERID => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_APPOVERRIDEEVENT_PATH => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_APPOVERRIDEEVENT_REASON => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_APPOVERRIDEEVENT_CARGS => 3
}
