#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DELIVERY_AGENT_FLAGS {
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
    static DELIVERY_AGENT_FLAG_NO_BROADCAST => 4

    /**
     * @type {Integer (Int32)}
     */
    static DELIVERY_AGENT_FLAG_NO_RESTRICTIONS => 8

    /**
     * @type {Integer (Int32)}
     */
    static DELIVERY_AGENT_FLAG_SILENT_DIAL => 16
}
