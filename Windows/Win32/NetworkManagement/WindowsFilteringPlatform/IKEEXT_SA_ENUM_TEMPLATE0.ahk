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
 * Is an enumeration template used for enumerating IKE/AuthIP security associations (SAs).
 * @remarks
 * <b>IKEEXT_SA_ENUM_TEMPLATE0</b> is a specific implementation of IKEEXT_SA_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_sa_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_SA_ENUM_TEMPLATE0 {
    #StructPack 8

    /**
     * Matches SAs whose local address is on the specified subnet. Must be of one of the following types.
     * 
     * <ul>
     * <li>FWP_UINT32</li>
     * <li>FWP_BYTE_ARRAY16_TYPE</li>
     * <li>FWP_V4_ADDR_MASK</li>
     * <li>FWP_V6_ADDR_MASK</li>
     * </ul>
     * See [FWP_CONDITION_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_condition_value0) for more information.
     */
    localSubNet : FWP_CONDITION_VALUE0

    /**
     * Matches SAs whose remote address is on the specified subnet. Must be of one of the following types.
     * 
     * <ul>
     * <li>FWP_UINT32</li>
     * <li>FWP_BYTE_ARRAY16_TYPE</li>
     * <li>FWP_V4_ADDR_MASK</li>
     * <li>FWP_V6_ADDR_MASK</li>
     * </ul>
     * See [FWP_CONDITION_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_condition_value0) for more information.
     */
    remoteSubNet : FWP_CONDITION_VALUE0

    /**
     * Matches SAs with a matching local main mode SHA thumbprint.  If none exist, this member will have a length of zero.
     * 
     * See [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) for more information.
     */
    localMainModeCertHash : FWP_BYTE_BLOB

}
