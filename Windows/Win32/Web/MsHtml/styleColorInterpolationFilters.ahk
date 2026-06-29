#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleColorInterpolationFilters {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static styleColorInterpolationFiltersAuto => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleColorInterpolationFiltersSRgb => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleColorInterpolationFiltersLinearRgb => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleColorInterpolationFiltersNotSet => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleColorInterpolationFilters_Max => 2147483647
}
