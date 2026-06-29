#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AE_NETLOGON {
    #StructPack 4

    ae_no_compname : UInt32

    ae_no_username : UInt32

    ae_no_privilege : UInt32

    ae_no_authflags : UInt32

}
