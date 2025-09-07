#Requires AutoHotkey v2.0.0 64-bit

/**
 * The FAX_JOB_OPERATIONS_ENUM enumeration defines the operations that can be performed on a fax job. The members of this enumeration are bit values and can be used in combination.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_job_operations_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_JOB_OPERATIONS_ENUM{

    /**
     * The job's TIFF image can be retrieved.
     * @type {Integer (Int32)}
     */
    static fjoVIEW => 1

    /**
     * The job can be paused.
     * @type {Integer (Int32)}
     */
    static fjoPAUSE => 2

    /**
     * The job can be resumed.
     * @type {Integer (Int32)}
     */
    static fjoRESUME => 4

    /**
     * The job can be restarted.
     * @type {Integer (Int32)}
     */
    static fjoRESTART => 8

    /**
     * The job can be deleted.
     * @type {Integer (Int32)}
     */
    static fjoDELETE => 16

    /**
     * The job's recipient information can be retrieved.
     * @type {Integer (Int32)}
     */
    static fjoRECIPIENT_INFO => 32

    /**
     * The job's sender information can be retrieved.
     * @type {Integer (Int32)}
     */
    static fjoSENDER_INFO => 64
}
