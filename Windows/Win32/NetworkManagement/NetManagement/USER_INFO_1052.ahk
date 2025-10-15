#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The USER_INFO_1052 structure contains the path to a network user's profile. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_1052
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1052 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Specifies a Unicode string that contains the path to the user's profile. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. This value can be a null string, a local absolute path, or a UNC path.
     * @type {PWSTR}
     */
    usri1052_profile{
        get {
            if(!this.HasProp("__usri1052_profile"))
                this.__usri1052_profile := PWSTR(this.ptr + 0)
            return this.__usri1052_profile
        }
    }
}
