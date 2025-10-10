#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_MODALS_INFO_1006 structure contains logon server information.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_modals_info_1006
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_MODALS_INFO_1006 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    usrmod1006_role {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
