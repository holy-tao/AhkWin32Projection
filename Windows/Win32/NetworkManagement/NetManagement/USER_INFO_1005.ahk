#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USER_PRIV.ahk" { USER_PRIV }

/**
 * The USER_INFO_1005 structure contains a privilege level to assign to a user network account. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1005
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1005 {
    #StructPack 4

    /**
     * Specifies a <b>DWORD</b> value that indicates the level of privilege to assign for the user account specified in the <i>username</i> parameter to the
     */
    usri1005_priv : USER_PRIV

}
