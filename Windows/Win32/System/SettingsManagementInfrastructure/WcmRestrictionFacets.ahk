#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Enumerates the facet values that may be returned by the ISettingsItem::GetRestrictionFacets method.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmrestrictionfacets
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 */
export default struct WcmRestrictionFacets {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Maximum number of units of length. Units of length depend on the data type. This value must be a nonNegativeInteger.
     * @type {Integer (Int32)}
     */
    static restrictionFacetMaxLength => 1

    /**
     * Specified set of values. This limits a data type to the specified values.
     * @type {Integer (Int32)}
     */
    static restrictionFacetEnumeration => 2

    /**
     * Maximum value. This value must be the same data type as the inherited data type.
     * @type {Integer (Int32)}
     */
    static restrictionFacetMaxInclusive => 4

    /**
     * Lower bound value (all values are greater than this value). This value must be the same data type as the inherited data type.
     * @type {Integer (Int32)}
     */
    static restrictionFacetMinInclusive => 8
}
