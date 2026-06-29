#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AE_UASMOD {
    #StructPack 4

    ae_um_compname : UInt32

    ae_um_username : UInt32

    ae_um_resname : UInt32

    ae_um_rectype : UInt32

    ae_um_action : UInt32

    ae_um_datalen : UInt32

}
