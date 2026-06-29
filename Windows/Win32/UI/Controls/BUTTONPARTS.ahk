#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct BUTTONPARTS {
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
    static BP_PUSHBUTTON => 1

    /**
     * @type {Integer (Int32)}
     */
    static BP_RADIOBUTTON => 2

    /**
     * @type {Integer (Int32)}
     */
    static BP_CHECKBOX => 3

    /**
     * @type {Integer (Int32)}
     */
    static BP_GROUPBOX => 4

    /**
     * @type {Integer (Int32)}
     */
    static BP_USERBUTTON => 5

    /**
     * @type {Integer (Int32)}
     */
    static BP_COMMANDLINK => 6

    /**
     * @type {Integer (Int32)}
     */
    static BP_COMMANDLINKGLYPH => 7

    /**
     * @type {Integer (Int32)}
     */
    static BP_RADIOBUTTON_HCDISABLED => 8

    /**
     * @type {Integer (Int32)}
     */
    static BP_CHECKBOX_HCDISABLED => 9

    /**
     * @type {Integer (Int32)}
     */
    static BP_GROUPBOX_HCDISABLED => 10

    /**
     * @type {Integer (Int32)}
     */
    static BP_PUSHBUTTONDROPDOWN => 11
}
