#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Each value from the ATTRIBUTESYNTAX enumeration type specifies a possible attribute syntax.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-attributesyntax
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ATTRIBUTESYNTAX extends Win32Enum{

    /**
     * The attribute is of type Boolean.
     * @type {Integer (Int32)}
     */
    static IAS_SYNTAX_BOOLEAN => 1

    /**
     * The attribute is of type integer.
     * @type {Integer (Int32)}
     */
    static IAS_SYNTAX_INTEGER => 2

    /**
     * The attribute is an enumerator.
     * @type {Integer (Int32)}
     */
    static IAS_SYNTAX_ENUMERATOR => 3

    /**
     * The attribute is an Internet address.
     * @type {Integer (Int32)}
     */
    static IAS_SYNTAX_INETADDR => 4

    /**
     * The attribute is a text string.
     * @type {Integer (Int32)}
     */
    static IAS_SYNTAX_STRING => 5

    /**
     * The attribute is a byte (octet) string.
     * @type {Integer (Int32)}
     */
    static IAS_SYNTAX_OCTETSTRING => 6

    /**
     * The attribute is a time in coordinated universal time format.
     * @type {Integer (Int32)}
     */
    static IAS_SYNTAX_UTCTIME => 7

    /**
     * The attribute and its type are vendor-specific.
     * @type {Integer (Int32)}
     */
    static IAS_SYNTAX_PROVIDERSPECIFIC => 8

    /**
     * The attribute is of type unsigned integer.
     * @type {Integer (Int32)}
     */
    static IAS_SYNTAX_UNSIGNEDINTEGER => 9

    /**
     * The attribute is an IPv6 address.
     * @type {Integer (Int32)}
     */
    static IAS_SYNTAX_INETADDR6 => 10
}
