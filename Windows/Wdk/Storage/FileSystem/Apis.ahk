#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FileSystem {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_ANONYMOUS_LOGON_RID => 7

    /**
     * @type {Integer (UInt32)}
     */
    static VALID_INHERIT_FLAGS => 31

    /**
     * @type {Integer (UInt32)}
     */
    static SE_DACL_UNTRUSTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SERVER_SECURITY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_AUDIT_SUBCATEGORY_COUNT => 59

    /**
     * @type {Integer (UInt32)}
     */
    static SEGMENT_HEAP_PARAMETERS_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SEGMENT_HEAP_FLG_USE_PAGE_HEAP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEGMENT_HEAP_PARAMS_VALID_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_HEAP_MEMORY_LIMIT_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_NO_SERIALIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_GROWABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_GENERATE_EXCEPTIONS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_ZERO_MEMORY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_REALLOC_IN_PLACE_ONLY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_TAIL_CHECKING_ENABLED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_FREE_CHECKING_ENABLED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_DISABLE_COALESCE_ON_FREE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CREATE_ALIGN_16 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CREATE_ENABLE_TRACING => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CREATE_ENABLE_EXECUTE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_SETTABLE_USER_VALUE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_SETTABLE_USER_FLAG1 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_SETTABLE_USER_FLAG2 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_SETTABLE_USER_FLAG3 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_SETTABLE_USER_FLAGS => 3584

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CLASS_0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CLASS_1 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CLASS_2 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CLASS_3 => 12288

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CLASS_4 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CLASS_5 => 20480

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CLASS_6 => 24576

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CLASS_7 => 28672

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CLASS_8 => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CLASS_MASK => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_MAXIMUM_TAG => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_GLOBAL_TAG => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_PSEUDO_TAG_FLAG => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_TAG_SHIFT => 18

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CREATE_SEGMENT_HEAP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_CREATE_HARDENED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_DUPLICATE_UNICODE_STRING_NULL_TERMINATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_DUPLICATE_UNICODE_STRING_ALLOCATE_NULL_STRING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESSION_FORMAT_MAX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESSION_ENGINE_MAX => 512

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESSION_FORMAT_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESSION_ENGINE_MASK => 65280

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_UNICODE_STACK_BUFFER_LENGTH => 256

    /**
     * @type {String}
     */
    static RTL_SYSTEM_VOLUME_INFORMATION_FOLDER => "System Volume Information"

    /**
     * @type {Integer (UInt32)}
     */
    static PSMP_MINIMUM_SYSAPP_CLAIM_VALUES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PSMP_MAXIMUM_SYSAPP_CLAIM_VALUES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USE_PRIMARY_PASSWORD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RETURN_PRIMARY_USERNAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RETURN_PRIMARY_LOGON_DOMAINNAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RETURN_NON_NT_USER_SESSION_KEY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GENERATE_CLIENT_CHALLENGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GCR_NTLM3_PARMS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GCR_TARGET_INFO => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RETURN_RESERVED_PARAMETER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static GCR_ALLOW_NTLM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static GCR_USE_OEM_SET => 512

    /**
     * @type {Integer (UInt32)}
     */
    static GCR_MACHINE_CREDENTIAL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static GCR_USE_OWF_PASSWORD => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static GCR_ALLOW_LM => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static GCR_ALLOW_NO_TARGET => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static GCR_VSM_PROTECTED_PASSWORD => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CLEANUP_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CLEANUP_WRONG_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CLEANUP_FILE_REMAINS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CLEANUP_FILE_DELETED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CLEANUP_LINK_DELETED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CLEANUP_STREAM_DELETED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CLEANUP_POSIX_STYLE_DELETE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPLOCK_BROKEN_TO_LEVEL_2 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPLOCK_BROKEN_TO_NONE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OPBATCH_BREAK_UNDERWAY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_NAME => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_EA => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_STREAM_NAME => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_STREAM_SIZE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_STREAM_WRITE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_VALID_MASK => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_ADDED_STREAM => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_REMOVED_STREAM => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_MODIFIED_STREAM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_REMOVED_BY_DELETE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_ID_NOT_TUNNELLED => 10

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_TUNNELLED_ID_COLLISION => 11

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_BYTE_STREAM_TYPE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_MESSAGE_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_ACCEPT_REMOTE_CLIENTS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_REJECT_REMOTE_CLIENTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_TYPE_VALID_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_QUEUE_OPERATION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_COMPLETE_OPERATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_BYTE_STREAM_MODE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_MESSAGE_MODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_INBOUND => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_OUTBOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_FULL_DUPLEX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_DISCONNECTED_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_LISTENING_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_CONNECTED_STATE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_CLOSING_STATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_CLIENT_END => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_SERVER_END => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NEED_EA => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_EA_TYPE_BINARY => 65534

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_EA_TYPE_ASCII => 65533

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_EA_TYPE_BITMAP => 65531

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_EA_TYPE_METAFILE => 65530

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_EA_TYPE_ICON => 65529

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_EA_TYPE_EA => 65518

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_EA_TYPE_MVMT => 65503

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_EA_TYPE_MVST => 65502

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_EA_TYPE_ASN1 => 65501

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_EA_TYPE_FAMILY_IDS => 65281

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ID_GLOBAL_TX_DIR_INFO_FLAG_WRITELOCKED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ID_GLOBAL_TX_DIR_INFO_FLAG_VISIBLE_TO_TX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ID_GLOBAL_TX_DIR_INFO_FLAG_VISIBLE_OUTSIDE_TX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NO_8DOT3_NAME_PRESENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REMOVED_8DOT3_NAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LX_FILE_METADATA_HAS_UID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LX_FILE_METADATA_HAS_GID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LX_FILE_METADATA_HAS_MODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LX_FILE_METADATA_HAS_DEVICE_ID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LX_FILE_CASE_SENSITIVE_DIR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_LINK_REPLACE_IF_EXISTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_LINK_POSIX_SEMANTICS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_LINK_SUPPRESS_STORAGE_RESERVE_INHERITANCE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_LINK_NO_INCREASE_AVAILABLE_SPACE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_LINK_NO_DECREASE_AVAILABLE_SPACE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_LINK_PRESERVE_AVAILABLE_SPACE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_LINK_IGNORE_READONLY_ATTRIBUTE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_LINK_FORCE_RESIZE_TARGET_SR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_LINK_FORCE_RESIZE_SOURCE_SR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_LINK_FORCE_RESIZE_SR => 384

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RENAME_REPLACE_IF_EXISTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RENAME_POSIX_SEMANTICS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RENAME_SUPPRESS_PIN_STATE_INHERITANCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RENAME_SUPPRESS_STORAGE_RESERVE_INHERITANCE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RENAME_NO_INCREASE_AVAILABLE_SPACE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RENAME_NO_DECREASE_AVAILABLE_SPACE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RENAME_PRESERVE_AVAILABLE_SPACE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RENAME_IGNORE_READONLY_ATTRIBUTE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RENAME_FORCE_RESIZE_TARGET_SR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RENAME_FORCE_RESIZE_SOURCE_SR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RENAME_FORCE_RESIZE_SR => 384

    /**
     * @type {Integer (UInt32)}
     */
    static REMOTE_PROTOCOL_FLAG_LOOPBACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REMOTE_PROTOCOL_FLAG_OFFLINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REMOTE_PROTOCOL_FLAG_PERSISTENT_HANDLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static REMOTE_PROTOCOL_FLAG_PRIVACY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static REMOTE_PROTOCOL_FLAG_INTEGRITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static REMOTE_PROTOCOL_FLAG_MUTUAL_AUTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SHARECAP_TIMEWARP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SHARECAP_DFS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SHARECAP_CONTINUOUS_AVAILABILITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SHARECAP_SCALEOUT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SHARECAP_CLUSTER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SHARECAP_ENCRYPTED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SHARECAP_ACCESS_BASED_DIRECTORY_ENUM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SHARECAP_IDENTITY_REMOTING => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SHARECAP_ASYMMETRIC_SCALEOUT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SHARETYPE_DISK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SHARETYPE_PIPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SHARETYPE_PRINT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SERVERCAP_DFS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SERVERCAP_LEASING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SERVERCAP_LARGEMTU => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SERVERCAP_MULTICHANNEL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SERVERCAP_PERSISTENT_HANDLES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SERVERCAP_DIRECTORY_LEASING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RPI_SMB2_SERVERCAP_ENCRYPTION_AWARE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VC_QUOTA_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VC_QUOTA_TRACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VC_QUOTA_ENFORCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VC_QUOTA_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VC_CONTENT_INDEX_DISABLED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VC_LOG_QUOTA_THRESHOLD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VC_LOG_QUOTA_LIMIT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VC_LOG_VOLUME_THRESHOLD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VC_LOG_VOLUME_LIMIT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VC_QUOTAS_INCOMPLETE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VC_QUOTAS_REBUILDING => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VC_VALID_MASK => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static FLAGS_END_OF_FILE_INFO_EX_EXTEND_PAGING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLAGS_END_OF_FILE_INFO_EX_NO_EXTRA_PAGING_EXTEND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLAGS_END_OF_FILE_INFO_EX_TIME_CONSTRAINED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLAGS_DELAY_REASONS_LOG_FILE_FULL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLAGS_DELAY_REASONS_BITMAP_SCANNED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USN_DELETE_FLAG_DELETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SET_PURGE_FAILURE_MODE_DISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYMLINK_FLAG_RELATIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYMLINK_DIRECTORY => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SYMLINK_FILE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SYMLINK_RESERVED_MASK => 4026531840

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_VALID_VALUES => 4026597375

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_DRIVE_EXTENDER => -2147483643

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_FILTER_MANAGER => -2147483637

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_IIS_CACHE => -1610612720

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_APPXSTRM => -1073741804

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_DFM => -2147483626

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_LX_SYMLINK => -1610612707

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_LX_FIFO => -2147483612

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_LX_CHR => -2147483611

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_LX_BLK => -2147483610

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_IFSTEST_CONGRUENT => 9

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_MOONWALK_HSM => 10

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_TSINGHUA_UNIVERSITY_RESEARCH => 11

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ARKIVIO => 12

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_SOLUTIONSOFT => 536870925

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_COMMVAULT => 14

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_OVERTONE => 15

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_SYMANTEC_HSM2 => 16

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ENIGMA_HSM => 17

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_SYMANTEC_HSM => 18

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_INTERCOPE_HSM => 19

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_KOM_NETWORKS_HSM => 20

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_MEMORY_TECH_HSM => 21

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_BRIDGEHEAD_HSM => 22

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_OSR_SAMPLE => 536870935

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_GLOBAL360_HSM => 24

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ALTIRIS_HSM => 25

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_HERMES_HSM => 26

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_POINTSOFT_HSM => 27

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_GRAU_DATASTORAGE_HSM => 28

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_COMMVAULT_HSM => 29

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_DATASTOR_SIS => 30

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_EDSI_HSM => 31

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_HP_HSM => 32

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_SER_HSM => 33

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_DOUBLE_TAKE_HSM => 34

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_WISDATA_HSM => 35

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_MIMOSA_HSM => 36

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_HSAG_HSM => 37

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ADA_HSM => 38

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_AUTN_HSM => 39

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_NEXSAN_HSM => 40

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_DOUBLE_TAKE_SIS => 41

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_SONY_HSM => 42

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ELTAN_HSM => 43

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_UTIXO_HSM => 44

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_QUEST_HSM => 45

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_DATAGLOBAL_HSM => 46

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_QI_TECH_HSM => 536870959

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_DATAFIRST_HSM => 48

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_C2CSYSTEMS_HSM => 49

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_WATERFORD => 50

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_RIVERBED_HSM => 51

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_CARINGO_HSM => 52

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_MAXISCALE_HSM => 536870965

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_CITRIX_PM => 54

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_OPENAFS_DFS => 55

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ZLTI_HSM => 56

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_EMC_HSM => 57

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_VMWARE_PM => 58

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ARCO_BACKUP => 59

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_CARROLL_HSM => 60

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_COMTRADE_HSM => 61

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_EASEVAULT_HSM => 62

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_HDS_HSM => 63

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_MAGINATICS_RDR => 64

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_GOOGLE_HSM => 65

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_QUADDRA_HSM => 66

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_HP_BACKUP => 67

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_DROPBOX_HSM => 68

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ADOBE_HSM => 69

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_HP_DATA_PROTECT => 70

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACTIVISION_HSM => 71

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_HDS_HCP_HSM => 72

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_AURISTOR_FS => 73

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ITSTATION => 74

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_SPHARSOFT => 75

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ALERTBOOT => 536870988

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_MTALOS => 77

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_CTERA_HSM => 78

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_NIPPON_HSM => 79

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_REDSTOR_HSM => 80

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_NEUSHIELD => 81

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_DOR_HSM => 82

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_SHX_BACKUP => 83

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_NVIDIA_UNIONFS => 536870996

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_HUBSTOR_HSM => 85

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_IMANAGE_HSM => 536870998

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_EASEFILTER_HSM => 87

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_0 => 96

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_1 => 97

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_2 => 98

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_3 => 99

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_4 => 100

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_5 => 101

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_6 => 102

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_7 => 103

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_8 => 104

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_9 => 105

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_A => 106

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_B => 107

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_C => 108

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_D => 109

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_E => 110

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_ACRONIS_HSM_F => 111

    /**
     * @type {Integer (UInt32)}
     */
    static REPARSE_DATA_EX_FLAG_GIVEN_TAG_OR_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORTED_FS_FEATURES_OFFLOAD_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORTED_FS_FEATURES_OFFLOAD_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORTED_FS_FEATURES_QUERY_OPEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORTED_FS_FEATURES_BYPASS_IO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_LMR_GET_LINK_TRACKING_INFORMATION => 1310952

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_LMR_SET_LINK_TRACKING_INFORMATION => 1310956

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_LMR_ARE_FILE_OBJECTS_ON_SAME_SERVER => 1310960

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_ASSIGN_EVENT => 1114112

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_DISCONNECT => 1114116

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_LISTEN => 1114120

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_PEEK => 1130508

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_QUERY_EVENT => 1114128

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_TRANSCEIVE => 1163287

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_WAIT => 1114136

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_IMPERSONATE => 1114140

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_SET_CLIENT_PROCESS => 1114144

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_QUERY_CLIENT_PROCESS => 1114148

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_GET_PIPE_ATTRIBUTE => 1114152

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_SET_PIPE_ATTRIBUTE => 1114156

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_GET_CONNECTION_ATTRIBUTE => 1114160

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_SET_CONNECTION_ATTRIBUTE => 1114164

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_GET_HANDLE_ATTRIBUTE => 1114168

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_SET_HANDLE_ATTRIBUTE => 1114172

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_FLUSH => 1146944

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_DISABLE_IMPERSONATE => 1114180

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_SILO_ARRIVAL => 1146952

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_CREATE_SYMLINK => 1114188

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_DELETE_SYMLINK => 1114192

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_QUERY_CLIENT_PROCESS_V2 => 1114196

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_INTERNAL_READ => 1138676

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_INTERNAL_WRITE => 1155064

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_INTERNAL_TRANSCEIVE => 1171455

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_PIPE_INTERNAL_READ_OVFLOW => 1138688

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_READ_DATA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_WRITE_SPACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_COMPUTER_NAME_LENGTH => 15

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_SYMLINK_FLAG_GLOBAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PIPE_SYMLINK_FLAG_RELATIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_MAILSLOT_PEEK => 802819

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_DIRECT_ACCESS_IMAGE_EXTENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_DIRECT_ACCESS_DATA_EXTENTS => 2

    /**
     * @type {String}
     */
    static LX_FILE_METADATA_UID_EA_NAME => "$LXUID"

    /**
     * @type {String}
     */
    static LX_FILE_METADATA_GID_EA_NAME => "$LXGID"

    /**
     * @type {String}
     */
    static LX_FILE_METADATA_MODE_EA_NAME => "$LXMOD"

    /**
     * @type {String}
     */
    static LX_FILE_METADATA_DEVICE_ID_EA_NAME => "$LXDEV"

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_INCREMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_NO_INCREMENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IO_CD_ROM_INCREMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_DISK_INCREMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_MAILSLOT_INCREMENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IO_NAMED_PIPE_INCREMENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IO_NETWORK_INCREMENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SEMAPHORE_INCREMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_PAGE_PRIORITY_BITS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_PROCESSOR_INDEX => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_HAS_TRAVERSE_PRIVILEGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_HAS_BACKUP_PRIVILEGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_HAS_RESTORE_PRIVILEGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_WRITE_RESTRICTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_IS_RESTRICTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_SESSION_NOT_REFERENCED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_SANDBOX_INERT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_HAS_IMPERSONATE_PRIVILEGE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SE_BACKUP_PRIVILEGES_CHECKED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_VIRTUALIZE_ALLOWED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_VIRTUALIZE_ENABLED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_IS_FILTERED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_UIACCESS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_NOT_LOW => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_LOWBOX => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_HAS_OWN_CLAIM_ATTRIBUTES => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_PRIVATE_NAMESPACE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_DO_NOT_USE_GLOBAL_ATTRIBS_FOR_QUERY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SPECIAL_ENCRYPTED_OPEN => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_NO_CHILD_PROCESS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_NO_CHILD_PROCESS_UNLESS_SECURE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_AUDIT_NO_CHILD_PROCESS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_ENFORCE_REDIRECTION_TRUST => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_AUDIT_REDIRECTION_TRUST => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_LEARNING_MODE_LOGGING => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_PERMISSIVE_LEARNING_MODE => 50331648

    /**
     * @type {Integer (UInt32)}
     */
    static IO_OPEN_PAGING_FILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IO_OPEN_TARGET_DIRECTORY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IO_STOP_ON_SYMLINK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IO_MM_PAGING_FILE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IO_IGNORE_READONLY_ATTRIBUTE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FS_FILTER_SECTION_SYNC_IN_FLAG_DONT_UPDATE_LAST_ACCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FS_FILTER_SECTION_SYNC_IN_FLAG_DONT_UPDATE_LAST_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FS_FILTER_SECTION_SYNC_SUPPORTS_ASYNC_PARALLEL_IO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FS_FILTER_SECTION_SYNC_SUPPORTS_DIRECT_MAP_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FS_FILTER_SECTION_SYNC_SUPPORTS_DIRECT_MAP_IMAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FS_FILTER_SECTION_SYNC_IMAGE_EXTENTS_ARE_NOT_RVA => 8

    /**
     * @type {Integer (UInt16)}
     */
    static FS_FILTER_ACQUIRE_FOR_SECTION_SYNCHRONIZATION => 65535

    /**
     * @type {Integer (UInt16)}
     */
    static FS_FILTER_RELEASE_FOR_SECTION_SYNCHRONIZATION => 65534

    /**
     * @type {Integer (UInt16)}
     */
    static FS_FILTER_ACQUIRE_FOR_MOD_WRITE => 65533

    /**
     * @type {Integer (UInt16)}
     */
    static FS_FILTER_RELEASE_FOR_MOD_WRITE => 65532

    /**
     * @type {Integer (UInt16)}
     */
    static FS_FILTER_ACQUIRE_FOR_CC_FLUSH => 65531

    /**
     * @type {Integer (UInt16)}
     */
    static FS_FILTER_RELEASE_FOR_CC_FLUSH => 65530

    /**
     * @type {Integer (UInt16)}
     */
    static FS_FILTER_QUERY_OPEN => 65529

    /**
     * @type {Integer (UInt32)}
     */
    static DO_VERIFY_VOLUME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DO_BUFFERED_IO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DO_EXCLUSIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DO_DIRECT_IO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DO_MAP_IO_BUFFER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DO_DEVICE_HAS_NAME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DO_DEVICE_INITIALIZING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DO_SYSTEM_BOOT_PARTITION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DO_LONG_TERM_REQUESTS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DO_NEVER_LAST_DEVICE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DO_SHUTDOWN_REGISTERED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DO_BUS_ENUMERATED_DEVICE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DO_POWER_PAGABLE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DO_POWER_INRUSH => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DO_LOW_PRIORITY_FILESYSTEM => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DO_SUPPORTS_PERSISTENT_ACLS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DO_SUPPORTS_TRANSACTIONS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DO_FORCE_NEITHER_IO => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DO_VOLUME_DEVICE_OBJECT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DO_SYSTEM_SYSTEM_PARTITION => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DO_SYSTEM_CRITICAL_PARTITION => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static DO_DISALLOW_EXECUTE => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static DO_DEVICE_TO_BE_RESET => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static DO_DEVICE_IRP_REQUIRES_EXTENSION => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static DO_DAX_VOLUME => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DO_BOOT_CRITICAL => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static IO_FILE_OBJECT_NON_PAGED_POOL_CHARGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IO_FILE_OBJECT_PAGED_POOL_CHARGE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IO_CREATE_STREAM_FILE_RAISE_ON_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_CREATE_STREAM_FILE_LITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PO_CB_SYSTEM_POWER_POLICY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PO_CB_AC_STATUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PO_CB_BUTTON_COLLISION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PO_CB_SYSTEM_STATE_LOCK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PO_CB_LID_SWITCH_STATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PO_CB_PROCESSOR_POWER_POLICY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FORCE_CLOSED_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FORCE_CLOSED_IMAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FORCE_CLOSED_LATER_OK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IS_FILE_SECTION_ACTIVE_IMAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IS_FILE_SECTION_ACTIVE_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_IS_FILE_SECTION_ACTIVE_USER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_RESET_RESERVED_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_RESET_RESERVED_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_RESET_KEEP_STACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FCB_HEADER_V0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FCB_HEADER_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FCB_HEADER_V2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FCB_HEADER_V3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FCB_HEADER_V4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FLAG_FILE_MODIFIED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FLAG_FILE_LENGTH_CHANGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FLAG_LIMIT_MODIFIED_PAGES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FLAG_ACQUIRE_MAIN_RSRC_EX => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FLAG_ACQUIRE_MAIN_RSRC_SH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FLAG_USER_MAPPED_FILE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FLAG_ADVANCED_HEADER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FLAG_EOF_ADVANCE_ACTIVE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FLAG2_DO_MODIFIED_WRITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FLAG2_SUPPORTS_FILTER_CONTEXTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FLAG2_PURGE_WHEN_MAPPED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FLAG2_IS_PAGING_FILE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FLAG2_WRITABLE_USER_MAPPED_FILE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FLAG2_BYPASSIO_STREAM_PAUSED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_AUXILIARY_FLAG_DEALLOCATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_ADD_TC_CASE_SENSITIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_ADD_TC_KEY_BY_SHORT_NAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FIND_TC_CASE_SENSITIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_FAT_LEGAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_HPFS_LEGAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_NTFS_LEGAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_WILD_CHARACTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_OLE_LEGAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MCB_FLAG_RAISE_ON_ALLOCATION_FAILURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_FLAG_COMPLETE_IF_OPLOCKED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_FLAG_OPLOCK_KEY_CHECK_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_FLAG_BACK_OUT_ATOMIC_OPLOCK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_FLAG_IGNORE_OPLOCK_KEYS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_FLAG_PARENT_OBJECT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_FLAG_CLOSING_DELETE_ON_CLOSE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_FLAG_REMOVING_FILE_OR_LINK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_FLAG_BREAKING_FOR_SHARING_VIOLATION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_UPPER_FLAG_CHECK_NO_BREAK => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_UPPER_FLAG_NOTIFY_REFRESH_READ => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_FSCTRL_FLAG_ALL_KEYS_MATCH => 1

    /**
     * @type {Guid}
     */
    static GUID_ECP_OPLOCK_KEY => Guid("{48850596-3050-4be7-9863-fec350ce8d7f}")

    /**
     * @type {Guid}
     */
    static GUID_ECP_DUAL_OPLOCK_KEY => Guid("{41621a14-b08b-4df1-b676-a05ffdf01bea}")

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VOLUME_DISMOUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VOLUME_DISMOUNT_FAILED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VOLUME_LOCK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VOLUME_LOCK_FAILED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VOLUME_UNLOCK => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VOLUME_MOUNT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VOLUME_NEEDS_CHKDSK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VOLUME_WORM_NEAR_FULL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VOLUME_WEARING_OUT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VOLUME_FORCED_CLOSED => 10

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VOLUME_INFO_MAKE_COMPAT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VOLUME_PREPARING_EJECT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VOLUME_CHANGE_SIZE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VOLUME_BACKGROUND_FORMAT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_UNC_PROVIDER_FLAGS_MAILSLOTS_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_UNC_PROVIDER_FLAGS_CSC_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_UNC_PROVIDER_FLAGS_DOMAIN_SVC_AWARE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_UNC_PROVIDER_FLAGS_CONTAINER_AWARE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_UNC_REGISTRATION_VERSION_0200 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_UNC_REGISTRATION_VERSION_0201 => 513

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_UNC_REGISTRATION_CURRENT_VERSION => 513

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_UNC_HARDENING_CAPABILITIES_MUTUAL_AUTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_UNC_HARDENING_CAPABILITIES_INTEGRITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_UNC_HARDENING_CAPABILITIES_PRIVACY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_ALLOCATE_ECPLIST_FLAG_CHARGE_QUOTA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_ALLOCATE_ECP_FLAG_CHARGE_QUOTA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_ALLOCATE_ECP_FLAG_NONPAGED_POOL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_ECP_LOOKASIDE_FLAG_NONPAGED_POOL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORK_OPEN_ECP_IN_FLAG_DISABLE_HANDLE_COLLAPSING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORK_OPEN_ECP_IN_FLAG_DISABLE_HANDLE_DURABILITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORK_OPEN_ECP_IN_FLAG_FORCE_MAX_EOF_HACK => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORK_OPEN_ECP_IN_FLAG_FORCE_BUFFERED_SYNCHRONOUS_IO_HACK => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORK_OPEN_ECP_IN_FLAG_DISABLE_OPLOCKS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORK_OPEN_ECP_IN_FLAG_REQ_MUTUAL_AUTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORK_OPEN_ECP_OUT_FLAG_RET_MUTUAL_AUTH => 8

    /**
     * @type {Guid}
     */
    static GUID_ECP_NETWORK_OPEN_CONTEXT => Guid("{c584edbf-00df-4d28-b884-35baca8911e8}")

    /**
     * @type {Guid}
     */
    static GUID_ECP_NETWORK_APP_INSTANCE => Guid("{6aa6bc45-a7ef-4af7-9008-fa462e144d74}")

    /**
     * @type {Guid}
     */
    static GUID_ECP_NETWORK_APP_INSTANCE_VERSION => Guid("{b7d082b9-563b-4f07-a07b-524a8116a010}")

    /**
     * @type {Guid}
     */
    static GUID_ECP_PREFETCH_OPEN => Guid("{e1777b21-847e-4837-aa45-64161d280655}")

    /**
     * @type {Guid}
     */
    static GUID_ECP_NFS_OPEN => Guid("{f326d30c-e5f8-4fe7-ab74-f5a3196d92db}")

    /**
     * @type {Guid}
     */
    static GUID_ECP_SRV_OPEN => Guid("{bebfaebc-aabf-489d-9d2c-e9e361102853}")

    /**
     * @type {Integer (UInt32)}
     */
    static SRV_OPEN_ECP_CONTEXT_VERSION_2 => 2

    /**
     * @type {Guid}
     */
    static GUID_ECP_RKF_BYPASS => Guid("{02378cc6-f73c-489c-8282-564d1a99131b}")

    /**
     * @type {Guid}
     */
    static GUID_ECP_IO_DEVICE_HINT => Guid("{f315b732-ac6b-4d4d-be0c-b3126490e1a3}")

    /**
     * @type {Guid}
     */
    static GUID_ECP_CSV_DOWN_LEVEL_OPEN => Guid("{4248be44-647f-488f-8be5-a08aaf70f028}")

    /**
     * @type {Guid}
     */
    static GUID_ECP_CSV_QUERY_FILE_REVISION => Guid("{44aec90b-de65-4d46-8fbf-763f9d970b1d}")

    /**
     * @type {Guid}
     */
    static GUID_ECP_CSV_QUERY_FILE_REVISION_FILE_ID_128 => Guid("{7a3a4aa1-aa74-4bc6-b070-ab56a38c1fed}")

    /**
     * @type {Guid}
     */
    static GUID_ECP_CSV_SET_HANDLE_PROPERTIES => Guid("{7a9fdd94-7b58-42bb-9740-3cb86983a615}")

    /**
     * @type {Integer (UInt32)}
     */
    static CSV_SET_HANDLE_PROPERTIES_ECP_CONTEXT_FLAGS_VALID_ONLY_IF_CSV_COORDINATOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_TAG_ENCOUNTERED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_REPARSE_IF_CHILD_EXISTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_REPARSE_IF_CHILD_NOT_EXISTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_REPARSE_IF_DIRECTORY_FINAL_COMPONENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_REPARSE_IF_NON_DIRECTORY_NON_FINAL_COMPONENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_REPARSE_IF_NON_DIRECTORY_FINAL_COMPONENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_OVERRIDE_CREATE_OPTION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_RETURN_REPARSE_DATA_BUFFER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_VERSION_EX => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_REPARSE_IF_NON_FINAL_COMPONENT => 22

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_REPARSE_IF_DIRECTORY_FINAL_COMPONENT_ALWAYS => 72

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_REPARSE_IF_NON_DIRECTORY_NON_FINAL_COMPONENT_ALWAYS => 80

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_REPARSE_IF_NON_DIRECTORY_FINAL_COMPONENT_ALWAYS => 96

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_REPARSE_IF_FINAL_COMPONENT => 40

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_REPARSE_IF_FINAL_COMPONENT_ALWAYS => 104

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_REPARSE_POINT_REPARSE_ALWAYS => 126

    /**
     * @type {Guid}
     */
    static ECP_TYPE_OPEN_REPARSE_GUID => Guid("{323eb6a8-affd-4d95-8230-863bce09d37a}")

    /**
     * @type {Guid}
     */
    static ECP_TYPE_IO_STOP_ON_SYMLINK_FILTER_GUID => Guid("{940e5d56-1646-4d3c-87b6-577ec36a1466}")

    /**
     * @type {Guid}
     */
    static ECP_TYPE_CLFS_CREATE_CONTAINER => Guid("{8650c9fe-0cec-8bf6-bd1e-835956541090}")

    /**
     * @type {Guid}
     */
    static GUID_ECP_CREATE_REDIRECTION => Guid("{188d6bd6-a126-4fa8-bdf2-1ccdf896f3e0}")

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_REDIRECTION_FLAGS_SERVICED_FROM_LAYER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_REDIRECTION_FLAGS_SERVICED_FROM_SCRATCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_REDIRECTION_FLAGS_SERVICED_FROM_REGISTERED_LAYER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_REDIRECTION_FLAGS_SERVICED_FROM_REMOTE_LAYER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_REDIRECTION_FLAGS_SERVICED_FROM_USER_MODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WCIFS_REDIRECTION_FLAGS_CREATE_SERVICED_FROM_LAYER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCIFS_REDIRECTION_FLAGS_CREATE_SERVICED_FROM_SCRATCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCIFS_REDIRECTION_FLAGS_CREATE_SERVICED_FROM_REGISTERED_LAYER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WCIFS_REDIRECTION_FLAGS_CREATE_SERVICED_FROM_REMOTE_LAYER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_SPARSE_SPECIFIED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_REPARSE_POINT_SPECIFIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_EOF_SPECIFIED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_VDL_SPECIFIED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_TIMESTAMPS_SPECIFIED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_FILE_ATTRIBUTES_SPECIFIED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_SUPPRESS_FILE_ATTRIBUTE_INHERITANCE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_OP_FLAGS_SPECIFIED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_OPERATION_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_BEST_EFFORT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_SUPPRESS_PARENT_TIMESTAMPS_UPDATE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_SUPPRESS_DIR_CHANGE_NOTIFY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_MARK_USN_SOURCE_INFO => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_WRITE_USN_CLOSE_RECORD => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_FLAG_GEN_FLAGS_SPECIFIED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_IN_OP_FLAG_CASE_SENSITIVE_FLAGS_SPECIFIED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_FLAG_SPARSE_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_FLAG_REPARSE_POINT_SET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_FLAG_EOF_SET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_FLAG_VDL_SET => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_FLAG_TIMESTAMPS_SET => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_FLAG_FILE_ATTRIBUTES_SET => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_FLAG_FILE_ATTRIBUTE_INHERITANCE_SUPPRESSED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_FLAG_OP_FLAGS_HONORED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_FLAG_OPERATION_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_FLAG_TIMESTAMPS_RETURNED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_FLAG_FILE_ATTRIBUTES_RETURNED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_FLAG_USN_SOURCE_INFO_MARKED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_FLAG_USN_CLOSE_RECORD_WRITTEN => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_FLAG_USN_RETURNED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ATOMIC_CREATE_ECP_OUT_OP_FLAG_CASE_SENSITIVE_FLAGS_SET => 1

    /**
     * @type {Guid}
     */
    static GUID_ECP_ATOMIC_CREATE => Guid("{4720bd83-52ac-4104-a130-d1ec6a8cc8e5}")

    /**
     * @type {Integer (UInt32)}
     */
    static ECP_OPEN_PARAMETERS_FLAG_OPEN_FOR_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ECP_OPEN_PARAMETERS_FLAG_OPEN_FOR_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ECP_OPEN_PARAMETERS_FLAG_OPEN_FOR_DELETE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ECP_OPEN_PARAMETERS_FLAG_IGNORE_DIR_CASE_SENSITIVITY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ECP_OPEN_PARAMETERS_FLAG_FAIL_ON_CASE_SENSITIVE_DIR => 16

    /**
     * @type {Guid}
     */
    static GUID_ECP_OPEN_PARAMETERS => Guid("{cd0a93c3-3bb7-463d-accb-969d3435a5a5}")

    /**
     * @type {Integer (UInt32)}
     */
    static QoCFileStatInformation => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QoCFileLxInformation => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QoCFileEaInformation => 4

    /**
     * @type {Guid}
     */
    static GUID_ECP_QUERY_ON_CREATE => Guid("{1aca62e9-abb4-4ff2-bb5c-1c79025e417f}")

    /**
     * @type {Guid}
     */
    static GUID_ECP_CLOUDFILES_ATTRIBUTION => Guid("{2932ff52-8378-4fc1-8edb-6bdc8f602709}")

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_CC_FLUSH_ERROR_FLAG_NO_HARD_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_CC_FLUSH_ERROR_FLAG_NO_LOG_ENTRY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VIRTDISK_FULLY_ALLOCATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_VIRTDISK_NO_DRIVE_LETTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_DRIVER_BACKING_FLAG_USE_PAGE_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VACB_MAPPING_GRANULARITY => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static VACB_OFFSET_SHIFT => 18

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_MANAGER_CALLBACKS_EX_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CC_ACQUIRE_DONT_WAIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CC_ACQUIRE_SUPPORTS_ASYNC_LAZYWRITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UNINITIALIZE_CACHE_MAPS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DO_NOT_RETRY_PURGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DO_NOT_PURGE_DIRTY_PAGES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PURGE_WITH_ACTIVE_VIEWS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CC_FLUSH_AND_PURGE_NO_PURGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CC_FLUSH_AND_PURGE_GATHER_DIRTY_BITS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CC_FLUSH_AND_PURGE_WRITEABLE_VIEWS_NOTSEEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PIN_WAIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PIN_EXCLUSIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PIN_NO_READ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PIN_IF_BCB => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PIN_CALLER_TRACKS_DIRTY_DATA => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PIN_HIGH_PRIORITY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PIN_VERIFY_REQUIRED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAP_WAIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAP_NO_READ => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MAP_HIGH_PRIORITY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAP_DISABLE_PAGEFAULT_CLUSTERING => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_USE_DIRECT_ACCESS_MAPPING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_VALID_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CC_AGGRESSIVE_UNMAP_BEHIND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CC_DISABLE_READ_AHEAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CC_DISABLE_WRITE_BEHIND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CC_DISABLE_DIRTY_PAGE_TRACKING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CC_ENABLE_DISK_IO_ACCOUNTING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CC_DISABLE_UNMAP_BEHIND => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CC_ENABLE_CPU_CACHE => 268435456

    /**
     * @type {String}
     */
    static DD_MUP_DEVICE_NAME => "\Device\Mup"

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_REDIR_QUERY_PATH => 1311119

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_REDIR_QUERY_PATH_EX => 1311123

    /**
     * @type {String}
     */
    static EA_NAME_NETWORK_OPEN_ECP_PRIVACY => "ECP{c584edbf-00df-4d28-00b8-8435baca8911e8}-PRIVACY"

    /**
     * @type {String}
     */
    static EA_NAME_NETWORK_OPEN_ECP_PRIVACY_U => "ECP{c584edbf-00df-4d28-00b8-8435baca8911e8}-PRIVACY"

    /**
     * @type {String}
     */
    static EA_NAME_NETWORK_OPEN_ECP_INTEGRITY => "ECP{c584edbf-00df-4d28-00b8-8435baca8911e8}-INTEGRITY"

    /**
     * @type {String}
     */
    static EA_NAME_NETWORK_OPEN_ECP_INTEGRITY_U => "ECP{c584edbf-00df-4d28-00b8-8435baca8911e8}-INTEGRITY"

    /**
     * @type {Integer (UInt32)}
     */
    static VOLSNAPCONTROLTYPE => 83

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_VOLSNAP_FLUSH_AND_HOLD_WRITES => 5488640

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_LEADBYTES => 12
;@endregion Constants

;@region Methods
    /**
     * User-mode API - Marks any outstanding I/O operations for the specified file handle. The function only cancels I/O operations in the current process, regardless of which thread created the I/O operation.
     * @remarks
     * The **NTCancelIoFileEx** function allows you to cancel requests in threads other than the calling thread. The [**NtCancelIoFile**](nt-cancel-io-file.md) function only cancels requests in the same thread that called the **NtCancelIoFile** function. **NtCancelIoFileEx** cancels only outstanding I/O on the handle, it does not change the state of the handle; this means that you cannot rely on the state of the handle because you cannot know whether the operation was completed successfully or canceled.
     * 
     * If there are any pending I/O operations in progress for the specified file handle, the **NtCancelIoFileEx** function marks them for cancellation. Most types of operations can be canceled immediately; other operations can continue toward completion before they are actually canceled and the caller is notified. The **NtCancelIoFileEx** function does not wait for all canceled operations to complete.
     * 
     * If the file handle is associated with a completion port, an I/O completion packet is not queued to the port if a synchronous operation is successfully canceled. For asynchronous operations still pending, the cancel operation will queue an I/O completion packet.
     * 
     * The operation being canceled is completed with one of three statuses; you must check the completion status to determine the completion state. The three statuses are:
     * 
     * -   The operation completed normally. This can occur even if the operation was canceled, because the cancel request might not have been submitted in time to cancel the operation.
     * -   The operation was canceled. The [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) function returns **ERROR\_OPERATION\_ABORTED**.
     * -   The operation failed with another error. The [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) function returns the relevant error code.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
     * 
     * 
     * 
     * | Technology                                           | Supported      |
     * |------------------------------------------------------|----------------|
     * | Server Message Block (SMB) 3.0 protocol<br/>   | Yes<br/> |
     * | SMB 3.0 Transparent Failover (TFO)<br/>        | Yes<br/> |
     * | SMB 3.0 with Scale-out File Shares (SO)<br/>   | Yes<br/> |
     * | Cluster Shared Volume File System (CsvFS)<br/> | Yes<br/> |
     * | Resilient File System (ReFS)<br/>              | Yes<br/> |
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoRequestToCancel 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @returns {NTSTATUS} If the function succeeds, the return value is nonzero. The cancel operation for all pending I/O operations issued by the calling process for the specified file handle was successfully requested. The application must not free or reuse the [**OVERLAPPED**](/windows/desktop/api/minwinbase/ns-minwinbase-overlapped) structure associated with the canceled I/O operations until they have completed. The thread can use the [**GetOverlappedResult**](/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult) function to determine when the I/O operations themselves have been completed.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call the [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) function.
     * 
     * If this function cannot find a request to cancel, the return value is 0 (zero), and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns **ERROR\_NOT\_FOUND**.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/nt-cancel-io-file-ex
     */
    static NtCancelIoFileEx(FileHandle, IoRequestToCancel, IoStatusBlock) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\NtCancelIoFileEx", "ptr", FileHandle, "ptr", IoRequestToCancel, "ptr", IoStatusBlock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoRequestToCancel 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @returns {NTSTATUS} 
     */
    static ZwCancelIoFileEx(FileHandle, IoRequestToCancel, IoStatusBlock) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\ZwCancelIoFileEx", "ptr", FileHandle, "ptr", IoRequestToCancel, "ptr", IoStatusBlock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {HANDLE} Event 
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
     * @param {Pointer<Void>} ApcContext 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Integer} CompletionFilter 
     * @param {BOOLEAN} WatchTree 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {BOOLEAN} Asynchronous 
     * @returns {NTSTATUS} 
     */
    static NtNotifyChangeKey(KeyHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, CompletionFilter, WatchTree, Buffer_R, BufferSize, Asynchronous) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\NtNotifyChangeKey", "ptr", KeyHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "uint", CompletionFilter, "char", WatchTree, "ptr", Buffer_R, "uint", BufferSize, "char", Asynchronous, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} EventHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Integer} EventType 
     * @param {BOOLEAN} InitialState 
     * @returns {NTSTATUS} 
     */
    static NtCreateEvent(EventHandle, DesiredAccess, ObjectAttributes, EventType, InitialState) {
        result := DllCall("ntdll.dll\NtCreateEvent", "ptr", EventHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int", EventType, "char", InitialState, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static NtDeleteFile(ObjectAttributes) {
        result := DllCall("ntdll.dll\NtDeleteFile", "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {HANDLE} Event 
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
     * @param {Pointer<Void>} ApcContext 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} FileInformation 
     * @param {Integer} Length 
     * @param {Integer} FileInformationClass 
     * @param {BOOLEAN} ReturnSingleEntry 
     * @param {Pointer<UNICODE_STRING>} FileName 
     * @param {BOOLEAN} RestartScan 
     * @returns {NTSTATUS} 
     */
    static NtQueryDirectoryFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, FileInformation, Length, FileInformationClass, ReturnSingleEntry, FileName, RestartScan) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\NtQueryDirectoryFile", "ptr", FileHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "char", ReturnSingleEntry, "ptr", FileName, "char", RestartScan, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {HANDLE} Event 
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
     * @param {Pointer<Void>} ApcContext 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} FileInformation 
     * @param {Integer} Length 
     * @param {Integer} FileInformationClass 
     * @param {Integer} QueryFlags 
     * @param {Pointer<UNICODE_STRING>} FileName 
     * @returns {NTSTATUS} 
     */
    static NtQueryDirectoryFileEx(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, FileInformation, Length, FileInformationClass, QueryFlags, FileName) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\NtQueryDirectoryFileEx", "ptr", FileHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "uint", QueryFlags, "ptr", FileName, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} FsInformation 
     * @param {Integer} Length 
     * @param {Integer} FsInformationClass 
     * @returns {NTSTATUS} 
     */
    static NtQueryVolumeInformationFile(FileHandle, IoStatusBlock, FsInformation, Length, FsInformationClass) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\NtQueryVolumeInformationFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", FsInformation, "uint", Length, "int", FsInformationClass, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} FsInformation 
     * @param {Integer} Length 
     * @param {Integer} FsInformationClass 
     * @returns {NTSTATUS} 
     */
    static NtSetVolumeInformationFile(FileHandle, IoStatusBlock, FsInformation, Length, FsInformationClass) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\NtSetVolumeInformationFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", FsInformation, "uint", Length, "int", FsInformationClass, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {HANDLE} Event 
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
     * @param {Pointer<Void>} ApcContext 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Integer} FsControlCode 
     * @param {Pointer} InputBuffer 
     * @param {Integer} InputBufferLength 
     * @param {Pointer} OutputBuffer 
     * @param {Integer} OutputBufferLength 
     * @returns {NTSTATUS} 
     */
    static NtFsControlFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, FsControlCode, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\NtFsControlFile", "ptr", FileHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "uint", FsControlCode, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} SourceProcessHandle 
     * @param {HANDLE} SourceHandle 
     * @param {HANDLE} TargetProcessHandle 
     * @param {Pointer<HANDLE>} TargetHandle 
     * @param {Integer} DesiredAccess 
     * @param {Integer} HandleAttributes 
     * @param {Integer} Options 
     * @returns {NTSTATUS} 
     */
    static NtDuplicateObject(SourceProcessHandle, SourceHandle, TargetProcessHandle, TargetHandle, DesiredAccess, HandleAttributes, Options) {
        SourceProcessHandle := SourceProcessHandle is Win32Handle ? NumGet(SourceProcessHandle, "ptr") : SourceProcessHandle
        SourceHandle := SourceHandle is Win32Handle ? NumGet(SourceHandle, "ptr") : SourceHandle
        TargetProcessHandle := TargetProcessHandle is Win32Handle ? NumGet(TargetProcessHandle, "ptr") : TargetProcessHandle

        result := DllCall("ntdll.dll\NtDuplicateObject", "ptr", SourceProcessHandle, "ptr", SourceHandle, "ptr", TargetProcessHandle, "ptr", TargetHandle, "uint", DesiredAccess, "uint", HandleAttributes, "uint", Options, "int")
        return result
    }

    /**
     * Opens an existing directory object.
     * @remarks
     * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
     * @param {Pointer<HANDLE>} DirectoryHandle A handle to the newly opened directory object.
     * @param {Integer} DesiredAccess An [**ACCESS\_MASK**](../secauthz/access-mask.md) that specifies the requested access to the directory object. This parameter can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                                                      | Meaning                                                                     |
     * |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
     * | <span id="DIRECTORY_QUERY"></span><span id="directory_query"></span><dl> <dt>**DIRECTORY\_QUERY**</dt> <dt>0x0001</dt> </dl>                                            | Query access to the directory object.<br/>                            |
     * | <span id="DIRECTORY_TRAVERSE"></span><span id="directory_traverse"></span><dl> <dt>**DIRECTORY\_TRAVERSE**</dt> <dt>0x0002</dt> </dl>                                   | Name-lookup access to the directory object.<br/>                      |
     * | <span id="DIRECTORY_CREATE_OBJECT"></span><span id="directory_create_object"></span><dl> <dt>**DIRECTORY\_CREATE\_OBJECT**</dt> <dt>0x0004</dt> </dl>                   | Name-creation access to the directory object.<br/>                    |
     * | <span id="DIRECTORY_CREATE_SUBDIRECTORY"></span><span id="directory_create_subdirectory"></span><dl> <dt>**DIRECTORY\_CREATE\_SUBDIRECTORY**</dt> <dt>0x0008</dt> </dl> | Subdirectory-creation access to the directory object.<br/>            |
     * | <span id="DIRECTORY_ALL_ACCESS"></span><span id="directory_all_access"></span><dl> <dt>**DIRECTORY\_ALL\_ACCESS**</dt> <dt>STANDARD\_RIGHTS\_REQUIRED \| 0xF</dt> </dl> | All of the preceding rights plus **STANDARD\_RIGHTS\_REQUIRED**.<br/> |
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes The attributes for the directory object. To initialize the **OBJECT\_ATTRIBUTES** structure, use the **InitializeObjectAttributes** macro. For more information, see the documentation for these items in the documentation for the WDK.
     * @returns {NTSTATUS} The function returns STATUS\_SUCCESS or an error status. The possible status codes include the following.
     * 
     * 
     * 
     * | Return code                                                                                                       | Description                                                                                                                                                                                                                                                                                               |
     * |-------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**STATUS\_INSUFFICIENT\_RESOURCES**</dt> </dl>    | A temporary buffer required by this function could not be allocated.<br/>                                                                                                                                                                                                                           |
     * | <dl> <dt>**STATUS\_INVALID\_PARAMETER**</dt> </dl>         | The specified ObjectAttributes parameter was a **NULL** pointer, not a valid pointer to an **OBJECT\_ATTRIBUTES** structure, or some of the members specified in the **OBJECT\_ATTRIBUTES** structure were not valid.<br/>                                                                          |
     * | <dl> <dt>**STATUS\_OBJECT\_NAME\_INVALID**</dt> </dl>      | The *ObjectAttributes* parameter contained an **ObjectName** member in the **OBJECT\_ATTRIBUTES** structure that was not valid because an empty string was found after the **OBJECT\_NAME\_PATH\_SEPARATOR** character.<br/>                                                                        |
     * | <dl> <dt>**STATUS\_OBJECT\_NAME\_NOT\_FOUND**</dt> </dl>   | The *ObjectAttributes* parameter contained an **ObjectName** member in the **OBJECT\_ATTRIBUTES** structure that could not be found.<br/>                                                                                                                                                           |
     * | <dl> <dt>**STATUS\_OBJECT\_PATH\_NOT\_FOUND**</dt> </dl>   | The *ObjectAttributes* parameter contained an **ObjectName** member in the **OBJECT\_ATTRIBUTES** structure with an object path that could not be found. <br/>                                                                                                                                      |
     * | <dl> <dt>**STATUS\_OBJECT\_PATH\_SYNTAX\_BAD** </dt> </dl> | The *ObjectAttributes* parameter did not contain a **RootDirectory** member, but the **ObjectName** member in the **OBJECT\_ATTRIBUTES** structure was an empty string or did not contain an **OBJECT\_NAME\_PATH\_SEPARATOR** character. This indicates incorrect syntax for the object path.<br/> |
     * @see https://learn.microsoft.com/windows/win32/DevNotes/ntopendirectoryobject
     */
    static NtOpenDirectoryObject(DirectoryHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\NtOpenDirectoryObject", "ptr", DirectoryHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer} BaseAddress 
     * @param {Pointer<Pointer>} RegionSize 
     * @param {Integer} AllocationType 
     * @param {Integer} PageProtection 
     * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters 
     * @param {Integer} ExtendedParameterCount 
     * @returns {NTSTATUS} 
     */
    static NtAllocateVirtualMemoryEx(ProcessHandle, BaseAddress, RegionSize, AllocationType, PageProtection, ExtendedParameters, ExtendedParameterCount) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\NtAllocateVirtualMemoryEx", "ptr", ProcessHandle, "ptr", BaseAddress, RegionSizeMarshal, RegionSize, "uint", AllocationType, "uint", PageProtection, "ptr", ExtendedParameters, "uint", ExtendedParameterCount, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<Pointer<Void>>} BaseAddress 
     * @param {Pointer<Pointer>} RegionSize 
     * @param {Integer} FreeType 
     * @returns {NTSTATUS} 
     */
    static NtFreeVirtualMemory(ProcessHandle, BaseAddress, RegionSize, FreeType) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
        RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\NtFreeVirtualMemory", "ptr", ProcessHandle, BaseAddressMarshal, BaseAddress, RegionSizeMarshal, RegionSize, "uint", FreeType, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<Void>} BaseAddress 
     * @param {Integer} MemoryInformationClass 
     * @param {Pointer} MemoryInformation 
     * @param {Pointer} MemoryInformationLength 
     * @param {Pointer<Pointer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static NtQueryVirtualMemory(ProcessHandle, BaseAddress, MemoryInformationClass, MemoryInformation, MemoryInformationLength, ReturnLength) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryVirtualMemory", "ptr", ProcessHandle, BaseAddressMarshal, BaseAddress, "int", MemoryInformationClass, "ptr", MemoryInformation, "ptr", MemoryInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Integer} VmInformationClass 
     * @param {Pointer} NumberOfEntries 
     * @param {Pointer<MEMORY_RANGE_ENTRY>} VirtualAddresses 
     * @param {Pointer} VmInformation 
     * @param {Integer} VmInformationLength 
     * @returns {NTSTATUS} 
     */
    static NtSetInformationVirtualMemory(ProcessHandle, VmInformationClass, NumberOfEntries, VirtualAddresses, VmInformation, VmInformationLength) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        result := DllCall("ntdll.dll\NtSetInformationVirtualMemory", "ptr", ProcessHandle, "int", VmInformationClass, "ptr", NumberOfEntries, "ptr", VirtualAddresses, "ptr", VmInformation, "uint", VmInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EventHandle 
     * @param {Pointer<Integer>} PreviousState 
     * @returns {NTSTATUS} 
     */
    static NtSetEvent(EventHandle, PreviousState) {
        EventHandle := EventHandle is Win32Handle ? NumGet(EventHandle, "ptr") : EventHandle

        PreviousStateMarshal := PreviousState is VarRef ? "int*" : "ptr"

        result := DllCall("ntdll.dll\NtSetEvent", "ptr", EventHandle, PreviousStateMarshal, PreviousState, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<Pointer<Void>>} BaseAddress 
     * @param {Pointer<Pointer>} RegionSize 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @returns {NTSTATUS} 
     */
    static NtFlushVirtualMemory(ProcessHandle, BaseAddress, RegionSize, IoStatus) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
        RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\NtFlushVirtualMemory", "ptr", ProcessHandle, BaseAddressMarshal, BaseAddress, RegionSizeMarshal, RegionSize, "ptr", IoStatus, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Integer} DesiredAccess 
     * @param {Integer} HandleAttributes 
     * @param {Pointer<HANDLE>} TokenHandle 
     * @returns {NTSTATUS} 
     */
    static NtOpenProcessTokenEx(ProcessHandle, DesiredAccess, HandleAttributes, TokenHandle) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        result := DllCall("ntdll.dll\NtOpenProcessTokenEx", "ptr", ProcessHandle, "uint", DesiredAccess, "uint", HandleAttributes, "ptr", TokenHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<HANDLE>} TokenHandle 
     * @returns {NTSTATUS} 
     */
    static ZwOpenProcessToken(ProcessHandle, DesiredAccess, TokenHandle) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        result := DllCall("ntdll.dll\ZwOpenProcessToken", "ptr", ProcessHandle, "uint", DesiredAccess, "ptr", TokenHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ThreadHandle 
     * @param {Integer} DesiredAccess 
     * @param {BOOLEAN} OpenAsSelf 
     * @param {Integer} HandleAttributes 
     * @param {Pointer<HANDLE>} TokenHandle 
     * @returns {NTSTATUS} 
     */
    static NtOpenThreadTokenEx(ThreadHandle, DesiredAccess, OpenAsSelf, HandleAttributes, TokenHandle) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        result := DllCall("ntdll.dll\NtOpenThreadTokenEx", "ptr", ThreadHandle, "uint", DesiredAccess, "char", OpenAsSelf, "uint", HandleAttributes, "ptr", TokenHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ThreadHandle 
     * @param {Integer} DesiredAccess 
     * @param {BOOLEAN} OpenAsSelf 
     * @param {Pointer<HANDLE>} TokenHandle 
     * @returns {NTSTATUS} 
     */
    static ZwOpenThreadToken(ThreadHandle, DesiredAccess, OpenAsSelf, TokenHandle) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        result := DllCall("ntdll.dll\ZwOpenThreadToken", "ptr", ThreadHandle, "uint", DesiredAccess, "char", OpenAsSelf, "ptr", TokenHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TokenHandle 
     * @param {Integer} TokenInformationClass 
     * @param {Pointer} TokenInformation 
     * @param {Integer} TokenInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static NtQueryInformationToken(TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength, ReturnLength) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryInformationToken", "ptr", TokenHandle, "int", TokenInformationClass, "ptr", TokenInformation, "uint", TokenInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TokenHandle 
     * @param {Integer} TokenInformationClass 
     * @param {Pointer} TokenInformation 
     * @param {Integer} TokenInformationLength 
     * @returns {NTSTATUS} 
     */
    static NtSetInformationToken(TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        result := DllCall("ntdll.dll\NtSetInformationToken", "ptr", TokenHandle, "int", TokenInformationClass, "ptr", TokenInformation, "uint", TokenInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @param {Integer} SecurityInformation 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @returns {NTSTATUS} 
     */
    static NtSetSecurityObject(Handle, SecurityInformation, SecurityDescriptor) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ntdll.dll\NtSetSecurityObject", "ptr", Handle, "uint", SecurityInformation, "ptr", SecurityDescriptor, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {HANDLE} Event 
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
     * @param {Pointer<Void>} ApcContext 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer<Integer>} ByteOffset 
     * @param {Pointer<Integer>} Length 
     * @param {Integer} Key 
     * @param {BOOLEAN} FailImmediately 
     * @param {BOOLEAN} ExclusiveLock 
     * @returns {NTSTATUS} 
     */
    static NtLockFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, ByteOffset, Length, Key, FailImmediately, ExclusiveLock) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"
        ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
        LengthMarshal := Length is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtLockFile", "ptr", FileHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, ByteOffsetMarshal, ByteOffset, LengthMarshal, Length, "uint", Key, "char", FailImmediately, "char", ExclusiveLock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer<Integer>} ByteOffset 
     * @param {Pointer<Integer>} Length 
     * @param {Integer} Key 
     * @returns {NTSTATUS} 
     */
    static NtUnlockFile(FileHandle, IoStatusBlock, ByteOffset, Length, Key) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
        LengthMarshal := Length is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtUnlockFile", "ptr", FileHandle, "ptr", IoStatusBlock, ByteOffsetMarshal, ByteOffset, LengthMarshal, Length, "uint", Key, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length 
     * @param {BOOLEAN} ReturnSingleEntry 
     * @param {Pointer} SidList 
     * @param {Integer} SidListLength 
     * @param {PSID} StartSid 
     * @param {BOOLEAN} RestartScan 
     * @returns {NTSTATUS} 
     */
    static NtQueryQuotaInformationFile(FileHandle, IoStatusBlock, Buffer_R, Length, ReturnSingleEntry, SidList, SidListLength, StartSid, RestartScan) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\NtQueryQuotaInformationFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", Buffer_R, "uint", Length, "char", ReturnSingleEntry, "ptr", SidList, "uint", SidListLength, "ptr", StartSid, "char", RestartScan, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length 
     * @returns {NTSTATUS} 
     */
    static NtSetQuotaInformationFile(FileHandle, IoStatusBlock, Buffer_R, Length) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\NtSetQuotaInformationFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", Buffer_R, "uint", Length, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @returns {NTSTATUS} 
     */
    static NtFlushBuffersFile(FileHandle, IoStatusBlock) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\NtFlushBuffersFile", "ptr", FileHandle, "ptr", IoStatusBlock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length 
     * @param {BOOLEAN} ReturnSingleEntry 
     * @param {Pointer} EaList 
     * @param {Integer} EaListLength 
     * @param {Pointer<Integer>} EaIndex 
     * @param {BOOLEAN} RestartScan 
     * @returns {NTSTATUS} 
     */
    static NtQueryEaFile(FileHandle, IoStatusBlock, Buffer_R, Length, ReturnSingleEntry, EaList, EaListLength, EaIndex, RestartScan) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        EaIndexMarshal := EaIndex is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryEaFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", Buffer_R, "uint", Length, "char", ReturnSingleEntry, "ptr", EaList, "uint", EaListLength, EaIndexMarshal, EaIndex, "char", RestartScan, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length 
     * @returns {NTSTATUS} 
     */
    static NtSetEaFile(FileHandle, IoStatusBlock, Buffer_R, Length) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\NtSetEaFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", Buffer_R, "uint", Length, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ExistingTokenHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {BOOLEAN} EffectiveOnly 
     * @param {Integer} TokenType 
     * @param {Pointer<HANDLE>} NewTokenHandle 
     * @returns {NTSTATUS} 
     */
    static NtDuplicateToken(ExistingTokenHandle, DesiredAccess, ObjectAttributes, EffectiveOnly, TokenType, NewTokenHandle) {
        ExistingTokenHandle := ExistingTokenHandle is Win32Handle ? NumGet(ExistingTokenHandle, "ptr") : ExistingTokenHandle

        result := DllCall("ntdll.dll\NtDuplicateToken", "ptr", ExistingTokenHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "char", EffectiveOnly, "int", TokenType, "ptr", NewTokenHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} DirectoryHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static NtCreateDirectoryObject(DirectoryHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\NtCreateDirectoryObject", "ptr", DirectoryHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<FILE_NETWORK_OPEN_INFORMATION>} FileInformation 
     * @returns {NTSTATUS} 
     */
    static NtQueryFullAttributesFile(ObjectAttributes, FileInformation) {
        result := DllCall("ntdll.dll\NtQueryFullAttributesFile", "ptr", ObjectAttributes, "ptr", FileInformation, "int")
        return result
    }

    /**
     * Opens an existing symbolic link.
     * @remarks
     * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
     * @param {Pointer<HANDLE>} LinkHandle A handle to the newly opened symbolic link object.
     * @param {Integer} DesiredAccess An [**ACCESS\_MASK**](../secauthz/access-mask.md) that specifies the requested access to the directory object. It is typical to use GENERIC\_READ so the handle can be passed to the [**NtQueryDirectoryObject**](ntquerydirectoryobject.md) function.
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes The attributes for the directory object. To initialize the **OBJECT\_ATTRIBUTES** structure, use the **InitializeObjectAttributes** macro. If the caller is not running in a system thread context, it must specify the **OBJ\_KERNEL\_HANDLE** flag when initializing the structure. For more information, see the documentation for these items in the documentation for the WDK.
     * @returns {NTSTATUS} The function returns **STATUS\_SUCCESS** or an error status.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/ntopensymboliclinkobject
     */
    static NtOpenSymbolicLinkObject(LinkHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\NtOpenSymbolicLinkObject", "ptr", LinkHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * Retrieves the target of a symbolic link.
     * @remarks
     * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
     * @param {HANDLE} LinkHandle A handle to the symbolic link object.
     * @param {Pointer<UNICODE_STRING>} LinkTarget A pointer to an initialized Unicode string that receives the target of the symbolic link. The **MaximumLength** and **Buffer** members must be set if the call fails.
     * @param {Pointer<Integer>} ReturnedLength A pointer to a variable that receives the length of the Unicode string returned in the *LinkTarget* parameter. If the function returns **STATUS\_BUFFER\_TOO\_SMALL**, this variable receives the required buffer size.
     * @returns {NTSTATUS} The function returns **STATUS\_SUCCESS** or an error status.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/ntquerysymboliclinkobject
     */
    static NtQuerySymbolicLinkObject(LinkHandle, LinkTarget, ReturnedLength) {
        LinkHandle := LinkHandle is Win32Handle ? NumGet(LinkHandle, "ptr") : LinkHandle

        ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQuerySymbolicLinkObject", "ptr", LinkHandle, "ptr", LinkTarget, ReturnedLengthMarshal, ReturnedLength, "int")
        return result
    }

    /**
     * Retrieves information about the specified directory object.
     * @remarks
     * The following is the definition of the **OBJECT\_DIRECTORY\_INFORMATION** structure.
     * 
     * ``` syntax
     * typedef struct _OBJECT_DIRECTORY_INFORMATION {
     *     UNICODE_STRING Name;
     *     UNICODE_STRING TypeName;
     * } OBJECT_DIRECTORY_INFORMATION, *POBJECT_DIRECTORY_INFORMATION;
     * ```
     * 
     * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
     * @param {HANDLE} DirectoryHandle A handle to the directory object.
     * @param {Pointer<Void>} Buffer_R 
     * @param {Integer} Length The size of the user-supplied output buffer, in bytes.
     * @param {BOOLEAN} ReturnSingleEntry Indicates whether the function should return only a single entry.
     * @param {BOOLEAN} RestartScan Indicates whether to restart the scan or continue the enumeration using the information passed in the *Context* parameter.
     * @param {Pointer<Integer>} Context The enumeration context.
     * @param {Pointer<Integer>} ReturnLength A pointer to a variable that receives the length of the directory information returned in the output buffer, in bytes.
     * @returns {NTSTATUS} The function returns **STATUS\_SUCCESS** or an error status.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/ntquerydirectoryobject
     */
    static NtQueryDirectoryObject(DirectoryHandle, Buffer_R, Length, ReturnSingleEntry, RestartScan, Context, ReturnLength) {
        DirectoryHandle := DirectoryHandle is Win32Handle ? NumGet(DirectoryHandle, "ptr") : DirectoryHandle

        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"
        ContextMarshal := Context is VarRef ? "uint*" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryDirectoryObject", "ptr", DirectoryHandle, Buffer_RMarshal, Buffer_R, "uint", Length, "char", ReturnSingleEntry, "char", RestartScan, ContextMarshal, Context, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} DirectoryHandle 
     * @param {Pointer<Void>} Buffer_R 
     * @param {Integer} Length 
     * @param {BOOLEAN} ReturnSingleEntry 
     * @param {BOOLEAN} RestartScan 
     * @param {Pointer<Integer>} Context 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ZwQueryDirectoryObject(DirectoryHandle, Buffer_R, Length, ReturnSingleEntry, RestartScan, Context, ReturnLength) {
        DirectoryHandle := DirectoryHandle is Win32Handle ? NumGet(DirectoryHandle, "ptr") : DirectoryHandle

        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"
        ContextMarshal := Context is VarRef ? "uint*" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryDirectoryObject", "ptr", DirectoryHandle, Buffer_RMarshal, Buffer_R, "uint", Length, "char", ReturnSingleEntry, "char", RestartScan, ContextMarshal, Context, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TokenHandle 
     * @param {BOOLEAN} DisableAllPrivileges 
     * @param {Pointer<TOKEN_PRIVILEGES>} NewState 
     * @param {Integer} BufferLength 
     * @param {Pointer} PreviousState 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ZwAdjustPrivilegesToken(TokenHandle, DisableAllPrivileges, NewState, BufferLength, PreviousState, ReturnLength) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwAdjustPrivilegesToken", "ptr", TokenHandle, "char", DisableAllPrivileges, "ptr", NewState, "uint", BufferLength, "ptr", PreviousState, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TokenHandle 
     * @param {BOOLEAN} ResetToDefault 
     * @param {Pointer<TOKEN_GROUPS>} NewState 
     * @param {Integer} BufferLength 
     * @param {Pointer} PreviousState 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ZwAdjustGroupsToken(TokenHandle, ResetToDefault, NewState, BufferLength, PreviousState, ReturnLength) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwAdjustGroupsToken", "ptr", TokenHandle, "char", ResetToDefault, "ptr", NewState, "uint", BufferLength, "ptr", PreviousState, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ClientToken 
     * @param {Pointer<PRIVILEGE_SET>} RequiredPrivileges 
     * @param {Pointer<BOOLEAN>} Result 
     * @returns {NTSTATUS} 
     */
    static ZwPrivilegeCheck(ClientToken, RequiredPrivileges, Result) {
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        ResultMarshal := Result is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\ZwPrivilegeCheck", "ptr", ClientToken, "ptr", RequiredPrivileges, ResultMarshal, Result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
     * @param {Pointer<UNICODE_STRING>} ObjectName 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {BOOLEAN} ObjectCreation 
     * @param {Pointer<Integer>} GrantedAccess 
     * @param {Pointer<Integer>} AccessStatus 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static ZwAccessCheckAndAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, DesiredAccess, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
        GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
        AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\ZwAccessCheckAndAuditAlarm", "ptr", SubsystemName, HandleIdMarshal, HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "uint", DesiredAccess, "ptr", GenericMapping, "char", ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
     * @param {Pointer<UNICODE_STRING>} ObjectName 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {PSID} PrincipalSelfSid 
     * @param {Integer} DesiredAccess 
     * @param {Integer} AuditType 
     * @param {Integer} Flags 
     * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList 
     * @param {Integer} ObjectTypeListLength 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {BOOLEAN} ObjectCreation 
     * @param {Pointer<Integer>} GrantedAccess 
     * @param {Pointer<Integer>} AccessStatus 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static ZwAccessCheckByTypeAndAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
        GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
        AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\ZwAccessCheckByTypeAndAuditAlarm", "ptr", SubsystemName, HandleIdMarshal, HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "ptr", PrincipalSelfSid, "uint", DesiredAccess, "int", AuditType, "uint", Flags, "ptr", ObjectTypeList, "uint", ObjectTypeListLength, "ptr", GenericMapping, "char", ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
     * @param {Pointer<UNICODE_STRING>} ObjectName 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {PSID} PrincipalSelfSid 
     * @param {Integer} DesiredAccess 
     * @param {Integer} AuditType 
     * @param {Integer} Flags 
     * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList 
     * @param {Integer} ObjectTypeListLength 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {BOOLEAN} ObjectCreation 
     * @param {Pointer<Integer>} GrantedAccess 
     * @param {Pointer<Integer>} AccessStatus 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static ZwAccessCheckByTypeResultListAndAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
        GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
        AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\ZwAccessCheckByTypeResultListAndAuditAlarm", "ptr", SubsystemName, HandleIdMarshal, HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "ptr", PrincipalSelfSid, "uint", DesiredAccess, "int", AuditType, "uint", Flags, "ptr", ObjectTypeList, "uint", ObjectTypeListLength, "ptr", GenericMapping, "char", ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {HANDLE} ClientToken 
     * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
     * @param {Pointer<UNICODE_STRING>} ObjectName 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {PSID} PrincipalSelfSid 
     * @param {Integer} DesiredAccess 
     * @param {Integer} AuditType 
     * @param {Integer} Flags 
     * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList 
     * @param {Integer} ObjectTypeListLength 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {BOOLEAN} ObjectCreation 
     * @param {Pointer<Integer>} GrantedAccess 
     * @param {Pointer<Integer>} AccessStatus 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static ZwAccessCheckByTypeResultListAndAuditAlarmByHandle(SubsystemName, HandleId, ClientToken, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
        GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
        AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\ZwAccessCheckByTypeResultListAndAuditAlarmByHandle", "ptr", SubsystemName, HandleIdMarshal, HandleId, "ptr", ClientToken, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "ptr", PrincipalSelfSid, "uint", DesiredAccess, "int", AuditType, "uint", Flags, "ptr", ObjectTypeList, "uint", ObjectTypeListLength, "ptr", GenericMapping, "char", ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
     * @param {Pointer<UNICODE_STRING>} ObjectName 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {HANDLE} ClientToken 
     * @param {Integer} DesiredAccess 
     * @param {Integer} GrantedAccess 
     * @param {Pointer<PRIVILEGE_SET>} Privileges 
     * @param {BOOLEAN} ObjectCreation 
     * @param {BOOLEAN} AccessGranted 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static ZwOpenObjectAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, ClientToken, DesiredAccess, GrantedAccess, Privileges, ObjectCreation, AccessGranted, GenerateOnClose) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\ZwOpenObjectAuditAlarm", "ptr", SubsystemName, HandleIdMarshal, HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "ptr", ClientToken, "uint", DesiredAccess, "uint", GrantedAccess, "ptr", Privileges, "char", ObjectCreation, "char", AccessGranted, GenerateOnCloseMarshal, GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {HANDLE} ClientToken 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<PRIVILEGE_SET>} Privileges 
     * @param {BOOLEAN} AccessGranted 
     * @returns {NTSTATUS} 
     */
    static ZwPrivilegeObjectAuditAlarm(SubsystemName, HandleId, ClientToken, DesiredAccess, Privileges, AccessGranted) {
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwPrivilegeObjectAuditAlarm", "ptr", SubsystemName, HandleIdMarshal, HandleId, "ptr", ClientToken, "uint", DesiredAccess, "ptr", Privileges, "char", AccessGranted, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {BOOLEAN} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static ZwCloseObjectAuditAlarm(SubsystemName, HandleId, GenerateOnClose) {
        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwCloseObjectAuditAlarm", "ptr", SubsystemName, HandleIdMarshal, HandleId, "char", GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {BOOLEAN} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static ZwDeleteObjectAuditAlarm(SubsystemName, HandleId, GenerateOnClose) {
        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwDeleteObjectAuditAlarm", "ptr", SubsystemName, HandleIdMarshal, HandleId, "char", GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<UNICODE_STRING>} ServiceName 
     * @param {HANDLE} ClientToken 
     * @param {Pointer<PRIVILEGE_SET>} Privileges 
     * @param {BOOLEAN} AccessGranted 
     * @returns {NTSTATUS} 
     */
    static ZwPrivilegedServiceAuditAlarm(SubsystemName, ServiceName, ClientToken, Privileges, AccessGranted) {
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        result := DllCall("ntdll.dll\ZwPrivilegedServiceAuditAlarm", "ptr", SubsystemName, "ptr", ServiceName, "ptr", ClientToken, "ptr", Privileges, "char", AccessGranted, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ExistingTokenHandle 
     * @param {Integer} Flags 
     * @param {Pointer<TOKEN_GROUPS>} SidsToDisable 
     * @param {Pointer<TOKEN_PRIVILEGES>} PrivilegesToDelete 
     * @param {Pointer<TOKEN_GROUPS>} RestrictedSids 
     * @param {Pointer<HANDLE>} NewTokenHandle 
     * @returns {NTSTATUS} 
     */
    static ZwFilterToken(ExistingTokenHandle, Flags, SidsToDisable, PrivilegesToDelete, RestrictedSids, NewTokenHandle) {
        ExistingTokenHandle := ExistingTokenHandle is Win32Handle ? NumGet(ExistingTokenHandle, "ptr") : ExistingTokenHandle

        result := DllCall("ntdll.dll\ZwFilterToken", "ptr", ExistingTokenHandle, "uint", Flags, "ptr", SidsToDisable, "ptr", PrivilegesToDelete, "ptr", RestrictedSids, "ptr", NewTokenHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ThreadHandle 
     * @returns {NTSTATUS} 
     */
    static ZwImpersonateAnonymousToken(ThreadHandle) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        result := DllCall("ntdll.dll\ZwImpersonateAnonymousToken", "ptr", ThreadHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} SectionHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<Integer>} MaximumSize 
     * @param {Integer} SectionPageProtection 
     * @param {Integer} AllocationAttributes 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters 
     * @param {Integer} ExtendedParameterCount 
     * @returns {NTSTATUS} 
     */
    static ZwCreateSectionEx(SectionHandle, DesiredAccess, ObjectAttributes, MaximumSize, SectionPageProtection, AllocationAttributes, FileHandle, ExtendedParameters, ExtendedParameterCount) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        MaximumSizeMarshal := MaximumSize is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwCreateSectionEx", "ptr", SectionHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, MaximumSizeMarshal, MaximumSize, "uint", SectionPageProtection, "uint", AllocationAttributes, "ptr", FileHandle, "ptr", ExtendedParameters, "uint", ExtendedParameterCount, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ThreadHandle 
     * @param {Integer} DesiredAccess 
     * @param {BOOLEAN} OpenAsSelf 
     * @param {Pointer<HANDLE>} TokenHandle 
     * @returns {NTSTATUS} 
     */
    static NtOpenThreadToken(ThreadHandle, DesiredAccess, OpenAsSelf, TokenHandle) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        result := DllCall("ntdll.dll\NtOpenThreadToken", "ptr", ThreadHandle, "uint", DesiredAccess, "char", OpenAsSelf, "ptr", TokenHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<HANDLE>} TokenHandle 
     * @returns {NTSTATUS} 
     */
    static NtOpenProcessToken(ProcessHandle, DesiredAccess, TokenHandle) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        result := DllCall("ntdll.dll\NtOpenProcessToken", "ptr", ProcessHandle, "uint", DesiredAccess, "ptr", TokenHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ExistingTokenHandle 
     * @param {Integer} Flags 
     * @param {Pointer<TOKEN_GROUPS>} SidsToDisable 
     * @param {Pointer<TOKEN_PRIVILEGES>} PrivilegesToDelete 
     * @param {Pointer<TOKEN_GROUPS>} RestrictedSids 
     * @param {Pointer<HANDLE>} NewTokenHandle 
     * @returns {NTSTATUS} 
     */
    static NtFilterToken(ExistingTokenHandle, Flags, SidsToDisable, PrivilegesToDelete, RestrictedSids, NewTokenHandle) {
        ExistingTokenHandle := ExistingTokenHandle is Win32Handle ? NumGet(ExistingTokenHandle, "ptr") : ExistingTokenHandle

        result := DllCall("ntdll.dll\NtFilterToken", "ptr", ExistingTokenHandle, "uint", Flags, "ptr", SidsToDisable, "ptr", PrivilegesToDelete, "ptr", RestrictedSids, "ptr", NewTokenHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ThreadHandle 
     * @returns {NTSTATUS} 
     */
    static NtImpersonateAnonymousToken(ThreadHandle) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        result := DllCall("ntdll.dll\NtImpersonateAnonymousToken", "ptr", ThreadHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TokenHandle 
     * @param {BOOLEAN} DisableAllPrivileges 
     * @param {Pointer<TOKEN_PRIVILEGES>} NewState 
     * @param {Integer} BufferLength 
     * @param {Pointer} PreviousState 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static NtAdjustPrivilegesToken(TokenHandle, DisableAllPrivileges, NewState, BufferLength, PreviousState, ReturnLength) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtAdjustPrivilegesToken", "ptr", TokenHandle, "char", DisableAllPrivileges, "ptr", NewState, "uint", BufferLength, "ptr", PreviousState, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TokenHandle 
     * @param {BOOLEAN} ResetToDefault 
     * @param {Pointer<TOKEN_GROUPS>} NewState 
     * @param {Integer} BufferLength 
     * @param {Pointer} PreviousState 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static NtAdjustGroupsToken(TokenHandle, ResetToDefault, NewState, BufferLength, PreviousState, ReturnLength) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtAdjustGroupsToken", "ptr", TokenHandle, "char", ResetToDefault, "ptr", NewState, "uint", BufferLength, "ptr", PreviousState, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ClientToken 
     * @param {Pointer<PRIVILEGE_SET>} RequiredPrivileges 
     * @param {Pointer<BOOLEAN>} Result 
     * @returns {NTSTATUS} 
     */
    static NtPrivilegeCheck(ClientToken, RequiredPrivileges, Result) {
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        ResultMarshal := Result is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\NtPrivilegeCheck", "ptr", ClientToken, "ptr", RequiredPrivileges, ResultMarshal, Result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
     * @param {Pointer<UNICODE_STRING>} ObjectName 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {BOOLEAN} ObjectCreation 
     * @param {Pointer<Integer>} GrantedAccess 
     * @param {Pointer<Integer>} AccessStatus 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static NtAccessCheckAndAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, DesiredAccess, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
        GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
        AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\NtAccessCheckAndAuditAlarm", "ptr", SubsystemName, HandleIdMarshal, HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "uint", DesiredAccess, "ptr", GenericMapping, "char", ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
     * @param {Pointer<UNICODE_STRING>} ObjectName 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {PSID} PrincipalSelfSid 
     * @param {Integer} DesiredAccess 
     * @param {Integer} AuditType 
     * @param {Integer} Flags 
     * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList 
     * @param {Integer} ObjectTypeListLength 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {BOOLEAN} ObjectCreation 
     * @param {Pointer<Integer>} GrantedAccess 
     * @param {Pointer<Integer>} AccessStatus 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static NtAccessCheckByTypeAndAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
        GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
        AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\NtAccessCheckByTypeAndAuditAlarm", "ptr", SubsystemName, HandleIdMarshal, HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "ptr", PrincipalSelfSid, "uint", DesiredAccess, "int", AuditType, "uint", Flags, "ptr", ObjectTypeList, "uint", ObjectTypeListLength, "ptr", GenericMapping, "char", ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
     * @param {Pointer<UNICODE_STRING>} ObjectName 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {PSID} PrincipalSelfSid 
     * @param {Integer} DesiredAccess 
     * @param {Integer} AuditType 
     * @param {Integer} Flags 
     * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList 
     * @param {Integer} ObjectTypeListLength 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {BOOLEAN} ObjectCreation 
     * @param {Pointer<Integer>} GrantedAccess 
     * @param {Pointer<Integer>} AccessStatus 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static NtAccessCheckByTypeResultListAndAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
        GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
        AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\NtAccessCheckByTypeResultListAndAuditAlarm", "ptr", SubsystemName, HandleIdMarshal, HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "ptr", PrincipalSelfSid, "uint", DesiredAccess, "int", AuditType, "uint", Flags, "ptr", ObjectTypeList, "uint", ObjectTypeListLength, "ptr", GenericMapping, "char", ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {HANDLE} ClientToken 
     * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
     * @param {Pointer<UNICODE_STRING>} ObjectName 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {PSID} PrincipalSelfSid 
     * @param {Integer} DesiredAccess 
     * @param {Integer} AuditType 
     * @param {Integer} Flags 
     * @param {Pointer<OBJECT_TYPE_LIST>} ObjectTypeList 
     * @param {Integer} ObjectTypeListLength 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {BOOLEAN} ObjectCreation 
     * @param {Pointer<Integer>} GrantedAccess 
     * @param {Pointer<Integer>} AccessStatus 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static NtAccessCheckByTypeResultListAndAuditAlarmByHandle(SubsystemName, HandleId, ClientToken, ObjectTypeName, ObjectName, SecurityDescriptor, PrincipalSelfSid, DesiredAccess, AuditType, Flags, ObjectTypeList, ObjectTypeListLength, GenericMapping, ObjectCreation, GrantedAccess, AccessStatus, GenerateOnClose) {
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
        GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
        AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"
        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\NtAccessCheckByTypeResultListAndAuditAlarmByHandle", "ptr", SubsystemName, HandleIdMarshal, HandleId, "ptr", ClientToken, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "ptr", PrincipalSelfSid, "uint", DesiredAccess, "int", AuditType, "uint", Flags, "ptr", ObjectTypeList, "uint", ObjectTypeListLength, "ptr", GenericMapping, "char", ObjectCreation, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, GenerateOnCloseMarshal, GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
     * @param {Pointer<UNICODE_STRING>} ObjectName 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {HANDLE} ClientToken 
     * @param {Integer} DesiredAccess 
     * @param {Integer} GrantedAccess 
     * @param {Pointer<PRIVILEGE_SET>} Privileges 
     * @param {BOOLEAN} ObjectCreation 
     * @param {BOOLEAN} AccessGranted 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static NtOpenObjectAuditAlarm(SubsystemName, HandleId, ObjectTypeName, ObjectName, SecurityDescriptor, ClientToken, DesiredAccess, GrantedAccess, Privileges, ObjectCreation, AccessGranted, GenerateOnClose) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"
        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\NtOpenObjectAuditAlarm", "ptr", SubsystemName, HandleIdMarshal, HandleId, "ptr", ObjectTypeName, "ptr", ObjectName, "ptr", SecurityDescriptor, "ptr", ClientToken, "uint", DesiredAccess, "uint", GrantedAccess, "ptr", Privileges, "char", ObjectCreation, "char", AccessGranted, GenerateOnCloseMarshal, GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {HANDLE} ClientToken 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<PRIVILEGE_SET>} Privileges 
     * @param {BOOLEAN} AccessGranted 
     * @returns {NTSTATUS} 
     */
    static NtPrivilegeObjectAuditAlarm(SubsystemName, HandleId, ClientToken, DesiredAccess, Privileges, AccessGranted) {
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\NtPrivilegeObjectAuditAlarm", "ptr", SubsystemName, HandleIdMarshal, HandleId, "ptr", ClientToken, "uint", DesiredAccess, "ptr", Privileges, "char", AccessGranted, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {BOOLEAN} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static NtCloseObjectAuditAlarm(SubsystemName, HandleId, GenerateOnClose) {
        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\NtCloseObjectAuditAlarm", "ptr", SubsystemName, HandleIdMarshal, HandleId, "char", GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<Void>} HandleId 
     * @param {BOOLEAN} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static NtDeleteObjectAuditAlarm(SubsystemName, HandleId, GenerateOnClose) {
        HandleIdMarshal := HandleId is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\NtDeleteObjectAuditAlarm", "ptr", SubsystemName, HandleIdMarshal, HandleId, "char", GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SubsystemName 
     * @param {Pointer<UNICODE_STRING>} ServiceName 
     * @param {HANDLE} ClientToken 
     * @param {Pointer<PRIVILEGE_SET>} Privileges 
     * @param {BOOLEAN} AccessGranted 
     * @returns {NTSTATUS} 
     */
    static NtPrivilegedServiceAuditAlarm(SubsystemName, ServiceName, ClientToken, Privileges, AccessGranted) {
        ClientToken := ClientToken is Win32Handle ? NumGet(ClientToken, "ptr") : ClientToken

        result := DllCall("ntdll.dll\NtPrivilegedServiceAuditAlarm", "ptr", SubsystemName, "ptr", ServiceName, "ptr", ClientToken, "ptr", Privileges, "char", AccessGranted, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} HeapBase 
     * @param {Pointer} ReserveSize 
     * @param {Pointer} CommitSize 
     * @param {Pointer<Void>} Lock 
     * @param {Pointer<RTL_HEAP_PARAMETERS>} Parameters 
     * @returns {Pointer<Void>} 
     */
    static RtlCreateHeap(Flags, HeapBase, ReserveSize, CommitSize, Lock, Parameters) {
        HeapBaseMarshal := HeapBase is VarRef ? "ptr" : "ptr"
        LockMarshal := Lock is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlCreateHeap", "uint", Flags, HeapBaseMarshal, HeapBase, "ptr", ReserveSize, "ptr", CommitSize, LockMarshal, Lock, "ptr", Parameters, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} HeapHandle 
     * @returns {Pointer<Void>} 
     */
    static RtlDestroyHeap(HeapHandle) {
        HeapHandleMarshal := HeapHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlDestroyHeap", HeapHandleMarshal, HeapHandle, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} HeapHandle 
     * @param {Integer} Flags 
     * @param {Pointer} Size 
     * @returns {Pointer<Void>} 
     */
    static RtlAllocateHeap(HeapHandle, Flags, Size) {
        HeapHandleMarshal := HeapHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlAllocateHeap", HeapHandleMarshal, HeapHandle, "uint", Flags, "ptr", Size, "ptr")
        return result
    }

    /**
     * Frees a memory block that was allocated from a heap by RtlAllocateHeap.
     * @param {Pointer<Void>} HeapHandle A handle for the heap whose memory block is to be freed. This parameter is a handle returned by [**RtlCreateHeap**](/windows-hardware/drivers/ddi/ntifs/nf-ntifs-rtlcreateheap).
     * @param {Integer} Flags A set of flags that controls aspects of freeing a memory block. Specifying the following value overrides the corresponding value that was specified in the *Flags* parameter when the heap was created by [**RtlCreateHeap**](/windows-hardware/drivers/ddi/ntifs/nf-ntifs-rtlcreateheap).
     * 
     * 
     * 
     * | Flag                           | Meaning                                                                                   |
     * |--------------------------------|-------------------------------------------------------------------------------------------|
     * | HEAP\_NO\_SERIALIZE<br/> | Mutual exclusion will not be used when **RtlFreeHeap** is accessing the heap. <br/> |
     * @param {Pointer<Void>} BaseAddress 
     * @returns {Integer} Returns **TRUE** if the block was freed successfully; **FALSE** otherwise.
     * 
     * > [!Note]  
     * > Starting with Windows 8 the return value is typed as **LOGICAL**, which has a different size than **BOOLEAN**.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/rtlfreeheap
     */
    static RtlFreeHeap(HeapHandle, Flags, BaseAddress) {
        HeapHandleMarshal := HeapHandle is VarRef ? "ptr" : "ptr"
        BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlFreeHeap", HeapHandleMarshal, HeapHandle, "uint", Flags, BaseAddressMarshal, BaseAddress, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Seed 
     * @returns {Integer} 
     */
    static RtlRandom(Seed) {
        SeedMarshal := Seed is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlRandom", SeedMarshal, Seed, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Seed 
     * @returns {Integer} 
     */
    static RtlRandomEx(Seed) {
        SeedMarshal := Seed is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlRandomEx", SeedMarshal, Seed, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} DestinationString 
     * @param {PWSTR} SourceString 
     * @returns {NTSTATUS} 
     */
    static RtlInitUnicodeStringEx(DestinationString, SourceString) {
        SourceString := SourceString is String ? StrPtr(SourceString) : SourceString

        result := DllCall("ntdll.dll\RtlInitUnicodeStringEx", "ptr", DestinationString, "ptr", SourceString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} DestinationString 
     * @param {PWSTR} SourceString 
     * @returns {BOOLEAN} 
     */
    static RtlCreateUnicodeString(DestinationString, SourceString) {
        SourceString := SourceString is String ? StrPtr(SourceString) : SourceString

        result := DllCall("ntdll.dll\RtlCreateUnicodeString", "ptr", DestinationString, "ptr", SourceString, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} String1 
     * @param {Pointer<STRING>} String2 
     * @param {BOOLEAN} CaseInSensitive 
     * @returns {BOOLEAN} 
     */
    static RtlPrefixString(String1, String2, CaseInSensitive) {
        result := DllCall("ntdll.dll\RtlPrefixString", "ptr", String1, "ptr", String2, "char", CaseInSensitive, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} Destination 
     * @param {Pointer<STRING>} Source 
     * @returns {NTSTATUS} 
     */
    static RtlAppendStringToString(Destination, Source) {
        result := DllCall("ntdll.dll\RtlAppendStringToString", "ptr", Destination, "ptr", Source, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} DestinationString 
     * @param {Pointer<STRING>} SourceString 
     * @param {BOOLEAN} AllocateDestinationString 
     * @returns {NTSTATUS} 
     */
    static RtlOemStringToUnicodeString(DestinationString, SourceString, AllocateDestinationString) {
        result := DllCall("ntdll.dll\RtlOemStringToUnicodeString", "ptr", DestinationString, "ptr", SourceString, "char", AllocateDestinationString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} DestinationString 
     * @param {Pointer<UNICODE_STRING>} SourceString 
     * @param {BOOLEAN} AllocateDestinationString 
     * @returns {NTSTATUS} 
     */
    static RtlUpcaseUnicodeStringToOemString(DestinationString, SourceString, AllocateDestinationString) {
        result := DllCall("ntdll.dll\RtlUpcaseUnicodeStringToOemString", "ptr", DestinationString, "ptr", SourceString, "char", AllocateDestinationString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} DestinationString 
     * @param {Pointer<STRING>} SourceString 
     * @param {BOOLEAN} AllocateDestinationString 
     * @returns {NTSTATUS} 
     */
    static RtlOemStringToCountedUnicodeString(DestinationString, SourceString, AllocateDestinationString) {
        result := DllCall("ntoskrnl.exe\RtlOemStringToCountedUnicodeString", "ptr", DestinationString, "ptr", SourceString, "char", AllocateDestinationString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} DestinationString 
     * @param {Pointer<UNICODE_STRING>} SourceString 
     * @param {BOOLEAN} AllocateDestinationString 
     * @returns {NTSTATUS} 
     */
    static RtlUnicodeStringToCountedOemString(DestinationString, SourceString, AllocateDestinationString) {
        result := DllCall("ntdll.dll\RtlUnicodeStringToCountedOemString", "ptr", DestinationString, "ptr", SourceString, "char", AllocateDestinationString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} DestinationString 
     * @param {Pointer<UNICODE_STRING>} SourceString 
     * @param {BOOLEAN} AllocateDestinationString 
     * @returns {NTSTATUS} 
     */
    static RtlUpcaseUnicodeStringToCountedOemString(DestinationString, SourceString, AllocateDestinationString) {
        result := DllCall("ntdll.dll\RtlUpcaseUnicodeStringToCountedOemString", "ptr", DestinationString, "ptr", SourceString, "char", AllocateDestinationString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} String_R 
     * @returns {NTSTATUS} 
     */
    static RtlValidateUnicodeString(String_R) {
        static Flags := 0 ;Reserved parameters must always be NULL

        result := DllCall("ntdll.dll\RtlValidateUnicodeString", "uint", Flags, "ptr", String_R, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<UNICODE_STRING>} StringIn 
     * @param {Pointer<UNICODE_STRING>} StringOut 
     * @returns {NTSTATUS} 
     */
    static RtlDuplicateUnicodeString(Flags, StringIn, StringOut) {
        result := DllCall("ntdll.dll\RtlDuplicateUnicodeString", "uint", Flags, "ptr", StringIn, "ptr", StringOut, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} DestinationString 
     * @param {Pointer<UNICODE_STRING>} SourceString 
     * @param {BOOLEAN} AllocateDestinationString 
     * @returns {NTSTATUS} 
     */
    static RtlDowncaseUnicodeString(DestinationString, SourceString, AllocateDestinationString) {
        result := DllCall("ntdll.dll\RtlDowncaseUnicodeString", "ptr", DestinationString, "ptr", SourceString, "char", AllocateDestinationString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} UnicodeString 
     * @returns {Integer} 
     */
    static RtlxUnicodeStringToOemSize(UnicodeString) {
        result := DllCall("ntdll.dll\RtlxUnicodeStringToOemSize", "ptr", UnicodeString, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} OemString 
     * @returns {Integer} 
     */
    static RtlxOemStringToUnicodeSize(OemString) {
        result := DllCall("ntdll.dll\RtlxOemStringToUnicodeSize", "ptr", OemString, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} UnicodeString 
     * @param {Integer} MaxBytesInUnicodeString 
     * @param {Pointer<Integer>} BytesInUnicodeString 
     * @param {Pointer} MultiByteString 
     * @param {Integer} BytesInMultiByteString 
     * @returns {NTSTATUS} 
     */
    static RtlMultiByteToUnicodeN(UnicodeString, MaxBytesInUnicodeString, BytesInUnicodeString, MultiByteString, BytesInMultiByteString) {
        BytesInUnicodeStringMarshal := BytesInUnicodeString is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlMultiByteToUnicodeN", "ptr", UnicodeString, "uint", MaxBytesInUnicodeString, BytesInUnicodeStringMarshal, BytesInUnicodeString, "ptr", MultiByteString, "uint", BytesInMultiByteString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} BytesInUnicodeString 
     * @param {Pointer} MultiByteString 
     * @param {Integer} BytesInMultiByteString 
     * @returns {NTSTATUS} 
     */
    static RtlMultiByteToUnicodeSize(BytesInUnicodeString, MultiByteString, BytesInMultiByteString) {
        BytesInUnicodeStringMarshal := BytesInUnicodeString is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlMultiByteToUnicodeSize", BytesInUnicodeStringMarshal, BytesInUnicodeString, "ptr", MultiByteString, "uint", BytesInMultiByteString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} MultiByteString 
     * @param {Integer} MaxBytesInMultiByteString 
     * @param {Pointer<Integer>} BytesInMultiByteString 
     * @param {Pointer} UnicodeString 
     * @param {Integer} BytesInUnicodeString 
     * @returns {NTSTATUS} 
     */
    static RtlUnicodeToMultiByteN(MultiByteString, MaxBytesInMultiByteString, BytesInMultiByteString, UnicodeString, BytesInUnicodeString) {
        BytesInMultiByteStringMarshal := BytesInMultiByteString is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlUnicodeToMultiByteN", "ptr", MultiByteString, "uint", MaxBytesInMultiByteString, BytesInMultiByteStringMarshal, BytesInMultiByteString, "ptr", UnicodeString, "uint", BytesInUnicodeString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} MultiByteString 
     * @param {Integer} MaxBytesInMultiByteString 
     * @param {Pointer<Integer>} BytesInMultiByteString 
     * @param {Pointer} UnicodeString 
     * @param {Integer} BytesInUnicodeString 
     * @returns {NTSTATUS} 
     */
    static RtlUpcaseUnicodeToMultiByteN(MultiByteString, MaxBytesInMultiByteString, BytesInMultiByteString, UnicodeString, BytesInUnicodeString) {
        BytesInMultiByteStringMarshal := BytesInMultiByteString is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlUpcaseUnicodeToMultiByteN", "ptr", MultiByteString, "uint", MaxBytesInMultiByteString, BytesInMultiByteStringMarshal, BytesInMultiByteString, "ptr", UnicodeString, "uint", BytesInUnicodeString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} UnicodeString 
     * @param {Integer} MaxBytesInUnicodeString 
     * @param {Pointer<Integer>} BytesInUnicodeString 
     * @param {Pointer} OemString 
     * @param {Integer} BytesInOemString 
     * @returns {NTSTATUS} 
     */
    static RtlOemToUnicodeN(UnicodeString, MaxBytesInUnicodeString, BytesInUnicodeString, OemString, BytesInOemString) {
        BytesInUnicodeStringMarshal := BytesInUnicodeString is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlOemToUnicodeN", "ptr", UnicodeString, "uint", MaxBytesInUnicodeString, BytesInUnicodeStringMarshal, BytesInUnicodeString, "ptr", OemString, "uint", BytesInOemString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} OemString 
     * @param {Integer} MaxBytesInOemString 
     * @param {Pointer<Integer>} BytesInOemString 
     * @param {Pointer} UnicodeString 
     * @param {Integer} BytesInUnicodeString 
     * @returns {NTSTATUS} 
     */
    static RtlUnicodeToOemN(OemString, MaxBytesInOemString, BytesInOemString, UnicodeString, BytesInUnicodeString) {
        BytesInOemStringMarshal := BytesInOemString is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlUnicodeToOemN", "ptr", OemString, "uint", MaxBytesInOemString, BytesInOemStringMarshal, BytesInOemString, "ptr", UnicodeString, "uint", BytesInUnicodeString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} OemString 
     * @param {Integer} MaxBytesInOemString 
     * @param {Pointer<Integer>} BytesInOemString 
     * @param {Pointer} UnicodeString 
     * @param {Integer} BytesInUnicodeString 
     * @returns {NTSTATUS} 
     */
    static RtlUpcaseUnicodeToOemN(OemString, MaxBytesInOemString, BytesInOemString, UnicodeString, BytesInUnicodeString) {
        BytesInOemStringMarshal := BytesInOemString is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlUpcaseUnicodeToOemN", "ptr", OemString, "uint", MaxBytesInOemString, BytesInOemStringMarshal, BytesInOemString, "ptr", UnicodeString, "uint", BytesInUnicodeString, "int")
        return result
    }

    /**
     * 
     * @param {Integer} NormForm 
     * @param {PWSTR} SourceString 
     * @param {Integer} SourceStringLength 
     * @param {PWSTR} DestinationString 
     * @param {Pointer<Integer>} DestinationStringLength 
     * @returns {NTSTATUS} 
     */
    static RtlNormalizeString(NormForm, SourceString, SourceStringLength, DestinationString, DestinationStringLength) {
        SourceString := SourceString is String ? StrPtr(SourceString) : SourceString
        DestinationString := DestinationString is String ? StrPtr(DestinationString) : DestinationString

        DestinationStringLengthMarshal := DestinationStringLength is VarRef ? "int*" : "ptr"

        result := DllCall("ntdll.dll\RtlNormalizeString", "uint", NormForm, "ptr", SourceString, "int", SourceStringLength, "ptr", DestinationString, DestinationStringLengthMarshal, DestinationStringLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} NormForm 
     * @param {PWSTR} SourceString 
     * @param {Integer} SourceStringLength 
     * @param {Pointer<BOOLEAN>} Normalized 
     * @returns {NTSTATUS} 
     */
    static RtlIsNormalizedString(NormForm, SourceString, SourceStringLength, Normalized) {
        SourceString := SourceString is String ? StrPtr(SourceString) : SourceString

        NormalizedMarshal := Normalized is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\RtlIsNormalizedString", "uint", NormForm, "ptr", SourceString, "int", SourceStringLength, NormalizedMarshal, Normalized, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} SourceString 
     * @param {Integer} SourceStringLength 
     * @param {PWSTR} DestinationString 
     * @param {Pointer<Integer>} DestinationStringLength 
     * @returns {NTSTATUS} 
     */
    static RtlIdnToAscii(Flags, SourceString, SourceStringLength, DestinationString, DestinationStringLength) {
        SourceString := SourceString is String ? StrPtr(SourceString) : SourceString
        DestinationString := DestinationString is String ? StrPtr(DestinationString) : DestinationString

        DestinationStringLengthMarshal := DestinationStringLength is VarRef ? "int*" : "ptr"

        result := DllCall("ntdll.dll\RtlIdnToAscii", "uint", Flags, "ptr", SourceString, "int", SourceStringLength, "ptr", DestinationString, DestinationStringLengthMarshal, DestinationStringLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} SourceString 
     * @param {Integer} SourceStringLength 
     * @param {PWSTR} DestinationString 
     * @param {Pointer<Integer>} DestinationStringLength 
     * @returns {NTSTATUS} 
     */
    static RtlIdnToUnicode(Flags, SourceString, SourceStringLength, DestinationString, DestinationStringLength) {
        SourceString := SourceString is String ? StrPtr(SourceString) : SourceString
        DestinationString := DestinationString is String ? StrPtr(DestinationString) : DestinationString

        DestinationStringLengthMarshal := DestinationStringLength is VarRef ? "int*" : "ptr"

        result := DllCall("ntdll.dll\RtlIdnToUnicode", "uint", Flags, "ptr", SourceString, "int", SourceStringLength, "ptr", DestinationString, DestinationStringLengthMarshal, DestinationStringLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} SourceString 
     * @param {Integer} SourceStringLength 
     * @param {PWSTR} DestinationString 
     * @param {Pointer<Integer>} DestinationStringLength 
     * @returns {NTSTATUS} 
     */
    static RtlIdnToNameprepUnicode(Flags, SourceString, SourceStringLength, DestinationString, DestinationStringLength) {
        SourceString := SourceString is String ? StrPtr(SourceString) : SourceString
        DestinationString := DestinationString is String ? StrPtr(DestinationString) : DestinationString

        DestinationStringLengthMarshal := DestinationStringLength is VarRef ? "int*" : "ptr"

        result := DllCall("ntdll.dll\RtlIdnToNameprepUnicode", "uint", Flags, "ptr", SourceString, "int", SourceStringLength, "ptr", DestinationString, DestinationStringLengthMarshal, DestinationStringLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} Name 
     * @param {BOOLEAN} AllowExtendedCharacters 
     * @param {Pointer<GENERATE_NAME_CONTEXT>} Context 
     * @param {Pointer<UNICODE_STRING>} Name8dot3 
     * @returns {NTSTATUS} 
     */
    static RtlGenerate8dot3Name(Name, AllowExtendedCharacters, Context, Name8dot3) {
        result := DllCall("ntdll.dll\RtlGenerate8dot3Name", "ptr", Name, "char", AllowExtendedCharacters, "ptr", Context, "ptr", Name8dot3, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} Char 
     * @returns {BOOLEAN} 
     */
    static RtlIsValidOemCharacter(Char) {
        Char := Char is String ? StrPtr(Char) : Char

        result := DllCall("ntoskrnl.exe\RtlIsValidOemCharacter", "ptr", Char, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<PREFIX_TABLE>} PrefixTable 
     * @returns {String} Nothing - always returns an empty string
     */
    static PfxInitialize(PrefixTable) {
        DllCall("ntdll.dll\PfxInitialize", "ptr", PrefixTable)
    }

    /**
     * 
     * @param {Pointer<PREFIX_TABLE>} PrefixTable 
     * @param {Pointer<STRING>} Prefix 
     * @param {Pointer<PREFIX_TABLE_ENTRY>} PrefixTableEntry 
     * @returns {BOOLEAN} 
     */
    static PfxInsertPrefix(PrefixTable, Prefix, PrefixTableEntry) {
        result := DllCall("ntdll.dll\PfxInsertPrefix", "ptr", PrefixTable, "ptr", Prefix, "ptr", PrefixTableEntry, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<PREFIX_TABLE>} PrefixTable 
     * @param {Pointer<PREFIX_TABLE_ENTRY>} PrefixTableEntry 
     * @returns {String} Nothing - always returns an empty string
     */
    static PfxRemovePrefix(PrefixTable, PrefixTableEntry) {
        DllCall("ntdll.dll\PfxRemovePrefix", "ptr", PrefixTable, "ptr", PrefixTableEntry)
    }

    /**
     * 
     * @param {Pointer<PREFIX_TABLE>} PrefixTable 
     * @param {Pointer<STRING>} FullName 
     * @returns {Pointer<PREFIX_TABLE_ENTRY>} 
     */
    static PfxFindPrefix(PrefixTable, FullName) {
        result := DllCall("ntdll.dll\PfxFindPrefix", "ptr", PrefixTable, "ptr", FullName, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_PREFIX_TABLE>} PrefixTable 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlInitializeUnicodePrefix(PrefixTable) {
        DllCall("ntoskrnl.exe\RtlInitializeUnicodePrefix", "ptr", PrefixTable)
    }

    /**
     * 
     * @param {Pointer<UNICODE_PREFIX_TABLE>} PrefixTable 
     * @param {Pointer<UNICODE_STRING>} Prefix 
     * @param {Pointer<UNICODE_PREFIX_TABLE_ENTRY>} PrefixTableEntry 
     * @returns {BOOLEAN} 
     */
    static RtlInsertUnicodePrefix(PrefixTable, Prefix, PrefixTableEntry) {
        result := DllCall("ntoskrnl.exe\RtlInsertUnicodePrefix", "ptr", PrefixTable, "ptr", Prefix, "ptr", PrefixTableEntry, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_PREFIX_TABLE>} PrefixTable 
     * @param {Pointer<UNICODE_PREFIX_TABLE_ENTRY>} PrefixTableEntry 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlRemoveUnicodePrefix(PrefixTable, PrefixTableEntry) {
        DllCall("ntoskrnl.exe\RtlRemoveUnicodePrefix", "ptr", PrefixTable, "ptr", PrefixTableEntry)
    }

    /**
     * 
     * @param {Pointer<UNICODE_PREFIX_TABLE>} PrefixTable 
     * @param {Pointer<UNICODE_STRING>} FullName 
     * @param {Integer} CaseInsensitiveIndex 
     * @returns {Pointer<UNICODE_PREFIX_TABLE_ENTRY>} 
     */
    static RtlFindUnicodePrefix(PrefixTable, FullName, CaseInsensitiveIndex) {
        result := DllCall("ntoskrnl.exe\RtlFindUnicodePrefix", "ptr", PrefixTable, "ptr", FullName, "uint", CaseInsensitiveIndex, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_PREFIX_TABLE>} PrefixTable 
     * @param {BOOLEAN} Restart 
     * @returns {Pointer<UNICODE_PREFIX_TABLE_ENTRY>} 
     */
    static RtlNextUnicodePrefix(PrefixTable, Restart) {
        result := DllCall("ntoskrnl.exe\RtlNextUnicodePrefix", "ptr", PrefixTable, "char", Restart, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} CompressionFormatAndEngine 
     * @param {Pointer<Integer>} CompressBufferWorkSpaceSize 
     * @param {Pointer<Integer>} CompressFragmentWorkSpaceSize 
     * @returns {NTSTATUS} 
     */
    static RtlGetCompressionWorkSpaceSize(CompressionFormatAndEngine, CompressBufferWorkSpaceSize, CompressFragmentWorkSpaceSize) {
        CompressBufferWorkSpaceSizeMarshal := CompressBufferWorkSpaceSize is VarRef ? "uint*" : "ptr"
        CompressFragmentWorkSpaceSizeMarshal := CompressFragmentWorkSpaceSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlGetCompressionWorkSpaceSize", "ushort", CompressionFormatAndEngine, CompressBufferWorkSpaceSizeMarshal, CompressBufferWorkSpaceSize, CompressFragmentWorkSpaceSizeMarshal, CompressFragmentWorkSpaceSize, "int")
        return result
    }

    /**
     * 
     * @param {Integer} CompressionFormatAndEngine 
     * @param {Pointer} UncompressedBuffer 
     * @param {Integer} UncompressedBufferSize 
     * @param {Pointer} CompressedBuffer 
     * @param {Integer} CompressedBufferSize 
     * @param {Integer} UncompressedChunkSize 
     * @param {Pointer<Integer>} FinalCompressedSize 
     * @param {Pointer<Void>} WorkSpace 
     * @returns {NTSTATUS} 
     */
    static RtlCompressBuffer(CompressionFormatAndEngine, UncompressedBuffer, UncompressedBufferSize, CompressedBuffer, CompressedBufferSize, UncompressedChunkSize, FinalCompressedSize, WorkSpace) {
        FinalCompressedSizeMarshal := FinalCompressedSize is VarRef ? "uint*" : "ptr"
        WorkSpaceMarshal := WorkSpace is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlCompressBuffer", "ushort", CompressionFormatAndEngine, "ptr", UncompressedBuffer, "uint", UncompressedBufferSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, "uint", UncompressedChunkSize, FinalCompressedSizeMarshal, FinalCompressedSize, WorkSpaceMarshal, WorkSpace, "int")
        return result
    }

    /**
     * 
     * @param {Integer} CompressionFormat 
     * @param {Pointer} UncompressedBuffer 
     * @param {Integer} UncompressedBufferSize 
     * @param {Pointer} CompressedBuffer 
     * @param {Integer} CompressedBufferSize 
     * @param {Pointer<Integer>} FinalUncompressedSize 
     * @returns {NTSTATUS} 
     */
    static RtlDecompressBuffer(CompressionFormat, UncompressedBuffer, UncompressedBufferSize, CompressedBuffer, CompressedBufferSize, FinalUncompressedSize) {
        FinalUncompressedSizeMarshal := FinalUncompressedSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlDecompressBuffer", "ushort", CompressionFormat, "ptr", UncompressedBuffer, "uint", UncompressedBufferSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, FinalUncompressedSizeMarshal, FinalUncompressedSize, "int")
        return result
    }

    /**
     * 
     * @param {Integer} CompressionFormat 
     * @param {Pointer} UncompressedBuffer 
     * @param {Integer} UncompressedBufferSize 
     * @param {Pointer} CompressedBuffer 
     * @param {Integer} CompressedBufferSize 
     * @param {Pointer<Integer>} FinalUncompressedSize 
     * @param {Pointer<Void>} WorkSpace 
     * @returns {NTSTATUS} 
     */
    static RtlDecompressBufferEx(CompressionFormat, UncompressedBuffer, UncompressedBufferSize, CompressedBuffer, CompressedBufferSize, FinalUncompressedSize, WorkSpace) {
        FinalUncompressedSizeMarshal := FinalUncompressedSize is VarRef ? "uint*" : "ptr"
        WorkSpaceMarshal := WorkSpace is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlDecompressBufferEx", "ushort", CompressionFormat, "ptr", UncompressedBuffer, "uint", UncompressedBufferSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, FinalUncompressedSizeMarshal, FinalUncompressedSize, WorkSpaceMarshal, WorkSpace, "int")
        return result
    }

    /**
     * 
     * @param {Integer} CompressionFormat 
     * @param {Pointer} UncompressedBuffer 
     * @param {Integer} UncompressedBufferSize 
     * @param {Pointer} CompressedBuffer 
     * @param {Integer} CompressedBufferSize 
     * @param {Integer} UncompressedChunkSize 
     * @param {Pointer<Integer>} FinalUncompressedSize 
     * @param {Pointer<Void>} WorkSpace 
     * @returns {NTSTATUS} 
     */
    static RtlDecompressBufferEx2(CompressionFormat, UncompressedBuffer, UncompressedBufferSize, CompressedBuffer, CompressedBufferSize, UncompressedChunkSize, FinalUncompressedSize, WorkSpace) {
        FinalUncompressedSizeMarshal := FinalUncompressedSize is VarRef ? "uint*" : "ptr"
        WorkSpaceMarshal := WorkSpace is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\RtlDecompressBufferEx2", "ushort", CompressionFormat, "ptr", UncompressedBuffer, "uint", UncompressedBufferSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, "uint", UncompressedChunkSize, FinalUncompressedSizeMarshal, FinalUncompressedSize, WorkSpaceMarshal, WorkSpace, "int")
        return result
    }

    /**
     * 
     * @param {Integer} CompressionFormat 
     * @param {Pointer} UncompressedFragment 
     * @param {Integer} UncompressedFragmentSize 
     * @param {Pointer} CompressedBuffer 
     * @param {Integer} CompressedBufferSize 
     * @param {Integer} FragmentOffset 
     * @param {Pointer<Integer>} FinalUncompressedSize 
     * @param {Pointer<Void>} WorkSpace 
     * @returns {NTSTATUS} 
     */
    static RtlDecompressFragment(CompressionFormat, UncompressedFragment, UncompressedFragmentSize, CompressedBuffer, CompressedBufferSize, FragmentOffset, FinalUncompressedSize, WorkSpace) {
        FinalUncompressedSizeMarshal := FinalUncompressedSize is VarRef ? "uint*" : "ptr"
        WorkSpaceMarshal := WorkSpace is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlDecompressFragment", "ushort", CompressionFormat, "ptr", UncompressedFragment, "uint", UncompressedFragmentSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, "uint", FragmentOffset, FinalUncompressedSizeMarshal, FinalUncompressedSize, WorkSpaceMarshal, WorkSpace, "int")
        return result
    }

    /**
     * 
     * @param {Integer} CompressionFormat 
     * @param {Pointer} UncompressedFragment 
     * @param {Integer} UncompressedFragmentSize 
     * @param {Pointer} CompressedBuffer 
     * @param {Integer} CompressedBufferSize 
     * @param {Integer} FragmentOffset 
     * @param {Integer} UncompressedChunkSize 
     * @param {Pointer<Integer>} FinalUncompressedSize 
     * @param {Pointer<Void>} WorkSpace 
     * @returns {NTSTATUS} 
     */
    static RtlDecompressFragmentEx(CompressionFormat, UncompressedFragment, UncompressedFragmentSize, CompressedBuffer, CompressedBufferSize, FragmentOffset, UncompressedChunkSize, FinalUncompressedSize, WorkSpace) {
        FinalUncompressedSizeMarshal := FinalUncompressedSize is VarRef ? "uint*" : "ptr"
        WorkSpaceMarshal := WorkSpace is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\RtlDecompressFragmentEx", "ushort", CompressionFormat, "ptr", UncompressedFragment, "uint", UncompressedFragmentSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, "uint", FragmentOffset, "uint", UncompressedChunkSize, FinalUncompressedSizeMarshal, FinalUncompressedSize, WorkSpaceMarshal, WorkSpace, "int")
        return result
    }

    /**
     * 
     * @param {Integer} CompressionFormat 
     * @param {Pointer<Pointer<Integer>>} CompressedBuffer 
     * @param {Pointer<Integer>} EndOfCompressedBufferPlus1 
     * @param {Pointer<Pointer<Integer>>} ChunkBuffer 
     * @param {Pointer<Integer>} ChunkSize 
     * @returns {NTSTATUS} 
     */
    static RtlDescribeChunk(CompressionFormat, CompressedBuffer, EndOfCompressedBufferPlus1, ChunkBuffer, ChunkSize) {
        CompressedBufferMarshal := CompressedBuffer is VarRef ? "ptr*" : "ptr"
        EndOfCompressedBufferPlus1Marshal := EndOfCompressedBufferPlus1 is VarRef ? "char*" : "ptr"
        ChunkBufferMarshal := ChunkBuffer is VarRef ? "ptr*" : "ptr"
        ChunkSizeMarshal := ChunkSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\RtlDescribeChunk", "ushort", CompressionFormat, CompressedBufferMarshal, CompressedBuffer, EndOfCompressedBufferPlus1Marshal, EndOfCompressedBufferPlus1, ChunkBufferMarshal, ChunkBuffer, ChunkSizeMarshal, ChunkSize, "int")
        return result
    }

    /**
     * 
     * @param {Integer} CompressionFormat 
     * @param {Pointer<Pointer<Integer>>} CompressedBuffer 
     * @param {Pointer<Integer>} EndOfCompressedBufferPlus1 
     * @param {Pointer<Pointer<Integer>>} ChunkBuffer 
     * @param {Integer} ChunkSize 
     * @returns {NTSTATUS} 
     */
    static RtlReserveChunk(CompressionFormat, CompressedBuffer, EndOfCompressedBufferPlus1, ChunkBuffer, ChunkSize) {
        CompressedBufferMarshal := CompressedBuffer is VarRef ? "ptr*" : "ptr"
        EndOfCompressedBufferPlus1Marshal := EndOfCompressedBufferPlus1 is VarRef ? "char*" : "ptr"
        ChunkBufferMarshal := ChunkBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\RtlReserveChunk", "ushort", CompressionFormat, CompressedBufferMarshal, CompressedBuffer, EndOfCompressedBufferPlus1Marshal, EndOfCompressedBufferPlus1, ChunkBufferMarshal, ChunkBuffer, "uint", ChunkSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} UncompressedBuffer 
     * @param {Integer} UncompressedBufferSize 
     * @param {Pointer} CompressedBuffer 
     * @param {Integer} CompressedBufferSize 
     * @param {Pointer} CompressedTail 
     * @param {Integer} CompressedTailSize 
     * @param {Pointer<COMPRESSED_DATA_INFO>} CompressedDataInfo 
     * @returns {NTSTATUS} 
     */
    static RtlDecompressChunks(UncompressedBuffer, UncompressedBufferSize, CompressedBuffer, CompressedBufferSize, CompressedTail, CompressedTailSize, CompressedDataInfo) {
        result := DllCall("ntoskrnl.exe\RtlDecompressChunks", "ptr", UncompressedBuffer, "uint", UncompressedBufferSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, "ptr", CompressedTail, "uint", CompressedTailSize, "ptr", CompressedDataInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} UncompressedBuffer 
     * @param {Integer} UncompressedBufferSize 
     * @param {Pointer} CompressedBuffer 
     * @param {Integer} CompressedBufferSize 
     * @param {Pointer} CompressedDataInfo 
     * @param {Integer} CompressedDataInfoLength 
     * @param {Pointer<Void>} WorkSpace 
     * @returns {NTSTATUS} 
     */
    static RtlCompressChunks(UncompressedBuffer, UncompressedBufferSize, CompressedBuffer, CompressedBufferSize, CompressedDataInfo, CompressedDataInfoLength, WorkSpace) {
        WorkSpaceMarshal := WorkSpace is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\RtlCompressChunks", "ptr", UncompressedBuffer, "uint", UncompressedBufferSize, "ptr", CompressedBuffer, "uint", CompressedBufferSize, "ptr", CompressedDataInfo, "uint", CompressedDataInfoLength, WorkSpaceMarshal, WorkSpace, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Source 
     * @param {Pointer} Length 
     * @param {Integer} Pattern 
     * @returns {Pointer} 
     */
    static RtlCompareMemoryUlong(Source, Length, Pattern) {
        result := DllCall("ntdll.dll\RtlCompareMemoryUlong", "ptr", Source, "ptr", Length, "uint", Pattern, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Time 
     * @param {Pointer<Integer>} ElapsedSeconds 
     * @returns {BOOLEAN} 
     */
    static RtlTimeToSecondsSince1980(Time, ElapsedSeconds) {
        TimeMarshal := Time is VarRef ? "int64*" : "ptr"
        ElapsedSecondsMarshal := ElapsedSeconds is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlTimeToSecondsSince1980", TimeMarshal, Time, ElapsedSecondsMarshal, ElapsedSeconds, "char")
        return result
    }

    /**
     * 
     * @param {Integer} ElapsedSeconds 
     * @param {Pointer<Integer>} Time 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlSecondsSince1980ToTime(ElapsedSeconds, Time) {
        TimeMarshal := Time is VarRef ? "int64*" : "ptr"

        DllCall("ntdll.dll\RtlSecondsSince1980ToTime", "uint", ElapsedSeconds, TimeMarshal, Time)
    }

    /**
     * 
     * @param {Integer} ElapsedSeconds 
     * @param {Pointer<Integer>} Time 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlSecondsSince1970ToTime(ElapsedSeconds, Time) {
        TimeMarshal := Time is VarRef ? "int64*" : "ptr"

        DllCall("ntdll.dll\RtlSecondsSince1970ToTime", "uint", ElapsedSeconds, TimeMarshal, Time)
    }

    /**
     * 
     * @param {PSID} Sid 
     * @returns {BOOLEAN} 
     */
    static RtlValidSid(Sid) {
        result := DllCall("ntdll.dll\RtlValidSid", "ptr", Sid, "char")
        return result
    }

    /**
     * 
     * @param {PSID} Sid1 
     * @param {PSID} Sid2 
     * @returns {BOOLEAN} 
     */
    static RtlEqualSid(Sid1, Sid2) {
        result := DllCall("ntdll.dll\RtlEqualSid", "ptr", Sid1, "ptr", Sid2, "char")
        return result
    }

    /**
     * 
     * @param {PSID} Sid1 
     * @param {PSID} Sid2 
     * @returns {BOOLEAN} 
     */
    static RtlEqualPrefixSid(Sid1, Sid2) {
        result := DllCall("ntdll.dll\RtlEqualPrefixSid", "ptr", Sid1, "ptr", Sid2, "char")
        return result
    }

    /**
     * 
     * @param {Integer} SubAuthorityCount 
     * @returns {Integer} 
     */
    static RtlLengthRequiredSid(SubAuthorityCount) {
        result := DllCall("ntdll.dll\RtlLengthRequiredSid", "uint", SubAuthorityCount, "uint")
        return result
    }

    /**
     * 
     * @param {PSID} Sid 
     * @returns {Pointer<Void>} 
     */
    static RtlFreeSid(Sid) {
        result := DllCall("ntdll.dll\RtlFreeSid", "ptr", Sid, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<SID_IDENTIFIER_AUTHORITY>} IdentifierAuthority 
     * @param {Integer} SubAuthorityCount 
     * @param {Integer} SubAuthority0 
     * @param {Integer} SubAuthority1 
     * @param {Integer} SubAuthority2 
     * @param {Integer} SubAuthority3 
     * @param {Integer} SubAuthority4 
     * @param {Integer} SubAuthority5 
     * @param {Integer} SubAuthority6 
     * @param {Integer} SubAuthority7 
     * @param {Pointer<PSID>} Sid 
     * @returns {NTSTATUS} 
     */
    static RtlAllocateAndInitializeSid(IdentifierAuthority, SubAuthorityCount, SubAuthority0, SubAuthority1, SubAuthority2, SubAuthority3, SubAuthority4, SubAuthority5, SubAuthority6, SubAuthority7, Sid) {
        SidMarshal := Sid is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\RtlAllocateAndInitializeSid", "ptr", IdentifierAuthority, "char", SubAuthorityCount, "uint", SubAuthority0, "uint", SubAuthority1, "uint", SubAuthority2, "uint", SubAuthority3, "uint", SubAuthority4, "uint", SubAuthority5, "uint", SubAuthority6, "uint", SubAuthority7, SidMarshal, Sid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SID_IDENTIFIER_AUTHORITY>} IdentifierAuthority 
     * @param {Integer} SubAuthorityCount 
     * @param {Pointer<Integer>} SubAuthorities 
     * @param {Pointer<PSID>} Sid 
     * @returns {NTSTATUS} 
     */
    static RtlAllocateAndInitializeSidEx(IdentifierAuthority, SubAuthorityCount, SubAuthorities, Sid) {
        SubAuthoritiesMarshal := SubAuthorities is VarRef ? "uint*" : "ptr"
        SidMarshal := Sid is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\RtlAllocateAndInitializeSidEx", "ptr", IdentifierAuthority, "char", SubAuthorityCount, SubAuthoritiesMarshal, SubAuthorities, SidMarshal, Sid, "int")
        return result
    }

    /**
     * 
     * @param {PSID} Sid 
     * @param {Pointer<SID_IDENTIFIER_AUTHORITY>} IdentifierAuthority 
     * @param {Integer} SubAuthorityCount 
     * @returns {NTSTATUS} 
     */
    static RtlInitializeSid(Sid, IdentifierAuthority, SubAuthorityCount) {
        result := DllCall("ntdll.dll\RtlInitializeSid", "ptr", Sid, "ptr", IdentifierAuthority, "char", SubAuthorityCount, "int")
        return result
    }

    /**
     * 
     * @param {PSID} Sid 
     * @param {Pointer<SID_IDENTIFIER_AUTHORITY>} IdentifierAuthority 
     * @param {Integer} SubAuthorityCount 
     * @returns {NTSTATUS} 
     */
    static RtlInitializeSidEx(Sid, IdentifierAuthority, SubAuthorityCount) {
        result := DllCall("ntdll.dll\RtlInitializeSidEx", "ptr", Sid, "ptr", IdentifierAuthority, "char", SubAuthorityCount, "CDecl int")
        return result
    }

    /**
     * 
     * @param {PSID} Sid 
     * @returns {Pointer<SID_IDENTIFIER_AUTHORITY>} 
     */
    static RtlIdentifierAuthoritySid(Sid) {
        result := DllCall("ntdll.dll\RtlIdentifierAuthoritySid", "ptr", Sid, "ptr")
        return result
    }

    /**
     * 
     * @param {PSID} Sid 
     * @param {Integer} SubAuthority 
     * @returns {Pointer<Integer>} 
     */
    static RtlSubAuthoritySid(Sid, SubAuthority) {
        result := DllCall("ntdll.dll\RtlSubAuthoritySid", "ptr", Sid, "uint", SubAuthority, "ptr")
        return result
    }

    /**
     * 
     * @param {PSID} Sid 
     * @returns {Pointer<Integer>} 
     */
    static RtlSubAuthorityCountSid(Sid) {
        result := DllCall("ntdll.dll\RtlSubAuthorityCountSid", "ptr", Sid, "ptr")
        return result
    }

    /**
     * 
     * @param {PSID} Sid 
     * @returns {Integer} 
     */
    static RtlLengthSid(Sid) {
        result := DllCall("ntdll.dll\RtlLengthSid", "ptr", Sid, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} DestinationSidLength 
     * @param {Pointer} DestinationSid 
     * @param {PSID} SourceSid 
     * @returns {NTSTATUS} 
     */
    static RtlCopySid(DestinationSidLength, DestinationSid, SourceSid) {
        result := DllCall("ntdll.dll\RtlCopySid", "uint", DestinationSidLength, "ptr", DestinationSid, "ptr", SourceSid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} ServiceName 
     * @param {Pointer} ServiceSid 
     * @param {Pointer<Integer>} ServiceSidLength 
     * @returns {NTSTATUS} 
     */
    static RtlCreateServiceSid(ServiceName, ServiceSid, ServiceSidLength) {
        ServiceSidLengthMarshal := ServiceSidLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlCreateServiceSid", "ptr", ServiceName, "ptr", ServiceSid, ServiceSidLengthMarshal, ServiceSidLength, "int")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<BOOLEAN>} SaclPresent 
     * @param {Pointer<Pointer<ACL>>} Sacl 
     * @param {Pointer<BOOLEAN>} SaclDefaulted 
     * @returns {NTSTATUS} 
     */
    static RtlGetSaclSecurityDescriptor(SecurityDescriptor, SaclPresent, Sacl, SaclDefaulted) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        SaclPresentMarshal := SaclPresent is VarRef ? "char*" : "ptr"
        SaclMarshal := Sacl is VarRef ? "ptr*" : "ptr"
        SaclDefaultedMarshal := SaclDefaulted is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\RtlGetSaclSecurityDescriptor", "ptr", SecurityDescriptor, SaclPresentMarshal, SaclPresent, SaclMarshal, Sacl, SaclDefaultedMarshal, SaclDefaulted, "int")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {PSID} OldSid 
     * @param {PSID} NewSid 
     * @param {Pointer<Integer>} NumChanges 
     * @returns {NTSTATUS} 
     */
    static RtlReplaceSidInSd(SecurityDescriptor, OldSid, NewSid, NumChanges) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        NumChangesMarshal := NumChanges is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlReplaceSidInSd", "ptr", SecurityDescriptor, "ptr", OldSid, "ptr", NewSid, NumChangesMarshal, NumChanges, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} Name 
     * @param {Integer} BaseSubAuthority 
     * @param {Pointer} Sid 
     * @param {Pointer<Integer>} SidLength 
     * @returns {NTSTATUS} 
     */
    static RtlCreateVirtualAccountSid(Name, BaseSubAuthority, Sid, SidLength) {
        SidLengthMarshal := SidLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlCreateVirtualAccountSid", "ptr", Name, "uint", BaseSubAuthority, "ptr", Sid, SidLengthMarshal, SidLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<LUID>} DestinationLuid 
     * @param {Pointer<LUID>} SourceLuid 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlCopyLuid(DestinationLuid, SourceLuid) {
        DllCall("ntdll.dll\RtlCopyLuid", "ptr", DestinationLuid, "ptr", SourceLuid)
    }

    /**
     * 
     * @param {Pointer} Acl 
     * @param {Integer} AclLength 
     * @param {Integer} AclRevision 
     * @returns {NTSTATUS} 
     */
    static RtlCreateAcl(Acl, AclLength, AclRevision) {
        result := DllCall("ntdll.dll\RtlCreateAcl", "ptr", Acl, "uint", AclLength, "uint", AclRevision, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ACL>} Acl 
     * @param {Integer} AceRevision 
     * @param {Integer} StartingAceIndex 
     * @param {Pointer} AceList 
     * @param {Integer} AceListLength 
     * @returns {NTSTATUS} 
     */
    static RtlAddAce(Acl, AceRevision, StartingAceIndex, AceList, AceListLength) {
        result := DllCall("ntdll.dll\RtlAddAce", "ptr", Acl, "uint", AceRevision, "uint", StartingAceIndex, "ptr", AceList, "uint", AceListLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ACL>} Acl 
     * @param {Integer} AceIndex 
     * @returns {NTSTATUS} 
     */
    static RtlDeleteAce(Acl, AceIndex) {
        result := DllCall("ntdll.dll\RtlDeleteAce", "ptr", Acl, "uint", AceIndex, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ACL>} Acl 
     * @param {Integer} AceIndex 
     * @param {Pointer<Pointer<Void>>} Ace 
     * @returns {NTSTATUS} 
     */
    static RtlGetAce(Acl, AceIndex, Ace) {
        AceMarshal := Ace is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\RtlGetAce", "ptr", Acl, "uint", AceIndex, AceMarshal, Ace, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ACL>} Acl 
     * @param {Integer} AceRevision 
     * @param {Integer} AccessMask 
     * @param {PSID} Sid 
     * @returns {NTSTATUS} 
     */
    static RtlAddAccessAllowedAce(Acl, AceRevision, AccessMask, Sid) {
        result := DllCall("ntdll.dll\RtlAddAccessAllowedAce", "ptr", Acl, "uint", AceRevision, "uint", AccessMask, "ptr", Sid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ACL>} Acl 
     * @param {Integer} AceRevision 
     * @param {Integer} AceFlags 
     * @param {Integer} AccessMask 
     * @param {PSID} Sid 
     * @returns {NTSTATUS} 
     */
    static RtlAddAccessAllowedAceEx(Acl, AceRevision, AceFlags, AccessMask, Sid) {
        result := DllCall("ntdll.dll\RtlAddAccessAllowedAceEx", "ptr", Acl, "uint", AceRevision, "uint", AceFlags, "uint", AccessMask, "ptr", Sid, "int")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<BOOLEAN>} DaclPresent 
     * @param {Pointer<Pointer<ACL>>} Dacl 
     * @param {Pointer<BOOLEAN>} DaclDefaulted 
     * @returns {NTSTATUS} 
     */
    static RtlGetDaclSecurityDescriptor(SecurityDescriptor, DaclPresent, Dacl, DaclDefaulted) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        DaclPresentMarshal := DaclPresent is VarRef ? "char*" : "ptr"
        DaclMarshal := Dacl is VarRef ? "ptr*" : "ptr"
        DaclDefaultedMarshal := DaclDefaulted is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\RtlGetDaclSecurityDescriptor", "ptr", SecurityDescriptor, DaclPresentMarshal, DaclPresent, DaclMarshal, Dacl, DaclDefaultedMarshal, DaclDefaulted, "int")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {PSID} Owner 
     * @param {BOOLEAN} OwnerDefaulted 
     * @returns {NTSTATUS} 
     */
    static RtlSetOwnerSecurityDescriptor(SecurityDescriptor, Owner, OwnerDefaulted) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ntdll.dll\RtlSetOwnerSecurityDescriptor", "ptr", SecurityDescriptor, "ptr", Owner, "char", OwnerDefaulted, "int")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {PSID} Group 
     * @param {BOOLEAN} GroupDefaulted 
     * @returns {NTSTATUS} 
     */
    static RtlSetGroupSecurityDescriptor(SecurityDescriptor, Group, GroupDefaulted) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ntdll.dll\RtlSetGroupSecurityDescriptor", "ptr", SecurityDescriptor, "ptr", Group, "char", GroupDefaulted, "int")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<PSID>} Group 
     * @param {Pointer<BOOLEAN>} GroupDefaulted 
     * @returns {NTSTATUS} 
     */
    static RtlGetGroupSecurityDescriptor(SecurityDescriptor, Group, GroupDefaulted) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        GroupMarshal := Group is VarRef ? "ptr*" : "ptr"
        GroupDefaultedMarshal := GroupDefaulted is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\RtlGetGroupSecurityDescriptor", "ptr", SecurityDescriptor, GroupMarshal, Group, GroupDefaultedMarshal, GroupDefaulted, "int")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} AbsoluteSecurityDescriptor 
     * @param {Pointer} SelfRelativeSecurityDescriptor 
     * @param {Pointer<Integer>} BufferLength 
     * @returns {NTSTATUS} 
     */
    static RtlAbsoluteToSelfRelativeSD(AbsoluteSecurityDescriptor, SelfRelativeSecurityDescriptor, BufferLength) {
        AbsoluteSecurityDescriptor := AbsoluteSecurityDescriptor is Win32Handle ? NumGet(AbsoluteSecurityDescriptor, "ptr") : AbsoluteSecurityDescriptor

        BufferLengthMarshal := BufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlAbsoluteToSelfRelativeSD", "ptr", AbsoluteSecurityDescriptor, "ptr", SelfRelativeSecurityDescriptor, BufferLengthMarshal, BufferLength, "int")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SelfRelativeSecurityDescriptor 
     * @param {Pointer} AbsoluteSecurityDescriptor 
     * @param {Pointer<Integer>} AbsoluteSecurityDescriptorSize 
     * @param {Pointer} Dacl 
     * @param {Pointer<Integer>} DaclSize 
     * @param {Pointer} Sacl 
     * @param {Pointer<Integer>} SaclSize 
     * @param {Pointer} Owner 
     * @param {Pointer<Integer>} OwnerSize 
     * @param {Pointer} PrimaryGroup 
     * @param {Pointer<Integer>} PrimaryGroupSize 
     * @returns {NTSTATUS} 
     */
    static RtlSelfRelativeToAbsoluteSD(SelfRelativeSecurityDescriptor, AbsoluteSecurityDescriptor, AbsoluteSecurityDescriptorSize, Dacl, DaclSize, Sacl, SaclSize, Owner, OwnerSize, PrimaryGroup, PrimaryGroupSize) {
        SelfRelativeSecurityDescriptor := SelfRelativeSecurityDescriptor is Win32Handle ? NumGet(SelfRelativeSecurityDescriptor, "ptr") : SelfRelativeSecurityDescriptor

        AbsoluteSecurityDescriptorSizeMarshal := AbsoluteSecurityDescriptorSize is VarRef ? "uint*" : "ptr"
        DaclSizeMarshal := DaclSize is VarRef ? "uint*" : "ptr"
        SaclSizeMarshal := SaclSize is VarRef ? "uint*" : "ptr"
        OwnerSizeMarshal := OwnerSize is VarRef ? "uint*" : "ptr"
        PrimaryGroupSizeMarshal := PrimaryGroupSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlSelfRelativeToAbsoluteSD", "ptr", SelfRelativeSecurityDescriptor, "ptr", AbsoluteSecurityDescriptor, AbsoluteSecurityDescriptorSizeMarshal, AbsoluteSecurityDescriptorSize, "ptr", Dacl, DaclSizeMarshal, DaclSize, "ptr", Sacl, SaclSizeMarshal, SaclSize, "ptr", Owner, OwnerSizeMarshal, OwnerSize, "ptr", PrimaryGroup, PrimaryGroupSizeMarshal, PrimaryGroupSize, "int")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<PSID>} Owner 
     * @param {Pointer<BOOLEAN>} OwnerDefaulted 
     * @returns {NTSTATUS} 
     */
    static RtlGetOwnerSecurityDescriptor(SecurityDescriptor, Owner, OwnerDefaulted) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        OwnerMarshal := Owner is VarRef ? "ptr*" : "ptr"
        OwnerDefaultedMarshal := OwnerDefaulted is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\RtlGetOwnerSecurityDescriptor", "ptr", SecurityDescriptor, OwnerMarshal, Owner, OwnerDefaultedMarshal, OwnerDefaulted, "int")
        return result
    }

    /**
     * 
     * @param {NTSTATUS} Status 
     * @returns {Integer} 
     */
    static RtlNtStatusToDosErrorNoTeb(Status) {
        result := DllCall("ntdll.dll\RtlNtStatusToDosErrorNoTeb", "int", Status, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<CPTABLEINFO>} CustomCP 
     * @param {Pointer} UnicodeString 
     * @param {Integer} MaxBytesInUnicodeString 
     * @param {Pointer<Integer>} BytesInUnicodeString 
     * @param {Pointer} CustomCPString 
     * @param {Integer} BytesInCustomCPString 
     * @returns {NTSTATUS} 
     */
    static RtlCustomCPToUnicodeN(CustomCP, UnicodeString, MaxBytesInUnicodeString, BytesInUnicodeString, CustomCPString, BytesInCustomCPString) {
        BytesInUnicodeStringMarshal := BytesInUnicodeString is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlCustomCPToUnicodeN", "ptr", CustomCP, "ptr", UnicodeString, "uint", MaxBytesInUnicodeString, BytesInUnicodeStringMarshal, BytesInUnicodeString, "ptr", CustomCPString, "uint", BytesInCustomCPString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CPTABLEINFO>} CustomCP 
     * @param {Pointer} CustomCPString 
     * @param {Integer} MaxBytesInCustomCPString 
     * @param {Pointer<Integer>} BytesInCustomCPString 
     * @param {Pointer} UnicodeString 
     * @param {Integer} BytesInUnicodeString 
     * @returns {NTSTATUS} 
     */
    static RtlUnicodeToCustomCPN(CustomCP, CustomCPString, MaxBytesInCustomCPString, BytesInCustomCPString, UnicodeString, BytesInUnicodeString) {
        BytesInCustomCPStringMarshal := BytesInCustomCPString is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlUnicodeToCustomCPN", "ptr", CustomCP, "ptr", CustomCPString, "uint", MaxBytesInCustomCPString, BytesInCustomCPStringMarshal, BytesInCustomCPString, "ptr", UnicodeString, "uint", BytesInUnicodeString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CPTABLEINFO>} CustomCP 
     * @param {Pointer} CustomCPString 
     * @param {Integer} MaxBytesInCustomCPString 
     * @param {Pointer<Integer>} BytesInCustomCPString 
     * @param {Pointer} UnicodeString 
     * @param {Integer} BytesInUnicodeString 
     * @returns {NTSTATUS} 
     */
    static RtlUpcaseUnicodeToCustomCPN(CustomCP, CustomCPString, MaxBytesInCustomCPString, BytesInCustomCPString, UnicodeString, BytesInUnicodeString) {
        BytesInCustomCPStringMarshal := BytesInCustomCPString is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlUpcaseUnicodeToCustomCPN", "ptr", CustomCP, "ptr", CustomCPString, "uint", MaxBytesInCustomCPString, BytesInCustomCPStringMarshal, BytesInCustomCPString, "ptr", UnicodeString, "uint", BytesInUnicodeString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} TableBase 
     * @param {Pointer<CPTABLEINFO>} CodePageTable 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlInitCodePageTable(TableBase, CodePageTable) {
        TableBaseMarshal := TableBase is VarRef ? "ushort*" : "ptr"

        DllCall("ntdll.dll\RtlInitCodePageTable", TableBaseMarshal, TableBase, "ptr", CodePageTable)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} VolumeRootPath 
     * @returns {NTSTATUS} 
     */
    static RtlCreateSystemVolumeInformationFolder(VolumeRootPath) {
        result := DllCall("ntdll.dll\RtlCreateSystemVolumeInformationFolder", "ptr", VolumeRootPath, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} Altitude1 
     * @param {Pointer<UNICODE_STRING>} Altitude2 
     * @returns {Integer} 
     */
    static RtlCompareAltitudes(Altitude1, Altitude2) {
        result := DllCall("ntdll.dll\RtlCompareAltitudes", "ptr", Altitude1, "ptr", Altitude2, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} TokenObject 
     * @param {Pointer} PackageFullName 
     * @param {Pointer<Pointer>} PackageSize 
     * @param {Pointer} AppId 
     * @param {Pointer<Pointer>} AppIdSize 
     * @param {Pointer<BOOLEAN>} Packaged 
     * @returns {NTSTATUS} 
     */
    static RtlQueryPackageIdentity(TokenObject, PackageFullName, PackageSize, AppId, AppIdSize, Packaged) {
        TokenObjectMarshal := TokenObject is VarRef ? "ptr" : "ptr"
        PackageSizeMarshal := PackageSize is VarRef ? "ptr*" : "ptr"
        AppIdSizeMarshal := AppIdSize is VarRef ? "ptr*" : "ptr"
        PackagedMarshal := Packaged is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\RtlQueryPackageIdentity", TokenObjectMarshal, TokenObject, "ptr", PackageFullName, PackageSizeMarshal, PackageSize, "ptr", AppId, AppIdSizeMarshal, AppIdSize, PackagedMarshal, Packaged, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} TokenObject 
     * @param {Pointer} PackageFullName 
     * @param {Pointer<Pointer>} PackageSize 
     * @param {Pointer} AppId 
     * @param {Pointer<Pointer>} AppIdSize 
     * @param {Pointer<Guid>} DynamicId 
     * @param {Pointer<Integer>} Flags 
     * @returns {NTSTATUS} 
     */
    static RtlQueryPackageIdentityEx(TokenObject, PackageFullName, PackageSize, AppId, AppIdSize, DynamicId, Flags) {
        TokenObjectMarshal := TokenObject is VarRef ? "ptr" : "ptr"
        PackageSizeMarshal := PackageSize is VarRef ? "ptr*" : "ptr"
        AppIdSizeMarshal := AppIdSize is VarRef ? "ptr*" : "ptr"
        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlQueryPackageIdentityEx", TokenObjectMarshal, TokenObject, "ptr", PackageFullName, PackageSizeMarshal, PackageSize, "ptr", AppId, AppIdSizeMarshal, AppIdSize, "ptr", DynamicId, FlagsMarshal, Flags, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReparseTag 
     * @returns {BOOLEAN} 
     */
    static RtlIsNonEmptyDirectoryReparsePointAllowed(ReparseTag) {
        result := DllCall("ntdll.dll\RtlIsNonEmptyDirectoryReparsePointAllowed", "uint", ReparseTag, "char")
        return result
    }

    /**
     * 
     * @param {Integer} FileAttributes 
     * @param {Integer} ReparseTag 
     * @returns {BOOLEAN} 
     */
    static RtlIsCloudFilesPlaceholder(FileAttributes, ReparseTag) {
        result := DllCall("ntdll.dll\RtlIsCloudFilesPlaceholder", "uint", FileAttributes, "uint", ReparseTag, "char")
        return result
    }

    /**
     * 
     * @param {Integer} FileAttributes 
     * @param {Integer} ReparseTag 
     * @returns {BOOLEAN} 
     */
    static RtlIsPartialPlaceholder(FileAttributes, ReparseTag) {
        result := DllCall("ntdll.dll\RtlIsPartialPlaceholder", "uint", FileAttributes, "uint", ReparseTag, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<BOOLEAN>} IsPartialPlaceholder 
     * @returns {NTSTATUS} 
     */
    static RtlIsPartialPlaceholderFileHandle(FileHandle, IsPartialPlaceholder) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        IsPartialPlaceholderMarshal := IsPartialPlaceholder is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\RtlIsPartialPlaceholderFileHandle", "ptr", FileHandle, IsPartialPlaceholderMarshal, IsPartialPlaceholder, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} InfoBuffer 
     * @param {Integer} InfoClass 
     * @param {Pointer<BOOLEAN>} IsPartialPlaceholder 
     * @returns {NTSTATUS} 
     */
    static RtlIsPartialPlaceholderFileInfo(InfoBuffer, InfoClass, IsPartialPlaceholder) {
        InfoBufferMarshal := InfoBuffer is VarRef ? "ptr" : "ptr"
        IsPartialPlaceholderMarshal := IsPartialPlaceholder is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\RtlIsPartialPlaceholderFileInfo", InfoBufferMarshal, InfoBuffer, "int", InfoClass, IsPartialPlaceholderMarshal, IsPartialPlaceholder, "int")
        return result
    }

    /**
     * 
     * @returns {CHAR} 
     */
    static RtlQueryThreadPlaceholderCompatibilityMode() {
        result := DllCall("ntdll.dll\RtlQueryThreadPlaceholderCompatibilityMode", "char")
        return result
    }

    /**
     * 
     * @param {CHAR} Mode 
     * @returns {CHAR} 
     */
    static RtlSetThreadPlaceholderCompatibilityMode(Mode) {
        result := DllCall("ntdll.dll\RtlSetThreadPlaceholderCompatibilityMode", "char", Mode, "char")
        return result
    }

    /**
     * 
     * @returns {CHAR} 
     */
    static RtlQueryProcessPlaceholderCompatibilityMode() {
        result := DllCall("ntdll.dll\RtlQueryProcessPlaceholderCompatibilityMode", "char")
        return result
    }

    /**
     * 
     * @param {CHAR} Mode 
     * @returns {CHAR} 
     */
    static RtlSetProcessPlaceholderCompatibilityMode(Mode) {
        result := DllCall("ntdll.dll\RtlSetProcessPlaceholderCompatibilityMode", "char", Mode, "char")
        return result
    }

    /**
     * Creates a new file or directory, or opens an existing file, device, directory, or volume.
     * @remarks
     * The handle, given by <b>NtCreateFile</b>, can be used by 
     *     subsequent calls to manipulate data within the file or the file object's state or attributes.
     * 
     * There are two alternate ways to specify the name of the file to be created or opened with 
     *      <b>NtCreateFile</b>:
     * 
     * <ul>
     * <li>As a fully qualified pathname, supplied in the <b>ObjectName</b> member of the input 
     *       <i>ObjectAttributes</i></li>
     * <li>As a pathname relative to the directory file represented by the handle in the 
     *       <b>RootDirectory</b> member of the input <i>ObjectAttributes</i></li>
     * </ul>
     * Certain <i>DesiredAccess</i> flags and combinations of flags have the following effects:
     * 
     * <ul>
     * <li>For a caller to synchronize an I/O completion by waiting on the returned 
     *       <i>FileHandle</i>, the <b>SYNCHRONIZE</b> flag must be set.</li>
     * <li>Passing a zero to <i>DesiredFlags</i> is not valid.</li>
     * <li>If only the <b>FILE_APPEND_DATA</b> and <b>SYNCHRONIZE</b> flags are 
     *       set, the caller can write only to the end of the file, and any offset information on writes to the file is 
     *       ignored. However, the file is automatically  extended as necessary for this type of write operation.</li>
     * <li>Setting the <b>FILE_WRITE_DATA</b> flag for a file also allows writes beyond the end of 
     *       the file to occur. The file is automatically extended for this type of write, as well.</li>
     * <li>If only the <b>FILE_EXECUTE</b> and <b>SYNCHRONIZE</b> flags are set, 
     *       the caller cannot directly read or write any data in the file using the returned 
     *       <i>FileHandle</i>, that is, all operations on the file occur through the system pager in 
     *       response to instruction and data accesses. </li>
     * </ul>
     * The <i>ShareAccess</i> parameter determines whether separate threads can access the same file, 
     *     possibly simultaneously. Provided that both file openers have the privilege to access a file in the specified 
     *     manner, the file can be successfully opened and shared. If the original caller of 
     *     <b>NtCreateFile</b> does not specify 
     *     <b>FILE_SHARE_READ</b>, <b>FILE_SHARE_WRITE</b>, or 
     *     <b>FILE_SHARE_DELETE</b>, no other open operations can be performed on the file; that is, the 
     *     original caller is given exclusive access to the file.
     * 
     * For a shared file to be successfully opened, the requested <i>DesiredAccess</i> parameter to 
     *      the file must be compatible with both the <i>DesiredAccess</i> and 
     *      <i>ShareAccess</i> specifications of all preceding opens that have not yet been released with 
     *      <b>NtClose</b>. That is, the <i>DesiredAccess</i> parameter 
     *      specified to <b>NtCreateFile</b> for a given file must not 
     *      conflict with the accesses that other openers of the file have disallowed.
     * 
     * The <i>CreateDisposition</i> value <b>FILE_SUPERSEDE</b> requires that 
     *      the caller have <b>DELETE</b> access to an existing file object. If so, a successful call to 
     *      <b>NtCreateFile</b> with 
     *      <b>FILE_SUPERSEDE</b> on an existing file effectively deletes that file, and then re-creates 
     *      it. This implies that, if the file has already been opened by another thread, it opened the file by specifying a 
     *      <i>ShareAccess</i> parameter with the <b>FILE_SHARE_DELETE</b> flag set. 
     *      Note that this type of disposition is consistent with the POSIX style of overwriting files. The 
     *      <i>CreateDisposition</i> values <b>FILE_OVERWRITE_IF</b> and 
     *      <b>FILE_SUPERSEDE</b> are similar. If <b>ZwCreateFile</b> is called 
     *      with an existing file and either of these <i>CreateDisposition</i> values, the file is 
     *      replaced.
     * 
     * Overwriting a file is semantically equivalent to a supersede operation, except for the following:
     * 
     * <ul>
     * <li>The caller must have write access to the file, rather than delete access. This implies that, if the file 
     *       has already been opened by another thread, it opened the file with the 
     *       <b>FILE_SHARE_WRITE</b> flag set in the input <i>ShareAccess</i> 
     *       parameter.</li>
     * <li>The specified file attributes are logically ORed with those already on the file. This implies that, if the 
     *       file has already been opened by another thread, a subsequent caller of 
     *       <b>NtCreateFile</b> cannot disable existing 
     *       <i>FileAttributes</i> flags but can enable additional flags for the same file. Note that this 
     *       style of overwriting files is consistent with MS-DOS, Windows 3.1, and  OS/2 operating systems.</li>
     * </ul>
     * The <i>CreateOptions</i> <b>FILE_DIRECTORY_FILE</b> value specifies that the file to be created or opened is a 
     *      directory file. When a directory file is created, the file system creates an appropriate structure on the disk to 
     *      represent an empty directory for that particular file system's on-disk structure. If this option was specified 
     *      and the given file to be opened is not a directory file, or if the caller specified an inconsistent 
     *      <i>CreateOptions</i> or <i>CreateDisposition</i> value, the call to 
     *      <b>NtCreateFile</b> fails.
     * 
     * The <i>CreateOptions</i> <b>FILE_NO_INTERMEDIATE_BUFFERING</b> flag prevents the file system from performing any 
     *      intermediate buffering on behalf of the caller. Specifying this value places certain restrictions on the caller's 
     *      parameters to other <b>Nt<i>XXX</i>File</b> routines, including the 
     *      following:
     * 
     * <ul>
     * <li>Any optional <i>ByteOffset</i> passed to  the 
     *       <b>NtReadFile</b> or <b>NtWriteFile</b> function must be an 
     *       integral of the sector size.</li>
     * <li>The <i>Length</i> passed to <b>NtReadFile</b> or 
     *       <b>NtWriteFile</b>, must be an integral of the sector size. Note that specifying a 
     *       read operation to a buffer whose length is exactly the sector size might result in a lesser number of 
     *       significant bytes being transferred to that buffer if the end of the file was reached during the transfer.</li>
     * <li>Buffers must be adjusted in accordance with the alignment requirement of the underlying device. This 
     *       information can be obtained by calling <b>NtCreateFile</b> 
     *       to get a handle for the file object that represents the physical device, and then calling 
     *       <b>NtQueryInformationFile</b> with that handle. For a list of the system 
     *        <b>FILE_</b><i>XXX</i><b>_ALIGNMENT</b> values, see 
     *        the Windows SDK documentation.</li>
     * <li>Calls to <b>NtSetInformationFile</b> with the 
     *       <i>FileInformationClass</i> parameter set to 
     *       <b>FilePositionInformation</b> must specify an offset that is an integral of the 
     *       sector size.</li>
     * </ul>
     * The <i>CreateOptions</i> <b>FILE_SYNCHRONOUS_IO_ALERT</b> and <b>FILE_SYNCHRONOUS_IO_NONALERT</b> flags, 
     *      which are mutually exclusive as their names suggest, specify that all I/O operations on the file are to be 
     *      synchronous as long as they occur through the file object referred to by the returned 
     *      <i>FileHandle</i>. All I/O on such a file is serialized across all threads using the returned 
     *      handle. With either of these <i>CreateOptions</i>, the <i>DesiredAccess</i> <b>SYNCHRONIZE</b> flag must be set so that the I/O Manager  uses the 
     *      file object as a synchronization object. With either of these <i>CreateOptions</i> set, the 
     *      I/O Manager maintains the "file position context" for the file object, an internal, current file position offset. 
     *      This offset can be used in calls to <b>NtReadFile</b> and 
     *      <b>NtWriteFile</b>. Its position also can be queried or set with 
     *      <b>NtQueryInformationFile</b> and 
     *      <b>NtSetInformationFile</b>.
     * 
     * If the <i>CreateOptions</i> parameter specifies the <b>FILE_OPEN_REPARSE_POINT</b> flag and <b>NtCreateFile</b> opens a file with a reparse point, normal reparse processing does not occur and <b>NtCreateFile</b> attempts to directly open the reparse point file. If the <b>FILE_OPEN_REPARSE_POINT</b> flag is not specified, normal reparse point processing occurs for the file. In either case, if the open operation was successful, <b>NtCreateFile</b> returns <b>STATUS_SUCCESS</b>; otherwise, an error code. The <b>NtCreateFile</b> function never returns <b>STATUS_REPARSE</b>.
     * 
     * The <i>CreateOptions</i> parameter's <b>FILE_OPEN_REQUIRING_OPLOCK</b> flag eliminates the time between when you open the file and request an oplock that could potentially allow a third party to open the file, which would cause a sharing violation. An application can use the <b>FILE_OPEN_REQUIRING_OPLOCK</b> flag with <b>NtCreateFile</b> and then request any oplock. This ensures that an oplock owner will be notified of any subsequent open request that causes a sharing violation. 
     * 
     * In Windows 7, if other handles exist on the file when an application uses this flag, the create operation will fail with <b>STATUS_OPLOCK_NOT_GRANTED</b>. This restriction no longer exists starting with Windows 8.
     * 
     * If this create operation would break an oplock that already exists on the file, then setting the <b>FILE_OPEN_REQUIRING_OPLOCK</b> flag will cause the create operation to fail with <b>STATUS_CANNOT_BREAK_OPLOCK</b>. The existing oplock will not be broken by this create operation.
     * 
     * An application that uses this flag must request an oplock after this call succeeds, or all subsequent attempts to open the file will be blocked without the benefit of normal oplock processing. Similarly, if this call succeeds but the subsequent oplock request fails, an application that uses this flag must close its handle after it detects that the oplock request has failed.
     * 
     * <div class="alert"><b>Note</b>  The <b>FILE_OPEN_REQUIRING_OPLOCK</b> flag is available in Windows 7, Windows Server 2008 R2 and later operating systems for the following file systems: NTFS, FAT, and exFAT.
     * </div>
     * <div> </div>
     * 
     * 
     * 
     * The <i>CreateOptions</i> parameter's <b>FILE_RESERVE_OPFILTER</b> flag allows an application to request a Level 1, Batch, or Filter oplock to prevent other applications from getting share violations. However, in practical terms, the <b>FILE_RESERVE_OPFILTER</b> is useful only for filter oplocks. To use it, you must complete the following steps:
     * 
     * 
     * 
     * <ol>
     * <li>Issue a create request with <i>CreateOptions</i> of <b>FILE_RESERVE_OPFILTER</b>, <i>DesiredAccess</i> of exactly <b>FILE_READ_ATTRIBUTES</b>, and <i>ShareAccess</i> of exactly <c>(FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE)</c>. Possible failures are as follows:<ul>
     * <li>If there are already open handles, the create request fails with <b>STATUS_OPLOCK_NOT_GRANTED</b>, and the next requested oplock also fails. </li>
     * <li>If you open with more access than <b>FILE_READ_ATTRIBUTES</b>  or less sharing than <c>(FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE)</c>, the request  fails with <b>STATUS_OPLOCK_NOT_GRANTED</b>.</li>
     * </ul>
     * </li>
     * <li>If the create request succeeds, request an oplock.</li>
     * <li>Open another handle to the file to do I/O.</li>
     * </ol>Step three makes this practical only for filter oplocks. The handle opened in step three can have a <i>DesiredAccess</i> that contains a maximum of <c>(FILE_READ_ATTRIBUTES | FILE_WRITE_ATTRIBUTES | FILE_READ_DATA | FILE_READ_EA | FILE_EXECUTE | SYNCHRONIZE | READ_CONTROL)</code> and still not break a filter oplock. However, any <i>DesiredAccess</i> greater than <code>(FILE_READ_ATTRIBUTES | FILE_WRITE_ATTRIBUTES | SYNCHRONIZE)</c> will break a Level 1 or Batch oplock and make the <b>FILE_RESERVE_OPFILTER</b> flag useless for those oplock types.
     * 
     * 
     * 
     * NTFS is the only Microsoft file system that implements <b>FILE_RESERVE_OPFILTER</b>.
     * 
     * For more information on oplocks, see <a href="https://msdn.microsoft.com/library/dd445267.aspx">Oplock Semantics</a>.
     * 
     * Note that the WDK header file NtDef.h is necessary for many constant definitions 
     *     as well as the <b>InitializeObjectAttributes</b> macro. The associated import library, 
     *     NtDll.lib is available in the WDK. To obtain the WDK, see <a href="https://docs.microsoft.com/windows-hardware/drivers/download-the-wdk">Download kits for Windows hardware development</a>. You can also use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to dynamically link to 
     *     NtDll.dll.
     * @param {Pointer<HANDLE>} FileHandle A pointer to a variable that receives the file handle if the call is successful.
     * @param {Integer} DesiredAccess The <b>ACCESS_MASK</b> value that expresses the type of access that the caller 
     *       requires to the file or directory. The set of system-defined <i>DesiredAccess</i> flags 
     *       determines the following specific access rights for file objects.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DELETE"></a><a id="delete"></a><dl>
     * <dt><b>DELETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file can be deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_READ_DATA"></a><a id="file_read_data"></a><dl>
     * <dt><b>FILE_READ_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data can be read from the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_READ_ATTRIBUTES"></a><a id="file_read_attributes"></a><dl>
     * <dt><b>FILE_READ_ATTRIBUTES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>FileAttributes</i> flags, described later, can be read.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_READ_EA"></a><a id="file_read_ea"></a><dl>
     * <dt><b>FILE_READ_EA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Extended attributes associated with the file can be read. This flag is irrelevant to device and 
     *         intermediate drivers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="READ_CONTROL"></a><a id="read_control"></a><dl>
     * <dt><b>READ_CONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The access control list (ACL) and ownership information associated with the file can be read.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_WRITE_DATA"></a><a id="file_write_data"></a><dl>
     * <dt><b>FILE_WRITE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data can be written to the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_WRITE_ATTRIBUTES"></a><a id="file_write_attributes"></a><dl>
     * <dt><b>FILE_WRITE_ATTRIBUTES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>FileAttributes</i> flags can be written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_WRITE_EA"></a><a id="file_write_ea"></a><dl>
     * <dt><b>FILE_WRITE_EA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Extended attributes (EAs) associated with the file can be written. This flag is irrelevant to device and 
     *         intermediate drivers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_APPEND_DATA"></a><a id="file_append_data"></a><dl>
     * <dt><b>FILE_APPEND_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data can be appended to the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WRITE_DAC"></a><a id="write_dac"></a><dl>
     * <dt><b>WRITE_DAC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The discretionary access control list (DACL) associated with the file can be written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WRITE_OWNER"></a><a id="write_owner"></a><dl>
     * <dt><b>WRITE_OWNER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ownership information associated with the file can be written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYNCHRONIZE"></a><a id="synchronize"></a><dl>
     * <dt><b>SYNCHRONIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The returned <i>FileHandle</i> can be waited on to synchronize with the completion of 
     *         an I/O operation. If <i>FileHandle</i> was not opened for synchronous I/O, this value is ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_EXECUTE"></a><a id="file_execute"></a><dl>
     * <dt><b>FILE_EXECUTE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data can be read into memory from the file using system paging I/O. This flag is irrelevant for device and 
     *         intermediate drivers.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Do not specify <b>FILE_READ_DATA</b>, <b>FILE_WRITE_DATA</b>, <b>FILE_APPEND_DATA</b>, or <b>FILE_EXECUTE</b> when you create or open a directory.
     * 
     * Callers of <b>NtCreateFile</b> can specify one or a combination of the following, 
     *       possibly using a bitwise-OR with additional compatible flags from the preceding <i>DesiredAccess</i> flags 
     *       list, for any file object that does not represent a directory file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_GENERIC_READ"></a><a id="file_generic_read"></a><dl>
     * <dt><b>FILE_GENERIC_READ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <code>STANDARD_RIGHTS_READ | FILE_READ_DATA | 
     *         FILE_READ_ATTRIBUTES | FILE_READ_EA | SYNCHRONIZE</code>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_GENERIC_WRITE"></a><a id="file_generic_write"></a><dl>
     * <dt><b>FILE_GENERIC_WRITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <code>STANDARD_RIGHTS_WRITE | FILE_WRITE_DATA | 
     *         FILE_WRITE_ATTRIBUTES | FILE_WRITE_EA |
     *         FILE_APPEND_DATA | SYNCHRONIZE</code>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_GENERIC_EXECUTE"></a><a id="file_generic_execute"></a><dl>
     * <dt><b>FILE_GENERIC_EXECUTE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <c>STANDARD_RIGHTS_EXECUTE | FILE_READ_ATTRIBUTES | FILE_EXECUTE | SYNCHRONIZE</c>
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The <b>FILE_GENERIC_EXECUTE</b>  value is irrelevant for device and intermediate drivers.
     * 
     * The <b>STANDARD_RIGHTS_</b><i>XXX</i> are predefined system values 
     *       used to enforce security on system objects.
     *       
     * 
     * To open or create a directory file, as also indicated with the <i>CreateOptions</i> 
     *        parameter, callers of <b>NtCreateFile</b> can specify one or a combination of the 
     *        following, possibly using a bitwise-OR with one or more compatible flags from the preceding 
     *        <i>DesiredAccess</i> flags list.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_LIST_DIRECTORY"></a><a id="file_list_directory"></a><dl>
     * <dt><b>FILE_LIST_DIRECTORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Files in the directory can be listed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_TRAVERSE"></a><a id="file_traverse"></a><dl>
     * <dt><b>FILE_TRAVERSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The directory can be traversed: that is, it can be part of the pathname of a file.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes A pointer to a structure already initialized with 
     *       <b>InitializeObjectAttributes</b>. 
     *       Members of this structure for a file object include the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ULONG_Length"></a><a id="ulong_length"></a><a id="ULONG_LENGTH"></a><dl>
     * <dt><b>ULONG Length</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the number of bytes of <i>ObjectAttributes</i> data supplied. This value 
     *         must be at least sizeof(OBJECT_ATTRIBUTES).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HANDLE_RootDirectory"></a><a id="handle_rootdirectory"></a><a id="HANDLE_ROOTDIRECTORY"></a><dl>
     * <dt><b>HANDLE RootDirectory</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Optionally specifies a handle to a directory obtained by a preceding call to 
     *         <b>NtCreateFile</b>. If this value is 
     *         <b>NULL</b>, the <b>ObjectName</b> member must be a fully qualified 
     *         file specification that includes the full path to the target file. If this value is 
     *         non-<b>NULL</b>, the <b>ObjectName</b> member specifies a file name 
     *         relative to this directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PUNICODE_STRING_ObjectName"></a><a id="punicode_string_objectname"></a><a id="PUNICODE_STRING_OBJECTNAME"></a><dl>
     * <dt><b>PUNICODE_STRING ObjectName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Points to a buffered Unicode string that names the file to be created or opened. This value must be a 
     *         fully qualified file specification or the name of a device object, unless it is the name of a file relative to 
     *         the directory specified by <b>RootDirectory</b>. For example, \Device\Floppy1\myfile.dat 
     *         or \??\B:\myfile.dat could be the fully qualified file specification, provided that the floppy driver and 
     *         overlying file system are already loaded. For more information, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">File Names, Paths, and Namespaces</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ULONG_Attributes"></a><a id="ulong_attributes"></a><a id="ULONG_ATTRIBUTES"></a><dl>
     * <dt><b>ULONG Attributes</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Is a set of flags that controls the file object attributes. This value can be zero or 
     *         <b>OBJ_CASE_INSENSITIVE</b>, which indicates that name-lookup code should ignore the case 
     *         of the <b>ObjectName</b> member rather than performing an exact-match search. The value 
     *         <b>OBJ_INHERIT</b> is irrelevant to device and intermediate drivers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PSECURITY_DESCRIPTOR_SecurityDescriptor"></a><a id="psecurity_descriptor_securitydescriptor"></a><a id="PSECURITY_DESCRIPTOR_SECURITYDESCRIPTOR"></a><dl>
     * <dt><b>PSECURITY_DESCRIPTOR SecurityDescriptor</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Optionally specifies a security descriptor to be applied to a file. ACLs specified by such a security 
     *         descriptor are applied to the file only when it is created. If the value is <b>NULL</b> when a file is created, the 
     *         ACL placed on the file is file-system-dependent; most file systems propagate some part of such an ACL from the 
     *         parent directory file combined with the caller's default ACL. Device and intermediate drivers can set this 
     *         member to <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PSECURITY_QUALITY_OF_SERVICE_SecurityQualityOfService"></a><a id="psecurity_quality_of_service_securityqualityofservice"></a><a id="PSECURITY_QUALITY_OF_SERVICE_SECURITYQUALITYOFSERVICE"></a><dl>
     * <dt><b>PSECURITY_QUALITY_OF_SERVICE SecurityQualityOfService</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the access rights a server should be given to the client's security context. This value is 
     *         non-<b>NULL</b> only when a connection to a protected server is established, allowing the 
     *         caller to control which parts of the caller's security context are made available to the server and whether 
     *         the server is allowed to impersonate the caller.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock A pointer to a variable that receives the final completion status and information about the requested 
     *       operation. On return from <b>NtCreateFile</b>, the
     * @param {Pointer<Integer>} AllocationSize The initial allocation size in bytes for the file. A nonzero value has no effect unless the file is being 
     *       created, overwritten, or superseded.
     * @param {Integer} FileAttributes The file attributes. Explicitly specified attributes are applied only when the file is created, superseded, 
     *       or, in some cases, overwritten. By default, this value is a <b>FILE_ATTRIBUTE_NORMAL</b>, 
     *       which can be overridden by an ORed combination of one or more 
     *       <b>FILE_ATTRIBUTE_</b><i>xxxx</i> flags, which are defined in Wdm.h and 
     *       NtDdk.h. For a list of flags that can be used with 
     *       <b>NtCreateFile</b>, see 
     *       <b>CreateFile</b>.
     * @param {Integer} ShareAccess The type of share access that the caller would like to use in  the file, as zero, or as one or a
     * @param {Integer} CreateDisposition 
     * @param {Integer} CreateOptions The options to be applied when creating or opening the file, as a compatible combination of the following 
     *       flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_DIRECTORY_FILE"></a><a id="file_directory_file"></a><dl>
     * <dt><b>FILE_DIRECTORY_FILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file being created or opened is a directory file. With this flag, the 
     *         <i>CreateDisposition</i> parameter must be set to <b>FILE_CREATE</b>, 
     *         <b>FILE_OPEN</b>, or <b>FILE_OPEN_IF</b>. With this flag, other 
     *         compatible <i>CreateOptions</i> flags include only the following: 
     *         <b>FILE_SYNCHRONOUS_IO_ALERT</b>, <b>FILE_SYNCHRONOUS_IO _NONALERT</b>, 
     *         <b>FILE_WRITE_THROUGH</b>, <b>FILE_OPEN_FOR_BACKUP_INTENT</b>, and 
     *         <b>FILE_OPEN_BY_FILE_ID</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_NON_DIRECTORY_FILE"></a><a id="file_non_directory_file"></a><dl>
     * <dt><b>FILE_NON_DIRECTORY_FILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file being opened must not be a directory file or this call fails. The file object being opened can 
     *         represent a data file, a logical, virtual, or physical device, or a volume.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_WRITE_THROUGH"></a><a id="file_write_through"></a><dl>
     * <dt><b>FILE_WRITE_THROUGH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Applications that write data to the file must actually transfer the data into the file before any 
     *         requested write operation is considered complete. This flag is automatically set if the 
     *         <i>CreateOptions</i> flag <b>FILE_NO_INTERMEDIATE _BUFFERING</b> is set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_SEQUENTIAL_ONLY"></a><a id="file_sequential_only"></a><dl>
     * <dt><b>FILE_SEQUENTIAL_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All accesses to the file are sequential.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_RANDOM_ACCESS"></a><a id="file_random_access"></a><dl>
     * <dt><b>FILE_RANDOM_ACCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Accesses to the file can be random, so no sequential read-ahead operations should be performed on the 
     *         file by FSDs or the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_NO_INTERMEDIATE_BUFFERING"></a><a id="file_no_intermediate_buffering"></a><dl>
     * <dt><b>FILE_NO_INTERMEDIATE_BUFFERING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file cannot be cached or buffered in a driver's internal buffers. This flag is incompatible with the 
     *         <i>DesiredAccess</i> <b>FILE_APPEND_DATA</b> 
     *         flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_SYNCHRONOUS_IO_ALERT"></a><a id="file_synchronous_io_alert"></a><dl>
     * <dt><b>FILE_SYNCHRONOUS_IO_ALERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All operations on the file are performed synchronously. Any wait on behalf of the caller is subject to 
     *         premature termination from alerts. This flag also causes the I/O system to maintain the file position context. 
     *         If this flag is set, the <i>DesiredAccess</i> <b>SYNCHRONIZE</b> flag also must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_SYNCHRONOUS_IO_NONALERT"></a><a id="file_synchronous_io_nonalert"></a><dl>
     * <dt><b>FILE_SYNCHRONOUS_IO_NONALERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All operations on the file are performed synchronously. Waits in the system to synchronize I/O queuing 
     *         and completion are not subject to alerts. This flag also causes the I/O system to maintain the file position 
     *         context. If this flag is set, the <i>DesiredAccess</i> <b>SYNCHRONIZE</b> flag also must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_CREATE_TREE_CONNECTION"></a><a id="file_create_tree_connection"></a><dl>
     * <dt><b>FILE_CREATE_TREE_CONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create a tree connection for this file in order to open it over the network. This flag is not used by device and intermediate drivers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_NO_EA_KNOWLEDGE"></a><a id="file_no_ea_knowledge"></a><dl>
     * <dt><b>FILE_NO_EA_KNOWLEDGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the extended attributes on an existing file being opened indicate that the caller must understand EAs 
     *         to properly interpret the file, fail this request because the caller does not understand how to deal with EAs. This flag is irrelevant for device and intermediate drivers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_OPEN_REPARSE_POINT"></a><a id="file_open_reparse_point"></a><dl>
     * <dt><b>FILE_OPEN_REPARSE_POINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Open a file with a reparse point and bypass normal reparse point processing for the file. For more information, see the Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_DELETE_ON_CLOSE"></a><a id="file_delete_on_close"></a><dl>
     * <dt><b>FILE_DELETE_ON_CLOSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Delete the file when the last handle to it is passed to <b>NtClose</b>. If this flag is set, the DELETE flag must be set in the <i>DesiredAccess</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_OPEN_BY_FILE_ID"></a><a id="file_open_by_file_id"></a><dl>
     * <dt><b>FILE_OPEN_BY_FILE_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file name that is specified by the <i>ObjectAttributes</i> parameter includes the 8-byte file reference number for the file. This number is assigned by and specific to the particular file system. If the file is a reparse point, the file name will also include the name of a device. Note that the FAT file system does not support this flag. This flag is not used by device and intermediate drivers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_OPEN_FOR_BACKUP_INTENT"></a><a id="file_open_for_backup_intent"></a><dl>
     * <dt><b>FILE_OPEN_FOR_BACKUP_INTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is being opened for backup intent. Therefore, the system should check for certain access rights and grant the caller the appropriate access to the file before checking the <i>DesiredAccess</i> parameter against the file's security descriptor. This flag not used by device and intermediate drivers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_RESERVE_OPFILTER_"></a><a id="file_reserve_opfilter_"></a><dl>
     * <dt><b>FILE_RESERVE_OPFILTER </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag allows an application to request a filter opportunistic lock (<a href="https://www.microsoft.com/?ref=go">oplock</a>) to prevent other applications from getting share violations. If there are already open handles, the create request will fail with <b>STATUS_OPLOCK_NOT_GRANTED</b>. For more information, see the Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_OPEN_REQUIRING_OPLOCK"></a><a id="file_open_requiring_oplock"></a><dl>
     * <dt><b>FILE_OPEN_REQUIRING_OPLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is being opened and an opportunistic lock (<a href="https://www.microsoft.com/?ref=go">oplock</a>) on the file is being requested as a single atomic operation. The file system checks for oplocks before it performs the create operation and will fail the create with a return code of <b>STATUS_CANNOT_BREAK_OPLOCK</b> if the result would be to break an existing oplock.  For more information, see the Remarks section.<b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This flag is not supported.
     * 
     * 
     * 
     * This flag is supported on the following file systems: NTFS, FAT, and exFAT.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_COMPLETE_IF_OPLOCKED"></a><a id="file_complete_if_oplocked"></a><dl>
     * <dt><b>FILE_COMPLETE_IF_OPLOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Complete this operation immediately with an alternate success code of <b>STATUS_OPLOCK_BREAK_IN_PROGRESS</b> if the target file is oplocked, rather than blocking the caller's thread. If the file is <a href="https://www.microsoft.com/?ref=go">oplocked</a>, another caller already has access to the file. This flag is not used by device and intermediate drivers.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} EaBuffer Pointer to an EA buffer used to pass extended attributes.
     *       
     * 
     * <div class="alert"><b>Note</b>  Some file systems may not support EA buffers.</div>
     * <div> </div>
     * @param {Integer} EaLength Length of the EA buffer.
     * @returns {NTSTATUS} <b>NtCreateFile</b> returns either 
     *       <b>STATUS_SUCCESS</b> or an appropriate error status. If it returns an error status, the 
     *       caller can find more information about the cause of the failure by checking the 
     *       <i>IoStatusBlock</i>. To simplify this check, an application can use the <b>NT_SUCCESS</b>, <b>NT_ERROR</b>, and <b>NT_WARNING</b> macros.
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntcreatefile
     */
    static NtCreateFile(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, CreateDisposition, CreateOptions, EaBuffer, EaLength) {
        AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtCreateFile", "ptr", FileHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", CreateDisposition, "uint", CreateOptions, "ptr", EaBuffer, "uint", EaLength, "int")
        return result
    }

    /**
     * Opens an existing file, device, directory, or volume, and returns a handle for the file object.
     * @remarks
     * Before using this function, please read 
     *     <a href="https://docs.microsoft.com/windows/desktop/DevNotes/calling-internal-apis">Calling Internal APIs</a>.
     * 
     * Driver routines that run in a process context other than that of the system process must set the 
     *      <b>OBJ_KERNEL_HANDLE</b> attribute for the <i>ObjectAttributes</i> 
     *      parameter of <b>ZwOpenFile</b>. This restricts the use of the handle returned by 
     *      <b>ZwOpenFile</b> to processes running only in kernel mode. Otherwise, the handle can 
     *      be accessed by the process in whose context the driver is running. Drivers can call 
     *      <b>InitializeObjectAttributes</b> to set the 
     *      <b>OBJ_KERNEL_HANDLE</b> attribute as follows.
     * 
     * <c>InitializeObjectAttributes(&amp;ObjectAddributes, NULL, OBJ_KERNEL_HANDLE, NULL, NULL);</c>
     * 
     * Callers of <b>ZwCreateFile</b> must be running at IRQL = PASSIVE_LEVEL.
     * 
     * Note that the WDK header file Ntdef.h is necessary for many constant definitions 
     *     as well as the <b>InitializeObjectAttributes</b> macro. The associated import library, 
     *     Ntdll.lib is available in the WDK. You can also use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> functions to dynamically link to 
     *     Ntdll.dll.
     * @param {Pointer<HANDLE>} FileHandle A pointer to a handle for the opened file. The driver must close the handle with 
     *       <b>ZwClose</b> once the handle is no longer in use.
     * @param {Integer} DesiredAccess The <b>ACCESS_MASK</b> value that expresses the types of file access desired by the 
     *       caller. For information about the types of access that can be specified, see 
     *       <b>ZwCreateFile</b> in the WDK.
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes A pointer to a structure that a caller initializes with 
     *       <b>InitializeObjectAttributes</b>. If the caller is not running in the system process 
     *       context, it must set the <b>OBJ_KERNEL_HANDLE</b> attribute for 
     *       <i>ObjectAttributes</i>. For more information about specifying object attributes, see 
     *       the <i>CreateOptions</i> parameter of <b>ZwCreateFile</b> in the WDK.
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock A pointer to a structure that contains information about the requested operation and the final completion 
     *       status.
     * @param {Integer} ShareAccess The type of share access for the file. For more information, see 
     *       <b>ZwCreateFile</b> in the WDK.
     * @param {Integer} OpenOptions The options to be applied when opening the file. For more information, see 
     *        <b>ZwCreateFile</b> in the WDK.
     * @returns {NTSTATUS} <b>NtOpenFile</b> either returns 
     *        <b>STATUS_SUCCESS</b> or an appropriate error status. If it returns an error status, the 
     *        caller can find additional information about the cause of the failure by checking the 
     *        <i>IoStatusBlock</i>.
     * @see https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-ntopenfile
     */
    static NtOpenFile(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, ShareAccess, OpenOptions) {
        result := DllCall("ntdll.dll\NtOpenFile", "ptr", FileHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", IoStatusBlock, "uint", ShareAccess, "uint", OpenOptions, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} FileInformation 
     * @param {Integer} Length 
     * @param {Integer} FileInformationClass 
     * @returns {NTSTATUS} 
     */
    static NtQueryInformationByName(ObjectAttributes, IoStatusBlock, FileInformation, Length, FileInformationClass) {
        result := DllCall("ntdll.dll\NtQueryInformationByName", "ptr", ObjectAttributes, "ptr", IoStatusBlock, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} FileInformation 
     * @param {Integer} Length 
     * @param {Integer} FileInformationClass 
     * @returns {NTSTATUS} 
     */
    static NtQueryInformationFile(FileHandle, IoStatusBlock, FileInformation, Length, FileInformationClass) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\NtQueryInformationFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "int")
        return result
    }

    /**
     * Reads data from an open file.
     * @remarks
     * Callers of **NtReadFile** must have already called [**NtCreateFile**](/windows/desktop/api/Winternl/nf-winternl-ntcreatefile) with the FILE\_READ\_DATA or GENERIC\_READ value set in the *DesiredAccess* parameter.
     * 
     * If the preceding call to [**NtCreateFile**](/windows/desktop/api/Winternl/nf-winternl-ntcreatefile) set the FILE\_NO\_INTERMEDIATE\_BUFFERING flag in the *CreateOptions* parameter to **NtCreateFile**, the *Length* and *ByteOffset* parameters to **NtReadFile** must be multiples of the sector size. For more information, see **NtCreateFile**.
     * 
     * **NtReadFile** begins reading from the given *ByteOffset* or the current file position into the given *Buffer*. It terminates the read operation under one of the following conditions:
     * 
     * -   The buffer is full because the number of bytes specified by the *Length* parameter has been read. Therefore, no more data can be placed into the buffer without an overflow.
     * 
     * -   The end of file is reached during the read operation, so there is no more data in the file to be transferred into the buffer.
     * 
     * If the caller opened the file with the SYNCHRONIZE flag set in *DesiredAccess*, the calling thread can synchronize to the completion of the read operation by waiting on the file handle, *FileHandle*. The handle is signaled each time that an I/O operation that was issued on the handle completes. However, the caller must not wait on a handle that was opened for synchronous file access (FILE\_SYNCHRONOUS\_IO\_NONALERT or FILE\_SYNCHRONOUS\_IO\_ALERT). In this case, **NtReadFile** waits on behalf of the caller and does not return until the read operation is complete. The caller can safely wait on the file handle only if all three of the following conditions are met:
     * 
     * -   The handle was opened for asynchronous access (that is, neither FILE\_SYNCHRONOUS\_IO\_*XXX* flag was specified).
     * 
     * -   The handle is being used for only one I/O operation at a time.
     * 
     * -   **NtReadFile** returned STATUS\_PENDING.
     * 
     * A driver should call **NtReadFile** in the context of the system process if any of the following conditions exist:
     * 
     * -   The driver created the file handle that it passes to **NtReadFile**.
     * 
     * -   **NtReadFile** will notify the driver of I/O completion by means of an event that the driver created.
     * 
     * -   **NtReadFile** will notify the driver of I/O completion by means of an APC callback routine that the driver passes to **NtReadFile**.
     * 
     * File and event handles are valid only in the process context where the handles are created. Therefore, to avoid security holes, the driver should create any file or event handle that it passes to **NtReadFile** in the context of the system process rather than the context of the process that the driver is in.
     * 
     * Likewise, **NtReadFile** should be called in the context of the system process if it notifies the driver of I/O completion by means of an APC, because APCs are always fired in the context of the thread that issues the I/O request. If the driver calls **NtReadFile** in the context of a process other than the system one, the APC could be delayed indefinitely, or it might not fire at all.
     * 
     * For more information about working with files, see [Using Files in a Driver](/windows-hardware/drivers/kernel/using-files-in-a-driver).
     * 
     * Callers of **NtReadFile** must be running at IRQL = PASSIVE\_LEVEL and [with special kernel APCs enabled](/windows-hardware/drivers/kernel/disabling-apcs).
     * @param {HANDLE} FileHandle Handle to the file object. This handle is created by a successful call to [**NtCreateFile**](/windows/desktop/api/Winternl/nf-winternl-ntcreatefile) or [**NtOpenFile**](/windows/desktop/api/Winternl/nf-winternl-ntopenfile).
     * @param {HANDLE} Event Optionally, a handle to an event object to set to the signaled state after the read operation completes. Device and intermediate drivers should set this parameter to **NULL**.
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine This parameter is reserved. Device and intermediate drivers should set this pointer to **NULL**.
     * @param {Pointer<Void>} ApcContext This parameter is reserved. Device and intermediate drivers should set this pointer to **NULL**.
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock Pointer to an [**IO\_STATUS\_BLOCK**](/windows-hardware/drivers/ddi/wdm/ns-wdm-_io_status_block) structure that receives the final completion status and information about the requested read operation. The **Information** member receives the number of bytes actually read from the file.
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length The size, in bytes, of the buffer pointed to by *Buffer*.
     * @param {Pointer<Integer>} ByteOffset Pointer to a variable that specifies the starting byte offset in the file where the read operation will begin. If an attempt is made to read beyond the end of the file, **NtReadFile** returns an error.
     * 
     * If the call to [**NtCreateFile**](/windows/desktop/api/Winternl/nf-winternl-ntcreatefile) set either of the *CreateOptions* flags FILE\_SYNCHRONOUS\_IO\_ALERT or FILE\_SYNCHRONOUS\_IO\_NONALERT, the I/O Manager maintains the current file position. If so, the caller of **NtReadFile** can specify that the current file position offset be used instead of an explicit *ByteOffset* value. This specification can be made by using one of the following methods:
     * 
     * -   Specify a pointer to a **LARGE\_INTEGER** value with the **HighPart** member set to -1 and the **LowPart** member set to the system-defined value FILE\_USE\_FILE\_POINTER\_POSITION.
     * 
     * -   Pass a **NULL** pointer for *ByteOffset*.
     * @param {Pointer<Integer>} Key Device and intermediate drivers should set this pointer to **NULL**.
     * @returns {NTSTATUS} **NtReadFile** returns either STATUS\_SUCCESS or the appropriate NTSTATUS error code.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/ntreadfile
     */
    static NtReadFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, Buffer_R, Length, ByteOffset, Key) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"
        ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
        KeyMarshal := Key is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtReadFile", "ptr", FileHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "ptr", Buffer_R, "uint", Length, ByteOffsetMarshal, ByteOffset, KeyMarshal, Key, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} FileInformation 
     * @param {Integer} Length 
     * @param {Integer} FileInformationClass 
     * @returns {NTSTATUS} 
     */
    static NtSetInformationFile(FileHandle, IoStatusBlock, FileInformation, Length, FileInformationClass) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\NtSetInformationFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {HANDLE} Event 
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
     * @param {Pointer<Void>} ApcContext 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} ByteOffset 
     * @param {Pointer<Integer>} Key 
     * @returns {NTSTATUS} 
     */
    static NtWriteFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, Buffer_R, Length, ByteOffset, Key) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"
        ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
        KeyMarshal := Key is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtWriteFile", "ptr", FileHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "ptr", Buffer_R, "uint", Length, ByteOffsetMarshal, ByteOffset, KeyMarshal, Key, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Integer} Flags 
     * @param {Pointer} Parameters 
     * @param {Integer} ParametersSize 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @returns {NTSTATUS} 
     */
    static NtFlushBuffersFileEx(FileHandle, Flags, Parameters, ParametersSize, IoStatusBlock) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\NtFlushBuffersFileEx", "ptr", FileHandle, "uint", Flags, "ptr", Parameters, "uint", ParametersSize, "ptr", IoStatusBlock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @param {Integer} SecurityInformation 
     * @param {Pointer} SecurityDescriptor 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} LengthNeeded 
     * @returns {NTSTATUS} 
     */
    static NtQuerySecurityObject(Handle, SecurityInformation, SecurityDescriptor, Length, LengthNeeded) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        LengthNeededMarshal := LengthNeeded is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQuerySecurityObject", "ptr", Handle, "uint", SecurityInformation, "ptr", SecurityDescriptor, "uint", Length, LengthNeededMarshal, LengthNeeded, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} SectionHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<Integer>} MaximumSize 
     * @param {Integer} SectionPageProtection 
     * @param {Integer} AllocationAttributes 
     * @param {HANDLE} FileHandle 
     * @returns {NTSTATUS} 
     */
    static NtCreateSection(SectionHandle, DesiredAccess, ObjectAttributes, MaximumSize, SectionPageProtection, AllocationAttributes, FileHandle) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        MaximumSizeMarshal := MaximumSize is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtCreateSection", "ptr", SectionHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, MaximumSizeMarshal, MaximumSize, "uint", SectionPageProtection, "uint", AllocationAttributes, "ptr", FileHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} SectionHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<Integer>} MaximumSize 
     * @param {Integer} SectionPageProtection 
     * @param {Integer} AllocationAttributes 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters 
     * @param {Integer} ExtendedParameterCount 
     * @returns {NTSTATUS} 
     */
    static NtCreateSectionEx(SectionHandle, DesiredAccess, ObjectAttributes, MaximumSize, SectionPageProtection, AllocationAttributes, FileHandle, ExtendedParameters, ExtendedParameterCount) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        MaximumSizeMarshal := MaximumSize is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtCreateSectionEx", "ptr", SectionHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, MaximumSizeMarshal, MaximumSize, "uint", SectionPageProtection, "uint", AllocationAttributes, "ptr", FileHandle, "ptr", ExtendedParameters, "uint", ExtendedParameterCount, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer} BaseAddress 
     * @param {Pointer} ZeroBits 
     * @param {Pointer<Pointer>} RegionSize 
     * @param {Integer} AllocationType 
     * @param {Integer} Protect 
     * @returns {NTSTATUS} 
     */
    static NtAllocateVirtualMemory(ProcessHandle, BaseAddress, ZeroBits, RegionSize, AllocationType, Protect) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\NtAllocateVirtualMemory", "ptr", ProcessHandle, "ptr", BaseAddress, "ptr", ZeroBits, RegionSizeMarshal, RegionSize, "uint", AllocationType, "uint", Protect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KMUTANT>} Mutant 
     * @param {BOOLEAN} InitialOwner 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeInitializeMutant(Mutant, InitialOwner) {
        DllCall("ntoskrnl.exe\KeInitializeMutant", "ptr", Mutant, "char", InitialOwner)
    }

    /**
     * 
     * @param {Pointer<KMUTANT>} Mutant 
     * @returns {Integer} 
     */
    static KeReadStateMutant(Mutant) {
        result := DllCall("ntoskrnl.exe\KeReadStateMutant", "ptr", Mutant, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KMUTANT>} Mutant 
     * @param {Integer} Increment 
     * @param {BOOLEAN} Abandoned 
     * @param {BOOLEAN} Wait 
     * @returns {Integer} 
     */
    static KeReleaseMutant(Mutant, Increment, Abandoned, Wait) {
        result := DllCall("ntoskrnl.exe\KeReleaseMutant", "ptr", Mutant, "int", Increment, "char", Abandoned, "char", Wait, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KQUEUE>} Queue 
     * @param {Integer} Count 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeInitializeQueue(Queue, Count) {
        DllCall("ntoskrnl.exe\KeInitializeQueue", "ptr", Queue, "uint", Count)
    }

    /**
     * 
     * @param {Pointer<KQUEUE>} Queue 
     * @returns {Integer} 
     */
    static KeReadStateQueue(Queue) {
        result := DllCall("ntoskrnl.exe\KeReadStateQueue", "ptr", Queue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KQUEUE>} Queue 
     * @param {Pointer<LIST_ENTRY>} Entry 
     * @returns {Integer} 
     */
    static KeInsertQueue(Queue, Entry) {
        result := DllCall("ntoskrnl.exe\KeInsertQueue", "ptr", Queue, "ptr", Entry, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KQUEUE>} Queue 
     * @param {Pointer<LIST_ENTRY>} Entry 
     * @returns {Integer} 
     */
    static KeInsertHeadQueue(Queue, Entry) {
        result := DllCall("ntoskrnl.exe\KeInsertHeadQueue", "ptr", Queue, "ptr", Entry, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KQUEUE>} Queue 
     * @param {Integer} WaitMode 
     * @param {Pointer<Integer>} Timeout 
     * @returns {Pointer<LIST_ENTRY>} 
     */
    static KeRemoveQueue(Queue, WaitMode, Timeout) {
        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeRemoveQueue", "ptr", Queue, "char", WaitMode, TimeoutMarshal, Timeout, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<KQUEUE>} Queue 
     * @param {Integer} WaitMode 
     * @param {BOOLEAN} Alertable 
     * @param {Pointer<Integer>} Timeout 
     * @param {Pointer<Pointer<LIST_ENTRY>>} EntryArray 
     * @param {Integer} Count 
     * @returns {Integer} 
     */
    static KeRemoveQueueEx(Queue, WaitMode, Alertable, Timeout, EntryArray, Count) {
        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"
        EntryArrayMarshal := EntryArray is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeRemoveQueueEx", "ptr", Queue, "char", WaitMode, "char", Alertable, TimeoutMarshal, Timeout, EntryArrayMarshal, EntryArray, "uint", Count, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<KQUEUE>} Queue 
     * @returns {Pointer<LIST_ENTRY>} 
     */
    static KeRundownQueue(Queue) {
        result := DllCall("ntoskrnl.exe\KeRundownQueue", "ptr", Queue, "ptr")
        return result
    }

    /**
     * 
     * @param {PRKPROCESS} Process 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeAttachProcess(Process) {
        DllCall("ntoskrnl.exe\KeAttachProcess", "ptr", Process)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeDetachProcess() {
        DllCall("ntoskrnl.exe\KeDetachProcess")
    }

    /**
     * 
     * @param {PRKPROCESS} PROCESS 
     * @param {Pointer<KAPC_STATE>} ApcState 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeStackAttachProcess(PROCESS, ApcState) {
        DllCall("ntoskrnl.exe\KeStackAttachProcess", "ptr", PROCESS, "ptr", ApcState)
    }

    /**
     * 
     * @param {Pointer<KAPC_STATE>} ApcState 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeUnstackDetachProcess(ApcState) {
        DllCall("ntoskrnl.exe\KeUnstackDetachProcess", "ptr", ApcState)
    }

    /**
     * 
     * @param {PKTHREAD} Thread 
     * @param {Integer} Processor 
     * @returns {Integer} 
     */
    static KeSetIdealProcessorThread(Thread, Processor) {
        result := DllCall("ntoskrnl.exe\KeSetIdealProcessorThread", "ptr", Thread, "char", Processor, "char")
        return result
    }

    /**
     * 
     * @param {BOOLEAN} Enable 
     * @returns {BOOLEAN} 
     */
    static KeSetKernelStackSwapEnable(Enable) {
        result := DllCall("ntoskrnl.exe\KeSetKernelStackSwapEnable", "char", Enable, "char")
        return result
    }

    /**
     * 
     * @param {Integer} Number_R 
     * @returns {Integer} 
     */
    static KeAcquireQueuedSpinLock(Number_R) {
        result := DllCall("ntoskrnl.exe\KeAcquireQueuedSpinLock", "int", Number_R, "char")
        return result
    }

    /**
     * 
     * @param {Integer} Number_R 
     * @param {Integer} OldIrql 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeReleaseQueuedSpinLock(Number_R, OldIrql) {
        DllCall("ntoskrnl.exe\KeReleaseQueuedSpinLock", "int", Number_R, "char", OldIrql)
    }

    /**
     * 
     * @param {Integer} Number_R 
     * @param {Pointer<Integer>} OldIrql 
     * @returns {Integer} 
     */
    static KeTryToAcquireQueuedSpinLock(Number_R, OldIrql) {
        OldIrqlMarshal := OldIrql is VarRef ? "char*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeTryToAcquireQueuedSpinLock", "int", Number_R, OldIrqlMarshal, OldIrql, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} SpinLock 
     * @returns {Integer} 
     */
    static KeAcquireSpinLockRaiseToSynch(SpinLock) {
        SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeAcquireSpinLockRaiseToSynch", SpinLockMarshal, SpinLock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} PoolBlock 
     * @param {Pointer<BOOLEAN>} QuotaCharged 
     * @returns {Pointer} 
     */
    static ExQueryPoolBlockSize(PoolBlock, QuotaCharged) {
        PoolBlockMarshal := PoolBlock is VarRef ? "ptr" : "ptr"
        QuotaChargedMarshal := QuotaCharged is VarRef ? "char*" : "ptr"

        result := DllCall("ntoskrnl.exe\ExQueryPoolBlockSize", PoolBlockMarshal, PoolBlock, QuotaChargedMarshal, QuotaCharged, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExDisableResourceBoostLite(Resource) {
        DllCall("ntoskrnl.exe\ExDisableResourceBoostLite", "ptr", Resource)
    }

    /**
     * 
     * @param {Pointer<SECURITY_CLIENT_CONTEXT>} ClientContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeDeleteClientSecurity(ClientContext) {
        DllCall("ntoskrnl.exe\SeDeleteClientSecurity", "ptr", ClientContext)
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @param {PEPROCESS} Process 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeCaptureSubjectContextEx(Thread, Process, SubjectContext) {
        DllCall("ntoskrnl.exe\SeCaptureSubjectContextEx", "ptr", Thread, "ptr", Process, "ptr", SubjectContext)
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<UNICODE_STRING>} SourceName 
     * @param {PSID} UserSid 
     * @param {Pointer<SE_ADT_PARAMETER_ARRAY>} AuditParameters 
     * @param {Integer} AuditSubcategoryId 
     * @returns {NTSTATUS} 
     */
    static SeReportSecurityEventWithSubCategory(Flags, SourceName, UserSid, AuditParameters, AuditSubcategoryId) {
        result := DllCall("ntoskrnl.exe\SeReportSecurityEventWithSubCategory", "uint", Flags, "ptr", SourceName, "ptr", UserSid, "ptr", AuditParameters, "uint", AuditSubcategoryId, "int")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<TOKEN_ACCESS_INFORMATION>} PrimaryTokenInformation 
     * @param {Pointer<TOKEN_ACCESS_INFORMATION>} ClientTokenInformation 
     * @param {Integer} DesiredAccess 
     * @param {Integer} PreviouslyGrantedAccess 
     * @param {Pointer<Pointer<PRIVILEGE_SET>>} Privileges 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {Integer} AccessMode 
     * @param {Pointer<Integer>} GrantedAccess 
     * @param {Pointer<Integer>} AccessStatus 
     * @returns {BOOLEAN} 
     */
    static SeAccessCheckFromState(SecurityDescriptor, PrimaryTokenInformation, ClientTokenInformation, DesiredAccess, PreviouslyGrantedAccess, Privileges, GenericMapping, AccessMode, GrantedAccess, AccessStatus) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        PrivilegesMarshal := Privileges is VarRef ? "ptr*" : "ptr"
        GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
        AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeAccessCheckFromState", "ptr", SecurityDescriptor, "ptr", PrimaryTokenInformation, "ptr", ClientTokenInformation, "uint", DesiredAccess, "uint", PreviouslyGrantedAccess, PrivilegesMarshal, Privileges, "ptr", GenericMapping, "char", AccessMode, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, "char")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<Void>} PrimaryToken 
     * @param {Pointer<Void>} ClientToken 
     * @param {Integer} DesiredAccess 
     * @param {Integer} PreviouslyGrantedAccess 
     * @param {Pointer<Pointer<PRIVILEGE_SET>>} Privileges 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {Integer} AccessMode 
     * @param {Pointer<Integer>} GrantedAccess 
     * @param {Pointer<Integer>} AccessStatus 
     * @returns {BOOLEAN} 
     */
    static SeAccessCheckFromStateEx(SecurityDescriptor, PrimaryToken, ClientToken, DesiredAccess, PreviouslyGrantedAccess, Privileges, GenericMapping, AccessMode, GrantedAccess, AccessStatus) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        PrimaryTokenMarshal := PrimaryToken is VarRef ? "ptr" : "ptr"
        ClientTokenMarshal := ClientToken is VarRef ? "ptr" : "ptr"
        PrivilegesMarshal := Privileges is VarRef ? "ptr*" : "ptr"
        GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
        AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeAccessCheckFromStateEx", "ptr", SecurityDescriptor, PrimaryTokenMarshal, PrimaryToken, ClientTokenMarshal, ClientToken, "uint", DesiredAccess, "uint", PreviouslyGrantedAccess, PrivilegesMarshal, Privileges, "ptr", GenericMapping, "char", AccessMode, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<TOKEN_ACCESS_INFORMATION>} AccessInformation 
     * @param {Pointer<Void>} Token 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} RequiredLength 
     * @returns {NTSTATUS} 
     */
    static SeTokenFromAccessInformation(AccessInformation, Token, Length, RequiredLength) {
        TokenMarshal := Token is VarRef ? "ptr" : "ptr"
        RequiredLengthMarshal := RequiredLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeTokenFromAccessInformation", "ptr", AccessInformation, TokenMarshal, Token, "uint", Length, RequiredLengthMarshal, RequiredLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PRIVILEGE_SET>} RequiredPrivileges 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
     * @param {Integer} AccessMode 
     * @returns {BOOLEAN} 
     */
    static SePrivilegeCheck(RequiredPrivileges, SubjectSecurityContext, AccessMode) {
        result := DllCall("ntoskrnl.exe\SePrivilegeCheck", "ptr", RequiredPrivileges, "ptr", SubjectSecurityContext, "char", AccessMode, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<PRIVILEGE_SET>} Privileges 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeFreePrivileges(Privileges) {
        DllCall("ntoskrnl.exe\SeFreePrivileges", "ptr", Privileges)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<UNICODE_STRING>} AbsoluteObjectName 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<ACCESS_STATE>} AccessState 
     * @param {BOOLEAN} ObjectCreated 
     * @param {BOOLEAN} AccessGranted 
     * @param {Integer} AccessMode 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeOpenObjectAuditAlarm(ObjectTypeName, Object_R, AbsoluteObjectName, SecurityDescriptor, AccessState, ObjectCreated, AccessGranted, AccessMode, GenerateOnClose) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        DllCall("ntoskrnl.exe\SeOpenObjectAuditAlarm", "ptr", ObjectTypeName, Object_RMarshal, Object_R, "ptr", AbsoluteObjectName, "ptr", SecurityDescriptor, "ptr", AccessState, "char", ObjectCreated, "char", AccessGranted, "char", AccessMode, GenerateOnCloseMarshal, GenerateOnClose)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<UNICODE_STRING>} AbsoluteObjectName 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<ACCESS_STATE>} AccessState 
     * @param {BOOLEAN} ObjectCreated 
     * @param {BOOLEAN} AccessGranted 
     * @param {Integer} AccessMode 
     * @param {Pointer<Guid>} TransactionId 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeOpenObjectAuditAlarmWithTransaction(ObjectTypeName, Object_R, AbsoluteObjectName, SecurityDescriptor, AccessState, ObjectCreated, AccessGranted, AccessMode, TransactionId, GenerateOnClose) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        DllCall("ntoskrnl.exe\SeOpenObjectAuditAlarmWithTransaction", "ptr", ObjectTypeName, Object_RMarshal, Object_R, "ptr", AbsoluteObjectName, "ptr", SecurityDescriptor, "ptr", AccessState, "char", ObjectCreated, "char", AccessGranted, "char", AccessMode, "ptr", TransactionId, GenerateOnCloseMarshal, GenerateOnClose)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<UNICODE_STRING>} AbsoluteObjectName 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<ACCESS_STATE>} AccessState 
     * @param {BOOLEAN} ObjectCreated 
     * @param {BOOLEAN} AccessGranted 
     * @param {Integer} AccessMode 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeOpenObjectForDeleteAuditAlarm(ObjectTypeName, Object_R, AbsoluteObjectName, SecurityDescriptor, AccessState, ObjectCreated, AccessGranted, AccessMode, GenerateOnClose) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        DllCall("ntoskrnl.exe\SeOpenObjectForDeleteAuditAlarm", "ptr", ObjectTypeName, Object_RMarshal, Object_R, "ptr", AbsoluteObjectName, "ptr", SecurityDescriptor, "ptr", AccessState, "char", ObjectCreated, "char", AccessGranted, "char", AccessMode, GenerateOnCloseMarshal, GenerateOnClose)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} ObjectTypeName 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<UNICODE_STRING>} AbsoluteObjectName 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<ACCESS_STATE>} AccessState 
     * @param {BOOLEAN} ObjectCreated 
     * @param {BOOLEAN} AccessGranted 
     * @param {Integer} AccessMode 
     * @param {Pointer<Guid>} TransactionId 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeOpenObjectForDeleteAuditAlarmWithTransaction(ObjectTypeName, Object_R, AbsoluteObjectName, SecurityDescriptor, AccessState, ObjectCreated, AccessGranted, AccessMode, TransactionId, GenerateOnClose) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        DllCall("ntoskrnl.exe\SeOpenObjectForDeleteAuditAlarmWithTransaction", "ptr", ObjectTypeName, Object_RMarshal, Object_R, "ptr", AbsoluteObjectName, "ptr", SecurityDescriptor, "ptr", AccessState, "char", ObjectCreated, "char", AccessGranted, "char", AccessMode, "ptr", TransactionId, GenerateOnCloseMarshal, GenerateOnClose)
    }

    /**
     * 
     * @param {Pointer<ACL>} Sacl 
     * @param {Pointer<ACL>} ResourceSacl 
     * @param {Pointer<Void>} Token 
     * @param {Integer} DesiredAccess 
     * @param {BOOLEAN} AccessGranted 
     * @param {Pointer<BOOLEAN>} GenerateAudit 
     * @param {Pointer<BOOLEAN>} GenerateAlarm 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeExamineSacl(Sacl, ResourceSacl, Token, DesiredAccess, AccessGranted, GenerateAudit, GenerateAlarm) {
        TokenMarshal := Token is VarRef ? "ptr" : "ptr"
        GenerateAuditMarshal := GenerateAudit is VarRef ? "char*" : "ptr"
        GenerateAlarmMarshal := GenerateAlarm is VarRef ? "char*" : "ptr"

        DllCall("ntoskrnl.exe\SeExamineSacl", "ptr", Sacl, "ptr", ResourceSacl, TokenMarshal, Token, "uint", DesiredAccess, "char", AccessGranted, GenerateAuditMarshal, GenerateAudit, GenerateAlarmMarshal, GenerateAlarm)
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {HANDLE} Handle 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeDeleteObjectAuditAlarm(Object_R, Handle) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\SeDeleteObjectAuditAlarm", Object_RMarshal, Object_R, "ptr", Handle)
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {HANDLE} Handle 
     * @param {Pointer<Guid>} TransactionId 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeDeleteObjectAuditAlarmWithTransaction(Object_R, Handle, TransactionId) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\SeDeleteObjectAuditAlarmWithTransaction", Object_RMarshal, Object_R, "ptr", Handle, "ptr", TransactionId)
    }

    /**
     * 
     * @param {Pointer<Void>} Token 
     * @returns {Integer} 
     */
    static SeTokenType(Token) {
        TokenMarshal := Token is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\SeTokenType", TokenMarshal, Token, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Token 
     * @returns {BOOLEAN} 
     */
    static SeTokenIsAdmin(Token) {
        TokenMarshal := Token is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\SeTokenIsAdmin", TokenMarshal, Token, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Token 
     * @returns {BOOLEAN} 
     */
    static SeTokenIsRestricted(Token) {
        TokenMarshal := Token is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\SeTokenIsRestricted", TokenMarshal, Token, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Token 
     * @returns {BOOLEAN} 
     */
    static SeTokenIsWriteRestricted(Token) {
        TokenMarshal := Token is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\SeTokenIsWriteRestricted", TokenMarshal, Token, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ExistingToken 
     * @param {Integer} Flags 
     * @param {Pointer<TOKEN_GROUPS>} SidsToDisable 
     * @param {Pointer<TOKEN_PRIVILEGES>} PrivilegesToDelete 
     * @param {Pointer<TOKEN_GROUPS>} RestrictedSids 
     * @param {Pointer<Pointer<Void>>} FilteredToken 
     * @returns {NTSTATUS} 
     */
    static SeFilterToken(ExistingToken, Flags, SidsToDisable, PrivilegesToDelete, RestrictedSids, FilteredToken) {
        ExistingTokenMarshal := ExistingToken is VarRef ? "ptr" : "ptr"
        FilteredTokenMarshal := FilteredToken is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeFilterToken", ExistingTokenMarshal, ExistingToken, "uint", Flags, "ptr", SidsToDisable, "ptr", PrivilegesToDelete, "ptr", RestrictedSids, FilteredTokenMarshal, FilteredToken, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Token 
     * @param {Pointer<LUID>} AuthenticationId 
     * @returns {NTSTATUS} 
     */
    static SeQueryAuthenticationIdToken(Token, AuthenticationId) {
        TokenMarshal := Token is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\SeQueryAuthenticationIdToken", TokenMarshal, Token, "ptr", AuthenticationId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Token 
     * @param {Pointer<Integer>} SessionId 
     * @returns {NTSTATUS} 
     */
    static SeQuerySessionIdToken(Token, SessionId) {
        TokenMarshal := Token is VarRef ? "ptr" : "ptr"
        SessionIdMarshal := SessionId is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeQuerySessionIdToken", TokenMarshal, Token, SessionIdMarshal, SessionId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Token 
     * @param {Pointer<Integer>} SessionId 
     * @param {Pointer<BOOLEAN>} IsServiceSession 
     * @returns {NTSTATUS} 
     */
    static SeQuerySessionIdTokenEx(Token, SessionId, IsServiceSession) {
        TokenMarshal := Token is VarRef ? "ptr" : "ptr"
        SessionIdMarshal := SessionId is VarRef ? "uint*" : "ptr"
        IsServiceSessionMarshal := IsServiceSession is VarRef ? "char*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeQuerySessionIdTokenEx", TokenMarshal, Token, SessionIdMarshal, SessionId, IsServiceSessionMarshal, IsServiceSession, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Token 
     * @param {Pointer<PESILO>} pServerSilo 
     * @returns {NTSTATUS} 
     */
    static SeQueryServerSiloToken(Token, pServerSilo) {
        TokenMarshal := Token is VarRef ? "ptr" : "ptr"
        pServerSiloMarshal := pServerSilo is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeQueryServerSiloToken", TokenMarshal, Token, pServerSiloMarshal, pServerSilo, "int")
        return result
    }

    /**
     * 
     * @param {PETHREAD} ClientThread 
     * @param {Pointer<SECURITY_QUALITY_OF_SERVICE>} ClientSecurityQos 
     * @param {BOOLEAN} RemoteSession 
     * @param {Pointer<SECURITY_CLIENT_CONTEXT>} ClientContext 
     * @returns {NTSTATUS} 
     */
    static SeCreateClientSecurity(ClientThread, ClientSecurityQos, RemoteSession, ClientContext) {
        result := DllCall("ntoskrnl.exe\SeCreateClientSecurity", "ptr", ClientThread, "ptr", ClientSecurityQos, "char", RemoteSession, "ptr", ClientContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SECURITY_CLIENT_CONTEXT>} ClientContext 
     * @param {PETHREAD} ServerThread 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeImpersonateClient(ClientContext, ServerThread) {
        DllCall("ntoskrnl.exe\SeImpersonateClient", "ptr", ClientContext, "ptr", ServerThread)
    }

    /**
     * 
     * @param {Pointer<SECURITY_CLIENT_CONTEXT>} ClientContext 
     * @param {PETHREAD} ServerThread 
     * @returns {NTSTATUS} 
     */
    static SeImpersonateClientEx(ClientContext, ServerThread) {
        result := DllCall("ntoskrnl.exe\SeImpersonateClientEx", "ptr", ClientContext, "ptr", ServerThread, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
     * @param {Pointer<SECURITY_QUALITY_OF_SERVICE>} ClientSecurityQos 
     * @param {BOOLEAN} ServerIsRemote 
     * @param {Pointer<SECURITY_CLIENT_CONTEXT>} ClientContext 
     * @returns {NTSTATUS} 
     */
    static SeCreateClientSecurityFromSubjectContext(SubjectContext, ClientSecurityQos, ServerIsRemote, ClientContext) {
        result := DllCall("ntoskrnl.exe\SeCreateClientSecurityFromSubjectContext", "ptr", SubjectContext, "ptr", ClientSecurityQos, "char", ServerIsRemote, "ptr", ClientContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SecurityInformation 
     * @param {Pointer} SecurityDescriptor 
     * @param {Pointer<Integer>} Length 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ObjectsSecurityDescriptor 
     * @returns {NTSTATUS} 
     */
    static SeQuerySecurityDescriptorInfo(SecurityInformation, SecurityDescriptor, Length, ObjectsSecurityDescriptor) {
        SecurityInformationMarshal := SecurityInformation is VarRef ? "uint*" : "ptr"
        LengthMarshal := Length is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeQuerySecurityDescriptorInfo", SecurityInformationMarshal, SecurityInformation, "ptr", SecurityDescriptor, LengthMarshal, Length, "ptr", ObjectsSecurityDescriptor, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<Integer>} SecurityInformation 
     * @param {PSECURITY_DESCRIPTOR} ModificationDescriptor 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ObjectsSecurityDescriptor 
     * @param {Integer} PoolType 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @returns {NTSTATUS} 
     */
    static SeSetSecurityDescriptorInfo(Object_R, SecurityInformation, ModificationDescriptor, ObjectsSecurityDescriptor, PoolType, GenericMapping) {
        ModificationDescriptor := ModificationDescriptor is Win32Handle ? NumGet(ModificationDescriptor, "ptr") : ModificationDescriptor

        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        SecurityInformationMarshal := SecurityInformation is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeSetSecurityDescriptorInfo", Object_RMarshal, Object_R, SecurityInformationMarshal, SecurityInformation, "ptr", ModificationDescriptor, "ptr", ObjectsSecurityDescriptor, "int", PoolType, "ptr", GenericMapping, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<Integer>} SecurityInformation 
     * @param {PSECURITY_DESCRIPTOR} ModificationDescriptor 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ObjectsSecurityDescriptor 
     * @param {Integer} AutoInheritFlags 
     * @param {Integer} PoolType 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @returns {NTSTATUS} 
     */
    static SeSetSecurityDescriptorInfoEx(Object_R, SecurityInformation, ModificationDescriptor, ObjectsSecurityDescriptor, AutoInheritFlags, PoolType, GenericMapping) {
        ModificationDescriptor := ModificationDescriptor is Win32Handle ? NumGet(ModificationDescriptor, "ptr") : ModificationDescriptor

        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        SecurityInformationMarshal := SecurityInformation is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeSetSecurityDescriptorInfoEx", Object_RMarshal, Object_R, SecurityInformationMarshal, SecurityInformation, "ptr", ModificationDescriptor, "ptr", ObjectsSecurityDescriptor, "uint", AutoInheritFlags, "int", PoolType, "ptr", GenericMapping, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ACCESS_STATE>} AccessState 
     * @param {Pointer<PRIVILEGE_SET>} Privileges 
     * @returns {NTSTATUS} 
     */
    static SeAppendPrivileges(AccessState, Privileges) {
        result := DllCall("ntoskrnl.exe\SeAppendPrivileges", "ptr", AccessState, "ptr", Privileges, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} FileName 
     * @param {Pointer<UNICODE_STRING>} LinkName 
     * @param {BOOLEAN} bSuccess 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeAuditHardLinkCreation(FileName, LinkName, bSuccess) {
        DllCall("ntoskrnl.exe\SeAuditHardLinkCreation", "ptr", FileName, "ptr", LinkName, "char", bSuccess)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} FileName 
     * @param {Pointer<UNICODE_STRING>} LinkName 
     * @param {BOOLEAN} bSuccess 
     * @param {Pointer<Guid>} TransactionId 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeAuditHardLinkCreationWithTransaction(FileName, LinkName, bSuccess, TransactionId) {
        DllCall("ntoskrnl.exe\SeAuditHardLinkCreationWithTransaction", "ptr", FileName, "ptr", LinkName, "char", bSuccess, "ptr", TransactionId)
    }

    /**
     * 
     * @param {BOOLEAN} bSuccess 
     * @param {Integer} SelftestCode 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeAuditFipsCryptoSelftests(bSuccess, SelftestCode) {
        DllCall("ntoskrnl.exe\SeAuditFipsCryptoSelftests", "char", bSuccess, "uint", SelftestCode)
    }

    /**
     * 
     * @param {Pointer<Guid>} TransactionId 
     * @param {Pointer<Guid>} ResourceManagerId 
     * @param {Integer} NewTransactionState 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeAuditTransactionStateChange(TransactionId, ResourceManagerId, NewTransactionState) {
        DllCall("ntoskrnl.exe\SeAuditTransactionStateChange", "ptr", TransactionId, "ptr", ResourceManagerId, "uint", NewTransactionState)
    }

    /**
     * 
     * @param {BOOLEAN} AccessGranted 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @returns {BOOLEAN} 
     */
    static SeAuditingFileEvents(AccessGranted, SecurityDescriptor) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ntoskrnl.exe\SeAuditingFileEvents", "char", AccessGranted, "ptr", SecurityDescriptor, "char")
        return result
    }

    /**
     * 
     * @param {BOOLEAN} AccessGranted 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
     * @returns {BOOLEAN} 
     */
    static SeAuditingFileEventsWithContext(AccessGranted, SecurityDescriptor, SubjectSecurityContext) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ntoskrnl.exe\SeAuditingFileEventsWithContext", "char", AccessGranted, "ptr", SecurityDescriptor, "ptr", SubjectSecurityContext, "char")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
     * @returns {BOOLEAN} 
     */
    static SeAuditingAnyFileEventsWithContext(SecurityDescriptor, SubjectSecurityContext) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ntoskrnl.exe\SeAuditingAnyFileEventsWithContext", "ptr", SecurityDescriptor, "ptr", SubjectSecurityContext, "char")
        return result
    }

    /**
     * 
     * @param {BOOLEAN} AccessGranted 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
     * @param {Pointer<BOOLEAN>} StagingEnabled 
     * @returns {BOOLEAN} 
     */
    static SeAuditingFileEventsWithContextEx(AccessGranted, SecurityDescriptor, SubjectSecurityContext, StagingEnabled) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        StagingEnabledMarshal := StagingEnabled is VarRef ? "char*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeAuditingFileEventsWithContextEx", "char", AccessGranted, "ptr", SecurityDescriptor, "ptr", SubjectSecurityContext, StagingEnabledMarshal, StagingEnabled, "char")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
     * @param {Pointer<BOOLEAN>} StagingEnabled 
     * @returns {BOOLEAN} 
     */
    static SeAuditingAnyFileEventsWithContextEx(SecurityDescriptor, SubjectSecurityContext, StagingEnabled) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        StagingEnabledMarshal := StagingEnabled is VarRef ? "char*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeAuditingAnyFileEventsWithContextEx", "ptr", SecurityDescriptor, "ptr", SubjectSecurityContext, StagingEnabledMarshal, StagingEnabled, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ObjectType 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<ACCESS_STATE>} AccessState 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeAdjustAccessStateForTrustLabel(ObjectType, SecurityDescriptor, AccessState) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        ObjectTypeMarshal := ObjectType is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\SeAdjustAccessStateForTrustLabel", ObjectTypeMarshal, ObjectType, "ptr", SecurityDescriptor, "ptr", AccessState)
    }

    /**
     * 
     * @param {Pointer<Void>} ObjectType 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<ACCESS_STATE>} AccessState 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeAdjustAccessStateForAccessConstraints(ObjectType, SecurityDescriptor, AccessState) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        ObjectTypeMarshal := ObjectType is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\SeAdjustAccessStateForAccessConstraints", ObjectTypeMarshal, ObjectType, "ptr", SecurityDescriptor, "ptr", AccessState)
    }

    /**
     * 
     * @param {Pointer<Void>} ObjectType 
     * @param {PSECURITY_DESCRIPTOR} ChildDescriptor 
     * @param {Pointer<ACCESS_STATE>} AccessState 
     * @returns {BOOLEAN} 
     */
    static SeShouldCheckForAccessRightsFromParent(ObjectType, ChildDescriptor, AccessState) {
        ChildDescriptor := ChildDescriptor is Win32Handle ? NumGet(ChildDescriptor, "ptr") : ChildDescriptor

        ObjectTypeMarshal := ObjectType is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\SeShouldCheckForAccessRightsFromParent", ObjectTypeMarshal, ObjectType, "ptr", ChildDescriptor, "ptr", AccessState, "char")
        return result
    }

    /**
     * 
     * @param {BOOLEAN} AccessGranted 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @returns {BOOLEAN} 
     */
    static SeAuditingHardLinkEvents(AccessGranted, SecurityDescriptor) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ntoskrnl.exe\SeAuditingHardLinkEvents", "char", AccessGranted, "ptr", SecurityDescriptor, "char")
        return result
    }

    /**
     * 
     * @param {BOOLEAN} AccessGranted 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
     * @returns {BOOLEAN} 
     */
    static SeAuditingHardLinkEventsWithContext(AccessGranted, SecurityDescriptor, SubjectSecurityContext) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ntoskrnl.exe\SeAuditingHardLinkEventsWithContext", "char", AccessGranted, "ptr", SecurityDescriptor, "ptr", SubjectSecurityContext, "char")
        return result
    }

    /**
     * 
     * @param {BOOLEAN} AccessGranted 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
     * @returns {BOOLEAN} 
     */
    static SeAuditingFileOrGlobalEvents(AccessGranted, SecurityDescriptor, SubjectSecurityContext) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ntoskrnl.exe\SeAuditingFileOrGlobalEvents", "char", AccessGranted, "ptr", SecurityDescriptor, "ptr", SubjectSecurityContext, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<ACCESS_STATE>} AccessState 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeSetAccessStateGenericMapping(AccessState, GenericMapping) {
        DllCall("ntoskrnl.exe\SeSetAccessStateGenericMapping", "ptr", AccessState, "ptr", GenericMapping)
    }

    /**
     * 
     * @param {Pointer<PSE_LOGON_SESSION_TERMINATED_ROUTINE>} CallbackRoutine 
     * @returns {NTSTATUS} 
     */
    static SeRegisterLogonSessionTerminatedRoutine(CallbackRoutine) {
        result := DllCall("ntoskrnl.exe\SeRegisterLogonSessionTerminatedRoutine", "ptr", CallbackRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSE_LOGON_SESSION_TERMINATED_ROUTINE>} CallbackRoutine 
     * @returns {NTSTATUS} 
     */
    static SeUnregisterLogonSessionTerminatedRoutine(CallbackRoutine) {
        result := DllCall("ntoskrnl.exe\SeUnregisterLogonSessionTerminatedRoutine", "ptr", CallbackRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSE_LOGON_SESSION_TERMINATED_ROUTINE_EX>} CallbackRoutine 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static SeRegisterLogonSessionTerminatedRoutineEx(CallbackRoutine, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\SeRegisterLogonSessionTerminatedRoutineEx", "ptr", CallbackRoutine, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSE_LOGON_SESSION_TERMINATED_ROUTINE_EX>} CallbackRoutine 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static SeUnregisterLogonSessionTerminatedRoutineEx(CallbackRoutine, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\SeUnregisterLogonSessionTerminatedRoutineEx", "ptr", CallbackRoutine, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<LUID>} LogonId 
     * @returns {NTSTATUS} 
     */
    static SeMarkLogonSessionForTerminationNotification(LogonId) {
        result := DllCall("ntoskrnl.exe\SeMarkLogonSessionForTerminationNotification", "ptr", LogonId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<LUID>} LogonId 
     * @param {PESILO} pServerSilo 
     * @returns {NTSTATUS} 
     */
    static SeMarkLogonSessionForTerminationNotificationEx(LogonId, pServerSilo) {
        result := DllCall("ntoskrnl.exe\SeMarkLogonSessionForTerminationNotificationEx", "ptr", LogonId, "ptr", pServerSilo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Token 
     * @param {Integer} TokenInformationClass 
     * @param {Pointer<Pointer<Void>>} TokenInformation 
     * @returns {NTSTATUS} 
     */
    static SeQueryInformationToken(Token, TokenInformationClass, TokenInformation) {
        TokenMarshal := Token is VarRef ? "ptr" : "ptr"
        TokenInformationMarshal := TokenInformation is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeQueryInformationToken", TokenMarshal, Token, "int", TokenInformationClass, TokenInformationMarshal, TokenInformation, "int")
        return result
    }

    /**
     * 
     * @param {PEPROCESS} Process 
     * @param {Pointer<Pointer<UNICODE_STRING>>} pImageFileName 
     * @returns {NTSTATUS} 
     */
    static SeLocateProcessImageName(Process, pImageFileName) {
        pImageFileNameMarshal := pImageFileName is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeLocateProcessImageName", "ptr", Process, pImageFileNameMarshal, pImageFileName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} Context 
     * @param {Integer} PreviousMode 
     * @returns {BOOLEAN} 
     */
    static RtlIsSandboxedToken(Context, PreviousMode) {
        result := DllCall("ntoskrnl.exe\RtlIsSandboxedToken", "ptr", Context, "char", PreviousMode, "char")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} CurrentDescriptor 
     * @param {PSECURITY_DESCRIPTOR} NewDescriptor 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
     * @param {Pointer<BOOLEAN>} AceRemoved 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeCheckForCriticalAceRemoval(CurrentDescriptor, NewDescriptor, SubjectSecurityContext, AceRemoved) {
        CurrentDescriptor := CurrentDescriptor is Win32Handle ? NumGet(CurrentDescriptor, "ptr") : CurrentDescriptor
        NewDescriptor := NewDescriptor is Win32Handle ? NumGet(NewDescriptor, "ptr") : NewDescriptor

        AceRemovedMarshal := AceRemoved is VarRef ? "char*" : "ptr"

        DllCall("ntoskrnl.exe\SeCheckForCriticalAceRemoval", "ptr", CurrentDescriptor, "ptr", NewDescriptor, "ptr", SubjectSecurityContext, AceRemovedMarshal, AceRemoved)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} ObjectName 
     * @param {PSECURITY_DESCRIPTOR} OriginalDescriptor 
     * @param {PSECURITY_DESCRIPTOR} ProposedDescriptor 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} AdjustedDescriptor 
     * @param {Pointer<BOOLEAN>} ApplyAdjustedDescriptor 
     * @returns {NTSTATUS} 
     */
    static SeAdjustObjectSecurity(ObjectName, OriginalDescriptor, ProposedDescriptor, SubjectSecurityContext, AdjustedDescriptor, ApplyAdjustedDescriptor) {
        OriginalDescriptor := OriginalDescriptor is Win32Handle ? NumGet(OriginalDescriptor, "ptr") : OriginalDescriptor
        ProposedDescriptor := ProposedDescriptor is Win32Handle ? NumGet(ProposedDescriptor, "ptr") : ProposedDescriptor

        ApplyAdjustedDescriptorMarshal := ApplyAdjustedDescriptor is VarRef ? "char*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeAdjustObjectSecurity", "ptr", ObjectName, "ptr", OriginalDescriptor, "ptr", ProposedDescriptor, "ptr", SubjectSecurityContext, "ptr", AdjustedDescriptor, ApplyAdjustedDescriptorMarshal, ApplyAdjustedDescriptor, "int")
        return result
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @param {HANDLE} Token 
     * @returns {NTSTATUS} 
     */
    static PsAssignImpersonationToken(Thread, Token) {
        Token := Token is Win32Handle ? NumGet(Token, "ptr") : Token

        result := DllCall("ntoskrnl.exe\PsAssignImpersonationToken", "ptr", Thread, "ptr", Token, "int")
        return result
    }

    /**
     * 
     * @param {PEPROCESS} Process 
     * @returns {Pointer<Void>} 
     */
    static PsReferencePrimaryToken(Process) {
        result := DllCall("ntoskrnl.exe\PsReferencePrimaryToken", "ptr", Process, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} PrimaryToken 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsDereferencePrimaryToken(PrimaryToken) {
        PrimaryTokenMarshal := PrimaryToken is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\PsDereferencePrimaryToken", PrimaryTokenMarshal, PrimaryToken)
    }

    /**
     * 
     * @param {Pointer<Void>} ImpersonationToken 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsDereferenceImpersonationToken(ImpersonationToken) {
        ImpersonationTokenMarshal := ImpersonationToken is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\PsDereferenceImpersonationToken", ImpersonationTokenMarshal, ImpersonationToken)
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @param {Pointer<BOOLEAN>} CopyOnOpen 
     * @param {Pointer<BOOLEAN>} EffectiveOnly 
     * @param {Pointer<Integer>} ImpersonationLevel 
     * @returns {Pointer<Void>} 
     */
    static PsReferenceImpersonationToken(Thread, CopyOnOpen, EffectiveOnly, ImpersonationLevel) {
        CopyOnOpenMarshal := CopyOnOpen is VarRef ? "char*" : "ptr"
        EffectiveOnlyMarshal := EffectiveOnly is VarRef ? "char*" : "ptr"
        ImpersonationLevelMarshal := ImpersonationLevel is VarRef ? "int*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsReferenceImpersonationToken", "ptr", Thread, CopyOnOpenMarshal, CopyOnOpen, EffectiveOnlyMarshal, EffectiveOnly, ImpersonationLevelMarshal, ImpersonationLevel, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static PsGetProcessExitTime() {
        result := DllCall("ntoskrnl.exe\PsGetProcessExitTime", "int64")
        return result
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @returns {BOOLEAN} 
     */
    static PsIsThreadTerminating(Thread) {
        result := DllCall("ntoskrnl.exe\PsIsThreadTerminating", "ptr", Thread, "char")
        return result
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @param {Pointer<Void>} Token 
     * @param {BOOLEAN} CopyOnOpen 
     * @param {BOOLEAN} EffectiveOnly 
     * @param {Integer} ImpersonationLevel 
     * @returns {NTSTATUS} 
     */
    static PsImpersonateClient(Thread, Token, CopyOnOpen, EffectiveOnly, ImpersonationLevel) {
        TokenMarshal := Token is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\PsImpersonateClient", "ptr", Thread, TokenMarshal, Token, "char", CopyOnOpen, "char", EffectiveOnly, "int", ImpersonationLevel, "int")
        return result
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @param {Pointer<SE_IMPERSONATION_STATE>} ImpersonationState 
     * @returns {BOOLEAN} 
     */
    static PsDisableImpersonation(Thread, ImpersonationState) {
        result := DllCall("ntoskrnl.exe\PsDisableImpersonation", "ptr", Thread, "ptr", ImpersonationState, "char")
        return result
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @param {Pointer<SE_IMPERSONATION_STATE>} ImpersonationState 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsRestoreImpersonation(Thread, ImpersonationState) {
        DllCall("ntoskrnl.exe\PsRestoreImpersonation", "ptr", Thread, "ptr", ImpersonationState)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsRevertToSelf() {
        DllCall("ntoskrnl.exe\PsRevertToSelf")
    }

    /**
     * 
     * @param {HANDLE} ProcessId 
     * @param {Pointer<PEPROCESS>} Process 
     * @returns {NTSTATUS} 
     */
    static PsLookupProcessByProcessId(ProcessId, Process) {
        ProcessId := ProcessId is Win32Handle ? NumGet(ProcessId, "ptr") : ProcessId

        ProcessMarshal := Process is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsLookupProcessByProcessId", "ptr", ProcessId, ProcessMarshal, Process, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ThreadId 
     * @param {Pointer<PETHREAD>} Thread 
     * @returns {NTSTATUS} 
     */
    static PsLookupThreadByThreadId(ThreadId, Thread) {
        ThreadId := ThreadId is Win32Handle ? NumGet(ThreadId, "ptr") : ThreadId

        ThreadMarshal := Thread is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsLookupThreadByThreadId", "ptr", ThreadId, ThreadMarshal, Thread, "int")
        return result
    }

    /**
     * 
     * @param {PEPROCESS} Process 
     * @param {Integer} PoolType 
     * @param {Pointer} Amount 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsChargePoolQuota(Process, PoolType, Amount) {
        DllCall("ntoskrnl.exe\PsChargePoolQuota", "ptr", Process, "int", PoolType, "ptr", Amount)
    }

    /**
     * 
     * @param {PEPROCESS} Process 
     * @param {Integer} PoolType 
     * @param {Pointer} Amount 
     * @returns {NTSTATUS} 
     */
    static PsChargeProcessPoolQuota(Process, PoolType, Amount) {
        result := DllCall("ntoskrnl.exe\PsChargeProcessPoolQuota", "ptr", Process, "int", PoolType, "ptr", Amount, "int")
        return result
    }

    /**
     * 
     * @param {PEPROCESS} Process 
     * @param {Integer} PoolType 
     * @param {Pointer} Amount 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsReturnPoolQuota(Process, PoolType, Amount) {
        DllCall("ntoskrnl.exe\PsReturnPoolQuota", "ptr", Process, "int", PoolType, "ptr", Amount)
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @returns {PEPROCESS} 
     */
    static PsGetThreadProcess(Thread) {
        result := DllCall("ntoskrnl.exe\PsGetThreadProcess", "ptr", Thread, "ptr")
        return result
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @returns {BOOLEAN} 
     */
    static PsIsSystemThread(Thread) {
        result := DllCall("ntoskrnl.exe\PsIsSystemThread", "ptr", Thread, "char")
        return result
    }

    /**
     * 
     * @param {PEPROCESS} Process 
     * @param {Integer} BytesRead 
     * @param {Integer} BytesWritten 
     * @param {Integer} ReadOperationCount 
     * @param {Integer} WriteOperationCount 
     * @param {Integer} FlushOperationCount 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsUpdateDiskCounters(Process, BytesRead, BytesWritten, ReadOperationCount, WriteOperationCount, FlushOperationCount) {
        DllCall("ntoskrnl.exe\PsUpdateDiskCounters", "ptr", Process, "uint", BytesRead, "uint", BytesWritten, "uint", ReadOperationCount, "uint", WriteOperationCount, "uint", FlushOperationCount)
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static PsIsDiskCountersEnabled() {
        result := DllCall("ntoskrnl.exe\PsIsDiskCountersEnabled", "char")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} FilterDriverObject 
     * @param {Pointer<FS_FILTER_CALLBACKS>} Callbacks 
     * @returns {NTSTATUS} 
     */
    static FsRtlRegisterFileSystemFilterCallbacks(FilterDriverObject, Callbacks) {
        result := DllCall("ntoskrnl.exe\FsRtlRegisterFileSystemFilterCallbacks", "ptr", FilterDriverObject, "ptr", Callbacks, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Irql 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoAcquireVpbSpinLock(Irql) {
        IrqlMarshal := Irql is VarRef ? "char*" : "ptr"

        DllCall("ntoskrnl.exe\IoAcquireVpbSpinLock", IrqlMarshal, Irql)
    }

    /**
     * 
     * @param {Pointer<Integer>} DesiredAccess 
     * @param {Integer} GrantedAccess 
     * @returns {NTSTATUS} 
     */
    static IoCheckDesiredAccess(DesiredAccess, GrantedAccess) {
        DesiredAccessMarshal := DesiredAccess is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoCheckDesiredAccess", DesiredAccessMarshal, DesiredAccess, "uint", GrantedAccess, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_FULL_EA_INFORMATION>} EaBuffer 
     * @param {Integer} EaLength 
     * @param {Pointer<Integer>} ErrorOffset 
     * @returns {NTSTATUS} 
     */
    static IoCheckEaBufferValidity(EaBuffer, EaLength, ErrorOffset) {
        ErrorOffsetMarshal := ErrorOffset is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoCheckEaBufferValidity", "ptr", EaBuffer, "uint", EaLength, ErrorOffsetMarshal, ErrorOffset, "int")
        return result
    }

    /**
     * 
     * @param {Integer} GrantedAccess 
     * @param {Integer} MajorFunction 
     * @param {Integer} MinorFunction 
     * @param {Integer} IoControlCode 
     * @param {Pointer<Void>} Arg1 
     * @param {Pointer<Void>} Arg2 
     * @returns {NTSTATUS} 
     */
    static IoCheckFunctionAccess(GrantedAccess, MajorFunction, MinorFunction, IoControlCode, Arg1, Arg2) {
        Arg1Marshal := Arg1 is VarRef ? "ptr" : "ptr"
        Arg2Marshal := Arg2 is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoCheckFunctionAccess", "uint", GrantedAccess, "char", MajorFunction, "char", MinorFunction, "uint", IoControlCode, Arg1Marshal, Arg1, Arg2Marshal, Arg2, "int")
        return result
    }

    /**
     * 
     * @param {Integer} FileInformationClass 
     * @param {Integer} Length 
     * @param {BOOLEAN} SetOperation 
     * @returns {NTSTATUS} 
     */
    static IoCheckQuerySetFileInformation(FileInformationClass, Length, SetOperation) {
        result := DllCall("ntoskrnl.exe\IoCheckQuerySetFileInformation", "int", FileInformationClass, "uint", Length, "char", SetOperation, "int")
        return result
    }

    /**
     * 
     * @param {Integer} FsInformationClass 
     * @param {Integer} Length 
     * @param {BOOLEAN} SetOperation 
     * @returns {NTSTATUS} 
     */
    static IoCheckQuerySetVolumeInformation(FsInformationClass, Length, SetOperation) {
        result := DllCall("ntoskrnl.exe\IoCheckQuerySetVolumeInformation", "int", FsInformationClass, "uint", Length, "char", SetOperation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_QUOTA_INFORMATION>} QuotaBuffer 
     * @param {Integer} QuotaLength 
     * @param {Pointer<Integer>} ErrorOffset 
     * @returns {NTSTATUS} 
     */
    static IoCheckQuotaBufferValidity(QuotaBuffer, QuotaLength, ErrorOffset) {
        ErrorOffsetMarshal := ErrorOffset is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoCheckQuotaBufferValidity", "ptr", QuotaBuffer, "uint", QuotaLength, ErrorOffsetMarshal, ErrorOffset, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {Pointer<FILE_OBJECT>} 
     */
    static IoCreateStreamFileObject(FileObject, DeviceObject) {
        result := DllCall("ntoskrnl.exe\IoCreateStreamFileObject", "ptr", FileObject, "ptr", DeviceObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<HANDLE>} FileHandle 
     * @returns {Pointer<FILE_OBJECT>} 
     */
    static IoCreateStreamFileObjectEx(FileObject, DeviceObject, FileHandle) {
        result := DllCall("ntoskrnl.exe\IoCreateStreamFileObjectEx", "ptr", FileObject, "ptr", DeviceObject, "ptr", FileHandle, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {Pointer<FILE_OBJECT>} 
     */
    static IoCreateStreamFileObjectLite(FileObject, DeviceObject) {
        result := DllCall("ntoskrnl.exe\IoCreateStreamFileObjectLite", "ptr", FileObject, "ptr", DeviceObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<IO_CREATE_STREAM_FILE_OPTIONS>} CreateOptions 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<Pointer<FILE_OBJECT>>} StreamFileObject 
     * @param {Pointer<HANDLE>} FileHandle 
     * @returns {NTSTATUS} 
     */
    static IoCreateStreamFileObjectEx2(CreateOptions, FileObject, DeviceObject, StreamFileObject, FileHandle) {
        StreamFileObjectMarshal := StreamFileObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoCreateStreamFileObjectEx2", "ptr", CreateOptions, "ptr", FileObject, "ptr", DeviceObject, StreamFileObjectMarshal, StreamFileObject, "ptr", FileHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Integer} DesiredAccess 
     * @param {Integer} OpenOptions 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {Pointer<FILE_NETWORK_OPEN_INFORMATION>} Buffer_R 
     * @returns {BOOLEAN} 
     */
    static IoFastQueryNetworkAttributes(ObjectAttributes, DesiredAccess, OpenOptions, IoStatus, Buffer_R) {
        result := DllCall("ntoskrnl.exe\IoFastQueryNetworkAttributes", "ptr", ObjectAttributes, "uint", DesiredAccess, "uint", OpenOptions, "ptr", IoStatus, "ptr", Buffer_R, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @param {Pointer<Integer>} StartingOffset 
     * @param {Pointer<KEVENT>} Event 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @returns {NTSTATUS} 
     */
    static IoPageRead(FileObject, MemoryDescriptorList, StartingOffset, Event, IoStatusBlock) {
        StartingOffsetMarshal := StartingOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoPageRead", "ptr", FileObject, "ptr", MemoryDescriptorList, StartingOffsetMarshal, StartingOffset, "ptr", Event, "ptr", IoStatusBlock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {Pointer<DEVICE_OBJECT>} 
     */
    static IoGetAttachedDevice(DeviceObject) {
        result := DllCall("ntoskrnl.exe\IoGetAttachedDevice", "ptr", DeviceObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {Pointer<DEVICE_OBJECT>} 
     */
    static IoGetBaseFileSystemDeviceObject(FileObject) {
        result := DllCall("ntoskrnl.exe\IoGetBaseFileSystemDeviceObject", "ptr", FileObject, "ptr")
        return result
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @returns {Pointer<DEVICE_OBJECT>} 
     */
    static IoGetDeviceToVerify(Thread) {
        result := DllCall("ntoskrnl.exe\IoGetDeviceToVerify", "ptr", Thread, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {Integer} 
     */
    static IoGetRequestorProcessId(Irp) {
        result := DllCall("ntoskrnl.exe\IoGetRequestorProcessId", "ptr", Irp, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {PEPROCESS} 
     */
    static IoGetRequestorProcess(Irp) {
        result := DllCall("ntoskrnl.exe\IoGetRequestorProcess", "ptr", Irp, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {BOOLEAN} 
     */
    static IoIsOperationSynchronous(Irp) {
        result := DllCall("ntoskrnl.exe\IoIsOperationSynchronous", "ptr", Irp, "char")
        return result
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @returns {BOOLEAN} 
     */
    static IoIsSystemThread(Thread) {
        result := DllCall("ntoskrnl.exe\IoIsSystemThread", "ptr", Thread, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<REPARSE_DATA_BUFFER>} ReparseBuffer 
     * @returns {BOOLEAN} 
     */
    static IoIsValidNameGraftingBuffer(Irp, ReparseBuffer) {
        result := DllCall("ntoskrnl.exe\IoIsValidNameGraftingBuffer", "ptr", Irp, "ptr", ReparseBuffer, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Pointer<OBJECT_NAME_INFORMATION>>} ObjectNameInformation 
     * @returns {NTSTATUS} 
     */
    static IoQueryFileDosDeviceName(FileObject, ObjectNameInformation) {
        ObjectNameInformationMarshal := ObjectNameInformation is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoQueryFileDosDeviceName", "ptr", FileObject, ObjectNameInformationMarshal, ObjectNameInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} FileInformationClass 
     * @param {Integer} Length 
     * @param {Pointer<Void>} FileInformation 
     * @param {Pointer<Integer>} ReturnedLength 
     * @returns {NTSTATUS} 
     */
    static IoQueryFileInformation(FileObject, FileInformationClass, Length, FileInformation, ReturnedLength) {
        FileInformationMarshal := FileInformation is VarRef ? "ptr" : "ptr"
        ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoQueryFileInformation", "ptr", FileObject, "int", FileInformationClass, "uint", Length, FileInformationMarshal, FileInformation, ReturnedLengthMarshal, ReturnedLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} FsInformationClass 
     * @param {Integer} Length 
     * @param {Pointer<Void>} FsInformation 
     * @param {Pointer<Integer>} ReturnedLength 
     * @returns {NTSTATUS} 
     */
    static IoQueryVolumeInformation(FileObject, FsInformationClass, Length, FsInformation, ReturnedLength) {
        FsInformationMarshal := FsInformation is VarRef ? "ptr" : "ptr"
        ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoQueryVolumeInformation", "ptr", FileObject, "int", FsInformationClass, "uint", Length, FsInformationMarshal, FsInformation, ReturnedLengthMarshal, ReturnedLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoQueueThreadIrp(Irp) {
        DllCall("ntoskrnl.exe\IoQueueThreadIrp", "ptr", Irp)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoRegisterFileSystem(DeviceObject) {
        DllCall("ntoskrnl.exe\IoRegisterFileSystem", "ptr", DeviceObject)
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DRIVER_FS_NOTIFICATION>} DriverNotificationRoutine 
     * @returns {NTSTATUS} 
     */
    static IoRegisterFsRegistrationChange(DriverObject, DriverNotificationRoutine) {
        result := DllCall("ntoskrnl.exe\IoRegisterFsRegistrationChange", "ptr", DriverObject, "ptr", DriverNotificationRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DRIVER_FS_NOTIFICATION>} DriverNotificationRoutine 
     * @param {BOOLEAN} SynchronizeWithMounts 
     * @returns {NTSTATUS} 
     */
    static IoRegisterFsRegistrationChangeMountAware(DriverObject, DriverNotificationRoutine, SynchronizeWithMounts) {
        result := DllCall("ntoskrnl.exe\IoRegisterFsRegistrationChangeMountAware", "ptr", DriverObject, "ptr", DriverNotificationRoutine, "char", SynchronizeWithMounts, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} DriverObjectList 
     * @param {Integer} DriverObjectListSize 
     * @param {Pointer<Integer>} ActualNumberDriverObjects 
     * @returns {NTSTATUS} 
     */
    static IoEnumerateRegisteredFiltersList(DriverObjectList, DriverObjectListSize, ActualNumberDriverObjects) {
        ActualNumberDriverObjectsMarshal := ActualNumberDriverObjects is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoEnumerateRegisteredFiltersList", "ptr", DriverObjectList, "uint", DriverObjectListSize, ActualNumberDriverObjectsMarshal, ActualNumberDriverObjects, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer} NewFileName 
     * @param {Integer} FileNameLength 
     * @returns {NTSTATUS} 
     */
    static IoReplaceFileObjectName(FileObject, NewFileName, FileNameLength) {
        result := DllCall("ntoskrnl.exe\IoReplaceFileObjectName", "ptr", FileObject, "ptr", NewFileName, "ushort", FileNameLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Irql 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoReleaseVpbSpinLock(Irql) {
        DllCall("ntoskrnl.exe\IoReleaseVpbSpinLock", "char", Irql)
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoSetDeviceToVerify(Thread, DeviceObject) {
        DllCall("ntoskrnl.exe\IoSetDeviceToVerify", "ptr", Thread, "ptr", DeviceObject)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} FileInformationClass 
     * @param {Integer} Length 
     * @param {Pointer<Void>} FileInformation 
     * @returns {NTSTATUS} 
     */
    static IoSetInformation(FileObject, FileInformationClass, Length, FileInformation) {
        FileInformationMarshal := FileInformation is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoSetInformation", "ptr", FileObject, "int", FileInformationClass, "uint", Length, FileInformationMarshal, FileInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @param {Pointer<Integer>} StartingOffset 
     * @param {Pointer<KEVENT>} Event 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @returns {NTSTATUS} 
     */
    static IoSynchronousPageWrite(FileObject, MemoryDescriptorList, StartingOffset, Event, IoStatusBlock) {
        StartingOffsetMarshal := StartingOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoSynchronousPageWrite", "ptr", FileObject, "ptr", MemoryDescriptorList, StartingOffsetMarshal, StartingOffset, "ptr", Event, "ptr", IoStatusBlock, "int")
        return result
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @returns {PEPROCESS} 
     */
    static IoThreadToProcess(Thread) {
        result := DllCall("ntoskrnl.exe\IoThreadToProcess", "ptr", Thread, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoUnregisterFileSystem(DeviceObject) {
        DllCall("ntoskrnl.exe\IoUnregisterFileSystem", "ptr", DeviceObject)
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DRIVER_FS_NOTIFICATION>} DriverNotificationRoutine 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoUnregisterFsRegistrationChange(DriverObject, DriverNotificationRoutine) {
        DllCall("ntoskrnl.exe\IoUnregisterFsRegistrationChange", "ptr", DriverObject, "ptr", DriverNotificationRoutine)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {BOOLEAN} AllowRawMount 
     * @returns {NTSTATUS} 
     */
    static IoVerifyVolume(DeviceObject, AllowRawMount) {
        result := DllCall("ntoskrnl.exe\IoVerifyVolume", "ptr", DeviceObject, "char", AllowRawMount, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Integer>} pSessionId 
     * @returns {NTSTATUS} 
     */
    static IoGetRequestorSessionId(Irp, pSessionId) {
        pSessionIdMarshal := pSessionId is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetRequestorSessionId", "ptr", Irp, pSessionIdMarshal, pSessionId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer} DeviceObjectList 
     * @param {Integer} DeviceObjectListSize 
     * @param {Pointer<Integer>} ActualNumberDeviceObjects 
     * @returns {NTSTATUS} 
     */
    static IoEnumerateDeviceObjectList(DriverObject, DeviceObjectList, DeviceObjectListSize, ActualNumberDeviceObjects) {
        ActualNumberDeviceObjectsMarshal := ActualNumberDeviceObjects is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoEnumerateDeviceObjectList", "ptr", DriverObject, "ptr", DeviceObjectList, "uint", DeviceObjectListSize, ActualNumberDeviceObjectsMarshal, ActualNumberDeviceObjects, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {Pointer<DEVICE_OBJECT>} 
     */
    static IoGetLowerDeviceObject(DeviceObject) {
        result := DllCall("ntoskrnl.exe\IoGetLowerDeviceObject", "ptr", DeviceObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {Pointer<DEVICE_OBJECT>} 
     */
    static IoGetDeviceAttachmentBaseRef(DeviceObject) {
        result := DllCall("ntoskrnl.exe\IoGetDeviceAttachmentBaseRef", "ptr", DeviceObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} FileSystemDeviceObject 
     * @param {Pointer<Pointer<DEVICE_OBJECT>>} DiskDeviceObject 
     * @returns {NTSTATUS} 
     */
    static IoGetDiskDeviceObject(FileSystemDeviceObject, DiskDeviceObject) {
        DiskDeviceObjectMarshal := DiskDeviceObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetDiskDeviceObject", "ptr", FileSystemDeviceObject, DiskDeviceObjectMarshal, DiskDeviceObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {PETHREAD} Thread 
     * @param {Pointer<IO_PRIORITY_INFO>} PriorityInfo 
     * @returns {NTSTATUS} 
     */
    static IoRetrievePriorityInfo(Irp, FileObject, Thread, PriorityInfo) {
        result := DllCall("ntoskrnl.exe\IoRetrievePriorityInfo", "ptr", Irp, "ptr", FileObject, "ptr", Thread, "ptr", PriorityInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IO_PRIORITY_INFO>} InputPriorityInfo 
     * @param {Pointer<IO_PRIORITY_INFO>} OutputPriorityInfo 
     * @param {PETHREAD} Thread 
     * @returns {NTSTATUS} 
     */
    static IoApplyPriorityInfoThread(InputPriorityInfo, OutputPriorityInfo, Thread) {
        result := DllCall("ntoskrnl.exe\IoApplyPriorityInfoThread", "ptr", InputPriorityInfo, "ptr", OutputPriorityInfo, "ptr", Thread, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Pointer<IO_IRP_EXT_TRACK_OFFSET_HEADER>>} RetFsTrackOffsetBlob 
     * @param {Pointer<Integer>} RetTrackedOffset 
     * @returns {NTSTATUS} 
     */
    static IoGetFsTrackOffsetState(Irp, RetFsTrackOffsetBlob, RetTrackedOffset) {
        RetFsTrackOffsetBlobMarshal := RetFsTrackOffsetBlob is VarRef ? "ptr*" : "ptr"
        RetTrackedOffsetMarshal := RetTrackedOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetFsTrackOffsetState", "ptr", Irp, RetFsTrackOffsetBlobMarshal, RetFsTrackOffsetBlob, RetTrackedOffsetMarshal, RetTrackedOffset, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<IO_IRP_EXT_TRACK_OFFSET_HEADER>} FsTrackOffsetBlob 
     * @param {Integer} TrackedOffset 
     * @returns {NTSTATUS} 
     */
    static IoSetFsTrackOffsetState(Irp, FsTrackOffsetBlob, TrackedOffset) {
        result := DllCall("ntoskrnl.exe\IoSetFsTrackOffsetState", "ptr", Irp, "ptr", FsTrackOffsetBlob, "int64", TrackedOffset, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {NTSTATUS} 
     */
    static IoClearFsTrackOffsetState(Irp) {
        result := DllCall("ntoskrnl.exe\IoClearFsTrackOffsetState", "ptr", Irp, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {BOOLEAN} 
     */
    static IoIrpHasFsTrackOffsetExtensionType(Irp) {
        result := DllCall("ntoskrnl.exe\IoIrpHasFsTrackOffsetExtensionType", "ptr", Irp, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<WORK_QUEUE_ITEM>} WorkItem 
     * @returns {NTSTATUS} 
     */
    static PoQueueShutdownWorkItem(WorkItem) {
        result := DllCall("ntoskrnl.exe\PoQueueShutdownWorkItem", "ptr", WorkItem, "int")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static MmIsRecursiveIoFault() {
        result := DllCall("ntoskrnl.exe\MmIsRecursiveIoFault", "char")
        return result
    }

    /**
     * 
     * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
     * @param {BOOLEAN} DelayClose 
     * @returns {BOOLEAN} 
     */
    static MmForceSectionClosed(SectionObjectPointer, DelayClose) {
        result := DllCall("ntoskrnl.exe\MmForceSectionClosed", "ptr", SectionObjectPointer, "char", DelayClose, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
     * @param {Integer} ForceCloseFlags 
     * @returns {BOOLEAN} 
     */
    static MmForceSectionClosedEx(SectionObjectPointer, ForceCloseFlags) {
        result := DllCall("ntoskrnl.exe\MmForceSectionClosedEx", "ptr", SectionObjectPointer, "uint", ForceCloseFlags, "char")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static MmGetMaximumFileSectionSize() {
        result := DllCall("ntoskrnl.exe\MmGetMaximumFileSectionSize", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
     * @param {Integer} FlushType 
     * @returns {BOOLEAN} 
     */
    static MmFlushImageSection(SectionObjectPointer, FlushType) {
        result := DllCall("ntoskrnl.exe\MmFlushImageSection", "ptr", SectionObjectPointer, "int", FlushType, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionPointer 
     * @param {Pointer<Integer>} NewFileSize 
     * @returns {BOOLEAN} 
     */
    static MmCanFileBeTruncated(SectionPointer, NewFileSize) {
        NewFileSizeMarshal := NewFileSize is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmCanFileBeTruncated", "ptr", SectionPointer, NewFileSizeMarshal, NewFileSize, "char")
        return result
    }

    /**
     * 
     * @param {Pointer} Address 
     * @param {Pointer} Length 
     * @returns {BOOLEAN} 
     */
    static MmSetAddressRangeModified(Address, Length) {
        result := DllCall("ntoskrnl.exe\MmSetAddressRangeModified", "ptr", Address, "ptr", Length, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<SECTION_OBJECT_POINTERS>} FsSectionPointer 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} SectionIsActive 
     * @returns {NTSTATUS} 
     */
    static MmIsFileSectionActive(FsSectionPointer, Flags, SectionIsActive) {
        SectionIsActiveMarshal := SectionIsActive is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmIsFileSectionActive", "ptr", FsSectionPointer, "uint", Flags, SectionIsActiveMarshal, SectionIsActive, "int")
        return result
    }

    /**
     * 
     * @param {Integer} NumberOfLists 
     * @param {Pointer<Pointer<READ_LIST>>} ReadLists 
     * @returns {NTSTATUS} 
     */
    static MmPrefetchPages(NumberOfLists, ReadLists) {
        ReadListsMarshal := ReadLists is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmPrefetchPages", "uint", NumberOfLists, ReadListsMarshal, ReadLists, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionPointer 
     * @returns {Integer} 
     */
    static MmDoesFileHaveUserWritableReferences(SectionPointer) {
        result := DllCall("ntoskrnl.exe\MmDoesFileHaveUserWritableReferences", "ptr", SectionPointer, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MDL>} Mdl 
     * @returns {Integer} 
     */
    static MmMdlPagesAreZero(Mdl) {
        result := DllCall("ntoskrnl.exe\MmMdlPagesAreZero", "ptr", Mdl, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<ACCESS_STATE>} PassedAccessState 
     * @param {Integer} DesiredAccess 
     * @param {Integer} ObjectPointerBias 
     * @param {Pointer<Pointer<Void>>} NewObject 
     * @param {Pointer<HANDLE>} Handle 
     * @returns {NTSTATUS} 
     */
    static ObInsertObject(Object_R, PassedAccessState, DesiredAccess, ObjectPointerBias, NewObject, Handle) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        NewObjectMarshal := NewObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\ObInsertObject", Object_RMarshal, Object_R, "ptr", PassedAccessState, "uint", DesiredAccess, "uint", ObjectPointerBias, NewObjectMarshal, NewObject, "ptr", Handle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Integer} HandleAttributes 
     * @param {Pointer<ACCESS_STATE>} PassedAccessState 
     * @param {Integer} DesiredAccess 
     * @param {POBJECT_TYPE} ObjectType 
     * @param {Integer} AccessMode 
     * @param {Pointer<HANDLE>} Handle 
     * @returns {NTSTATUS} 
     */
    static ObOpenObjectByPointer(Object_R, HandleAttributes, PassedAccessState, DesiredAccess, ObjectType, AccessMode, Handle) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ObOpenObjectByPointer", Object_RMarshal, Object_R, "uint", HandleAttributes, "ptr", PassedAccessState, "uint", DesiredAccess, "ptr", ObjectType, "char", AccessMode, "ptr", Handle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Integer} HandleAttributes 
     * @param {Pointer<ACCESS_STATE>} PassedAccessState 
     * @param {Integer} DesiredAccess 
     * @param {POBJECT_TYPE} ObjectType 
     * @param {Integer} AccessMode 
     * @param {Integer} Tag 
     * @param {Pointer<HANDLE>} Handle 
     * @returns {NTSTATUS} 
     */
    static ObOpenObjectByPointerWithTag(Object_R, HandleAttributes, PassedAccessState, DesiredAccess, ObjectType, AccessMode, Tag, Handle) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ObOpenObjectByPointerWithTag", Object_RMarshal, Object_R, "uint", HandleAttributes, "ptr", PassedAccessState, "uint", DesiredAccess, "ptr", ObjectType, "char", AccessMode, "uint", Tag, "ptr", Handle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @returns {String} Nothing - always returns an empty string
     */
    static ObMakeTemporaryObject(Object_R) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\ObMakeTemporaryObject", Object_RMarshal, Object_R)
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer} ObjectNameInfo 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ObQueryNameString(Object_R, ObjectNameInfo, Length, ReturnLength) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\ObQueryNameString", Object_RMarshal, Object_R, "ptr", ObjectNameInfo, "uint", Length, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @returns {BOOLEAN} 
     */
    static ObIsKernelHandle(Handle) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("ntoskrnl.exe\ObIsKernelHandle", "ptr", Handle, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @param {Pointer<BOOLEAN>} GenerateOnClose 
     * @returns {NTSTATUS} 
     */
    static ObQueryObjectAuditingByHandle(Handle, GenerateOnClose) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        GenerateOnCloseMarshal := GenerateOnClose is VarRef ? "char*" : "ptr"

        result := DllCall("ntoskrnl.exe\ObQueryObjectAuditingByHandle", "ptr", Handle, GenerateOnCloseMarshal, GenerateOnClose, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static IoRequestDeviceRemovalForReset(PhysicalDeviceObject, Flags) {
        result := DllCall("ntoskrnl.exe\IoRequestDeviceRemovalForReset", "ptr", PhysicalDeviceObject, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {BOOLEAN} Wait 
     * @param {Integer} LockKey 
     * @param {Pointer} Buffer_R 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    static FsRtlCopyRead(FileObject, FileOffset, Length, Wait, LockKey, Buffer_R, IoStatus, DeviceObject) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlCopyRead", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "char", Wait, "uint", LockKey, "ptr", Buffer_R, "ptr", IoStatus, "ptr", DeviceObject, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {BOOLEAN} Wait 
     * @param {Integer} LockKey 
     * @param {Pointer} Buffer_R 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    static FsRtlCopyWrite(FileObject, FileOffset, Length, Wait, LockKey, Buffer_R, IoStatus, DeviceObject) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlCopyWrite", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "char", Wait, "uint", LockKey, "ptr", Buffer_R, "ptr", IoStatus, "ptr", DeviceObject, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Integer} LockKey 
     * @param {Pointer<Pointer<MDL>>} MdlChain 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @returns {NTSTATUS} 
     */
    static FsRtlMdlReadEx(FileObject, FileOffset, Length, LockKey, MdlChain, IoStatus) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlMdlReadEx", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", LockKey, MdlChainMarshal, MdlChain, "ptr", IoStatus, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Integer} LockKey 
     * @param {Pointer<Pointer<MDL>>} MdlChain 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    static FsRtlMdlReadDev(FileObject, FileOffset, Length, LockKey, MdlChain, IoStatus, DeviceObject) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlMdlReadDev", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", LockKey, MdlChainMarshal, MdlChain, "ptr", IoStatus, "ptr", DeviceObject, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<MDL>} MdlChain 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    static FsRtlMdlReadCompleteDev(FileObject, MdlChain, DeviceObject) {
        result := DllCall("ntoskrnl.exe\FsRtlMdlReadCompleteDev", "ptr", FileObject, "ptr", MdlChain, "ptr", DeviceObject, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Integer} LockKey 
     * @param {Pointer<Pointer<MDL>>} MdlChain 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @returns {NTSTATUS} 
     */
    static FsRtlPrepareMdlWriteEx(FileObject, FileOffset, Length, LockKey, MdlChain, IoStatus) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlPrepareMdlWriteEx", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", LockKey, MdlChainMarshal, MdlChain, "ptr", IoStatus, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Integer} LockKey 
     * @param {Pointer<Pointer<MDL>>} MdlChain 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    static FsRtlPrepareMdlWriteDev(FileObject, FileOffset, Length, LockKey, MdlChain, IoStatus, DeviceObject) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlPrepareMdlWriteDev", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", LockKey, MdlChainMarshal, MdlChain, "ptr", IoStatus, "ptr", DeviceObject, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Pointer<MDL>} MdlChain 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    static FsRtlMdlWriteCompleteDev(FileObject, FileOffset, MdlChain, DeviceObject) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlMdlWriteCompleteDev", "ptr", FileObject, FileOffsetMarshal, FileOffset, "ptr", MdlChain, "ptr", DeviceObject, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlAcquireFileExclusive(FileObject) {
        DllCall("ntoskrnl.exe\FsRtlAcquireFileExclusive", "ptr", FileObject)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlReleaseFile(FileObject) {
        DllCall("ntoskrnl.exe\FsRtlReleaseFile", "ptr", FileObject)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileSize 
     * @returns {NTSTATUS} 
     */
    static FsRtlGetFileSize(FileObject, FileSize) {
        FileSizeMarshal := FileSize is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlGetFileSize", "ptr", FileObject, FileSizeMarshal, FileSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PCOMPLETE_LOCK_IRP_ROUTINE>} CompleteLockIrpRoutine 
     * @param {Pointer<PUNLOCK_ROUTINE>} UnlockRoutine 
     * @returns {Pointer<FILE_LOCK>} 
     */
    static FsRtlAllocateFileLock(CompleteLockIrpRoutine, UnlockRoutine) {
        result := DllCall("ntoskrnl.exe\FsRtlAllocateFileLock", "ptr", CompleteLockIrpRoutine, "ptr", UnlockRoutine, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlFreeFileLock(FileLock) {
        DllCall("ntoskrnl.exe\FsRtlFreeFileLock", "ptr", FileLock)
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {Pointer<PCOMPLETE_LOCK_IRP_ROUTINE>} CompleteLockIrpRoutine 
     * @param {Pointer<PUNLOCK_ROUTINE>} UnlockRoutine 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlInitializeFileLock(FileLock, CompleteLockIrpRoutine, UnlockRoutine) {
        DllCall("ntoskrnl.exe\FsRtlInitializeFileLock", "ptr", FileLock, "ptr", CompleteLockIrpRoutine, "ptr", UnlockRoutine)
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlUninitializeFileLock(FileLock) {
        DllCall("ntoskrnl.exe\FsRtlUninitializeFileLock", "ptr", FileLock)
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static FsRtlProcessFileLock(FileLock, Irp, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlProcessFileLock", "ptr", FileLock, "ptr", Irp, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {Pointer<IRP>} Irp 
     * @returns {BOOLEAN} 
     */
    static FsRtlCheckLockForReadAccess(FileLock, Irp) {
        result := DllCall("ntoskrnl.exe\FsRtlCheckLockForReadAccess", "ptr", FileLock, "ptr", Irp, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {Pointer<IRP>} Irp 
     * @returns {BOOLEAN} 
     */
    static FsRtlCheckLockForWriteAccess(FileLock, Irp) {
        result := DllCall("ntoskrnl.exe\FsRtlCheckLockForWriteAccess", "ptr", FileLock, "ptr", Irp, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {Pointer<Integer>} AllocationSize 
     * @returns {BOOLEAN} 
     */
    static FsRtlCheckLockForOplockRequest(FileLock, AllocationSize) {
        AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlCheckLockForOplockRequest", "ptr", FileLock, AllocationSizeMarshal, AllocationSize, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {Pointer<Integer>} StartingByte 
     * @param {Pointer<Integer>} Length 
     * @param {Integer} Key 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Void>} ProcessId 
     * @returns {BOOLEAN} 
     */
    static FsRtlFastCheckLockForRead(FileLock, StartingByte, Length, Key, FileObject, ProcessId) {
        StartingByteMarshal := StartingByte is VarRef ? "int64*" : "ptr"
        LengthMarshal := Length is VarRef ? "int64*" : "ptr"
        ProcessIdMarshal := ProcessId is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlFastCheckLockForRead", "ptr", FileLock, StartingByteMarshal, StartingByte, LengthMarshal, Length, "uint", Key, "ptr", FileObject, ProcessIdMarshal, ProcessId, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {Pointer<Integer>} StartingByte 
     * @param {Pointer<Integer>} Length 
     * @param {Integer} Key 
     * @param {Pointer<Void>} FileObject 
     * @param {Pointer<Void>} ProcessId 
     * @returns {BOOLEAN} 
     */
    static FsRtlFastCheckLockForWrite(FileLock, StartingByte, Length, Key, FileObject, ProcessId) {
        StartingByteMarshal := StartingByte is VarRef ? "int64*" : "ptr"
        LengthMarshal := Length is VarRef ? "int64*" : "ptr"
        FileObjectMarshal := FileObject is VarRef ? "ptr" : "ptr"
        ProcessIdMarshal := ProcessId is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlFastCheckLockForWrite", "ptr", FileLock, StartingByteMarshal, StartingByte, LengthMarshal, Length, "uint", Key, FileObjectMarshal, FileObject, ProcessIdMarshal, ProcessId, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {BOOLEAN} Restart 
     * @returns {Pointer<FILE_LOCK_INFO>} 
     */
    static FsRtlGetNextFileLock(FileLock, Restart) {
        result := DllCall("ntoskrnl.exe\FsRtlGetNextFileLock", "ptr", FileLock, "char", Restart, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @returns {BOOLEAN} 
     */
    static FsRtlAreThereCurrentOrInProgressFileLocks(FileLock) {
        result := DllCall("ntoskrnl.exe\FsRtlAreThereCurrentOrInProgressFileLocks", "ptr", FileLock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @returns {BOOLEAN} 
     */
    static FsRtlAreThereWaitingFileLocks(FileLock) {
        result := DllCall("ntoskrnl.exe\FsRtlAreThereWaitingFileLocks", "ptr", FileLock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Pointer<Integer>} Length 
     * @param {PEPROCESS} ProcessId 
     * @param {Integer} Key 
     * @param {Pointer<Void>} Context 
     * @param {BOOLEAN} AlreadySynchronized 
     * @returns {NTSTATUS} 
     */
    static FsRtlFastUnlockSingle(FileLock, FileObject, FileOffset, Length, ProcessId, Key, Context, AlreadySynchronized) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        LengthMarshal := Length is VarRef ? "int64*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlFastUnlockSingle", "ptr", FileLock, "ptr", FileObject, FileOffsetMarshal, FileOffset, LengthMarshal, Length, "ptr", ProcessId, "uint", Key, ContextMarshal, Context, "char", AlreadySynchronized, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {PEPROCESS} ProcessId 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static FsRtlFastUnlockAll(FileLock, FileObject, ProcessId, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlFastUnlockAll", "ptr", FileLock, "ptr", FileObject, "ptr", ProcessId, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {PEPROCESS} ProcessId 
     * @param {Integer} Key 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static FsRtlFastUnlockAllByKey(FileLock, FileObject, ProcessId, Key, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlFastUnlockAllByKey", "ptr", FileLock, "ptr", FileObject, "ptr", ProcessId, "uint", Key, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_LOCK>} FileLock 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Pointer<Integer>} Length 
     * @param {PEPROCESS} ProcessId 
     * @param {Integer} Key 
     * @param {BOOLEAN} FailImmediately 
     * @param {BOOLEAN} ExclusiveLock 
     * @param {Pointer<IO_STATUS_BLOCK>} Iosb 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Void>} Context 
     * @param {BOOLEAN} AlreadySynchronized 
     * @returns {BOOLEAN} 
     */
    static FsRtlPrivateLock(FileLock, FileObject, FileOffset, Length, ProcessId, Key, FailImmediately, ExclusiveLock, Iosb, Irp, Context, AlreadySynchronized) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        LengthMarshal := Length is VarRef ? "int64*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlPrivateLock", "ptr", FileLock, "ptr", FileObject, FileOffsetMarshal, FileOffset, LengthMarshal, Length, "ptr", ProcessId, "uint", Key, "char", FailImmediately, "char", ExclusiveLock, "ptr", Iosb, "ptr", Irp, ContextMarshal, Context, "char", AlreadySynchronized, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<TUNNEL>} Cache 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlInitializeTunnelCache(Cache) {
        DllCall("ntoskrnl.exe\FsRtlInitializeTunnelCache", "ptr", Cache)
    }

    /**
     * 
     * @param {Pointer<TUNNEL>} Cache 
     * @param {Integer} DirectoryKey 
     * @param {Pointer<UNICODE_STRING>} ShortName 
     * @param {Pointer<UNICODE_STRING>} LongName 
     * @param {BOOLEAN} KeyByShortName 
     * @param {Integer} DataLength 
     * @param {Pointer} Data 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlAddToTunnelCache(Cache, DirectoryKey, ShortName, LongName, KeyByShortName, DataLength, Data) {
        DllCall("ntoskrnl.exe\FsRtlAddToTunnelCache", "ptr", Cache, "uint", DirectoryKey, "ptr", ShortName, "ptr", LongName, "char", KeyByShortName, "uint", DataLength, "ptr", Data)
    }

    /**
     * 
     * @param {Pointer<TUNNEL>} Cache 
     * @param {Integer} DirectoryKey 
     * @param {Pointer<UNICODE_STRING>} Name 
     * @param {Pointer<UNICODE_STRING>} ShortName 
     * @param {Pointer<UNICODE_STRING>} LongName 
     * @param {Pointer<Integer>} DataLength 
     * @param {Pointer} Data 
     * @returns {BOOLEAN} 
     */
    static FsRtlFindInTunnelCache(Cache, DirectoryKey, Name, ShortName, LongName, DataLength, Data) {
        DataLengthMarshal := DataLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlFindInTunnelCache", "ptr", Cache, "uint", DirectoryKey, "ptr", Name, "ptr", ShortName, "ptr", LongName, DataLengthMarshal, DataLength, "ptr", Data, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<TUNNEL>} Cache 
     * @param {Integer} DirectoryKey 
     * @param {Pointer<UNICODE_STRING>} ShortName 
     * @param {Pointer<UNICODE_STRING>} LongName 
     * @param {Integer} Flags 
     * @param {Integer} DataLength 
     * @param {Pointer} Data 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlAddToTunnelCacheEx(Cache, DirectoryKey, ShortName, LongName, Flags, DataLength, Data) {
        DllCall("ntoskrnl.exe\FsRtlAddToTunnelCacheEx", "ptr", Cache, "uint", DirectoryKey, "ptr", ShortName, "ptr", LongName, "uint", Flags, "uint", DataLength, "ptr", Data)
    }

    /**
     * 
     * @param {Pointer<TUNNEL>} Cache 
     * @param {Integer} DirectoryKey 
     * @param {Pointer<UNICODE_STRING>} Name 
     * @param {Pointer<UNICODE_STRING>} ShortName 
     * @param {Pointer<UNICODE_STRING>} LongName 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} DataLength 
     * @param {Pointer} Data 
     * @returns {BOOLEAN} 
     */
    static FsRtlFindInTunnelCacheEx(Cache, DirectoryKey, Name, ShortName, LongName, Flags, DataLength, Data) {
        DataLengthMarshal := DataLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlFindInTunnelCacheEx", "ptr", Cache, "uint", DirectoryKey, "ptr", Name, "ptr", ShortName, "ptr", LongName, "uint", Flags, DataLengthMarshal, DataLength, "ptr", Data, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<TUNNEL>} Cache 
     * @param {Integer} DirectoryKey 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlDeleteKeyFromTunnelCache(Cache, DirectoryKey) {
        DllCall("ntoskrnl.exe\FsRtlDeleteKeyFromTunnelCache", "ptr", Cache, "uint", DirectoryKey)
    }

    /**
     * 
     * @param {Pointer<TUNNEL>} Cache 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlDeleteTunnelCache(Cache) {
        DllCall("ntoskrnl.exe\FsRtlDeleteTunnelCache", "ptr", Cache)
    }

    /**
     * 
     * @param {STRING} Path 
     * @param {Pointer<STRING>} FirstName 
     * @param {Pointer<STRING>} RemainingName 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlDissectDbcs(Path, FirstName, RemainingName) {
        DllCall("ntoskrnl.exe\FsRtlDissectDbcs", "ptr", Path, "ptr", FirstName, "ptr", RemainingName)
    }

    /**
     * 
     * @param {Pointer<STRING>} Name 
     * @returns {BOOLEAN} 
     */
    static FsRtlDoesDbcsContainWildCards(Name) {
        result := DllCall("ntoskrnl.exe\FsRtlDoesDbcsContainWildCards", "ptr", Name, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} Expression 
     * @param {Pointer<STRING>} Name 
     * @returns {BOOLEAN} 
     */
    static FsRtlIsDbcsInExpression(Expression, Name) {
        result := DllCall("ntoskrnl.exe\FsRtlIsDbcsInExpression", "ptr", Expression, "ptr", Name, "char")
        return result
    }

    /**
     * 
     * @param {STRING} DbcsName 
     * @param {BOOLEAN} WildCardsPermissible 
     * @param {BOOLEAN} PathNamePermissible 
     * @param {BOOLEAN} LeadingBackslashPermissible 
     * @returns {BOOLEAN} 
     */
    static FsRtlIsFatDbcsLegal(DbcsName, WildCardsPermissible, PathNamePermissible, LeadingBackslashPermissible) {
        result := DllCall("ntoskrnl.exe\FsRtlIsFatDbcsLegal", "ptr", DbcsName, "char", WildCardsPermissible, "char", PathNamePermissible, "char", LeadingBackslashPermissible, "char")
        return result
    }

    /**
     * 
     * @param {STRING} DbcsName 
     * @param {BOOLEAN} WildCardsPermissible 
     * @param {BOOLEAN} PathNamePermissible 
     * @param {BOOLEAN} LeadingBackslashPermissible 
     * @returns {BOOLEAN} 
     */
    static FsRtlIsHpfsDbcsLegal(DbcsName, WildCardsPermissible, PathNamePermissible, LeadingBackslashPermissible) {
        result := DllCall("ntoskrnl.exe\FsRtlIsHpfsDbcsLegal", "ptr", DbcsName, "char", WildCardsPermissible, "char", PathNamePermissible, "char", LeadingBackslashPermissible, "char")
        return result
    }

    /**
     * 
     * @param {NTSTATUS} Exception 
     * @param {NTSTATUS} GenericException 
     * @returns {NTSTATUS} 
     */
    static FsRtlNormalizeNtstatus(Exception, GenericException) {
        result := DllCall("ntoskrnl.exe\FsRtlNormalizeNtstatus", "int", Exception, "int", GenericException, "int")
        return result
    }

    /**
     * 
     * @param {NTSTATUS} Exception 
     * @returns {BOOLEAN} 
     */
    static FsRtlIsNtstatusExpected(Exception) {
        result := DllCall("ntoskrnl.exe\FsRtlIsNtstatusExpected", "int", Exception, "char")
        return result
    }

    /**
     * 
     * @returns {Pointer<ERESOURCE>} 
     */
    static FsRtlAllocateResource() {
        result := DllCall("ntoskrnl.exe\FsRtlAllocateResource", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<LARGE_MCB>} Mcb 
     * @param {Integer} PoolType 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlInitializeLargeMcb(Mcb, PoolType) {
        DllCall("ntoskrnl.exe\FsRtlInitializeLargeMcb", "ptr", Mcb, "int", PoolType)
    }

    /**
     * 
     * @param {Pointer<LARGE_MCB>} Mcb 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlUninitializeLargeMcb(Mcb) {
        DllCall("ntoskrnl.exe\FsRtlUninitializeLargeMcb", "ptr", Mcb)
    }

    /**
     * 
     * @param {Pointer<LARGE_MCB>} Mcb 
     * @param {BOOLEAN} SelfSynchronized 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlResetLargeMcb(Mcb, SelfSynchronized) {
        DllCall("ntoskrnl.exe\FsRtlResetLargeMcb", "ptr", Mcb, "char", SelfSynchronized)
    }

    /**
     * 
     * @param {Pointer<LARGE_MCB>} Mcb 
     * @param {Integer} Vbn 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlTruncateLargeMcb(Mcb, Vbn) {
        DllCall("ntoskrnl.exe\FsRtlTruncateLargeMcb", "ptr", Mcb, "int64", Vbn)
    }

    /**
     * 
     * @param {Pointer<LARGE_MCB>} Mcb 
     * @param {Integer} Vbn 
     * @param {Integer} Lbn 
     * @param {Integer} SectorCount 
     * @returns {BOOLEAN} 
     */
    static FsRtlAddLargeMcbEntry(Mcb, Vbn, Lbn, SectorCount) {
        result := DllCall("ntoskrnl.exe\FsRtlAddLargeMcbEntry", "ptr", Mcb, "int64", Vbn, "int64", Lbn, "int64", SectorCount, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<LARGE_MCB>} Mcb 
     * @param {Integer} Vbn 
     * @param {Integer} SectorCount 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlRemoveLargeMcbEntry(Mcb, Vbn, SectorCount) {
        DllCall("ntoskrnl.exe\FsRtlRemoveLargeMcbEntry", "ptr", Mcb, "int64", Vbn, "int64", SectorCount)
    }

    /**
     * 
     * @param {Pointer<LARGE_MCB>} Mcb 
     * @param {Integer} Vbn 
     * @param {Pointer<Integer>} Lbn 
     * @param {Pointer<Integer>} SectorCountFromLbn 
     * @param {Pointer<Integer>} StartingLbn 
     * @param {Pointer<Integer>} SectorCountFromStartingLbn 
     * @param {Pointer<Integer>} Index 
     * @returns {BOOLEAN} 
     */
    static FsRtlLookupLargeMcbEntry(Mcb, Vbn, Lbn, SectorCountFromLbn, StartingLbn, SectorCountFromStartingLbn, Index) {
        LbnMarshal := Lbn is VarRef ? "int64*" : "ptr"
        SectorCountFromLbnMarshal := SectorCountFromLbn is VarRef ? "int64*" : "ptr"
        StartingLbnMarshal := StartingLbn is VarRef ? "int64*" : "ptr"
        SectorCountFromStartingLbnMarshal := SectorCountFromStartingLbn is VarRef ? "int64*" : "ptr"
        IndexMarshal := Index is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlLookupLargeMcbEntry", "ptr", Mcb, "int64", Vbn, LbnMarshal, Lbn, SectorCountFromLbnMarshal, SectorCountFromLbn, StartingLbnMarshal, StartingLbn, SectorCountFromStartingLbnMarshal, SectorCountFromStartingLbn, IndexMarshal, Index, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<LARGE_MCB>} Mcb 
     * @param {Pointer<Integer>} Vbn 
     * @param {Pointer<Integer>} Lbn 
     * @returns {BOOLEAN} 
     */
    static FsRtlLookupLastLargeMcbEntry(Mcb, Vbn, Lbn) {
        VbnMarshal := Vbn is VarRef ? "int64*" : "ptr"
        LbnMarshal := Lbn is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlLookupLastLargeMcbEntry", "ptr", Mcb, VbnMarshal, Vbn, LbnMarshal, Lbn, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<LARGE_MCB>} OpaqueMcb 
     * @param {Pointer<Integer>} LargeVbn 
     * @param {Pointer<Integer>} LargeLbn 
     * @param {Pointer<Integer>} Index 
     * @returns {BOOLEAN} 
     */
    static FsRtlLookupLastLargeMcbEntryAndIndex(OpaqueMcb, LargeVbn, LargeLbn, Index) {
        LargeVbnMarshal := LargeVbn is VarRef ? "int64*" : "ptr"
        LargeLbnMarshal := LargeLbn is VarRef ? "int64*" : "ptr"
        IndexMarshal := Index is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlLookupLastLargeMcbEntryAndIndex", "ptr", OpaqueMcb, LargeVbnMarshal, LargeVbn, LargeLbnMarshal, LargeLbn, IndexMarshal, Index, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<LARGE_MCB>} Mcb 
     * @returns {Integer} 
     */
    static FsRtlNumberOfRunsInLargeMcb(Mcb) {
        result := DllCall("ntoskrnl.exe\FsRtlNumberOfRunsInLargeMcb", "ptr", Mcb, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<LARGE_MCB>} Mcb 
     * @param {Integer} RunIndex 
     * @param {Pointer<Integer>} Vbn 
     * @param {Pointer<Integer>} Lbn 
     * @param {Pointer<Integer>} SectorCount 
     * @returns {BOOLEAN} 
     */
    static FsRtlGetNextLargeMcbEntry(Mcb, RunIndex, Vbn, Lbn, SectorCount) {
        VbnMarshal := Vbn is VarRef ? "int64*" : "ptr"
        LbnMarshal := Lbn is VarRef ? "int64*" : "ptr"
        SectorCountMarshal := SectorCount is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlGetNextLargeMcbEntry", "ptr", Mcb, "uint", RunIndex, VbnMarshal, Vbn, LbnMarshal, Lbn, SectorCountMarshal, SectorCount, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<LARGE_MCB>} Mcb 
     * @param {Integer} Vbn 
     * @param {Integer} Amount 
     * @returns {BOOLEAN} 
     */
    static FsRtlSplitLargeMcb(Mcb, Vbn, Amount) {
        result := DllCall("ntoskrnl.exe\FsRtlSplitLargeMcb", "ptr", Mcb, "int64", Vbn, "int64", Amount, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<BASE_MCB>} Mcb 
     * @param {Integer} PoolType 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlInitializeBaseMcb(Mcb, PoolType) {
        DllCall("ntoskrnl.exe\FsRtlInitializeBaseMcb", "ptr", Mcb, "int", PoolType)
    }

    /**
     * 
     * @param {Pointer<BASE_MCB>} Mcb 
     * @param {Integer} PoolType 
     * @param {Integer} Flags 
     * @returns {BOOLEAN} 
     */
    static FsRtlInitializeBaseMcbEx(Mcb, PoolType, Flags) {
        result := DllCall("ntoskrnl.exe\FsRtlInitializeBaseMcbEx", "ptr", Mcb, "int", PoolType, "ushort", Flags, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<BASE_MCB>} Mcb 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlUninitializeBaseMcb(Mcb) {
        DllCall("ntoskrnl.exe\FsRtlUninitializeBaseMcb", "ptr", Mcb)
    }

    /**
     * 
     * @param {Pointer<BASE_MCB>} Mcb 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlResetBaseMcb(Mcb) {
        DllCall("ntoskrnl.exe\FsRtlResetBaseMcb", "ptr", Mcb)
    }

    /**
     * 
     * @param {Pointer<BASE_MCB>} Mcb 
     * @param {Integer} Vbn 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlTruncateBaseMcb(Mcb, Vbn) {
        DllCall("ntoskrnl.exe\FsRtlTruncateBaseMcb", "ptr", Mcb, "int64", Vbn)
    }

    /**
     * 
     * @param {Pointer<BASE_MCB>} Mcb 
     * @param {Integer} Vbn 
     * @param {Integer} Lbn 
     * @param {Integer} SectorCount 
     * @returns {BOOLEAN} 
     */
    static FsRtlAddBaseMcbEntry(Mcb, Vbn, Lbn, SectorCount) {
        result := DllCall("ntoskrnl.exe\FsRtlAddBaseMcbEntry", "ptr", Mcb, "int64", Vbn, "int64", Lbn, "int64", SectorCount, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<BASE_MCB>} Mcb 
     * @param {Integer} Vbn 
     * @param {Integer} Lbn 
     * @param {Integer} SectorCount 
     * @returns {NTSTATUS} 
     */
    static FsRtlAddBaseMcbEntryEx(Mcb, Vbn, Lbn, SectorCount) {
        result := DllCall("ntoskrnl.exe\FsRtlAddBaseMcbEntryEx", "ptr", Mcb, "int64", Vbn, "int64", Lbn, "int64", SectorCount, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<BASE_MCB>} Mcb 
     * @param {Integer} Vbn 
     * @param {Integer} SectorCount 
     * @returns {BOOLEAN} 
     */
    static FsRtlRemoveBaseMcbEntry(Mcb, Vbn, SectorCount) {
        result := DllCall("ntoskrnl.exe\FsRtlRemoveBaseMcbEntry", "ptr", Mcb, "int64", Vbn, "int64", SectorCount, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<BASE_MCB>} Mcb 
     * @param {Integer} Vbn 
     * @param {Pointer<Integer>} Lbn 
     * @param {Pointer<Integer>} SectorCountFromLbn 
     * @param {Pointer<Integer>} StartingLbn 
     * @param {Pointer<Integer>} SectorCountFromStartingLbn 
     * @param {Pointer<Integer>} Index 
     * @returns {BOOLEAN} 
     */
    static FsRtlLookupBaseMcbEntry(Mcb, Vbn, Lbn, SectorCountFromLbn, StartingLbn, SectorCountFromStartingLbn, Index) {
        LbnMarshal := Lbn is VarRef ? "int64*" : "ptr"
        SectorCountFromLbnMarshal := SectorCountFromLbn is VarRef ? "int64*" : "ptr"
        StartingLbnMarshal := StartingLbn is VarRef ? "int64*" : "ptr"
        SectorCountFromStartingLbnMarshal := SectorCountFromStartingLbn is VarRef ? "int64*" : "ptr"
        IndexMarshal := Index is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlLookupBaseMcbEntry", "ptr", Mcb, "int64", Vbn, LbnMarshal, Lbn, SectorCountFromLbnMarshal, SectorCountFromLbn, StartingLbnMarshal, StartingLbn, SectorCountFromStartingLbnMarshal, SectorCountFromStartingLbn, IndexMarshal, Index, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<BASE_MCB>} Mcb 
     * @param {Pointer<Integer>} Vbn 
     * @param {Pointer<Integer>} Lbn 
     * @returns {BOOLEAN} 
     */
    static FsRtlLookupLastBaseMcbEntry(Mcb, Vbn, Lbn) {
        VbnMarshal := Vbn is VarRef ? "int64*" : "ptr"
        LbnMarshal := Lbn is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlLookupLastBaseMcbEntry", "ptr", Mcb, VbnMarshal, Vbn, LbnMarshal, Lbn, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<BASE_MCB>} OpaqueMcb 
     * @param {Pointer<Integer>} LargeVbn 
     * @param {Pointer<Integer>} LargeLbn 
     * @param {Pointer<Integer>} Index 
     * @returns {BOOLEAN} 
     */
    static FsRtlLookupLastBaseMcbEntryAndIndex(OpaqueMcb, LargeVbn, LargeLbn, Index) {
        LargeVbnMarshal := LargeVbn is VarRef ? "int64*" : "ptr"
        LargeLbnMarshal := LargeLbn is VarRef ? "int64*" : "ptr"
        IndexMarshal := Index is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlLookupLastBaseMcbEntryAndIndex", "ptr", OpaqueMcb, LargeVbnMarshal, LargeVbn, LargeLbnMarshal, LargeLbn, IndexMarshal, Index, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<BASE_MCB>} Mcb 
     * @returns {Integer} 
     */
    static FsRtlNumberOfRunsInBaseMcb(Mcb) {
        result := DllCall("ntoskrnl.exe\FsRtlNumberOfRunsInBaseMcb", "ptr", Mcb, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<BASE_MCB>} Mcb 
     * @param {Integer} RunIndex 
     * @param {Pointer<Integer>} Vbn 
     * @param {Pointer<Integer>} Lbn 
     * @param {Pointer<Integer>} SectorCount 
     * @returns {BOOLEAN} 
     */
    static FsRtlGetNextBaseMcbEntry(Mcb, RunIndex, Vbn, Lbn, SectorCount) {
        VbnMarshal := Vbn is VarRef ? "int64*" : "ptr"
        LbnMarshal := Lbn is VarRef ? "int64*" : "ptr"
        SectorCountMarshal := SectorCount is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlGetNextBaseMcbEntry", "ptr", Mcb, "uint", RunIndex, VbnMarshal, Vbn, LbnMarshal, Lbn, SectorCountMarshal, SectorCount, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<BASE_MCB>} Mcb 
     * @param {Integer} Vbn 
     * @param {Integer} Amount 
     * @returns {BOOLEAN} 
     */
    static FsRtlSplitBaseMcb(Mcb, Vbn, Amount) {
        result := DllCall("ntoskrnl.exe\FsRtlSplitBaseMcb", "ptr", Mcb, "int64", Vbn, "int64", Amount, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<MCB>} Mcb 
     * @param {Integer} PoolType 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlInitializeMcb(Mcb, PoolType) {
        DllCall("ntoskrnl.exe\FsRtlInitializeMcb", "ptr", Mcb, "int", PoolType)
    }

    /**
     * 
     * @param {Pointer<MCB>} Mcb 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlUninitializeMcb(Mcb) {
        DllCall("ntoskrnl.exe\FsRtlUninitializeMcb", "ptr", Mcb)
    }

    /**
     * 
     * @param {Pointer<MCB>} Mcb 
     * @param {Integer} Vbn 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlTruncateMcb(Mcb, Vbn) {
        DllCall("ntoskrnl.exe\FsRtlTruncateMcb", "ptr", Mcb, "uint", Vbn)
    }

    /**
     * 
     * @param {Pointer<MCB>} Mcb 
     * @param {Integer} Vbn 
     * @param {Integer} Lbn 
     * @param {Integer} SectorCount 
     * @returns {BOOLEAN} 
     */
    static FsRtlAddMcbEntry(Mcb, Vbn, Lbn, SectorCount) {
        result := DllCall("ntoskrnl.exe\FsRtlAddMcbEntry", "ptr", Mcb, "uint", Vbn, "uint", Lbn, "uint", SectorCount, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<MCB>} Mcb 
     * @param {Integer} Vbn 
     * @param {Integer} SectorCount 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlRemoveMcbEntry(Mcb, Vbn, SectorCount) {
        DllCall("ntoskrnl.exe\FsRtlRemoveMcbEntry", "ptr", Mcb, "uint", Vbn, "uint", SectorCount)
    }

    /**
     * 
     * @param {Pointer<MCB>} Mcb 
     * @param {Integer} Vbn 
     * @param {Pointer<Integer>} Lbn 
     * @param {Pointer<Integer>} SectorCount 
     * @param {Pointer<Integer>} Index 
     * @returns {BOOLEAN} 
     */
    static FsRtlLookupMcbEntry(Mcb, Vbn, Lbn, SectorCount, Index) {
        LbnMarshal := Lbn is VarRef ? "uint*" : "ptr"
        SectorCountMarshal := SectorCount is VarRef ? "uint*" : "ptr"
        IndexMarshal := Index is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlLookupMcbEntry", "ptr", Mcb, "uint", Vbn, LbnMarshal, Lbn, SectorCountMarshal, SectorCount, IndexMarshal, Index, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<MCB>} Mcb 
     * @param {Pointer<Integer>} Vbn 
     * @param {Pointer<Integer>} Lbn 
     * @returns {BOOLEAN} 
     */
    static FsRtlLookupLastMcbEntry(Mcb, Vbn, Lbn) {
        VbnMarshal := Vbn is VarRef ? "uint*" : "ptr"
        LbnMarshal := Lbn is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlLookupLastMcbEntry", "ptr", Mcb, VbnMarshal, Vbn, LbnMarshal, Lbn, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<MCB>} Mcb 
     * @returns {Integer} 
     */
    static FsRtlNumberOfRunsInMcb(Mcb) {
        result := DllCall("ntoskrnl.exe\FsRtlNumberOfRunsInMcb", "ptr", Mcb, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MCB>} Mcb 
     * @param {Integer} RunIndex 
     * @param {Pointer<Integer>} Vbn 
     * @param {Pointer<Integer>} Lbn 
     * @param {Pointer<Integer>} SectorCount 
     * @returns {BOOLEAN} 
     */
    static FsRtlGetNextMcbEntry(Mcb, RunIndex, Vbn, Lbn, SectorCount) {
        VbnMarshal := Vbn is VarRef ? "uint*" : "ptr"
        LbnMarshal := Lbn is VarRef ? "uint*" : "ptr"
        SectorCountMarshal := SectorCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlGetNextMcbEntry", "ptr", Mcb, "uint", RunIndex, VbnMarshal, Vbn, LbnMarshal, Lbn, SectorCountMarshal, SectorCount, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} TargetDevice 
     * @returns {NTSTATUS} 
     */
    static FsRtlBalanceReads(TargetDevice) {
        result := DllCall("ntoskrnl.exe\FsRtlBalanceReads", "ptr", TargetDevice, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlInitializeOplock(Oplock) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlInitializeOplock", OplockMarshal, Oplock)
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlUninitializeOplock(Oplock) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlUninitializeOplock", OplockMarshal, Oplock)
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<IRP>} Irp 
     * @param {Integer} OpenCount 
     * @returns {NTSTATUS} 
     */
    static FsRtlOplockFsctrl(Oplock, Irp, OpenCount) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlOplockFsctrl", OplockMarshal, Oplock, "ptr", Irp, "uint", OpenCount, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
     * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PostIrpRoutine 
     * @returns {NTSTATUS} 
     */
    static FsRtlCheckOplock(Oplock, Irp, Context, CompletionRoutine, PostIrpRoutine) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlCheckOplock", OplockMarshal, Oplock, "ptr", Irp, ContextMarshal, Context, "ptr", CompletionRoutine, "ptr", PostIrpRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<IRP>} Irp 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
     * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PostIrpRoutine 
     * @returns {NTSTATUS} 
     */
    static FsRtlCheckOplockEx(Oplock, Irp, Flags, Context, CompletionRoutine, PostIrpRoutine) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlCheckOplockEx", OplockMarshal, Oplock, "ptr", Irp, "uint", Flags, ContextMarshal, Context, "ptr", CompletionRoutine, "ptr", PostIrpRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Integer} NewLowerOplockState 
     * @param {Pointer<Void>} CompletionRoutineContext 
     * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
     * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PrePendRoutine 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static FsRtlCheckUpperOplock(Oplock, NewLowerOplockState, CompletionRoutineContext, CompletionRoutine, PrePendRoutine, Flags) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
        CompletionRoutineContextMarshal := CompletionRoutineContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlCheckUpperOplock", OplockMarshal, Oplock, "uint", NewLowerOplockState, CompletionRoutineContextMarshal, CompletionRoutineContext, "ptr", CompletionRoutine, "ptr", PrePendRoutine, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<IRP>} Irp 
     * @param {Integer} OpenCount 
     * @param {Integer} LowerOplockState 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static FsRtlUpperOplockFsctrl(Oplock, Irp, OpenCount, LowerOplockState, Flags) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlUpperOplockFsctrl", OplockMarshal, Oplock, "ptr", Irp, "uint", OpenCount, "uint", LowerOplockState, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @returns {BOOLEAN} 
     */
    static FsRtlOplockIsFastIoPossible(Oplock) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlOplockIsFastIoPossible", OplockMarshal, Oplock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @returns {BOOLEAN} 
     */
    static FsRtlCurrentBatchOplock(Oplock) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlCurrentBatchOplock", OplockMarshal, Oplock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @returns {BOOLEAN} 
     */
    static FsRtlCurrentOplock(Oplock) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlCurrentOplock", OplockMarshal, Oplock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<IO_STACK_LOCATION>} IrpSp 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
     * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PostIrpRoutine 
     * @returns {NTSTATUS} 
     */
    static FsRtlOplockBreakToNone(Oplock, IrpSp, Irp, Context, CompletionRoutine, PostIrpRoutine) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlOplockBreakToNone", OplockMarshal, Oplock, "ptr", IrpSp, "ptr", Irp, ContextMarshal, Context, "ptr", CompletionRoutine, "ptr", PostIrpRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {BOOLEAN} 
     */
    static FsRtlOplockIsSharedRequest(Irp) {
        result := DllCall("ntoskrnl.exe\FsRtlOplockIsSharedRequest", "ptr", Irp, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<IRP>} Irp 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
     * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PostIrpRoutine 
     * @returns {NTSTATUS} 
     */
    static FsRtlOplockBreakH(Oplock, Irp, Flags, Context, CompletionRoutine, PostIrpRoutine) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlOplockBreakH", OplockMarshal, Oplock, "ptr", Irp, "uint", Flags, ContextMarshal, Context, "ptr", CompletionRoutine, "ptr", PostIrpRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<IRP>} Irp 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
     * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PostIrpRoutine 
     * @param {Pointer<Integer>} GrantedAccess 
     * @param {Pointer<Integer>} ShareAccess 
     * @returns {NTSTATUS} 
     */
    static FsRtlOplockBreakH2(Oplock, Irp, Flags, Context, CompletionRoutine, PostIrpRoutine, GrantedAccess, ShareAccess) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"
        GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
        ShareAccessMarshal := ShareAccess is VarRef ? "ushort*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlOplockBreakH2", OplockMarshal, Oplock, "ptr", Irp, "uint", Flags, ContextMarshal, Context, "ptr", CompletionRoutine, "ptr", PostIrpRoutine, GrantedAccessMarshal, GrantedAccess, ShareAccessMarshal, ShareAccess, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @returns {BOOLEAN} 
     */
    static FsRtlCurrentOplockH(Oplock) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlCurrentOplockH", OplockMarshal, Oplock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<IRP>} Irp 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
     * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PostIrpRoutine 
     * @returns {NTSTATUS} 
     */
    static FsRtlOplockBreakToNoneEx(Oplock, Irp, Flags, Context, CompletionRoutine, PostIrpRoutine) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlOplockBreakToNoneEx", OplockMarshal, Oplock, "ptr", Irp, "uint", Flags, ContextMarshal, Context, "ptr", CompletionRoutine, "ptr", PostIrpRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<IRP>} Irp 
     * @param {Integer} OpenCount 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static FsRtlOplockFsctrlEx(Oplock, Irp, OpenCount, Flags) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlOplockFsctrlEx", OplockMarshal, Oplock, "ptr", Irp, "uint", OpenCount, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} Fo1 
     * @param {Pointer<FILE_OBJECT>} Fo2 
     * @returns {BOOLEAN} 
     */
    static FsRtlOplockKeysEqual(Fo1, Fo2) {
        result := DllCall("ntoskrnl.exe\FsRtlOplockKeysEqual", "ptr", Fo1, "ptr", Fo2, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} EventCode 
     * @returns {NTSTATUS} 
     */
    static FsRtlNotifyVolumeEvent(FileObject, EventCode) {
        result := DllCall("ntoskrnl.exe\FsRtlNotifyVolumeEvent", "ptr", FileObject, "uint", EventCode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} EventCode 
     * @param {Pointer<TARGET_DEVICE_CUSTOM_NOTIFICATION>} Event 
     * @returns {NTSTATUS} 
     */
    static FsRtlNotifyVolumeEventEx(FileObject, EventCode, Event) {
        result := DllCall("ntoskrnl.exe\FsRtlNotifyVolumeEventEx", "ptr", FileObject, "uint", EventCode, "ptr", Event, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PNOTIFY_SYNC>} NotifySync 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlNotifyInitializeSync(NotifySync) {
        NotifySyncMarshal := NotifySync is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlNotifyInitializeSync", NotifySyncMarshal, NotifySync)
    }

    /**
     * 
     * @param {Pointer<PNOTIFY_SYNC>} NotifySync 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlNotifyUninitializeSync(NotifySync) {
        NotifySyncMarshal := NotifySync is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlNotifyUninitializeSync", NotifySyncMarshal, NotifySync)
    }

    /**
     * 
     * @param {PNOTIFY_SYNC} NotifySync 
     * @param {Pointer<LIST_ENTRY>} NotifyList 
     * @param {Pointer<Void>} FsContext 
     * @param {Pointer<STRING>} FullDirectoryName 
     * @param {BOOLEAN} WatchTree 
     * @param {BOOLEAN} IgnoreBuffer 
     * @param {Integer} CompletionFilter 
     * @param {Pointer<IRP>} NotifyIrp 
     * @param {Pointer<PCHECK_FOR_TRAVERSE_ACCESS>} TraverseCallback 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlNotifyFullChangeDirectory(NotifySync, NotifyList, FsContext, FullDirectoryName, WatchTree, IgnoreBuffer, CompletionFilter, NotifyIrp, TraverseCallback, SubjectContext) {
        FsContextMarshal := FsContext is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlNotifyFullChangeDirectory", "ptr", NotifySync, "ptr", NotifyList, FsContextMarshal, FsContext, "ptr", FullDirectoryName, "char", WatchTree, "char", IgnoreBuffer, "uint", CompletionFilter, "ptr", NotifyIrp, "ptr", TraverseCallback, "ptr", SubjectContext)
    }

    /**
     * 
     * @param {PNOTIFY_SYNC} NotifySync 
     * @param {Pointer<LIST_ENTRY>} NotifyList 
     * @param {Pointer<Void>} FsContext 
     * @param {Pointer<STRING>} FullDirectoryName 
     * @param {BOOLEAN} WatchTree 
     * @param {BOOLEAN} IgnoreBuffer 
     * @param {Integer} CompletionFilter 
     * @param {Pointer<IRP>} NotifyIrp 
     * @param {Pointer<PCHECK_FOR_TRAVERSE_ACCESS>} TraverseCallback 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
     * @param {Pointer<PFILTER_REPORT_CHANGE>} FilterCallback 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlNotifyFilterChangeDirectory(NotifySync, NotifyList, FsContext, FullDirectoryName, WatchTree, IgnoreBuffer, CompletionFilter, NotifyIrp, TraverseCallback, SubjectContext, FilterCallback) {
        FsContextMarshal := FsContext is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlNotifyFilterChangeDirectory", "ptr", NotifySync, "ptr", NotifyList, FsContextMarshal, FsContext, "ptr", FullDirectoryName, "char", WatchTree, "char", IgnoreBuffer, "uint", CompletionFilter, "ptr", NotifyIrp, "ptr", TraverseCallback, "ptr", SubjectContext, "ptr", FilterCallback)
    }

    /**
     * 
     * @param {PNOTIFY_SYNC} NotifySync 
     * @param {Pointer<LIST_ENTRY>} NotifyList 
     * @param {Pointer<STRING>} FullTargetName 
     * @param {Integer} TargetNameOffset 
     * @param {Pointer<STRING>} StreamName 
     * @param {Pointer<STRING>} NormalizedParentName 
     * @param {Integer} FilterMatch 
     * @param {Integer} Action 
     * @param {Pointer<Void>} TargetContext 
     * @param {Pointer<Void>} FilterContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlNotifyFilterReportChange(NotifySync, NotifyList, FullTargetName, TargetNameOffset, StreamName, NormalizedParentName, FilterMatch, Action, TargetContext, FilterContext) {
        TargetContextMarshal := TargetContext is VarRef ? "ptr" : "ptr"
        FilterContextMarshal := FilterContext is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlNotifyFilterReportChange", "ptr", NotifySync, "ptr", NotifyList, "ptr", FullTargetName, "ushort", TargetNameOffset, "ptr", StreamName, "ptr", NormalizedParentName, "uint", FilterMatch, "uint", Action, TargetContextMarshal, TargetContext, FilterContextMarshal, FilterContext)
    }

    /**
     * 
     * @param {PNOTIFY_SYNC} NotifySync 
     * @param {Pointer<LIST_ENTRY>} NotifyList 
     * @param {Pointer<STRING>} FullTargetName 
     * @param {Integer} TargetNameOffset 
     * @param {Pointer<STRING>} StreamName 
     * @param {Pointer<STRING>} NormalizedParentName 
     * @param {Integer} FilterMatch 
     * @param {Integer} Action 
     * @param {Pointer<Void>} TargetContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlNotifyFullReportChange(NotifySync, NotifyList, FullTargetName, TargetNameOffset, StreamName, NormalizedParentName, FilterMatch, Action, TargetContext) {
        TargetContextMarshal := TargetContext is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlNotifyFullReportChange", "ptr", NotifySync, "ptr", NotifyList, "ptr", FullTargetName, "ushort", TargetNameOffset, "ptr", StreamName, "ptr", NormalizedParentName, "uint", FilterMatch, "uint", Action, TargetContextMarshal, TargetContext)
    }

    /**
     * 
     * @param {PNOTIFY_SYNC} NotifySync 
     * @param {Pointer<LIST_ENTRY>} NotifyList 
     * @param {Pointer<Void>} FsContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlNotifyCleanup(NotifySync, NotifyList, FsContext) {
        FsContextMarshal := FsContext is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlNotifyCleanup", "ptr", NotifySync, "ptr", NotifyList, FsContextMarshal, FsContext)
    }

    /**
     * 
     * @param {PNOTIFY_SYNC} NotifySync 
     * @param {Pointer<LIST_ENTRY>} NotifyList 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlNotifyCleanupAll(NotifySync, NotifyList) {
        DllCall("ntoskrnl.exe\FsRtlNotifyCleanupAll", "ptr", NotifySync, "ptr", NotifyList)
    }

    /**
     * 
     * @param {UNICODE_STRING} Path 
     * @param {Pointer<UNICODE_STRING>} FirstName 
     * @param {Pointer<UNICODE_STRING>} RemainingName 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlDissectName(Path, FirstName, RemainingName) {
        DllCall("ntoskrnl.exe\FsRtlDissectName", "ptr", Path, "ptr", FirstName, "ptr", RemainingName)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} Name 
     * @returns {BOOLEAN} 
     */
    static FsRtlDoesNameContainWildCards(Name) {
        result := DllCall("ntoskrnl.exe\FsRtlDoesNameContainWildCards", "ptr", Name, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} ConstantNameA 
     * @param {Pointer<UNICODE_STRING>} ConstantNameB 
     * @param {BOOLEAN} IgnoreCase 
     * @param {Pointer<Integer>} UpcaseTable 
     * @returns {BOOLEAN} 
     */
    static FsRtlAreNamesEqual(ConstantNameA, ConstantNameB, IgnoreCase, UpcaseTable) {
        UpcaseTableMarshal := UpcaseTable is VarRef ? "ushort*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlAreNamesEqual", "ptr", ConstantNameA, "ptr", ConstantNameB, "char", IgnoreCase, UpcaseTableMarshal, UpcaseTable, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} Expression 
     * @param {Pointer<UNICODE_STRING>} Name 
     * @param {BOOLEAN} IgnoreCase 
     * @param {PWSTR} UpcaseTable 
     * @returns {BOOLEAN} 
     */
    static FsRtlIsNameInExpression(Expression, Name, IgnoreCase, UpcaseTable) {
        UpcaseTable := UpcaseTable is String ? StrPtr(UpcaseTable) : UpcaseTable

        result := DllCall("ntoskrnl.exe\FsRtlIsNameInExpression", "ptr", Expression, "ptr", Name, "char", IgnoreCase, "ptr", UpcaseTable, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} Expression 
     * @param {Pointer<UNICODE_STRING>} Name 
     * @param {BOOLEAN} IgnoreCase 
     * @param {PWSTR} UpcaseTable 
     * @returns {BOOLEAN} 
     */
    static FsRtlIsNameInUnUpcasedExpression(Expression, Name, IgnoreCase, UpcaseTable) {
        UpcaseTable := UpcaseTable is String ? StrPtr(UpcaseTable) : UpcaseTable

        result := DllCall("ntoskrnl.exe\FsRtlIsNameInUnUpcasedExpression", "ptr", Expression, "ptr", Name, "char", IgnoreCase, "ptr", UpcaseTable, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<KEVENT>} Event 
     * @param {Pointer<PFSRTL_STACK_OVERFLOW_ROUTINE>} StackOverflowRoutine 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlPostStackOverflow(Context, Event, StackOverflowRoutine) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlPostStackOverflow", ContextMarshal, Context, "ptr", Event, "ptr", StackOverflowRoutine)
    }

    /**
     * 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<KEVENT>} Event 
     * @param {Pointer<PFSRTL_STACK_OVERFLOW_ROUTINE>} StackOverflowRoutine 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlPostPagingFileStackOverflow(Context, Event, StackOverflowRoutine) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlPostPagingFileStackOverflow", ContextMarshal, Context, "ptr", Event, "ptr", StackOverflowRoutine)
    }

    /**
     * 
     * @param {Pointer<HANDLE>} MupHandle 
     * @param {Pointer<UNICODE_STRING>} RedirectorDeviceName 
     * @param {BOOLEAN} MailslotsSupported 
     * @returns {NTSTATUS} 
     */
    static FsRtlRegisterUncProvider(MupHandle, RedirectorDeviceName, MailslotsSupported) {
        result := DllCall("ntoskrnl.exe\FsRtlRegisterUncProvider", "ptr", MupHandle, "ptr", RedirectorDeviceName, "char", MailslotsSupported, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} MupHandle 
     * @param {Pointer<UNICODE_STRING>} RedirDevName 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static FsRtlRegisterUncProviderEx(MupHandle, RedirDevName, DeviceObject, Flags) {
        result := DllCall("ntoskrnl.exe\FsRtlRegisterUncProviderEx", "ptr", MupHandle, "ptr", RedirDevName, "ptr", DeviceObject, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} RedirDevName 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<FSRTL_UNC_PROVIDER_REGISTRATION>} Registration 
     * @param {Pointer<HANDLE>} MupHandle 
     * @returns {NTSTATUS} 
     */
    static FsRtlRegisterUncProviderEx2(RedirDevName, DeviceObject, Registration, MupHandle) {
        result := DllCall("ntoskrnl.exe\FsRtlRegisterUncProviderEx2", "ptr", RedirDevName, "ptr", DeviceObject, "ptr", Registration, "ptr", MupHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlDeregisterUncProvider(Handle) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        DllCall("ntoskrnl.exe\FsRtlDeregisterUncProvider", "ptr", Handle)
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<Integer>} Timeout 
     * @param {Pointer<IRP>} Irp 
     * @returns {NTSTATUS} 
     */
    static FsRtlCancellableWaitForSingleObject(Object_R, Timeout, Irp) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlCancellableWaitForSingleObject", Object_RMarshal, Object_R, TimeoutMarshal, Timeout, "ptr", Irp, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Pointer<Void>>} ObjectArray 
     * @param {Integer} WaitType 
     * @param {Pointer<Integer>} Timeout 
     * @param {Pointer<KWAIT_BLOCK>} WaitBlockArray 
     * @param {Pointer<IRP>} Irp 
     * @returns {NTSTATUS} 
     */
    static FsRtlCancellableWaitForMultipleObjects(Count, ObjectArray, WaitType, Timeout, WaitBlockArray, Irp) {
        ObjectArrayMarshal := ObjectArray is VarRef ? "ptr*" : "ptr"
        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlCancellableWaitForMultipleObjects", "uint", Count, ObjectArrayMarshal, ObjectArray, "int", WaitType, TimeoutMarshal, Timeout, "ptr", WaitBlockArray, "ptr", Irp, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} pFileObject 
     * @param {Integer} Level 
     * @param {Pointer} pBuffer 
     * @param {Pointer<Integer>} pBufferSize 
     * @returns {NTSTATUS} 
     */
    static FsRtlMupGetProviderInfoFromFileObject(pFileObject, Level, pBuffer, pBufferSize) {
        pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlMupGetProviderInfoFromFileObject", "ptr", pFileObject, "uint", Level, "ptr", pBuffer, pBufferSizeMarshal, pBufferSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} pProviderName 
     * @param {Pointer<Integer>} pProviderId 
     * @returns {NTSTATUS} 
     */
    static FsRtlMupGetProviderIdFromName(pProviderName, pProviderId) {
        pProviderIdMarshal := pProviderId is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlMupGetProviderIdFromName", "ptr", pProviderName, pProviderIdMarshal, pProviderId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} PerFileContextPointer 
     * @param {Pointer<FSRTL_PER_FILE_CONTEXT>} Ptr 
     * @returns {NTSTATUS} 
     */
    static FsRtlInsertPerFileContext(PerFileContextPointer, Ptr) {
        PerFileContextPointerMarshal := PerFileContextPointer is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlInsertPerFileContext", PerFileContextPointerMarshal, PerFileContextPointer, "ptr", Ptr, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} PerFileContextPointer 
     * @param {Pointer<Void>} OwnerId 
     * @param {Pointer<Void>} InstanceId 
     * @returns {Pointer<FSRTL_PER_FILE_CONTEXT>} 
     */
    static FsRtlLookupPerFileContext(PerFileContextPointer, OwnerId, InstanceId) {
        PerFileContextPointerMarshal := PerFileContextPointer is VarRef ? "ptr*" : "ptr"
        OwnerIdMarshal := OwnerId is VarRef ? "ptr" : "ptr"
        InstanceIdMarshal := InstanceId is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlLookupPerFileContext", PerFileContextPointerMarshal, PerFileContextPointer, OwnerIdMarshal, OwnerId, InstanceIdMarshal, InstanceId, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} PerFileContextPointer 
     * @param {Pointer<Void>} OwnerId 
     * @param {Pointer<Void>} InstanceId 
     * @returns {Pointer<FSRTL_PER_FILE_CONTEXT>} 
     */
    static FsRtlRemovePerFileContext(PerFileContextPointer, OwnerId, InstanceId) {
        PerFileContextPointerMarshal := PerFileContextPointer is VarRef ? "ptr*" : "ptr"
        OwnerIdMarshal := OwnerId is VarRef ? "ptr" : "ptr"
        InstanceIdMarshal := InstanceId is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlRemovePerFileContext", PerFileContextPointerMarshal, PerFileContextPointer, OwnerIdMarshal, OwnerId, InstanceIdMarshal, InstanceId, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} PerFileContextPointer 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlTeardownPerFileContexts(PerFileContextPointer) {
        PerFileContextPointerMarshal := PerFileContextPointer is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlTeardownPerFileContexts", PerFileContextPointerMarshal, PerFileContextPointer)
    }

    /**
     * 
     * @param {Pointer<FSRTL_ADVANCED_FCB_HEADER>} PerStreamContext 
     * @param {Pointer<FSRTL_PER_STREAM_CONTEXT>} Ptr 
     * @returns {NTSTATUS} 
     */
    static FsRtlInsertPerStreamContext(PerStreamContext, Ptr) {
        result := DllCall("ntoskrnl.exe\FsRtlInsertPerStreamContext", "ptr", PerStreamContext, "ptr", Ptr, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FSRTL_ADVANCED_FCB_HEADER>} StreamContext 
     * @param {Pointer<Void>} OwnerId 
     * @param {Pointer<Void>} InstanceId 
     * @returns {Pointer<FSRTL_PER_STREAM_CONTEXT>} 
     */
    static FsRtlLookupPerStreamContextInternal(StreamContext, OwnerId, InstanceId) {
        OwnerIdMarshal := OwnerId is VarRef ? "ptr" : "ptr"
        InstanceIdMarshal := InstanceId is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlLookupPerStreamContextInternal", "ptr", StreamContext, OwnerIdMarshal, OwnerId, InstanceIdMarshal, InstanceId, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FSRTL_ADVANCED_FCB_HEADER>} StreamContext 
     * @param {Pointer<Void>} OwnerId 
     * @param {Pointer<Void>} InstanceId 
     * @returns {Pointer<FSRTL_PER_STREAM_CONTEXT>} 
     */
    static FsRtlRemovePerStreamContext(StreamContext, OwnerId, InstanceId) {
        OwnerIdMarshal := OwnerId is VarRef ? "ptr" : "ptr"
        InstanceIdMarshal := InstanceId is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlRemovePerStreamContext", "ptr", StreamContext, OwnerIdMarshal, OwnerId, InstanceIdMarshal, InstanceId, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} PoolType 
     * @param {Integer} Tag 
     * @returns {Pointer<Void>} 
     */
    static FsRtlAllocateAePushLock(PoolType, Tag) {
        result := DllCall("ntoskrnl.exe\FsRtlAllocateAePushLock", "int", PoolType, "uint", Tag, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} AePushLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlFreeAePushLock(AePushLock) {
        AePushLockMarshal := AePushLock is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlFreeAePushLock", AePushLockMarshal, AePushLock)
    }

    /**
     * 
     * @param {Pointer<FSRTL_ADVANCED_FCB_HEADER>} AdvancedHeader 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlTeardownPerStreamContexts(AdvancedHeader) {
        DllCall("ntoskrnl.exe\FsRtlTeardownPerStreamContexts", "ptr", AdvancedHeader)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<FSRTL_PER_FILEOBJECT_CONTEXT>} Ptr 
     * @returns {NTSTATUS} 
     */
    static FsRtlInsertPerFileObjectContext(FileObject, Ptr) {
        result := DllCall("ntoskrnl.exe\FsRtlInsertPerFileObjectContext", "ptr", FileObject, "ptr", Ptr, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Void>} OwnerId 
     * @param {Pointer<Void>} InstanceId 
     * @returns {Pointer<FSRTL_PER_FILEOBJECT_CONTEXT>} 
     */
    static FsRtlLookupPerFileObjectContext(FileObject, OwnerId, InstanceId) {
        OwnerIdMarshal := OwnerId is VarRef ? "ptr" : "ptr"
        InstanceIdMarshal := InstanceId is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlLookupPerFileObjectContext", "ptr", FileObject, OwnerIdMarshal, OwnerId, InstanceIdMarshal, InstanceId, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Void>} OwnerId 
     * @param {Pointer<Void>} InstanceId 
     * @returns {Pointer<FSRTL_PER_FILEOBJECT_CONTEXT>} 
     */
    static FsRtlRemovePerFileObjectContext(FileObject, OwnerId, InstanceId) {
        OwnerIdMarshal := OwnerId is VarRef ? "ptr" : "ptr"
        InstanceIdMarshal := InstanceId is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlRemovePerFileObjectContext", "ptr", FileObject, OwnerIdMarshal, OwnerId, InstanceIdMarshal, InstanceId, "ptr")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlIncrementCcFastReadNotPossible() {
        DllCall("ntoskrnl.exe\FsRtlIncrementCcFastReadNotPossible")
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlIncrementCcFastReadWait() {
        DllCall("ntoskrnl.exe\FsRtlIncrementCcFastReadWait")
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlIncrementCcFastReadNoWait() {
        DllCall("ntoskrnl.exe\FsRtlIncrementCcFastReadNoWait")
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlIncrementCcFastReadResourceMiss() {
        DllCall("ntoskrnl.exe\FsRtlIncrementCcFastReadResourceMiss")
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlIncrementCcFastMdlReadWait() {
        DllCall("ntoskrnl.exe\FsRtlIncrementCcFastMdlReadWait")
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {Integer} 
     */
    static FsRtlIsPagingFile(FileObject) {
        result := DllCall("ntoskrnl.exe\FsRtlIsPagingFile", "ptr", FileObject, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {Integer} 
     */
    static FsRtlIsSystemPagingFile(FileObject) {
        result := DllCall("ntoskrnl.exe\FsRtlIsSystemPagingFile", "ptr", FileObject, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} SectionHandle 
     * @param {Pointer<Pointer<Void>>} SectionObject 
     * @param {Pointer<Integer>} SectionFileSize 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<Integer>} MaximumSize 
     * @param {Integer} SectionPageProtection 
     * @param {Integer} AllocationAttributes 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static FsRtlCreateSectionForDataScan(SectionHandle, SectionObject, SectionFileSize, FileObject, DesiredAccess, ObjectAttributes, MaximumSize, SectionPageProtection, AllocationAttributes, Flags) {
        SectionObjectMarshal := SectionObject is VarRef ? "ptr*" : "ptr"
        SectionFileSizeMarshal := SectionFileSize is VarRef ? "int64*" : "ptr"
        MaximumSizeMarshal := MaximumSize is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlCreateSectionForDataScan", "ptr", SectionHandle, SectionObjectMarshal, SectionObject, SectionFileSizeMarshal, SectionFileSize, "ptr", FileObject, "uint", DesiredAccess, "ptr", ObjectAttributes, MaximumSizeMarshal, MaximumSize, "uint", SectionPageProtection, "uint", AllocationAttributes, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Integer} BufferLength 
     * @param {Pointer} ReparseBuffer 
     * @returns {NTSTATUS} 
     */
    static FsRtlValidateReparsePointBuffer(BufferLength, ReparseBuffer) {
        result := DllCall("ntoskrnl.exe\FsRtlValidateReparsePointBuffer", "uint", BufferLength, "ptr", ReparseBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} OriginalString 
     * @param {Integer} PathLength 
     * @param {Pointer<Integer>} NewLength 
     * @returns {NTSTATUS} 
     */
    static FsRtlRemoveDotsFromPath(OriginalString, PathLength, NewLength) {
        NewLengthMarshal := NewLength is VarRef ? "ushort*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlRemoveDotsFromPath", "ptr", OriginalString, "ushort", PathLength, NewLengthMarshal, NewLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ReparseTag 
     * @returns {BOOLEAN} 
     */
    static FsRtlIsNonEmptyDirectoryReparsePointAllowed(ReparseTag) {
        result := DllCall("ntoskrnl.exe\FsRtlIsNonEmptyDirectoryReparsePointAllowed", "uint", ReparseTag, "char")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<ECP_LIST>>} EcpList 
     * @returns {NTSTATUS} 
     */
    static FsRtlAllocateExtraCreateParameterList(Flags, EcpList) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlAllocateExtraCreateParameterList", "uint", Flags, EcpListMarshal, EcpList, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlFreeExtraCreateParameterList(EcpList) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlFreeExtraCreateParameterList", EcpListMarshal, EcpList)
    }

    /**
     * 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @returns {NTSTATUS} 
     */
    static FsRtlInitializeExtraCreateParameterList(EcpList) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlInitializeExtraCreateParameterList", EcpListMarshal, EcpList, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} EcpType 
     * @param {Integer} SizeOfContext 
     * @param {Integer} Flags 
     * @param {Pointer<PFSRTL_EXTRA_CREATE_PARAMETER_CLEANUP_CALLBACK>} CleanupCallback 
     * @param {Integer} PoolTag 
     * @param {Pointer<Pointer<Void>>} EcpContext 
     * @returns {NTSTATUS} 
     */
    static FsRtlAllocateExtraCreateParameter(EcpType, SizeOfContext, Flags, CleanupCallback, PoolTag, EcpContext) {
        EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlAllocateExtraCreateParameter", "ptr", EcpType, "uint", SizeOfContext, "uint", Flags, "ptr", CleanupCallback, "uint", PoolTag, EcpContextMarshal, EcpContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} EcpContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlFreeExtraCreateParameter(EcpContext) {
        EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlFreeExtraCreateParameter", EcpContextMarshal, EcpContext)
    }

    /**
     * 
     * @param {Pointer<ECP_HEADER>} Ecp 
     * @param {Integer} EcpFlags 
     * @param {Pointer<PFSRTL_EXTRA_CREATE_PARAMETER_CLEANUP_CALLBACK>} CleanupCallback 
     * @param {Integer} TotalSize 
     * @param {Pointer<Guid>} EcpType 
     * @param {Pointer<Void>} ListAllocatedFrom 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlInitializeExtraCreateParameter(Ecp, EcpFlags, CleanupCallback, TotalSize, EcpType, ListAllocatedFrom) {
        EcpMarshal := Ecp is VarRef ? "ptr*" : "ptr"
        ListAllocatedFromMarshal := ListAllocatedFrom is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlInitializeExtraCreateParameter", EcpMarshal, Ecp, "uint", EcpFlags, "ptr", CleanupCallback, "uint", TotalSize, "ptr", EcpType, ListAllocatedFromMarshal, ListAllocatedFrom)
    }

    /**
     * 
     * @param {Pointer<Void>} Lookaside 
     * @param {Integer} Flags 
     * @param {Pointer} Size 
     * @param {Integer} Tag 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlInitExtraCreateParameterLookasideList(Lookaside, Flags, Size, Tag) {
        LookasideMarshal := Lookaside is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlInitExtraCreateParameterLookasideList", LookasideMarshal, Lookaside, "uint", Flags, "ptr", Size, "uint", Tag)
    }

    /**
     * 
     * @param {Pointer<Void>} Lookaside 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlDeleteExtraCreateParameterLookasideList(Lookaside, Flags) {
        LookasideMarshal := Lookaside is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlDeleteExtraCreateParameterLookasideList", LookasideMarshal, Lookaside, "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} EcpType 
     * @param {Integer} SizeOfContext 
     * @param {Integer} Flags 
     * @param {Pointer<PFSRTL_EXTRA_CREATE_PARAMETER_CLEANUP_CALLBACK>} CleanupCallback 
     * @param {Pointer<Void>} LookasideList 
     * @param {Pointer<Pointer<Void>>} EcpContext 
     * @returns {NTSTATUS} 
     */
    static FsRtlAllocateExtraCreateParameterFromLookasideList(EcpType, SizeOfContext, Flags, CleanupCallback, LookasideList, EcpContext) {
        LookasideListMarshal := LookasideList is VarRef ? "ptr" : "ptr"
        EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlAllocateExtraCreateParameterFromLookasideList", "ptr", EcpType, "uint", SizeOfContext, "uint", Flags, "ptr", CleanupCallback, LookasideListMarshal, LookasideList, EcpContextMarshal, EcpContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @param {Pointer<Void>} EcpContext 
     * @returns {NTSTATUS} 
     */
    static FsRtlInsertExtraCreateParameter(EcpList, EcpContext) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
        EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlInsertExtraCreateParameter", EcpListMarshal, EcpList, EcpContextMarshal, EcpContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @param {Pointer<Guid>} EcpType 
     * @param {Pointer<Pointer<Void>>} EcpContext 
     * @param {Pointer<Integer>} EcpContextSize 
     * @returns {NTSTATUS} 
     */
    static FsRtlFindExtraCreateParameter(EcpList, EcpType, EcpContext, EcpContextSize) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
        EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"
        EcpContextSizeMarshal := EcpContextSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlFindExtraCreateParameter", EcpListMarshal, EcpList, "ptr", EcpType, EcpContextMarshal, EcpContext, EcpContextSizeMarshal, EcpContextSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @param {Pointer<Guid>} EcpType 
     * @param {Pointer<Pointer<Void>>} EcpContext 
     * @param {Pointer<Integer>} EcpContextSize 
     * @returns {NTSTATUS} 
     */
    static FsRtlRemoveExtraCreateParameter(EcpList, EcpType, EcpContext, EcpContextSize) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
        EcpContextMarshal := EcpContext is VarRef ? "ptr*" : "ptr"
        EcpContextSizeMarshal := EcpContextSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlRemoveExtraCreateParameter", EcpListMarshal, EcpList, "ptr", EcpType, EcpContextMarshal, EcpContext, EcpContextSizeMarshal, EcpContextSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Pointer<ECP_LIST>>} EcpList 
     * @returns {NTSTATUS} 
     */
    static FsRtlGetEcpListFromIrp(Irp, EcpList) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlGetEcpListFromIrp", "ptr", Irp, EcpListMarshal, EcpList, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @returns {NTSTATUS} 
     */
    static FsRtlSetEcpListIntoIrp(Irp, EcpList) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlSetEcpListIntoIrp", "ptr", Irp, EcpListMarshal, EcpList, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ECP_LIST>} EcpList 
     * @param {Pointer<Void>} CurrentEcpContext 
     * @param {Pointer<Guid>} NextEcpType 
     * @param {Pointer<Pointer<Void>>} NextEcpContext 
     * @param {Pointer<Integer>} NextEcpContextSize 
     * @returns {NTSTATUS} 
     */
    static FsRtlGetNextExtraCreateParameter(EcpList, CurrentEcpContext, NextEcpType, NextEcpContext, NextEcpContextSize) {
        EcpListMarshal := EcpList is VarRef ? "ptr*" : "ptr"
        CurrentEcpContextMarshal := CurrentEcpContext is VarRef ? "ptr" : "ptr"
        NextEcpContextMarshal := NextEcpContext is VarRef ? "ptr*" : "ptr"
        NextEcpContextSizeMarshal := NextEcpContextSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlGetNextExtraCreateParameter", EcpListMarshal, EcpList, CurrentEcpContextMarshal, CurrentEcpContext, "ptr", NextEcpType, NextEcpContextMarshal, NextEcpContext, NextEcpContextSizeMarshal, NextEcpContextSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} EcpContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlAcknowledgeEcp(EcpContext) {
        EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlAcknowledgeEcp", EcpContextMarshal, EcpContext)
    }

    /**
     * 
     * @param {Pointer<Void>} EcpContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlPrepareToReuseEcp(EcpContext) {
        EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\FsRtlPrepareToReuseEcp", EcpContextMarshal, EcpContext)
    }

    /**
     * 
     * @param {Pointer<Void>} EcpContext 
     * @returns {BOOLEAN} 
     */
    static FsRtlIsEcpAcknowledged(EcpContext) {
        EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlIsEcpAcknowledged", EcpContextMarshal, EcpContext, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} EcpContext 
     * @returns {BOOLEAN} 
     */
    static FsRtlIsEcpFromUserMode(EcpContext) {
        EcpContextMarshal := EcpContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlIsEcpFromUserMode", EcpContextMarshal, EcpContext, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @returns {PEPROCESS} 
     */
    static FsRtlOplockGetAnyBreakOwnerProcess(Oplock) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlOplockGetAnyBreakOwnerProcess", OplockMarshal, Oplock, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Oplock 
     * @param {Pointer<IRP>} Irp 
     * @param {Integer} Flags 
     * @param {Integer} FlagsEx2 
     * @param {Pointer<Void>} CompletionRoutineContext 
     * @param {Pointer<POPLOCK_WAIT_COMPLETE_ROUTINE>} CompletionRoutine 
     * @param {Pointer<POPLOCK_FS_PREPOST_IRP>} PostIrpRoutine 
     * @param {Integer} Timeout 
     * @param {Pointer<Void>} NotifyContext 
     * @param {Pointer<POPLOCK_NOTIFY_ROUTINE>} NotifyRoutine 
     * @returns {NTSTATUS} 
     */
    static FsRtlCheckOplockEx2(Oplock, Irp, Flags, FlagsEx2, CompletionRoutineContext, CompletionRoutine, PostIrpRoutine, Timeout, NotifyContext, NotifyRoutine) {
        OplockMarshal := Oplock is VarRef ? "ptr*" : "ptr"
        CompletionRoutineContextMarshal := CompletionRoutineContext is VarRef ? "ptr" : "ptr"
        NotifyContextMarshal := NotifyContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlCheckOplockEx2", OplockMarshal, Oplock, "ptr", Irp, "uint", Flags, "uint", FlagsEx2, CompletionRoutineContextMarshal, CompletionRoutineContext, "ptr", CompletionRoutine, "ptr", PostIrpRoutine, "uint", Timeout, NotifyContextMarshal, NotifyContext, "ptr", NotifyRoutine, "int")
        return result
    }

    /**
     * 
     * @returns {Pointer<LIST_ENTRY>} 
     */
    static FsRtlGetCurrentProcessLoaderList() {
        result := DllCall("ntoskrnl.exe\FsRtlGetCurrentProcessLoaderList", "ptr")
        return result
    }

    /**
     * 
     * @param {PEPROCESS} Process 
     * @returns {BOOLEAN} 
     */
    static FsRtlIs32BitProcess(Process) {
        result := DllCall("ntoskrnl.exe\FsRtlIs32BitProcess", "ptr", Process, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} CurrentFileObject 
     * @param {Pointer<FILE_OBJECT>} NewFileObject 
     * @param {Integer} ChangeBackingType 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static FsRtlChangeBackingFileObject(CurrentFileObject, NewFileObject, ChangeBackingType, Flags) {
        result := DllCall("ntoskrnl.exe\FsRtlChangeBackingFileObject", "ptr", CurrentFileObject, "ptr", NewFileObject, "int", ChangeBackingType, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} FileName 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
     * @param {NTSTATUS} FlushError 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static FsRtlLogCcFlushError(FileName, DeviceObject, SectionObjectPointer, FlushError, Flags) {
        result := DllCall("ntoskrnl.exe\FsRtlLogCcFlushError", "ptr", FileName, "ptr", DeviceObject, "ptr", SectionObjectPointer, "int", FlushError, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static FsRtlAreVolumeStartupApplicationsComplete() {
        result := DllCall("ntoskrnl.exe\FsRtlAreVolumeStartupApplicationsComplete", "char")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static FsRtlQueryMaximumVirtualDiskNestingLevel() {
        result := DllCall("ntoskrnl.exe\FsRtlQueryMaximumVirtualDiskNestingLevel", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<Integer>} NestingLevel 
     * @param {Pointer<Integer>} NestingFlags 
     * @returns {NTSTATUS} 
     */
    static FsRtlGetVirtualDiskNestingLevel(DeviceObject, NestingLevel, NestingFlags) {
        NestingLevelMarshal := NestingLevel is VarRef ? "uint*" : "ptr"
        NestingFlagsMarshal := NestingFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlGetVirtualDiskNestingLevel", "ptr", DeviceObject, NestingLevelMarshal, NestingLevel, NestingFlagsMarshal, NestingFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} VolumeDeviceObject 
     * @param {Pointer<Guid>} Guid 
     * @returns {NTSTATUS} 
     */
    static FsRtlVolumeDeviceToCorrelationId(VolumeDeviceObject, Guid) {
        result := DllCall("ntoskrnl.exe\FsRtlVolumeDeviceToCorrelationId", "ptr", VolumeDeviceObject, "ptr", Guid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} IoCtl 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} InputBuffer 
     * @param {Integer} InputBufferLength 
     * @param {Pointer<Void>} OutputBuffer 
     * @param {Integer} OutputBufferLength 
     * @param {Pointer<Pointer>} IosbInformation 
     * @returns {NTSTATUS} 
     */
    static FsRtlIssueDeviceIoControl(DeviceObject, IoCtl, Flags, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength, IosbInformation) {
        InputBufferMarshal := InputBuffer is VarRef ? "ptr" : "ptr"
        OutputBufferMarshal := OutputBuffer is VarRef ? "ptr" : "ptr"
        IosbInformationMarshal := IosbInformation is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlIssueDeviceIoControl", "ptr", DeviceObject, "uint", IoCtl, "char", Flags, InputBufferMarshal, InputBuffer, "uint", InputBufferLength, OutputBufferMarshal, OutputBuffer, "uint", OutputBufferLength, IosbInformationMarshal, IosbInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<FILE_FS_SECTOR_SIZE_INFORMATION>} SectorSizeInfo 
     * @returns {NTSTATUS} 
     */
    static FsRtlGetSectorSizeInformation(DeviceObject, SectorSizeInfo) {
        result := DllCall("ntoskrnl.exe\FsRtlGetSectorSizeInformation", "ptr", DeviceObject, "ptr", SectorSizeInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<Integer>} SupportedFeatures 
     * @returns {NTSTATUS} 
     */
    static FsRtlGetSupportedFeatures(DeviceObject, SupportedFeatures) {
        SupportedFeaturesMarshal := SupportedFeatures is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlGetSupportedFeatures", "ptr", DeviceObject, SupportedFeaturesMarshal, SupportedFeatures, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} FsControlCode 
     * @param {Pointer} InputBuffer 
     * @param {Integer} InputBufferLength 
     * @param {Pointer} OutputBuffer 
     * @param {Integer} OutputBufferLength 
     * @param {Pointer<Integer>} RetOutputBufferSize 
     * @returns {NTSTATUS} 
     */
    static FsRtlKernelFsControlFile(FileObject, FsControlCode, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength, RetOutputBufferSize) {
        RetOutputBufferSizeMarshal := RetOutputBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlKernelFsControlFile", "ptr", FileObject, "uint", FsControlCode, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, RetOutputBufferSizeMarshal, RetOutputBufferSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer} ReturnedEaData 
     * @param {Integer} Length 
     * @param {BOOLEAN} ReturnSingleEntry 
     * @param {Pointer} EaList 
     * @param {Integer} EaListLength 
     * @param {Pointer<Integer>} EaIndex 
     * @param {BOOLEAN} RestartScan 
     * @param {Pointer<Integer>} LengthReturned 
     * @returns {NTSTATUS} 
     */
    static FsRtlQueryKernelEaFile(FileObject, ReturnedEaData, Length, ReturnSingleEntry, EaList, EaListLength, EaIndex, RestartScan, LengthReturned) {
        EaIndexMarshal := EaIndex is VarRef ? "uint*" : "ptr"
        LengthReturnedMarshal := LengthReturned is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlQueryKernelEaFile", "ptr", FileObject, "ptr", ReturnedEaData, "uint", Length, "char", ReturnSingleEntry, "ptr", EaList, "uint", EaListLength, EaIndexMarshal, EaIndex, "char", RestartScan, LengthReturnedMarshal, LengthReturned, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer} EaBuffer 
     * @param {Integer} Length 
     * @returns {NTSTATUS} 
     */
    static FsRtlSetKernelEaFile(FileObject, EaBuffer, Length) {
        result := DllCall("ntoskrnl.exe\FsRtlSetKernelEaFile", "ptr", FileObject, "ptr", EaBuffer, "uint", Length, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer} FileInformation 
     * @param {Integer} Length 
     * @param {Integer} FileInformationClass 
     * @param {Pointer<Integer>} RetFileInformationSize 
     * @returns {NTSTATUS} 
     */
    static FsRtlQueryInformationFile(FileObject, FileInformation, Length, FileInformationClass, RetFileInformationSize) {
        RetFileInformationSizeMarshal := RetFileInformationSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlQueryInformationFile", "ptr", FileObject, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, RetFileInformationSizeMarshal, RetFileInformationSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} Vdl 
     * @returns {NTSTATUS} 
     */
    static FsRtlQueryCachedVdl(FileObject, Vdl) {
        VdlMarshal := Vdl is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\FsRtlQueryCachedVdl", "ptr", FileObject, VdlMarshal, Vdl, "int")
        return result
    }

    /**
     * 
     * @param {Integer} BytesRead 
     * @param {Integer} BytesWritten 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlUpdateDiskCounters(BytesRead, BytesWritten) {
        DllCall("ntoskrnl.exe\FsRtlUpdateDiskCounters", "uint", BytesRead, "uint", BytesWritten)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {NTSTATUS} DismountStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    static FsRtlDismountComplete(DeviceObject, DismountStatus) {
        DllCall("ntoskrnl.exe\FsRtlDismountComplete", "ptr", DeviceObject, "int", DismountStatus)
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObj 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static FsRtlSetDriverBacking(DriverObj, Flags) {
        result := DllCall("ntoskrnl.exe\FsRtlSetDriverBacking", "ptr", DriverObj, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static FsRtlIsMobileOS() {
        result := DllCall("ntoskrnl.exe\FsRtlIsMobileOS", "char")
        return result
    }

    /**
     * 
     * @param {Integer} StartPage 
     * @param {Integer} NumberOfPages 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static FsRtlIsExtentDangling(StartPage, NumberOfPages, Flags) {
        result := DllCall("ntoskrnl.exe\FsRtlIsExtentDangling", "uint", StartPage, "uint", NumberOfPages, "uint", Flags, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {BOOLEAN} 
     */
    static FsRtlIsDaxVolume(FileObject) {
        result := DllCall("ntoskrnl.exe\FsRtlIsDaxVolume", "ptr", FileObject, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<CC_FILE_SIZES>} FileSizes 
     * @param {BOOLEAN} PinAccess 
     * @param {Pointer<CACHE_MANAGER_CALLBACKS>} Callbacks 
     * @param {Pointer<Void>} LazyWriteContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcInitializeCacheMap(FileObject, FileSizes, PinAccess, Callbacks, LazyWriteContext) {
        LazyWriteContextMarshal := LazyWriteContext is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\CcInitializeCacheMap", "ptr", FileObject, "ptr", FileSizes, "char", PinAccess, "ptr", Callbacks, LazyWriteContextMarshal, LazyWriteContext)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} TruncateSize 
     * @param {Pointer<CACHE_UNINITIALIZE_EVENT>} UninitializeEvent 
     * @returns {BOOLEAN} 
     */
    static CcUninitializeCacheMap(FileObject, TruncateSize, UninitializeEvent) {
        TruncateSizeMarshal := TruncateSize is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\CcUninitializeCacheMap", "ptr", FileObject, TruncateSizeMarshal, TruncateSize, "ptr", UninitializeEvent, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<CC_FILE_SIZES>} FileSizes 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcSetFileSizes(FileObject, FileSizes) {
        DllCall("ntoskrnl.exe\CcSetFileSizes", "ptr", FileObject, "ptr", FileSizes)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<CC_FILE_SIZES>} FileSizes 
     * @returns {NTSTATUS} 
     */
    static CcSetFileSizesEx(FileObject, FileSizes) {
        result := DllCall("ntoskrnl.exe\CcSetFileSizesEx", "ptr", FileObject, "ptr", FileSizes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Integer} Flags 
     * @returns {BOOLEAN} 
     */
    static CcPurgeCacheSection(SectionObjectPointer, FileOffset, Length, Flags) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\CcPurgeCacheSection", "ptr", SectionObjectPointer, FileOffsetMarshal, FileOffset, "uint", Length, "uint", Flags, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcCoherencyFlushAndPurgeCache(SectionObjectPointer, FileOffset, Length, IoStatus, Flags) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        DllCall("ntoskrnl.exe\CcCoherencyFlushAndPurgeCache", "ptr", SectionObjectPointer, FileOffsetMarshal, FileOffset, "uint", Length, "ptr", IoStatus, "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} DirtyPageThreshold 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcSetDirtyPageThreshold(FileObject, DirtyPageThreshold) {
        DllCall("ntoskrnl.exe\CcSetDirtyPageThreshold", "ptr", FileObject, "uint", DirtyPageThreshold)
    }

    /**
     * 
     * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcFlushCache(SectionObjectPointer, FileOffset, Length, IoStatus) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        DllCall("ntoskrnl.exe\CcFlushCache", "ptr", SectionObjectPointer, FileOffsetMarshal, FileOffset, "uint", Length, "ptr", IoStatus)
    }

    /**
     * 
     * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
     * @param {BOOLEAN} BcbListHeld 
     * @returns {Integer} 
     */
    static CcGetFlushedValidData(SectionObjectPointer, BcbListHeld) {
        result := DllCall("ntoskrnl.exe\CcGetFlushedValidData", "ptr", SectionObjectPointer, "char", BcbListHeld, "int64")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} StartOffset 
     * @param {Pointer<Integer>} EndOffset 
     * @param {BOOLEAN} Wait 
     * @returns {BOOLEAN} 
     */
    static CcZeroData(FileObject, StartOffset, EndOffset, Wait) {
        StartOffsetMarshal := StartOffset is VarRef ? "int64*" : "ptr"
        EndOffsetMarshal := EndOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\CcZeroData", "ptr", FileObject, StartOffsetMarshal, StartOffset, EndOffsetMarshal, EndOffset, "char", Wait, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Bcb 
     * @returns {Pointer<Void>} 
     */
    static CcRemapBcb(Bcb) {
        BcbMarshal := Bcb is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\CcRemapBcb", BcbMarshal, Bcb, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Bcb 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcRepinBcb(Bcb) {
        BcbMarshal := Bcb is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\CcRepinBcb", BcbMarshal, Bcb)
    }

    /**
     * 
     * @param {Pointer<Void>} Bcb 
     * @param {BOOLEAN} WriteThrough 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcUnpinRepinnedBcb(Bcb, WriteThrough, IoStatus) {
        BcbMarshal := Bcb is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\CcUnpinRepinnedBcb", BcbMarshal, Bcb, "char", WriteThrough, "ptr", IoStatus)
    }

    /**
     * 
     * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
     * @returns {Pointer<FILE_OBJECT>} 
     */
    static CcGetFileObjectFromSectionPtrs(SectionObjectPointer) {
        result := DllCall("ntoskrnl.exe\CcGetFileObjectFromSectionPtrs", "ptr", SectionObjectPointer, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<SECTION_OBJECT_POINTERS>} SectionObjectPointer 
     * @returns {Pointer<FILE_OBJECT>} 
     */
    static CcGetFileObjectFromSectionPtrsRef(SectionObjectPointer) {
        result := DllCall("ntoskrnl.exe\CcGetFileObjectFromSectionPtrsRef", "ptr", SectionObjectPointer, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Bcb 
     * @returns {Pointer<FILE_OBJECT>} 
     */
    static CcGetFileObjectFromBcb(Bcb) {
        BcbMarshal := Bcb is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\CcGetFileObjectFromBcb", BcbMarshal, Bcb, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @returns {BOOLEAN} 
     */
    static CcCopyWriteWontFlush(FileObject, FileOffset, Length) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\CcCopyWriteWontFlush", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} BytesToWrite 
     * @param {BOOLEAN} Wait 
     * @param {Integer} Retrying 
     * @returns {BOOLEAN} 
     */
    static CcCanIWrite(FileObject, BytesToWrite, Wait, Retrying) {
        result := DllCall("ntoskrnl.exe\CcCanIWrite", "ptr", FileObject, "uint", BytesToWrite, "char", Wait, "char", Retrying, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<PCC_POST_DEFERRED_WRITE>} PostRoutine 
     * @param {Pointer<Void>} Context1 
     * @param {Pointer<Void>} Context2 
     * @param {Integer} BytesToWrite 
     * @param {BOOLEAN} Retrying 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcDeferWrite(FileObject, PostRoutine, Context1, Context2, BytesToWrite, Retrying) {
        Context1Marshal := Context1 is VarRef ? "ptr" : "ptr"
        Context2Marshal := Context2 is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\CcDeferWrite", "ptr", FileObject, "ptr", PostRoutine, Context1Marshal, Context1, Context2Marshal, Context2, "uint", BytesToWrite, "char", Retrying)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {BOOLEAN} Wait 
     * @param {Pointer} Buffer_R 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @returns {BOOLEAN} 
     */
    static CcCopyRead(FileObject, FileOffset, Length, Wait, Buffer_R, IoStatus) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\CcCopyRead", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "char", Wait, "ptr", Buffer_R, "ptr", IoStatus, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} FileOffset 
     * @param {Integer} Length 
     * @param {Integer} PageCount 
     * @param {Pointer} Buffer_R 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcFastCopyRead(FileObject, FileOffset, Length, PageCount, Buffer_R, IoStatus) {
        DllCall("ntoskrnl.exe\CcFastCopyRead", "ptr", FileObject, "uint", FileOffset, "uint", Length, "uint", PageCount, "ptr", Buffer_R, "ptr", IoStatus)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {BOOLEAN} Wait 
     * @param {Pointer} Buffer_R 
     * @returns {BOOLEAN} 
     */
    static CcCopyWrite(FileObject, FileOffset, Length, Wait, Buffer_R) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\CcCopyWrite", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "char", Wait, "ptr", Buffer_R, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} FileOffset 
     * @param {Integer} Length 
     * @param {Pointer} Buffer_R 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcFastCopyWrite(FileObject, FileOffset, Length, Buffer_R) {
        DllCall("ntoskrnl.exe\CcFastCopyWrite", "ptr", FileObject, "uint", FileOffset, "uint", Length, "ptr", Buffer_R)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Pointer<Pointer<MDL>>} MdlChain 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcMdlRead(FileObject, FileOffset, Length, MdlChain, IoStatus) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\CcMdlRead", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, MdlChainMarshal, MdlChain, "ptr", IoStatus)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<MDL>} MdlChain 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcMdlReadComplete(FileObject, MdlChain) {
        DllCall("ntoskrnl.exe\CcMdlReadComplete", "ptr", FileObject, "ptr", MdlChain)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Pointer<Pointer<MDL>>} MdlChain 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcPrepareMdlWrite(FileObject, FileOffset, Length, MdlChain, IoStatus) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\CcPrepareMdlWrite", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, MdlChainMarshal, MdlChain, "ptr", IoStatus)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Pointer<MDL>} MdlChain 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcMdlWriteComplete(FileObject, FileOffset, MdlChain) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        DllCall("ntoskrnl.exe\CcMdlWriteComplete", "ptr", FileObject, FileOffsetMarshal, FileOffset, "ptr", MdlChain)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<MDL>} MdlChain 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcMdlWriteAbort(FileObject, MdlChain) {
        DllCall("ntoskrnl.exe\CcMdlWriteAbort", "ptr", FileObject, "ptr", MdlChain)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcScheduleReadAhead(FileObject, FileOffset, Length) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        DllCall("ntoskrnl.exe\CcScheduleReadAhead", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length)
    }

    /**
     * 
     * @returns {NTSTATUS} 
     */
    static CcWaitForCurrentLazyWriterActivity() {
        result := DllCall("ntoskrnl.exe\CcWaitForCurrentLazyWriterActivity", "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} Granularity 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcSetReadAheadGranularity(FileObject, Granularity) {
        DllCall("ntoskrnl.exe\CcSetReadAheadGranularity", "ptr", FileObject, "uint", Granularity)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {BOOLEAN} Wait 
     * @param {Pointer} Buffer_R 
     * @param {PETHREAD} IoIssuerThread 
     * @returns {BOOLEAN} 
     */
    static CcCopyWriteEx(FileObject, FileOffset, Length, Wait, Buffer_R, IoIssuerThread) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\CcCopyWriteEx", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "char", Wait, "ptr", Buffer_R, "ptr", IoIssuerThread, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {BOOLEAN} Wait 
     * @param {Pointer} Buffer_R 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {PETHREAD} IoIssuerThread 
     * @returns {BOOLEAN} 
     */
    static CcCopyReadEx(FileObject, FileOffset, Length, Wait, Buffer_R, IoStatus, IoIssuerThread) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\CcCopyReadEx", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "char", Wait, "ptr", Buffer_R, "ptr", IoStatus, "ptr", IoIssuerThread, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {BOOLEAN} Wait 
     * @param {Pointer} Buffer_R 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {PETHREAD} IoIssuerThread 
     * @param {Pointer<CC_ASYNC_READ_CONTEXT>} AsyncReadContext 
     * @returns {BOOLEAN} 
     */
    static CcAsyncCopyRead(FileObject, FileOffset, Length, Wait, Buffer_R, IoStatus, IoIssuerThread, AsyncReadContext) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\CcAsyncCopyRead", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "char", Wait, "ptr", Buffer_R, "ptr", IoStatus, "ptr", IoIssuerThread, "ptr", AsyncReadContext, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {PETHREAD} IoIssuerThread 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcScheduleReadAheadEx(FileObject, FileOffset, Length, IoIssuerThread) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        DllCall("ntoskrnl.exe\CcScheduleReadAheadEx", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "ptr", IoIssuerThread)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<CC_FILE_SIZES>} FileSizes 
     * @param {BOOLEAN} PinAccess 
     * @param {Pointer<CACHE_MANAGER_CALLBACKS>} Callbacks 
     * @param {Pointer<Void>} LazyWriteContext 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcInitializeCacheMapEx(FileObject, FileSizes, PinAccess, Callbacks, LazyWriteContext, Flags) {
        LazyWriteContextMarshal := LazyWriteContext is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\CcInitializeCacheMapEx", "ptr", FileObject, "ptr", FileSizes, "char", PinAccess, "ptr", Callbacks, LazyWriteContextMarshal, LazyWriteContext, "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<Void>>} Bcb 
     * @param {Pointer<Pointer<Void>>} Buffer_R 
     * @returns {BOOLEAN} 
     */
    static CcPinRead(FileObject, FileOffset, Length, Flags, Bcb, Buffer_R) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        BcbMarshal := Bcb is VarRef ? "ptr*" : "ptr"
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\CcPinRead", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", Flags, BcbMarshal, Bcb, Buffer_RMarshal, Buffer_R, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<Void>>} Bcb 
     * @param {Pointer<Pointer<Void>>} Buffer_R 
     * @returns {BOOLEAN} 
     */
    static CcMapData(FileObject, FileOffset, Length, Flags, Bcb, Buffer_R) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        BcbMarshal := Bcb is VarRef ? "ptr*" : "ptr"
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\CcMapData", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", Flags, BcbMarshal, Bcb, Buffer_RMarshal, Buffer_R, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<Void>>} Bcb 
     * @returns {BOOLEAN} 
     */
    static CcPinMappedData(FileObject, FileOffset, Length, Flags, Bcb) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        BcbMarshal := Bcb is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\CcPinMappedData", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", Flags, BcbMarshal, Bcb, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {BOOLEAN} Zero 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<Void>>} Bcb 
     * @param {Pointer<Pointer<Void>>} Buffer_R 
     * @returns {BOOLEAN} 
     */
    static CcPreparePinWrite(FileObject, FileOffset, Length, Zero, Flags, Bcb, Buffer_R) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        BcbMarshal := Bcb is VarRef ? "ptr*" : "ptr"
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\CcPreparePinWrite", "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "char", Zero, "uint", Flags, BcbMarshal, Bcb, Buffer_RMarshal, Buffer_R, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} BcbVoid 
     * @param {Pointer<Integer>} Lsn 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcSetDirtyPinnedData(BcbVoid, Lsn) {
        BcbVoidMarshal := BcbVoid is VarRef ? "ptr" : "ptr"
        LsnMarshal := Lsn is VarRef ? "int64*" : "ptr"

        DllCall("ntoskrnl.exe\CcSetDirtyPinnedData", BcbVoidMarshal, BcbVoid, LsnMarshal, Lsn)
    }

    /**
     * 
     * @param {Pointer<Void>} Bcb 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcUnpinData(Bcb) {
        BcbMarshal := Bcb is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\CcUnpinData", BcbMarshal, Bcb)
    }

    /**
     * 
     * @param {Pointer<Void>} Bcb 
     * @param {Pointer<Void>} OwnerPointer 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcSetBcbOwnerPointer(Bcb, OwnerPointer) {
        BcbMarshal := Bcb is VarRef ? "ptr" : "ptr"
        OwnerPointerMarshal := OwnerPointer is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\CcSetBcbOwnerPointer", BcbMarshal, Bcb, OwnerPointerMarshal, OwnerPointer)
    }

    /**
     * 
     * @param {Pointer<Void>} Bcb 
     * @param {Pointer} ResourceThreadId 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcUnpinDataForThread(Bcb, ResourceThreadId) {
        BcbMarshal := Bcb is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\CcUnpinDataForThread", BcbMarshal, Bcb, "ptr", ResourceThreadId)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {BOOLEAN} DisableReadAhead 
     * @param {BOOLEAN} DisableWriteBehind 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcSetAdditionalCacheAttributes(FileObject, DisableReadAhead, DisableWriteBehind) {
        DllCall("ntoskrnl.exe\CcSetAdditionalCacheAttributes", "ptr", FileObject, "char", DisableReadAhead, "char", DisableWriteBehind)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcSetAdditionalCacheAttributesEx(FileObject, Flags) {
        DllCall("ntoskrnl.exe\CcSetAdditionalCacheAttributesEx", "ptr", FileObject, "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {BOOLEAN} EnableParallelFlush 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcSetParallelFlushFile(FileObject, EnableParallelFlush) {
        DllCall("ntoskrnl.exe\CcSetParallelFlushFile", "ptr", FileObject, "char", EnableParallelFlush)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Void>} LogHandle 
     * @param {Pointer<PFLUSH_TO_LSN>} FlushToLsnRoutine 
     * @returns {String} Nothing - always returns an empty string
     */
    static CcSetLogHandleForFile(FileObject, LogHandle, FlushToLsnRoutine) {
        LogHandleMarshal := LogHandle is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\CcSetLogHandleForFile", "ptr", FileObject, LogHandleMarshal, LogHandle, "ptr", FlushToLsnRoutine)
    }

    /**
     * 
     * @param {Pointer<Void>} LogHandle 
     * @param {Pointer<PDIRTY_PAGE_ROUTINE>} DirtyPageRoutine 
     * @param {Pointer<Void>} Context1 
     * @param {Pointer<Void>} Context2 
     * @returns {Integer} 
     */
    static CcGetDirtyPages(LogHandle, DirtyPageRoutine, Context1, Context2) {
        LogHandleMarshal := LogHandle is VarRef ? "ptr" : "ptr"
        Context1Marshal := Context1 is VarRef ? "ptr" : "ptr"
        Context2Marshal := Context2 is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\CcGetDirtyPages", LogHandleMarshal, LogHandle, "ptr", DirtyPageRoutine, Context1Marshal, Context1, Context2Marshal, Context2, "int64")
        return result
    }

    /**
     * 
     * @param {Pointer<VPB>} Vpb 
     * @returns {BOOLEAN} 
     */
    static CcIsThereDirtyData(Vpb) {
        result := DllCall("ntoskrnl.exe\CcIsThereDirtyData", "ptr", Vpb, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<VPB>} Vpb 
     * @param {Pointer<Integer>} NumberOfDirtyPages 
     * @returns {BOOLEAN} 
     */
    static CcIsThereDirtyDataEx(Vpb, NumberOfDirtyPages) {
        NumberOfDirtyPagesMarshal := NumberOfDirtyPages is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\CcIsThereDirtyDataEx", "ptr", Vpb, NumberOfDirtyPagesMarshal, NumberOfDirtyPages, "char")
        return result
    }

    /**
     * 
     * @param {NTSTATUS} Status 
     * @returns {BOOLEAN} 
     */
    static CcIsCacheManagerCallbackNeeded(Status) {
        result := DllCall("ntoskrnl.exe\CcIsCacheManagerCallbackNeeded", "int", Status, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<CC_ERROR_CALLBACK_CONTEXT>} Context 
     * @returns {NTSTATUS} 
     */
    static CcErrorCallbackRoutine(Context) {
        result := DllCall("ntoskrnl.exe\CcErrorCallbackRoutine", "ptr", Context, "int")
        return result
    }

    /**
     * Creates an instance of SspiAsyncContext which is used to track the async call.
     * @remarks
     * When done, the caller must free the async context with [SspiFreeAsyncContext](nf-sspi-sspifreeasynccontext.md)
     * 
     * While the instance's lifetime is the single async operation, it can be reused by calling [SspiReinitAsyncContext](nf-sspi-sspireinitasynccontext.md) after the operation has completed.
     * @returns {Pointer<SspiAsyncContext>} Returns the initialized SspiAsyncContext.
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspicreateasynccontext
     */
    static SspiCreateAsyncContext() {
        result := DllCall("ksecdd.sys\SspiCreateAsyncContext", "ptr")
        return result
    }

    /**
     * Frees up a context created in the call to the SspiCreateAsyncContext function.
     * @remarks
     * For all operations that require notification of completion, SspiFreeAsyncContext must not be called until the async operation is complete and the callback has been invoked. Calling [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md) will return status != SEC_I_ASYNC_CALL_PENDING to indicate the async operation has not completed.
     * @param {Pointer<SspiAsyncContext>} Handle The async call context to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspifreeasynccontext
     */
    static SspiFreeAsyncContext(Handle) {
        HandleMarshal := Handle is VarRef ? "ptr*" : "ptr"

        DllCall("ksecdd.sys\SspiFreeAsyncContext", HandleMarshal, Handle)
    }

    /**
     * Marks an async context for reuse.
     * @remarks
     * Only the context state is altered. Client notification info, such as callback, is left alone.
     * @param {Pointer<SspiAsyncContext>} Handle The async context handle.
     * @returns {NTSTATUS} If the context is invalid or currently in use, an error will be returned.
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspireinitasynccontext
     */
    static SspiReinitAsyncContext(Handle) {
        HandleMarshal := Handle is VarRef ? "ptr*" : "ptr"

        result := DllCall("ksecdd.sys\SspiReinitAsyncContext", HandleMarshal, Handle, "int")
        return result
    }

    /**
     * Registers a callback that is notified on async call completion.
     * @remarks
     * The *Callback* and *CallbackData* parameters can be set to **null** in order to specify that the caller is not interested in the result of the operation. 
     * 
     * > [!NOTE]
     * > Setting the callback to null is only supported for [SspiDeleteSecurityContextAsync](nf-sspi-sspideletesecuritycontextasync.md)
     * @param {Pointer<SspiAsyncContext>} Context The async call context.
     * @param {Pointer<SspiAsyncNotifyCallback>} Callback The SspiAsyncNotifyCallback that will be notified on call completion.
     * @param {Pointer<Void>} CallbackData An opaque pointer that is passed to [SspiAsyncNotifyCallback](nc-sspi-sspiasyncnotifycallback.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspisetasyncnotifycallback
     */
    static SspiSetAsyncNotifyCallback(Context, Callback, CallbackData) {
        ContextMarshal := Context is VarRef ? "ptr*" : "ptr"
        CallbackDataMarshal := CallbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("ksecdd.sys\SspiSetAsyncNotifyCallback", ContextMarshal, Context, "ptr", Callback, CallbackDataMarshal, CallbackData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the current status of an async call associated with the provided context.
     * @param {Pointer<SspiAsyncContext>} Handle The async call context to get status for.
     * @returns {HRESULT} When complete, returns the status of the async request. If the function succeeded, SspiGetAsyncCallStatus will return **SEC_E_OK**. Otherwise, refer to the respective API called to see return error codes and their respective descriptions.
     * 
     * Until the call is completed, status is **SEC_I_ASYNC_CALL_PENDING**.
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspigetasynccallstatus
     */
    static SspiGetAsyncCallStatus(Handle) {
        HandleMarshal := Handle is VarRef ? "ptr*" : "ptr"

        result := DllCall("ksecdd.sys\SspiGetAsyncCallStatus", HandleMarshal, Handle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Asynchronously acquires a handle to preexisting credentials of a security principal. (Unicode)
     * @remarks
     * The **SspiAcquireCredentialsHandleAsyncW** function returns a handle to the credentials of a principal, such as a user or client, as used by a specific [security package](/windows/desktop/SecGloss/s-gly). The function can return the handle to either preexisting credentials or newly created credentials and return it. This handle can be used in subsequent calls to the 
     * [SspiAcceptSecurityContextAsync](nf-sspi-sspiacceptsecuritycontextasync.md) and 
     * [SspiInitializeSecurityContextAsync](nf-sspi-sspiinitializesecuritycontextasynca.md) functions.
     * 
     * In general, **SspiAcquireCredentialsHandleAsyncW** does not provide  the credentials of other users logged on to the same computer. However, a caller with SE_TCB_NAME  [privilege](/windows/desktop/SecGloss/p-gly) can obtain the [credentials](/windows/desktop/SecGloss/c-gly) of an existing logon session by specifying the [logon identifier](/windows/desktop/SecGloss/l-gly) (LUID) of that session. Typically, this is used by kernel-mode modules that must act on behalf of a logged-on user.
     * 
     * A package might call the function in *pGetKeyFn* provided by the RPC run-time transport. If the transport does not support the notion of callback to retrieve credentials, this parameter must be **NULL**.
     * 
     * For kernel mode callers, the following differences must be noted:
     * 
     * - The two string parameters must be [Unicode](/windows/desktop/SecGloss/u-gly) strings.
     * - The buffer values must be allocated in process virtual memory, not from the pool.
     * 
     * When you have finished using the returned credentials, free the memory used by the credentials by calling the 
     * [SspiFreeCredentialsHandleAsync](nf-sspi-sspifreecredentialshandleasync.md) function.
     * @param {Pointer<SspiAsyncContext>} AsyncContext The async call context.
     * @param {Pointer<UNICODE_STRING>} pszPrincipal A pointer to a null-terminated string that specifies the name of the principal whose credentials the handle will reference asynchronously.
     * 
     * > [!NOTE]
     * > If the process that requests the handle does not have access to the credentials, the function returns an error. A null string indicates that the process requires a handle to the credentials of the user under whose [security context](/windows/desktop/SecGloss/s-gly) it is executing.
     * @param {Pointer<UNICODE_STRING>} pszPackage A pointer to a null-terminated string that specifies the name of the [security package](/windows/desktop/SecGloss/s-gly) with which these credentials will be used. This is a security package name returned in the **Name** member of a 
     * [SecPkgInfo](/windows/desktop/api/sspi/ns-sspi-secpkginfoa) structure returned by the 
     * [EnumerateSecurityPackages](/windows/desktop/api/sspi/nf-sspi-enumeratesecuritypackagesa)  function. After a context is established, 
     * [QueryContextAttributes (CredSSP)](/windows/desktop/api/sspi/nf-sspi-querycontextattributesa) can be called with *ulAttribute* set to **SECPKG_ATTR_PACKAGE_INFO** to return information on the security package in use.
     * @param {Integer} fCredentialUse 
     * @param {Pointer<Void>} pvLogonId A pointer to a [locally unique identifier](/windows/desktop/SecGloss/l-gly) (LUID) that identifies the user. This parameter is provided for file-system processes such as network redirectors. This parameter can be **NULL**.
     * @param {Pointer<Void>} pAuthData A pointer to a [CREDSSP_CRED](/windows/desktop/api/credssp/ns-credssp-credssp_cred) structure that specifies authentication data for both Schannel and Negotiate packages.
     * @param {Pointer<SEC_GET_KEY_FN>} pGetKeyFn Pointer to the GetKey() function.
     * @param {Pointer<Void>} pvGetKeyArgument Pass to GetKey().
     * @param {Pointer<SecHandle>} phCredential A pointer to the [CredHandle](/windows/desktop/SecAuthN/sspi-handles) structure that will receive the credential handle.
     * @param {Pointer<Integer>} ptsExpiry *optional* A pointer to a [TimeStamp](/windows/desktop/SecAuthN/timestamp) structure that receives the time at which the returned credentials expire. The structure value received depends on the security package, which must specify the value in local time.
     * @returns {HRESULT} Returns **SEC_E_OK** if the async request to acquire a credential handle was successfully queued for execution. Otherwise, it returns the error generated attempting to queue it. To retrieve the status of the operation, use [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md).
     * 
     * If the handle was acquired, SspiGetAsyncCallStatus returns **SEC_E_OK**. Otherwise, it may return *SEC_I_ASYNC_CALL_PENDING* if the call is still in progress, or any of the following fatal error codes in the table below.
     * 
     * |<div>Return code</div>|<div>Description</div>|
     * |---|---|
     * | **SEC_E_INSUFFICIENT_MEMORY** | There is insufficient memory available to complete the requested action. |
     * | **SEC_E_INTERNAL_ERROR** | An error occurred that did not map to an SSPI error code. |
     * | **SEC_E_NO_CREDENTIALS** | No credentials are available in the [security package](/windows/desktop/SecGloss/s-gly) |
     * | **SEC_E_NOT_OWNER** | The caller of the function does not have the necessary credentials. |
     * | **SEC_E_SECPKG_NOT_FOUND** | The requested security package does not exist.|
     * | **SEC_E_UNKNOWN_CREDENTIALS** | The credentials supplied to the package were not recognized. |
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiacquirecredentialshandleasyncw
     */
    static SspiAcquireCredentialsHandleAsyncW(AsyncContext, pszPrincipal, pszPackage, fCredentialUse, pvLogonId, pAuthData, pGetKeyFn, pvGetKeyArgument, phCredential, ptsExpiry) {
        AsyncContextMarshal := AsyncContext is VarRef ? "ptr*" : "ptr"
        pvLogonIdMarshal := pvLogonId is VarRef ? "ptr" : "ptr"
        pAuthDataMarshal := pAuthData is VarRef ? "ptr" : "ptr"
        pvGetKeyArgumentMarshal := pvGetKeyArgument is VarRef ? "ptr" : "ptr"
        ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

        result := DllCall("ksecdd.sys\SspiAcquireCredentialsHandleAsyncW", AsyncContextMarshal, AsyncContext, "ptr", pszPrincipal, "ptr", pszPackage, "uint", fCredentialUse, pvLogonIdMarshal, pvLogonId, pAuthDataMarshal, pAuthData, "ptr", pGetKeyFn, pvGetKeyArgumentMarshal, pvGetKeyArgument, "ptr", phCredential, ptsExpiryMarshal, ptsExpiry, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Asynchronously acquires a handle to preexisting credentials of a security principal. (ANSI)
     * @remarks
     * The **SspiAcquireCredentialsHandleAsyncA** function returns a handle to the credentials of a principal, such as a user or client, as used by a specific [security package](/windows/desktop/SecGloss/s-gly). The function can return the handle to either preexisting credentials or newly created credentials and return it. This handle can be used in subsequent calls to the 
     * [SspiAcceptSecurityContextAsync](nf-sspi-sspiacceptsecuritycontextasync.md) and 
     * [SspiInitializeSecurityContextAsync](nf-sspi-sspiinitializesecuritycontextasynca.md) functions.
     * 
     * In general, **SspiAcquireCredentialsHandleAsyncA** does not provide  the credentials of other users logged on to the same computer. However, a caller with SE_TCB_NAME  [privilege](/windows/desktop/SecGloss/p-gly) can obtain the [credentials](/windows/desktop/SecGloss/c-gly) of an existing logon session by specifying the [logon identifier](/windows/desktop/SecGloss/l-gly) (LUID) of that session. Typically, this is used by kernel-mode modules that must act on behalf of a logged-on user.
     * 
     * A package might call the function in *pGetKeyFn* provided by the RPC run-time transport. If the transport does not support the notion of callback to retrieve credentials, this parameter must be **NULL**.
     * 
     * For kernel mode callers, the following differences must be noted:
     * 
     * - The two string parameters must be [Unicode](/windows/desktop/SecGloss/u-gly) strings.
     * - The buffer values must be allocated in process virtual memory, not from the pool.
     * 
     * When you have finished using the returned credentials, free the memory used by the credentials by calling the 
     * [SspiFreeCredentialsHandleAsync](nf-sspi-sspifreecredentialshandleasync.md) function.
     * @param {Pointer<SspiAsyncContext>} AsyncContext The async call context.
     * @param {PSTR} pszPrincipal A pointer to a null-terminated string that specifies the name of the principal whose credentials the handle will reference asynchronously.
     * @param {PSTR} pszPackage A pointer to a null-terminated string that specifies the name of the [security package](/windows/desktop/SecGloss/s-gly) with which these credentials will be used. 
     * 
     * See [AcquireCredentialsHandleA: pszPackage](/windows/win32/secauthn/acquirecredentialshandle--general#parameters)
     * @param {Integer} fCredentialUse 
     * @param {Pointer<Void>} pvLogonId A pointer to a [locally unique identifier](/windows/desktop/SecGloss/l-gly) (LUID) that identifies the user. This parameter is provided for file-system processes such as network redirectors. This parameter can be **NULL**.
     * @param {Pointer<Void>} pAuthData A pointer to a [CREDSSP_CRED](/windows/desktop/api/credssp/ns-credssp-credssp_cred) structure that specifies authentication data for both Schannel and Negotiate packages.
     * @param {Pointer<SEC_GET_KEY_FN>} pGetKeyFn Pointer to the GetKey() function.
     * @param {Pointer<Void>} pvGetKeyArgument Pass to GetKey().
     * @param {Pointer<SecHandle>} phCredential A pointer to the [CredHandle](/windows/desktop/SecAuthN/sspi-handles) structure that will receive the credential handle.
     * @param {Pointer<Integer>} ptsExpiry *optional* A pointer to a [TimeStamp](/windows/desktop/SecAuthN/timestamp) structure that receives the time at which the returned credentials expire. The structure value received depends on the security package, which must specify the value in local time.
     * @returns {HRESULT} Returns **SEC_E_OK** if the async request to acquire a credential handle was successfully queued for execution. Otherwise, it returns the error generated attempting to queue it. To retrieve the status of the operation, use [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md).
     * 
     * If the handle was acquired, SspiGetAsyncCallStatus returns **SEC_E_OK**. Otherwise, it may return *SEC_I_ASYNC_CALL_PENDING* if the call is still in progress, or any of the following fatal error codes in the table below.
     * 
     * |<div>Return code</div>|<div>Description</div>|
     * |---|---|
     * | **SEC_E_INSUFFICIENT_MEMORY** | There is insufficient memory available to complete the requested action. |
     * | **SEC_E_INTERNAL_ERROR** | An error occurred that did not map to an SSPI error code. |
     * | **SEC_E_NO_CREDENTIALS** | No credentials are available in the [security package](/windows/desktop/SecGloss/s-gly) |
     * | **SEC_E_NOT_OWNER** | The caller of the function does not have the necessary credentials. |
     * | **SEC_E_SECPKG_NOT_FOUND** | The requested security package does not exist.|
     * | **SEC_E_UNKNOWN_CREDENTIALS** | The credentials supplied to the package were not recognized. |
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiacquirecredentialshandleasynca
     */
    static SspiAcquireCredentialsHandleAsyncA(AsyncContext, pszPrincipal, pszPackage, fCredentialUse, pvLogonId, pAuthData, pGetKeyFn, pvGetKeyArgument, phCredential, ptsExpiry) {
        pszPrincipal := pszPrincipal is String ? StrPtr(pszPrincipal) : pszPrincipal
        pszPackage := pszPackage is String ? StrPtr(pszPackage) : pszPackage

        AsyncContextMarshal := AsyncContext is VarRef ? "ptr*" : "ptr"
        pvLogonIdMarshal := pvLogonId is VarRef ? "ptr" : "ptr"
        pAuthDataMarshal := pAuthData is VarRef ? "ptr" : "ptr"
        pvGetKeyArgumentMarshal := pvGetKeyArgument is VarRef ? "ptr" : "ptr"
        ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

        result := DllCall("ksecdd.sys\SspiAcquireCredentialsHandleAsyncA", AsyncContextMarshal, AsyncContext, "ptr", pszPrincipal, "ptr", pszPackage, "uint", fCredentialUse, pvLogonIdMarshal, pvLogonId, pAuthDataMarshal, pAuthData, "ptr", pGetKeyFn, pvGetKeyArgumentMarshal, pvGetKeyArgument, "ptr", phCredential, ptsExpiryMarshal, ptsExpiry, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes an async security context. (Unicode)
     * @remarks
     * See [InitializeSecurityContext](/windows/win32/secauthn/initializesecuritycontext--general#remarks) for complete remarks.
     * @param {Pointer<SspiAsyncContext>} AsyncContext The async call context.
     * @param {Pointer<SecHandle>} phCredential A handle to the credentials returned by 
     * [AcquireCredentialsHandle](nf-sspi-sspiacquirecredentialshandleasynca.md). This handle is used to build the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>.
     * @param {Pointer<SecHandle>} phContext A pointer to an existing [CtxtHandle](/windows/desktop/SecAuthN/sspi-handles) structure.
     * @param {Pointer<UNICODE_STRING>} pszTargetName A pointer to a null-terminated string that indicates the target of the context. The string contents are [*security package*](/windows/win32/secgloss/s-gly) specific, as described in the following table. This list is not exhaustive. Additional system SSPs and third party SSPs can be added to a system.
     * 
     * | SSP in use | Meaning |
     * |---|---|
     * | **Digest** | Null-terminated string that uniquely identifies the URI of the requested resource. The string must be composed of characters that are allowed in a URI and must be representable by the US ASCII code set. Percent encoding can be used to represent characters outside the US ASCII code set. |
     * | **Kerberos or Negotiate** | Service principal name (SPN) or the [security context](/windows/win32/secgloss/s-gly) of the destination server. |
     * | **NTLM** | Service principal name (SPN) or the [security context](/windows/win32/secgloss/s-gly) of the destination server. |
     * | **Schannel/SSL** | Null-terminated string that uniquely identifies the target server. Schannel uses this value to verify the server certificate. Schannel also uses this value to locate the session in the session cache when reestablishing a connection. The cached session is used only if all of the following conditions are met: <ul><li> The target name is the same.</li><li>The cache entry has not expired.<li>The application process that calls the function is the same.<li>The logon session is the same.<li>The credential handle is the same.</li></li></li></li></ul> |
     * @param {Integer} fContextReq Bit flags that indicate requests for the context.
     * 
     * See [InitializeSecurityContext: fContextReq](/windows/win32/secauthn/initializesecuritycontext--general#parameters) for a list of flag values and their meanings.
     * @param {Integer} Reserved1 This parameter is reserved and must be set to zero.
     * @param {Integer} TargetDataRep The data representation, such as byte ordering, on the target. This parameter can be either SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
     * @param {Pointer<SecBufferDesc>} pInput A pointer to a [SecBufferDesc](./ns-sspi-secbufferdesc.md) structure that contains pointers to the buffers supplied as input to the package.
     * @param {Integer} Reserved2 This parameter is reserved and must be set to zero.
     * @param {Pointer<SecHandle>} phNewContext A pointer to a [CtxtHandle](/windows/win32/secauthn/sspi-handles) structure.
     * @param {Pointer<SecBufferDesc>} pOutput A pointer to a [SecBufferDesc](./ns-sspi-secbufferdesc.md) structure that contains pointers to the SecBuffer structure that receives the output data.
     * @param {Pointer<Integer>} pfContextAttr A pointer to a variable to receive a set of bit flags that indicate the attributes of the established context. For a description of the various attributes, see [Context Requirements](/windows/win32/secauthn/context-requirements).
     * @param {Pointer<Integer>} ptsExpiry *Optional*. A pointer to a [TimeStamp](/windows/win32/secauthn/timestamp) structure that receives the expiration time of the context.
     * @returns {HRESULT} Returns **SEC_E_OK** if the async request to establish a security context was successfully queued for execution, otherwise, returns the error generated attempting to queue it. To retrieve the status of the operation, use [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md).
     * 
     * If the security context received from the server was accepted, SspiGetAsyncCallStatus returns **SEC_E_OK** or one of the SSPI codes in the table below. Otherwise, it may return **SEC_I_ASYNC_CALL_PENDING** if the call is still in progress, or any of the following fatal error codes in the second table below.
     * 
     * |<div>Return code</div>|<div>Description</div>|
     * |---|---|
     * |**SEC_I_COMPLETE_AND_CONTINUE**<br>0x00090314L| The client must call [CompleteAuthToken](/windows/desktop/api/sspi/nf-sspi-completeauthtoken) and pass the output token to the server. The client then waits for a returned token and passes it, in another call, to SspiInitializeSecurityContextAsyncA. |
     * |**SEC_I_COMPLETE_NEEDED**<br>0x00090313L |  The client must finish building the message from the server before calling [CompleteAuthToken](/windows/desktop/api/sspi/nf-sspi-completeauthtoken).|
     * |**SEC_I_CONTINUE_NEEDED**<br>0x00090312L| The client must send the output token to the server and wait for a return token. The returned token is then passed in another call to SspiInitializeSecurityContextAsyncA. The output token can be empty. |
     * | **SEC_I_INCOMPLETE_CREDENTIALS** | Use with Schannel. The server has requested client authentication, and the supplied credentials either do not include a certificate or the certificate was not issued by a certification authority that is trusted by the server. |
     * |**SEC_E_INCOMPLETE_MESSAGE**<br>0x80090318L |  Data for the whole message was not read from the wire. When this value is returned, the pInput buffer contains a SecBuffer structure with a BufferType member of SECBUFFER_MISSING. The cbBuffer member of SecBuffer contains a value that indicates the number of additional bytes that the function must read from the client before this function succeeds. While this number is not always accurate, using it can help improve performance by avoiding multiple calls to this function.|
     * |**SEC_E_OK**<br>0x00000000L| The security context received from the client was accepted. If the function generated an output token, the token must be sent to the server.|
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiinitializesecuritycontextasyncw
     */
    static SspiInitializeSecurityContextAsyncW(AsyncContext, phCredential, phContext, pszTargetName, fContextReq, Reserved1, TargetDataRep, pInput, Reserved2, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
        AsyncContextMarshal := AsyncContext is VarRef ? "ptr*" : "ptr"
        pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
        ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

        result := DllCall("ksecdd.sys\SspiInitializeSecurityContextAsyncW", AsyncContextMarshal, AsyncContext, "ptr", phCredential, "ptr", phContext, "ptr", pszTargetName, "uint", fContextReq, "uint", Reserved1, "uint", TargetDataRep, "ptr", pInput, "uint", Reserved2, "ptr", phNewContext, "ptr", pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes an async security context. (ANSI)
     * @remarks
     * See [InitializeSecurityContext](/windows/win32/secauthn/initializesecuritycontext--general#remarks) for complete remarks.
     * @param {Pointer<SspiAsyncContext>} AsyncContext The async call context.
     * @param {Pointer<SecHandle>} phCredential A handle to the credentials returned by 
     * [AcquireCredentialsHandle](nf-sspi-sspiacquirecredentialshandleasynca.md). This handle is used to build the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>.
     * @param {Pointer<SecHandle>} phContext A pointer to an existing [CtxtHandle](/windows/desktop/SecAuthN/sspi-handles) structure.
     * @param {PSTR} pszTargetName A pointer to a null-terminated string that indicates the target of the context. The string contents are [*security package*](/windows/win32/secgloss/s-gly) specific, as described in the following table. This list is not exhaustive. Additional system SSPs and third party SSPs can be added to a system.
     * 
     * | SSP in use | Meaning |
     * |---|---|
     * | **Digest** | Null-terminated string that uniquely identifies the URI of the requested resource. The string must be composed of characters that are allowed in a URI and must be representable by the US ASCII code set. Percent encoding can be used to represent characters outside the US ASCII code set. |
     * | **Kerberos or Negotiate** | Service principal name (SPN) or the [security context](/windows/win32/secgloss/s-gly) of the destination server. |
     * | **NTLM** | Service principal name (SPN) or the [security context](/windows/win32/secgloss/s-gly) of the destination server. |
     * | **Schannel/SSL** | Null-terminated string that uniquely identifies the target server. Schannel uses this value to verify the server certificate. Schannel also uses this value to locate the session in the session cache when reestablishing a connection. The cached session is used only if all of the following conditions are met: <ul><li> The target name is the same.</li><li>The cache entry has not expired.<li>The application process that calls the function is the same.<li>The logon session is the same.<li>The credential handle is the same.</li></li></li></li></ul> |
     * @param {Integer} fContextReq Bit flags that indicate requests for the context.
     * 
     * See [InitializeSecurityContext: fContextReq](/windows/win32/secauthn/initializesecuritycontext--general#parameters) for a list of flag values and their meanings.
     * @param {Integer} Reserved1 This parameter is reserved and must be set to zero.
     * @param {Integer} TargetDataRep The data representation, such as byte ordering, on the target. This parameter can be either SECURITY_NATIVE_DREP or SECURITY_NETWORK_DREP.
     * @param {Pointer<SecBufferDesc>} pInput A pointer to a [SecBufferDesc](./ns-sspi-secbufferdesc.md) structure that contains pointers to the buffers supplied as input to the package.
     * @param {Integer} Reserved2 This parameter is reserved and must be set to zero.
     * @param {Pointer<SecHandle>} phNewContext A pointer to a [CtxtHandle](/windows/win32/secauthn/sspi-handles) structure.
     * @param {Pointer<SecBufferDesc>} pOutput A pointer to a [SecBufferDesc](./ns-sspi-secbufferdesc.md) structure that contains pointers to the SecBuffer structure that receives the output data.
     * @param {Pointer<Integer>} pfContextAttr A pointer to a variable to receive a set of bit flags that indicate the attributes of the established context. For a description of the various attributes, see [Context Requirements](/windows/win32/secauthn/context-requirements).
     * @param {Pointer<Integer>} ptsExpiry *Optional*. A pointer to a [TimeStamp](/windows/win32/secauthn/timestamp) structure that receives the expiration time of the context.
     * @returns {HRESULT} Returns **SEC_E_OK** if the async request to establish a security context was successfully queued for execution, otherwise, returns the error generated attempting to queue it. To retrieve the status of the operation, use [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md).
     * 
     * If the security context received from the server was accepted, SspiGetAsyncCallStatus returns **SEC_E_OK** or one of the SSPI codes in the table below. Otherwise, it may return **SEC_I_ASYNC_CALL_PENDING** if the call is still in progress, or any of the following fatal error codes in the second table below.
     * 
     * |<div>Return code</div>|<div>Description</div>|
     * |---|---|
     * |**SEC_I_COMPLETE_AND_CONTINUE**<br>0x00090314L| The client must call [CompleteAuthToken](/windows/desktop/api/sspi/nf-sspi-completeauthtoken) and pass the output token to the server. The client then waits for a returned token and passes it, in another call, to SspiInitializeSecurityContextAsyncA. |
     * |**SEC_I_COMPLETE_NEEDED**<br>0x00090313L |  The client must finish building the message from the server before calling [CompleteAuthToken](/windows/desktop/api/sspi/nf-sspi-completeauthtoken).|
     * |**SEC_I_CONTINUE_NEEDED**<br>0x00090312L| The client must send the output token to the server and wait for a return token. The returned token is then passed in another call to SspiInitializeSecurityContextAsyncA. The output token can be empty. |
     * | **SEC_I_INCOMPLETE_CREDENTIALS** | Use with Schannel. The server has requested client authentication, and the supplied credentials either do not include a certificate or the certificate was not issued by a certification authority that is trusted by the server. |
     * |**SEC_E_INCOMPLETE_MESSAGE**<br>0x80090318L |  Data for the whole message was not read from the wire. When this value is returned, the pInput buffer contains a SecBuffer structure with a BufferType member of SECBUFFER_MISSING. The cbBuffer member of SecBuffer contains a value that indicates the number of additional bytes that the function must read from the client before this function succeeds. While this number is not always accurate, using it can help improve performance by avoiding multiple calls to this function.|
     * |**SEC_E_OK**<br>0x00000000L| The security context received from the client was accepted. If the function generated an output token, the token must be sent to the server.|
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiinitializesecuritycontextasynca
     */
    static SspiInitializeSecurityContextAsyncA(AsyncContext, phCredential, phContext, pszTargetName, fContextReq, Reserved1, TargetDataRep, pInput, Reserved2, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
        pszTargetName := pszTargetName is String ? StrPtr(pszTargetName) : pszTargetName

        AsyncContextMarshal := AsyncContext is VarRef ? "ptr*" : "ptr"
        pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
        ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

        result := DllCall("ksecdd.sys\SspiInitializeSecurityContextAsyncA", AsyncContextMarshal, AsyncContext, "ptr", phCredential, "ptr", phContext, "ptr", pszTargetName, "uint", fContextReq, "uint", Reserved1, "uint", TargetDataRep, "ptr", pInput, "uint", Reserved2, "ptr", phNewContext, "ptr", pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Lets the server component of a transport application asynchronously establish a security context between the server and a remote client.
     * @remarks
     * The **SspiAcceptSecurityContextAsync** function is the server counterpart to the 
     * [SspiInitializeSecurityContextAsync](nf-sspi-sspiinitializesecuritycontextasynca.md) function.
     * 
     * The caller is responsible for determining whether the final context attributes are sufficient. For example, if confidentiality (encryption) was requested but could not be established, some applications may choose to shut down the connection immediately. If the security context cannot be established, the server must free the partially created context by calling the [SspiDeleteSecurityContextAsync](nf-sspi-sspideletesecuritycontextasync.md) function.
     * 
     * See [AcceptSecurityContext](/windows/win32/secauthn/acceptsecuritycontext--schannel#remarks) for additional remarks.
     * @param {Pointer<SspiAsyncContext>} AsyncContext The async call context.
     * @param {Pointer<SecHandle>} phCredential A handle to the server credentials. To retrieve this handle, the server calls the 
     * [SspiAcquireCredentialsHandleAsync](nf-sspi-sspiacquirecredentialshandleasynca.md) function with either the SECPKG_CRED_INBOUND or SECPKG_CRED_BOTH flag set.
     * @param {Pointer<SecHandle>} phContext A pointer to a [CtxtHandle](/windows/desktop/SecAuthN/sspi-handles) structure. On the first call to [SspiAcceptSecurityContextAsync](nf-sspi-sspiacceptsecuritycontextasync.md), this pointer is **NULL**. On subsequent calls, *phContext* specifies the partially formed context returned in the *phNewContext* parameter by the first call.
     * @param {Pointer<SecBufferDesc>} pInput A pointer to a 
     * [SecBufferDesc](/windows/desktop/api/sspi/ns-sspi-secbufferdesc) structure generated by a client call to 
     * [SspiInitializeSecurityContextAsync](nf-sspi-sspiinitializesecuritycontextasynca.md). The structure contains the input buffer descriptor.
     * 
     * The first buffer must be of type **SECBUFFER_TOKEN** and contain the security token received from the client. The second buffer should be of type **SECBUFFER_EMPTY**.
     * @param {Integer} fContextReq Bit flags that specify the attributes required by the server to establish the context. 
     * 
     * See [AcceptSecurityContext: fContextReq](/windows/win32/secauthn/acceptsecuritycontext--schannel#parameters) for a full list of parameter values.
     * @param {Integer} TargetDataRep The data representation, such as byte ordering, on the target. This parameter can be either **SECURITY_NATIVE_DREP** or **SECURITY_NETWORK_DREP**.
     * @param {Pointer<SecHandle>} phNewContext A pointer to a [CtxtHandle](/windows/desktop/SecAuthN/sspi-handles) structure. On the first call to **SspiAcceptSecurityContextAsync**, this pointer receives the new context handle. On subsequent calls, *phNewContext* can be the same as the handle specified in the *phContext* parameter.
     * @param {Pointer<SecBufferDesc>} pOutput A pointer to a 
     * [SecBufferDesc](/windows/desktop/api/sspi/ns-sspi-secbufferdesc) structure that contains the output buffer descriptor. This buffer is sent to the client for input into additional calls to [SspiInitializeSecurityContextAsync](nf-sspi-sspiinitializesecuritycontextasynca.md). An output buffer may be generated even if the function returns SEC_E_OK. Any buffer generated must be sent back to the client application.
     * 
     * On output, this buffer receives a token for the async security context. The token must be sent to the client. The function can also return a buffer of type SECBUFFER_EXTRA.
     * @param {Pointer<Integer>} pfContextAttr A pointer to a set of bit flags that indicate the attributes of the established context. 
     * 
     * See [AcceptSecurityContext: pfContextAttr](/windows/win32/secauthn/acceptsecuritycontext--schannel#parameters) for descriptions of the attributes.
     * @param {Pointer<Integer>} ptsExpiry A pointer to a [TimeStamp](/windows/desktop/SecAuthN/timestamp) structure that receives the expiration time of the context. 
     * 
     * See [AcceptSecurityContext: ptsExpiry](/windows/win32/secauthn/acceptsecuritycontext--schannel#parameters).
     * @returns {HRESULT} Returns **SEC_E_OK** if the async request to establish a security context was successfully queued for execution. Otherwise, it returns the error generated attempting to queue it. To retrieve the status of the operation, use [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md).
     * 
     * If the security context received from the client was accepted, SspiGetAsyncCallStatus returns **SEC_E_OK** or one of the SSPI codes in the table below. Otherwise, it may return **SEC_I_ASYNC_CALL_PENDING** if the call is still in progress, or any of the following fatal error codes in the second table below.
     * 
     * |<div>Return code</div>|<div>Description</div>|
     * |---|---|
     * |**SEC_E_INCOMPLETE_MESSAGE**<br>0x80090318L | The function succeeded. The data in the input buffer is incomplete. The application must read additional data from the client and call SspiAcceptSecurityContextAsync again.|
     * |**SEC_I_COMPLETE_AND_CONTINUE**<br>0x00090314L|The function succeeded. The server must call [CompleteAuthToken](/windows/desktop/api/sspi/nf-sspi-completeauthtoken) and pass the output token to the client. The server must then wait for a return token from the client before making another call to SspiAcceptSecurityContextAsync.|
     * |**SEC_I_COMPLETE_NEEDED**<br>0x00090313L | The function succeeded. The server must finish building the message from the client before calling [CompleteAuthToken](/windows/desktop/api/sspi/nf-sspi-completeauthtoken).|
     * |**SEC_I_CONTINUE_NEEDED**<br>0x00090312L|The function succeeded. The server must send the output token to the client and wait for a returned token. The returned token should be passed in *pInput* for another call to SspiAcceptSecurityContextAsync.|
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspiacceptsecuritycontextasync
     */
    static SspiAcceptSecurityContextAsync(AsyncContext, phCredential, phContext, pInput, fContextReq, TargetDataRep, phNewContext, pOutput, pfContextAttr, ptsExpiry) {
        AsyncContextMarshal := AsyncContext is VarRef ? "ptr*" : "ptr"
        pfContextAttrMarshal := pfContextAttr is VarRef ? "uint*" : "ptr"
        ptsExpiryMarshal := ptsExpiry is VarRef ? "int64*" : "ptr"

        result := DllCall("ksecdd.sys\SspiAcceptSecurityContextAsync", AsyncContextMarshal, AsyncContext, "ptr", phCredential, "ptr", phContext, "ptr", pInput, "uint", fContextReq, "uint", TargetDataRep, "ptr", phNewContext, "ptr", pOutput, pfContextAttrMarshal, pfContextAttr, ptsExpiryMarshal, ptsExpiry, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Frees up a credential handle.
     * @param {Pointer<SspiAsyncContext>} AsyncContext The async call context.
     * @param {Pointer<SecHandle>} phCredential The credential handle to free.
     * @returns {HRESULT} Returns **SEC_E_OK** if the async request to free the credential handle was successfully queued for execution. Otherwise, it returns the error generated attempting to queue it. To retrieve the status of the operation, use [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md).
     * 
     * SspiGetAsyncCallStatus returns **SEC_E_OK** on completion. Otherwise, it may return **SEC_I_ASYNC_CALL_PENDING** if the call is still in progress.
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspifreecredentialshandleasync
     */
    static SspiFreeCredentialsHandleAsync(AsyncContext, phCredential) {
        AsyncContextMarshal := AsyncContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("ksecdd.sys\SspiFreeCredentialsHandleAsync", AsyncContextMarshal, AsyncContext, "ptr", phCredential, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deletes the local data structures associated with the specified security context initiated by a previous call to the SspiInitializeSecurityContextAsync function or the SspiAcceptSecurityContextAsync function.
     * @remarks
     * On async call completion, callers can choose to opt out of receiving a notification by avoiding setting a callback for a new SspiAsyncContext or by removing the callback using [SspiSetAsyncNotifyCallback](nf-sspi-sspisetasyncnotifycallback.md) with a null parameter. If opting out, the caller should free the context with [SspiFreeAsyncContext](nf-sspi-sspifreeasynccontext.md) immediately after calling SspiDeleteSecurityContextAsync, unless the context is intended for reuse.
     * 
     * The **SspiDeleteSecurityContextAsync** function terminates a security context and frees associated resources.
     * 
     * The caller must call this function for a security context when that security context is no longer needed. This is true if the security context is partial, incomplete, rejected, or failed. After the security context is successfully deleted, further use of that security context is not permitted and the handle is no longer valid.
     * @param {Pointer<SspiAsyncContext>} AsyncContext The async call context.
     * @param {Pointer<SecHandle>} phContext Handle of the security context to delete.
     * @returns {HRESULT} Returns **SEC_E_OK** if the async request to delete the security context was successfully queued for execution. Otherwise, it returns the error generated attempting to queue it. To retrieve the status of the operation, use [SspiGetAsyncCallStatus](nf-sspi-sspigetasynccallstatus.md).
     * 
     * SspiGetAsyncCallStatus returns **SEC_E_OK** on completion. Otherwise, it may return **SEC_I_ASYNC_CALL_PENDING** if the call is still in progress, or one of the error codes below.
     * 
     * |<div>Return code</div>|<div>Description</div>|
     * |---|---|
     * |**SEC_E_INVALID_HANDLE**|The handle passed to the function is not valid.|
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-sspideletesecuritycontextasync
     */
    static SspiDeleteSecurityContextAsync(AsyncContext, phContext) {
        AsyncContextMarshal := AsyncContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("ksecdd.sys\SspiDeleteSecurityContextAsync", AsyncContextMarshal, AsyncContext, "ptr", phContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Completes an authentication token. (CompleteAuthToken)
     * @remarks
     * The client of a transport application calls the <b>CompleteAuthToken</b> function to allow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> to update a checksum or similar operation after all the protocol headers have been updated by the transport application. The client calls this function only if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (Digest)</a> call returned SEC_I_COMPLETE_NEEDED or SEC_I_COMPLETE_AND_CONTINUE.
     * @param {Pointer<SecHandle>} phContext A handle of the context that needs to be completed.
     * @param {Pointer<SecBufferDesc>} pToken A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains the buffer descriptor for the entire message.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 						
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle that was passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The token that was passed to the function is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_OUT_OF_SEQUENCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client's security context was located, but the message number is incorrect. This return value is used with the Digest SSP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_MESSAGE_ALTERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client's security context was located, but the client's message has been tampered with. This return value is used with the Digest SSP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred that did not map to an SSPI error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-completeauthtoken
     */
    static CompleteAuthToken(phContext, pToken) {
        result := DllCall("SECUR32.dll\CompleteAuthToken", "ptr", phContext, "ptr", pToken, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Obtains the access token for a client security context and uses it directly.
     * @remarks
     * This function is called by a server application to control impersonation outside the SSPI layer, such as when launching a child process. The handle returned must be closed with <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> when the handle is no longer needed.
     * @param {Pointer<SecHandle>} phContext Handle of the context to query.
     * @returns {Pointer<Void>} Returned handle to the access token.
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-querysecuritycontexttoken
     */
    static QuerySecurityContextToken(phContext) {
        result := DllCall("SECUR32.dll\QuerySecurityContextToken", "ptr", phContext, "ptr*", &Token := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Token
    }

    /**
     * Provides a way to apply a control token to a security context.
     * @remarks
     * The <b>ApplyControlToken</b> function can modify the context based on this token. Among the tokens that this function can add to the client context are <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-schannel_alert_token">SCHANNEL_ALERT_TOKEN</a> and <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-schannel_session_token">SCHANNEL_SESSION_TOKEN</a>.
     * 
     * This function can be used to shut down the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> that underlies an existing Schannel connection. For information about how to do this, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/shutting-down-an-schannel-connection">Shutting Down an Schannel Connection</a>.
     * @param {Pointer<SecHandle>} phContext A handle to the context to which the token is applied.
     * 
     * For information about the way the Schannel SSP notifies the remote party of the shutdown, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-decryptmessage">DecryptMessage (Schannel)</a>. For additional information on the use of this function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/shutting-down-an-schannel-connection">Shutting Down an Schannel Connection</a>.
     * @param {Pointer<SecBufferDesc>} pInput A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that contains a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure that contains the input token to apply to the context.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns a nonzero error code. The following error code is one of the possible error codes that can be returned.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is returned by Schannel kernel mode to indicate that this function is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-applycontroltoken
     */
    static ApplyControlToken(phContext, pInput) {
        result := DllCall("SECUR32.dll\ApplyControlToken", "ptr", phContext, "ptr", pInput, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables a transport application to set attributes of a security context for a security package. This function is supported only by the Schannel security package. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The sspi.h header defines SetContextAttributes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<SecHandle>} phContext A handle to the security context to be set.
     * @param {Integer} ulAttribute 
     * @param {Pointer} pBuffer A pointer to a structure that contains  values to set  the attributes to. The type of structure pointed to depends on the value specified in the <i>ulAttribute</i> parameter.
     * @param {Integer} cbBuffer The size, in bytes, of the <i>pBuffer</i> parameter.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns a nonzero error code. The following error code is one of the possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is returned by Schannel kernel mode to indicate that this function is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-setcontextattributesw
     */
    static SetContextAttributesW(phContext, ulAttribute, pBuffer, cbBuffer) {
        result := DllCall("SECUR32.dll\SetContextAttributesW", "ptr", phContext, "uint", ulAttribute, "ptr", pBuffer, "uint", cbBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Generates a cryptographic checksum of the message, and also includes sequencing information to prevent message loss or insertion.
     * @remarks
     * The <b>MakeSignature</b> function generates a signature that is based on the message and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-verifysignature">VerifySignature</a> function verifies the messages signed by the <b>MakeSignature</b> function.
     * 
     * If the transport application created the security context to support sequence detection and the caller provides a sequence number, the function includes this information in the signature. This protects against reply, insertion, and suppression of messages. The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> incorporates the sequence number passed down from the transport application.
     * @param {Pointer<SecHandle>} phContext A handle to the security context to use to sign the message.
     * @param {Integer} fQOP <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Package</a>-specific flags that indicate the quality of protection. A security package can use this parameter to enable the selection of cryptographic algorithms.
     * 
     * When using the Digest SSP, this parameter must be set to zero.
     * @param {Pointer<SecBufferDesc>} pMessage A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure. On input, the structure references one or more 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures that contain the message to be signed. The function does not process buffers with the SECBUFFER_READONLY_WITH_CHECKSUM  attribute.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure also references a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structure of type SECBUFFER_TOKEN that receives the signature.
     * 
     * When the Digest SSP is used as an HTTP authentication protocol, the buffers should be configured as follows.
     * 
     * <table>
     * <tr>
     * <th>Buffer #/buffer type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * <dt>SECBUFFER_TOKEN</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="1"></a><dl>
     * <dt><b>1</b></dt>
     * <dt>SECBUFFER_PKG_PARAMS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="2"></a><dl>
     * <dt><b>2</b></dt>
     * <dt>SECBUFFER_PKG_PARAMS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="3"></a><dl>
     * <dt><b>3</b></dt>
     * <dt>SECBUFFER_PKG_PARAMS</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * HEntity. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/input-buffers-for-the-digest-challenge-response">Input Buffers for the Digest Challenge Response</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="4"></a><dl>
     * <dt><b>4</b></dt>
     * <dt>SECBUFFER_PADDING</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Empty. Receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">signature</a>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * When the Digest SSP is used as an SASL mechanism, the buffers should be configured as follows.
     * 
     * <table>
     * <tr>
     * <th>Buffer #/buffer type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * <dt>SECBUFFER_TOKEN</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Empty. Receives the signature. This buffer must be large enough to hold the largest possible signature. Determine the size required by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querycontextattributesa">QueryContextAttributes (General)</a> function and specifying SECPKG_ATTR_SIZES. Check the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secpkgcontext_sizes">SecPkgContext_Sizes</a> structure member <b>cbMaxSignature</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="1"></a><dl>
     * <dt><b>1</b></dt>
     * <dt>SECBUFFER_DATA</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Message to be signed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="2"></a><dl>
     * <dt><b>2</b></dt>
     * <dt>SECBUFFER_PADDING</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Empty.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} MessageSeqNo The sequence number that the transport application assigned to the message. If the transport application does not maintain sequence numbers, this parameter is zero.
     * 
     * When using the Digest SSP, this parameter must be set to zero. The Digest SSP manages sequence numbering internally.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_I_RENEGOTIATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote party requires a new handshake sequence or the application has just initiated a shutdown. Return to the negotiation loop and call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-initializesecuritycontexta">InitializeSecurityContext (General)</a> again. An empty input buffer is passed in the first call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context handle specified by <i>phContext</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_INVALID_TOKEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pMessage</i> did not contain a valid SECBUFFER_TOKEN buffer or contained too few buffers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_OUT_OF_SEQUENCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/n-gly">nonce</a> count is out of sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_NO_AUTHENTICATING_AUTHORITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> (<i>phContext</i>) must be revalidated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The nonce count is not numeric.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_QOP_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The quality of protection negotiated between the client and server did not include <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">integrity</a> checking.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-makesignature
     */
    static MakeSignature(phContext, fQOP, pMessage, MessageSeqNo) {
        result := DllCall("SECUR32.dll\MakeSignature", "ptr", phContext, "uint", fQOP, "ptr", pMessage, "uint", MessageSeqNo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Verifies that a message signed by using the MakeSignature function was received in the correct sequence and has not been modified.
     * @remarks
     * <div class="alert"><b>Warning</b>  <p class="note">The <b>VerifySignature</b> function will fail if the message was signed using the <a href="https://docs.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsasignpsssha512">RsaSignPssSha512</a> algorithm on a different version of Windows. For example, a message that was signed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> function on Windows 8 will cause the <b>VerifySignature</b> function on Windows 8.1 to fail.
     * 
     * </div>
     * <div> </div>
     * @param {Pointer<SecHandle>} phContext A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> to use for the message.
     * @param {Pointer<SecBufferDesc>} pMessage Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbufferdesc">SecBufferDesc</a> structure that references a set of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures that contain the message and signature to verify. The signature is in a <b>SecBuffer</b> structure of type SECBUFFER_TOKEN.
     * @param {Integer} MessageSeqNo Specifies the sequence number expected by the transport application, if any. If the transport application does not maintain sequence numbers, this parameter is zero.
     * @returns {Integer} Pointer to a <b>ULONG</b> variable that receives package-specific flags that indicate the quality of protection.
     * 
     * Some security packages ignore this parameter.
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-verifysignature
     */
    static VerifySignature(phContext, pMessage, MessageSeqNo) {
        result := DllCall("SECUR32.dll\VerifySignature", "ptr", phContext, "ptr", pMessage, "uint", MessageSeqNo, "uint*", &pfQOP := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfQOP
    }

    /**
     * The ExportSecurityContext function creates a serialized representation of a security context that can later be imported into a different process by calling ImportSecurityContext.
     * @param {Pointer<SecHandle>} phContext A handle of the security context to be exported.
     * @param {Integer} fFlags 
     * @param {Pointer<SecBuffer>} pPackedContext A pointer to a buffer of type <b>SECBUFFER_EMPTY</b> that receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">serialized</a> security context. When you have finished using this context,  free it by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     * @returns {Pointer<Void>} A pointer to receive the handle of the context's token.
     * 
     * When you have finished using the user token, release the handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/sspi/nf-sspi-exportsecuritycontext
     */
    static ExportSecurityContext(phContext, fFlags, pPackedContext) {
        result := DllCall("SECUR32.dll\ExportSecurityContext", "ptr", phContext, "uint", fFlags, "ptr", pPackedContext, "ptr*", &pToken := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pToken
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} ServiceClass 
     * @param {Pointer<UNICODE_STRING>} ServiceName 
     * @param {Pointer<UNICODE_STRING>} InstanceName 
     * @param {Integer} InstancePort 
     * @param {Pointer<UNICODE_STRING>} Referrer 
     * @param {Pointer<UNICODE_STRING>} Spn 
     * @param {Pointer<Integer>} Length 
     * @param {BOOLEAN} Allocate 
     * @returns {NTSTATUS} 
     */
    static SecMakeSPN(ServiceClass, ServiceName, InstanceName, InstancePort, Referrer, Spn, Length, Allocate) {
        LengthMarshal := Length is VarRef ? "uint*" : "ptr"

        result := DllCall("ksecdd.sys\SecMakeSPN", "ptr", ServiceClass, "ptr", ServiceName, "ptr", InstanceName, "ushort", InstancePort, "ptr", Referrer, "ptr", Spn, LengthMarshal, Length, "char", Allocate, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} ServiceClass 
     * @param {Pointer<UNICODE_STRING>} ServiceName 
     * @param {Pointer<UNICODE_STRING>} InstanceName 
     * @param {Integer} InstancePort 
     * @param {Pointer<UNICODE_STRING>} Referrer 
     * @param {Pointer<UNICODE_STRING>} TargetInfo 
     * @param {Pointer<UNICODE_STRING>} Spn 
     * @param {Pointer<Integer>} Length 
     * @param {BOOLEAN} Allocate 
     * @returns {NTSTATUS} 
     */
    static SecMakeSPNEx(ServiceClass, ServiceName, InstanceName, InstancePort, Referrer, TargetInfo, Spn, Length, Allocate) {
        LengthMarshal := Length is VarRef ? "uint*" : "ptr"

        result := DllCall("ksecdd.sys\SecMakeSPNEx", "ptr", ServiceClass, "ptr", ServiceName, "ptr", InstanceName, "ushort", InstancePort, "ptr", Referrer, "ptr", TargetInfo, "ptr", Spn, LengthMarshal, Length, "char", Allocate, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} ServiceClass 
     * @param {Pointer<UNICODE_STRING>} ServiceName 
     * @param {Pointer<UNICODE_STRING>} InstanceName 
     * @param {Integer} InstancePort 
     * @param {Pointer<UNICODE_STRING>} Referrer 
     * @param {Pointer<UNICODE_STRING>} InTargetInfo 
     * @param {Pointer<UNICODE_STRING>} Spn 
     * @param {Pointer<Integer>} TotalSize 
     * @param {BOOLEAN} Allocate 
     * @param {BOOLEAN} IsTargetInfoMarshaled 
     * @returns {NTSTATUS} 
     */
    static SecMakeSPNEx2(ServiceClass, ServiceName, InstanceName, InstancePort, Referrer, InTargetInfo, Spn, TotalSize, Allocate, IsTargetInfoMarshaled) {
        TotalSizeMarshal := TotalSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ksecdd.sys\SecMakeSPNEx2", "ptr", ServiceClass, "ptr", ServiceName, "ptr", InstanceName, "ushort", InstancePort, "ptr", Referrer, "ptr", InTargetInfo, "ptr", Spn, TotalSizeMarshal, TotalSize, "char", Allocate, "char", IsTargetInfoMarshaled, "int")
        return result
    }

    /**
     * 
     * @param {PSID} Sid 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<UNICODE_STRING>} NameBuffer 
     * @param {Pointer<Integer>} DomainSize 
     * @param {Pointer<UNICODE_STRING>} DomainBuffer 
     * @param {Pointer<Integer>} NameUse 
     * @returns {NTSTATUS} 
     */
    static SecLookupAccountSid(Sid, NameSize, NameBuffer, DomainSize, DomainBuffer, NameUse) {
        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"
        DomainSizeMarshal := DomainSize is VarRef ? "uint*" : "ptr"
        NameUseMarshal := NameUse is VarRef ? "int*" : "ptr"

        result := DllCall("ksecdd.sys\SecLookupAccountSid", "ptr", Sid, NameSizeMarshal, NameSize, "ptr", NameBuffer, DomainSizeMarshal, DomainSize, "ptr", DomainBuffer, NameUseMarshal, NameUse, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} Name 
     * @param {Pointer<Integer>} SidSize 
     * @param {PSID} Sid 
     * @param {Pointer<Integer>} NameUse 
     * @param {Pointer<Integer>} DomainSize 
     * @param {Pointer<UNICODE_STRING>} ReferencedDomain 
     * @returns {NTSTATUS} 
     */
    static SecLookupAccountName(Name, SidSize, Sid, NameUse, DomainSize, ReferencedDomain) {
        SidSizeMarshal := SidSize is VarRef ? "uint*" : "ptr"
        NameUseMarshal := NameUse is VarRef ? "int*" : "ptr"
        DomainSizeMarshal := DomainSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ksecdd.sys\SecLookupAccountName", "ptr", Name, SidSizeMarshal, SidSize, "ptr", Sid, NameUseMarshal, NameUse, DomainSizeMarshal, DomainSize, "ptr", ReferencedDomain, "int")
        return result
    }

    /**
     * 
     * @param {Integer} SidType 
     * @param {PSID} Sid 
     * @param {Integer} SidBufferSize 
     * @param {Pointer<Integer>} SidSize 
     * @returns {NTSTATUS} 
     */
    static SecLookupWellKnownSid(SidType, Sid, SidBufferSize, SidSize) {
        SidSizeMarshal := SidSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ksecdd.sys\SecLookupWellKnownSid", "int", SidType, "ptr", Sid, "uint", SidBufferSize, SidSizeMarshal, SidSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<LUID>} LogonId 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<SECURITY_USER_DATA>>} UserInformation 
     * @returns {NTSTATUS} 
     */
    static GetSecurityUserInfo(LogonId, Flags, UserInformation) {
        UserInformationMarshal := UserInformation is VarRef ? "ptr*" : "ptr"

        result := DllCall("SECUR32.dll\GetSecurityUserInfo", "ptr", LogonId, "uint", Flags, UserInformationMarshal, UserInformation, "int")
        return result
    }

    /**
     * 
     * @param {HRESULT} SecStatus 
     * @returns {NTSTATUS} 
     */
    static MapSecurityError(SecStatus) {
        result := DllCall("ksecdd.sys\MapSecurityError", "int", SecStatus, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @param {Integer} ObjectInformationClass 
     * @param {Pointer} ObjectInformation 
     * @param {Integer} ObjectInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ZwQueryObject(Handle, ObjectInformationClass, ObjectInformation, ObjectInformationLength, ReturnLength) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryObject", "ptr", Handle, "int", ObjectInformationClass, "ptr", ObjectInformation, "uint", ObjectInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} KeyHandle 
     * @param {HANDLE} Event 
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
     * @param {Pointer<Void>} ApcContext 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Integer} CompletionFilter 
     * @param {BOOLEAN} WatchTree 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {BOOLEAN} Asynchronous 
     * @returns {NTSTATUS} 
     */
    static ZwNotifyChangeKey(KeyHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, CompletionFilter, WatchTree, Buffer_R, BufferSize, Asynchronous) {
        KeyHandle := KeyHandle is Win32Handle ? NumGet(KeyHandle, "ptr") : KeyHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwNotifyChangeKey", "ptr", KeyHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "uint", CompletionFilter, "char", WatchTree, "ptr", Buffer_R, "uint", BufferSize, "char", Asynchronous, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} EventHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Integer} EventType 
     * @param {BOOLEAN} InitialState 
     * @returns {NTSTATUS} 
     */
    static ZwCreateEvent(EventHandle, DesiredAccess, ObjectAttributes, EventType, InitialState) {
        result := DllCall("ntdll.dll\ZwCreateEvent", "ptr", EventHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int", EventType, "char", InitialState, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static ZwDeleteFile(ObjectAttributes) {
        result := DllCall("ntdll.dll\ZwDeleteFile", "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {HANDLE} Event 
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
     * @param {Pointer<Void>} ApcContext 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} FileInformation 
     * @param {Integer} Length 
     * @param {Integer} FileInformationClass 
     * @param {BOOLEAN} ReturnSingleEntry 
     * @param {Pointer<UNICODE_STRING>} FileName 
     * @param {BOOLEAN} RestartScan 
     * @returns {NTSTATUS} 
     */
    static ZwQueryDirectoryFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, FileInformation, Length, FileInformationClass, ReturnSingleEntry, FileName, RestartScan) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryDirectoryFile", "ptr", FileHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "char", ReturnSingleEntry, "ptr", FileName, "char", RestartScan, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {HANDLE} Event 
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
     * @param {Pointer<Void>} ApcContext 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} FileInformation 
     * @param {Integer} Length 
     * @param {Integer} FileInformationClass 
     * @param {Integer} QueryFlags 
     * @param {Pointer<UNICODE_STRING>} FileName 
     * @returns {NTSTATUS} 
     */
    static ZwQueryDirectoryFileEx(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, FileInformation, Length, FileInformationClass, QueryFlags, FileName) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryDirectoryFileEx", "ptr", FileHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "uint", QueryFlags, "ptr", FileName, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} FsInformation 
     * @param {Integer} Length 
     * @param {Integer} FsInformationClass 
     * @returns {NTSTATUS} 
     */
    static ZwQueryVolumeInformationFile(FileHandle, IoStatusBlock, FsInformation, Length, FsInformationClass) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\ZwQueryVolumeInformationFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", FsInformation, "uint", Length, "int", FsInformationClass, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} FsInformation 
     * @param {Integer} Length 
     * @param {Integer} FsInformationClass 
     * @returns {NTSTATUS} 
     */
    static ZwSetVolumeInformationFile(FileHandle, IoStatusBlock, FsInformation, Length, FsInformationClass) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\ZwSetVolumeInformationFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", FsInformation, "uint", Length, "int", FsInformationClass, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {HANDLE} Event 
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
     * @param {Pointer<Void>} ApcContext 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Integer} FsControlCode 
     * @param {Pointer} InputBuffer 
     * @param {Integer} InputBufferLength 
     * @param {Pointer} OutputBuffer 
     * @param {Integer} OutputBufferLength 
     * @returns {NTSTATUS} 
     */
    static ZwFsControlFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, FsControlCode, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwFsControlFile", "ptr", FileHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "uint", FsControlCode, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} SourceProcessHandle 
     * @param {HANDLE} SourceHandle 
     * @param {HANDLE} TargetProcessHandle 
     * @param {Pointer<HANDLE>} TargetHandle 
     * @param {Integer} DesiredAccess 
     * @param {Integer} HandleAttributes 
     * @param {Integer} Options 
     * @returns {NTSTATUS} 
     */
    static ZwDuplicateObject(SourceProcessHandle, SourceHandle, TargetProcessHandle, TargetHandle, DesiredAccess, HandleAttributes, Options) {
        SourceProcessHandle := SourceProcessHandle is Win32Handle ? NumGet(SourceProcessHandle, "ptr") : SourceProcessHandle
        SourceHandle := SourceHandle is Win32Handle ? NumGet(SourceHandle, "ptr") : SourceHandle
        TargetProcessHandle := TargetProcessHandle is Win32Handle ? NumGet(TargetProcessHandle, "ptr") : TargetProcessHandle

        result := DllCall("ntdll.dll\ZwDuplicateObject", "ptr", SourceProcessHandle, "ptr", SourceHandle, "ptr", TargetProcessHandle, "ptr", TargetHandle, "uint", DesiredAccess, "uint", HandleAttributes, "uint", Options, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} DirectoryHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static ZwOpenDirectoryObject(DirectoryHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\ZwOpenDirectoryObject", "ptr", DirectoryHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<Pointer<Void>>} BaseAddress 
     * @param {Pointer} ZeroBits 
     * @param {Pointer<Pointer>} RegionSize 
     * @param {Integer} AllocationType 
     * @param {Integer} Protect 
     * @returns {NTSTATUS} 
     */
    static ZwAllocateVirtualMemory(ProcessHandle, BaseAddress, ZeroBits, RegionSize, AllocationType, Protect) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
        RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\ZwAllocateVirtualMemory", "ptr", ProcessHandle, BaseAddressMarshal, BaseAddress, "ptr", ZeroBits, RegionSizeMarshal, RegionSize, "uint", AllocationType, "uint", Protect, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer} BaseAddress 
     * @param {Pointer<Pointer>} RegionSize 
     * @param {Integer} AllocationType 
     * @param {Integer} PageProtection 
     * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters 
     * @param {Integer} ExtendedParameterCount 
     * @returns {NTSTATUS} 
     */
    static ZwAllocateVirtualMemoryEx(ProcessHandle, BaseAddress, RegionSize, AllocationType, PageProtection, ExtendedParameters, ExtendedParameterCount) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\ZwAllocateVirtualMemoryEx", "ptr", ProcessHandle, "ptr", BaseAddress, RegionSizeMarshal, RegionSize, "uint", AllocationType, "uint", PageProtection, "ptr", ExtendedParameters, "uint", ExtendedParameterCount, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<Pointer<Void>>} BaseAddress 
     * @param {Pointer<Pointer>} RegionSize 
     * @param {Integer} FreeType 
     * @returns {NTSTATUS} 
     */
    static ZwFreeVirtualMemory(ProcessHandle, BaseAddress, RegionSize, FreeType) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
        RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\ZwFreeVirtualMemory", "ptr", ProcessHandle, BaseAddressMarshal, BaseAddress, RegionSizeMarshal, RegionSize, "uint", FreeType, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<Void>} BaseAddress 
     * @param {Integer} MemoryInformationClass 
     * @param {Pointer} MemoryInformation 
     * @param {Pointer} MemoryInformationLength 
     * @param {Pointer<Pointer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ZwQueryVirtualMemory(ProcessHandle, BaseAddress, MemoryInformationClass, MemoryInformation, MemoryInformationLength, ReturnLength) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryVirtualMemory", "ptr", ProcessHandle, BaseAddressMarshal, BaseAddress, "int", MemoryInformationClass, "ptr", MemoryInformation, "ptr", MemoryInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Integer} VmInformationClass 
     * @param {Pointer} NumberOfEntries 
     * @param {Pointer<MEMORY_RANGE_ENTRY>} VirtualAddresses 
     * @param {Pointer} VmInformation 
     * @param {Integer} VmInformationLength 
     * @returns {NTSTATUS} 
     */
    static ZwSetInformationVirtualMemory(ProcessHandle, VmInformationClass, NumberOfEntries, VirtualAddresses, VmInformation, VmInformationLength) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        result := DllCall("ntdll.dll\ZwSetInformationVirtualMemory", "ptr", ProcessHandle, "int", VmInformationClass, "ptr", NumberOfEntries, "ptr", VirtualAddresses, "ptr", VmInformation, "uint", VmInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EventHandle 
     * @param {Pointer<Integer>} PreviousState 
     * @returns {NTSTATUS} 
     */
    static ZwSetEvent(EventHandle, PreviousState) {
        EventHandle := EventHandle is Win32Handle ? NumGet(EventHandle, "ptr") : EventHandle

        PreviousStateMarshal := PreviousState is VarRef ? "int*" : "ptr"

        result := DllCall("ntdll.dll\ZwSetEvent", "ptr", EventHandle, PreviousStateMarshal, PreviousState, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<Pointer<Void>>} BaseAddress 
     * @param {Pointer<Pointer>} RegionSize 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @returns {NTSTATUS} 
     */
    static ZwFlushVirtualMemory(ProcessHandle, BaseAddress, RegionSize, IoStatus) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
        RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\ZwFlushVirtualMemory", "ptr", ProcessHandle, BaseAddressMarshal, BaseAddress, RegionSizeMarshal, RegionSize, "ptr", IoStatus, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Integer} DesiredAccess 
     * @param {Integer} HandleAttributes 
     * @param {Pointer<HANDLE>} TokenHandle 
     * @returns {NTSTATUS} 
     */
    static ZwOpenProcessTokenEx(ProcessHandle, DesiredAccess, HandleAttributes, TokenHandle) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        result := DllCall("ntdll.dll\ZwOpenProcessTokenEx", "ptr", ProcessHandle, "uint", DesiredAccess, "uint", HandleAttributes, "ptr", TokenHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ThreadHandle 
     * @param {Integer} DesiredAccess 
     * @param {BOOLEAN} OpenAsSelf 
     * @param {Integer} HandleAttributes 
     * @param {Pointer<HANDLE>} TokenHandle 
     * @returns {NTSTATUS} 
     */
    static ZwOpenThreadTokenEx(ThreadHandle, DesiredAccess, OpenAsSelf, HandleAttributes, TokenHandle) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        result := DllCall("ntdll.dll\ZwOpenThreadTokenEx", "ptr", ThreadHandle, "uint", DesiredAccess, "char", OpenAsSelf, "uint", HandleAttributes, "ptr", TokenHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TokenHandle 
     * @param {Integer} TokenInformationClass 
     * @param {Pointer} TokenInformation 
     * @param {Integer} TokenInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ZwQueryInformationToken(TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength, ReturnLength) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryInformationToken", "ptr", TokenHandle, "int", TokenInformationClass, "ptr", TokenInformation, "uint", TokenInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TokenHandle 
     * @param {Integer} TokenInformationClass 
     * @param {Pointer} TokenInformation 
     * @param {Integer} TokenInformationLength 
     * @returns {NTSTATUS} 
     */
    static ZwSetInformationToken(TokenHandle, TokenInformationClass, TokenInformation, TokenInformationLength) {
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        result := DllCall("ntdll.dll\ZwSetInformationToken", "ptr", TokenHandle, "int", TokenInformationClass, "ptr", TokenInformation, "uint", TokenInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @param {Integer} SecurityInformation 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @returns {NTSTATUS} 
     */
    static ZwSetSecurityObject(Handle, SecurityInformation, SecurityDescriptor) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ntdll.dll\ZwSetSecurityObject", "ptr", Handle, "uint", SecurityInformation, "ptr", SecurityDescriptor, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @param {Integer} SecurityInformation 
     * @param {Pointer} SecurityDescriptor 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} LengthNeeded 
     * @returns {NTSTATUS} 
     */
    static ZwQuerySecurityObject(Handle, SecurityInformation, SecurityDescriptor, Length, LengthNeeded) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        LengthNeededMarshal := LengthNeeded is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQuerySecurityObject", "ptr", Handle, "uint", SecurityInformation, "ptr", SecurityDescriptor, "uint", Length, LengthNeededMarshal, LengthNeeded, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {HANDLE} Event 
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
     * @param {Pointer<Void>} ApcContext 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer<Integer>} ByteOffset 
     * @param {Pointer<Integer>} Length 
     * @param {Integer} Key 
     * @param {BOOLEAN} FailImmediately 
     * @param {BOOLEAN} ExclusiveLock 
     * @returns {NTSTATUS} 
     */
    static ZwLockFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, ByteOffset, Length, Key, FailImmediately, ExclusiveLock) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"
        ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
        LengthMarshal := Length is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwLockFile", "ptr", FileHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, ByteOffsetMarshal, ByteOffset, LengthMarshal, Length, "uint", Key, "char", FailImmediately, "char", ExclusiveLock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer<Integer>} ByteOffset 
     * @param {Pointer<Integer>} Length 
     * @param {Integer} Key 
     * @returns {NTSTATUS} 
     */
    static ZwUnlockFile(FileHandle, IoStatusBlock, ByteOffset, Length, Key) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
        LengthMarshal := Length is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwUnlockFile", "ptr", FileHandle, "ptr", IoStatusBlock, ByteOffsetMarshal, ByteOffset, LengthMarshal, Length, "uint", Key, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length 
     * @param {BOOLEAN} ReturnSingleEntry 
     * @param {Pointer} SidList 
     * @param {Integer} SidListLength 
     * @param {PSID} StartSid 
     * @param {BOOLEAN} RestartScan 
     * @returns {NTSTATUS} 
     */
    static ZwQueryQuotaInformationFile(FileHandle, IoStatusBlock, Buffer_R, Length, ReturnSingleEntry, SidList, SidListLength, StartSid, RestartScan) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\ZwQueryQuotaInformationFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", Buffer_R, "uint", Length, "char", ReturnSingleEntry, "ptr", SidList, "uint", SidListLength, "ptr", StartSid, "char", RestartScan, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length 
     * @returns {NTSTATUS} 
     */
    static ZwSetQuotaInformationFile(FileHandle, IoStatusBlock, Buffer_R, Length) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\ZwSetQuotaInformationFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", Buffer_R, "uint", Length, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @returns {NTSTATUS} 
     */
    static ZwFlushBuffersFile(FileHandle, IoStatusBlock) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\ZwFlushBuffersFile", "ptr", FileHandle, "ptr", IoStatusBlock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Integer} FLags 
     * @param {Pointer} Parameters 
     * @param {Integer} ParametersSize 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @returns {NTSTATUS} 
     */
    static ZwFlushBuffersFileEx(FileHandle, FLags, Parameters, ParametersSize, IoStatusBlock) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\ZwFlushBuffersFileEx", "ptr", FileHandle, "uint", FLags, "ptr", Parameters, "uint", ParametersSize, "ptr", IoStatusBlock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length 
     * @param {BOOLEAN} ReturnSingleEntry 
     * @param {Pointer} EaList 
     * @param {Integer} EaListLength 
     * @param {Pointer<Integer>} EaIndex 
     * @param {BOOLEAN} RestartScan 
     * @returns {NTSTATUS} 
     */
    static ZwQueryEaFile(FileHandle, IoStatusBlock, Buffer_R, Length, ReturnSingleEntry, EaList, EaListLength, EaIndex, RestartScan) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        EaIndexMarshal := EaIndex is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryEaFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", Buffer_R, "uint", Length, "char", ReturnSingleEntry, "ptr", EaList, "uint", EaListLength, EaIndexMarshal, EaIndex, "char", RestartScan, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length 
     * @returns {NTSTATUS} 
     */
    static ZwSetEaFile(FileHandle, IoStatusBlock, Buffer_R, Length) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\ZwSetEaFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", Buffer_R, "uint", Length, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ExistingTokenHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {BOOLEAN} EffectiveOnly 
     * @param {Integer} TokenType 
     * @param {Pointer<HANDLE>} NewTokenHandle 
     * @returns {NTSTATUS} 
     */
    static ZwDuplicateToken(ExistingTokenHandle, DesiredAccess, ObjectAttributes, EffectiveOnly, TokenType, NewTokenHandle) {
        ExistingTokenHandle := ExistingTokenHandle is Win32Handle ? NumGet(ExistingTokenHandle, "ptr") : ExistingTokenHandle

        result := DllCall("ntdll.dll\ZwDuplicateToken", "ptr", ExistingTokenHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "char", EffectiveOnly, "int", TokenType, "ptr", NewTokenHandle, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} DosFileName 
     * @returns {Integer} 
     */
    static RtlIsDosDeviceName_U(DosFileName) {
        DosFileName := DosFileName is String ? StrPtr(DosFileName) : DosFileName

        result := DllCall("ntdll.dll\RtlIsDosDeviceName_U", "ptr", DosFileName, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} DosFileName 
     * @param {Pointer<UNICODE_STRING>} NtFileName 
     * @param {Pointer<PWSTR>} FilePart 
     * @returns {NTSTATUS} 
     */
    static RtlDosPathNameToNtPathName_U_WithStatus(DosFileName, NtFileName, FilePart) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        DosFileName := DosFileName is String ? StrPtr(DosFileName) : DosFileName

        FilePartMarshal := FilePart is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\RtlDosPathNameToNtPathName_U_WithStatus", "ptr", DosFileName, "ptr", NtFileName, FilePartMarshal, FilePart, "ptr", Reserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} DirectoryHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static ZwCreateDirectoryObject(DirectoryHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\ZwCreateDirectoryObject", "ptr", DirectoryHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<FILE_NETWORK_OPEN_INFORMATION>} FileInformation 
     * @returns {NTSTATUS} 
     */
    static ZwQueryFullAttributesFile(ObjectAttributes, FileInformation) {
        result := DllCall("ntdll.dll\ZwQueryFullAttributesFile", "ptr", ObjectAttributes, "ptr", FileInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {Pointer<OPLOCK_KEY_ECP_CONTEXT>} 
     */
    static IoGetOplockKeyContext(FileObject) {
        result := DllCall("ntoskrnl.exe\IoGetOplockKeyContext", "ptr", FileObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {Pointer<OPLOCK_KEY_CONTEXT>} 
     */
    static IoGetOplockKeyContextEx(FileObject) {
        result := DllCall("ntoskrnl.exe\IoGetOplockKeyContextEx", "ptr", FileObject, "ptr")
        return result
    }

;@endregion Methods
}
