#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UIA_HEADINGLEVEL_ID {
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
    static HeadingLevel_None => 80050

    /**
     * @type {Integer (Int32)}
     */
    static HeadingLevel1 => 80051

    /**
     * @type {Integer (Int32)}
     */
    static HeadingLevel2 => 80052

    /**
     * @type {Integer (Int32)}
     */
    static HeadingLevel3 => 80053

    /**
     * @type {Integer (Int32)}
     */
    static HeadingLevel4 => 80054

    /**
     * @type {Integer (Int32)}
     */
    static HeadingLevel5 => 80055

    /**
     * @type {Integer (Int32)}
     */
    static HeadingLevel6 => 80056

    /**
     * @type {Integer (Int32)}
     */
    static HeadingLevel7 => 80057

    /**
     * @type {Integer (Int32)}
     */
    static HeadingLevel8 => 80058

    /**
     * @type {Integer (Int32)}
     */
    static HeadingLevel9 => 80059
}
