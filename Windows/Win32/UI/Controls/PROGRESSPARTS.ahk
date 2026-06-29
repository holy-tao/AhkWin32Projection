#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PROGRESSPARTS {
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
    static PP_BAR => 1

    /**
     * @type {Integer (Int32)}
     */
    static PP_BARVERT => 2

    /**
     * @type {Integer (Int32)}
     */
    static PP_CHUNK => 3

    /**
     * @type {Integer (Int32)}
     */
    static PP_CHUNKVERT => 4

    /**
     * @type {Integer (Int32)}
     */
    static PP_FILL => 5

    /**
     * @type {Integer (Int32)}
     */
    static PP_FILLVERT => 6

    /**
     * @type {Integer (Int32)}
     */
    static PP_PULSEOVERLAY => 7

    /**
     * @type {Integer (Int32)}
     */
    static PP_MOVEOVERLAY => 8

    /**
     * @type {Integer (Int32)}
     */
    static PP_PULSEOVERLAYVERT => 9

    /**
     * @type {Integer (Int32)}
     */
    static PP_MOVEOVERLAYVERT => 10

    /**
     * @type {Integer (Int32)}
     */
    static PP_TRANSPARENTBAR => 11

    /**
     * @type {Integer (Int32)}
     */
    static PP_TRANSPARENTBARVERT => 12
}
