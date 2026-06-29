#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct AUDIT_ENTRY {
    #StructPack 4

    ae_len : UInt32

    ae_reserved : UInt32

    ae_time : UInt32

    ae_type : UInt32

    ae_data_offset : UInt32

    ae_data_size : UInt32

}
