#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AE_ACLMOD {
    #StructPack 4

    ae_am_compname : UInt32

    ae_am_username : UInt32

    ae_am_resname : UInt32

    ae_am_action : UInt32

    ae_am_datalen : UInt32

}
