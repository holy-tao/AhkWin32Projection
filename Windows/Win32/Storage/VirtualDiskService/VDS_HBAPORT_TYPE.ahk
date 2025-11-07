#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid types for an HBA port.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_HBAPORT_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_HBAPORT_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_hbaport_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_HBAPORT_TYPE{

    /**
     * The port type is unknown.
 *      
 * 
 * HBA_PORTTYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static VDS_HPT_UNKNOWN => 1

    /**
     * The port type is another (undefined) type.
 *      
 * 
 * HBA_PORTTYPE_OTHER
     * @type {Integer (Int32)}
     */
    static VDS_HPT_OTHER => 2

    /**
     * The port type is not present.
 *      
 * 
 * HBA_PORTTYPE_NOTPRESENT
     * @type {Integer (Int32)}
     */
    static VDS_HPT_NOTPRESENT => 3

    /**
     * The port type is a fabric.
 *      
 * 
 * HBA_PORTTYPE_NPORT
     * @type {Integer (Int32)}
     */
    static VDS_HPT_NPORT => 5

    /**
     * The port type is a public loop.
 *      
 * 
 * HBA_PORTTYPE_NLPORT
     * @type {Integer (Int32)}
     */
    static VDS_HPT_NLPORT => 6

    /**
     * The port type is a fabric on a loop.
 *      
 * 
 * HBA_PORTTYPE_FLPORT
     * @type {Integer (Int32)}
     */
    static VDS_HPT_FLPORT => 7

    /**
     * The port type is a fabric port.
 *      
 * 
 * HBA_PORTTYPE_FPORT
     * @type {Integer (Int32)}
     */
    static VDS_HPT_FPORT => 8

    /**
     * The port type is a fabric expansion port.
     * @type {Integer (Int32)}
     */
    static VDS_HPT_EPORT => 9

    /**
     * The port type is a generic fabric port.
     * @type {Integer (Int32)}
     */
    static VDS_HPT_GPORT => 10

    /**
     * The port type is a private loop.
 *      
 * 
 * HBA_PORTTYPE_LPORT
     * @type {Integer (Int32)}
     */
    static VDS_HPT_LPORT => 20

    /**
     * The port type is point-to-point.
 *      
 * 
 * HBA_PORTTYPE_PTP
     * @type {Integer (Int32)}
     */
    static VDS_HPT_PTP => 21
}
