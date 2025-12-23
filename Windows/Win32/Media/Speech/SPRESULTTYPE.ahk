#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPRESULTTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPRT_CFG => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPRT_SLM => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPRT_PROPRIETARY => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPRT_FALSE_RECOGNITION => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPRT_TYPE_MASK => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPRT_EMULATED => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPRT_EXTENDABLE_PARSE => 16
}
