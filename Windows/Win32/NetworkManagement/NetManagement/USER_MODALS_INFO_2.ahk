#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_MODALS_INFO_2 structure contains the Security Account Manager (SAM) domain name and identifier.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_modals_info_2
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_MODALS_INFO_2 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the name of the Security Account Manager (SAM) domain. For a domain controller, this is the name of the domain that the controller is a member of. For workstations, this is the name of the computer.
     * @type {Pointer<PWSTR>}
     */
    usrmod2_domain_name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that contains the security identifier (SID) of the domain named by the <b>usrmod2_domain_name</b> member.
     * @type {Pointer<PSID>}
     */
    usrmod2_domain_id {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
