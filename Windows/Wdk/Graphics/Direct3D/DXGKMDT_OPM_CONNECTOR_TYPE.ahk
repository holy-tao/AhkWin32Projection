#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_CONNECTOR_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_OTHER => -1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_HD15 => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_SVIDEO => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_COMPOSITE_VIDEO => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_COMPONENT_VIDEO => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_DVI => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_HDMI => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_LVDS => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_D_JPN => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_SDI => 9

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_DISPLAYPORT_EXTERNAL => 10

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_DISPLAYPORT_EMBEDDED => 11

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_UDI_EXTERNAL => 12

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_UDI_EMBEDDED => 13

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_RESERVED => 14

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_MIRACAST => 15

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_TRANSPORT_AGNOSTIC_DIGITAL_MODE_A => 16

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CONNECTOR_TYPE_TRANSPORT_AGNOSTIC_DIGITAL_MODE_B => 17

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_COPP_COMPATIBLE_CONNECTOR_TYPE_INTERNAL => -2147483648
}
