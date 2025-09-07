#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the method of encapsulating Ethernet II and SNAP traffic. Reserved.
 * @remarks
 * This enumeration is reserved.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_ether_encap_method
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_ETHER_ENCAP_METHOD{

    /**
     * Specifies Ethernet V2 encapsulation.
     * @type {Integer (Int32)}
     */
    static FWP_ETHER_ENCAP_METHOD_ETHER_V2 => 0

    /**
     * Specifies Subnet Access Protocol (SNAP) encapsulation with an unknown Organizationally Unique Identifier (OUI) and Service Access Point (SAP) prefix.
     * @type {Integer (Int32)}
     */
    static FWP_ETHER_ENCAP_METHOD_SNAP => 1

    /**
     * Specifies SNAP encapsulation with a recognized OUI and a SAP prefix of 03.AA.AA.00.00.00 + Ethertype.
     * @type {Integer (Int32)}
     */
    static FWP_ETHER_ENCAP_METHOD_SNAP_W_OUI_ZERO => 3
}
