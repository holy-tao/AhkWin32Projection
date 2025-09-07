#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VDS_HBAPORT_SPEED_FLAG enumeration (vdshwprv.h) defines the set of valid flags for determining the speeds supported by an HBA port.
 * @remarks
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_HBAPORT_SPEED_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_HBAPORT_SPEED_FLAG</b> enumeration constant.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_hbaport_speed_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_HBAPORT_SPEED_FLAG{

    /**
     * The HBA port speed is unknown. The transceiver is incapable of reporting.
 *       
 * 
 * HBA_PORTSPEED_UNKNOWN
     * @type {Integer (Int32)}
     */
    static VDS_HSF_UNKNOWN => 0

    /**
     * The HBA port supports a transfer rate of 1 gigabit per second.
 *       
 * 
 * HBA_PORTSPEED_1GBIT
     * @type {Integer (Int32)}
     */
    static VDS_HSF_1GBIT => 1

    /**
     * The HBA port supports a transfer rate of 2 gigabits per second.
 *       
 * 
 * HBA_PORTSPEED_2GBIT
     * @type {Integer (Int32)}
     */
    static VDS_HSF_2GBIT => 2

    /**
     * The HBA port supports a transfer rate of 10 gigabits per second.
 *       
 * 
 * HBA_PORTSPEED_10GBIT
     * @type {Integer (Int32)}
     */
    static VDS_HSF_10GBIT => 4

    /**
     * The HBA port supports a transfer rate of 4 gigabits per second.
 *       
 * 
 * HBA_PORTSPEED_4GBIT
     * @type {Integer (Int32)}
     */
    static VDS_HSF_4GBIT => 8

    /**
     * The HBA port speed has not been established.
 *       
 * 
 * HBA_PORTSPEED_NOT_NEGOTIATED
     * @type {Integer (Int32)}
     */
    static VDS_HSF_NOT_NEGOTIATED => 32768
}
