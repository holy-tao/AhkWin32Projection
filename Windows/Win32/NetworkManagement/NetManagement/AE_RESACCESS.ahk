#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AE_RESACCESS {
    #StructPack 4

    ae_ra_compname : UInt32

    ae_ra_username : UInt32

    ae_ra_resname : UInt32

    ae_ra_operation : UInt32

    ae_ra_returncode : UInt32

    ae_ra_restype : UInt32

    ae_ra_fileid : UInt32

}
