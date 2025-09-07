#Requires AutoHotkey v2.0.0 64-bit

/**
 * Qualifies the filter conditions used for searching for function instances.
 * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryconstraints/ne-functiondiscoveryconstraints-propertyconstraint
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class PropertyConstraint{

    /**
     * The constraint's PKEY and the function instance's  PKEY must be equal.
     * @type {Integer (Int32)}
     */
    static QC_EQUALS => 0

    /**
     * The constraint's PKEY and the function instance's  PKEY  must not be equal.
     * @type {Integer (Int32)}
     */
    static QC_NOTEQUAL => 1

    /**
     * The constraint's PKEY must be less than the function instance's PKEY. This value can be used only with numbers.
     * @type {Integer (Int32)}
     */
    static QC_LESSTHAN => 2

    /**
     * The constraint's PKEY must be less than or equal to the function instance's PKEY. This value can be used only with numbers.
     * @type {Integer (Int32)}
     */
    static QC_LESSTHANOREQUAL => 3

    /**
     * The constraint's PKEY must be greater than the function instance's PKEY. This value can be used only with numbers.
     * @type {Integer (Int32)}
     */
    static QC_GREATERTHAN => 4

    /**
     * The constraint's PKEY must be greater than or equal to the function instance's PKEY. This value can be used only with numbers.
     * @type {Integer (Int32)}
     */
    static QC_GREATERTHANOREQUAL => 5

    /**
     * The constraint's PKEY must be the start of the function instance's PKEY. This value can be used with strings only.
     * @type {Integer (Int32)}
     */
    static QC_STARTSWITH => 6

    /**
     * The property must exist.
     * @type {Integer (Int32)}
     */
    static QC_EXISTS => 7

    /**
     * The property must not exist.
     * @type {Integer (Int32)}
     */
    static QC_DOESNOTEXIST => 8

    /**
     * The constraint's PKEY value must be contained within the function instance's PKEY value.  This filter is only supported for PROPVARIANTs of type VT_LPWSTR or VT_VECTOR|VT_LPWSTR.
 * 
 * For PROPVARIANTs of type VT_LPWSTR, the constraint PKEY value must be a substring of the function instance's PKEY value.
 * 
 * For PROPVARIANTs of type VT_VECTOR|VT_LPWSTR, the constraint PKEY value must have exactly one element, and matching function instances must have a PKEY with at least one vector element that exactly matches the constraint PKEY value.
     * @type {Integer (Int32)}
     */
    static QC_CONTAINS => 9
}
