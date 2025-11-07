#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used for enumerating sessions.
 * @remarks
 * 
 * Currently, there is no way to limit the
 * enumeration — all sessions are returned.
 * 
 * <b>FWPM_SESSION_ENUM_TEMPLATE0</b> is a specific implementation of FWPM_SESSION_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_session_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_SESSION_ENUM_TEMPLATE0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Reserved for system use.
     * @type {Integer}
     */
    reserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
