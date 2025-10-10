#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_MODALS_INFO_1003 structure contains the minimum duration for passwords in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_modals_info_1003
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_MODALS_INFO_1003 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the minimum number of seconds that can elapse between the time a password changes and when it can be changed again. A value of zero indicates that no delay is required between password updates. The value specified must be less than or equal to the value for the usrmod<i>X</i>_max_passwd_age member.
     * @type {Integer}
     */
    usrmod1003_min_passwd_age {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
