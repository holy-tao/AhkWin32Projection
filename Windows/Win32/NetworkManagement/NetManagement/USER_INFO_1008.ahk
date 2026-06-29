#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USER_ACCOUNT_FLAGS.ahk" { USER_ACCOUNT_FLAGS }

/**
 * The USER_INFO_1008 structure contains a set of bit flags defining several user network account parameters. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1008
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1008 {
    #StructPack 4

    /**
     * The features to associate with the user account specified in the <i>username</i> parameter to the
     */
    usri1008_flags : USER_ACCOUNT_FLAGS

}
