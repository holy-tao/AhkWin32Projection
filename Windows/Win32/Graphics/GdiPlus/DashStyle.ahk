#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct DashStyle {
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
    static DashStyleSolid => 0

    /**
     * @type {Integer (Int32)}
     */
    static DashStyleDash => 1

    /**
     * @type {Integer (Int32)}
     */
    static DashStyleDot => 2

    /**
     * @type {Integer (Int32)}
     */
    static DashStyleDashDot => 3

    /**
     * @type {Integer (Int32)}
     */
    static DashStyleDashDotDot => 4

    /**
     * @type {Integer (Int32)}
     */
    static DashStyleCustom => 5
}
