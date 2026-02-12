#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used to identify the data type of an ADSI property value.
 * @remarks
 * When extending the active directory schema to add <a href="https://docs.microsoft.com/windows/win32/api/iads/ns-iads-ads_dn_with_binary">ADS_DN_WITH_BINARY</a>, you must also specify the "otherWellKnownGuid" attribute definition. Add the following to the ldf file attribute definition: "omObjectClass:: KoZIhvcUAQEBCw=="
 * 
 * When extending the active directory schema to add <a href="https://docs.microsoft.com/windows/win32/api/iads/ns-iads-ads_dn_with_string">ADS_DN_WITH_STRING</a>, you must also specify the "otherWellKnownGuid" attribute definition. Add the following to the ldf file attribute definition: "omObjectClass:: KoZIhvcUAQEBDA=="
 * 
 * Because VBScript cannot read data from a type library, VBScript applications do not recognize symbolic constants, as defined above. Use the numerical constants instead to set the appropriate flags in your VBScript application. To use the symbolic constants as a good programming practice, write explicit declarations of such constants, as done here, in your VBScript application.
 * @see https://learn.microsoft.com/windows/win32/api//content/iads/ne-iads-adstypeenum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADSTYPE extends Win32Enum{

    /**
     * The data type is not valid
     * @type {Integer (Int32)}
     */
    static ADSTYPE_INVALID => 0

    /**
     * The string is of Distinguished Name (path) of a directory service object.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_DN_STRING => 1

    /**
     * The string is of the case-sensitive type.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_CASE_EXACT_STRING => 2

    /**
     * The string is of the case-insensitive type.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_CASE_IGNORE_STRING => 3

    /**
     * The string is displayable on screen or in print.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_PRINTABLE_STRING => 4

    /**
     * The string is of a numeral to be interpreted as text.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_NUMERIC_STRING => 5

    /**
     * The data is of a Boolean value.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_BOOLEAN => 6

    /**
     * The data is of an integer value.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_INTEGER => 7

    /**
     * The string is of a byte array.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_OCTET_STRING => 8

    /**
     * The data is of the universal time as expressed in Universal Time Coordinate (UTC).
     * @type {Integer (Int32)}
     */
    static ADSTYPE_UTC_TIME => 9

    /**
     * The data is of a long integer value.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_LARGE_INTEGER => 10

    /**
     * The string is of a provider-specific string.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_PROV_SPECIFIC => 11

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_OBJECT_CLASS => 12

    /**
     * The data is of a list of case insensitive strings.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_CASEIGNORE_LIST => 13

    /**
     * The data is of a list of octet strings.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_OCTET_LIST => 14

    /**
     * The string is of a directory path.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_PATH => 15

    /**
     * The string is of the postal address type.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_POSTALADDRESS => 16

    /**
     * The data is of a time stamp in seconds.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_TIMESTAMP => 17

    /**
     * The string is of a back link.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_BACKLINK => 18

    /**
     * The string is of a typed name.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_TYPEDNAME => 19

    /**
     * The data is of the Hold data structure.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_HOLD => 20

    /**
     * The string is of a net address.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_NETADDRESS => 21

    /**
     * The data is of a replica pointer.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_REPLICAPOINTER => 22

    /**
     * The string is of a fax number.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_FAXNUMBER => 23

    /**
     * The data is of an email message.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_EMAIL => 24

    /**
     * The data is a Windows security descriptor as represented by a byte array.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_NT_SECURITY_DESCRIPTOR => 25

    /**
     * The data is of an undefined type.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_UNKNOWN => 26

    /**
     * The data is of <a href="https://docs.microsoft.com/windows/win32/api/iads/ns-iads-ads_dn_with_binary">ADS_DN_WITH_BINARY</a> used for mapping a distinguished name to a nonvarying GUID. For more information, see Remarks.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_DN_WITH_BINARY => 27

    /**
     * The data is of <a href="https://docs.microsoft.com/windows/win32/api/iads/ns-iads-ads_dn_with_string">ADS_DN_WITH_STRING</a> used for mapping a distinguished name to a nonvarying string value. For more information, see Remarks.
     * @type {Integer (Int32)}
     */
    static ADSTYPE_DN_WITH_STRING => 28
}
