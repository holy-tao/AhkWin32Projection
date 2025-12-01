#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_MODALS_INFO_1002 structure contains the maximum duration for passwords in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_modals_info_1002
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_MODALS_INFO_1002 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies, in seconds, the maximum allowable password age. A value of TIMEQ_FOREVER indicates that the password never expires. The minimum valid value for this element is ONE_DAY. The value specified must be greater than or equal to the value for the usrmod<i>X</i>_min_passwd_age member.
     * @type {Integer}
     */
    usrmod1002_max_passwd_age {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
