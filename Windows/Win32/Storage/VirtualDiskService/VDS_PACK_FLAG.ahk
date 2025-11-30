#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of valid flags for a pack object.
 * @remarks
 * 
 * Pack flags apply to packs managed by the dynamic provider only. The provider sets these flags on offline packs to report the reason for the offline status.
 * 
 * This enumeration provides the values for the <i>ulFlags</i> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_pack_prop">VDS_PACK_PROP</a> structure.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_PACK_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_PACK_FLAG</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_pack_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PACK_FLAG extends Win32Enum{

    /**
     * If set, an external pack is eligible for online status.
     * @type {Integer (Int32)}
     */
    static VDS_PKF_FOREIGN => 1

    /**
     * If  set, a dynamic pack lacks the required quorum. A quorum is the minimum number of disks in a dynamic pack (n/2 + 1) required to enable online status. This flag prevents the caller from granting online status to the same pack on multiple computers.
     * @type {Integer (Int32)}
     */
    static VDS_PKF_NOQUORUM => 2

    /**
     * If set, the pack policy prevents online eligibility.  This flag applies exclusively to packs managed by  the Windows Server 2003 version of VDS, which allows only one pack at a time to maintain online status.
     * @type {Integer (Int32)}
     */
    static VDS_PKF_POLICY => 4

    /**
     * If set, a pack contains a disk with a corrupted database.
     * @type {Integer (Int32)}
     */
    static VDS_PKF_CORRUPTED => 8

    /**
     * If set, a  pack with sufficient disk quorum failed to achieve online status due to an error.
     * @type {Integer (Int32)}
     */
    static VDS_PKF_ONLINE_ERROR => 16
}
