#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class FECMethod extends Win32Enum{

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
