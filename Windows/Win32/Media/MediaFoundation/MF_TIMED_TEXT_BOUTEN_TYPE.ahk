#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TIMED_TEXT_BOUTEN_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_AUTO => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_FILLEDCIRCLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_OPENCIRCLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_FILLEDDOT => 4

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_OPENDOT => 5

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_FILLEDSESAME => 6

    /**
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_BOUTEN_TYPE_OPENSESAME => 7
}
