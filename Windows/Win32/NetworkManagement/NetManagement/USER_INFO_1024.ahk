#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_1024 structure contains the country/region code for a network user's language of choice. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1024
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1024 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies a <b>DWORD</b> value that indicates the country/region code for the user's language of choice. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. 
     * 
     * 
     * 
     * 
     * This value is ignored.
     * @type {Integer}
     */
    usri1024_country_code {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
