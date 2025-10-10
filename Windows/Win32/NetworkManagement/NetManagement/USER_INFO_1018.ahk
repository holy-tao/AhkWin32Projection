#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_1018 structure contains the maximum amount of disk space available to a network user account. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_1018
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1018 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies a <b>DWORD</b> value that indicates the maximum amount of disk space the user can use. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. 
     * 
     * 
     * 
     * 
     * You must specify USER_MAXSTORAGE_UNLIMITED to indicate that there is no restriction on disk space.
     * @type {Integer}
     */
    usri1018_max_storage {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
