#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleMsAnimationPlayState {
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
    static styleMsAnimationPlayStateRunning => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationPlayStatePaused => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationPlayStateNotSet => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsAnimationPlayState_Max => 2147483647
}
