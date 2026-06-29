#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_Comp_Flags {
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
    static BDACOMP_NOT_DEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDACOMP_EXCLUDE_TS_FROM_TR => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDACOMP_INCLUDE_LOCATOR_IN_TR => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDACOMP_INCLUDE_COMPONENTS_IN_TR => 4
}
