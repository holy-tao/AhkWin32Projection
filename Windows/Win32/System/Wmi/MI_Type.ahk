#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * These values specify the data type of qualifiers, properties, references, parameters, and method return values for the CIM data types.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_type
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Type extends Win32Enum{

    /**
     * unsigned char
     * @type {Integer (Int32)}
     */
    static MI_BOOLEAN => 0

    /**
     * unsigned char
     * @type {Integer (Int32)}
     */
    static MI_UINT8 => 1

    /**
     * signed char
     * @type {Integer (Int32)}
     */
    static MI_SINT8 => 2

    /**
     * unsigned short
     * @type {Integer (Int32)}
     */
    static MI_UINT16 => 3

    /**
     * signed short
     * @type {Integer (Int32)}
     */
    static MI_SINT16 => 4

    /**
     * unsigned int
     * @type {Integer (Int32)}
     */
    static MI_UINT32 => 5

    /**
     * signed int
     * @type {Integer (Int32)}
     */
    static MI_SINT32 => 6

    /**
     * unsigned __int64
     * @type {Integer (Int32)}
     */
    static MI_UINT64 => 7

    /**
     * signed __int64
     * @type {Integer (Int32)}
     */
    static MI_SINT64 => 8

    /**
     * float
     * @type {Integer (Int32)}
     */
    static MI_REAL32 => 9

    /**
     * double
     * @type {Integer (Int32)}
     */
    static MI_REAL64 => 10

    /**
     * unsigned short
     * @type {Integer (Int32)}
     */
    static MI_CHAR16 => 11

    /**
     * Structure holding a union of <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_timestamp">MI_Timestamp</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_interval">MI_Interval</a>.
     * @type {Integer (Int32)}
     */
    static MI_DATETIME => 12

    /**
     * MI_CHAR*
     * @type {Integer (Int32)}
     */
    static MI_STRING => 13

    /**
     * This is encoded as an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instance">MI_Instance</a>, but usually only the key properties are set.
     * @type {Integer (Int32)}
     */
    static MI_REFERENCE => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MI_INSTANCE => 15

    /**
     * Array of <b>MI_BOOLEAN</b> types.
     * @type {Integer (Int32)}
     */
    static MI_BOOLEANA => 16

    /**
     * Array of <b>MI_UINT8</b> types.
     * @type {Integer (Int32)}
     */
    static MI_UINT8A => 17

    /**
     * Array of <b>MI_SINT8</b> types.
     * @type {Integer (Int32)}
     */
    static MI_SINT8A => 18

    /**
     * Array of <b>MI_UINT16</b> types.
     * @type {Integer (Int32)}
     */
    static MI_UINT16A => 19

    /**
     * Array of <b>MI_SINT16</b> types.
     * @type {Integer (Int32)}
     */
    static MI_SINT16A => 20

    /**
     * Array of <b>MI_UINT32</b> types.
     * @type {Integer (Int32)}
     */
    static MI_UINT32A => 21

    /**
     * Array of <b>MI_SINT32</b> types.
     * @type {Integer (Int32)}
     */
    static MI_SINT32A => 22

    /**
     * Array of <b>MI_UINT64</b> types.
     * @type {Integer (Int32)}
     */
    static MI_UINT64A => 23

    /**
     * Array of <b>MI_SINT64</b> types.
     * @type {Integer (Int32)}
     */
    static MI_SINT64A => 24

    /**
     * Array of <b>MI_REAL32</b> types.
     * @type {Integer (Int32)}
     */
    static MI_REAL32A => 25

    /**
     * Array of <b>MI_REAL64</b> types.
     * @type {Integer (Int32)}
     */
    static MI_REAL64A => 26

    /**
     * Array of <b>MI_CHAR16</b> types.
     * @type {Integer (Int32)}
     */
    static MI_CHAR16A => 27

    /**
     * Array of <b>MI_DATETIME</b> structures.
     * @type {Integer (Int32)}
     */
    static MI_DATETIMEA => 28

    /**
     * Array of <b>MI_STRING</b> types.
     * @type {Integer (Int32)}
     */
    static MI_STRINGA => 29

    /**
     * Array of <b>MI_REFERENCE</b> types.
     * @type {Integer (Int32)}
     */
    static MI_REFERENCEA => 30

    /**
     * Array of <b>MI_INSTANCE</b> types.
     * @type {Integer (Int32)}
     */
    static MI_INSTANCEA => 31

    /**
     * MI_ARRAY is not an actual type, rather this is the bit that signifies  the type is an array.
     * @type {Integer (Int32)}
     */
    static MI_ARRAY => 16
}
