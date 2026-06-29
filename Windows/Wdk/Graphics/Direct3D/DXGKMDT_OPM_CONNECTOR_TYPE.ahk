#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_CONNECTOR_TYPE {
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
