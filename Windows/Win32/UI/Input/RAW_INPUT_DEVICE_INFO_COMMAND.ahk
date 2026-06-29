#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input
 */
export default struct RAW_INPUT_DEVICE_INFO_COMMAND {
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
    static RIDI_PREPARSEDDATA => 536870917

    /**
     * @type {Integer (UInt32)}
     */
    static RIDI_DEVICENAME => 536870919

    /**
     * @type {Integer (UInt32)}
     */
    static RIDI_DEVICEINFO => 536870923
}
