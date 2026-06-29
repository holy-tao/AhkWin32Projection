#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Ldap
 */
export default struct LDAP_VERSION_INFO {
    #StructPack 4

    lv_size : UInt32

    lv_major : UInt32

    lv_minor : UInt32

}
