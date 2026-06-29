#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct ObjectType {
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
    static ObjectTypeInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTypeBrush => 1

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTypePen => 2

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTypePath => 3

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTypeRegion => 4

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTypeImage => 5

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTypeFont => 6

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTypeStringFormat => 7

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTypeImageAttributes => 8

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTypeCustomLineCap => 9

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTypeGraphics => 10

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTypeMax => 10

    /**
     * @type {Integer (Int32)}
     */
    static ObjectTypeMin => 1
}
