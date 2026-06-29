#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AE_CLOSEFILE {
    #StructPack 4

    ae_cf_compname : UInt32

    ae_cf_username : UInt32

    ae_cf_resname : UInt32

    ae_cf_fileid : UInt32

    ae_cf_duration : UInt32

    ae_cf_reason : UInt32

}
