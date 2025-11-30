#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Not supported.This enumeration is reserved for future use.
 * @remarks
 * 
 * These flags are identical to the definitions for the iSNS portal security 
 *    bitmap.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_ISCSI_IPSEC_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_ISCSI_IPSEC_FLAG</b> enumeration constant.</div>
 * <div> </div>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_iscsi_ipsec_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ISCSI_IPSEC_FLAG extends Win32Enum{

    /**
     * This bit must be set for the field to contain significant information.
     * @type {Integer (Int32)}
     */
    static VDS_IIF_VALID => 1

    /**
     * If set, IKE/IPSEC is enabled.
     * @type {Integer (Int32)}
     */
    static VDS_IIF_IKE => 2

    /**
     * If set, negotiate through main mode is enabled.
     * @type {Integer (Int32)}
     */
    static VDS_IIF_MAIN_MODE => 4

    /**
     * If set, negotiate through aggressive mode is enabled.
     * @type {Integer (Int32)}
     */
    static VDS_IIF_AGGRESSIVE_MODE => 8

    /**
     * If set, perfect forward secrecy is enabled.
     * @type {Integer (Int32)}
     */
    static VDS_IIF_PFS_ENABLE => 16

    /**
     * If set, transport mode is preferred.
     * @type {Integer (Int32)}
     */
    static VDS_IIF_TRANSPORT_MODE_PREFERRED => 32

    /**
     * If set, tunnel mode is preferred.
     * @type {Integer (Int32)}
     */
    static VDS_IIF_TUNNEL_MODE_PREFERRED => 64
}
