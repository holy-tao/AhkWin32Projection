#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid subsystem maintenance operations.
 * @remarks
 * 
  * The  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsmaintenance-startmaintenance">IVdsMaintenance::StartMaintenance</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsmaintenance-stopmaintenance">IVdsMaintenance::StopMaintenance</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsmaintenance-pulsemaintenance">IVdsMaintenance::PulseMaintenance</a> methods pass a <b>VDS_MAINTENANCE_OPERATION</b> value as an argument to specify operation details.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_MAINTENANCE_OPERATION</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_MAINTENANCE_OPERATION</b> enumeration constant.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_maintenance_operation
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_MAINTENANCE_OPERATION{

    /**
     * Blinks a light on a drive.
     * @type {Integer (Int32)}
     */
    static BlinkLight => 1

    /**
     * Beeps an alarm on a drive.
     * @type {Integer (Int32)}
     */
    static BeepAlarm => 2

    /**
     * Slows the spinning of a drive such that the drive enters an idle state. Typically used for the purpose of saving power.
     * @type {Integer (Int32)}
     */
    static SpinDown => 3

    /**
     * Starts the spinning of a drive in preparation for data reads.
     * @type {Integer (Int32)}
     */
    static SpinUp => 4

    /**
     * Pings a drive.
     * @type {Integer (Int32)}
     */
    static Ping => 5
}
