#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MOVESIZE_OPERATION {
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
    static MSO_SIZE_LEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_RIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_TOP => 3

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_TOPLEFT => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_TOPRIGHT => 5

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_BOTTOM => 6

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_BOTTOMLEFT => 7

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_BOTTOMRIGHT => 8

    /**
     * @type {Integer (Int32)}
     */
    static MSO_MOVE => 9
}
