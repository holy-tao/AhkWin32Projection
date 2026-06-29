#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AE_CONNSTART {
    #StructPack 4

    ae_ct_compname : UInt32

    ae_ct_username : UInt32

    ae_ct_netname : UInt32

    ae_ct_connid : UInt32

}
