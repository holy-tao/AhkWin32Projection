#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_CHILD_DEVICE_HPD_AWARENESS {
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
    static HpdAwarenessUninitialized => 0

    /**
     * @type {Integer (Int32)}
     */
    static HpdAwarenessAlwaysConnected => 1

    /**
     * @type {Integer (Int32)}
     */
    static HpdAwarenessNone => 2

    /**
     * @type {Integer (Int32)}
     */
    static HpdAwarenessPolled => 3

    /**
     * @type {Integer (Int32)}
     */
    static HpdAwarenessInterruptible => 4
}
