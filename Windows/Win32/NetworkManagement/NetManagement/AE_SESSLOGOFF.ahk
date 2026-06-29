#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AE_SESSLOGOFF {
    #StructPack 4

    ae_sf_compname : UInt32

    ae_sf_username : UInt32

    ae_sf_reason : UInt32

}
