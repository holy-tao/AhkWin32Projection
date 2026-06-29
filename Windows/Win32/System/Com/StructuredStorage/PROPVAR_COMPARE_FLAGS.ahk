#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct PROPVAR_COMPARE_FLAGS {
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
    static PVCF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static PVCF_TREATEMPTYASGREATERTHAN => 1

    /**
     * @type {Integer (Int32)}
     */
    static PVCF_USESTRCMP => 2

    /**
     * @type {Integer (Int32)}
     */
    static PVCF_USESTRCMPC => 4

    /**
     * @type {Integer (Int32)}
     */
    static PVCF_USESTRCMPI => 8

    /**
     * @type {Integer (Int32)}
     */
    static PVCF_USESTRCMPIC => 16

    /**
     * @type {Integer (Int32)}
     */
    static PVCF_DIGITSASNUMBERS_CASESENSITIVE => 32
}
