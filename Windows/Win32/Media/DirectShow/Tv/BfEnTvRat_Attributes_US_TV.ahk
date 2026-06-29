#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct BfEnTvRat_Attributes_US_TV {
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
    static US_TV_IsBlocked => 1

    /**
     * @type {Integer (Int32)}
     */
    static US_TV_IsViolent => 2

    /**
     * @type {Integer (Int32)}
     */
    static US_TV_IsSexualSituation => 4

    /**
     * @type {Integer (Int32)}
     */
    static US_TV_IsAdultLanguage => 8

    /**
     * @type {Integer (Int32)}
     */
    static US_TV_IsSexuallySuggestiveDialog => 16

    /**
     * @type {Integer (Int32)}
     */
    static US_TV_ValidAttrSubmask => 31
}
