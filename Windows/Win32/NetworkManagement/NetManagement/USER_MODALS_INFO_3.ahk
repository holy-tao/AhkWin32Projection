#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_MODALS_INFO_3 structure contains lockout information for users and global groups in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_modals_info_3
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_MODALS_INFO_3 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Specifies, in seconds, how long a locked account remains locked before it is automatically unlocked.
     * @type {Integer}
     */
    usrmod3_lockout_duration {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the maximum time, in seconds, that can elapse between any two failed logon attempts before lockout occurs.
     * @type {Integer}
     */
    usrmod3_lockout_observation_window {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the number of invalid password authentications that can occur before an account is marked "locked out."
     * @type {Integer}
     */
    usrmod3_lockout_threshold {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
