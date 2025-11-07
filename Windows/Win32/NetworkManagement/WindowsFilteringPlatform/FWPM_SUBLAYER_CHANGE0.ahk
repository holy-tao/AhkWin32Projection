#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Change notification dispatched to subscribers.
 * @remarks
 * 
 * <b>FWPM_SUBLAYER_CHANGE0</b> is a specific implementation of FWPM_SUBLAYER_CHANGE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_sublayer_change0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_SUBLAYER_CHANGE0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type of change as specified by [FWPM_CHANGE_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_change_type).
     * @type {Integer}
     */
    changeType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * GUID of the sublayer that changed.
     * @type {Pointer<Guid>}
     */
    subLayerKey {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
