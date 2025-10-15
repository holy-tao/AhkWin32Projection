#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The USER_INFO_1009 structure contains the path for a user's logon script file. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_1009
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1009 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a Unicode string specifying the path for the user's logon script file. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. The script file can be a .CMD file, an .EXE file, or a .BAT file. The string can also be null.
     * @type {PWSTR}
     */
    usri1009_script_path{
        get {
            if(!this.HasProp("__usri1009_script_path"))
                this.__usri1009_script_path := PWSTR(this.ptr + 0)
            return this.__usri1009_script_path
        }
    }
}
