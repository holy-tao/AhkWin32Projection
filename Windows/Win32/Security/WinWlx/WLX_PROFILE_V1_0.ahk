#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information used for setting up the initial environment.
 * @remarks
 * The <b>WLX_PROFILE_V1_0</b> structure is returned to Winlogon by your GINA DLL following authentication. Winlogon uses the path specified by <b>pszProfile</b> to load the profile of the newly logged-on user.
 * 
 * GINA uses two structures to provide profile information: <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_profile_v2_0">WLX_PROFILE_V2_0</a> and <b>WLX_PROFILE_V1_0</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_profile_v1_0
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct WLX_PROFILE_V1_0 {
    #StructPack 8

    /**
     * Must be set to WLX_PROFILE_TYPE_V1_0.
     */
    dwType : UInt32

    /**
     * Pointer to the profile path (for example, "%SystemRoot%\system32\config\AprilM001"). 
     * 
     * 
     * 
     * 
     * The string pointed to by <b>pszProfile</b> must be separately allocated by your <a href="https://docs.microsoft.com/windows/desktop/SecGloss/g-gly">GINA</a> DLL. It will be deallocated by <a href="https://docs.microsoft.com/windows/desktop/SecGloss/w-gly">Winlogon</a>.
     */
    pszProfile : PWSTR

}
