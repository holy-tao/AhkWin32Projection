#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_V6_ADDR_AND_MASK.ahk

/**
 * The IPSEC_DOSP_STATE_ENUM_TEMPLATE0 structure.
 * @remarks
 * 
 * <b>IPSEC_DOSP_STATE_ENUM_TEMPLATE0</b> is a specific implementation of IPSEC_DOSP_STATE_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_dosp_state_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_DOSP_STATE_ENUM_TEMPLATE0 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * An [FWP_V6_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask) structure that specifies the public IPv6 address.
     * @type {FWP_V6_ADDR_AND_MASK}
     */
    publicV6AddrMask{
        get {
            if(!this.HasProp("__publicV6AddrMask"))
                this.__publicV6AddrMask := FWP_V6_ADDR_AND_MASK(0, this)
            return this.__publicV6AddrMask
        }
    }

    /**
     * An [FWP_V6_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask) structure that specifies the internal IPv6 address.
     * @type {FWP_V6_ADDR_AND_MASK}
     */
    internalV6AddrMask{
        get {
            if(!this.HasProp("__internalV6AddrMask"))
                this.__internalV6AddrMask := FWP_V6_ADDR_AND_MASK(24, this)
            return this.__internalV6AddrMask
        }
    }
}
