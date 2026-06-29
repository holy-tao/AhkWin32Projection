#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct FLYOUTPARTS {
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
    static FLYOUT_HEADER => 1

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_BODY => 2

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_LABEL => 3

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_LINK => 4

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_DIVIDER => 5

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_WINDOW => 6

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_LINKAREA => 7

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_LINKHEADER => 8
}
