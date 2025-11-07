#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_1003 structure contains a user password. This information level is valid only when you call the NetUserSetInfo function.
 * @remarks
 * 
 * By convention, the length of passwords is limited to LM20_PWLEN characters.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_1003
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1003 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Specifies a Unicode string that contains the password for the user account specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. The length cannot exceed PWLEN bytes.
     * @type {PWSTR}
     */
    usri1003_password {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
