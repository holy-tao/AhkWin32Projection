#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_CONDITION_VALUE0.ahk

/**
 * Enumeration template used to enumerate security association (SA) contexts.
 * @remarks
 * <b>IPSEC_SA_CONTEXT_ENUM_TEMPLATE0</b> is a specific implementation of IPSEC_SA_CONTEXT_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_context_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_CONTEXT_ENUM_TEMPLATE0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * An [FWP_CONDITION_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_condition_value0) structure that specifies a subnet from which SA contexts that contain a local address will be returned.  This member may be empty.
     * 
     * Acceptable type values for this member are: [FWP_V6_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask).
     * @type {FWP_CONDITION_VALUE0}
     */
    localSubNet{
        get {
            if(!this.HasProp("__localSubNet"))
                this.__localSubNet := FWP_CONDITION_VALUE0(0, this)
            return this.__localSubNet
        }
    }

    /**
     * An [FWP_CONDITION_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_condition_value0) structure that specifies a subnet from which SA contexts that contain a remote address will be returned.  This member may be empty.
     * 
     * Acceptable type values for this member are: [FWP_V6_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask).
     * @type {FWP_CONDITION_VALUE0}
     */
    remoteSubNet{
        get {
            if(!this.HasProp("__remoteSubNet"))
                this.__remoteSubNet := FWP_CONDITION_VALUE0(16, this)
            return this.__remoteSubNet
        }
    }
}
