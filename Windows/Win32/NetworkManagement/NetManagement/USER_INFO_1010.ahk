#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_1010 structure contains a set of bit flags defining the operator privileges assigned to a user network account. This information level is valid only when you call the NetUserSetInfo function.
 * @remarks
 * 
 *  For more information about controlling access to securable objects, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control">Access Control</a>, <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/privileges">Privileges</a>, and <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/securable-objects">Securable Objects</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_1010
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1010 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies a <b>DWORD</b> value that contains a set of bit flags that specify the user's operator privileges. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function.
     * @type {Integer}
     */
    usri1010_auth_flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
