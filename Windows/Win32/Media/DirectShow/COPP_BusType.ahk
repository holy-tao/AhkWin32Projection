#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of I/O bus used by the graphics adapter.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ne-dxva9typ-copp_bustype
 * @namespace Windows.Win32.Media.DirectShow
 */
class COPP_BusType extends Win32Enum {

    /**
     * Unknown bus type.
     * Native name: COPP_BusType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * PCI bus.
     * Native name: COPP_BusType_PCI
     * @type {Integer (Int32)}
     */
    static PCI => 1

    /**
     * PCI-X bus.
     * Native name: COPP_BusType_PCIX
     * @type {Integer (Int32)}
     */
    static PCIX => 2

    /**
     * PCI Express bus.
     * Native name: COPP_BusType_PCIExpress
     * @type {Integer (Int32)}
     */
    static PCIExpress => 3

    /**
     * AGP bus.
     * Native name: COPP_BusType_AGP
     * @type {Integer (Int32)}
     */
    static AGP => 4

    /**
     * Integrated bus. This flag can be combined with the other flags. This flag indicates that the command and status signals between the graphics adapter and other subsystems on the computer are not available on an expansion bus that has a public specification and standard connector type, unless it is a memory bus.
     * Native name: COPP_BusType_Integrated
     * @type {Integer (Int32)}
     */
    static Integrated => -2147483648

    /**
     * Reserved.
     * Native name: COPP_BusType_ForceDWORD
     * @type {Integer (Int32)}
     */
    static ForceDWORD => 2147483647
}
