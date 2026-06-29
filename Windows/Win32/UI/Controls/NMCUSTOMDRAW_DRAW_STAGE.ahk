#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMCUSTOMDRAW_DRAW_STAGE {
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
    static CDDS_POSTPAINT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_PREERASE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_PREPAINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_ITEMPOSTERASE => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_ITEMPOSTPAINT => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_ITEMPREERASE => 65539

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_ITEMPREPAINT => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_SUBITEM => 131072
}
