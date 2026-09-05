#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
class alljoyn_typeid extends Win32Enum {

    /**
     * Native name: ALLJOYN_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * Native name: ALLJOYN_ARRAY
     * @type {Integer (Int32)}
     */
    static ARRAY => 97

    /**
     * Native name: ALLJOYN_BOOLEAN
     * @type {Integer (Int32)}
     */
    static BOOLEAN => 98

    /**
     * Native name: ALLJOYN_DOUBLE
     * @type {Integer (Int32)}
     */
    static DOUBLE => 100

    /**
     * Native name: ALLJOYN_DICT_ENTRY
     * @type {Integer (Int32)}
     */
    static DICT_ENTRY => 101

    /**
     * Native name: ALLJOYN_SIGNATURE
     * @type {Integer (Int32)}
     */
    static SIGNATURE => 103

    /**
     * Native name: ALLJOYN_HANDLE
     * @type {Integer (Int32)}
     */
    static HANDLE => 104

    /**
     * Native name: ALLJOYN_INT32
     * @type {Integer (Int32)}
     */
    static INT32 => 105

    /**
     * Native name: ALLJOYN_INT16
     * @type {Integer (Int32)}
     */
    static INT16 => 110

    /**
     * Native name: ALLJOYN_OBJECT_PATH
     * @type {Integer (Int32)}
     */
    static OBJECT_PATH => 111

    /**
     * Native name: ALLJOYN_UINT16
     * @type {Integer (Int32)}
     */
    static UINT16 => 113

    /**
     * Native name: ALLJOYN_STRUCT
     * @type {Integer (Int32)}
     */
    static STRUCT => 114

    /**
     * Native name: ALLJOYN_STRING
     * @type {Integer (Int32)}
     */
    static STRING => 115

    /**
     * Native name: ALLJOYN_UINT64
     * @type {Integer (Int32)}
     */
    static UINT64 => 116

    /**
     * Native name: ALLJOYN_UINT32
     * @type {Integer (Int32)}
     */
    static UINT32 => 117

    /**
     * Native name: ALLJOYN_VARIANT
     * @type {Integer (Int32)}
     */
    static VARIANT => 118

    /**
     * Native name: ALLJOYN_INT64
     * @type {Integer (Int32)}
     */
    static INT64 => 120

    /**
     * Native name: ALLJOYN_BYTE
     * @type {Integer (Int32)}
     */
    static BYTE => 121

    /**
     * Native name: ALLJOYN_STRUCT_OPEN
     * @type {Integer (Int32)}
     */
    static STRUCT_OPEN => 40

    /**
     * Native name: ALLJOYN_STRUCT_CLOSE
     * @type {Integer (Int32)}
     */
    static STRUCT_CLOSE => 41

    /**
     * Native name: ALLJOYN_DICT_ENTRY_OPEN
     * @type {Integer (Int32)}
     */
    static DICT_ENTRY_OPEN => 123

    /**
     * Native name: ALLJOYN_DICT_ENTRY_CLOSE
     * @type {Integer (Int32)}
     */
    static DICT_ENTRY_CLOSE => 125

    /**
     * Native name: ALLJOYN_BOOLEAN_ARRAY
     * @type {Integer (Int32)}
     */
    static BOOLEAN_ARRAY => 25185

    /**
     * Native name: ALLJOYN_DOUBLE_ARRAY
     * @type {Integer (Int32)}
     */
    static DOUBLE_ARRAY => 25697

    /**
     * Native name: ALLJOYN_INT32_ARRAY
     * @type {Integer (Int32)}
     */
    static INT32_ARRAY => 26977

    /**
     * Native name: ALLJOYN_INT16_ARRAY
     * @type {Integer (Int32)}
     */
    static INT16_ARRAY => 28257

    /**
     * Native name: ALLJOYN_UINT16_ARRAY
     * @type {Integer (Int32)}
     */
    static UINT16_ARRAY => 29025

    /**
     * Native name: ALLJOYN_UINT64_ARRAY
     * @type {Integer (Int32)}
     */
    static UINT64_ARRAY => 29793

    /**
     * Native name: ALLJOYN_UINT32_ARRAY
     * @type {Integer (Int32)}
     */
    static UINT32_ARRAY => 30049

    /**
     * Native name: ALLJOYN_INT64_ARRAY
     * @type {Integer (Int32)}
     */
    static INT64_ARRAY => 30817

    /**
     * Native name: ALLJOYN_BYTE_ARRAY
     * @type {Integer (Int32)}
     */
    static BYTE_ARRAY => 31073

    /**
     * Native name: ALLJOYN_WILDCARD
     * @type {Integer (Int32)}
     */
    static WILDCARD => 42
}
