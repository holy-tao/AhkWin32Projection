#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USER_MODALS_ROLES.ahk

/**
 * The USER_MODALS_INFO_1006 structure contains logon server information.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_modals_info_1006
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class USER_MODALS_INFO_1006 extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {USER_MODALS_ROLES}
     */
    usrmod1006_role {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
