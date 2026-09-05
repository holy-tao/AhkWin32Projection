#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UCharDirection extends Win32Enum {

    /**
     * Native name: U_LEFT_TO_RIGHT
     * @type {Integer (Int32)}
     */
    static LEFT_TO_RIGHT => 0

    /**
     * Native name: U_RIGHT_TO_LEFT
     * @type {Integer (Int32)}
     */
    static RIGHT_TO_LEFT => 1

    /**
     * Native name: U_EUROPEAN_NUMBER
     * @type {Integer (Int32)}
     */
    static EUROPEAN_NUMBER => 2

    /**
     * Native name: U_EUROPEAN_NUMBER_SEPARATOR
     * @type {Integer (Int32)}
     */
    static EUROPEAN_NUMBER_SEPARATOR => 3

    /**
     * Native name: U_EUROPEAN_NUMBER_TERMINATOR
     * @type {Integer (Int32)}
     */
    static EUROPEAN_NUMBER_TERMINATOR => 4

    /**
     * Native name: U_ARABIC_NUMBER
     * @type {Integer (Int32)}
     */
    static ARABIC_NUMBER => 5

    /**
     * Native name: U_COMMON_NUMBER_SEPARATOR
     * @type {Integer (Int32)}
     */
    static COMMON_NUMBER_SEPARATOR => 6

    /**
     * Native name: U_BLOCK_SEPARATOR
     * @type {Integer (Int32)}
     */
    static BLOCK_SEPARATOR => 7

    /**
     * Native name: U_SEGMENT_SEPARATOR
     * @type {Integer (Int32)}
     */
    static SEGMENT_SEPARATOR => 8

    /**
     * Native name: U_WHITE_SPACE_NEUTRAL
     * @type {Integer (Int32)}
     */
    static WHITE_SPACE_NEUTRAL => 9

    /**
     * Native name: U_OTHER_NEUTRAL
     * @type {Integer (Int32)}
     */
    static OTHER_NEUTRAL => 10

    /**
     * Native name: U_LEFT_TO_RIGHT_EMBEDDING
     * @type {Integer (Int32)}
     */
    static LEFT_TO_RIGHT_EMBEDDING => 11

    /**
     * Native name: U_LEFT_TO_RIGHT_OVERRIDE
     * @type {Integer (Int32)}
     */
    static LEFT_TO_RIGHT_OVERRIDE => 12

    /**
     * Native name: U_RIGHT_TO_LEFT_ARABIC
     * @type {Integer (Int32)}
     */
    static RIGHT_TO_LEFT_ARABIC => 13

    /**
     * Native name: U_RIGHT_TO_LEFT_EMBEDDING
     * @type {Integer (Int32)}
     */
    static RIGHT_TO_LEFT_EMBEDDING => 14

    /**
     * Native name: U_RIGHT_TO_LEFT_OVERRIDE
     * @type {Integer (Int32)}
     */
    static RIGHT_TO_LEFT_OVERRIDE => 15

    /**
     * Native name: U_POP_DIRECTIONAL_FORMAT
     * @type {Integer (Int32)}
     */
    static POP_DIRECTIONAL_FORMAT => 16

    /**
     * Native name: U_DIR_NON_SPACING_MARK
     * @type {Integer (Int32)}
     */
    static DIR_NON_SPACING_MARK => 17

    /**
     * Native name: U_BOUNDARY_NEUTRAL
     * @type {Integer (Int32)}
     */
    static BOUNDARY_NEUTRAL => 18

    /**
     * Native name: U_FIRST_STRONG_ISOLATE
     * @type {Integer (Int32)}
     */
    static FIRST_STRONG_ISOLATE => 19

    /**
     * Native name: U_LEFT_TO_RIGHT_ISOLATE
     * @type {Integer (Int32)}
     */
    static LEFT_TO_RIGHT_ISOLATE => 20

    /**
     * Native name: U_RIGHT_TO_LEFT_ISOLATE
     * @type {Integer (Int32)}
     */
    static RIGHT_TO_LEFT_ISOLATE => 21

    /**
     * Native name: U_POP_DIRECTIONAL_ISOLATE
     * @type {Integer (Int32)}
     */
    static POP_DIRECTIONAL_ISOLATE => 22
}
