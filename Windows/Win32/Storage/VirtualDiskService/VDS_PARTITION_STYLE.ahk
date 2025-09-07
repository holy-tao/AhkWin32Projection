#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of partition style values.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop">VDS_DISK_PROP</a> and
  *         <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_partition_prop">VDS_PARTITION_PROP</a> structures include a <b>VDS_PARTITION_STYLE</b> value as a member. Additionally, the  <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsdisk-convertstyle">IVdsDisk::ConvertStyle</a> and <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdspack-adddisk">IVdsPack::AddDisk</a> methods pass a <b>VDS_PARTITION_STYLE</b> value  as an argument to indicate the partition style on a disk.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_PARTITION_STYLE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_PARTITION_STYLE</b> enumeration constant.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-vds_partition_style
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PARTITION_STYLE{

    /**
     * An uninitialized disk. New disks or newly cleaned disks have this partitioning type.
     * @type {Integer (Int32)}
     */
    static VDS_PST_UNKNOWN => 0

    /**
     * The style is master boot record (MBR). If the value is <b>VDS_PST_MBR</b>, a DWORD signature  identifies the disk. The identifier is unique on a single computer, but not unique across multiple computers. See the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_partition_info_mbr">VDS_PARTITION_INFO_MBR</a> structure.
     * @type {Integer (Int32)}
     */
    static VDS_PST_MBR => 1

    /**
     * The style is GUID partition table (GPT). If the value is <b>VDS_PST_GPT</b>, the disk has a GUID identifier. The GUID is guaranteed statistically to be unique across different computers. See the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_partition_info_gpt">VDS_PARTITION_INFO_GPT</a> structure.
     * @type {Integer (Int32)}
     */
    static VDS_PST_GPT => 2
}
