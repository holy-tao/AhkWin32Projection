#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the ATTRIBUTEPROPERTIES type enumerate properties for a RADIUS dictionary attribute.
 * @remarks
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-dictionaryproperties">DICTIONARYPROPERTIES</a> enumeration type contains the attributes collection property, <b>PROPERTY_DICTIONARY_ATTRIBUTES_COLLECTION</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-attributeproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ATTRIBUTEPROPERTIES extends Win32Enum{

    /**
     * The ID of the attribute.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_ID => 1024

    /**
     * The vendor ID for Vendor Specific Attributes (VSA).
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_VENDOR_ID => 1025

    /**
     * The vendor-specific type ID for Vendor Specific Attributes (VSA).
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_VENDOR_TYPE_ID => 1026

    /**
     * Specifies whether the attribute is enumerable.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_IS_ENUMERABLE => 1027

    /**
     * The IDs for an enumerable attribute.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_ENUM_NAMES => 1028

    /**
     * The values for an enumerable attribute.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_ENUM_VALUES => 1029

    /**
     * Specifies the syntax of the attribute.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_SYNTAX => 1030

    /**
     * Specifies whether multiple instances of this attribute are allowed.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_ALLOW_MULTIPLE => 1031

    /**
     * Specifies the Open Database Connectivity (ODBC) ordinal.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_ALLOW_LOG_ORDINAL => 1032

    /**
     * Specifies whether this attribute is allowed in the profile for a Network Access Policy (NAP).
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_ALLOW_IN_PROFILE => 1033

    /**
     * Specifies whether this attribute is allowed in a condition for a Network Access Policy (NAP).
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_ALLOW_IN_CONDITION => 1034

    /**
     * The display name for the attribute.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_DISPLAY_NAME => 1035

    /**
     * Specifies the value for the attribute.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_VALUE => 1036

    /**
     * Specifies whether the attribute is allowed in an NAP profile for a network request proxy.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_ALLOW_IN_PROXY_PROFILE => 1037

    /**
     * Specifies whether the attribute is allowed in an NAP condition for a network request proxy.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_ALLOW_IN_PROXY_CONDITION => 1038

    /**
     * Used by NPS user interface to mark whether an attribute is used in profiles for VPN scenario.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_ALLOW_IN_VPNDIALUP => 1039

    /**
     * Used by NPS user interface to mark whether an attribute is used in profiles for 802.1X scenario.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_ALLOW_IN_8021X => 1040

    /**
     * Used by filter configuration attributes <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-attributeid">MS_ATTRIBUTE_FILTER</a> and <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-attributeid">MS_ATTRIBUTE_QUARANTINE_IPFILTER</a>. See MS-Filter section in <a href="https://www.ietf.org/rfc/rfc2548.txt">RFC 2548</a> for more information.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ATTRIBUTE_ENUM_FILTERS => 1041
}
