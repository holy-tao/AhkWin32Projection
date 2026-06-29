#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct FECMethod {
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
    static BDA_FEC_METHOD_NOT_SET => -1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_FEC_METHOD_NOT_DEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_FEC_VITERBI => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_FEC_RS_204_188 => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDA_FEC_LDPC => 3

    /**
     * @type {Integer (Int32)}
     */
    static BDA_FEC_BCH => 4

    /**
     * @type {Integer (Int32)}
     */
    static BDA_FEC_RS_147_130 => 5

    /**
     * @type {Integer (Int32)}
     */
    static BDA_FEC_MAX => 6
}
