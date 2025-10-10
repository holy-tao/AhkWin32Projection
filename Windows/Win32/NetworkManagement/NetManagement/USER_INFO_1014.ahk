#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_1014 structure contains the names of workstations from which the user can log on. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_1014
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1014 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * > [!IMPORTANT]
     * > You should no longer use **usri1014_workstations**. Instead, you can control sign-in access to workstations by configuring the User Rights Assignment settings (**Allow log on locally** and **Deny log on locally**, or **Allow log on through Remote Desktop Services** and **Deny log on through Remote Desktop Services**).
     * 
     * Pointer to a Unicode string that contains the names of workstations from which the user can log on. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. 
     * 
     * As many as eight workstations can be specified; the names must be separated by commas. A null string indicates that there is no restriction.
     * @type {Pointer<Char>}
     */
    usri1014_workstations {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
