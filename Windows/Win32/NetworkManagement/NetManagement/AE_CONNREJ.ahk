#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AE_CONNREJ {
    #StructPack 4

    ae_cr_compname : UInt32

    ae_cr_username : UInt32

    ae_cr_netname : UInt32

    ae_cr_reason : UInt32

}
