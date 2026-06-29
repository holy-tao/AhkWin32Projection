#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_DATA_TYPE.ahk" { FWP_DATA_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FWPM_FIELD_TYPE.ahk" { FWPM_FIELD_TYPE }

/**
 * Specifies schema information for a field.
 * @remarks
 * <b>FWPM_FIELD0</b> is a specific implementation of FWPM_FIELD. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_field0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_FIELD0 {
    #StructPack 8

    /**
     * Uniquely identifies the field. See FWPM_CONDITION_* identifiers in the topic <a href="https://docs.microsoft.com/windows/desktop/FWP/filtering-condition-identifiers-">Filtering Condition Identifiers</a>.
     */
    fieldKey : Guid.Ptr

    /**
     * Determines how <b>dataType</b> is interpreted.
     * 
     * See [FWPM_FIELD_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_field_type) for more information.
     */
    type : FWPM_FIELD_TYPE

    /**
     * Data type passed to classify.
     * 
     * See [FWP_DATA_TYPE](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_data_type) for more information.
     */
    dataType : FWP_DATA_TYPE

}
