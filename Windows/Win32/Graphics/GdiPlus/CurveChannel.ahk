#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct CurveChannel {
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
    static CurveChannelAll => 0

    /**
     * @type {Integer (Int32)}
     */
    static CurveChannelRed => 1

    /**
     * @type {Integer (Int32)}
     */
    static CurveChannelGreen => 2

    /**
     * @type {Integer (Int32)}
     */
    static CurveChannelBlue => 3
}
