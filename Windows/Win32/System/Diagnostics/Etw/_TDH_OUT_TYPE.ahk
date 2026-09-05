#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class _TDH_OUT_TYPE extends Win32Enum {

    /**
     * Native name: TDH_OUTTYPE_NULL
     * @type {Integer (Int32)}
     */
    static OUTTYPE_NULL => 0

    /**
     * Native name: TDH_OUTTYPE_STRING
     * @type {Integer (Int32)}
     */
    static OUTTYPE_STRING => 1

    /**
     * Native name: TDH_OUTTYPE_DATETIME
     * @type {Integer (Int32)}
     */
    static OUTTYPE_DATETIME => 2

    /**
     * Native name: TDH_OUTTYPE_BYTE
     * @type {Integer (Int32)}
     */
    static OUTTYPE_BYTE => 3

    /**
     * Native name: TDH_OUTTYPE_UNSIGNEDBYTE
     * @type {Integer (Int32)}
     */
    static OUTTYPE_UNSIGNEDBYTE => 4

    /**
     * Native name: TDH_OUTTYPE_SHORT
     * @type {Integer (Int32)}
     */
    static OUTTYPE_SHORT => 5

    /**
     * Native name: TDH_OUTTYPE_UNSIGNEDSHORT
     * @type {Integer (Int32)}
     */
    static OUTTYPE_UNSIGNEDSHORT => 6

    /**
     * Native name: TDH_OUTTYPE_INT
     * @type {Integer (Int32)}
     */
    static OUTTYPE_INT => 7

    /**
     * Native name: TDH_OUTTYPE_UNSIGNEDINT
     * @type {Integer (Int32)}
     */
    static OUTTYPE_UNSIGNEDINT => 8

    /**
     * Native name: TDH_OUTTYPE_LONG
     * @type {Integer (Int32)}
     */
    static OUTTYPE_LONG => 9

    /**
     * Native name: TDH_OUTTYPE_UNSIGNEDLONG
     * @type {Integer (Int32)}
     */
    static OUTTYPE_UNSIGNEDLONG => 10

    /**
     * Native name: TDH_OUTTYPE_FLOAT
     * @type {Integer (Int32)}
     */
    static OUTTYPE_FLOAT => 11

    /**
     * Native name: TDH_OUTTYPE_DOUBLE
     * @type {Integer (Int32)}
     */
    static OUTTYPE_DOUBLE => 12

    /**
     * Native name: TDH_OUTTYPE_BOOLEAN
     * @type {Integer (Int32)}
     */
    static OUTTYPE_BOOLEAN => 13

    /**
     * Native name: TDH_OUTTYPE_GUID
     * @type {Integer (Int32)}
     */
    static OUTTYPE_GUID => 14

    /**
     * Native name: TDH_OUTTYPE_HEXBINARY
     * @type {Integer (Int32)}
     */
    static OUTTYPE_HEXBINARY => 15

    /**
     * Native name: TDH_OUTTYPE_HEXINT8
     * @type {Integer (Int32)}
     */
    static OUTTYPE_HEXINT8 => 16

    /**
     * Native name: TDH_OUTTYPE_HEXINT16
     * @type {Integer (Int32)}
     */
    static OUTTYPE_HEXINT16 => 17

    /**
     * Native name: TDH_OUTTYPE_HEXINT32
     * @type {Integer (Int32)}
     */
    static OUTTYPE_HEXINT32 => 18

    /**
     * Native name: TDH_OUTTYPE_HEXINT64
     * @type {Integer (Int32)}
     */
    static OUTTYPE_HEXINT64 => 19

    /**
     * Native name: TDH_OUTTYPE_PID
     * @type {Integer (Int32)}
     */
    static OUTTYPE_PID => 20

    /**
     * Native name: TDH_OUTTYPE_TID
     * @type {Integer (Int32)}
     */
    static OUTTYPE_TID => 21

    /**
     * Native name: TDH_OUTTYPE_PORT
     * @type {Integer (Int32)}
     */
    static OUTTYPE_PORT => 22

    /**
     * Native name: TDH_OUTTYPE_IPV4
     * @type {Integer (Int32)}
     */
    static OUTTYPE_IPV4 => 23

    /**
     * Native name: TDH_OUTTYPE_IPV6
     * @type {Integer (Int32)}
     */
    static OUTTYPE_IPV6 => 24

    /**
     * Native name: TDH_OUTTYPE_SOCKETADDRESS
     * @type {Integer (Int32)}
     */
    static OUTTYPE_SOCKETADDRESS => 25

    /**
     * Native name: TDH_OUTTYPE_CIMDATETIME
     * @type {Integer (Int32)}
     */
    static OUTTYPE_CIMDATETIME => 26

    /**
     * Native name: TDH_OUTTYPE_ETWTIME
     * @type {Integer (Int32)}
     */
    static OUTTYPE_ETWTIME => 27

    /**
     * Native name: TDH_OUTTYPE_XML
     * @type {Integer (Int32)}
     */
    static OUTTYPE_XML => 28

    /**
     * Native name: TDH_OUTTYPE_ERRORCODE
     * @type {Integer (Int32)}
     */
    static OUTTYPE_ERRORCODE => 29

    /**
     * Native name: TDH_OUTTYPE_WIN32ERROR
     * @type {Integer (Int32)}
     */
    static OUTTYPE_WIN32ERROR => 30

    /**
     * Native name: TDH_OUTTYPE_NTSTATUS
     * @type {Integer (Int32)}
     */
    static OUTTYPE_NTSTATUS => 31

    /**
     * Native name: TDH_OUTTYPE_HRESULT
     * @type {Integer (Int32)}
     */
    static OUTTYPE_HRESULT => 32

    /**
     * Native name: TDH_OUTTYPE_CULTURE_INSENSITIVE_DATETIME
     * @type {Integer (Int32)}
     */
    static OUTTYPE_CULTURE_INSENSITIVE_DATETIME => 33

    /**
     * Native name: TDH_OUTTYPE_JSON
     * @type {Integer (Int32)}
     */
    static OUTTYPE_JSON => 34

    /**
     * Native name: TDH_OUTTYPE_UTF8
     * @type {Integer (Int32)}
     */
    static OUTTYPE_UTF8 => 35

    /**
     * Native name: TDH_OUTTYPE_PKCS7_WITH_TYPE_INFO
     * @type {Integer (Int32)}
     */
    static OUTTYPE_PKCS7_WITH_TYPE_INFO => 36

    /**
     * Native name: TDH_OUTTYPE_CODE_POINTER
     * @type {Integer (Int32)}
     */
    static OUTTYPE_CODE_POINTER => 37

    /**
     * Native name: TDH_OUTTYPE_DATETIME_UTC
     * @type {Integer (Int32)}
     */
    static OUTTYPE_DATETIME_UTC => 38

    /**
     * Native name: TDH_OUTTYPE_REDUCEDSTRING
     * @type {Integer (Int32)}
     */
    static OUTTYPE_REDUCEDSTRING => 300

    /**
     * Native name: TDH_OUTTYPE_NOPRINT
     * @type {Integer (Int32)}
     */
    static OUTTYPE_NOPRINT => 301
}
