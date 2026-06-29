#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AE_SERVICESTAT {
    #StructPack 4

    ae_ss_compname : UInt32

    ae_ss_username : UInt32

    ae_ss_svcname : UInt32

    ae_ss_status : UInt32

    ae_ss_code : UInt32

    ae_ss_text : UInt32

    ae_ss_returnval : UInt32

}
