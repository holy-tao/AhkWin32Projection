#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct OSPCOMP {
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
    static OSPCOMP_EQ => 1

    /**
     * @type {Integer (Int32)}
     */
    static OSPCOMP_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static OSPCOMP_LT => 2

    /**
     * @type {Integer (Int32)}
     */
    static OSPCOMP_LE => 3

    /**
     * @type {Integer (Int32)}
     */
    static OSPCOMP_GE => 4

    /**
     * @type {Integer (Int32)}
     */
    static OSPCOMP_GT => 5

    /**
     * @type {Integer (Int32)}
     */
    static OSPCOMP_NE => 6
}
