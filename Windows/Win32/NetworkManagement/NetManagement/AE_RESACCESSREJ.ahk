#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AE_RESACCESSREJ {
    #StructPack 4

    ae_rr_compname : UInt32

    ae_rr_username : UInt32

    ae_rr_resname : UInt32

    ae_rr_operation : UInt32

}
