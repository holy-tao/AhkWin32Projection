#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The USER_INFO_21 structure contains a one-way encrypted LAN Manager 2.x-compatible password.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_21
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_21 {
    #StructPack 1

    /**
     * Specifies a one-way encrypted LAN Manager 2.<i>x</i>-compatible password.
     */
    usri21_password : Int8[16]

}
