#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMEREL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_NO => 1

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_GA => 2

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_WO => 3

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_NI => 4

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_DE => 5

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_YORI => 6

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_KARA => 7

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_MADE => 8

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_HE => 9

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_TO => 10

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_IDEOM => 11

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_FUKU_YOUGEN => 12

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_KEIYOU_YOUGEN => 13

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_KEIDOU1_YOUGEN => 14

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_KEIDOU2_YOUGEN => 15

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_TAIGEN => 16

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_YOUGEN => 17

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_RENTAI_MEI => 18

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_RENSOU => 19

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_KEIYOU_TO_YOUGEN => 20

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_KEIYOU_TARU_YOUGEN => 21

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_UNKNOWN1 => 22

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_UNKNOWN2 => 23

    /**
     * @type {Integer (Int32)}
     */
    static IFED_REL_ALL => 24
}
