#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\PSID.ahk" { PSID }

/**
 * The LOCALGROUP_MEMBERS_INFO_0 structure contains the security identifier (SID) associated with a local group member. The member can be a user account or a global group account.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-localgroup_members_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct LOCALGROUP_MEMBERS_INFO_0 {
    #StructPack 8

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that contains the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">security identifier (SID)</a> of the local group member.
     */
    lgrmi0_sid : PSID

}
