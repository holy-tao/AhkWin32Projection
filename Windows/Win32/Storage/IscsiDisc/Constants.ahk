#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SCSI_BASE := 4

/**
 * @type {Guid}
 */
export global ScsiRawInterfaceGuid := Guid("{53f56309-b6bf-11d0-94f2-00a0c91efb8b}")

/**
 * @type {Guid}
 */
export global WmiScsiAddressGuid := Guid("{53f5630f-b6bf-11d0-94f2-00a0c91efb8b}")

/**
 * @type {Integer (UInt32)}
 */
export global FILE_DEVICE_SCSI := 27

/**
 * @type {String}
 */
export global DD_SCSI_DEVICE_NAME := "\Device\ScsiPort"

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SCSI_PASS_THROUGH := 315396

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SCSI_MINIPORT := 315400

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SCSI_GET_INQUIRY_DATA := 266252

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SCSI_GET_CAPABILITIES := 266256

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SCSI_PASS_THROUGH_DIRECT := 315412

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SCSI_GET_ADDRESS := 266264

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SCSI_RESCAN_BUS := 266268

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SCSI_GET_DUMP_POINTERS := 266272

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SCSI_FREE_DUMP_POINTERS := 266276

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_IDE_PASS_THROUGH := 315432

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_ATA_PASS_THROUGH := 315436

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_ATA_PASS_THROUGH_DIRECT := 315440

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_ATA_MINIPORT := 315444

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_MINIPORT_PROCESS_SERVICE_IRP := 315448

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_MPIO_PASS_THROUGH_PATH := 315452

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_MPIO_PASS_THROUGH_PATH_DIRECT := 315456

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SCSI_PASS_THROUGH_EX := 315460

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SCSI_PASS_THROUGH_DIRECT_EX := 315464

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_MPIO_PASS_THROUGH_PATH_EX := 315468

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_MPIO_PASS_THROUGH_PATH_DIRECT_EX := 315472

/**
 * @type {Integer (UInt32)}
 */
export global ATA_FLAGS_DRDY_REQUIRED := 1

/**
 * @type {Integer (UInt32)}
 */
export global ATA_FLAGS_DATA_IN := 2

/**
 * @type {Integer (UInt32)}
 */
export global ATA_FLAGS_DATA_OUT := 4

/**
 * @type {Integer (UInt32)}
 */
export global ATA_FLAGS_48BIT_COMMAND := 8

/**
 * @type {Integer (UInt32)}
 */
export global ATA_FLAGS_USE_DMA := 16

/**
 * @type {Integer (UInt32)}
 */
export global ATA_FLAGS_NO_MULTIPLE := 32

/**
 * @type {String}
 */
export global IOCTL_MINIPORT_SIGNATURE_SCSIDISK := "SCSIDISK"

/**
 * @type {String}
 */
export global IOCTL_MINIPORT_SIGNATURE_HYBRDISK := "HYBRDISK"

/**
 * @type {String}
 */
export global IOCTL_MINIPORT_SIGNATURE_DSM_NOTIFICATION := "MPDSM   "

/**
 * @type {String}
 */
export global IOCTL_MINIPORT_SIGNATURE_DSM_GENERAL := "MPDSMGEN"

/**
 * @type {String}
 */
export global IOCTL_MINIPORT_SIGNATURE_FIRMWARE := "FIRMWARE"

/**
 * @type {String}
 */
export global IOCTL_MINIPORT_SIGNATURE_QUERY_PROTOCOL := "PROTOCOL"

/**
 * @type {String}
 */
export global IOCTL_MINIPORT_SIGNATURE_SET_PROTOCOL := "SETPROTO"

/**
 * @type {String}
 */
export global IOCTL_MINIPORT_SIGNATURE_QUERY_TEMPERATURE := "TEMPERAT"

/**
 * @type {String}
 */
export global IOCTL_MINIPORT_SIGNATURE_SET_TEMPERATURE_THRESHOLD := "SETTEMPT"

/**
 * @type {String}
 */
export global IOCTL_MINIPORT_SIGNATURE_QUERY_PHYSICAL_TOPOLOGY := "TOPOLOGY"

/**
 * @type {String}
 */
export global IOCTL_MINIPORT_SIGNATURE_ENDURANCE_INFO := "ENDURINF"

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_NVCACHE_INFO := 236

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_SPINDLE_STATUS := 229

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_NVCACHE_POWER_MODE_SET := 0

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_NVCACHE_POWER_MODE_RETURN := 1

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_FLUSH_NVCACHE := 20

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_QUERY_PINNED_SET := 18

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_QUERY_CACHE_MISS := 19

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_ADD_LBAS_PINNED_SET := 16

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_REMOVE_LBAS_PINNED_SET := 17

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_QUERY_ASCENDER_STATUS := 208

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_QUERY_HYBRID_DISK_STATUS := 209

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_PASS_HINT_PAYLOAD := 224

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_NVSEPARATED_INFO := 192

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_NVSEPARATED_FLUSH := 193

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_NVSEPARATED_WB_DISABLE := 194

/**
 * @type {Integer (UInt32)}
 */
export global NRB_FUNCTION_NVSEPARATED_WB_REVERT_DEFAULT := 195

/**
 * @type {Integer (UInt32)}
 */
export global NRB_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global NRB_ILLEGAL_REQUEST := 1

/**
 * @type {Integer (UInt32)}
 */
export global NRB_INVALID_PARAMETER := 2

/**
 * @type {Integer (UInt32)}
 */
export global NRB_INPUT_DATA_OVERRUN := 3

/**
 * @type {Integer (UInt32)}
 */
export global NRB_INPUT_DATA_UNDERRUN := 4

/**
 * @type {Integer (UInt32)}
 */
export global NRB_OUTPUT_DATA_OVERRUN := 5

/**
 * @type {Integer (UInt32)}
 */
export global NRB_OUTPUT_DATA_UNDERRUN := 6

/**
 * @type {Integer (UInt32)}
 */
export global NV_SEP_CACHE_PARAMETER_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global NV_SEP_CACHE_PARAMETER_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_DIAGNOSTIC_STATUS_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_DIAGNOSTIC_STATUS_BUFFER_TOO_SMALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_DIAGNOSTIC_STATUS_UNSUPPORTED_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_DIAGNOSTIC_STATUS_INVALID_PARAMETER := 3

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_DIAGNOSTIC_STATUS_INVALID_SIGNATURE := 4

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_DIAGNOSTIC_STATUS_INVALID_TARGET_TYPE := 5

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_DIAGNOSTIC_STATUS_MORE_DATA := 6

/**
 * @type {Integer (UInt32)}
 */
export global MINIPORT_DSM_NOTIFICATION_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global MINIPORT_DSM_NOTIFICATION_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global MINIPORT_DSM_PROFILE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global MINIPORT_DSM_PROFILE_PAGE_FILE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MINIPORT_DSM_PROFILE_HIBERNATION_FILE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MINIPORT_DSM_PROFILE_CRASHDUMP_FILE := 3

/**
 * @type {Integer (UInt32)}
 */
export global MINIPORT_DSM_NOTIFY_FLAG_BEGIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global MINIPORT_DSM_NOTIFY_FLAG_END := 2

/**
 * @type {Integer (UInt32)}
 */
export global HYBRID_FUNCTION_GET_INFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global HYBRID_FUNCTION_DISABLE_CACHING_MEDIUM := 16

/**
 * @type {Integer (UInt32)}
 */
export global HYBRID_FUNCTION_ENABLE_CACHING_MEDIUM := 17

/**
 * @type {Integer (UInt32)}
 */
export global HYBRID_FUNCTION_SET_DIRTY_THRESHOLD := 18

/**
 * @type {Integer (UInt32)}
 */
export global HYBRID_FUNCTION_DEMOTE_BY_SIZE := 19

/**
 * @type {Integer (UInt32)}
 */
export global HYBRID_STATUS_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global HYBRID_STATUS_ILLEGAL_REQUEST := 1

/**
 * @type {Integer (UInt32)}
 */
export global HYBRID_STATUS_INVALID_PARAMETER := 2

/**
 * @type {Integer (UInt32)}
 */
export global HYBRID_STATUS_OUTPUT_BUFFER_TOO_SMALL := 3

/**
 * @type {Integer (UInt32)}
 */
export global HYBRID_STATUS_ENABLE_REFCOUNT_HOLD := 16

/**
 * @type {Integer (UInt32)}
 */
export global HYBRID_REQUEST_BLOCK_STRUCTURE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global HYBRID_REQUEST_INFO_STRUCTURE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_FUNCTION_GET_INFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_FUNCTION_DOWNLOAD := 2

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_FUNCTION_ACTIVATE := 3

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_ILLEGAL_REQUEST := 2

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_INVALID_PARAMETER := 3

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_INPUT_BUFFER_TOO_BIG := 4

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_OUTPUT_BUFFER_TOO_SMALL := 5

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_INVALID_SLOT := 6

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_INVALID_IMAGE := 7

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_CONTROLLER_ERROR := 16

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_POWER_CYCLE_REQUIRED := 32

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_DEVICE_ERROR := 64

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_INTERFACE_CRC_ERROR := 128

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_UNCORRECTABLE_DATA_ERROR := 129

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_MEDIA_CHANGE := 130

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_ID_NOT_FOUND := 131

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_MEDIA_CHANGE_REQUEST := 132

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_COMMAND_ABORT := 133

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_END_OF_MEDIA := 134

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_STATUS_ILLEGAL_LENGTH := 135

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_REQUEST_BLOCK_STRUCTURE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_REQUEST_FLAG_CONTROLLER := 1

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_REQUEST_FLAG_LAST_SEGMENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_REQUEST_FLAG_FIRST_SEGMENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_REQUEST_FLAG_SWITCH_TO_FIRMWARE_WITHOUT_RESET := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_REQUEST_FLAG_REPLACE_AND_SWITCH_UPON_RESET := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_REQUEST_FLAG_REPLACE_EXISTING_IMAGE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global FIRMWARE_REQUEST_FLAG_SWITCH_TO_EXISTING_FIRMWARE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_FIRMWARE_INFO_STRUCTURE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_FIRMWARE_INFO_STRUCTURE_VERSION_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_FIRMWARE_INFO_INVALID_SLOT := 255

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_FIRMWARE_SLOT_INFO_V2_REVISION_LENGTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_FIRMWARE_DOWNLOAD_STRUCTURE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_FIRMWARE_DOWNLOAD_STRUCTURE_VERSION_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global STORAGE_FIRMWARE_ACTIVATE_STRUCTURE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DUMP_POINTERS_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DUMP_POINTERS_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DUMP_POINTERS_VERSION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global DUMP_POINTERS_VERSION_4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global DUMP_DRIVER_NAME_LENGTH := 15

/**
 * @type {Integer (UInt32)}
 */
export global DUMP_EX_FLAG_SUPPORT_64BITMEMORY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DUMP_EX_FLAG_SUPPORT_DD_TELEMETRY := 2

/**
 * @type {Integer (UInt32)}
 */
export global DUMP_EX_FLAG_RESUME_SUPPORT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DUMP_EX_FLAG_DRIVER_FULL_PATH_SUPPORT := 8

/**
 * @type {Integer (UInt32)}
 */
export global SCSI_IOCTL_DATA_OUT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCSI_IOCTL_DATA_IN := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCSI_IOCTL_DATA_UNSPECIFIED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCSI_IOCTL_DATA_BIDIRECTIONAL := 3

/**
 * @type {Integer (UInt32)}
 */
export global MPIO_IOCTL_FLAG_USE_PATHID := 1

/**
 * @type {Integer (UInt32)}
 */
export global MPIO_IOCTL_FLAG_USE_SCSIADDRESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global MPIO_IOCTL_FLAG_INVOLVE_DSM := 4

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ISCSI_HBANAME_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ISCSI_NAME_LEN := 223

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ISCSI_ALIAS_LEN := 255

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ISCSI_PORTAL_NAME_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ISCSI_PORTAL_ALIAS_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ISCSI_TEXT_ADDRESS_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ISCSI_PORTAL_ADDRESS_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ISCSI_DISCOVERY_DOMAIN_LEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_RADIUS_ADDRESS_LEN := 41

/**
 * @type {String}
 */
export global ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED := "0x00000040"

/**
 * @type {String}
 */
export global ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED := "0x00000020"

/**
 * @type {String}
 */
export global ISCSI_SECURITY_FLAG_PFS_ENABLED := "0x00000010"

/**
 * @type {String}
 */
export global ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED := "0x00000008"

/**
 * @type {String}
 */
export global ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED := "0x00000004"

/**
 * @type {String}
 */
export global ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED := "0x00000002"

/**
 * @type {String}
 */
export global ISCSI_SECURITY_FLAG_VALID := "0x00000001"

/**
 * @type {String}
 */
export global ISCSI_LOGIN_OPTIONS_HEADER_DIGEST := "0x00000001"

/**
 * @type {String}
 */
export global ISCSI_LOGIN_OPTIONS_DATA_DIGEST := "0x00000002"

/**
 * @type {String}
 */
export global ISCSI_LOGIN_OPTIONS_MAXIMUM_CONNECTIONS := "0x00000004"

/**
 * @type {String}
 */
export global ISCSI_LOGIN_OPTIONS_DEFAULT_TIME_2_WAIT := "0x00000008"

/**
 * @type {String}
 */
export global ISCSI_LOGIN_OPTIONS_DEFAULT_TIME_2_RETAIN := "0x00000010"

/**
 * @type {String}
 */
export global ISCSI_LOGIN_OPTIONS_USERNAME := "0x00000020"

/**
 * @type {String}
 */
export global ISCSI_LOGIN_OPTIONS_PASSWORD := "0x00000040"

/**
 * @type {String}
 */
export global ISCSI_LOGIN_OPTIONS_AUTH_TYPE := "0x00000080"

/**
 * @type {String}
 */
export global ID_IPV4_ADDR := "1"

/**
 * @type {String}
 */
export global ID_FQDN := "2"

/**
 * @type {String}
 */
export global ID_USER_FQDN := "3"

/**
 * @type {String}
 */
export global ID_IPV6_ADDR := "5"

/**
 * @type {Integer (UInt32)}
 */
export global ISCSI_LOGIN_FLAG_REQUIRE_IPSEC := 1

/**
 * @type {Integer (UInt32)}
 */
export global ISCSI_LOGIN_FLAG_MULTIPATH_ENABLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global ISCSI_LOGIN_FLAG_RESERVED1 := 4

/**
 * @type {Integer (UInt32)}
 */
export global ISCSI_LOGIN_FLAG_ALLOW_PORTAL_HOPPING := 8

/**
 * @type {Integer (UInt32)}
 */
export global ISCSI_LOGIN_FLAG_USE_RADIUS_RESPONSE := 16

/**
 * @type {Integer (UInt32)}
 */
export global ISCSI_LOGIN_FLAG_USE_RADIUS_VERIFICATION := 32

/**
 * @type {Integer (UInt32)}
 */
export global ISCSI_LOGIN_OPTIONS_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global ISCSI_TARGET_FLAG_HIDE_STATIC_TARGET := 2

/**
 * @type {Integer (UInt32)}
 */
export global ISCSI_TARGET_FLAG_MERGE_TARGET_INFORMATION := 4
;@endregion Constants
