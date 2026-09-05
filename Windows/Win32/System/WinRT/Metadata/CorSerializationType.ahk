#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
class CorSerializationType extends Win32Enum {

    /**
     * Native name: SERIALIZATION_TYPE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * Native name: SERIALIZATION_TYPE_BOOLEAN
     * @type {Integer (Int32)}
     */
    static BOOLEAN => 2

    /**
     * Native name: SERIALIZATION_TYPE_CHAR
     * @type {Integer (Int32)}
     */
    static CHAR => 3

    /**
     * Native name: SERIALIZATION_TYPE_I1
     * @type {Integer (Int32)}
     */
    static I1 => 4

    /**
     * Native name: SERIALIZATION_TYPE_U1
     * @type {Integer (Int32)}
     */
    static U1 => 5

    /**
     * Native name: SERIALIZATION_TYPE_I2
     * @type {Integer (Int32)}
     */
    static I2 => 6

    /**
     * Native name: SERIALIZATION_TYPE_U2
     * @type {Integer (Int32)}
     */
    static U2 => 7

    /**
     * Native name: SERIALIZATION_TYPE_I4
     * @type {Integer (Int32)}
     */
    static I4 => 8

    /**
     * Native name: SERIALIZATION_TYPE_U4
     * @type {Integer (Int32)}
     */
    static U4 => 9

    /**
     * Native name: SERIALIZATION_TYPE_I8
     * @type {Integer (Int32)}
     */
    static I8 => 10

    /**
     * Native name: SERIALIZATION_TYPE_U8
     * @type {Integer (Int32)}
     */
    static U8 => 11

    /**
     * Native name: SERIALIZATION_TYPE_R4
     * @type {Integer (Int32)}
     */
    static R4 => 12

    /**
     * Native name: SERIALIZATION_TYPE_R8
     * @type {Integer (Int32)}
     */
    static R8 => 13

    /**
     * Native name: SERIALIZATION_TYPE_STRING
     * @type {Integer (Int32)}
     */
    static STRING => 14

    /**
     * Native name: SERIALIZATION_TYPE_SZARRAY
     * @type {Integer (Int32)}
     */
    static SZARRAY => 29

    /**
     * Native name: SERIALIZATION_TYPE_TYPE
     * @type {Integer (Int32)}
     */
    static TYPE => 80

    /**
     * Native name: SERIALIZATION_TYPE_TAGGED_OBJECT
     * @type {Integer (Int32)}
     */
    static TAGGED_OBJECT => 81

    /**
     * Native name: SERIALIZATION_TYPE_FIELD
     * @type {Integer (Int32)}
     */
    static FIELD => 83

    /**
     * Native name: SERIALIZATION_TYPE_PROPERTY
     * @type {Integer (Int32)}
     */
    static PROPERTY => 84

    /**
     * Native name: SERIALIZATION_TYPE_ENUM
     * @type {Integer (Int32)}
     */
    static ENUM => 85
}
