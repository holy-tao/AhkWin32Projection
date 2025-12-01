#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_MODALS_INFO_0 structure contains global password information for users and global groups in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_modals_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_MODALS_INFO_0 extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Specifies the minimum allowable password length. Valid values for this element are zero through LM20_PWLEN.
     * @type {Integer}
     */
    usrmod0_min_passwd_len {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies, in seconds, the maximum allowable password age. A value of TIMEQ_FOREVER indicates that the password never expires. The minimum valid value for this element is ONE_DAY. The value specified must be greater than or equal to the value for the <b>usrmod0_min_passwd_age</b> member.
     * @type {Integer}
     */
    usrmod0_max_passwd_age {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the minimum number of seconds that can elapse between the time a password changes and when it can be changed again. A value of zero indicates that no delay is required between password updates. The value specified must be less than or equal to the value for the <b>usrmod0_max_passwd_age</b> member.
     * @type {Integer}
     */
    usrmod0_min_passwd_age {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies, in seconds, the amount of time between the end of the valid logon time and the time when the user is forced to log off the network. A value of TIMEQ_FOREVER indicates that the user is never forced to log off. A value of zero indicates that the user will be forced to log off immediately when the valid logon time expires.
     * @type {Integer}
     */
    usrmod0_force_logoff {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the length of password history maintained. A new password cannot match any of the previous <b>usrmod0_password_hist_len</b> passwords. Valid values for this element are zero through DEF_MAX_PWHIST.
     * @type {Integer}
     */
    usrmod0_password_hist_len {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
