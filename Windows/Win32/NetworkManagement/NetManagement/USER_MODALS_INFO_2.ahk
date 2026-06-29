#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Security\PSID.ahk" { PSID }

/**
 * The USER_MODALS_INFO_2 structure contains the Security Account Manager (SAM) domain name and identifier.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_modals_info_2
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_MODALS_INFO_2 {
    #StructPack 8

    /**
     * Specifies the name of the Security Account Manager (SAM) domain. For a domain controller, this is the name of the domain that the controller is a member of. For workstations, this is the name of the computer.
     */
    usrmod2_domain_name : PWSTR

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that contains the security identifier (SID) of the domain named by the <b>usrmod2_domain_name</b> member.
     */
    usrmod2_domain_id : PSID

}
