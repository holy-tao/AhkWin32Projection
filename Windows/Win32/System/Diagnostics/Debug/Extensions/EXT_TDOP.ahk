#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class EXT_TDOP extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_COPY => 0

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_RELEASE => 1

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_SET_FROM_EXPR => 2

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_SET_FROM_U64_EXPR => 3

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_GET_FIELD => 4

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_EVALUATE => 5

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_GET_TYPE_NAME => 6

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_OUTPUT_TYPE_NAME => 7

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_OUTPUT_SIMPLE_VALUE => 8

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_OUTPUT_FULL_VALUE => 9

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_HAS_FIELD => 10

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_GET_FIELD_OFFSET => 11

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_GET_ARRAY_ELEMENT => 12

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_GET_DEREFERENCE => 13

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_GET_TYPE_SIZE => 14

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_OUTPUT_TYPE_DEFINITION => 15

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_GET_POINTER_TO => 16

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_SET_FROM_TYPE_ID_AND_U64 => 17

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_SET_PTR_FROM_TYPE_ID_AND_U64 => 18

    /**
     * @type {Integer (Int32)}
     */
    static EXT_TDOP_COUNT => 19
}
