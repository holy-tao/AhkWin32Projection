#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UCharDirection extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static U_LEFT_TO_RIGHT => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_RIGHT_TO_LEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_EUROPEAN_NUMBER => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_EUROPEAN_NUMBER_SEPARATOR => 3

    /**
     * @type {Integer (Int32)}
     */
    static U_EUROPEAN_NUMBER_TERMINATOR => 4

    /**
     * @type {Integer (Int32)}
     */
    static U_ARABIC_NUMBER => 5

    /**
     * @type {Integer (Int32)}
     */
    static U_COMMON_NUMBER_SEPARATOR => 6

    /**
     * @type {Integer (Int32)}
     */
    static U_BLOCK_SEPARATOR => 7

    /**
     * @type {Integer (Int32)}
     */
    static U_SEGMENT_SEPARATOR => 8

    /**
     * @type {Integer (Int32)}
     */
    static U_WHITE_SPACE_NEUTRAL => 9

    /**
     * @type {Integer (Int32)}
     */
    static U_OTHER_NEUTRAL => 10

    /**
     * @type {Integer (Int32)}
     */
    static U_LEFT_TO_RIGHT_EMBEDDING => 11

    /**
     * @type {Integer (Int32)}
     */
    static U_LEFT_TO_RIGHT_OVERRIDE => 12

    /**
     * @type {Integer (Int32)}
     */
    static U_RIGHT_TO_LEFT_ARABIC => 13

    /**
     * @type {Integer (Int32)}
     */
    static U_RIGHT_TO_LEFT_EMBEDDING => 14

    /**
     * @type {Integer (Int32)}
     */
    static U_RIGHT_TO_LEFT_OVERRIDE => 15

    /**
     * @type {Integer (Int32)}
     */
    static U_POP_DIRECTIONAL_FORMAT => 16

    /**
     * @type {Integer (Int32)}
     */
    static U_DIR_NON_SPACING_MARK => 17

    /**
     * @type {Integer (Int32)}
     */
    static U_BOUNDARY_NEUTRAL => 18

    /**
     * @type {Integer (Int32)}
     */
    static U_FIRST_STRONG_ISOLATE => 19

    /**
     * @type {Integer (Int32)}
     */
    static U_LEFT_TO_RIGHT_ISOLATE => 20

    /**
     * @type {Integer (Int32)}
     */
    static U_RIGHT_TO_LEFT_ISOLATE => 21

    /**
     * @type {Integer (Int32)}
     */
    static U_POP_DIRECTIONAL_ISOLATE => 22
}
