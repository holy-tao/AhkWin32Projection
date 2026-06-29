#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\FWP_MATCH_TYPE.ahk" { FWP_MATCH_TYPE }
#Import ".\FWP_RANGE0.ahk" { FWP_RANGE0 }
#Import ".\FWP_BYTE_ARRAY6.ahk" { FWP_BYTE_ARRAY6 }
#Import ".\FWP_V4_ADDR_AND_MASK.ahk" { FWP_V4_ADDR_AND_MASK }
#Import ".\FWP_V6_ADDR_AND_MASK.ahk" { FWP_V6_ADDR_AND_MASK }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWP_DATA_TYPE.ahk" { FWP_DATA_TYPE }
#Import ".\FWP_CONDITION_VALUE0.ahk" { FWP_CONDITION_VALUE0 }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FWP_TOKEN_INFORMATION.ahk" { FWP_TOKEN_INFORMATION }

/**
 * Expresses a filter condition that must be true for the action to be taken.
 * @remarks
 * Field GUIDs are
 *    only unique within a layer, so both the field GUID and the layer GUID are required to uniquely identify a
 *    field.
 * 
 * The data type of 
 * 
 * [FWP_MATCH_TYPE](https://docs.microsoft.com/windows/desktop/api/fwptypes/ne-fwptypes-fwp_match_type) for detailed  compatibility rules.
 * 
 * 
 * <b>FWPM_FILTER_CONDITION0</b> is a specific implementation of FWPM_FILTER_CONDITION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_condition0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_FILTER_CONDITION0 {
    #StructPack 8

    /**
     * GUID of the field to be tested. The available keys are listed under [Filtering Condition Identifiers](/windows/win32/fwp/filtering-condition-identifiers-).
     */
    fieldKey : Guid

    /**
     * A [FWP_MATCH_TYPE](https://docs.microsoft.com/windows/desktop/api/fwptypes/ne-fwptypes-fwp_match_type) value that specifies the type of match to be performed.
     */
    matchType : FWP_MATCH_TYPE

    /**
     * A [FWP_CONDITION_VALUE0](https://docs.microsoft.com/windows/desktop/api/fwptypes/ns-fwptypes-fwp_condition_value0) structure that contains the value to match the field against.
     */
    conditionValue : FWP_CONDITION_VALUE0

}
