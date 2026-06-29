#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USER_MODALS_ROLES.ahk" { USER_MODALS_ROLES }

/**
 * The USER_MODALS_INFO_1006 structure contains logon server information.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_modals_info_1006
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_MODALS_INFO_1006 {
    #StructPack 4

    usrmod1006_role : USER_MODALS_ROLES

}
