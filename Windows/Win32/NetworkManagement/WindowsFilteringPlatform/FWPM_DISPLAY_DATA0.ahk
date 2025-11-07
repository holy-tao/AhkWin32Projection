#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores an optional friendly name and an optional description for an object.
 * @remarks
 * 
 * In order to
 * support MUI, both strings may contain indirect strings. See
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shloadindirectstring">SHLoadIndirectString</a> for details.
 * 
 * <b>FWPM_DISPLAY_DATA0</b> is a specific implementation of FWPM_DISPLAY_DATA. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fwptypes/ns-fwptypes-fwpm_display_data0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_DISPLAY_DATA0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Optional friendly name.
     * @type {PWSTR}
     */
    name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Optional description.
     * @type {PWSTR}
     */
    description {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
