#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkTransform {
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
    static DISPID_ITReset => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITTranslate => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITRotate => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITReflect => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITShear => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITScale => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITeM11 => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITeM12 => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITeM21 => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITeM22 => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITeDx => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITeDy => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITGetTransform => 13

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITSetTransform => 14

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITData => 15
}
