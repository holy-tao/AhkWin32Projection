#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The USER_INFO_1007 structure contains a comment associated with a user network account. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_1007
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1007 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a Unicode string that contains a comment to associate with the user account specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {PWSTR}
     */
    usri1007_comment{
        get {
            if(!this.HasProp("__usri1007_comment"))
                this.__usri1007_comment := PWSTR(this.ptr + 0)
            return this.__usri1007_comment
        }
    }
}
