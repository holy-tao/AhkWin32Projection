#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_BUS_TYPE_AND_IMPLEMENTATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_BUS_TYPE_OTHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_BUS_TYPE_PCI => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_BUS_TYPE_PCIX => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_BUS_TYPE_PCIEXPRESS => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_BUS_TYPE_AGP => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_BUS_IMPLEMENTATION_MODIFIER_INSIDE_OF_CHIPSET => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_BUS_IMPLEMENTATION_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_CHIP => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_BUS_IMPLEMENTATION_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_SOCKET => 196608

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_BUS_IMPLEMENTATION_MODIFIER_DAUGHTER_BOARD_CONNECTOR => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_BUS_IMPLEMENTATION_MODIFIER_DAUGHTER_BOARD_CONNECTOR_INSIDE_OF_NUAE => 327680

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_BUS_IMPLEMENTATION_MODIFIER_NON_STANDARD => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_COPP_COMPATIBLE_BUS_TYPE_INTEGRATED => -2147483648
}
