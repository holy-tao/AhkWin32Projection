#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */

;@region Constants

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_ACQUIRE_FOR_SECTION_SYNCHRONIZATION := 65535

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_RELEASE_FOR_SECTION_SYNCHRONIZATION := 65534

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_ACQUIRE_FOR_MOD_WRITE := 65533

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_RELEASE_FOR_MOD_WRITE := 65532

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_ACQUIRE_FOR_CC_FLUSH := 65531

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_RELEASE_FOR_CC_FLUSH := 65530

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_QUERY_OPEN := 65529

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_FAST_IO_CHECK_IF_POSSIBLE := 65523

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_NETWORK_QUERY_OPEN := 65522

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_MDL_READ := 65521

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_MDL_READ_COMPLETE := 65520

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_PREPARE_MDL_WRITE := 65519

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_MDL_WRITE_COMPLETE := 65518

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_VOLUME_MOUNT := 65517

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_VOLUME_DISMOUNT := 65516

/**
 * @type {Integer (UInt32)}
 */
export global FLT_INTERNAL_OPERATION_COUNT := 22

/**
 * @type {Integer (UInt16)}
 */
export global IRP_MJ_OPERATION_END := 128

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_CALLBACK_DATA_REISSUE_MASK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_CALLBACK_DATA_IRP_OPERATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_CALLBACK_DATA_FAST_IO_OPERATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_CALLBACK_DATA_FS_FILTER_OPERATION := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_CALLBACK_DATA_SYSTEM_BUFFER := 8

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_CALLBACK_DATA_GENERATED_IO := 65536

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_CALLBACK_DATA_REISSUED_IO := 131072

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_CALLBACK_DATA_DRAINING_IO := 262144

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_CALLBACK_DATA_POST_OPERATION := 524288

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_CALLBACK_DATA_NEW_SYSTEM_BUFFER := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_CALLBACK_DATA_DIRTY := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global FLT_ALLOCATE_CALLBACK_DATA_PREALLOCATE_ALL_MEMORY := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLT_VOLUME_CONTEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLT_INSTANCE_CONTEXT := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FILE_CONTEXT := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLT_STREAM_CONTEXT := 8

/**
 * @type {Integer (UInt32)}
 */
export global FLT_STREAMHANDLE_CONTEXT := 16

/**
 * @type {Integer (UInt32)}
 */
export global FLT_TRANSACTION_CONTEXT := 32

/**
 * @type {Integer (UInt32)}
 */
export global FLT_SECTION_CONTEXT := 64

/**
 * @type {Integer (UInt32)}
 */
export global FLT_CONTEXT_END := 65535

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_CONTEXT_REGISTRATION_NO_EXACT_SIZE_MATCH := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_INSTANCE_SETUP_AUTOMATIC_ATTACHMENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_INSTANCE_SETUP_MANUAL_ATTACHMENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_INSTANCE_SETUP_NEWLY_MOUNTED_VOLUME := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_INSTANCE_SETUP_DETACHED_VOLUME := 8

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_INSTANCE_TEARDOWN_MANUAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_INSTANCE_TEARDOWN_FILTER_UNLOAD := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_INSTANCE_TEARDOWN_MANDATORY_FILTER_UNLOAD := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_INSTANCE_TEARDOWN_VOLUME_DISMOUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_INSTANCE_TEARDOWN_INTERNAL_ERROR := 16

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_POST_OPERATION_DRAINING := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_OPERATION_REGISTRATION_SKIP_PAGING_IO := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_OPERATION_REGISTRATION_SKIP_CACHED_IO := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_OPERATION_REGISTRATION_SKIP_NON_DASD_IO := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_OPERATION_REGISTRATION_SKIP_NON_CACHED_NON_PAGING_IO := 8

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_FILTER_UNLOAD_MANDATORY := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_NORMALIZE_NAME_CASE_SENSITIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_NORMALIZE_NAME_DESTINATION_FILE_NAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLT_REGISTRATION_VERSION_0200 := 512

/**
 * @type {Integer (UInt32)}
 */
export global FLT_REGISTRATION_VERSION_0201 := 513

/**
 * @type {Integer (UInt32)}
 */
export global FLT_REGISTRATION_VERSION_0202 := 514

/**
 * @type {Integer (UInt32)}
 */
export global FLT_REGISTRATION_VERSION_0203 := 515

/**
 * @type {Integer (UInt32)}
 */
export global FLT_REGISTRATION_VERSION := 515

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_REGISTRATION_DO_NOT_SUPPORT_SERVICE_STOP := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_REGISTRATION_SUPPORT_NPFS_MSFS := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_REGISTRATION_SUPPORT_DAX_VOLUME := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_REGISTRATION_SUPPORT_WCOS := 8

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_IO_OPERATION_NON_CACHED := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_IO_OPERATION_PAGING := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_IO_OPERATION_DO_NOT_UPDATE_BYTE_OFFSET := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_IO_OPERATION_SYNCHRONOUS_PAGING := 8

/**
 * @type {Integer (UInt32)}
 */
export global FLT_VALID_FILE_NAME_FORMATS := 255

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FILE_NAME_NORMALIZED := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FILE_NAME_OPENED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FILE_NAME_SHORT := 3

/**
 * @type {Integer (UInt32)}
 */
export global FLT_VALID_FILE_NAME_QUERY_METHODS := 65280

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FILE_NAME_QUERY_DEFAULT := 256

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FILE_NAME_QUERY_CACHE_ONLY := 512

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FILE_NAME_QUERY_FILESYSTEM_ONLY := 768

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FILE_NAME_QUERY_ALWAYS_ALLOW_CACHE_LOOKUP := 1024

/**
 * @type {Integer (UInt32)}
 */
export global FLT_VALID_FILE_NAME_FLAGS := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FILE_NAME_REQUEST_FROM_CURRENT_PROVIDER := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FILE_NAME_DO_NOT_CACHE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FILE_NAME_ALLOW_QUERY_ON_REPARSE := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_FILE_NAME_PARSED_FINAL_COMPONENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_FILE_NAME_PARSED_EXTENSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_FILE_NAME_PARSED_STREAM := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLTFL_FILE_NAME_PARSED_PARENT_DIR := 8

/**
 * @type {Integer (UInt32)}
 */
export global FLT_MAX_DEVICE_REPARSE_ATTEMPTS := 64

/**
 * @type {Integer (UInt32)}
 */
export global FLTTCFL_AUTO_REPARSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FLUSH_TYPE_FLUSH_AND_PURGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FLUSH_TYPE_FILE_DATA_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FLUSH_TYPE_NO_SYNC := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLT_FLUSH_TYPE_DATA_SYNC_ONLY := 8

/**
 * @type {Integer (UInt32)}
 */
export global VOL_PROP_FL_DAX_VOLUME := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLT_PORT_CONNECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLT_PUSH_LOCK_ENABLE_AUTO_BOOST := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLT_PUSH_LOCK_DISABLE_AUTO_BOOST := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLT_PUSH_LOCK_VALID_FLAGS := 3

/**
 * @type {Guid}
 */
export global GUID_ECP_FLT_CREATEFILE_TARGET := Guid("{ce08041d-f411-447f-b70d-ccee45c23fac}")
;@endregion Constants
