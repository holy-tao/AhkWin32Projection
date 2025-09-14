#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BackgroundIntelligentTransferService {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static BG_NOTIFY_JOB_TRANSFERRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BG_NOTIFY_JOB_ERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BG_NOTIFY_DISABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BG_NOTIFY_JOB_MODIFICATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BG_NOTIFY_FILE_TRANSFERRED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BG_NOTIFY_FILE_RANGES_TRANSFERRED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BG_JOB_ENUM_ALL_USERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BG_COPY_FILE_OWNER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BG_COPY_FILE_GROUP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BG_COPY_FILE_DACL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BG_COPY_FILE_SACL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BG_COPY_FILE_ALL => 15

    /**
     * @type {Integer (UInt32)}
     */
    static BG_SSL_ENABLE_CRL_CHECK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BG_SSL_IGNORE_CERT_CN_INVALID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BG_SSL_IGNORE_CERT_DATE_INVALID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BG_SSL_IGNORE_UNKNOWN_CA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BG_SSL_IGNORE_CERT_WRONG_USAGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BG_HTTP_REDIRECT_POLICY_MASK => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static BG_HTTP_REDIRECT_POLICY_ALLOW_SILENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BG_HTTP_REDIRECT_POLICY_ALLOW_REPORT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static BG_HTTP_REDIRECT_POLICY_DISALLOW => 512

    /**
     * @type {Integer (UInt32)}
     */
    static BG_HTTP_REDIRECT_POLICY_ALLOW_HTTPS_TO_HTTP => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static BG_ENABLE_PEERCACHING_CLIENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BG_ENABLE_PEERCACHING_SERVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BG_DISABLE_BRANCH_CACHE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BG_JOB_ENABLE_PEERCACHING_CLIENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BG_JOB_ENABLE_PEERCACHING_SERVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BG_JOB_DISABLE_BRANCH_CACHE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BITS_COST_STATE_UNRESTRICTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BITS_COST_STATE_CAPPED_USAGE_UNKNOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BITS_COST_STATE_BELOW_CAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BITS_COST_STATE_NEAR_CAP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BITS_COST_STATE_OVERCAP_CHARGED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BITS_COST_STATE_OVERCAP_THROTTLED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BITS_COST_STATE_USAGE_BASED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static BITS_COST_STATE_ROAMING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static BITS_COST_OPTION_IGNORE_CONGESTION => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static BITS_COST_STATE_RESERVED => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static QM_NOTIFY_FILE_DONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QM_NOTIFY_JOB_DONE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QM_NOTIFY_GROUP_DONE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static QM_NOTIFY_DISABLE_NOTIFY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static QM_NOTIFY_USE_PROGRESSEX => 128

    /**
     * @type {Integer (UInt32)}
     */
    static QM_STATUS_FILE_COMPLETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QM_STATUS_FILE_INCOMPLETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QM_STATUS_JOB_COMPLETE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static QM_STATUS_JOB_INCOMPLETE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static QM_STATUS_JOB_ERROR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static QM_STATUS_JOB_FOREGROUND => 32

    /**
     * @type {Integer (UInt32)}
     */
    static QM_STATUS_GROUP_COMPLETE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static QM_STATUS_GROUP_INCOMPLETE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static QM_STATUS_GROUP_SUSPENDED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static QM_STATUS_GROUP_ERROR => 512

    /**
     * @type {Integer (UInt32)}
     */
    static QM_STATUS_GROUP_FOREGROUND => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static QM_PROTOCOL_HTTP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QM_PROTOCOL_FTP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QM_PROTOCOL_SMB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static QM_PROTOCOL_CUSTOM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static QM_PROGRESS_PERCENT_DONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QM_PROGRESS_TIME_DONE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QM_PROGRESS_SIZE_DONE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static QM_E_INVALID_STATE => 2164264961

    /**
     * @type {Integer (UInt32)}
     */
    static QM_E_SERVICE_UNAVAILABLE => 2164264962

    /**
     * @type {Integer (UInt32)}
     */
    static QM_E_DOWNLOADER_UNAVAILABLE => 2164264963

    /**
     * @type {Integer (UInt32)}
     */
    static QM_E_ITEM_NOT_FOUND => 2164264964

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_NOT_FOUND => -2145386495

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_INVALID_STATE => -2145386494

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_EMPTY => -2145386493

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_FILE_NOT_AVAILABLE => -2145386492

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_PROTOCOL_NOT_AVAILABLE => -2145386491

    /**
     * @type {Integer (Int32)}
     */
    static BG_S_ERROR_CONTEXT_NONE => 2097158

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_ERROR_CONTEXT_UNKNOWN => -2145386489

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_ERROR_CONTEXT_GENERAL_QUEUE_MANAGER => -2145386488

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_ERROR_CONTEXT_LOCAL_FILE => -2145386487

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_ERROR_CONTEXT_REMOTE_FILE => -2145386486

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_ERROR_CONTEXT_GENERAL_TRANSPORT => -2145386485

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_ERROR_CONTEXT_QUEUE_MANAGER_NOTIFICATION => -2145386484

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_DESTINATION_LOCKED => -2145386483

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_VOLUME_CHANGED => -2145386482

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_ERROR_INFORMATION_UNAVAILABLE => -2145386481

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_NETWORK_DISCONNECTED => -2145386480

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_MISSING_FILE_SIZE => -2145386479

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_INSUFFICIENT_HTTP_SUPPORT => -2145386478

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_INSUFFICIENT_RANGE_SUPPORT => -2145386477

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_REMOTE_NOT_SUPPORTED => -2145386476

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_NEW_OWNER_DIFF_MAPPING => -2145386475

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_NEW_OWNER_NO_FILE_ACCESS => -2145386474

    /**
     * @type {Integer (Int32)}
     */
    static BG_S_PARTIAL_COMPLETE => 2097175

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_PROXY_LIST_TOO_LARGE => -2145386472

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_PROXY_BYPASS_LIST_TOO_LARGE => -2145386471

    /**
     * @type {Integer (Int32)}
     */
    static BG_S_UNABLE_TO_DELETE_FILES => 2097178

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_INVALID_SERVER_RESPONSE => -2145386469

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_TOO_MANY_FILES => -2145386468

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_LOCAL_FILE_CHANGED => -2145386467

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_ERROR_CONTEXT_REMOTE_APPLICATION => -2145386466

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_SESSION_NOT_FOUND => -2145386465

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_TOO_LARGE => -2145386464

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_STRING_TOO_LONG => -2145386463

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_CLIENT_SERVER_PROTOCOL_MISMATCH => -2145386462

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_SERVER_EXECUTE_ENABLE => -2145386461

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_NO_PROGRESS => -2145386460

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_USERNAME_TOO_LARGE => -2145386459

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_PASSWORD_TOO_LARGE => -2145386458

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_INVALID_AUTH_TARGET => -2145386457

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_INVALID_AUTH_SCHEME => -2145386456

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_FILE_NOT_FOUND => -2145386455

    /**
     * @type {Integer (Int32)}
     */
    static BG_S_PROXY_CHANGED => 2097194

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_INVALID_RANGE => -2145386453

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_OVERLAPPING_RANGES => -2145386452

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_CONNECT_FAILURE => -2145386451

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_CONNECTION_CLOSED => -2145386450

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_BLOCKED_BY_POLICY => -2145386434

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_INVALID_PROXY_INFO => -2145386433

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_INVALID_CREDENTIALS => -2145386432

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_INVALID_HASH_ALGORITHM => -2145386431

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_RECORD_DELETED => -2145386430

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_COMMIT_IN_PROGRESS => -2145386429

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_DISCOVERY_IN_PROGRESS => -2145386428

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_UPNP_ERROR => -2145386427

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_TEST_OPTION_BLOCKED_DOWNLOAD => -2145386426

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_PEERCACHING_DISABLED => -2145386425

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_BUSYCACHERECORD => -2145386424

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_TOO_MANY_JOBS_PER_USER => -2145386423

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_TOO_MANY_JOBS_PER_MACHINE => -2145386416

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_TOO_MANY_FILES_IN_JOB => -2145386415

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_TOO_MANY_RANGES_IN_FILE => -2145386414

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_VALIDATION_FAILED => -2145386413

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_MAXDOWNLOAD_TIMEOUT => -2145386412

    /**
     * @type {Integer (Int32)}
     */
    static BG_S_OVERRIDDEN_BY_POLICY => 2097237

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_TOKEN_REQUIRED => -2145386410

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_UNKNOWN_PROPERTY_ID => -2145386409

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_READ_ONLY_PROPERTY => -2145386408

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_BLOCKED_BY_COST_TRANSFER_POLICY => -2145386407

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_PROPERTY_SUPPORTED_FOR_DOWNLOAD_JOBS_ONLY => -2145386400

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_READ_ONLY_PROPERTY_AFTER_ADDFILE => -2145386399

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_READ_ONLY_PROPERTY_AFTER_RESUME => -2145386398

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_MAX_DOWNLOAD_SIZE_INVALID_VALUE => -2145386397

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_MAX_DOWNLOAD_SIZE_LIMIT_REACHED => -2145386396

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_STANDBY_MODE => -2145386395

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_USE_STORED_CREDENTIALS_NOT_SUPPORTED => -2145386394

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_BLOCKED_BY_BATTERY_POLICY => -2145386393

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_BLOCKED_BY_BATTERY_SAVER => -2145386392

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_WATCHDOG_TIMEOUT => -2145386391

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_APP_PACKAGE_NOT_FOUND => -2145386390

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_APP_PACKAGE_SCENARIO_NOT_SUPPORTED => -2145386389

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_DATABASE_CORRUPT => -2145386388

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_RANDOM_ACCESS_NOT_SUPPORTED => -2145386387

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_BLOCKED_BY_BACKGROUND_ACCESS_POLICY => -2145386386

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_BLOCKED_BY_GAME_MODE => -2145386385

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_BLOCKED_BY_SYSTEM_POLICY => -2145386384

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_NOT_SUPPORTED_WITH_CUSTOM_HTTP_METHOD => -2145386383

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_UNSUPPORTED_JOB_CONFIGURATION => -2145386382

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_REMOTE_FILE_CHANGED => -2145386381

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_SERVER_CERT_VALIDATION_INTERFACE_REQUIRED => -2145386380

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_READ_ONLY_WHEN_JOB_ACTIVE => -2145386379

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_ERROR_CONTEXT_SERVER_CERTIFICATE_CALLBACK => -2145386378

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_100 => -2145845148

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_101 => -2145845147

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_200 => -2145845048

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_201 => -2145845047

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_202 => -2145845046

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_203 => -2145845045

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_204 => -2145845044

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_205 => -2145845043

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_206 => -2145845042

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_300 => -2145844948

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_301 => -2145844947

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_302 => -2145844946

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_303 => -2145844945

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_304 => -2145844944

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_305 => -2145844943

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_307 => -2145844941

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_400 => -2145844848

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_401 => -2145844847

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_402 => -2145844846

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_403 => -2145844845

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_404 => -2145844844

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_405 => -2145844843

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_406 => -2145844842

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_407 => -2145844841

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_408 => -2145844840

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_409 => -2145844839

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_410 => -2145844838

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_411 => -2145844837

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_412 => -2145844836

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_413 => -2145844835

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_414 => -2145844834

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_415 => -2145844833

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_416 => -2145844832

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_417 => -2145844831

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_449 => -2145844799

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_500 => -2145844748

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_501 => -2145844747

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_502 => -2145844746

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_503 => -2145844745

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_504 => -2145844744

    /**
     * @type {Integer (Int32)}
     */
    static BG_E_HTTP_ERROR_505 => -2145844743

    /**
     * @type {Integer (Int32)}
     */
    static BITS_MC_JOB_CANCELLED => -2145828864

    /**
     * @type {Integer (Int32)}
     */
    static BITS_MC_FILE_DELETION_FAILED => -2145828863

    /**
     * @type {Integer (Int32)}
     */
    static BITS_MC_FILE_DELETION_FAILED_MORE => -2145828862

    /**
     * @type {Integer (Int32)}
     */
    static BITS_MC_JOB_PROPERTY_CHANGE => -2145828861

    /**
     * @type {Integer (Int32)}
     */
    static BITS_MC_JOB_TAKE_OWNERSHIP => -2145828860

    /**
     * @type {Integer (Int32)}
     */
    static BITS_MC_JOB_SCAVENGED => -2145828859

    /**
     * @type {Integer (Int32)}
     */
    static BITS_MC_JOB_NOTIFICATION_FAILURE => -2145828858

    /**
     * @type {Integer (Int32)}
     */
    static BITS_MC_STATE_FILE_CORRUPT => -2145828857

    /**
     * @type {Integer (Int32)}
     */
    static BITS_MC_FAILED_TO_START => -2145828856

    /**
     * @type {Integer (Int32)}
     */
    static BITS_MC_FATAL_IGD_ERROR => -2145828855

    /**
     * @type {Integer (Int32)}
     */
    static BITS_MC_PEERCACHING_PORT => -2145828854

    /**
     * @type {Integer (Int32)}
     */
    static BITS_MC_WSD_PORT => -2145828853
;@endregion Constants

;@region Methods
;@endregion Methods
}
