#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWPM_CHANGE_TYPE.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Stores change notification dispatched to subscribers.
 * @remarks
 * <b>FWPM_FILTER_CHANGE0</b> is a specific implementation of FWPM_FILTER_CHANGE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_change0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_FILTER_CHANGE0 extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * A [FWPM_CHANGE_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_change_type) value that specifies the type of change notification to be dispatched.
     * @type {FWPM_CHANGE_TYPE}
     */
    changeType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * GUID of the filter that changed.
     * @type {Guid}
     */
    filterKey {
        get {
            if(!this.HasProp("__filterKey"))
                this.__filterKey := Guid(4, this)
            return this.__filterKey
        }
    }

    /**
     * LUID of the filter that changed.
     * @type {Integer}
     */
    filterId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
