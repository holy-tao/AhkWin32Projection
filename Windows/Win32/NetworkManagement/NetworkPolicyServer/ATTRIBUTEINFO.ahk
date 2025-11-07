#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the ATTRIBUTEINFO type enumerate characteristics of a specified attribute.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-attributeinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ATTRIBUTEINFO{

    /**
     * The name of the attribute.
     * @type {Integer (Int32)}
     */
    static NAME => 1

    /**
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-attributesyntax">syntax</a> of the attribute.
     * @type {Integer (Int32)}
     */
    static SYNTAX => 2

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-attributerestrictions">Restrictions</a> on how the attribute can be used.
     * @type {Integer (Int32)}
     */
    static RESTRICTIONS => 3

    /**
     * Description of the attribute.
     * @type {Integer (Int32)}
     */
    static DESCRIPTION => 4

    /**
     * The vendor ID for Vendor Specific Attributes (VSA).
     * @type {Integer (Int32)}
     */
    static VENDORID => 5

    /**
     * The Lightweight Directory Access Protocol (LDAP) name for the attribute.
     * @type {Integer (Int32)}
     */
    static LDAPNAME => 6

    /**
     * The attribute type for Vendor Specific Attributes (VSA).
     * @type {Integer (Int32)}
     */
    static VENDORTYPE => 7
}
