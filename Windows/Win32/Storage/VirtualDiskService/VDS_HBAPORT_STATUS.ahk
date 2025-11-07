#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid statuses for an HBA port.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_HBAPORT_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_HBAPORT_STATUS</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_hbaport_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_HBAPORT_STATUS{

    /**
     * The HBA port status is unknown.
     *      
     * 
     * HBA_PORTSTATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static VDS_HPS_UNKNOWN => 1

    /**
     * The HBA port is operational.
     *      
     * 
     * HBA_PORTSTATE_ONLINE
     * @type {Integer (Int32)}
     */
    static VDS_HPS_ONLINE => 2

    /**
     * The HBA port has been set offline by a user.
     *      
     * 
     * HBA_PORTSTATE_OFFLINE
     * @type {Integer (Int32)}
     */
    static VDS_HPS_OFFLINE => 3

    /**
     * The HBA port is bypassed.
     *      
     * 
     * HBA_PORTSTATE_BYPASSED
     * @type {Integer (Int32)}
     */
    static VDS_HPS_BYPASSED => 4

    /**
     * The HBA port is in diagnostics mode.
     *      
     * 
     * HBA_PORTSTATE_DIAGNOSTICS
     * @type {Integer (Int32)}
     */
    static VDS_HPS_DIAGNOSTICS => 5

    /**
     * The HBA port link is down.
     *      
     * 
     * HBA_PORTSTATE_LINKDOWN
     * @type {Integer (Int32)}
     */
    static VDS_HPS_LINKDOWN => 6

    /**
     * The HBA port has an error.
     *      
     * 
     * HBA_PORTSTATE_ERROR
     * @type {Integer (Int32)}
     */
    static VDS_HPS_ERROR => 7

    /**
     * The HBA port is loopback.
     *      
     * 
     * HBA_PORTSTATE_LOOPBACK
     * @type {Integer (Int32)}
     */
    static VDS_HPS_LOOPBACK => 8
}
