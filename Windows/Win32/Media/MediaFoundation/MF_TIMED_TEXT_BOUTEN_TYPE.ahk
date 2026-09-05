#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_TIMED_TEXT_BOUTEN_TYPE extends Win32Enum {

    /**
     * Native name: MF_TIMED_TEXT_BOUTEN_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: MF_TIMED_TEXT_BOUTEN_TYPE_AUTO
     * @type {Integer (Int32)}
     */
    static AUTO => 1

    /**
     * Native name: MF_TIMED_TEXT_BOUTEN_TYPE_FILLEDCIRCLE
     * @type {Integer (Int32)}
     */
    static FILLEDCIRCLE => 2

    /**
     * Native name: MF_TIMED_TEXT_BOUTEN_TYPE_OPENCIRCLE
     * @type {Integer (Int32)}
     */
    static OPENCIRCLE => 3

    /**
     * Native name: MF_TIMED_TEXT_BOUTEN_TYPE_FILLEDDOT
     * @type {Integer (Int32)}
     */
    static FILLEDDOT => 4

    /**
     * Native name: MF_TIMED_TEXT_BOUTEN_TYPE_OPENDOT
     * @type {Integer (Int32)}
     */
    static OPENDOT => 5

    /**
     * Native name: MF_TIMED_TEXT_BOUTEN_TYPE_FILLEDSESAME
     * @type {Integer (Int32)}
     */
    static FILLEDSESAME => 6

    /**
     * Native name: MF_TIMED_TEXT_BOUTEN_TYPE_OPENSESAME
     * @type {Integer (Int32)}
     */
    static OPENSESAME => 7
}
