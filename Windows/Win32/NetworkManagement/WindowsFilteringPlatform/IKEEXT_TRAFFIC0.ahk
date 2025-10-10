#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the IKE/Authip traffic.
 * @remarks
 * 
  * <b>IKEEXT_TRAFFIC0</b> is a specific implementation of IKEEXT_TRAFFIC. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_traffic0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_TRAFFIC0 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * IP version specified by [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version).
     * @type {Integer}
     */
    ipVersion {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    localV4Address {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    localV6Address{
        get {
            if(!this.HasProp("__localV6AddressProxyArray"))
                this.__localV6AddressProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "char")
            return this.__localV6AddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    remoteV4Address {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    remoteV6Address{
        get {
            if(!this.HasProp("__remoteV6AddressProxyArray"))
                this.__remoteV6AddressProxyArray := Win32FixedArray(this.ptr + 24, 16, Primitive, "char")
            return this.__remoteV6AddressProxyArray
        }
    }

    /**
     * Filter ID from quick mode (QM) policy of matching extended mode (EM) filter.
     * @type {Integer}
     */
    authIpFilterId {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
