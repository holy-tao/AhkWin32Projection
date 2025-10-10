#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies schema information for a field.
 * @remarks
 * 
  * <b>FWPM_FIELD0</b> is a specific implementation of FWPM_FIELD. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_field0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_FIELD0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Uniquely identifies the field. See FWPM_CONDITION_* identifiers in the topic <a href="https://docs.microsoft.com/windows/desktop/FWP/filtering-condition-identifiers-">Filtering Condition Identifiers</a>.
     * @type {Pointer<Guid>}
     */
    fieldKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Determines how <b>dataType</b> is interpreted.
     * 
     * See [FWPM_FIELD_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_field_type) for more information.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Data type passed to classify.
     * 
     * See [FWP_DATA_TYPE](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_data_type) for more information.
     * @type {Integer}
     */
    dataType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
