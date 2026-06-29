#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlRules {
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
    static htmlRulesNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlRulesnone => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlRulesgroups => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlRulesrows => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlRulescols => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlRulesall => 5

    /**
     * @type {Integer (Int32)}
     */
    static htmlRules_Max => 2147483647
}
