#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_VALUE0.ahk

/**
 * Specifies a range of values.
 * @remarks
 * 
  * The elements <b>valueLow</b> and <b>valueHigh</b> must be the same data type and 
  * <b>valueHigh</b> must be greater than or equal to <b>valueLow</b>. 
  * 
  * Ranges are always inclusive. Thus, if a value equals
  * <b>valueLow</b> or <b>valueHigh</b>, it is contained in the range.
  * 
  * <b>FWP_RANGE0</b> is a specific implementation of FWP_RANGE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fwptypes/ns-fwptypes-fwp_range0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_RANGE0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Low value of the range.
     * 
     * See [FWP_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_value0) for more information.
     * @type {FWP_VALUE0}
     */
    valueLow{
        get {
            if(!this.HasProp("__valueLow"))
                this.__valueLow := FWP_VALUE0(this.ptr + 0)
            return this.__valueLow
        }
    }

    /**
     * High value of the range.
     * 
     * See [FWP_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_value0) for more information.
     * @type {FWP_VALUE0}
     */
    valueHigh{
        get {
            if(!this.HasProp("__valueHigh"))
                this.__valueHigh := FWP_VALUE0(this.ptr + 16)
            return this.__valueHigh
        }
    }
}
