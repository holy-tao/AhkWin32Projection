#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleColorInterpolationFilters extends Win32Enum {

    /**
     * Native name: styleColorInterpolationFiltersAuto
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Native name: styleColorInterpolationFiltersSRgb
     * @type {Integer (Int32)}
     */
    static FiltersSRgb => 1

    /**
     * Native name: styleColorInterpolationFiltersLinearRgb
     * @type {Integer (Int32)}
     */
    static LinearRgb => 2

    /**
     * Native name: styleColorInterpolationFiltersNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 3

    /**
     * Native name: styleColorInterpolationFilters_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
