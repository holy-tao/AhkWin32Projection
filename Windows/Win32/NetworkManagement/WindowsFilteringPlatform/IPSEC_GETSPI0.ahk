#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_TRAFFIC0.ahk

/**
 * The IPSEC_GETSPI0 structure contains information that must be supplied when requesting a security parameter index (SPI) from the IPsec driver.Note  IPSEC_GETSPI0 is the specific implementation of IPSEC_GETSPI used in Windows Vista.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_getspi0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_GETSPI0 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * An [IPSEC_TRAFFIC0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic0) structure that describes traffic characteristics of the inbound IPsec SA.
     * @type {IPSEC_TRAFFIC0}
     */
    inboundIpsecTraffic{
        get {
            if(!this.HasProp("__inboundIpsecTraffic"))
                this.__inboundIpsecTraffic := IPSEC_TRAFFIC0(0, this)
            return this.__inboundIpsecTraffic
        }
    }

    /**
     * A [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version) value that indicates the IP version of the inbound IPsec traffic.
     * @type {Integer}
     */
    ipVersion {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Pointer<IPSEC_V4_UDP_ENCAPSULATION0>}
     */
    inboundUdpEncapsulation {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Not used. A <b>IPSEC_CRYPTO_MODULE_ID</b> is a <b>GUID</b> value.
     * @type {Pointer<Guid>}
     */
    rngCryptoModuleID {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
