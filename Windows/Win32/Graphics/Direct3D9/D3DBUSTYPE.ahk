#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of I/O bus used by the graphics adapter.
 * @remarks
 * As many as three flags can be set. Flags in the range 0x00 through 0x04 (**D3DBUSTYPE\_Xxx**) provide the basic bus type. Flags in the range 0x10000 through 0x50000 (**D3DBUSIMPL\_MODIFIER\_Xxx**) modify the basic description. The driver sets one bus-type flag, and can set zero or one modifier flag. If the driver sets a modifier flag, it also sets the **D3DBUSIMPL\_MODIFIER\_NON\_STANDARD** flag. Flags are combined with a bitwise **OR**.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dbustype
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DBUSTYPE extends Win32Enum {

    /**
     * Native name: D3DBUSTYPE_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => 0

    /**
     * Native name: D3DBUSTYPE_PCI
     * @type {Integer (Int32)}
     */
    static PCI => 1

    /**
     * Native name: D3DBUSTYPE_PCIX
     * @type {Integer (Int32)}
     */
    static PCIX => 2

    /**
     * Native name: D3DBUSTYPE_PCIEXPRESS
     * @type {Integer (Int32)}
     */
    static PCIEXPRESS => 3

    /**
     * Native name: D3DBUSTYPE_AGP
     * @type {Integer (Int32)}
     */
    static AGP => 4

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
