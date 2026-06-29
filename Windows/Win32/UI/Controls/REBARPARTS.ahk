#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct REBARPARTS {
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
    static RP_GRIPPER => 1

    /**
     * @type {Integer (Int32)}
     */
    static RP_GRIPPERVERT => 2

    /**
     * @type {Integer (Int32)}
     */
    static RP_BAND => 3

    /**
     * @type {Integer (Int32)}
     */
    static RP_CHEVRON => 4

    /**
     * @type {Integer (Int32)}
     */
    static RP_CHEVRONVERT => 5

    /**
     * @type {Integer (Int32)}
     */
    static RP_BACKGROUND => 6

    /**
     * @type {Integer (Int32)}
     */
    static RP_SPLITTER => 7

    /**
     * @type {Integer (Int32)}
     */
    static RP_SPLITTERVERT => 8
}
