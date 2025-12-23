#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_typeid extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_ARRAY => 97

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_BOOLEAN => 98

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_DOUBLE => 100

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_DICT_ENTRY => 101

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_SIGNATURE => 103

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_HANDLE => 104

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_INT32 => 105

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_INT16 => 110

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_OBJECT_PATH => 111

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_UINT16 => 113

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_STRUCT => 114

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_STRING => 115

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_UINT64 => 116

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_UINT32 => 117

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_VARIANT => 118

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_INT64 => 120

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_BYTE => 121

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_STRUCT_OPEN => 40

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_STRUCT_CLOSE => 41

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_DICT_ENTRY_OPEN => 123

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_DICT_ENTRY_CLOSE => 125

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_BOOLEAN_ARRAY => 25185

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_DOUBLE_ARRAY => 25697

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_INT32_ARRAY => 26977

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_INT16_ARRAY => 28257

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_UINT16_ARRAY => 29025

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_UINT64_ARRAY => 29793

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_UINT32_ARRAY => 30049

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_INT64_ARRAY => 30817

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_BYTE_ARRAY => 31073

    /**
     * @type {Integer (Int32)}
     */
    static ALLJOYN_WILDCARD => 42
}
