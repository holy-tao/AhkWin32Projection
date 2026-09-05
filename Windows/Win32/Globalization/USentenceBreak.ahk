#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class USentenceBreak extends Win32Enum {

    /**
     * Native name: U_SB_OTHER
     * @type {Integer (Int32)}
     */
    static SB_OTHER => 0

    /**
     * Native name: U_SB_ATERM
     * @type {Integer (Int32)}
     */
    static SB_ATERM => 1

    /**
     * Native name: U_SB_CLOSE
     * @type {Integer (Int32)}
     */
    static SB_CLOSE => 2

    /**
     * Native name: U_SB_FORMAT
     * @type {Integer (Int32)}
     */
    static SB_FORMAT => 3

    /**
     * Native name: U_SB_LOWER
     * @type {Integer (Int32)}
     */
    static SB_LOWER => 4

    /**
     * Native name: U_SB_NUMERIC
     * @type {Integer (Int32)}
     */
    static SB_NUMERIC => 5

    /**
     * Native name: U_SB_OLETTER
     * @type {Integer (Int32)}
     */
    static SB_OLETTER => 6

    /**
     * Native name: U_SB_SEP
     * @type {Integer (Int32)}
     */
    static SB_SEP => 7

    /**
     * Native name: U_SB_SP
     * @type {Integer (Int32)}
     */
    static SB_SP => 8

    /**
     * Native name: U_SB_STERM
     * @type {Integer (Int32)}
     */
    static SB_STERM => 9

    /**
     * Native name: U_SB_UPPER
     * @type {Integer (Int32)}
     */
    static SB_UPPER => 10

    /**
     * Native name: U_SB_CR
     * @type {Integer (Int32)}
     */
    static SB_CR => 11

    /**
     * Native name: U_SB_EXTEND
     * @type {Integer (Int32)}
     */
    static SB_EXTEND => 12

    /**
     * Native name: U_SB_LF
     * @type {Integer (Int32)}
     */
    static SB_LF => 13

    /**
     * Native name: U_SB_SCONTINUE
     * @type {Integer (Int32)}
     */
    static SB_SCONTINUE => 14
}
