#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AE_NETLOGOFF {
    #StructPack 4

    ae_nf_compname : UInt32

    ae_nf_username : UInt32

    ae_nf_reserved1 : UInt32

    ae_nf_reserved2 : UInt32

}
