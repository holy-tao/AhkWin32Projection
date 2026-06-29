#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleMsTouchAction {
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
    static styleMsTouchActionNotSet => -1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionManipulation => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionDoubleTapZoom => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionPanX => 8

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionPanY => 16

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionPinchZoom => 32

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionCrossSlideX => 64

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionCrossSlideY => 128

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchAction_Max => 2147483647
}
