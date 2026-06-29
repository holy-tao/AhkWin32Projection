#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AE_LOCKOUT {
    #StructPack 4

    ae_lk_compname : UInt32

    ae_lk_username : UInt32

    ae_lk_action : UInt32

    ae_lk_bad_pw_count : UInt32

}
