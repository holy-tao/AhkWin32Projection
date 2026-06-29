#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global SECURITY_ANONYMOUS_LOGON_RID := 7

/**
 * @type {Integer (UInt32)}
 */
export global VALID_INHERIT_FLAGS := 31

/**
 * @type {Integer (UInt32)}
 */
export global SE_DACL_UNTRUSTED := 64

/**
 * @type {Integer (UInt32)}
 */
export global SE_SERVER_SECURITY := 128

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_AUDIT_SUBCATEGORY_COUNT := 59

/**
 * @type {Integer (UInt32)}
 */
export global SEGMENT_HEAP_PARAMETERS_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global SEGMENT_HEAP_FLG_USE_PAGE_HEAP := 1

/**
 * @type {Integer (UInt32)}
 */
export global SEGMENT_HEAP_PARAMS_VALID_FLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTL_HEAP_MEMORY_LIMIT_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_NO_SERIALIZE := 1

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_GROWABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_GENERATE_EXCEPTIONS := 4

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_ZERO_MEMORY := 8

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_REALLOC_IN_PLACE_ONLY := 16

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_TAIL_CHECKING_ENABLED := 32

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_FREE_CHECKING_ENABLED := 64

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_DISABLE_COALESCE_ON_FREE := 128

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CREATE_ALIGN_16 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CREATE_ENABLE_TRACING := 131072

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CREATE_ENABLE_EXECUTE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_SETTABLE_USER_VALUE := 256

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_SETTABLE_USER_FLAG1 := 512

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_SETTABLE_USER_FLAG2 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_SETTABLE_USER_FLAG3 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_SETTABLE_USER_FLAGS := 3584

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CLASS_0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CLASS_1 := 4096

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CLASS_2 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CLASS_3 := 12288

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CLASS_4 := 16384

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CLASS_5 := 20480

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CLASS_6 := 24576

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CLASS_7 := 28672

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CLASS_8 := 32768

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CLASS_MASK := 61440

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_MAXIMUM_TAG := 4095

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_GLOBAL_TAG := 2048

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_PSEUDO_TAG_FLAG := 32768

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_TAG_SHIFT := 18

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CREATE_SEGMENT_HEAP := 256

/**
 * @type {Integer (UInt32)}
 */
export global HEAP_CREATE_HARDENED := 512

/**
 * @type {Integer (UInt32)}
 */
export global RTL_DUPLICATE_UNICODE_STRING_NULL_TERMINATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTL_DUPLICATE_UNICODE_STRING_ALLOCATE_NULL_STRING := 2

/**
 * @type {Integer (UInt32)}
 */
export global COMPRESSION_FORMAT_MAX := 5

/**
 * @type {Integer (UInt32)}
 */
export global COMPRESSION_ENGINE_MAX := 512

/**
 * @type {Integer (UInt32)}
 */
export global COMPRESSION_FORMAT_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global COMPRESSION_ENGINE_MASK := 65280

/**
 * @type {Integer (UInt32)}
 */
export global MAX_UNICODE_STACK_BUFFER_LENGTH := 256

/**
 * @type {String}
 */
export global RTL_SYSTEM_VOLUME_INFORMATION_FOLDER := "System Volume Information"

/**
 * @type {Integer (UInt32)}
 */
export global PSMP_MINIMUM_SYSAPP_CLAIM_VALUES := 2

/**
 * @type {Integer (UInt32)}
 */
export global PSMP_MAXIMUM_SYSAPP_CLAIM_VALUES := 4

/**
 * @type {Integer (UInt32)}
 */
export global USE_PRIMARY_PASSWORD := 1

/**
 * @type {Integer (UInt32)}
 */
export global RETURN_PRIMARY_USERNAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global RETURN_PRIMARY_LOGON_DOMAINNAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global RETURN_NON_NT_USER_SESSION_KEY := 8

/**
 * @type {Integer (UInt32)}
 */
export global GENERATE_CLIENT_CHALLENGE := 16

/**
 * @type {Integer (UInt32)}
 */
export global GCR_NTLM3_PARMS := 32

/**
 * @type {Integer (UInt32)}
 */
export global GCR_TARGET_INFO := 64

/**
 * @type {Integer (UInt32)}
 */
export global RETURN_RESERVED_PARAMETER := 128

/**
 * @type {Integer (UInt32)}
 */
export global GCR_ALLOW_NTLM := 256

/**
 * @type {Integer (UInt32)}
 */
export global GCR_USE_OEM_SET := 512

/**
 * @type {Integer (UInt32)}
 */
export global GCR_MACHINE_CREDENTIAL := 1024

/**
 * @type {Integer (UInt32)}
 */
export global GCR_USE_OWF_PASSWORD := 2048

/**
 * @type {Integer (UInt32)}
 */
export global GCR_ALLOW_LM := 4096

/**
 * @type {Integer (UInt32)}
 */
export global GCR_ALLOW_NO_TARGET := 8192

/**
 * @type {Integer (UInt32)}
 */
export global GCR_VSM_PROTECTED_PASSWORD := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CLEANUP_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CLEANUP_WRONG_DEVICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CLEANUP_FILE_REMAINS := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CLEANUP_FILE_DELETED := 4

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CLEANUP_LINK_DELETED := 8

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CLEANUP_STREAM_DELETED := 16

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CLEANUP_POSIX_STYLE_DELETE := 32

/**
 * @type {Integer (UInt32)}
 */
export global FILE_OPLOCK_BROKEN_TO_LEVEL_2 := 7

/**
 * @type {Integer (UInt32)}
 */
export global FILE_OPLOCK_BROKEN_TO_NONE := 8

/**
 * @type {Integer (UInt32)}
 */
export global FILE_OPBATCH_BREAK_UNDERWAY := 9

/**
 * @type {Integer (UInt32)}
 */
export global FILE_NOTIFY_CHANGE_NAME := 3

/**
 * @type {Integer (UInt32)}
 */
export global FILE_NOTIFY_CHANGE_EA := 128

/**
 * @type {Integer (UInt32)}
 */
export global FILE_NOTIFY_CHANGE_STREAM_NAME := 512

/**
 * @type {Integer (UInt32)}
 */
export global FILE_NOTIFY_CHANGE_STREAM_SIZE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global FILE_NOTIFY_CHANGE_STREAM_WRITE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global FILE_NOTIFY_VALID_MASK := 4095

/**
 * @type {Integer (UInt32)}
 */
export global FILE_ACTION_ADDED_STREAM := 6

/**
 * @type {Integer (UInt32)}
 */
export global FILE_ACTION_REMOVED_STREAM := 7

/**
 * @type {Integer (UInt32)}
 */
export global FILE_ACTION_MODIFIED_STREAM := 8

/**
 * @type {Integer (UInt32)}
 */
export global FILE_ACTION_REMOVED_BY_DELETE := 9

/**
 * @type {Integer (UInt32)}
 */
export global FILE_ACTION_ID_NOT_TUNNELLED := 10

/**
 * @type {Integer (UInt32)}
 */
export global FILE_ACTION_TUNNELLED_ID_COLLISION := 11

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_BYTE_STREAM_TYPE := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_MESSAGE_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_ACCEPT_REMOTE_CLIENTS := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_REJECT_REMOTE_CLIENTS := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_TYPE_VALID_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_QUEUE_OPERATION := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_COMPLETE_OPERATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_BYTE_STREAM_MODE := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_MESSAGE_MODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_INBOUND := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_OUTBOUND := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_FULL_DUPLEX := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_DISCONNECTED_STATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_LISTENING_STATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_CONNECTED_STATE := 3

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_CLOSING_STATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_CLIENT_END := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_SERVER_END := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_NEED_EA := 128

/**
 * @type {Integer (UInt32)}
 */
export global FILE_EA_TYPE_BINARY := 65534

/**
 * @type {Integer (UInt32)}
 */
export global FILE_EA_TYPE_ASCII := 65533

/**
 * @type {Integer (UInt32)}
 */
export global FILE_EA_TYPE_BITMAP := 65531

/**
 * @type {Integer (UInt32)}
 */
export global FILE_EA_TYPE_METAFILE := 65530

/**
 * @type {Integer (UInt32)}
 */
export global FILE_EA_TYPE_ICON := 65529

/**
 * @type {Integer (UInt32)}
 */
export global FILE_EA_TYPE_EA := 65518

/**
 * @type {Integer (UInt32)}
 */
export global FILE_EA_TYPE_MVMT := 65503

/**
 * @type {Integer (UInt32)}
 */
export global FILE_EA_TYPE_MVST := 65502

/**
 * @type {Integer (UInt32)}
 */
export global FILE_EA_TYPE_ASN1 := 65501

/**
 * @type {Integer (UInt32)}
 */
export global FILE_EA_TYPE_FAMILY_IDS := 65281

/**
 * @type {Integer (UInt32)}
 */
export global FILE_ID_GLOBAL_TX_DIR_INFO_FLAG_WRITELOCKED := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_ID_GLOBAL_TX_DIR_INFO_FLAG_VISIBLE_TO_TX := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_ID_GLOBAL_TX_DIR_INFO_FLAG_VISIBLE_OUTSIDE_TX := 4

/**
 * @type {Integer (UInt32)}
 */
export global NO_8DOT3_NAME_PRESENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global REMOVED_8DOT3_NAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global LX_FILE_METADATA_HAS_UID := 1

/**
 * @type {Integer (UInt32)}
 */
export global LX_FILE_METADATA_HAS_GID := 2

/**
 * @type {Integer (UInt32)}
 */
export global LX_FILE_METADATA_HAS_MODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global LX_FILE_METADATA_HAS_DEVICE_ID := 8

/**
 * @type {Integer (UInt32)}
 */
export global LX_FILE_CASE_SENSITIVE_DIR := 16

/**
 * @type {Integer (UInt32)}
 */
export global FILE_LINK_REPLACE_IF_EXISTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_LINK_POSIX_SEMANTICS := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_LINK_SUPPRESS_STORAGE_RESERVE_INHERITANCE := 8

/**
 * @type {Integer (UInt32)}
 */
export global FILE_LINK_NO_INCREASE_AVAILABLE_SPACE := 16

/**
 * @type {Integer (UInt32)}
 */
export global FILE_LINK_NO_DECREASE_AVAILABLE_SPACE := 32

/**
 * @type {Integer (UInt32)}
 */
export global FILE_LINK_PRESERVE_AVAILABLE_SPACE := 48

/**
 * @type {Integer (UInt32)}
 */
export global FILE_LINK_IGNORE_READONLY_ATTRIBUTE := 64

/**
 * @type {Integer (UInt32)}
 */
export global FILE_LINK_FORCE_RESIZE_TARGET_SR := 128

/**
 * @type {Integer (UInt32)}
 */
export global FILE_LINK_FORCE_RESIZE_SOURCE_SR := 256

/**
 * @type {Integer (UInt32)}
 */
export global FILE_LINK_FORCE_RESIZE_SR := 384

/**
 * @type {Integer (UInt32)}
 */
export global FILE_RENAME_REPLACE_IF_EXISTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_RENAME_POSIX_SEMANTICS := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_RENAME_SUPPRESS_PIN_STATE_INHERITANCE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FILE_RENAME_SUPPRESS_STORAGE_RESERVE_INHERITANCE := 8

/**
 * @type {Integer (UInt32)}
 */
export global FILE_RENAME_NO_INCREASE_AVAILABLE_SPACE := 16

/**
 * @type {Integer (UInt32)}
 */
export global FILE_RENAME_NO_DECREASE_AVAILABLE_SPACE := 32

/**
 * @type {Integer (UInt32)}
 */
export global FILE_RENAME_PRESERVE_AVAILABLE_SPACE := 48

/**
 * @type {Integer (UInt32)}
 */
export global FILE_RENAME_IGNORE_READONLY_ATTRIBUTE := 64

/**
 * @type {Integer (UInt32)}
 */
export global FILE_RENAME_FORCE_RESIZE_TARGET_SR := 128

/**
 * @type {Integer (UInt32)}
 */
export global FILE_RENAME_FORCE_RESIZE_SOURCE_SR := 256

/**
 * @type {Integer (UInt32)}
 */
export global FILE_RENAME_FORCE_RESIZE_SR := 384

/**
 * @type {Integer (UInt32)}
 */
export global REMOTE_PROTOCOL_FLAG_LOOPBACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global REMOTE_PROTOCOL_FLAG_OFFLINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global REMOTE_PROTOCOL_FLAG_PERSISTENT_HANDLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global REMOTE_PROTOCOL_FLAG_PRIVACY := 8

/**
 * @type {Integer (UInt32)}
 */
export global REMOTE_PROTOCOL_FLAG_INTEGRITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global REMOTE_PROTOCOL_FLAG_MUTUAL_AUTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SHARECAP_TIMEWARP := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SHARECAP_DFS := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SHARECAP_CONTINUOUS_AVAILABILITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SHARECAP_SCALEOUT := 32

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SHARECAP_CLUSTER := 64

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SHARECAP_ENCRYPTED := 128

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SHARECAP_ACCESS_BASED_DIRECTORY_ENUM := 256

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SHARECAP_IDENTITY_REMOTING := 512

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SHARECAP_ASYMMETRIC_SCALEOUT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SHARETYPE_DISK := 0

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SHARETYPE_PIPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SHARETYPE_PRINT := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SERVERCAP_DFS := 1

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SERVERCAP_LEASING := 2

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SERVERCAP_LARGEMTU := 4

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SERVERCAP_MULTICHANNEL := 8

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SERVERCAP_PERSISTENT_HANDLES := 16

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SERVERCAP_DIRECTORY_LEASING := 32

/**
 * @type {Integer (UInt32)}
 */
export global RPI_SMB2_SERVERCAP_ENCRYPTION_AWARE := 64

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VC_QUOTA_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VC_QUOTA_TRACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VC_QUOTA_ENFORCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VC_QUOTA_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VC_CONTENT_INDEX_DISABLED := 8

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VC_LOG_QUOTA_THRESHOLD := 16

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VC_LOG_QUOTA_LIMIT := 32

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VC_LOG_VOLUME_THRESHOLD := 64

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VC_LOG_VOLUME_LIMIT := 128

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VC_QUOTAS_INCOMPLETE := 256

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VC_QUOTAS_REBUILDING := 512

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VC_VALID_MASK := 1023

/**
 * @type {Integer (UInt32)}
 */
export global FLAGS_END_OF_FILE_INFO_EX_EXTEND_PAGING := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLAGS_END_OF_FILE_INFO_EX_NO_EXTRA_PAGING_EXTEND := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLAGS_END_OF_FILE_INFO_EX_TIME_CONSTRAINED := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLAGS_DELAY_REASONS_LOG_FILE_FULL := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLAGS_DELAY_REASONS_BITMAP_SCANNED := 2

/**
 * @type {Integer (UInt32)}
 */
export global USN_DELETE_FLAG_DELETE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SET_PURGE_FAILURE_MODE_DISABLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYMLINK_FLAG_RELATIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYMLINK_DIRECTORY := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SYMLINK_FILE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SYMLINK_RESERVED_MASK := 4026531840

/**
 * @type {Integer (UInt32)}
 */
export global IO_REPARSE_TAG_VALID_VALUES := 4026597375

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_DRIVE_EXTENDER := -2147483643

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_FILTER_MANAGER := -2147483637

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_IIS_CACHE := -1610612720

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_APPXSTRM := -1073741804

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_DFM := -2147483626

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_LX_SYMLINK := -1610612707

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_LX_FIFO := -2147483612

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_LX_CHR := -2147483611

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_LX_BLK := -2147483610

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_IFSTEST_CONGRUENT := 9

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_MOONWALK_HSM := 10

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_TSINGHUA_UNIVERSITY_RESEARCH := 11

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ARKIVIO := 12

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_SOLUTIONSOFT := 536870925

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_COMMVAULT := 14

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_OVERTONE := 15

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_SYMANTEC_HSM2 := 16

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ENIGMA_HSM := 17

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_SYMANTEC_HSM := 18

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_INTERCOPE_HSM := 19

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_KOM_NETWORKS_HSM := 20

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_MEMORY_TECH_HSM := 21

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_BRIDGEHEAD_HSM := 22

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_OSR_SAMPLE := 536870935

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_GLOBAL360_HSM := 24

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ALTIRIS_HSM := 25

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_HERMES_HSM := 26

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_POINTSOFT_HSM := 27

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_GRAU_DATASTORAGE_HSM := 28

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_COMMVAULT_HSM := 29

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_DATASTOR_SIS := 30

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_EDSI_HSM := 31

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_HP_HSM := 32

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_SER_HSM := 33

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_DOUBLE_TAKE_HSM := 34

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_WISDATA_HSM := 35

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_MIMOSA_HSM := 36

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_HSAG_HSM := 37

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ADA_HSM := 38

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_AUTN_HSM := 39

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_NEXSAN_HSM := 40

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_DOUBLE_TAKE_SIS := 41

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_SONY_HSM := 42

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ELTAN_HSM := 43

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_UTIXO_HSM := 44

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_QUEST_HSM := 45

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_DATAGLOBAL_HSM := 46

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_QI_TECH_HSM := 536870959

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_DATAFIRST_HSM := 48

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_C2CSYSTEMS_HSM := 49

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_WATERFORD := 50

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_RIVERBED_HSM := 51

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_CARINGO_HSM := 52

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_MAXISCALE_HSM := 536870965

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_CITRIX_PM := 54

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_OPENAFS_DFS := 55

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ZLTI_HSM := 56

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_EMC_HSM := 57

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_VMWARE_PM := 58

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ARCO_BACKUP := 59

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_CARROLL_HSM := 60

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_COMTRADE_HSM := 61

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_EASEVAULT_HSM := 62

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_HDS_HSM := 63

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_MAGINATICS_RDR := 64

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_GOOGLE_HSM := 65

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_QUADDRA_HSM := 66

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_HP_BACKUP := 67

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_DROPBOX_HSM := 68

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ADOBE_HSM := 69

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_HP_DATA_PROTECT := 70

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACTIVISION_HSM := 71

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_HDS_HCP_HSM := 72

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_AURISTOR_FS := 73

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ITSTATION := 74

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_SPHARSOFT := 75

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ALERTBOOT := 536870988

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_MTALOS := 77

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_CTERA_HSM := 78

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_NIPPON_HSM := 79

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_REDSTOR_HSM := 80

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_NEUSHIELD := 81

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_DOR_HSM := 82

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_SHX_BACKUP := 83

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_NVIDIA_UNIONFS := 536870996

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_HUBSTOR_HSM := 85

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_IMANAGE_HSM := 536870998

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_EASEFILTER_HSM := 87

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_0 := 96

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_1 := 97

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_2 := 98

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_3 := 99

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_4 := 100

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_5 := 101

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_6 := 102

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_7 := 103

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_8 := 104

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_9 := 105

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_A := 106

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_B := 107

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_C := 108

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_D := 109

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_E := 110

/**
 * @type {Integer (Int32)}
 */
export global IO_REPARSE_TAG_ACRONIS_HSM_F := 111

/**
 * @type {Integer (UInt32)}
 */
export global REPARSE_DATA_EX_FLAG_GIVEN_TAG_OR_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SUPPORTED_FS_FEATURES_OFFLOAD_READ := 1

/**
 * @type {Integer (UInt32)}
 */
export global SUPPORTED_FS_FEATURES_OFFLOAD_WRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SUPPORTED_FS_FEATURES_QUERY_OPEN := 4

/**
 * @type {Integer (UInt32)}
 */
export global SUPPORTED_FS_FEATURES_BYPASS_IO := 8

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_LMR_GET_LINK_TRACKING_INFORMATION := 1310952

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_LMR_SET_LINK_TRACKING_INFORMATION := 1310956

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_LMR_ARE_FILE_OBJECTS_ON_SAME_SERVER := 1310960

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_ASSIGN_EVENT := 1114112

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_DISCONNECT := 1114116

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_LISTEN := 1114120

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_PEEK := 1130508

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_QUERY_EVENT := 1114128

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_TRANSCEIVE := 1163287

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_WAIT := 1114136

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_IMPERSONATE := 1114140

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_SET_CLIENT_PROCESS := 1114144

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_QUERY_CLIENT_PROCESS := 1114148

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_GET_PIPE_ATTRIBUTE := 1114152

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_SET_PIPE_ATTRIBUTE := 1114156

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_GET_CONNECTION_ATTRIBUTE := 1114160

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_SET_CONNECTION_ATTRIBUTE := 1114164

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_GET_HANDLE_ATTRIBUTE := 1114168

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_SET_HANDLE_ATTRIBUTE := 1114172

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_FLUSH := 1146944

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_DISABLE_IMPERSONATE := 1114180

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_SILO_ARRIVAL := 1146952

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_CREATE_SYMLINK := 1114188

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_DELETE_SYMLINK := 1114192

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_QUERY_CLIENT_PROCESS_V2 := 1114196

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_INTERNAL_READ := 1138676

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_INTERNAL_WRITE := 1155064

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_INTERNAL_TRANSCEIVE := 1171455

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_PIPE_INTERNAL_READ_OVFLOW := 1138688

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_READ_DATA := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_WRITE_SPACE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_COMPUTER_NAME_LENGTH := 15

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_SYMLINK_FLAG_GLOBAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PIPE_SYMLINK_FLAG_RELATIVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_MAILSLOT_PEEK := 802819

/**
 * @type {Integer (UInt32)}
 */
export global QUERY_DIRECT_ACCESS_IMAGE_EXTENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global QUERY_DIRECT_ACCESS_DATA_EXTENTS := 2

/**
 * @type {String}
 */
export global LX_FILE_METADATA_UID_EA_NAME := "$LXUID"

/**
 * @type {String}
 */
export global LX_FILE_METADATA_GID_EA_NAME := "$LXGID"

/**
 * @type {String}
 */
export global LX_FILE_METADATA_MODE_EA_NAME := "$LXMOD"

/**
 * @type {String}
 */
export global LX_FILE_METADATA_DEVICE_ID_EA_NAME := "$LXDEV"

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_INCREMENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_NO_INCREMENT := 0

/**
 * @type {Integer (UInt32)}
 */
export global IO_CD_ROM_INCREMENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_DISK_INCREMENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_MAILSLOT_INCREMENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global IO_NAMED_PIPE_INCREMENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global IO_NETWORK_INCREMENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SEMAPHORE_INCREMENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYSTEM_PAGE_PRIORITY_BITS := 3

/**
 * @type {Integer (UInt32)}
 */
export global INVALID_PROCESSOR_INDEX := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_HAS_TRAVERSE_PRIVILEGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_HAS_BACKUP_PRIVILEGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_HAS_RESTORE_PRIVILEGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_WRITE_RESTRICTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_IS_RESTRICTED := 16

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_SESSION_NOT_REFERENCED := 32

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_SANDBOX_INERT := 64

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_HAS_IMPERSONATE_PRIVILEGE := 128

/**
 * @type {Integer (UInt32)}
 */
export global SE_BACKUP_PRIVILEGES_CHECKED := 256

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_VIRTUALIZE_ALLOWED := 512

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_VIRTUALIZE_ENABLED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_IS_FILTERED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_UIACCESS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_NOT_LOW := 8192

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_LOWBOX := 16384

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_HAS_OWN_CLAIM_ATTRIBUTES := 32768

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_PRIVATE_NAMESPACE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_DO_NOT_USE_GLOBAL_ATTRIBS_FOR_QUERY := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SPECIAL_ENCRYPTED_OPEN := 262144

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_NO_CHILD_PROCESS := 524288

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_NO_CHILD_PROCESS_UNLESS_SECURE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_AUDIT_NO_CHILD_PROCESS := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_ENFORCE_REDIRECTION_TRUST := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_AUDIT_REDIRECTION_TRUST := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_LEARNING_MODE_LOGGING := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global TOKEN_PERMISSIVE_LEARNING_MODE := 50331648

/**
 * @type {Integer (UInt32)}
 */
export global IO_OPEN_PAGING_FILE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IO_OPEN_TARGET_DIRECTORY := 4

/**
 * @type {Integer (UInt32)}
 */
export global IO_STOP_ON_SYMLINK := 8

/**
 * @type {Integer (UInt32)}
 */
export global IO_MM_PAGING_FILE := 16

/**
 * @type {Integer (UInt32)}
 */
export global IO_IGNORE_READONLY_ATTRIBUTE := 64

/**
 * @type {Integer (UInt32)}
 */
export global FS_FILTER_SECTION_SYNC_IN_FLAG_DONT_UPDATE_LAST_ACCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global FS_FILTER_SECTION_SYNC_IN_FLAG_DONT_UPDATE_LAST_WRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FS_FILTER_SECTION_SYNC_SUPPORTS_ASYNC_PARALLEL_IO := 1

/**
 * @type {Integer (UInt32)}
 */
export global FS_FILTER_SECTION_SYNC_SUPPORTS_DIRECT_MAP_DATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global FS_FILTER_SECTION_SYNC_SUPPORTS_DIRECT_MAP_IMAGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FS_FILTER_SECTION_SYNC_IMAGE_EXTENTS_ARE_NOT_RVA := 8

/**
 * @type {Integer (UInt16)}
 */
export global FS_FILTER_ACQUIRE_FOR_SECTION_SYNCHRONIZATION := 65535

/**
 * @type {Integer (UInt16)}
 */
export global FS_FILTER_RELEASE_FOR_SECTION_SYNCHRONIZATION := 65534

/**
 * @type {Integer (UInt16)}
 */
export global FS_FILTER_ACQUIRE_FOR_MOD_WRITE := 65533

/**
 * @type {Integer (UInt16)}
 */
export global FS_FILTER_RELEASE_FOR_MOD_WRITE := 65532

/**
 * @type {Integer (UInt16)}
 */
export global FS_FILTER_ACQUIRE_FOR_CC_FLUSH := 65531

/**
 * @type {Integer (UInt16)}
 */
export global FS_FILTER_RELEASE_FOR_CC_FLUSH := 65530

/**
 * @type {Integer (UInt16)}
 */
export global FS_FILTER_QUERY_OPEN := 65529

/**
 * @type {Integer (UInt32)}
 */
export global DO_VERIFY_VOLUME := 2

/**
 * @type {Integer (UInt32)}
 */
export global DO_BUFFERED_IO := 4

/**
 * @type {Integer (UInt32)}
 */
export global DO_EXCLUSIVE := 8

/**
 * @type {Integer (UInt32)}
 */
export global DO_DIRECT_IO := 16

/**
 * @type {Integer (UInt32)}
 */
export global DO_MAP_IO_BUFFER := 32

/**
 * @type {Integer (UInt32)}
 */
export global DO_DEVICE_HAS_NAME := 64

/**
 * @type {Integer (UInt32)}
 */
export global DO_DEVICE_INITIALIZING := 128

/**
 * @type {Integer (UInt32)}
 */
export global DO_SYSTEM_BOOT_PARTITION := 256

/**
 * @type {Integer (UInt32)}
 */
export global DO_LONG_TERM_REQUESTS := 512

/**
 * @type {Integer (UInt32)}
 */
export global DO_NEVER_LAST_DEVICE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DO_SHUTDOWN_REGISTERED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DO_BUS_ENUMERATED_DEVICE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DO_POWER_PAGABLE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DO_POWER_INRUSH := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DO_LOW_PRIORITY_FILESYSTEM := 65536

/**
 * @type {Integer (UInt32)}
 */
export global DO_SUPPORTS_PERSISTENT_ACLS := 131072

/**
 * @type {Integer (UInt32)}
 */
export global DO_SUPPORTS_TRANSACTIONS := 262144

/**
 * @type {Integer (UInt32)}
 */
export global DO_FORCE_NEITHER_IO := 524288

/**
 * @type {Integer (UInt32)}
 */
export global DO_VOLUME_DEVICE_OBJECT := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global DO_SYSTEM_SYSTEM_PARTITION := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global DO_SYSTEM_CRITICAL_PARTITION := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global DO_DISALLOW_EXECUTE := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global DO_DEVICE_TO_BE_RESET := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global DO_DEVICE_IRP_REQUIRES_EXTENSION := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global DO_DAX_VOLUME := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global DO_BOOT_CRITICAL := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global IO_FILE_OBJECT_NON_PAGED_POOL_CHARGE := 64

/**
 * @type {Integer (UInt32)}
 */
export global IO_FILE_OBJECT_PAGED_POOL_CHARGE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IO_CREATE_STREAM_FILE_RAISE_ON_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_CREATE_STREAM_FILE_LITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PO_CB_SYSTEM_POWER_POLICY := 0

/**
 * @type {Integer (UInt32)}
 */
export global PO_CB_AC_STATUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global PO_CB_BUTTON_COLLISION := 2

/**
 * @type {Integer (UInt32)}
 */
export global PO_CB_SYSTEM_STATE_LOCK := 3

/**
 * @type {Integer (UInt32)}
 */
export global PO_CB_LID_SWITCH_STATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PO_CB_PROCESSOR_POWER_POLICY := 5

/**
 * @type {Integer (UInt32)}
 */
export global MM_FORCE_CLOSED_DATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_FORCE_CLOSED_IMAGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MM_FORCE_CLOSED_LATER_OK := 4

/**
 * @type {Integer (UInt32)}
 */
export global MM_IS_FILE_SECTION_ACTIVE_IMAGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_IS_FILE_SECTION_ACTIVE_DATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global MM_IS_FILE_SECTION_ACTIVE_USER := 4

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_RESET_RESERVED_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_RESET_RESERVED_1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_RESET_KEEP_STACK := 4

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FCB_HEADER_V0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FCB_HEADER_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FCB_HEADER_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FCB_HEADER_V3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FCB_HEADER_V4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FLAG_FILE_MODIFIED := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FLAG_FILE_LENGTH_CHANGED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FLAG_LIMIT_MODIFIED_PAGES := 4

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FLAG_ACQUIRE_MAIN_RSRC_EX := 8

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FLAG_ACQUIRE_MAIN_RSRC_SH := 16

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FLAG_USER_MAPPED_FILE := 32

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FLAG_ADVANCED_HEADER := 64

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FLAG_EOF_ADVANCE_ACTIVE := 128

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FLAG2_DO_MODIFIED_WRITE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FLAG2_SUPPORTS_FILTER_CONTEXTS := 2

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FLAG2_PURGE_WHEN_MAPPED := 4

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FLAG2_IS_PAGING_FILE := 8

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FLAG2_WRITABLE_USER_MAPPED_FILE := 16

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FLAG2_BYPASSIO_STREAM_PAUSED := 32

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_AUXILIARY_FLAG_DEALLOCATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_ADD_TC_CASE_SENSITIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_ADD_TC_KEY_BY_SHORT_NAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FIND_TC_CASE_SENSITIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_FAT_LEGAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_HPFS_LEGAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_NTFS_LEGAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_WILD_CHARACTER := 8

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_OLE_LEGAL := 16

/**
 * @type {Integer (UInt32)}
 */
export global MCB_FLAG_RAISE_ON_ALLOCATION_FAILURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_FLAG_COMPLETE_IF_OPLOCKED := 1

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_FLAG_OPLOCK_KEY_CHECK_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_FLAG_BACK_OUT_ATOMIC_OPLOCK := 4

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_FLAG_IGNORE_OPLOCK_KEYS := 8

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_FLAG_PARENT_OBJECT := 16

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_FLAG_CLOSING_DELETE_ON_CLOSE := 32

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_FLAG_REMOVING_FILE_OR_LINK := 64

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_FLAG_BREAKING_FOR_SHARING_VIOLATION := 128

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_UPPER_FLAG_CHECK_NO_BREAK := 65536

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_UPPER_FLAG_NOTIFY_REFRESH_READ := 131072

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_FSCTRL_FLAG_ALL_KEYS_MATCH := 1

/**
 * @type {Guid}
 */
export global GUID_ECP_OPLOCK_KEY := Guid("{48850596-3050-4be7-9863-fec350ce8d7f}")

/**
 * @type {Guid}
 */
export global GUID_ECP_DUAL_OPLOCK_KEY := Guid("{41621a14-b08b-4df1-b676-a05ffdf01bea}")

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VOLUME_DISMOUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VOLUME_DISMOUNT_FAILED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VOLUME_LOCK := 3

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VOLUME_LOCK_FAILED := 4

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VOLUME_UNLOCK := 5

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VOLUME_MOUNT := 6

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VOLUME_NEEDS_CHKDSK := 7

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VOLUME_WORM_NEAR_FULL := 8

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VOLUME_WEARING_OUT := 9

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VOLUME_FORCED_CLOSED := 10

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VOLUME_INFO_MAKE_COMPAT := 11

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VOLUME_PREPARING_EJECT := 12

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VOLUME_CHANGE_SIZE := 13

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VOLUME_BACKGROUND_FORMAT := 14

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_UNC_PROVIDER_FLAGS_MAILSLOTS_SUPPORTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_UNC_PROVIDER_FLAGS_CSC_ENABLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_UNC_PROVIDER_FLAGS_DOMAIN_SVC_AWARE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_UNC_PROVIDER_FLAGS_CONTAINER_AWARE := 8

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_UNC_REGISTRATION_VERSION_0200 := 512

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_UNC_REGISTRATION_VERSION_0201 := 513

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_UNC_REGISTRATION_CURRENT_VERSION := 513

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_UNC_HARDENING_CAPABILITIES_MUTUAL_AUTH := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_UNC_HARDENING_CAPABILITIES_INTEGRITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_UNC_HARDENING_CAPABILITIES_PRIVACY := 4

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_ALLOCATE_ECPLIST_FLAG_CHARGE_QUOTA := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_ALLOCATE_ECP_FLAG_CHARGE_QUOTA := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_ALLOCATE_ECP_FLAG_NONPAGED_POOL := 2

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_ECP_LOOKASIDE_FLAG_NONPAGED_POOL := 2

/**
 * @type {Integer (UInt32)}
 */
export global NETWORK_OPEN_ECP_IN_FLAG_DISABLE_HANDLE_COLLAPSING := 1

/**
 * @type {Integer (UInt32)}
 */
export global NETWORK_OPEN_ECP_IN_FLAG_DISABLE_HANDLE_DURABILITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global NETWORK_OPEN_ECP_IN_FLAG_FORCE_MAX_EOF_HACK := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global NETWORK_OPEN_ECP_IN_FLAG_FORCE_BUFFERED_SYNCHRONOUS_IO_HACK := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global NETWORK_OPEN_ECP_IN_FLAG_DISABLE_OPLOCKS := 4

/**
 * @type {Integer (UInt32)}
 */
export global NETWORK_OPEN_ECP_IN_FLAG_REQ_MUTUAL_AUTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global NETWORK_OPEN_ECP_OUT_FLAG_RET_MUTUAL_AUTH := 8

/**
 * @type {Guid}
 */
export global GUID_ECP_NETWORK_OPEN_CONTEXT := Guid("{c584edbf-00df-4d28-b884-35baca8911e8}")

/**
 * @type {Guid}
 */
export global GUID_ECP_NETWORK_APP_INSTANCE := Guid("{6aa6bc45-a7ef-4af7-9008-fa462e144d74}")

/**
 * @type {Guid}
 */
export global GUID_ECP_NETWORK_APP_INSTANCE_VERSION := Guid("{b7d082b9-563b-4f07-a07b-524a8116a010}")

/**
 * @type {Guid}
 */
export global GUID_ECP_PREFETCH_OPEN := Guid("{e1777b21-847e-4837-aa45-64161d280655}")

/**
 * @type {Guid}
 */
export global GUID_ECP_NFS_OPEN := Guid("{f326d30c-e5f8-4fe7-ab74-f5a3196d92db}")

/**
 * @type {Guid}
 */
export global GUID_ECP_SRV_OPEN := Guid("{bebfaebc-aabf-489d-9d2c-e9e361102853}")

/**
 * @type {Integer (UInt32)}
 */
export global SRV_OPEN_ECP_CONTEXT_VERSION_2 := 2

/**
 * @type {Guid}
 */
export global GUID_ECP_RKF_BYPASS := Guid("{02378cc6-f73c-489c-8282-564d1a99131b}")

/**
 * @type {Guid}
 */
export global GUID_ECP_IO_DEVICE_HINT := Guid("{f315b732-ac6b-4d4d-be0c-b3126490e1a3}")

/**
 * @type {Guid}
 */
export global GUID_ECP_CSV_DOWN_LEVEL_OPEN := Guid("{4248be44-647f-488f-8be5-a08aaf70f028}")

/**
 * @type {Guid}
 */
export global GUID_ECP_CSV_QUERY_FILE_REVISION := Guid("{44aec90b-de65-4d46-8fbf-763f9d970b1d}")

/**
 * @type {Guid}
 */
export global GUID_ECP_CSV_QUERY_FILE_REVISION_FILE_ID_128 := Guid("{7a3a4aa1-aa74-4bc6-b070-ab56a38c1fed}")

/**
 * @type {Guid}
 */
export global GUID_ECP_CSV_SET_HANDLE_PROPERTIES := Guid("{7a9fdd94-7b58-42bb-9740-3cb86983a615}")

/**
 * @type {Integer (UInt32)}
 */
export global CSV_SET_HANDLE_PROPERTIES_ECP_CONTEXT_FLAGS_VALID_ONLY_IF_CSV_COORDINATOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_TAG_ENCOUNTERED := 1

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_REPARSE_IF_CHILD_EXISTS := 2

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_REPARSE_IF_CHILD_NOT_EXISTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_REPARSE_IF_DIRECTORY_FINAL_COMPONENT := 8

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_REPARSE_IF_NON_DIRECTORY_NON_FINAL_COMPONENT := 16

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_REPARSE_IF_NON_DIRECTORY_FINAL_COMPONENT := 32

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_OVERRIDE_CREATE_OPTION := 64

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_RETURN_REPARSE_DATA_BUFFER := 128

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_VERSION_EX := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_REPARSE_IF_NON_FINAL_COMPONENT := 22

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_REPARSE_IF_DIRECTORY_FINAL_COMPONENT_ALWAYS := 72

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_REPARSE_IF_NON_DIRECTORY_NON_FINAL_COMPONENT_ALWAYS := 80

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_REPARSE_IF_NON_DIRECTORY_FINAL_COMPONENT_ALWAYS := 96

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_REPARSE_IF_FINAL_COMPONENT := 40

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_REPARSE_IF_FINAL_COMPONENT_ALWAYS := 104

/**
 * @type {Integer (UInt32)}
 */
export global OPEN_REPARSE_POINT_REPARSE_ALWAYS := 126

/**
 * @type {Guid}
 */
export global ECP_TYPE_OPEN_REPARSE_GUID := Guid("{323eb6a8-affd-4d95-8230-863bce09d37a}")

/**
 * @type {Guid}
 */
export global ECP_TYPE_IO_STOP_ON_SYMLINK_FILTER_GUID := Guid("{940e5d56-1646-4d3c-87b6-577ec36a1466}")

/**
 * @type {Guid}
 */
export global ECP_TYPE_CLFS_CREATE_CONTAINER := Guid("{8650c9fe-0cec-8bf6-bd1e-835956541090}")

/**
 * @type {Guid}
 */
export global GUID_ECP_CREATE_REDIRECTION := Guid("{188d6bd6-a126-4fa8-bdf2-1ccdf896f3e0}")

/**
 * @type {Integer (UInt32)}
 */
export global CREATE_REDIRECTION_FLAGS_SERVICED_FROM_LAYER := 1

/**
 * @type {Integer (UInt32)}
 */
export global CREATE_REDIRECTION_FLAGS_SERVICED_FROM_SCRATCH := 2

/**
 * @type {Integer (UInt32)}
 */
export global CREATE_REDIRECTION_FLAGS_SERVICED_FROM_REGISTERED_LAYER := 4

/**
 * @type {Integer (UInt32)}
 */
export global CREATE_REDIRECTION_FLAGS_SERVICED_FROM_REMOTE_LAYER := 8

/**
 * @type {Integer (UInt32)}
 */
export global CREATE_REDIRECTION_FLAGS_SERVICED_FROM_USER_MODE := 16

/**
 * @type {Integer (UInt32)}
 */
export global WCIFS_REDIRECTION_FLAGS_CREATE_SERVICED_FROM_LAYER := 1

/**
 * @type {Integer (UInt32)}
 */
export global WCIFS_REDIRECTION_FLAGS_CREATE_SERVICED_FROM_SCRATCH := 2

/**
 * @type {Integer (UInt32)}
 */
export global WCIFS_REDIRECTION_FLAGS_CREATE_SERVICED_FROM_REGISTERED_LAYER := 4

/**
 * @type {Integer (UInt32)}
 */
export global WCIFS_REDIRECTION_FLAGS_CREATE_SERVICED_FROM_REMOTE_LAYER := 8

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_SPARSE_SPECIFIED := 1

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_REPARSE_POINT_SPECIFIED := 2

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_EOF_SPECIFIED := 4

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_VDL_SPECIFIED := 8

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_TIMESTAMPS_SPECIFIED := 16

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_FILE_ATTRIBUTES_SPECIFIED := 32

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_SUPPRESS_FILE_ATTRIBUTE_INHERITANCE := 64

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_OP_FLAGS_SPECIFIED := 128

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_OPERATION_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_BEST_EFFORT := 256

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_SUPPRESS_PARENT_TIMESTAMPS_UPDATE := 512

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_SUPPRESS_DIR_CHANGE_NOTIFY := 1024

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_MARK_USN_SOURCE_INFO := 2048

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_WRITE_USN_CLOSE_RECORD := 4096

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_FLAG_GEN_FLAGS_SPECIFIED := 32768

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_IN_OP_FLAG_CASE_SENSITIVE_FLAGS_SPECIFIED := 1

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_FLAG_SPARSE_SET := 1

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_FLAG_REPARSE_POINT_SET := 2

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_FLAG_EOF_SET := 4

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_FLAG_VDL_SET := 8

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_FLAG_TIMESTAMPS_SET := 16

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_FLAG_FILE_ATTRIBUTES_SET := 32

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_FLAG_FILE_ATTRIBUTE_INHERITANCE_SUPPRESSED := 64

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_FLAG_OP_FLAGS_HONORED := 128

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_FLAG_OPERATION_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_FLAG_TIMESTAMPS_RETURNED := 256

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_FLAG_FILE_ATTRIBUTES_RETURNED := 512

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_FLAG_USN_SOURCE_INFO_MARKED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_FLAG_USN_CLOSE_RECORD_WRITTEN := 2048

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_FLAG_USN_RETURNED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global ATOMIC_CREATE_ECP_OUT_OP_FLAG_CASE_SENSITIVE_FLAGS_SET := 1

/**
 * @type {Guid}
 */
export global GUID_ECP_ATOMIC_CREATE := Guid("{4720bd83-52ac-4104-a130-d1ec6a8cc8e5}")

/**
 * @type {Integer (UInt32)}
 */
export global ECP_OPEN_PARAMETERS_FLAG_OPEN_FOR_READ := 1

/**
 * @type {Integer (UInt32)}
 */
export global ECP_OPEN_PARAMETERS_FLAG_OPEN_FOR_WRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global ECP_OPEN_PARAMETERS_FLAG_OPEN_FOR_DELETE := 4

/**
 * @type {Integer (UInt32)}
 */
export global ECP_OPEN_PARAMETERS_FLAG_IGNORE_DIR_CASE_SENSITIVITY := 8

/**
 * @type {Integer (UInt32)}
 */
export global ECP_OPEN_PARAMETERS_FLAG_FAIL_ON_CASE_SENSITIVE_DIR := 16

/**
 * @type {Guid}
 */
export global GUID_ECP_OPEN_PARAMETERS := Guid("{cd0a93c3-3bb7-463d-accb-969d3435a5a5}")

/**
 * @type {Integer (UInt32)}
 */
export global QoCFileStatInformation := 1

/**
 * @type {Integer (UInt32)}
 */
export global QoCFileLxInformation := 2

/**
 * @type {Integer (UInt32)}
 */
export global QoCFileEaInformation := 4

/**
 * @type {Guid}
 */
export global GUID_ECP_QUERY_ON_CREATE := Guid("{1aca62e9-abb4-4ff2-bb5c-1c79025e417f}")

/**
 * @type {Guid}
 */
export global GUID_ECP_CLOUDFILES_ATTRIBUTION := Guid("{2932ff52-8378-4fc1-8edb-6bdc8f602709}")

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_CC_FLUSH_ERROR_FLAG_NO_HARD_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_CC_FLUSH_ERROR_FLAG_NO_LOG_ENTRY := 2

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VIRTDISK_FULLY_ALLOCATED := 1

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_VIRTDISK_NO_DRIVE_LETTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global FSRTL_DRIVER_BACKING_FLAG_USE_PAGE_FILE := 1

/**
 * @type {Integer (UInt32)}
 */
export global VACB_MAPPING_GRANULARITY := 262144

/**
 * @type {Integer (UInt32)}
 */
export global VACB_OFFSET_SHIFT := 18

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_MANAGER_CALLBACKS_EX_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CC_ACQUIRE_DONT_WAIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CC_ACQUIRE_SUPPORTS_ASYNC_LAZYWRITE := 1

/**
 * @type {Integer (UInt32)}
 */
export global UNINITIALIZE_CACHE_MAPS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DO_NOT_RETRY_PURGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DO_NOT_PURGE_DIRTY_PAGES := 4

/**
 * @type {Integer (UInt32)}
 */
export global PURGE_WITH_ACTIVE_VIEWS := 8

/**
 * @type {Integer (UInt32)}
 */
export global CC_FLUSH_AND_PURGE_NO_PURGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CC_FLUSH_AND_PURGE_GATHER_DIRTY_BITS := 2

/**
 * @type {Integer (UInt32)}
 */
export global CC_FLUSH_AND_PURGE_WRITEABLE_VIEWS_NOTSEEN := 4

/**
 * @type {Integer (UInt32)}
 */
export global PIN_WAIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PIN_EXCLUSIVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PIN_NO_READ := 4

/**
 * @type {Integer (UInt32)}
 */
export global PIN_IF_BCB := 8

/**
 * @type {Integer (UInt32)}
 */
export global PIN_CALLER_TRACKS_DIRTY_DATA := 32

/**
 * @type {Integer (UInt32)}
 */
export global PIN_HIGH_PRIORITY := 64

/**
 * @type {Integer (UInt32)}
 */
export global PIN_VERIFY_REQUIRED := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAP_WAIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAP_NO_READ := 16

/**
 * @type {Integer (UInt32)}
 */
export global MAP_HIGH_PRIORITY := 64

/**
 * @type {Integer (UInt32)}
 */
export global MAP_DISABLE_PAGEFAULT_CLUSTERING := 256

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_USE_DIRECT_ACCESS_MAPPING := 1

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_VALID_FLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CC_AGGRESSIVE_UNMAP_BEHIND := 1

/**
 * @type {Integer (UInt32)}
 */
export global CC_DISABLE_READ_AHEAD := 2

/**
 * @type {Integer (UInt32)}
 */
export global CC_DISABLE_WRITE_BEHIND := 4

/**
 * @type {Integer (UInt32)}
 */
export global CC_DISABLE_DIRTY_PAGE_TRACKING := 8

/**
 * @type {Integer (UInt32)}
 */
export global CC_ENABLE_DISK_IO_ACCOUNTING := 16

/**
 * @type {Integer (UInt32)}
 */
export global CC_DISABLE_UNMAP_BEHIND := 32

/**
 * @type {Integer (UInt32)}
 */
export global CC_ENABLE_CPU_CACHE := 268435456

/**
 * @type {String}
 */
export global DD_MUP_DEVICE_NAME := "\Device\Mup"

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_REDIR_QUERY_PATH := 1311119

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_REDIR_QUERY_PATH_EX := 1311123

/**
 * @type {String}
 */
export global EA_NAME_NETWORK_OPEN_ECP_PRIVACY := "ECP{c584edbf-00df-4d28-00b8-8435baca8911e8}-PRIVACY"

/**
 * @type {String}
 */
export global EA_NAME_NETWORK_OPEN_ECP_PRIVACY_U := "ECP{c584edbf-00df-4d28-00b8-8435baca8911e8}-PRIVACY"

/**
 * @type {String}
 */
export global EA_NAME_NETWORK_OPEN_ECP_INTEGRITY := "ECP{c584edbf-00df-4d28-00b8-8435baca8911e8}-INTEGRITY"

/**
 * @type {String}
 */
export global EA_NAME_NETWORK_OPEN_ECP_INTEGRITY_U := "ECP{c584edbf-00df-4d28-00b8-8435baca8911e8}-INTEGRITY"

/**
 * @type {Integer (UInt32)}
 */
export global VOLSNAPCONTROLTYPE := 83

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLSNAP_FLUSH_AND_HOLD_WRITES := 5488640

/**
 * @type {Integer (UInt32)}
 */
export global MAXIMUM_LEADBYTES := 12
;@endregion Constants
