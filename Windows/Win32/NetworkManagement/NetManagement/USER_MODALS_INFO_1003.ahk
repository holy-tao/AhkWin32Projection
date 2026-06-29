#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The USER_MODALS_INFO_1003 structure contains the minimum duration for passwords in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_modals_info_1003
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_MODALS_INFO_1003 {
    #StructPack 4

    /**
     * Specifies the minimum number of seconds that can elapse between the time a password changes and when it can be changed again. A value of zero indicates that no delay is required between password updates. The value specified must be less than or equal to the value for the usrmod<i>X</i>_max_passwd_age member.
     */
    usrmod1003_min_passwd_age : UInt32

}
