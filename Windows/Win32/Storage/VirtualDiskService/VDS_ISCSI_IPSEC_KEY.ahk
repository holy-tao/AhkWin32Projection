#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VDS_ISCSI_IPSEC_KEY structure (vdshwprv.h) is not supported and is reserved for future use.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_ipsec_key
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_ISCSI_IPSEC_KEY {
    #StructPack 8

    /**
     * Reserved for future use.
     */
    pKey : IntPtr

    /**
     * Reserved for future use.
     */
    ulKeySize : UInt32

}
