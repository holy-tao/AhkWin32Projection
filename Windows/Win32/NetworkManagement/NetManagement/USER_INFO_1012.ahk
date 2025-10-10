#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_1012 structure contains a user comment. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_1012
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1012 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a Unicode string that contains a user comment. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {Pointer<Char>}
     */
    usri1012_usr_comment {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
