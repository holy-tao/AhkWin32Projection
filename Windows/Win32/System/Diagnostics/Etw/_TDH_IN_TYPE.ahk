#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class _TDH_IN_TYPE extends Win32Enum {

    /**
     * Native name: TDH_INTYPE_NULL
     * @type {Integer (Int32)}
     */
    static INTYPE_NULL => 0

    /**
     * Native name: TDH_INTYPE_UNICODESTRING
     * @type {Integer (Int32)}
     */
    static INTYPE_UNICODESTRING => 1

    /**
     * Native name: TDH_INTYPE_ANSISTRING
     * @type {Integer (Int32)}
     */
    static INTYPE_ANSISTRING => 2

    /**
     * Native name: TDH_INTYPE_INT8
     * @type {Integer (Int32)}
     */
    static INTYPE_INT8 => 3

    /**
     * Native name: TDH_INTYPE_UINT8
     * @type {Integer (Int32)}
     */
    static INTYPE_UINT8 => 4

    /**
     * Native name: TDH_INTYPE_INT16
     * @type {Integer (Int32)}
     */
    static INTYPE_INT16 => 5

    /**
     * Native name: TDH_INTYPE_UINT16
     * @type {Integer (Int32)}
     */
    static INTYPE_UINT16 => 6

    /**
     * Native name: TDH_INTYPE_INT32
     * @type {Integer (Int32)}
     */
    static INTYPE_INT32 => 7

    /**
     * Native name: TDH_INTYPE_UINT32
     * @type {Integer (Int32)}
     */
    static INTYPE_UINT32 => 8

    /**
     * Native name: TDH_INTYPE_INT64
     * @type {Integer (Int32)}
     */
    static INTYPE_INT64 => 9

    /**
     * Native name: TDH_INTYPE_UINT64
     * @type {Integer (Int32)}
     */
    static INTYPE_UINT64 => 10

    /**
     * Native name: TDH_INTYPE_FLOAT
     * @type {Integer (Int32)}
     */
    static INTYPE_FLOAT => 11

    /**
     * Native name: TDH_INTYPE_DOUBLE
     * @type {Integer (Int32)}
     */
    static INTYPE_DOUBLE => 12

    /**
     * Native name: TDH_INTYPE_BOOLEAN
     * @type {Integer (Int32)}
     */
    static INTYPE_BOOLEAN => 13

    /**
     * Native name: TDH_INTYPE_BINARY
     * @type {Integer (Int32)}
     */
    static INTYPE_BINARY => 14

    /**
     * Native name: TDH_INTYPE_GUID
     * @type {Integer (Int32)}
     */
    static INTYPE_GUID => 15

    /**
     * Native name: TDH_INTYPE_POINTER
     * @type {Integer (Int32)}
     */
    static INTYPE_POINTER => 16

    /**
     * Native name: TDH_INTYPE_FILETIME
     * @type {Integer (Int32)}
     */
    static INTYPE_FILETIME => 17

    /**
     * Native name: TDH_INTYPE_SYSTEMTIME
     * @type {Integer (Int32)}
     */
    static INTYPE_SYSTEMTIME => 18

    /**
     * Native name: TDH_INTYPE_SID
     * @type {Integer (Int32)}
     */
    static INTYPE_SID => 19

    /**
     * Native name: TDH_INTYPE_HEXINT32
     * @type {Integer (Int32)}
     */
    static INTYPE_HEXINT32 => 20

    /**
     * Native name: TDH_INTYPE_HEXINT64
     * @type {Integer (Int32)}
     */
    static INTYPE_HEXINT64 => 21

    /**
     * Native name: TDH_INTYPE_MANIFEST_COUNTEDSTRING
     * @type {Integer (Int32)}
     */
    static INTYPE_MANIFEST_COUNTEDSTRING => 22

    /**
     * Native name: TDH_INTYPE_MANIFEST_COUNTEDANSISTRING
     * @type {Integer (Int32)}
     */
    static INTYPE_MANIFEST_COUNTEDANSISTRING => 23

    /**
     * Native name: TDH_INTYPE_RESERVED24
     * @type {Integer (Int32)}
     */
    static INTYPE_RESERVED24 => 24

    /**
     * Native name: TDH_INTYPE_MANIFEST_COUNTEDBINARY
     * @type {Integer (Int32)}
     */
    static INTYPE_MANIFEST_COUNTEDBINARY => 25

    /**
     * Native name: TDH_INTYPE_COUNTEDSTRING
     * @type {Integer (Int32)}
     */
    static INTYPE_COUNTEDSTRING => 300

    /**
     * Native name: TDH_INTYPE_COUNTEDANSISTRING
     * @type {Integer (Int32)}
     */
    static INTYPE_COUNTEDANSISTRING => 301

    /**
     * Native name: TDH_INTYPE_REVERSEDCOUNTEDSTRING
     * @type {Integer (Int32)}
     */
    static INTYPE_REVERSEDCOUNTEDSTRING => 302

    /**
     * Native name: TDH_INTYPE_REVERSEDCOUNTEDANSISTRING
     * @type {Integer (Int32)}
     */
    static INTYPE_REVERSEDCOUNTEDANSISTRING => 303

    /**
     * Native name: TDH_INTYPE_NONNULLTERMINATEDSTRING
     * @type {Integer (Int32)}
     */
    static INTYPE_NONNULLTERMINATEDSTRING => 304

    /**
     * Native name: TDH_INTYPE_NONNULLTERMINATEDANSISTRING
     * @type {Integer (Int32)}
     */
    static INTYPE_NONNULLTERMINATEDANSISTRING => 305

    /**
     * Native name: TDH_INTYPE_UNICODECHAR
     * @type {Integer (Int32)}
     */
    static INTYPE_UNICODECHAR => 306

    /**
     * Native name: TDH_INTYPE_ANSICHAR
     * @type {Integer (Int32)}
     */
    static INTYPE_ANSICHAR => 307

    /**
     * Native name: TDH_INTYPE_SIZET
     * @type {Integer (Int32)}
     */
    static INTYPE_SIZET => 308

    /**
     * Native name: TDH_INTYPE_HEXDUMP
     * @type {Integer (Int32)}
     */
    static INTYPE_HEXDUMP => 309

    /**
     * Native name: TDH_INTYPE_WBEMSID
     * @type {Integer (Int32)}
     */
    static INTYPE_WBEMSID => 310
}
