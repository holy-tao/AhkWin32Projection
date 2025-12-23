#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of valid types for a volume object.
 * @remarks
 * The  <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdspack-createvolume">IVdsPack::CreateVolume</a> method passes a <b>VDS_VOLUME_TYPE</b> value as an argument to set a new volume type, and the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop">VDS_VOLUME_PROP</a> structure includes a <b>VDS_VOLUME_TYPE</b> value as a member to indicate  the existing volume type.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_VOLUME_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_VOLUME_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-vds_volume_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_VOLUME_TYPE extends Win32Enum{

    /**
     * The volume type is unknown.
     * @type {Integer (Int32)}
     */
    static VDS_VT_UNKNOWN => 0

    /**
     * The volume type is simple—it is composed of extents from exactly one disk.
     * @type {Integer (Int32)}
     */
    static VDS_VT_SIMPLE => 10

    /**
     * The volume type is spanned—it is composed of extents from more than one disk.
     * @type {Integer (Int32)}
     */
    static VDS_VT_SPAN => 11

    /**
     * The volume type is striped, which is equivalent to RAID 0.
     * @type {Integer (Int32)}
     */
    static VDS_VT_STRIPE => 12

    /**
     * The volume type is mirrored, which is equivalent to RAID 1.
     * @type {Integer (Int32)}
     */
    static VDS_VT_MIRROR => 13

    /**
     * The volume type is striped with parity, which accounts for RAID levels 3, 4, 5, and 6.
     * @type {Integer (Int32)}
     */
    static VDS_VT_PARITY => 14
}
