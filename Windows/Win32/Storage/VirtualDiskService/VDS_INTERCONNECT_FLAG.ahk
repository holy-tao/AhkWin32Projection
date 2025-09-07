#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VDS_INTERCONNECT_FLAG enumeration (vdshwprv.h) defines the set of interconnect types that subsystems can support.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_INTERCONNECT_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_INTERCONNECT_FLAG</b> enumeration constant.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_interconnect_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_INTERCONNECT_FLAG{

    /**
     * The subsystem supports a PCI RAID interconnect.
     * @type {Integer (Int32)}
     */
    static VDS_ITF_PCI_RAID => 1

    /**
     * The subsystem supports a Fibre Channel interconnect.
     * @type {Integer (Int32)}
     */
    static VDS_ITF_FIBRE_CHANNEL => 2

    /**
     * The subsystem supports an iSCSI interconnect.
     * @type {Integer (Int32)}
     */
    static VDS_ITF_ISCSI => 4

    /**
     * The subsystem supports a serial attached iSCSI (SAS) interconnect.
     * @type {Integer (Int32)}
     */
    static VDS_ITF_SAS => 8
}
