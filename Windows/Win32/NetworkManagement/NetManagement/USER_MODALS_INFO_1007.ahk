#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The USER_MODALS_INFO_1007 structure contains domain controller information.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_modals_info_1007
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_MODALS_INFO_1007 {
    #StructPack 8

    /**
     * Pointer to a Unicode string that specifies the name of the domain controller that stores the primary copy of the database for the user account manager.
     */
    usrmod1007_primary : PWSTR

}
