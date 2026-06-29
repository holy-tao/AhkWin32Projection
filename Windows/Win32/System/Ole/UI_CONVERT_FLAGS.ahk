#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct UI_CONVERT_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static CF_SHOWHELPBUTTON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CF_SETCONVERTDEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CF_SETACTIVATEDEFAULT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CF_SELECTCONVERTTO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CF_SELECTACTIVATEAS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CF_DISABLEDISPLAYASICON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CF_DISABLEACTIVATEAS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CF_HIDECHANGEICON => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CF_CONVERTONLY => 256
}
