#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VPCONFIG extends Win32Enum {

    /**
     * Native name: KSPROPERTY_VPCONFIG_NUMCONNECTINFO
     * @type {Integer (Int32)}
     */
    static NUMCONNECTINFO => 0

    /**
     * Native name: KSPROPERTY_VPCONFIG_GETCONNECTINFO
     * @type {Integer (Int32)}
     */
    static GETCONNECTINFO => 1

    /**
     * Native name: KSPROPERTY_VPCONFIG_SETCONNECTINFO
     * @type {Integer (Int32)}
     */
    static SETCONNECTINFO => 2

    /**
     * Native name: KSPROPERTY_VPCONFIG_VPDATAINFO
     * @type {Integer (Int32)}
     */
    static VPDATAINFO => 3

    /**
     * Native name: KSPROPERTY_VPCONFIG_MAXPIXELRATE
     * @type {Integer (Int32)}
     */
    static MAXPIXELRATE => 4

    /**
     * Native name: KSPROPERTY_VPCONFIG_INFORMVPINPUT
     * @type {Integer (Int32)}
     */
    static INFORMVPINPUT => 5

    /**
     * Native name: KSPROPERTY_VPCONFIG_NUMVIDEOFORMAT
     * @type {Integer (Int32)}
     */
    static NUMVIDEOFORMAT => 6

    /**
     * Native name: KSPROPERTY_VPCONFIG_GETVIDEOFORMAT
     * @type {Integer (Int32)}
     */
    static GETVIDEOFORMAT => 7

    /**
     * Native name: KSPROPERTY_VPCONFIG_SETVIDEOFORMAT
     * @type {Integer (Int32)}
     */
    static SETVIDEOFORMAT => 8

    /**
     * Native name: KSPROPERTY_VPCONFIG_INVERTPOLARITY
     * @type {Integer (Int32)}
     */
    static INVERTPOLARITY => 9

    /**
     * Native name: KSPROPERTY_VPCONFIG_DECIMATIONCAPABILITY
     * @type {Integer (Int32)}
     */
    static DECIMATIONCAPABILITY => 10

    /**
     * Native name: KSPROPERTY_VPCONFIG_SCALEFACTOR
     * @type {Integer (Int32)}
     */
    static SCALEFACTOR => 11

    /**
     * Native name: KSPROPERTY_VPCONFIG_DDRAWHANDLE
     * @type {Integer (Int32)}
     */
    static DDRAWHANDLE => 12

    /**
     * Native name: KSPROPERTY_VPCONFIG_VIDEOPORTID
     * @type {Integer (Int32)}
     */
    static VIDEOPORTID => 13

    /**
     * Native name: KSPROPERTY_VPCONFIG_DDRAWSURFACEHANDLE
     * @type {Integer (Int32)}
     */
    static DDRAWSURFACEHANDLE => 14

    /**
     * Native name: KSPROPERTY_VPCONFIG_SURFACEPARAMS
     * @type {Integer (Int32)}
     */
    static SURFACEPARAMS => 15
}
