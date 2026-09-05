#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the method of encapsulating Ethernet II and SNAP traffic. Reserved.
 * @remarks
 * This enumeration is reserved.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_ether_encap_method
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWP_ETHER_ENCAP_METHOD extends Win32Enum {

    /**
     * Specifies Ethernet V2 encapsulation.
     * Native name: FWP_ETHER_ENCAP_METHOD_ETHER_V2
     * @type {Integer (Int32)}
     */
    static ETHER_V2 => 0

    /**
     * Specifies Subnet Access Protocol (SNAP) encapsulation with an unknown Organizationally Unique Identifier (OUI) and Service Access Point (SAP) prefix.
     * Native name: FWP_ETHER_ENCAP_METHOD_SNAP
     * @type {Integer (Int32)}
     */
    static SNAP => 1

    /**
     * Specifies SNAP encapsulation with a recognized OUI and a SAP prefix of 03.AA.AA.00.00.00 + Ethertype.
     * Native name: FWP_ETHER_ENCAP_METHOD_SNAP_W_OUI_ZERO
     * @type {Integer (Int32)}
     */
    static SNAP_W_OUI_ZERO => 3
}
