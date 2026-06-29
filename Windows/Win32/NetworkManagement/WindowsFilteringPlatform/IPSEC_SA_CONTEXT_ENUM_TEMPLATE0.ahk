#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\FWP_CONDITION_VALUE0.ahk" { FWP_CONDITION_VALUE0 }
#Import ".\FWP_TOKEN_INFORMATION.ahk" { FWP_TOKEN_INFORMATION }
#Import ".\FWP_V6_ADDR_AND_MASK.ahk" { FWP_V6_ADDR_AND_MASK }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWP_BYTE_ARRAY6.ahk" { FWP_BYTE_ARRAY6 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\FWP_DATA_TYPE.ahk" { FWP_DATA_TYPE }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }
#Import ".\FWP_V4_ADDR_AND_MASK.ahk" { FWP_V4_ADDR_AND_MASK }
#Import ".\FWP_RANGE0.ahk" { FWP_RANGE0 }

/**
 * Enumeration template used to enumerate security association (SA) contexts.
 * @remarks
 * <b>IPSEC_SA_CONTEXT_ENUM_TEMPLATE0</b> is a specific implementation of IPSEC_SA_CONTEXT_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_context_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_CONTEXT_ENUM_TEMPLATE0 {
    #StructPack 8

    /**
     * An [FWP_CONDITION_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_condition_value0) structure that specifies a subnet from which SA contexts that contain a local address will be returned.  This member may be empty.
     * 
     * Acceptable type values for this member are: [FWP_V6_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask).
     */
    localSubNet : FWP_CONDITION_VALUE0

    /**
     * An [FWP_CONDITION_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_condition_value0) structure that specifies a subnet from which SA contexts that contain a remote address will be returned.  This member may be empty.
     * 
     * Acceptable type values for this member are: [FWP_V6_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask).
     */
    remoteSubNet : FWP_CONDITION_VALUE0

}
