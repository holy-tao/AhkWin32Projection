#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\FWP_CONDITION_VALUE0.ahk

/**
 * Expresses a filter condition that must be true for the action to be taken.
 * @remarks
 * 
  * Field GUIDs are
  *    only unique within a layer, so both the field GUID and the layer GUID are required to uniquely identify a
  *    field.
  * 
  * The data type of 
  * [FWP_MATCH_TYPE](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_match_type) for detailed  compatibility rules.
  * 
  * <b>FWPM_FILTER_CONDITION0</b> is a specific implementation of FWPM_FILTER_CONDITION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_filter_condition0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_FILTER_CONDITION0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * GUID of the field to be tested.
     * @type {Pointer<Guid>}
     */
    fieldKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A [FWP_MATCH_TYPE](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_match_type) value that specifies the type of match to be performed.
     * @type {Integer}
     */
    matchType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A [FWP_CONDITION_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_condition_value0) structure that contains the value to match the field against.
     * @type {FWP_CONDITION_VALUE0}
     */
    conditionValue{
        get {
            if(!this.HasProp("__conditionValue"))
                this.__conditionValue := FWP_CONDITION_VALUE0(this.ptr + 16)
            return this.__conditionValue
        }
    }
}
