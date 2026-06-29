#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MIRACAST_DISPLAY_DEVICE_STATE {
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
    static MiracastStopped => 0

    /**
     * @type {Integer (Int32)}
     */
    static MiracastStartPending => 1

    /**
     * @type {Integer (Int32)}
     */
    static MiracastStarted => 2

    /**
     * @type {Integer (Int32)}
     */
    static MiracastStopPending => 3
}
