#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VDS_ISCSI_IPSEC_FLAG enumeration (vdshwprv.h) is not supported. This enumeration is reserved for future use.
 * @remarks
 * These flags are identical to the definitions for the iSNS portal security 
 *    bitmap.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_ISCSI_IPSEC_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_ISCSI_IPSEC_FLAG</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_iscsi_ipsec_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_ISCSI_IPSEC_FLAG extends Win32Enum {

    /**
     * This bit must be set for the field to contain significant information.
     * Native name: VDS_IIF_VALID
     * @type {Integer (Int32)}
     */
    static IIF_VALID => 1

    /**
     * If set, IKE/IPSEC is enabled.
     * Native name: VDS_IIF_IKE
     * @type {Integer (Int32)}
     */
    static IIF_IKE => 2

    /**
     * If set, negotiate through main mode is enabled.
     * Native name: VDS_IIF_MAIN_MODE
     * @type {Integer (Int32)}
     */
    static IIF_MAIN_MODE => 4

    /**
     * If set, negotiate through aggressive mode is enabled.
     * Native name: VDS_IIF_AGGRESSIVE_MODE
     * @type {Integer (Int32)}
     */
    static IIF_AGGRESSIVE_MODE => 8

    /**
     * If set, perfect forward secrecy is enabled.
     * Native name: VDS_IIF_PFS_ENABLE
     * @type {Integer (Int32)}
     */
    static IIF_PFS_ENABLE => 16

    /**
     * If set, transport mode is preferred.
     * Native name: VDS_IIF_TRANSPORT_MODE_PREFERRED
     * @type {Integer (Int32)}
     */
    static IIF_TRANSPORT_MODE_PREFERRED => 32

    /**
     * If set, tunnel mode is preferred.
     * Native name: VDS_IIF_TUNNEL_MODE_PREFERRED
     * @type {Integer (Int32)}
     */
    static IIF_TUNNEL_MODE_PREFERRED => 64
}
