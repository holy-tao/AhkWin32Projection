#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPIDSPRG {
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
    static DISPID_SRGId => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGRecoContext => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGState => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGRules => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGReset => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGCommit => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGCmdLoadFromFile => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGCmdLoadFromObject => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGCmdLoadFromResource => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGCmdLoadFromMemory => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGCmdLoadFromProprietaryGrammar => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGCmdSetRuleState => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGCmdSetRuleIdState => 13

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGDictationLoad => 14

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGDictationUnload => 15

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGDictationSetState => 16

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGSetWordSequenceData => 17

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGSetTextSelection => 18

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRGIsPronounceable => 19
}
