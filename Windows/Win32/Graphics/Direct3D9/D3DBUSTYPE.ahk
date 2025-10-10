#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DBUSTYPE{

    /**
     * @type {Integer (Int32)}
     */
    static D3DBUSTYPE_OTHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DBUSTYPE_PCI => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DBUSTYPE_PCIX => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DBUSTYPE_PCIEXPRESS => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DBUSTYPE_AGP => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DBUSIMPL_MODIFIER_INSIDE_OF_CHIPSET => 65536

    /**
     * @type {Integer (Int32)}
     */
    static D3DBUSIMPL_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_CHIP => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3DBUSIMPL_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_SOCKET => 196608

    /**
     * @type {Integer (Int32)}
     */
    static D3DBUSIMPL_MODIFIER_DAUGHTER_BOARD_CONNECTOR => 262144

    /**
     * @type {Integer (Int32)}
     */
    static D3DBUSIMPL_MODIFIER_DAUGHTER_BOARD_CONNECTOR_INSIDE_OF_NUAE => 327680

    /**
     * @type {Integer (Int32)}
     */
    static D3DBUSIMPL_MODIFIER_NON_STANDARD => -2147483648
}
