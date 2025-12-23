#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of valid types for a volume plex.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_plex_prop">VDS_VOLUME_PLEX_PROP</a> structure includes a <b>VDS_VOLUME_PLEX_TYPE</b> value as a member to indicate the existing plex type.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_VOLUME_PLEX_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_VOLUME_PLEX_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-vds_volume_plex_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_VOLUME_PLEX_TYPE extends Win32Enum{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_VPT_UNKNOWN => 0

    /**
     * The plex type is simple—it is composed of extents from exactly one disk. This value corresponds to the <b>VDS_VT_SIMPLE</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_type">VDS_VOLUME_TYPE</a> enumeration.
     * @type {Integer (Int32)}
     */
    static VDS_VPT_SIMPLE => 10

    /**
     * The plex type is spanned—it is composed of extents from more than one disk. This value corresponds to the <b>VDS_VT_SPAN</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_type">VDS_VOLUME_TYPE</a> enumeration.
     * @type {Integer (Int32)}
     */
    static VDS_VPT_SPAN => 11

    /**
     * The plex type is striped, which is equivalent to RAID 0. This value corresponds to the <b>VDS_VT_STRIPE</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_type">VDS_VOLUME_TYPE</a> enumeration.
     * @type {Integer (Int32)}
     */
    static VDS_VPT_STRIPE => 12

    /**
     * The plex type is striped with parity, which accounts for RAID levels 3, 4, 5, and 6. This value corresponds to the <b>VDS_VT_PARITY</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_type">VDS_VOLUME_TYPE</a> enumeration.
     * @type {Integer (Int32)}
     */
    static VDS_VPT_PARITY => 14
}
