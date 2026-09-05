#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates the facet values that may be returned by the ISettingsItem::GetRestrictionFacets method.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmrestrictionfacets
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 */
class WcmRestrictionFacets extends Win32Enum {

    /**
     * Maximum number of units of length. Units of length depend on the data type. This value must be a nonNegativeInteger.
     * Native name: restrictionFacetMaxLength
     * @type {Integer (Int32)}
     */
    static FacetMaxLength => 1

    /**
     * Specified set of values. This limits a data type to the specified values.
     * Native name: restrictionFacetEnumeration
     * @type {Integer (Int32)}
     */
    static FacetEnumeration => 2

    /**
     * Maximum value. This value must be the same data type as the inherited data type.
     * Native name: restrictionFacetMaxInclusive
     * @type {Integer (Int32)}
     */
    static FacetMaxInclusive => 4

    /**
     * Lower bound value (all values are greater than this value). This value must be the same data type as the inherited data type.
     * Native name: restrictionFacetMinInclusive
     * @type {Integer (Int32)}
     */
    static FacetMinInclusive => 8
}
