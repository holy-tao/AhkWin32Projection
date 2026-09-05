#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class ADSTYPE extends Win32Enum {

    /**
     * Native name: ADSTYPE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * Native name: ADSTYPE_DN_STRING
     * @type {Integer (Int32)}
     */
    static DN_STRING => 1

    /**
     * Native name: ADSTYPE_CASE_EXACT_STRING
     * @type {Integer (Int32)}
     */
    static CASE_EXACT_STRING => 2

    /**
     * Native name: ADSTYPE_CASE_IGNORE_STRING
     * @type {Integer (Int32)}
     */
    static CASE_IGNORE_STRING => 3

    /**
     * Native name: ADSTYPE_PRINTABLE_STRING
     * @type {Integer (Int32)}
     */
    static PRINTABLE_STRING => 4

    /**
     * Native name: ADSTYPE_NUMERIC_STRING
     * @type {Integer (Int32)}
     */
    static NUMERIC_STRING => 5

    /**
     * Native name: ADSTYPE_BOOLEAN
     * @type {Integer (Int32)}
     */
    static BOOLEAN => 6

    /**
     * Native name: ADSTYPE_INTEGER
     * @type {Integer (Int32)}
     */
    static INTEGER => 7

    /**
     * Native name: ADSTYPE_OCTET_STRING
     * @type {Integer (Int32)}
     */
    static OCTET_STRING => 8

    /**
     * Native name: ADSTYPE_UTC_TIME
     * @type {Integer (Int32)}
     */
    static UTC_TIME => 9

    /**
     * Native name: ADSTYPE_LARGE_INTEGER
     * @type {Integer (Int32)}
     */
    static LARGE_INTEGER => 10

    /**
     * Native name: ADSTYPE_PROV_SPECIFIC
     * @type {Integer (Int32)}
     */
    static PROV_SPECIFIC => 11

    /**
     * Native name: ADSTYPE_OBJECT_CLASS
     * @type {Integer (Int32)}
     */
    static OBJECT_CLASS => 12

    /**
     * Native name: ADSTYPE_CASEIGNORE_LIST
     * @type {Integer (Int32)}
     */
    static CASEIGNORE_LIST => 13

    /**
     * Native name: ADSTYPE_OCTET_LIST
     * @type {Integer (Int32)}
     */
    static OCTET_LIST => 14

    /**
     * Native name: ADSTYPE_PATH
     * @type {Integer (Int32)}
     */
    static PATH => 15

    /**
     * Native name: ADSTYPE_POSTALADDRESS
     * @type {Integer (Int32)}
     */
    static POSTALADDRESS => 16

    /**
     * Native name: ADSTYPE_TIMESTAMP
     * @type {Integer (Int32)}
     */
    static TIMESTAMP => 17

    /**
     * Native name: ADSTYPE_BACKLINK
     * @type {Integer (Int32)}
     */
    static BACKLINK => 18

    /**
     * Native name: ADSTYPE_TYPEDNAME
     * @type {Integer (Int32)}
     */
    static TYPEDNAME => 19

    /**
     * Native name: ADSTYPE_HOLD
     * @type {Integer (Int32)}
     */
    static HOLD => 20

    /**
     * Native name: ADSTYPE_NETADDRESS
     * @type {Integer (Int32)}
     */
    static NETADDRESS => 21

    /**
     * Native name: ADSTYPE_REPLICAPOINTER
     * @type {Integer (Int32)}
     */
    static REPLICAPOINTER => 22

    /**
     * Native name: ADSTYPE_FAXNUMBER
     * @type {Integer (Int32)}
     */
    static FAXNUMBER => 23

    /**
     * Native name: ADSTYPE_EMAIL
     * @type {Integer (Int32)}
     */
    static EMAIL => 24

    /**
     * Native name: ADSTYPE_NT_SECURITY_DESCRIPTOR
     * @type {Integer (Int32)}
     */
    static NT_SECURITY_DESCRIPTOR => 25

    /**
     * Native name: ADSTYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 26

    /**
     * Native name: ADSTYPE_DN_WITH_BINARY
     * @type {Integer (Int32)}
     */
    static DN_WITH_BINARY => 27

    /**
     * Native name: ADSTYPE_DN_WITH_STRING
     * @type {Integer (Int32)}
     */
    static DN_WITH_STRING => 28
}
