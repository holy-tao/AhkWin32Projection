#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of I/O bus that is used by the graphics adapter.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_bus_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_BUS_TYPE{

    /**
     * Indicates a type of bus other than the types listed here.
     * @type {Integer (Int32)}
     */
    static D3D11_BUS_TYPE_OTHER => 0

    /**
     * PCI bus.
     * @type {Integer (Int32)}
     */
    static D3D11_BUS_TYPE_PCI => 1

    /**
     * PCI-X bus.
     * @type {Integer (Int32)}
     */
    static D3D11_BUS_TYPE_PCIX => 2

    /**
     * PCI Express bus.
     * @type {Integer (Int32)}
     */
    static D3D11_BUS_TYPE_PCIEXPRESS => 3

    /**
     * Accelerated Graphics Port (AGP) bus.
     * @type {Integer (Int32)}
     */
    static D3D11_BUS_TYPE_AGP => 4

    /**
     * The implementation for the graphics adapter is in a motherboard chipset's north bridge. This flag implies that data never goes over an expansion bus (such as PCI or AGP) when it is transferred from main memory to the graphics adapter.
     * @type {Integer (Int32)}
     */
    static D3D11_BUS_IMPL_MODIFIER_INSIDE_OF_CHIPSET => 65536

    /**
     * Indicates that the graphics adapter is connected to a motherboard chipset's north bridge by tracks on the motherboard, and all of the graphics adapter's chips are soldered to the motherboard. This flag implies that data never goes over an expansion bus (such as PCI or AGP) when it is transferred from main memory to the graphics adapter.
     * @type {Integer (Int32)}
     */
    static D3D11_BUS_IMPL_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_CHIP => 131072

    /**
     * The graphics adapter is connected to a motherboard chipset's north bridge by tracks on the motherboard, and all of the graphics adapter's chips are connected through sockets to the motherboard.
     * @type {Integer (Int32)}
     */
    static D3D11_BUS_IMPL_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_SOCKET => 196608

    /**
     * The graphics adapter is connected to the motherboard through a daughterboard connector.
     * @type {Integer (Int32)}
     */
    static D3D11_BUS_IMPL_MODIFIER_DAUGHTER_BOARD_CONNECTOR => 262144

    /**
     * The graphics adapter is connected to the motherboard through a daughterboard connector, and the graphics adapter is inside an enclosure that is not user accessible.
     * @type {Integer (Int32)}
     */
    static D3D11_BUS_IMPL_MODIFIER_DAUGHTER_BOARD_CONNECTOR_INSIDE_OF_NUAE => 327680

    /**
     * One of the <b>D3D11_BUS_IMPL_MODIFIER_Xxx</b> flags is set.
     * @type {Integer (Int32)}
     */
    static D3D11_BUS_IMPL_MODIFIER_NON_STANDARD => -2147483648
}
