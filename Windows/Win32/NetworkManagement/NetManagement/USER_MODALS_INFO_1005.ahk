#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The USER_MODALS_INFO_1005 structure contains password history information for users and global groups in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_modals_info_1005
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_MODALS_INFO_1005 {
    #StructPack 4

    /**
     * Specifies the length of password history that the system maintains. A new password cannot match any of the previous usrmod<i>X</i>_password_hist_len passwords. Valid values for this element are zero through DEF_MAX_PWHIST.
     */
    usrmod1005_password_hist_len : UInt32

}
