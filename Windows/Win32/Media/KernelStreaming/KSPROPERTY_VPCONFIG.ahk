#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VPCONFIG {
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
    static KSPROPERTY_VPCONFIG_NUMCONNECTINFO => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_GETCONNECTINFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_SETCONNECTINFO => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_VPDATAINFO => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_MAXPIXELRATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_INFORMVPINPUT => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_NUMVIDEOFORMAT => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_GETVIDEOFORMAT => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_SETVIDEOFORMAT => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_INVERTPOLARITY => 9

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_DECIMATIONCAPABILITY => 10

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_SCALEFACTOR => 11

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_DDRAWHANDLE => 12

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_VIDEOPORTID => 13

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_DDRAWSURFACEHANDLE => 14

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VPCONFIG_SURFACEPARAMS => 15
}
