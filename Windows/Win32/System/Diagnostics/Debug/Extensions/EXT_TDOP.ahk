#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class EXT_TDOP extends Win32Enum {

    /**
     * Native name: EXT_TDOP_COPY
     * @type {Integer (Int32)}
     */
    static COPY => 0

    /**
     * Native name: EXT_TDOP_RELEASE
     * @type {Integer (Int32)}
     */
    static RELEASE => 1

    /**
     * Native name: EXT_TDOP_SET_FROM_EXPR
     * @type {Integer (Int32)}
     */
    static SET_FROM_EXPR => 2

    /**
     * Native name: EXT_TDOP_SET_FROM_U64_EXPR
     * @type {Integer (Int32)}
     */
    static SET_FROM_U64_EXPR => 3

    /**
     * Native name: EXT_TDOP_GET_FIELD
     * @type {Integer (Int32)}
     */
    static GET_FIELD => 4

    /**
     * Native name: EXT_TDOP_EVALUATE
     * @type {Integer (Int32)}
     */
    static EVALUATE => 5

    /**
     * Native name: EXT_TDOP_GET_TYPE_NAME
     * @type {Integer (Int32)}
     */
    static GET_TYPE_NAME => 6

    /**
     * Native name: EXT_TDOP_OUTPUT_TYPE_NAME
     * @type {Integer (Int32)}
     */
    static OUTPUT_TYPE_NAME => 7

    /**
     * Native name: EXT_TDOP_OUTPUT_SIMPLE_VALUE
     * @type {Integer (Int32)}
     */
    static OUTPUT_SIMPLE_VALUE => 8

    /**
     * Native name: EXT_TDOP_OUTPUT_FULL_VALUE
     * @type {Integer (Int32)}
     */
    static OUTPUT_FULL_VALUE => 9

    /**
     * Native name: EXT_TDOP_HAS_FIELD
     * @type {Integer (Int32)}
     */
    static HAS_FIELD => 10

    /**
     * Native name: EXT_TDOP_GET_FIELD_OFFSET
     * @type {Integer (Int32)}
     */
    static GET_FIELD_OFFSET => 11

    /**
     * Native name: EXT_TDOP_GET_ARRAY_ELEMENT
     * @type {Integer (Int32)}
     */
    static GET_ARRAY_ELEMENT => 12

    /**
     * Native name: EXT_TDOP_GET_DEREFERENCE
     * @type {Integer (Int32)}
     */
    static GET_DEREFERENCE => 13

    /**
     * Native name: EXT_TDOP_GET_TYPE_SIZE
     * @type {Integer (Int32)}
     */
    static GET_TYPE_SIZE => 14

    /**
     * Native name: EXT_TDOP_OUTPUT_TYPE_DEFINITION
     * @type {Integer (Int32)}
     */
    static OUTPUT_TYPE_DEFINITION => 15

    /**
     * Native name: EXT_TDOP_GET_POINTER_TO
     * @type {Integer (Int32)}
     */
    static GET_POINTER_TO => 16

    /**
     * Native name: EXT_TDOP_SET_FROM_TYPE_ID_AND_U64
     * @type {Integer (Int32)}
     */
    static SET_FROM_TYPE_ID_AND_U64 => 17

    /**
     * Native name: EXT_TDOP_SET_PTR_FROM_TYPE_ID_AND_U64
     * @type {Integer (Int32)}
     */
    static SET_PTR_FROM_TYPE_ID_AND_U64 => 18

    /**
     * Native name: EXT_TDOP_COUNT
     * @type {Integer (Int32)}
     */
    static COUNT => 19
}
