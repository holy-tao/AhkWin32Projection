#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of CSV control operation to use with the FSCTL_CSV_CONTROL control code.
 * @remarks
 * An alternative to calling the [FSCTL_CSV_CONTROL](ni-winioctl-fsctl_csv_control.md) control code with this enumeration is to use the [CSV_CONTROL_PARAM](ns-winioctl-csv_control_param.md) structure, which encapsulates a member of this enumeration type.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-csv_control_op
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CSV_CONTROL_OP{

    /**
     * Start file redirection.
     * @type {Integer (Int32)}
     */
    static CsvControlStartRedirectFile => 2

    /**
     * Stop file redirection.
     * @type {Integer (Int32)}
     */
    static CsvControlStopRedirectFile => 3

    /**
     * Search for state redirection. When this value is specified, the [CSV_QUERY_REDIRECT_STATE](ns-winioctl-csv_query_redirect_state.md) structure must also be used.
     * @type {Integer (Int32)}
     */
    static CsvControlQueryRedirectState => 4

    /**
     * Search for file revision. When this value is specified, the [CSV_QUERY_FILE_REVISION](ns-winioctl-csv_query_file_revision.md) structure must also be used.
     * @type {Integer (Int32)}
     */
    static CsvControlQueryFileRevision => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CsvControlQueryMdsPath => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CsvControlQueryFileRevisionFileId128 => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CsvControlQueryVolumeRedirectState => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CsvControlEnableUSNRangeModificationTracking => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CsvControlMarkHandleLocalVolumeMount => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CsvControlUnmarkHandleLocalVolumeMount => 15

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CsvControlGetCsvFsMdsPathV2 => 18

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CsvControlDisableCaching => 19

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CsvControlEnableCaching => 20

    /**
     * @type {Integer (Int32)}
     */
    static CsvControlStartForceDFO => 21

    /**
     * @type {Integer (Int32)}
     */
    static CsvControlStopForceDFO => 22

    /**
     * @type {Integer (Int32)}
     */
    static CsvControlQueryMdsPathNoPause => 23

    /**
     * @type {Integer (Int32)}
     */
    static CsvControlSetVolumeId => 24

    /**
     * @type {Integer (Int32)}
     */
    static CsvControlQueryVolumeId => 25
}
