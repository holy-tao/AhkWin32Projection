#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains profile information in addition to the information provided by WLX_PROFILE_V1_0.
 * @remarks
 * 
  * This structure is returned to Winlogon by your GINA DLL.
  * 
  * Your GINA DLL may use two structures to provide profile information: <b>WLX_PROFILE_V2_0</b> and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_profile_v1_0">WLX_PROFILE_V1_0</a>. The information in <b>WLX_PROFILE_V1_0</b> only includes the profile type and path to the profile.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winwlx/ns-winwlx-wlx_profile_v2_0
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class WLX_PROFILE_V2_0 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Must be set to WLX_PROFILE_TYPE_V2_0.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the profile path (for example, "%SystemRoot%\system32\config\AprilM001", or a network path such as "\\server\share\profiles\floating\AprilM.usr"). 
     * 
     * 
     * 
     * 
     * The string pointed to by <b>pszProfile</b> must be separately allocated by your GINA DLL. It will be deallocated by Winlogon.
     * @type {Pointer<Char>}
     */
    pszProfile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the policy file that will be applied to the user logging on. 
     * 
     * 
     * 
     * 
     * The string pointed to by <b>pszPolicy</b> must be separately allocated by your <a href="https://docs.microsoft.com/windows/desktop/SecGloss/g-gly">GINA</a> DLL. It will be deallocated by <a href="https://docs.microsoft.com/windows/desktop/SecGloss/w-gly">Winlogon</a>.
     * @type {Pointer<Char>}
     */
    pszPolicy {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * If a new profile is to be created, a pointer to the path of the default profile to use. 
     * 
     * 
     * 
     * 
     * The string pointed to by <b>pszNetworkDefaultUserProfile</b> must be separately allocated by your GINA DLL. It will be deallocated by Winlogon.
     * @type {Pointer<Char>}
     */
    pszNetworkDefaultUserProfile {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the name of the server that validated the logon. This name will be used to enumerate the global groups of which the user is a member. 
     * 
     * 
     * 
     * 
     * The string pointed to by <b>pszServerName</b> must be separately allocated by your GINA DLL. It will be deallocated by Winlogon.
     * @type {Pointer<Char>}
     */
    pszServerName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the default environment variables to include in the construction of the environment of the user. This member is a series of null-terminated strings using any of the following forms.
     * 
     * 
     * ```cpp
     * Variable=Value
     * variable=%other variable% 
     * variable=%othervariable%\additional text
     * 
     * ```
     * 
     * 
     * For example:
     * 
     * 
     * ```cpp
     * logonServer=\\pdc
     * homepath=%logonServer%\share
     * 
     * ```
     * @type {Pointer<Char>}
     */
    pszEnvironment {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
