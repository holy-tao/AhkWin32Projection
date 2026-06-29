#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct svgTurbulenceType {
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
    static SVG_TURBULENCE_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVG_TURBULENCE_TYPE_FACTALNOISE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVG_TURBULENCE_TYPE_TURBULENCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static svgTurbulenceType_Max => 2147483647
}
