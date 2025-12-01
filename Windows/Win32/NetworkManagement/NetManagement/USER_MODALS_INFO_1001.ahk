#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_MODALS_INFO_1001 structure contains the minimum length for passwords in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_modals_info_1001
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_MODALS_INFO_1001 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the minimum allowable password length. Valid values for this element are zero through PWLEN.
     * @type {Integer}
     */
    usrmod1001_min_passwd_len {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
