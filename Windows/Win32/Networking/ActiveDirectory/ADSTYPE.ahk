#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADSTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_DN_STRING => 1

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_CASE_EXACT_STRING => 2

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_CASE_IGNORE_STRING => 3

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_PRINTABLE_STRING => 4

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_NUMERIC_STRING => 5

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_BOOLEAN => 6

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_INTEGER => 7

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_OCTET_STRING => 8

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_UTC_TIME => 9

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_LARGE_INTEGER => 10

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_PROV_SPECIFIC => 11

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_OBJECT_CLASS => 12

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_CASEIGNORE_LIST => 13

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_OCTET_LIST => 14

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_PATH => 15

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_POSTALADDRESS => 16

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_TIMESTAMP => 17

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_BACKLINK => 18

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_TYPEDNAME => 19

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_HOLD => 20

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_NETADDRESS => 21

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_REPLICAPOINTER => 22

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_FAXNUMBER => 23

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_EMAIL => 24

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_NT_SECURITY_DESCRIPTOR => 25

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_UNKNOWN => 26

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_DN_WITH_BINARY => 27

    /**
     * @type {Integer (Int32)}
     */
    static ADSTYPE_DN_WITH_STRING => 28
}
