#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The USER_MODALS_INFO_1001 structure contains the minimum length for passwords in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_modals_info_1001
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_MODALS_INFO_1001 {
    #StructPack 4

    /**
     * Specifies the minimum allowable password length. Valid values for this element are zero through PWLEN.
     */
    usrmod1001_min_passwd_len : UInt32

}
