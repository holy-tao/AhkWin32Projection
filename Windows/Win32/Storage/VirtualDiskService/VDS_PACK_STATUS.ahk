#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of object status values for a pack.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_pack_prop">VDS_PACK_PROP</a> structure includes a <b>VDS_PACK_STATUS</b> value as a member to indicate the current status of a pack.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_PACK_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_PACK_STATUS</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_pack_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PACK_STATUS extends Win32Enum{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_PS_UNKNOWN => 0

    /**
     * The pack is available.
     * @type {Integer (Int32)}
     */
    static VDS_PS_ONLINE => 1

    /**
     * The pack is unavailable; the disks in the pack are not accessible.
     * @type {Integer (Int32)}
     */
    static VDS_PS_OFFLINE => 4
}
