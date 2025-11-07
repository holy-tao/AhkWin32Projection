#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used for setting up the initial environment.
 * @remarks
 * 
 * The <b>WLX_PROFILE_V1_0</b> structure is returned to Winlogon by your GINA DLL following authentication. Winlogon uses the path specified by <b>pszProfile</b> to load the profile of the newly logged-on user.
 * 
 * GINA uses two structures to provide profile information: <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_profile_v2_0">WLX_PROFILE_V2_0</a> and <b>WLX_PROFILE_V1_0</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winwlx/ns-winwlx-wlx_profile_v1_0
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class WLX_PROFILE_V1_0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Must be set to WLX_PROFILE_TYPE_V1_0.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the profile path (for example, "%SystemRoot%\system32\config\AprilM001"). 
     * 
     * 
     * 
     * 
     * The string pointed to by <b>pszProfile</b> must be separately allocated by your <a href="https://docs.microsoft.com/windows/desktop/SecGloss/g-gly">GINA</a> DLL. It will be deallocated by <a href="https://docs.microsoft.com/windows/desktop/SecGloss/w-gly">Winlogon</a>.
     * @type {PWSTR}
     */
    pszProfile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
