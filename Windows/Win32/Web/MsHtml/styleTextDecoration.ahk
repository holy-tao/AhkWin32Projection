#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleTextDecoration {
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
    static styleTextDecorationNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleTextDecorationUnderline => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleTextDecorationOverline => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleTextDecorationLineThrough => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleTextDecorationBlink => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleTextDecoration_Max => 2147483647
}
