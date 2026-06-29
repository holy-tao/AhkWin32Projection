#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MSVidCtlButtonstate {
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
    static MSVIDCTL_LEFT_BUTTON => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_RIGHT_BUTTON => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_MIDDLE_BUTTON => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_X_BUTTON1 => 8

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_X_BUTTON2 => 16

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_SHIFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_CTRL => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSVIDCTL_ALT => 4
}
