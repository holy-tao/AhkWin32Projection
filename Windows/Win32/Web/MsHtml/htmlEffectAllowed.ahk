#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlEffectAllowed {
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
    static htmlEffectAllowedCopy => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlEffectAllowedLink => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlEffectAllowedMove => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlEffectAllowedCopyLink => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlEffectAllowedCopyMove => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlEffectAllowedLinkMove => 5

    /**
     * @type {Integer (Int32)}
     */
    static htmlEffectAllowedAll => 6

    /**
     * @type {Integer (Int32)}
     */
    static htmlEffectAllowedNone => 7

    /**
     * @type {Integer (Int32)}
     */
    static htmlEffectAllowedUninitialized => 8

    /**
     * @type {Integer (Int32)}
     */
    static htmlEffectAllowed_Max => 2147483647
}
