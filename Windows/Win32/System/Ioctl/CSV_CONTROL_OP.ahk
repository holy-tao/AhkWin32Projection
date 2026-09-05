#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of CSV control operation to use with the FSCTL_CSV_CONTROL control code.
 * @remarks
 * An alternative to calling the [FSCTL_CSV_CONTROL](ni-winioctl-fsctl_csv_control.md) control code with this enumeration is to use the [CSV_CONTROL_PARAM](ns-winioctl-csv_control_param.md) structure, which encapsulates a member of this enumeration type.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-csv_control_op
 * @namespace Windows.Win32.System.Ioctl
 */
class CSV_CONTROL_OP extends Win32Enum {

    /**
     * Start file redirection.
     * Native name: CsvControlStartRedirectFile
     * @type {Integer (Int32)}
     */
    static StartRedirectFile => 2

    /**
     * Stop file redirection.
     * Native name: CsvControlStopRedirectFile
     * @type {Integer (Int32)}
     */
    static StopRedirectFile => 3

    /**
     * Search for state redirection. When this value is specified, the [CSV_QUERY_REDIRECT_STATE](ns-winioctl-csv_query_redirect_state.md) structure must also be used.
     * Native name: CsvControlQueryRedirectState
     * @type {Integer (Int32)}
     */
    static QueryRedirectState => 4

    /**
     * Search for file revision. When this value is specified, the [CSV_QUERY_FILE_REVISION](ns-winioctl-csv_query_file_revision.md) structure must also be used.
     * Native name: CsvControlQueryFileRevision
     * @type {Integer (Int32)}
     */
    static QueryFileRevision => 6

    /**
     * Native name: CsvControlQueryMdsPath
     * @type {Integer (Int32)}
     */
    static QueryMdsPath => 8

    /**
     * Native name: CsvControlQueryFileRevisionFileId128
     * @type {Integer (Int32)}
     */
    static QueryFileRevisionFileId128 => 9

    /**
     * Native name: CsvControlQueryVolumeRedirectState
     * @type {Integer (Int32)}
     */
    static QueryVolumeRedirectState => 10

    /**
     * Native name: CsvControlEnableUSNRangeModificationTracking
     * @type {Integer (Int32)}
     */
    static EnableUSNRangeModificationTracking => 13

    /**
     * Native name: CsvControlMarkHandleLocalVolumeMount
     * @type {Integer (Int32)}
     */
    static MarkHandleLocalVolumeMount => 14

    /**
     * Native name: CsvControlUnmarkHandleLocalVolumeMount
     * @type {Integer (Int32)}
     */
    static UnmarkHandleLocalVolumeMount => 15

    /**
     * Native name: CsvControlGetCsvFsMdsPathV2
     * @type {Integer (Int32)}
     */
    static GetCsvFsMdsPathV2 => 18

    /**
     * Native name: CsvControlDisableCaching
     * @type {Integer (Int32)}
     */
    static DisableCaching => 19

    /**
     * Native name: CsvControlEnableCaching
     * @type {Integer (Int32)}
     */
    static EnableCaching => 20

    /**
     * Native name: CsvControlStartForceDFO
     * @type {Integer (Int32)}
     */
    static StartForceDFO => 21

    /**
     * Native name: CsvControlStopForceDFO
     * @type {Integer (Int32)}
     */
    static StopForceDFO => 22

    /**
     * Native name: CsvControlQueryMdsPathNoPause
     * @type {Integer (Int32)}
     */
    static QueryMdsPathNoPause => 23

    /**
     * Native name: CsvControlSetVolumeId
     * @type {Integer (Int32)}
     */
    static SetVolumeId => 24

    /**
     * Native name: CsvControlQueryVolumeId
     * @type {Integer (Int32)}
     */
    static QueryVolumeId => 25
}
