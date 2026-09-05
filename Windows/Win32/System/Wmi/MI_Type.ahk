#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * These values specify the data type of qualifiers, properties, references, parameters, and method return values for the CIM data types.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_type
 * @namespace Windows.Win32.System.Wmi
 */
class MI_Type extends Win32Enum {

    /**
     * unsigned char
     * Native name: MI_BOOLEAN
     * @type {Integer (Int32)}
     */
    static BOOLEAN => 0

    /**
     * unsigned char
     * Native name: MI_UINT8
     * @type {Integer (Int32)}
     */
    static UINT8 => 1

    /**
     * signed char
     * Native name: MI_SINT8
     * @type {Integer (Int32)}
     */
    static SINT8 => 2

    /**
     * unsigned short
     * Native name: MI_UINT16
     * @type {Integer (Int32)}
     */
    static UINT16 => 3

    /**
     * signed short
     * Native name: MI_SINT16
     * @type {Integer (Int32)}
     */
    static SINT16 => 4

    /**
     * unsigned int
     * Native name: MI_UINT32
     * @type {Integer (Int32)}
     */
    static UINT32 => 5

    /**
     * signed int
     * Native name: MI_SINT32
     * @type {Integer (Int32)}
     */
    static SINT32 => 6

    /**
     * unsigned __int64
     * Native name: MI_UINT64
     * @type {Integer (Int32)}
     */
    static UINT64 => 7

    /**
     * signed __int64
     * Native name: MI_SINT64
     * @type {Integer (Int32)}
     */
    static SINT64 => 8

    /**
     * float
     * Native name: MI_REAL32
     * @type {Integer (Int32)}
     */
    static REAL32 => 9

    /**
     * double
     * Native name: MI_REAL64
     * @type {Integer (Int32)}
     */
    static REAL64 => 10

    /**
     * unsigned short
     * Native name: MI_CHAR16
     * @type {Integer (Int32)}
     */
    static CHAR16 => 11

    /**
     * Structure holding a union of <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_timestamp">MI_Timestamp</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_interval">MI_Interval</a>.
     * Native name: MI_DATETIME
     * @type {Integer (Int32)}
     */
    static DATETIME => 12

    /**
     * MI_CHAR*
     * Native name: MI_STRING
     * @type {Integer (Int32)}
     */
    static STRING => 13

    /**
     * This is encoded as an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a>, but usually only the key properties are set.
     * Native name: MI_REFERENCE
     * @type {Integer (Int32)}
     */
    static REFERENCE => 14

    /**
     * Native name: MI_INSTANCE
     * @type {Integer (Int32)}
     */
    static INSTANCE => 15

    /**
     * Array of <b>MI_BOOLEAN</b> types.
     * Native name: MI_BOOLEANA
     * @type {Integer (Int32)}
     */
    static BOOLEANA => 16

    /**
     * Array of <b>MI_UINT8</b> types.
     * Native name: MI_UINT8A
     * @type {Integer (Int32)}
     */
    static UINT8A => 17

    /**
     * Array of <b>MI_SINT8</b> types.
     * Native name: MI_SINT8A
     * @type {Integer (Int32)}
     */
    static SINT8A => 18

    /**
     * Array of <b>MI_UINT16</b> types.
     * Native name: MI_UINT16A
     * @type {Integer (Int32)}
     */
    static UINT16A => 19

    /**
     * Array of <b>MI_SINT16</b> types.
     * Native name: MI_SINT16A
     * @type {Integer (Int32)}
     */
    static SINT16A => 20

    /**
     * Array of <b>MI_UINT32</b> types.
     * Native name: MI_UINT32A
     * @type {Integer (Int32)}
     */
    static UINT32A => 21

    /**
     * Array of <b>MI_SINT32</b> types.
     * Native name: MI_SINT32A
     * @type {Integer (Int32)}
     */
    static SINT32A => 22

    /**
     * Array of <b>MI_UINT64</b> types.
     * Native name: MI_UINT64A
     * @type {Integer (Int32)}
     */
    static UINT64A => 23

    /**
     * Array of <b>MI_SINT64</b> types.
     * Native name: MI_SINT64A
     * @type {Integer (Int32)}
     */
    static SINT64A => 24

    /**
     * Array of <b>MI_REAL32</b> types.
     * Native name: MI_REAL32A
     * @type {Integer (Int32)}
     */
    static REAL32A => 25

    /**
     * Array of <b>MI_REAL64</b> types.
     * Native name: MI_REAL64A
     * @type {Integer (Int32)}
     */
    static REAL64A => 26

    /**
     * Array of <b>MI_CHAR16</b> types.
     * Native name: MI_CHAR16A
     * @type {Integer (Int32)}
     */
    static CHAR16A => 27

    /**
     * Array of <b>MI_DATETIME</b> structures.
     * Native name: MI_DATETIMEA
     * @type {Integer (Int32)}
     */
    static DATETIMEA => 28

    /**
     * Array of <b>MI_STRING</b> types.
     * Native name: MI_STRINGA
     * @type {Integer (Int32)}
     */
    static STRINGA => 29

    /**
     * Array of <b>MI_REFERENCE</b> types.
     * Native name: MI_REFERENCEA
     * @type {Integer (Int32)}
     */
    static REFERENCEA => 30

    /**
     * Array of <b>MI_INSTANCE</b> types.
     * Native name: MI_INSTANCEA
     * @type {Integer (Int32)}
     */
    static INSTANCEA => 31

    /**
     * MI_ARRAY is not an actual type, rather this is the bit that signifies  the type is an array.
     * Native name: MI_ARRAY
     * @type {Integer (Int32)}
     */
    static ARRAY => 16
}
