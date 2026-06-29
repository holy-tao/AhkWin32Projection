#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct BEHAVIOR_RELATION {
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
    static BEHAVIOR_FIRSTRELATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_SAMEELEMENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_PARENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_CHILD => 2

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_SIBLING => 3

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_LASTRELATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_RELATION_Max => 2147483647
}
