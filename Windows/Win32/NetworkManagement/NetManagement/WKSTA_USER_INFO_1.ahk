#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The WKSTA_USER_INFO_1 structure contains user information as it pertains to a specific workstation. The information includes the name of the current user and the domains accessed by the workstation.
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/ns-lmwksta-wksta_user_info_1
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class WKSTA_USER_INFO_1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies the name of the user currently logged on to the workstation.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {PWSTR}
     */
    wkui1_username{
        get {
            if(!this.HasProp("__wkui1_username"))
                this.__wkui1_username := PWSTR(this.ptr + 0)
            return this.__wkui1_username
        }
    }

    /**
     * Specifies the name of the domain in which the user is currently logged on.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {PWSTR}
     */
    wkui1_logon_domain{
        get {
            if(!this.HasProp("__wkui1_logon_domain"))
                this.__wkui1_logon_domain := PWSTR(this.ptr + 8)
            return this.__wkui1_logon_domain
        }
    }

    /**
     * Specifies the list of operating system domains browsed by the workstation. The domain names are separated by blanks.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {PWSTR}
     */
    wkui1_oth_domains{
        get {
            if(!this.HasProp("__wkui1_oth_domains"))
                this.__wkui1_oth_domains := PWSTR(this.ptr + 16)
            return this.__wkui1_oth_domains
        }
    }

    /**
     * Specifies the name of the server that authenticated the user.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {PWSTR}
     */
    wkui1_logon_server{
        get {
            if(!this.HasProp("__wkui1_logon_server"))
                this.__wkui1_logon_server := PWSTR(this.ptr + 24)
            return this.__wkui1_logon_server
        }
    }
}
