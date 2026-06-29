#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global MAXIMUM_REPARSE_DATA_BUFFER_SIZE := 16384

/**
 * @type {String}
 */
export global EA_CONTAINER_NAME := "ContainerName"

/**
 * @type {String}
 */
export global EA_CONTAINER_SIZE := "ContainerSize"

/**
 * @type {String}
 */
export global CLFS_BASELOG_EXTENSION := ".blf"

/**
 * @type {Integer (UInt32)}
 */
export global CLFS_FLAG_REENTRANT_FILE_SYSTEM := 8

/**
 * @type {Integer (UInt32)}
 */
export global CLFS_FLAG_NON_REENTRANT_FILTER := 16

/**
 * @type {Integer (UInt32)}
 */
export global CLFS_FLAG_REENTRANT_FILTER := 32

/**
 * @type {Integer (UInt32)}
 */
export global CLFS_FLAG_IGNORE_SHARE_ACCESS := 64

/**
 * @type {Integer (UInt32)}
 */
export global CLFS_FLAG_READ_IN_PROGRESS := 128

/**
 * @type {Integer (UInt32)}
 */
export global CLFS_FLAG_MINIFILTER_LEVEL := 256

/**
 * @type {Integer (UInt32)}
 */
export global CLFS_FLAG_HIDDEN_SYSTEM_LOG := 512

/**
 * @type {Integer (UInt32)}
 */
export global CLFS_MARSHALLING_FLAG_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLFS_MARSHALLING_FLAG_DISABLE_BUFF_INIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLFS_FLAG_FILTER_INTERMEDIATE_LEVEL := 16

/**
 * @type {Integer (UInt32)}
 */
export global CLFS_FLAG_FILTER_TOP_LEVEL := 32

/**
 * @type {String}
 */
export global CLFS_CONTAINER_STREAM_PREFIX := "%BLF%:"

/**
 * @type {String}
 */
export global CLFS_CONTAINER_RELATIVE_PREFIX := "%BLF%\"

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_MANAGER_VOLATILE := 1

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_MANAGER_COMMIT_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_MANAGER_COMMIT_SYSTEM_VOLUME := 2

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_MANAGER_COMMIT_SYSTEM_HIVES := 4

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_MANAGER_COMMIT_LOWEST := 8

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_MANAGER_CORRUPT_FOR_RECOVERY := 16

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_MANAGER_CORRUPT_FOR_PROGRESS := 32

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_MANAGER_MAXIMUM_OPTION := 63

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_DO_NOT_PROMOTE := 1

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_MAXIMUM_OPTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCE_MANAGER_VOLATILE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCE_MANAGER_COMMUNICATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCE_MANAGER_MAXIMUM_OPTION := 3

/**
 * @type {Integer (UInt32)}
 */
export global CRM_PROTOCOL_EXPLICIT_MARSHAL_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRM_PROTOCOL_DYNAMIC_MARSHAL_INFO := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRM_PROTOCOL_MAXIMUM_OPTION := 3

/**
 * @type {Integer (UInt32)}
 */
export global ENLISTMENT_SUPERIOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENLISTMENT_MAXIMUM_OPTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_MASK := 1073741823

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_PREPREPARE := 1

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_PREPARE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_COMMIT := 4

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_ROLLBACK := 8

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_PREPREPARE_COMPLETE := 16

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_PREPARE_COMPLETE := 32

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_COMMIT_COMPLETE := 64

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_ROLLBACK_COMPLETE := 128

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_RECOVER := 256

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_SINGLE_PHASE_COMMIT := 512

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_DELEGATE_COMMIT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_RECOVER_QUERY := 2048

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_ENLIST_PREPREPARE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_LAST_RECOVER := 8192

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_INDOUBT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_PROPAGATE_PULL := 32768

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_PROPAGATE_PUSH := 65536

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_MARSHAL := 131072

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_ENLIST_MASK := 262144

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_RM_DISCONNECTED := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_TM_ONLINE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_COMMIT_REQUEST := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_PROMOTE := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_PROMOTE_NEW := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_REQUEST_OUTCOME := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFY_COMMIT_FINALIZE := 1073741824

/**
 * @type {String}
 */
export global TRANSACTIONMANAGER_OBJECT_PATH := "\TransactionManager\"

/**
 * @type {String}
 */
export global TRANSACTION_OBJECT_PATH := "\Transaction\"

/**
 * @type {String}
 */
export global ENLISTMENT_OBJECT_PATH := "\Enlistment\"

/**
 * @type {String}
 */
export global RESOURCE_MANAGER_OBJECT_PATH := "\ResourceManager\"

/**
 * @type {Integer (UInt32)}
 */
export global TRANSACTION_NOTIFICATION_TM_ONLINE_FLAG_IS_CLUSTERED := 1

/**
 * @type {Integer (UInt32)}
 */
export global KTM_MARSHAL_BLOB_VERSION_MAJOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global KTM_MARSHAL_BLOB_VERSION_MINOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_TRANSACTION_DESCRIPTION_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global MAX_RESOURCEMANAGER_DESCRIPTION_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_BASE := 86

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_GET_VOLUME_DISK_EXTENTS := 5636096

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_ONLINE := 5685256

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_OFFLINE := 5685260

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_IS_CLUSTERED := 5636144

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_GET_GPT_ATTRIBUTES := 5636152

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_SUPPORTS_ONLINE_OFFLINE := 5636100

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_IS_OFFLINE := 5636112

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_IS_IO_CAPABLE := 5636116

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_QUERY_FAILOVER_SET := 5636120

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_QUERY_VOLUME_NUMBER := 5636124

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_LOGICAL_TO_PHYSICAL := 5636128

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_PHYSICAL_TO_LOGICAL := 5636132

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_IS_PARTITION := 5636136

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_READ_PLEX := 5652526

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_SET_GPT_ATTRIBUTES := 5636148

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_GET_BC_PROPERTIES := 5652540

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_ALLOCATE_BC_STREAM := 5685312

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_FREE_BC_STREAM := 5685316

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_BC_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_IS_DYNAMIC := 5636168

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_PREPARE_FOR_CRITICAL_IO := 5685324

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_QUERY_ALLOCATION_HINT := 5652562

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_UPDATE_PROPERTIES := 5636180

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_QUERY_MINIMUM_SHRINK_SIZE := 5652568

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_PREPARE_FOR_SHRINK := 5685340

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_IS_CSV := 5636192

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_POST_ONLINE := 5685348

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VOLUME_GET_CSVBLOCKCACHE_CALLBACK := 5685352

/**
 * @type {Integer (UInt32)}
 */
export global CSV_BLOCK_CACHE_CALLBACK_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSV_BLOCK_AND_FILE_CACHE_CALLBACK_VERSION := 2

/**
 * @type {Guid}
 */
export global PARTITION_BASIC_DATA_GUID := Guid("{ebd0a0a2-b9e5-4433-87c0-68b6b72699c7}")

/**
 * @type {Guid}
 */
export global PARTITION_BSP_GUID := Guid("{57434f53-4df9-45b9-8e9e-2370f006457c}")

/**
 * @type {Guid}
 */
export global PARTITION_CLUSTER_GUID := Guid("{db97dba9-0840-4bae-97f0-ffb9a327c7e1}")

/**
 * @type {Guid}
 */
export global PARTITION_DPP_GUID := Guid("{57434f53-94cb-43f0-a533-d73c10cfa57d}")

/**
 * @type {Guid}
 */
export global PARTITION_ENTRY_UNUSED_GUID := Guid("{00000000-0000-0000-0000-000000000000}")

/**
 * @type {Guid}
 */
export global PARTITION_LDM_DATA_GUID := Guid("{af9b60a0-1431-4f62-bc68-3311714a69ad}")

/**
 * @type {Guid}
 */
export global PARTITION_LDM_METADATA_GUID := Guid("{5808c8aa-7e8f-42e0-85d2-e1e90434cfb3}")

/**
 * @type {Guid}
 */
export global PARTITION_MAIN_OS_GUID := Guid("{57434f53-8f45-405e-8a23-186d8a4330d3}")

/**
 * @type {Guid}
 */
export global PARTITION_MSFT_RECOVERY_GUID := Guid("{de94bba4-06d1-4d40-a16a-bfd50179d6ac}")

/**
 * @type {Guid}
 */
export global PARTITION_MSFT_RESERVED_GUID := Guid("{e3c9e316-0b5c-4db8-817d-f92df00215ae}")

/**
 * @type {Guid}
 */
export global PARTITION_MSFT_SNAPSHOT_GUID := Guid("{caddebf1-4400-4de8-b103-12117dcf3ccf}")

/**
 * @type {Guid}
 */
export global PARTITION_OS_DATA_GUID := Guid("{57434f53-23f2-44d5-a830-67bbdaa609f9}")

/**
 * @type {Guid}
 */
export global PARTITION_PATCH_GUID := Guid("{8967a686-96aa-6aa8-9589-a84256541090}")

/**
 * @type {Guid}
 */
export global PARTITION_PRE_INSTALLED_GUID := Guid("{57434f53-7fe0-4196-9b42-427b51643484}")

/**
 * @type {Guid}
 */
export global PARTITION_SBL_CACHE_SSD_GUID := Guid("{eeff8352-dd2a-44db-ae83-bee1cf7481dc}")

/**
 * @type {Guid}
 */
export global PARTITION_SBL_CACHE_SSD_RESERVED_GUID := Guid("{dcc0c7c1-55ad-4f17-9d43-4bc776e0117e}")

/**
 * @type {Guid}
 */
export global PARTITION_SBL_CACHE_HDD_GUID := Guid("{03aaa829-ebfc-4e7e-aac9-c4d76c63b24b}")

/**
 * @type {Guid}
 */
export global PARTITION_SERVICING_FILES_GUID := Guid("{57434f53-432e-4014-ae4c-8deaa9c0006a}")

/**
 * @type {Guid}
 */
export global PARTITION_SERVICING_METADATA_GUID := Guid("{57434f53-c691-4a05-bb4e-703dafd229ce}")

/**
 * @type {Guid}
 */
export global PARTITION_SERVICING_RESERVE_GUID := Guid("{57434f53-4b81-460b-a319-ffb6fe136d14}")

/**
 * @type {Guid}
 */
export global PARTITION_SERVICING_STAGING_ROOT_GUID := Guid("{57434f53-e84d-4e84-aaf3-ecbbbd04b9df}")

/**
 * @type {Guid}
 */
export global PARTITION_SPACES_GUID := Guid("{e75caf8f-f680-4cee-afa3-b001e56efc2d}")

/**
 * @type {Guid}
 */
export global PARTITION_SPACES_DATA_GUID := Guid("{e7addcb4-dc34-4539-9a76-ebbd07be6f7e}")

/**
 * @type {Guid}
 */
export global PARTITION_SYSTEM_GUID := Guid("{c12a7328-f81f-11d2-ba4b-00a0c93ec93b}")

/**
 * @type {Guid}
 */
export global PARTITION_WINDOWS_SYSTEM_GUID := Guid("{57434f53-e3e3-4631-a5c5-26d2243873aa}")

/**
 * @type {Integer (UInt32)}
 */
export global _FT_TYPES_DEFINITION_ := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLFS_MGMT_POLICY_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOG_POLICY_OVERWRITE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOG_POLICY_PERSIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLFS_MGMT_CLIENT_REGISTRATION_VERSION := 1

/**
 * @type {Guid}
 */
export global CLSID_DiskQuotaControl := Guid("{7988b571-ec89-11cf-9c00-00aa00a14f56}")

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_STATE_DISABLED := 0

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_STATE_TRACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_STATE_ENFORCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_STATE_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_FILESTATE_INCOMPLETE := 256

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_FILESTATE_REBUILDING := 512

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_FILESTATE_MASK := 768

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_LOGFLAG_USER_THRESHOLD := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_LOGFLAG_USER_LIMIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_USER_ACCOUNT_RESOLVED := 0

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_USER_ACCOUNT_UNAVAILABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_USER_ACCOUNT_DELETED := 2

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_USER_ACCOUNT_INVALID := 3

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_USER_ACCOUNT_UNKNOWN := 4

/**
 * @type {Integer (UInt32)}
 */
export global DISKQUOTA_USER_ACCOUNT_UNRESOLVED := 5

/**
 * @type {Integer (UInt32)}
 */
export global INVALID_FILE_SIZE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global INVALID_SET_FILE_POINTER := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global INVALID_FILE_ATTRIBUTES := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global SHARE_NETNAME_PARMNUM := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHARE_TYPE_PARMNUM := 3

/**
 * @type {Integer (UInt32)}
 */
export global SHARE_REMARK_PARMNUM := 4

/**
 * @type {Integer (UInt32)}
 */
export global SHARE_PERMISSIONS_PARMNUM := 5

/**
 * @type {Integer (UInt32)}
 */
export global SHARE_MAX_USES_PARMNUM := 6

/**
 * @type {Integer (UInt32)}
 */
export global SHARE_CURRENT_USES_PARMNUM := 7

/**
 * @type {Integer (UInt32)}
 */
export global SHARE_PATH_PARMNUM := 8

/**
 * @type {Integer (UInt32)}
 */
export global SHARE_PASSWD_PARMNUM := 9

/**
 * @type {Integer (UInt32)}
 */
export global SHARE_FILE_SD_PARMNUM := 501

/**
 * @type {Integer (UInt32)}
 */
export global SHARE_SERVER_PARMNUM := 503

/**
 * @type {Integer (UInt32)}
 */
export global SHARE_QOS_POLICY_PARMNUM := 504

/**
 * @type {Integer (UInt32)}
 */
export global SHI1_NUM_ELEMENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global SHI2_NUM_ELEMENTS := 10

/**
 * @type {Integer (UInt32)}
 */
export global STYPE_RESERVED1 := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global STYPE_RESERVED2 := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global STYPE_RESERVED3 := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global STYPE_RESERVED4 := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global STYPE_RESERVED5 := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global STYPE_RESERVED_ALL := 1073741568

/**
 * @type {Integer (UInt32)}
 */
export global SHI_USES_UNLIMITED := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_DFS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_DFS_ROOT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CSC_MASK_EXT := 8240

/**
 * @type {Integer (UInt32)}
 */
export global CSC_MASK := 48

/**
 * @type {Integer (UInt32)}
 */
export global CSC_CACHE_MANUAL_REINT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CSC_CACHE_AUTO_REINT := 16

/**
 * @type {Integer (UInt32)}
 */
export global CSC_CACHE_VDO := 32

/**
 * @type {Integer (UInt32)}
 */
export global CSC_CACHE_NONE := 48

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_RESTRICT_EXCLUSIVE_OPENS := 256

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_FORCE_SHARED_DELETE := 512

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_ALLOW_NAMESPACE_CACHING := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_ACCESS_BASED_DIRECTORY_ENUM := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_FORCE_LEVELII_OPLOCK := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_ENABLE_HASH := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_ENABLE_CA := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_ENCRYPT_DATA := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_RESERVED := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_DISABLE_CLIENT_BUFFERING := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_IDENTITY_REMOTING := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_CLUSTER_MANAGED := 524288

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_COMPRESS_DATA := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_ISOLATED_TRANSPORT := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global SHI1005_FLAGS_DISABLE_DIRECTORY_HANDLE_LEASING := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global SESI1_NUM_ELEMENTS := 8

/**
 * @type {Integer (UInt32)}
 */
export global SESI2_NUM_ELEMENTS := 9

/**
 * @type {Integer (UInt32)}
 */
export global STATSOPT_CLR := 1

/**
 * @type {Integer (Int32)}
 */
export global LZERROR_BADINHANDLE := -1

/**
 * @type {Integer (Int32)}
 */
export global LZERROR_BADOUTHANDLE := -2

/**
 * @type {Integer (Int32)}
 */
export global LZERROR_READ := -3

/**
 * @type {Integer (Int32)}
 */
export global LZERROR_WRITE := -4

/**
 * @type {Integer (Int32)}
 */
export global LZERROR_GLOBALLOC := -5

/**
 * @type {Integer (Int32)}
 */
export global LZERROR_GLOBLOCK := -6

/**
 * @type {Integer (Int32)}
 */
export global LZERROR_BADVALUE := -7

/**
 * @type {Integer (Int32)}
 */
export global LZERROR_UNKNOWNALG := -8

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_OBJECTNAME_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_DESCRIPTION_LENGTH := 127

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_DEVICENAME_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_SERIALNUMBER_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_REVISION_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_BARCODE_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_SEQUENCE_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_VENDORNAME_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_PRODUCTNAME_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_USERNAME_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_APPLICATIONNAME_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_COMPUTERNAME_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_I1_MESSAGE_LENGTH := 127

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_MESSAGE_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_POOLHIERARCHY_LENGTH := 512

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_OMIDLABELID_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_OMIDLABELTYPE_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_OMIDLABELINFO_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_MAXATTR_LENGTH := 65536

/**
 * @type {Integer (UInt32)}
 */
export global NTMS_MAXATTR_NAMELEN := 32

/**
 * @type {Integer (UInt32)}
 */
export global NTMSMLI_MAXTYPE := 64

/**
 * @type {Integer (UInt32)}
 */
export global NTMSMLI_MAXIDSIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global NTMSMLI_MAXAPPDESCR := 256

/**
 * @type {Integer (UInt32)}
 */
export global TXF_LOG_RECORD_GENERIC_TYPE_COMMIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global TXF_LOG_RECORD_GENERIC_TYPE_ABORT := 2

/**
 * @type {Integer (UInt32)}
 */
export global TXF_LOG_RECORD_GENERIC_TYPE_PREPARE := 4

/**
 * @type {Integer (UInt32)}
 */
export global TXF_LOG_RECORD_GENERIC_TYPE_DATA := 8

/**
 * @type {Integer (UInt32)}
 */
export global VS_VERSION_INFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global VS_USER_DEFINED := 100

/**
 * @type {Integer (Int32)}
 */
export global VS_FFI_SIGNATURE := -17890115

/**
 * @type {Integer (Int32)}
 */
export global VS_FFI_STRUCVERSION := 65536

/**
 * @type {Integer (Int32)}
 */
export global VS_FFI_FILEFLAGSMASK := 63

/**
 * @type {Integer (UInt32)}
 */
export global WINEFS_SETUSERKEY_SET_CAPABILITIES := 1

/**
 * @type {Integer (UInt32)}
 */
export global EFS_COMPATIBILITY_VERSION_NCRYPT_PROTECTOR := 5

/**
 * @type {Integer (UInt32)}
 */
export global EFS_COMPATIBILITY_VERSION_PFILE_PROTECTOR := 6

/**
 * @type {Integer (UInt32)}
 */
export global EFS_SUBVER_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global EFS_EFS_SUBVER_EFS_CERT := 1

/**
 * @type {Integer (UInt32)}
 */
export global EFS_PFILE_SUBVER_RMS := 2

/**
 * @type {Integer (UInt32)}
 */
export global EFS_PFILE_SUBVER_APPX := 3

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SID_SIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global EFS_METADATA_ADD_USER := 1

/**
 * @type {Integer (UInt32)}
 */
export global EFS_METADATA_REMOVE_USER := 2

/**
 * @type {Integer (UInt32)}
 */
export global EFS_METADATA_REPLACE_USER := 4

/**
 * @type {Integer (UInt32)}
 */
export global EFS_METADATA_GENERAL_OP := 8

/**
 * @type {Integer (UInt32)}
 */
export global WOF_PROVIDER_WIM := 1

/**
 * @type {Integer (UInt32)}
 */
export global WOF_PROVIDER_FILE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WIM_PROVIDER_HASH_SIZE := 20

/**
 * @type {Integer (UInt32)}
 */
export global WIM_BOOT_OS_WIM := 1

/**
 * @type {Integer (UInt32)}
 */
export global WIM_BOOT_NOT_OS_WIM := 0

/**
 * @type {Integer (UInt32)}
 */
export global WIM_ENTRY_FLAG_NOT_ACTIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WIM_ENTRY_FLAG_SUSPENDED := 2

/**
 * @type {Integer (UInt32)}
 */
export global WIM_EXTERNAL_FILE_INFO_FLAG_NOT_ACTIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WIM_EXTERNAL_FILE_INFO_FLAG_SUSPENDED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PROVIDER_COMPRESSION_XPRESS4K := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PROVIDER_COMPRESSION_LZX := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PROVIDER_COMPRESSION_XPRESS8K := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PROVIDER_COMPRESSION_XPRESS16K := 3

/**
 * @type {Integer (Int32)}
 */
export global COPYFILE2_MESSAGE_COPY_OFFLOAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global COPYFILE2_IO_CYCLE_SIZE_MIN := 4096

/**
 * @type {Integer (UInt32)}
 */
export global COPYFILE2_IO_CYCLE_SIZE_MAX := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global COPYFILE2_IO_RATE_MIN := 512

/**
 * @type {Integer (Byte)}
 */
export global ClfsNullRecord := 0x00

/**
 * @type {Integer (Byte)}
 */
export global ClfsDataRecord := 0x01

/**
 * @type {Integer (Byte)}
 */
export global ClfsRestartRecord := 0x02

/**
 * @type {Integer (Byte)}
 */
export global ClfsClientRecord := 0x03

/**
 * @type {Integer (UInt32)}
 */
export global ClsContainerInitializing := 1

/**
 * @type {Integer (UInt32)}
 */
export global ClsContainerInactive := 2

/**
 * @type {Integer (UInt32)}
 */
export global ClsContainerActive := 4

/**
 * @type {Integer (UInt32)}
 */
export global ClsContainerActivePendingDelete := 8

/**
 * @type {Integer (UInt32)}
 */
export global ClsContainerPendingArchive := 16

/**
 * @type {Integer (UInt32)}
 */
export global ClsContainerPendingArchiveAndDelete := 32

/**
 * @type {Integer (UInt32)}
 */
export global ClfsContainerInitializing := 1

/**
 * @type {Integer (UInt32)}
 */
export global ClfsContainerInactive := 2

/**
 * @type {Integer (UInt32)}
 */
export global ClfsContainerActive := 4

/**
 * @type {Integer (UInt32)}
 */
export global ClfsContainerActivePendingDelete := 8

/**
 * @type {Integer (UInt32)}
 */
export global ClfsContainerPendingArchive := 16

/**
 * @type {Integer (UInt32)}
 */
export global ClfsContainerPendingArchiveAndDelete := 32

/**
 * @type {Integer (UInt32)}
 */
export global CLFS_MAX_CONTAINER_INFO := 256

/**
 * @type {Integer (Byte)}
 */
export global CLFS_SCAN_INIT := 0x01

/**
 * @type {Integer (Byte)}
 */
export global CLFS_SCAN_FORWARD := 0x02

/**
 * @type {Integer (Byte)}
 */
export global CLFS_SCAN_BACKWARD := 0x04

/**
 * @type {Integer (Byte)}
 */
export global CLFS_SCAN_CLOSE := 0x08

/**
 * @type {Integer (Byte)}
 */
export global CLFS_SCAN_INITIALIZED := 0x10

/**
 * @type {Integer (Byte)}
 */
export global CLFS_SCAN_BUFFERED := 0x20
;@endregion Constants
