#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct PROPVAR_CHANGE_FLAGS {
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
    static PVCHF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static PVCHF_NOVALUEPROP => 1

    /**
     * @type {Integer (Int32)}
     */
    static PVCHF_ALPHABOOL => 2

    /**
     * @type {Integer (Int32)}
     */
    static PVCHF_NOUSEROVERRIDE => 4

    /**
     * @type {Integer (Int32)}
     */
    static PVCHF_LOCALBOOL => 8

    /**
     * @type {Integer (Int32)}
     */
    static PVCHF_NOHEXSTRING => 16
}
