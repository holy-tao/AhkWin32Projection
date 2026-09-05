#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_BUS_TYPE_AND_IMPLEMENTATION extends Win32Enum {

    /**
     * Native name: DXGKMDT_OPM_BUS_TYPE_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => 0

    /**
     * Native name: DXGKMDT_OPM_BUS_TYPE_PCI
     * @type {Integer (Int32)}
     */
    static PCI => 1

    /**
     * Native name: DXGKMDT_OPM_BUS_TYPE_PCIX
     * @type {Integer (Int32)}
     */
    static PCIX => 2

    /**
     * Native name: DXGKMDT_OPM_BUS_TYPE_PCIEXPRESS
     * @type {Integer (Int32)}
     */
    static PCIEXPRESS => 3

    /**
     * Native name: DXGKMDT_OPM_BUS_TYPE_AGP
     * @type {Integer (Int32)}
     */
    static AGP => 4

    /**
     * Native name: DXGKMDT_OPM_BUS_IMPLEMENTATION_MODIFIER_INSIDE_OF_CHIPSET
     * @type {Integer (Int32)}
     */
    static MODIFIER_INSIDE_OF_CHIPSET => 65536

    /**
     * Native name: DXGKMDT_OPM_BUS_IMPLEMENTATION_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_CHIP
     * @type {Integer (Int32)}
     */
    static MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_CHIP => 131072

    /**
     * Native name: DXGKMDT_OPM_BUS_IMPLEMENTATION_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_SOCKET
     * @type {Integer (Int32)}
     */
    static MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_SOCKET => 196608

    /**
     * Native name: DXGKMDT_OPM_BUS_IMPLEMENTATION_MODIFIER_DAUGHTER_BOARD_CONNECTOR
     * @type {Integer (Int32)}
     */
    static MODIFIER_DAUGHTER_BOARD_CONNECTOR => 262144

    /**
     * Native name: DXGKMDT_OPM_BUS_IMPLEMENTATION_MODIFIER_DAUGHTER_BOARD_CONNECTOR_INSIDE_OF_NUAE
     * @type {Integer (Int32)}
     */
    static MODIFIER_DAUGHTER_BOARD_CONNECTOR_INSIDE_OF_NUAE => 327680

    /**
     * Native name: DXGKMDT_OPM_BUS_IMPLEMENTATION_MODIFIER_NON_STANDARD
     * @type {Integer (Int32)}
     */
    static MODIFIER_NON_STANDARD => -2147483648

    /**
     * Native name: DXGKMDT_OPM_COPP_COMPATIBLE_BUS_TYPE_INTEGRATED
     * @type {Integer (Int32)}
     */
    static COPP_COMPATIBLE_BUS_TYPE_INTEGRATED => -2147483648
}
