#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VDS_HBAPORT_TYPE enumeration (vdshwprv.h) defines the set of valid types for an HBA port.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_HBAPORT_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_HBAPORT_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_hbaport_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_HBAPORT_TYPE extends Win32Enum {

    /**
     * The port type is unknown.
     *      
     * 
     * HBA_PORTTYPE_UNKNOWN
     * Native name: VDS_HPT_UNKNOWN
     * @type {Integer (Int32)}
     */
    static HPT_UNKNOWN => 1

    /**
     * The port type is another (undefined) type.
     *      
     * 
     * HBA_PORTTYPE_OTHER
     * Native name: VDS_HPT_OTHER
     * @type {Integer (Int32)}
     */
    static HPT_OTHER => 2

    /**
     * The port type is not present.
     *      
     * 
     * HBA_PORTTYPE_NOTPRESENT
     * Native name: VDS_HPT_NOTPRESENT
     * @type {Integer (Int32)}
     */
    static HPT_NOTPRESENT => 3

    /**
     * The port type is a fabric.
     *      
     * 
     * HBA_PORTTYPE_NPORT
     * Native name: VDS_HPT_NPORT
     * @type {Integer (Int32)}
     */
    static HPT_NPORT => 5

    /**
     * The port type is a public loop.
     *      
     * 
     * HBA_PORTTYPE_NLPORT
     * Native name: VDS_HPT_NLPORT
     * @type {Integer (Int32)}
     */
    static HPT_NLPORT => 6

    /**
     * The port type is a fabric on a loop.
     *      
     * 
     * HBA_PORTTYPE_FLPORT
     * Native name: VDS_HPT_FLPORT
     * @type {Integer (Int32)}
     */
    static HPT_FLPORT => 7

    /**
     * The port type is a fabric port.
     *      
     * 
     * HBA_PORTTYPE_FPORT
     * Native name: VDS_HPT_FPORT
     * @type {Integer (Int32)}
     */
    static HPT_FPORT => 8

    /**
     * The port type is a fabric expansion port.
     * Native name: VDS_HPT_EPORT
     * @type {Integer (Int32)}
     */
    static HPT_EPORT => 9

    /**
     * The port type is a generic fabric port.
     * Native name: VDS_HPT_GPORT
     * @type {Integer (Int32)}
     */
    static HPT_GPORT => 10

    /**
     * The port type is a private loop.
     *      
     * 
     * HBA_PORTTYPE_LPORT
     * Native name: VDS_HPT_LPORT
     * @type {Integer (Int32)}
     */
    static HPT_LPORT => 20

    /**
     * The port type is point-to-point.
     *      
     * 
     * HBA_PORTTYPE_PTP
     * Native name: VDS_HPT_PTP
     * @type {Integer (Int32)}
     */
    static HPT_PTP => 21
}
