#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\FWP_TOKEN_INFORMATION.ahk" { FWP_TOKEN_INFORMATION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWP_BYTE_ARRAY6.ahk" { FWP_BYTE_ARRAY6 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\FWP_VALUE0.ahk" { FWP_VALUE0 }
#Import ".\FWP_DATA_TYPE.ahk" { FWP_DATA_TYPE }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }

/**
 * Specifies a range of values.
 * @remarks
 * The elements <b>valueLow</b> and <b>valueHigh</b> must be the same data type and 
 * <b>valueHigh</b> must be greater than or equal to <b>valueLow</b>. 
 * 
 * Ranges are always inclusive. Thus, if a value equals
 * <b>valueLow</b> or <b>valueHigh</b>, it is contained in the range.
 * 
 * <b>FWP_RANGE0</b> is a specific implementation of FWP_RANGE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-fwp_range0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_RANGE0 {
    #StructPack 8

    /**
     * Low value of the range.
     * 
     * See [FWP_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_value0) for more information.
     */
    valueLow : FWP_VALUE0

    /**
     * High value of the range.
     * 
     * See [FWP_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_value0) for more information.
     */
    valueHigh : FWP_VALUE0

}
