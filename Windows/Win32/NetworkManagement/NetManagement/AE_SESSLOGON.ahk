#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AE_SESSLOGON {
    #StructPack 4

    ae_so_compname : UInt32

    ae_so_username : UInt32

    ae_so_privilege : UInt32

}
