#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The USER_MODALS_INFO_3 structure contains lockout information for users and global groups in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_modals_info_3
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_MODALS_INFO_3 {
    #StructPack 4

    /**
     * Specifies, in seconds, how long a locked account remains locked before it is automatically unlocked.
     */
    usrmod3_lockout_duration : UInt32

    /**
     * Specifies the maximum time, in seconds, that can elapse between any two failed logon attempts before lockout occurs.
     */
    usrmod3_lockout_observation_window : UInt32

    /**
     * Specifies the number of invalid password authentications that can occur before an account is marked "locked out."
     */
    usrmod3_lockout_threshold : UInt32

}
