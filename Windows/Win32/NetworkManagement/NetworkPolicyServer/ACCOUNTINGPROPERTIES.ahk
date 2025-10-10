#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the ACCOUNTINGPROPERTIES type enumerate properties that control what types of packets are logged and characteristics of the log file.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-accountingproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ACCOUNTINGPROPERTIES{

    /**
     * Specifies whether accounting packets are logged.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ACCOUNTING_LOG_ACCOUNTING => 1026

    /**
     * Specifies whether interim accounting packets are logged.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ACCOUNTING_LOG_ACCOUNTING_INTERIM => 1027

    /**
     * Specifies whether authentication packets are logged.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ACCOUNTING_LOG_AUTHENTICATION => 1028

    /**
     * Specifies how frequently a new log file is created. This property takes a value from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-new_log_file_frequency">NEW_LOG_FILE_FREQUENCY</a> enumeration type.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ACCOUNTING_LOG_OPEN_NEW_FREQUENCY => 1029

    /**
     * Specifies a file size. The system creates a new log file if the current log file reaches this size, and the <b>PROPERTY_ACCOUNTING_LOG_OPEN_NEW_FREQUENCY</b> property is set to the value 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-new_log_file_frequency">IAS_LOGGING_WHEN_FILE_SIZE_REACHES</a>.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ACCOUNTING_LOG_OPEN_NEW_SIZE => 1030

    /**
     * The file-system path to the directory where the log file is located. This path does not include the filename. It also does not include a trailing backslash.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ACCOUNTING_LOG_FILE_DIRECTORY => 1031

    /**
     * Specifies whether the log should be in NPS format or database convertible format. This property can have the following values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>0 (<b>VARIANT_FALSE</b>)</td>
 * <td>NPS Format</td>
 * </tr>
 * <tr>
 * <td>0xFFFF (<b>VARIANT_TRUE</b>)</td>
 * <td>Database Convertible Format</td>
 * </tr>
 * </table>
     * @type {Integer (Int32)}
     */
    static PROPERTY_ACCOUNTING_LOG_IAS1_FORMAT => 1032

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ACCOUNTING_LOG_ENABLE_LOGGING => 1033

    /**
     * Causes the accounting log to be deleted when full.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ACCOUNTING_LOG_DELETE_IF_FULL => 1034

    /**
     * Maximum number of concurrent  SQL server sessions.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ACCOUNTING_SQL_MAX_SESSIONS => 1035

    /**
     * Causes NPS to log interim access-request/access-challenge pairs for an EAP session. Otherwise, it only logs the final access-request/access-accept/reject.
     * @type {Integer (Int32)}
     */
    static PROPERTY_ACCOUNTING_LOG_AUTHENTICATION_INTERIM => 1036

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PROPERTY_ACCOUNTING_LOG_FILE_IS_BACKUP => 1037

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PROPERTY_ACCOUNTING_DISCARD_REQUEST_ON_FAILURE => 1038
}
