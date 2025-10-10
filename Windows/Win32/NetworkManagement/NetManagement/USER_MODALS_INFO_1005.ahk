#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_MODALS_INFO_1005 structure contains password history information for users and global groups in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_modals_info_1005
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_MODALS_INFO_1005 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the length of password history that the system maintains. A new password cannot match any of the previous usrmod<i>X</i>_password_hist_len passwords. Valid values for this element are zero through DEF_MAX_PWHIST.
     * @type {Integer}
     */
    usrmod1005_password_hist_len {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
