#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VDS_HEALTH enumeration (vdshwprv.h) defines the set of health state values for a VDS object.
 * @remarks
 * Health enumeration values apply to the VDS objects as shown in the following table. Y indicates that the value 
  *     applies to the object, and N indicates that the value does not apply to the object. A pack object does not 
  *     report health status. 
  * 
  * <table>
  * <tr>
  * <th>Health enumeration value</th>
  * <th>Disk</th>
  * <th>Subsystem</th>
  * <th>Controller</th>
  * <th>Drive</th>
  * <th>LUN</th>
  * <th>LUN plex</th>
  * <th>Storage pool</th>
  * <th>Volume</th>
  * <th>Volume plex</th>
  * </tr>
  * <tr>
  * <td><b>VDS_H_UNKNOWN</b></td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * </tr>
  * <tr>
  * <td><b>VDS_H_HEALTHY</b></td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * </tr>
  * <tr>
  * <td><b>VDS_H_REBUILDING</b></td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>Y</td>
  * </tr>
  * <tr>
  * <td><b>VDS_H_STALE</b></td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>Y</td>
  * </tr>
  * <tr>
  * <td><b>VDS_H_FAILING</b></td>
  * <td>Y</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>Y</td>
  * </tr>
  * <tr>
  * <td><b>VDS_H_FAILING_REDUNDANCY</b></td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>Y</td>
  * </tr>
  * <tr>
  * <td><b>VDS_H_FAILED_REDUNDANCY</b></td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>Y</td>
  * </tr>
  * <tr>
  * <td><b>VDS_H_FAILED_REDUNDANCY_FAILING</b></td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>Y</td>
  * </tr>
  * <tr>
  * <td><b>VDS_H_FAILED</b></td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>Y</td>
  * </tr>
  * <tr>
  * <td><b>VDS_H_REPLACED</b></td>
  * <td>N</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * </tr>
  * <tr>
  * <td><b>VDS_H_PENDING_FAILURE</b></td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * </tr>
  * <tr>
  * <td><b>VDS_H_DEGRADED</b></td>
  * <td>N</td>
  * <td>Y</td>
  * <td>Y</td>
  * <td>N</td>
  * <td>N</td>
  * <td>N</td>
  * <td>Y</td>
  * <td>N</td>
  * <td>N</td>
  * </tr>
  * </table>
  *  
  * 
  * The property structure for each object listed in the table includes the value of the 
  *     <b>VDS_HEALTH</b> enumeration as a member.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_HEALTH</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_HEALTH</b> enumeration constant.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_health
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_HEALTH{

    /**
     * The health of the object cannot be determined.
     * @type {Integer (Int32)}
     */
    static VDS_H_UNKNOWN => 0

    /**
     * The object indicates online status. This health state value means that the object is fully operational and is operating properly, but it does not imply that the object is available for use.  For example, if the object is a disk, the disk is not missing, log and 
 *       configuration files are synchronized, and the disk is free of I/O errors. If the object is a LUN or 
 *       volume, all plexes (mirrored, simple, spanned, and striped) and columns (RAID-5) are available and free of I/O errors. The status value associated with this health state must not be FAILED,  UNKNOWN, or MISSING.
     * @type {Integer (Int32)}
     */
    static VDS_H_HEALTHY => 1

    /**
     * Either a mirrored LUN or volume is resynching all plexes, or a striped with parity (RAID-5) plex is 
 *       regenerating the parity.
     * @type {Integer (Int32)}
     */
    static VDS_H_REBUILDING => 2

    /**
     * The object configuration is stale. The status value  must not be FAILED or  UNKNOWN.
     * @type {Integer (Int32)}
     */
    static VDS_H_STALE => 3

    /**
     * The object is failing, but still working. For example, a LUN or volume with failing health might be 
 *       producing occasional input/output errors from which it is still able to recover. The status value  must not be FAILED or  UNKNOWN.
     * @type {Integer (Int32)}
     */
    static VDS_H_FAILING => 4

    /**
     * One or more  plexes have errors, but the object is working and all plexes are online. This value is valid only for volumes and LUNs.
     * @type {Integer (Int32)}
     */
    static VDS_H_FAILING_REDUNDANCY => 5

    /**
     * One or more plexes have failed, but at least one plex is working. This value is valid only for volumes and LUNs.
     * @type {Integer (Int32)}
     */
    static VDS_H_FAILED_REDUNDANCY => 6

    /**
     * The last working plex is failing. This value is valid only for volumes and LUNs.
     * @type {Integer (Int32)}
     */
    static VDS_H_FAILED_REDUNDANCY_FAILING => 7

    /**
     * The object has failed. Any object with a failed health status also has a failed object status.  Therefore, the status value  must  be FAILED.
     * @type {Integer (Int32)}
     */
    static VDS_H_FAILED => 8

    /**
     * This value is reserved. Do not use it.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_H_REPLACED => 9

    /**
     * The object is not failing, but it is expected to fail according to analysis done on the object's attributes. For example, a disk may be set to VDS_H_PENDING_FAILURE based on S.M.A.R.T. data. 
 * 
 * The status value  must not be FAILED or  UNKNOWN.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_H_PENDING_FAILURE => 10

    /**
     * The object has not completely failed but is experiencing failures. 
 * 
 * If the object is a subsystem object, the firmware may be reporting errors, or  the  drive, controller, port, or path sub-object may have failed or be failing.
 * 
 * If the object is a controller object, the firmware may be reporting errors, or  the  port or path sub-object may have failed or be failing.
 * 
 * If the object is a storage pool object, one or more drives may have failed or be failing.
 * 
 * The status value  must not be UNKNOWN.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_H_DEGRADED => 11
}
