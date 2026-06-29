#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AE_CONNSTOP {
    #StructPack 4

    ae_cp_compname : UInt32

    ae_cp_username : UInt32

    ae_cp_netname : UInt32

    ae_cp_connid : UInt32

    ae_cp_reason : UInt32

}
