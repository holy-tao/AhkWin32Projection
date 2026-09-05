#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_CONNECTOR_TYPE extends Win32Enum {

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => -1

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_HD15
     * @type {Integer (Int32)}
     */
    static HD15 => 0

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_SVIDEO
     * @type {Integer (Int32)}
     */
    static SVIDEO => 1

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_COMPOSITE_VIDEO
     * @type {Integer (Int32)}
     */
    static COMPOSITE_VIDEO => 2

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_COMPONENT_VIDEO
     * @type {Integer (Int32)}
     */
    static COMPONENT_VIDEO => 3

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_DVI
     * @type {Integer (Int32)}
     */
    static DVI => 4

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_HDMI
     * @type {Integer (Int32)}
     */
    static HDMI => 5

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_LVDS
     * @type {Integer (Int32)}
     */
    static LVDS => 6

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_D_JPN
     * @type {Integer (Int32)}
     */
    static D_JPN => 8

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_SDI
     * @type {Integer (Int32)}
     */
    static SDI => 9

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_DISPLAYPORT_EXTERNAL
     * @type {Integer (Int32)}
     */
    static DISPLAYPORT_EXTERNAL => 10

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_DISPLAYPORT_EMBEDDED
     * @type {Integer (Int32)}
     */
    static DISPLAYPORT_EMBEDDED => 11

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_UDI_EXTERNAL
     * @type {Integer (Int32)}
     */
    static UDI_EXTERNAL => 12

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_UDI_EMBEDDED
     * @type {Integer (Int32)}
     */
    static UDI_EMBEDDED => 13

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_RESERVED
     * @type {Integer (Int32)}
     */
    static RESERVED => 14

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_MIRACAST
     * @type {Integer (Int32)}
     */
    static MIRACAST => 15

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_TRANSPORT_AGNOSTIC_DIGITAL_MODE_A
     * @type {Integer (Int32)}
     */
    static TRANSPORT_AGNOSTIC_DIGITAL_MODE_A => 16

    /**
     * Native name: DXGKMDT_OPM_CONNECTOR_TYPE_TRANSPORT_AGNOSTIC_DIGITAL_MODE_B
     * @type {Integer (Int32)}
     */
    static TRANSPORT_AGNOSTIC_DIGITAL_MODE_B => 17

    /**
     * Native name: DXGKMDT_OPM_COPP_COMPATIBLE_CONNECTOR_TYPE_INTERNAL
     * @type {Integer (Int32)}
     */
    static COPP_COMPATIBLE_CONNECTOR_TYPE_INTERNAL => -2147483648
}
