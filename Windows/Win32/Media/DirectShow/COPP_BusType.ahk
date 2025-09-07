#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of I/O bus used by the graphics adapter.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ne-dxva9typ-copp_bustype
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class COPP_BusType{

    /**
     * Unknown bus type.
     * @type {Integer (Int32)}
     */
    static COPP_BusType_Unknown => 0

    /**
     * PCI bus.
     * @type {Integer (Int32)}
     */
    static COPP_BusType_PCI => 1

    /**
     * PCI-X bus.
     * @type {Integer (Int32)}
     */
    static COPP_BusType_PCIX => 2

    /**
     * PCI Express bus.
     * @type {Integer (Int32)}
     */
    static COPP_BusType_PCIExpress => 3

    /**
     * AGP bus.
     * @type {Integer (Int32)}
     */
    static COPP_BusType_AGP => 4

    /**
     * Integrated bus. This flag can be combined with the other flags. This flag indicates that the command and status signals between the graphics adapter and other subsystems on the computer are not available on an expansion bus that has a public specification and standard connector type, unless it is a memory bus.
     * @type {Integer (Int32)}
     */
    static COPP_BusType_Integrated => -2147483648

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static COPP_BusType_ForceDWORD => 2147483647
}
