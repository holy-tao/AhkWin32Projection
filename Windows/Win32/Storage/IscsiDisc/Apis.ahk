#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class IscsiDisc {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCSI_BASE => 4

    /**
     * @type {String}
     */
    static ScsiRawInterfaceGuid => "{53f56309-b6bf-11d0-94f2-00a0c91efb8b}"

    /**
     * @type {String}
     */
    static WmiScsiAddressGuid => "{53f5630f-b6bf-11d0-94f2-00a0c91efb8b}"

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_SCSI => 27

    /**
     * @type {String}
     */
    static DD_SCSI_DEVICE_NAME => "\Device\ScsiPort"

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCSI_PASS_THROUGH => 315396

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCSI_MINIPORT => 315400

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCSI_GET_INQUIRY_DATA => 266252

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCSI_GET_CAPABILITIES => 266256

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCSI_PASS_THROUGH_DIRECT => 315412

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCSI_GET_ADDRESS => 266264

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCSI_RESCAN_BUS => 266268

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCSI_GET_DUMP_POINTERS => 266272

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCSI_FREE_DUMP_POINTERS => 266276

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_IDE_PASS_THROUGH => 315432

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_ATA_PASS_THROUGH => 315436

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_ATA_PASS_THROUGH_DIRECT => 315440

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_ATA_MINIPORT => 315444

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_MINIPORT_PROCESS_SERVICE_IRP => 315448

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_MPIO_PASS_THROUGH_PATH => 315452

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_MPIO_PASS_THROUGH_PATH_DIRECT => 315456

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCSI_PASS_THROUGH_EX => 315460

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCSI_PASS_THROUGH_DIRECT_EX => 315464

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_MPIO_PASS_THROUGH_PATH_EX => 315468

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_MPIO_PASS_THROUGH_PATH_DIRECT_EX => 315472

    /**
     * @type {Integer (UInt32)}
     */
    static ATA_FLAGS_DRDY_REQUIRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ATA_FLAGS_DATA_IN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ATA_FLAGS_DATA_OUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ATA_FLAGS_48BIT_COMMAND => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ATA_FLAGS_USE_DMA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ATA_FLAGS_NO_MULTIPLE => 32

    /**
     * @type {String}
     */
    static IOCTL_MINIPORT_SIGNATURE_SCSIDISK => "SCSIDISK"

    /**
     * @type {String}
     */
    static IOCTL_MINIPORT_SIGNATURE_HYBRDISK => "HYBRDISK"

    /**
     * @type {String}
     */
    static IOCTL_MINIPORT_SIGNATURE_DSM_NOTIFICATION => "MPDSM   "

    /**
     * @type {String}
     */
    static IOCTL_MINIPORT_SIGNATURE_DSM_GENERAL => "MPDSMGEN"

    /**
     * @type {String}
     */
    static IOCTL_MINIPORT_SIGNATURE_FIRMWARE => "FIRMWARE"

    /**
     * @type {String}
     */
    static IOCTL_MINIPORT_SIGNATURE_QUERY_PROTOCOL => "PROTOCOL"

    /**
     * @type {String}
     */
    static IOCTL_MINIPORT_SIGNATURE_SET_PROTOCOL => "SETPROTO"

    /**
     * @type {String}
     */
    static IOCTL_MINIPORT_SIGNATURE_QUERY_TEMPERATURE => "TEMPERAT"

    /**
     * @type {String}
     */
    static IOCTL_MINIPORT_SIGNATURE_SET_TEMPERATURE_THRESHOLD => "SETTEMPT"

    /**
     * @type {String}
     */
    static IOCTL_MINIPORT_SIGNATURE_QUERY_PHYSICAL_TOPOLOGY => "TOPOLOGY"

    /**
     * @type {String}
     */
    static IOCTL_MINIPORT_SIGNATURE_ENDURANCE_INFO => "ENDURINF"

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_NVCACHE_INFO => 236

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_SPINDLE_STATUS => 229

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_NVCACHE_POWER_MODE_SET => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_NVCACHE_POWER_MODE_RETURN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_FLUSH_NVCACHE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_QUERY_PINNED_SET => 18

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_QUERY_CACHE_MISS => 19

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_ADD_LBAS_PINNED_SET => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_REMOVE_LBAS_PINNED_SET => 17

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_QUERY_ASCENDER_STATUS => 208

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_QUERY_HYBRID_DISK_STATUS => 209

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_PASS_HINT_PAYLOAD => 224

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_NVSEPARATED_INFO => 192

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_NVSEPARATED_FLUSH => 193

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_NVSEPARATED_WB_DISABLE => 194

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_FUNCTION_NVSEPARATED_WB_REVERT_DEFAULT => 195

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_ILLEGAL_REQUEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_INVALID_PARAMETER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_INPUT_DATA_OVERRUN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_INPUT_DATA_UNDERRUN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_OUTPUT_DATA_OVERRUN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NRB_OUTPUT_DATA_UNDERRUN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NV_SEP_CACHE_PARAMETER_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NV_SEP_CACHE_PARAMETER_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DIAGNOSTIC_STATUS_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DIAGNOSTIC_STATUS_BUFFER_TOO_SMALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DIAGNOSTIC_STATUS_UNSUPPORTED_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DIAGNOSTIC_STATUS_INVALID_PARAMETER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DIAGNOSTIC_STATUS_INVALID_SIGNATURE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DIAGNOSTIC_STATUS_INVALID_TARGET_TYPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DIAGNOSTIC_STATUS_MORE_DATA => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MINIPORT_DSM_NOTIFICATION_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MINIPORT_DSM_NOTIFICATION_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MINIPORT_DSM_PROFILE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MINIPORT_DSM_PROFILE_PAGE_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MINIPORT_DSM_PROFILE_HIBERNATION_FILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MINIPORT_DSM_PROFILE_CRASHDUMP_FILE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MINIPORT_DSM_NOTIFY_FLAG_BEGIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MINIPORT_DSM_NOTIFY_FLAG_END => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HYBRID_FUNCTION_GET_INFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HYBRID_FUNCTION_DISABLE_CACHING_MEDIUM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HYBRID_FUNCTION_ENABLE_CACHING_MEDIUM => 17

    /**
     * @type {Integer (UInt32)}
     */
    static HYBRID_FUNCTION_SET_DIRTY_THRESHOLD => 18

    /**
     * @type {Integer (UInt32)}
     */
    static HYBRID_FUNCTION_DEMOTE_BY_SIZE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static HYBRID_STATUS_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HYBRID_STATUS_ILLEGAL_REQUEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HYBRID_STATUS_INVALID_PARAMETER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HYBRID_STATUS_OUTPUT_BUFFER_TOO_SMALL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static HYBRID_STATUS_ENABLE_REFCOUNT_HOLD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HYBRID_REQUEST_BLOCK_STRUCTURE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HYBRID_REQUEST_INFO_STRUCTURE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_FUNCTION_GET_INFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_FUNCTION_DOWNLOAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_FUNCTION_ACTIVATE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_ILLEGAL_REQUEST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_INVALID_PARAMETER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_INPUT_BUFFER_TOO_BIG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_OUTPUT_BUFFER_TOO_SMALL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_INVALID_SLOT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_INVALID_IMAGE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_CONTROLLER_ERROR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_POWER_CYCLE_REQUIRED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_DEVICE_ERROR => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_INTERFACE_CRC_ERROR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_UNCORRECTABLE_DATA_ERROR => 129

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_MEDIA_CHANGE => 130

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_ID_NOT_FOUND => 131

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_MEDIA_CHANGE_REQUEST => 132

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_COMMAND_ABORT => 133

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_END_OF_MEDIA => 134

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_STATUS_ILLEGAL_LENGTH => 135

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_REQUEST_BLOCK_STRUCTURE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_REQUEST_FLAG_CONTROLLER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_REQUEST_FLAG_LAST_SEGMENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_REQUEST_FLAG_FIRST_SEGMENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_REQUEST_FLAG_SWITCH_TO_FIRMWARE_WITHOUT_RESET => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_REQUEST_FLAG_REPLACE_AND_SWITCH_UPON_RESET => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_REQUEST_FLAG_REPLACE_EXISTING_IMAGE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_REQUEST_FLAG_SWITCH_TO_EXISTING_FIRMWARE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_FIRMWARE_INFO_STRUCTURE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_FIRMWARE_INFO_STRUCTURE_VERSION_V2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_FIRMWARE_INFO_INVALID_SLOT => 255

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_FIRMWARE_SLOT_INFO_V2_REVISION_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_FIRMWARE_DOWNLOAD_STRUCTURE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_FIRMWARE_DOWNLOAD_STRUCTURE_VERSION_V2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_FIRMWARE_ACTIVATE_STRUCTURE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_POINTERS_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_POINTERS_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_POINTERS_VERSION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_POINTERS_VERSION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_DRIVER_NAME_LENGTH => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_EX_FLAG_SUPPORT_64BITMEMORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_EX_FLAG_SUPPORT_DD_TELEMETRY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_EX_FLAG_RESUME_SUPPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_EX_FLAG_DRIVER_FULL_PATH_SUPPORT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SCSI_IOCTL_DATA_OUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCSI_IOCTL_DATA_IN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCSI_IOCTL_DATA_UNSPECIFIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCSI_IOCTL_DATA_BIDIRECTIONAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MPIO_IOCTL_FLAG_USE_PATHID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPIO_IOCTL_FLAG_USE_SCSIADDRESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPIO_IOCTL_FLAG_INVOLVE_DSM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ISCSI_HBANAME_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ISCSI_NAME_LEN => 223

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ISCSI_ALIAS_LEN => 255

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ISCSI_PORTAL_NAME_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ISCSI_PORTAL_ALIAS_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ISCSI_TEXT_ADDRESS_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ISCSI_PORTAL_ADDRESS_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ISCSI_DISCOVERY_DOMAIN_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_RADIUS_ADDRESS_LEN => 41

    /**
     * @type {String}
     */
    static ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED => "0x00000040"

    /**
     * @type {String}
     */
    static ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED => "0x00000020"

    /**
     * @type {String}
     */
    static ISCSI_SECURITY_FLAG_PFS_ENABLED => "0x00000010"

    /**
     * @type {String}
     */
    static ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED => "0x00000008"

    /**
     * @type {String}
     */
    static ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED => "0x00000004"

    /**
     * @type {String}
     */
    static ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED => "0x00000002"

    /**
     * @type {String}
     */
    static ISCSI_SECURITY_FLAG_VALID => "0x00000001"

    /**
     * @type {String}
     */
    static ISCSI_LOGIN_OPTIONS_HEADER_DIGEST => "0x00000001"

    /**
     * @type {String}
     */
    static ISCSI_LOGIN_OPTIONS_DATA_DIGEST => "0x00000002"

    /**
     * @type {String}
     */
    static ISCSI_LOGIN_OPTIONS_MAXIMUM_CONNECTIONS => "0x00000004"

    /**
     * @type {String}
     */
    static ISCSI_LOGIN_OPTIONS_DEFAULT_TIME_2_WAIT => "0x00000008"

    /**
     * @type {String}
     */
    static ISCSI_LOGIN_OPTIONS_DEFAULT_TIME_2_RETAIN => "0x00000010"

    /**
     * @type {String}
     */
    static ISCSI_LOGIN_OPTIONS_USERNAME => "0x00000020"

    /**
     * @type {String}
     */
    static ISCSI_LOGIN_OPTIONS_PASSWORD => "0x00000040"

    /**
     * @type {String}
     */
    static ISCSI_LOGIN_OPTIONS_AUTH_TYPE => "0x00000080"

    /**
     * @type {String}
     */
    static ID_IPV4_ADDR => "1"

    /**
     * @type {String}
     */
    static ID_FQDN => "2"

    /**
     * @type {String}
     */
    static ID_USER_FQDN => "3"

    /**
     * @type {String}
     */
    static ID_IPV6_ADDR => "5"

    /**
     * @type {Integer (UInt32)}
     */
    static ISCSI_LOGIN_FLAG_REQUIRE_IPSEC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ISCSI_LOGIN_FLAG_MULTIPATH_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ISCSI_LOGIN_FLAG_RESERVED1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ISCSI_LOGIN_FLAG_ALLOW_PORTAL_HOPPING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ISCSI_LOGIN_FLAG_USE_RADIUS_RESPONSE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ISCSI_LOGIN_FLAG_USE_RADIUS_VERIFICATION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ISCSI_LOGIN_OPTIONS_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ISCSI_TARGET_FLAG_HIDE_STATIC_TARGET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ISCSI_TARGET_FLAG_MERGE_TARGET_INFORMATION => 4
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<ISCSI_VERSION_INFO>} VersionInfo 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static GetIScsiVersionInformation(VersionInfo) {
        result := DllCall("ISCSIDSC.dll\GetIScsiVersionInformation", "ptr", VersionInfo, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} TargetName 
     * @param {PWSTR} DiscoveryMechanism 
     * @param {Integer} InfoClass 
     * @param {Pointer<UInt32>} BufferSize 
     * @param {Pointer<Void>} Buffer 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static GetIScsiTargetInformationW(TargetName, DiscoveryMechanism, InfoClass, BufferSize, Buffer) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName
        DiscoveryMechanism := DiscoveryMechanism is String ? StrPtr(DiscoveryMechanism) : DiscoveryMechanism

        result := DllCall("ISCSIDSC.dll\GetIScsiTargetInformationW", "ptr", TargetName, "ptr", DiscoveryMechanism, "int", InfoClass, "uint*", BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} TargetName 
     * @param {PSTR} DiscoveryMechanism 
     * @param {Integer} InfoClass 
     * @param {Pointer<UInt32>} BufferSize 
     * @param {Pointer<Void>} Buffer 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static GetIScsiTargetInformationA(TargetName, DiscoveryMechanism, InfoClass, BufferSize, Buffer) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName
        DiscoveryMechanism := DiscoveryMechanism is String ? StrPtr(DiscoveryMechanism) : DiscoveryMechanism

        result := DllCall("ISCSIDSC.dll\GetIScsiTargetInformationA", "ptr", TargetName, "ptr", DiscoveryMechanism, "int", InfoClass, "uint*", BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId 
     * @param {Pointer<Void>} Reserved 
     * @param {Integer} InitiatorPortNumber 
     * @param {Pointer<ISCSI_TARGET_PORTALW>} TargetPortal 
     * @param {Integer} SecurityFlags 
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions 
     * @param {Integer} KeySize 
     * @param {PSTR} Key 
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} ConnectionId 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static AddIScsiConnectionW(UniqueSessionId, Reserved, InitiatorPortNumber, TargetPortal, SecurityFlags, LoginOptions, KeySize, Key, ConnectionId) {
        Key := Key is String ? StrPtr(Key) : Key

        result := DllCall("ISCSIDSC.dll\AddIScsiConnectionW", "ptr", UniqueSessionId, "ptr", Reserved, "uint", InitiatorPortNumber, "ptr", TargetPortal, "uint", SecurityFlags, "ptr", LoginOptions, "uint", KeySize, "ptr", Key, "ptr", ConnectionId, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId 
     * @param {Pointer<Void>} Reserved 
     * @param {Integer} InitiatorPortNumber 
     * @param {Pointer<ISCSI_TARGET_PORTALA>} TargetPortal 
     * @param {Integer} SecurityFlags 
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions 
     * @param {Integer} KeySize 
     * @param {PSTR} Key 
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} ConnectionId 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static AddIScsiConnectionA(UniqueSessionId, Reserved, InitiatorPortNumber, TargetPortal, SecurityFlags, LoginOptions, KeySize, Key, ConnectionId) {
        Key := Key is String ? StrPtr(Key) : Key

        result := DllCall("ISCSIDSC.dll\AddIScsiConnectionA", "ptr", UniqueSessionId, "ptr", Reserved, "uint", InitiatorPortNumber, "ptr", TargetPortal, "uint", SecurityFlags, "ptr", LoginOptions, "uint", KeySize, "ptr", Key, "ptr", ConnectionId, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId 
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} ConnectionId 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RemoveIScsiConnection(UniqueSessionId, ConnectionId) {
        result := DllCall("ISCSIDSC.dll\RemoveIScsiConnection", "ptr", UniqueSessionId, "ptr", ConnectionId, "uint")
        return result
    }

    /**
     * 
     * @param {BOOLEAN} ForceUpdate 
     * @param {Pointer<UInt32>} BufferSize 
     * @param {PWSTR} Buffer 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportIScsiTargetsW(ForceUpdate, BufferSize, Buffer) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := DllCall("ISCSIDSC.dll\ReportIScsiTargetsW", "char", ForceUpdate, "uint*", BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * 
     * @param {BOOLEAN} ForceUpdate 
     * @param {Pointer<UInt32>} BufferSize 
     * @param {PSTR} Buffer 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportIScsiTargetsA(ForceUpdate, BufferSize, Buffer) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := DllCall("ISCSIDSC.dll\ReportIScsiTargetsA", "char", ForceUpdate, "uint*", BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} TargetName 
     * @param {PWSTR} TargetAlias 
     * @param {Integer} TargetFlags 
     * @param {BOOLEAN} Persist 
     * @param {Pointer<ISCSI_TARGET_MAPPINGW>} Mappings 
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions 
     * @param {Pointer<ISCSI_TARGET_PORTAL_GROUPW>} PortalGroup 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static AddIScsiStaticTargetW(TargetName, TargetAlias, TargetFlags, Persist, Mappings, LoginOptions, PortalGroup) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName
        TargetAlias := TargetAlias is String ? StrPtr(TargetAlias) : TargetAlias

        result := DllCall("ISCSIDSC.dll\AddIScsiStaticTargetW", "ptr", TargetName, "ptr", TargetAlias, "uint", TargetFlags, "char", Persist, "ptr", Mappings, "ptr", LoginOptions, "ptr", PortalGroup, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} TargetName 
     * @param {PSTR} TargetAlias 
     * @param {Integer} TargetFlags 
     * @param {BOOLEAN} Persist 
     * @param {Pointer<ISCSI_TARGET_MAPPINGA>} Mappings 
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions 
     * @param {Pointer<ISCSI_TARGET_PORTAL_GROUPA>} PortalGroup 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static AddIScsiStaticTargetA(TargetName, TargetAlias, TargetFlags, Persist, Mappings, LoginOptions, PortalGroup) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName
        TargetAlias := TargetAlias is String ? StrPtr(TargetAlias) : TargetAlias

        result := DllCall("ISCSIDSC.dll\AddIScsiStaticTargetA", "ptr", TargetName, "ptr", TargetAlias, "uint", TargetFlags, "char", Persist, "ptr", Mappings, "ptr", LoginOptions, "ptr", PortalGroup, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} TargetName 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RemoveIScsiStaticTargetW(TargetName) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        result := DllCall("ISCSIDSC.dll\RemoveIScsiStaticTargetW", "ptr", TargetName, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} TargetName 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RemoveIScsiStaticTargetA(TargetName) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        result := DllCall("ISCSIDSC.dll\RemoveIScsiStaticTargetA", "ptr", TargetName, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} InitiatorInstance 
     * @param {Integer} InitiatorPortNumber 
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions 
     * @param {Integer} SecurityFlags 
     * @param {Pointer<ISCSI_TARGET_PORTALW>} Portal 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static AddIScsiSendTargetPortalW(InitiatorInstance, InitiatorPortNumber, LoginOptions, SecurityFlags, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance

        result := DllCall("ISCSIDSC.dll\AddIScsiSendTargetPortalW", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", LoginOptions, "uint", SecurityFlags, "ptr", Portal, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} InitiatorInstance 
     * @param {Integer} InitiatorPortNumber 
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions 
     * @param {Integer} SecurityFlags 
     * @param {Pointer<ISCSI_TARGET_PORTALA>} Portal 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static AddIScsiSendTargetPortalA(InitiatorInstance, InitiatorPortNumber, LoginOptions, SecurityFlags, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance

        result := DllCall("ISCSIDSC.dll\AddIScsiSendTargetPortalA", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", LoginOptions, "uint", SecurityFlags, "ptr", Portal, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} InitiatorInstance 
     * @param {Integer} InitiatorPortNumber 
     * @param {Pointer<ISCSI_TARGET_PORTALW>} Portal 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RemoveIScsiSendTargetPortalW(InitiatorInstance, InitiatorPortNumber, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance

        result := DllCall("ISCSIDSC.dll\RemoveIScsiSendTargetPortalW", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", Portal, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} InitiatorInstance 
     * @param {Integer} InitiatorPortNumber 
     * @param {Pointer<ISCSI_TARGET_PORTALA>} Portal 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RemoveIScsiSendTargetPortalA(InitiatorInstance, InitiatorPortNumber, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance

        result := DllCall("ISCSIDSC.dll\RemoveIScsiSendTargetPortalA", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", Portal, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} InitiatorInstance 
     * @param {Integer} InitiatorPortNumber 
     * @param {Pointer<ISCSI_TARGET_PORTALW>} Portal 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RefreshIScsiSendTargetPortalW(InitiatorInstance, InitiatorPortNumber, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance

        result := DllCall("ISCSIDSC.dll\RefreshIScsiSendTargetPortalW", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", Portal, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} InitiatorInstance 
     * @param {Integer} InitiatorPortNumber 
     * @param {Pointer<ISCSI_TARGET_PORTALA>} Portal 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RefreshIScsiSendTargetPortalA(InitiatorInstance, InitiatorPortNumber, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance

        result := DllCall("ISCSIDSC.dll\RefreshIScsiSendTargetPortalA", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", Portal, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} PortalCount 
     * @param {Pointer<ISCSI_TARGET_PORTAL_INFOW>} PortalInfo 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportIScsiSendTargetPortalsW(PortalCount, PortalInfo) {
        result := DllCall("ISCSIDSC.dll\ReportIScsiSendTargetPortalsW", "uint*", PortalCount, "ptr", PortalInfo, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} PortalCount 
     * @param {Pointer<ISCSI_TARGET_PORTAL_INFOA>} PortalInfo 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportIScsiSendTargetPortalsA(PortalCount, PortalInfo) {
        result := DllCall("ISCSIDSC.dll\ReportIScsiSendTargetPortalsA", "uint*", PortalCount, "ptr", PortalInfo, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} PortalCount 
     * @param {Pointer<UInt32>} PortalInfoSize 
     * @param {Pointer<ISCSI_TARGET_PORTAL_INFO_EXW>} PortalInfo 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportIScsiSendTargetPortalsExW(PortalCount, PortalInfoSize, PortalInfo) {
        result := DllCall("ISCSIDSC.dll\ReportIScsiSendTargetPortalsExW", "uint*", PortalCount, "uint*", PortalInfoSize, "ptr", PortalInfo, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} PortalCount 
     * @param {Pointer<UInt32>} PortalInfoSize 
     * @param {Pointer<ISCSI_TARGET_PORTAL_INFO_EXA>} PortalInfo 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportIScsiSendTargetPortalsExA(PortalCount, PortalInfoSize, PortalInfo) {
        result := DllCall("ISCSIDSC.dll\ReportIScsiSendTargetPortalsExA", "uint*", PortalCount, "uint*", PortalInfoSize, "ptr", PortalInfo, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} TargetName 
     * @param {BOOLEAN} IsInformationalSession 
     * @param {PWSTR} InitiatorInstance 
     * @param {Integer} InitiatorPortNumber 
     * @param {Pointer<ISCSI_TARGET_PORTALW>} TargetPortal 
     * @param {Integer} SecurityFlags 
     * @param {Pointer<ISCSI_TARGET_MAPPINGW>} Mappings 
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions 
     * @param {Integer} KeySize 
     * @param {PSTR} Key 
     * @param {BOOLEAN} IsPersistent 
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId 
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueConnectionId 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static LoginIScsiTargetW(TargetName, IsInformationalSession, InitiatorInstance, InitiatorPortNumber, TargetPortal, SecurityFlags, Mappings, LoginOptions, KeySize, Key, IsPersistent, UniqueSessionId, UniqueConnectionId) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance
        Key := Key is String ? StrPtr(Key) : Key

        result := DllCall("ISCSIDSC.dll\LoginIScsiTargetW", "ptr", TargetName, "char", IsInformationalSession, "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", TargetPortal, "uint", SecurityFlags, "ptr", Mappings, "ptr", LoginOptions, "uint", KeySize, "ptr", Key, "char", IsPersistent, "ptr", UniqueSessionId, "ptr", UniqueConnectionId, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} TargetName 
     * @param {BOOLEAN} IsInformationalSession 
     * @param {PSTR} InitiatorInstance 
     * @param {Integer} InitiatorPortNumber 
     * @param {Pointer<ISCSI_TARGET_PORTALA>} TargetPortal 
     * @param {Integer} SecurityFlags 
     * @param {Pointer<ISCSI_TARGET_MAPPINGA>} Mappings 
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions 
     * @param {Integer} KeySize 
     * @param {PSTR} Key 
     * @param {BOOLEAN} IsPersistent 
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId 
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueConnectionId 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static LoginIScsiTargetA(TargetName, IsInformationalSession, InitiatorInstance, InitiatorPortNumber, TargetPortal, SecurityFlags, Mappings, LoginOptions, KeySize, Key, IsPersistent, UniqueSessionId, UniqueConnectionId) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance
        Key := Key is String ? StrPtr(Key) : Key

        result := DllCall("ISCSIDSC.dll\LoginIScsiTargetA", "ptr", TargetName, "char", IsInformationalSession, "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", TargetPortal, "uint", SecurityFlags, "ptr", Mappings, "ptr", LoginOptions, "uint", KeySize, "ptr", Key, "char", IsPersistent, "ptr", UniqueSessionId, "ptr", UniqueConnectionId, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Count 
     * @param {Pointer<PERSISTENT_ISCSI_LOGIN_INFOW>} PersistentLoginInfo 
     * @param {Pointer<UInt32>} BufferSizeInBytes 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportIScsiPersistentLoginsW(Count, PersistentLoginInfo, BufferSizeInBytes) {
        result := DllCall("ISCSIDSC.dll\ReportIScsiPersistentLoginsW", "uint*", Count, "ptr", PersistentLoginInfo, "uint*", BufferSizeInBytes, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Count 
     * @param {Pointer<PERSISTENT_ISCSI_LOGIN_INFOA>} PersistentLoginInfo 
     * @param {Pointer<UInt32>} BufferSizeInBytes 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportIScsiPersistentLoginsA(Count, PersistentLoginInfo, BufferSizeInBytes) {
        result := DllCall("ISCSIDSC.dll\ReportIScsiPersistentLoginsA", "uint*", Count, "ptr", PersistentLoginInfo, "uint*", BufferSizeInBytes, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static LogoutIScsiTarget(UniqueSessionId) {
        result := DllCall("ISCSIDSC.dll\LogoutIScsiTarget", "ptr", UniqueSessionId, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} InitiatorInstance 
     * @param {Integer} InitiatorPortNumber 
     * @param {PWSTR} TargetName 
     * @param {Pointer<ISCSI_TARGET_PORTALW>} Portal 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RemoveIScsiPersistentTargetW(InitiatorInstance, InitiatorPortNumber, TargetName, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        result := DllCall("ISCSIDSC.dll\RemoveIScsiPersistentTargetW", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", TargetName, "ptr", Portal, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} InitiatorInstance 
     * @param {Integer} InitiatorPortNumber 
     * @param {PSTR} TargetName 
     * @param {Pointer<ISCSI_TARGET_PORTALA>} Portal 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RemoveIScsiPersistentTargetA(InitiatorInstance, InitiatorPortNumber, TargetName, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        result := DllCall("ISCSIDSC.dll\RemoveIScsiPersistentTargetA", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", TargetName, "ptr", Portal, "uint")
        return result
    }

    /**
     * SendScsiInquiry function sends a SCSI INQUIRY command to the specified target.
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> structure containing the session identifier for the login session specific to the target to which the READ CAPACITY command is sent.
     * @param {Integer} Lun The logical unit to query for SCSI inquiry data.
     * @param {Integer} EvpdCmddt The values to assign to the EVP (enable the vital product data) and CmdDt (command support data) bits in the INQUIRY command. Bits 0 (EVP) and 1 (CmdDt) of the <i>EvpdCmddt</i> parameter 
     * are inserted into bits 0 and 1, respectively, of the second byte of the Command Descriptor Block (CDB) of the <b>INQUIRY</b> command.
     * @param {Integer} PageCode The page code. This code is inserted into the third byte of the CDB of the <b>INQUIRY</b> command.
     * @param {Pointer<Byte>} ScsiStatus A pointer to a location that reports the execution status of the CDB.
     * @param {Pointer<UInt32>} ResponseSize A pointer to the location that, on input, specifies the byte-size of  <i>ResponseBuffer</i>. On output, this location specifies the number of bytes required to contain the response data for the READ CAPACITY command in the <i>ResponseBuffer</i>.
     * @param {Pointer<Byte>} ResponseBuffer The buffer that holds the inquiry data.
     * @param {Pointer<UInt32>} SenseSize A pointer to a location that, on input, contains the byte-size of <i>SenseBuffer</i>. On output, the location pointed to receives the byte-size required for  <i>SenseBuffer</i>  to contain the sense data. This value will always be greater than or equal to 18 bytes.
     * @param {Pointer<Byte>} SenseBuffer The buffer that holds the sense data.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer specified by <i>ResponseBuffer</i> is insufficient to contain the sense data.
     * 
     * 
     * 
     * If the device returns a SCSI error while processing the REPORT LUNS request, <a href="/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-sendscsireportluns">SendScsiReportLuns</a> returns an error code of ISDSC_SCSI_REQUEST_FAILED, and the locations pointed to by <i>ScsiStatus</i> and <i>SenseBuffer</i> contain information detailing the SCSI error.
     * 
     *  
     * 
     * Otherwise, <b>SendScsiInquiry</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/nf-iscsidsc-sendscsiinquiry
     * @since windows6.0.6000
     */
    static SendScsiInquiry(UniqueSessionId, Lun, EvpdCmddt, PageCode, ScsiStatus, ResponseSize, ResponseBuffer, SenseSize, SenseBuffer) {
        result := DllCall("ISCSIDSC.dll\SendScsiInquiry", "ptr", UniqueSessionId, "uint", Lun, "char", EvpdCmddt, "char", PageCode, "char*", ScsiStatus, "uint*", ResponseSize, "char*", ResponseBuffer, "uint*", SenseSize, "char*", SenseBuffer, "uint")
        return result
    }

    /**
     * SendScsiReadCapacity function sends a SCSI READ CAPACITY command to the indicated target.
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> structure containing the session identifier for the login session specific to the target to which the READ CAPACITY command is sent.
     * @param {Integer} Lun The logical unit on the target to query with the READ CAPACITY command.
     * @param {Pointer<Byte>} ScsiStatus A pointer to a location that contains the execution status of the CDB.
     * @param {Pointer<UInt32>} ResponseSize A pointer to the location that, on input, specifies the byte-size of  <i>ResponseBuffer</i>. On output, this location specifies the number of bytes required to contain the response data for the READ CAPACITY command in the <i>ResponseBuffer</i>.
     * @param {Pointer<Byte>} ResponseBuffer The buffer that receives the response data from the READ CAPACITY command.
     * @param {Pointer<UInt32>} SenseSize A pointer to a location that, on input, contains the byte-size of <i>SenseBuffer</i>. On output, the location pointed to receives the byte-size required for  <i>SenseBuffer</i>  to contain the sense data. This value will always be greater than or equal to 18 bytes.
     * @param {Pointer<Byte>} SenseBuffer The buffer that receives the sense data.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer specified by <i>ResponseBuffer</i> is insufficient to contain the sense data.
     * 
     * 
     * 
     * If the device returns a SCSI error while processing the REPORT LUNS request, <a href="/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-sendscsireportluns">SendScsiReportLuns</a> returns an error code of ISDSC_SCSI_REQUEST_FAILED, and the locations pointed to by <i>ScsiStatus</i> and <i>SenseBuffer</i> contain information detailing the SCSI error.
     * 
     *  
     * 
     * Otherwise, this function returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/nf-iscsidsc-sendscsireadcapacity
     * @since windows6.0.6000
     */
    static SendScsiReadCapacity(UniqueSessionId, Lun, ScsiStatus, ResponseSize, ResponseBuffer, SenseSize, SenseBuffer) {
        result := DllCall("ISCSIDSC.dll\SendScsiReadCapacity", "ptr", UniqueSessionId, "uint", Lun, "char*", ScsiStatus, "uint*", ResponseSize, "char*", ResponseBuffer, "uint*", SenseSize, "char*", SenseBuffer, "uint")
        return result
    }

    /**
     * SendScsiReportLuns function sends a SCSI REPORT LUNS command to a specified target.
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> structure that contains the session identifier for the login session of the target to query with the SCSI REPORT LUNS command.
     * @param {Pointer<Byte>} ScsiStatus A pointer to the location that receives the execution status of the CDB.
     * @param {Pointer<UInt32>} ResponseSize A pointer to the location that, on input, specifies the byte-size of  <i>ResponseBuffer</i>. On output, this location specifies the number of bytes required to contain the response data for the READ CAPACITY command in the <i>ResponseBuffer</i>.
     * @param {Pointer<Byte>} ResponseBuffer The buffer that receives  response data for the READ CAPACITY command.
     * @param {Pointer<UInt32>} SenseSize A pointer to a location that, on input, contains the byte-size of <i>SenseBuffer</i>. On output, the location pointed to receives the byte-size required for  <i>SenseBuffer</i>  to contain the sense data. This value will always be greater than or equal to 18 bytes.
     * @param {Pointer<Byte>} SenseBuffer The buffer that receives the sense data.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer specified by <i>ResponseBuffer</i> is insufficient to hold the sense data.
     * 
     * 
     * 
     * If the device returns a SCSI error while processing the REPORT LUNS request, <b>SendScsiReportLuns</b> returns an error code of ISDSC_SCSI_REQUEST_FAILED, and the locations pointed to by <i>ScsiStatus</i> and <i>SenseBuffer</i> contain information detailing the SCSI error.
     * 
     *  
     * 
     * Otherwise, this function returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/nf-iscsidsc-sendscsireportluns
     * @since windows6.0.6000
     */
    static SendScsiReportLuns(UniqueSessionId, ScsiStatus, ResponseSize, ResponseBuffer, SenseSize, SenseBuffer) {
        result := DllCall("ISCSIDSC.dll\SendScsiReportLuns", "ptr", UniqueSessionId, "char*", ScsiStatus, "uint*", ResponseSize, "char*", ResponseBuffer, "uint*", SenseSize, "char*", SenseBuffer, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} BufferSize 
     * @param {PWSTR} Buffer 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportIScsiInitiatorListW(BufferSize, Buffer) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := DllCall("ISCSIDSC.dll\ReportIScsiInitiatorListW", "uint*", BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} BufferSize 
     * @param {PSTR} Buffer 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportIScsiInitiatorListA(BufferSize, Buffer) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := DllCall("ISCSIDSC.dll\ReportIScsiInitiatorListA", "uint*", BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} BufferSize 
     * @param {Pointer<UInt32>} MappingCount 
     * @param {Pointer<ISCSI_TARGET_MAPPINGW>} Mappings 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportActiveIScsiTargetMappingsW(BufferSize, MappingCount, Mappings) {
        result := DllCall("ISCSIDSC.dll\ReportActiveIScsiTargetMappingsW", "uint*", BufferSize, "uint*", MappingCount, "ptr", Mappings, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} BufferSize 
     * @param {Pointer<UInt32>} MappingCount 
     * @param {Pointer<ISCSI_TARGET_MAPPINGA>} Mappings 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportActiveIScsiTargetMappingsA(BufferSize, MappingCount, Mappings) {
        result := DllCall("ISCSIDSC.dll\ReportActiveIScsiTargetMappingsA", "uint*", BufferSize, "uint*", MappingCount, "ptr", Mappings, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} InitiatorName 
     * @param {Integer} InitiatorPortNumber 
     * @param {PWSTR} DestinationAddress 
     * @param {PWSTR} OuterModeAddress 
     * @param {BOOLEAN} Persist 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static SetIScsiTunnelModeOuterAddressW(InitiatorName, InitiatorPortNumber, DestinationAddress, OuterModeAddress, Persist) {
        InitiatorName := InitiatorName is String ? StrPtr(InitiatorName) : InitiatorName
        DestinationAddress := DestinationAddress is String ? StrPtr(DestinationAddress) : DestinationAddress
        OuterModeAddress := OuterModeAddress is String ? StrPtr(OuterModeAddress) : OuterModeAddress

        result := DllCall("ISCSIDSC.dll\SetIScsiTunnelModeOuterAddressW", "ptr", InitiatorName, "uint", InitiatorPortNumber, "ptr", DestinationAddress, "ptr", OuterModeAddress, "char", Persist, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} InitiatorName 
     * @param {Integer} InitiatorPortNumber 
     * @param {PSTR} DestinationAddress 
     * @param {PSTR} OuterModeAddress 
     * @param {BOOLEAN} Persist 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static SetIScsiTunnelModeOuterAddressA(InitiatorName, InitiatorPortNumber, DestinationAddress, OuterModeAddress, Persist) {
        InitiatorName := InitiatorName is String ? StrPtr(InitiatorName) : InitiatorName
        DestinationAddress := DestinationAddress is String ? StrPtr(DestinationAddress) : DestinationAddress
        OuterModeAddress := OuterModeAddress is String ? StrPtr(OuterModeAddress) : OuterModeAddress

        result := DllCall("ISCSIDSC.dll\SetIScsiTunnelModeOuterAddressA", "ptr", InitiatorName, "uint", InitiatorPortNumber, "ptr", DestinationAddress, "ptr", OuterModeAddress, "char", Persist, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} InitiatorName 
     * @param {Integer} InitiatorPortNumber 
     * @param {Pointer<IKE_AUTHENTICATION_INFORMATION>} AuthInfo 
     * @param {BOOLEAN} Persist 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static SetIScsiIKEInfoW(InitiatorName, InitiatorPortNumber, AuthInfo, Persist) {
        InitiatorName := InitiatorName is String ? StrPtr(InitiatorName) : InitiatorName

        result := DllCall("ISCSIDSC.dll\SetIScsiIKEInfoW", "ptr", InitiatorName, "uint", InitiatorPortNumber, "ptr", AuthInfo, "char", Persist, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} InitiatorName 
     * @param {Integer} InitiatorPortNumber 
     * @param {Pointer<IKE_AUTHENTICATION_INFORMATION>} AuthInfo 
     * @param {BOOLEAN} Persist 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static SetIScsiIKEInfoA(InitiatorName, InitiatorPortNumber, AuthInfo, Persist) {
        InitiatorName := InitiatorName is String ? StrPtr(InitiatorName) : InitiatorName

        result := DllCall("ISCSIDSC.dll\SetIScsiIKEInfoA", "ptr", InitiatorName, "uint", InitiatorPortNumber, "ptr", AuthInfo, "char", Persist, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} InitiatorName 
     * @param {Integer} InitiatorPortNumber 
     * @param {Pointer<UInt32>} Reserved 
     * @param {Pointer<IKE_AUTHENTICATION_INFORMATION>} AuthInfo 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static GetIScsiIKEInfoW(InitiatorName, InitiatorPortNumber, Reserved, AuthInfo) {
        InitiatorName := InitiatorName is String ? StrPtr(InitiatorName) : InitiatorName

        result := DllCall("ISCSIDSC.dll\GetIScsiIKEInfoW", "ptr", InitiatorName, "uint", InitiatorPortNumber, "uint*", Reserved, "ptr", AuthInfo, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} InitiatorName 
     * @param {Integer} InitiatorPortNumber 
     * @param {Pointer<UInt32>} Reserved 
     * @param {Pointer<IKE_AUTHENTICATION_INFORMATION>} AuthInfo 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static GetIScsiIKEInfoA(InitiatorName, InitiatorPortNumber, Reserved, AuthInfo) {
        InitiatorName := InitiatorName is String ? StrPtr(InitiatorName) : InitiatorName

        result := DllCall("ISCSIDSC.dll\GetIScsiIKEInfoA", "ptr", InitiatorName, "uint", InitiatorPortNumber, "uint*", Reserved, "ptr", AuthInfo, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} KeyLength 
     * @param {Pointer<Byte>} Key 
     * @param {BOOLEAN} Persist 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static SetIScsiGroupPresharedKey(KeyLength, Key, Persist) {
        result := DllCall("ISCSIDSC.dll\SetIScsiGroupPresharedKey", "uint", KeyLength, "char*", Key, "char", Persist, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} SharedSecretLength 
     * @param {Pointer<Byte>} SharedSecret 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static SetIScsiInitiatorCHAPSharedSecret(SharedSecretLength, SharedSecret) {
        result := DllCall("ISCSIDSC.dll\SetIScsiInitiatorCHAPSharedSecret", "uint", SharedSecretLength, "char*", SharedSecret, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} SharedSecretLength 
     * @param {Pointer<Byte>} SharedSecret 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static SetIScsiInitiatorRADIUSSharedSecret(SharedSecretLength, SharedSecret) {
        result := DllCall("ISCSIDSC.dll\SetIScsiInitiatorRADIUSSharedSecret", "uint", SharedSecretLength, "char*", SharedSecret, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} InitiatorNodeName 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static SetIScsiInitiatorNodeNameW(InitiatorNodeName) {
        InitiatorNodeName := InitiatorNodeName is String ? StrPtr(InitiatorNodeName) : InitiatorNodeName

        result := DllCall("ISCSIDSC.dll\SetIScsiInitiatorNodeNameW", "ptr", InitiatorNodeName, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} InitiatorNodeName 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static SetIScsiInitiatorNodeNameA(InitiatorNodeName) {
        InitiatorNodeName := InitiatorNodeName is String ? StrPtr(InitiatorNodeName) : InitiatorNodeName

        result := DllCall("ISCSIDSC.dll\SetIScsiInitiatorNodeNameA", "ptr", InitiatorNodeName, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} InitiatorNodeName 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static GetIScsiInitiatorNodeNameW(InitiatorNodeName) {
        InitiatorNodeName := InitiatorNodeName is String ? StrPtr(InitiatorNodeName) : InitiatorNodeName

        result := DllCall("ISCSIDSC.dll\GetIScsiInitiatorNodeNameW", "ptr", InitiatorNodeName, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} InitiatorNodeName 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static GetIScsiInitiatorNodeNameA(InitiatorNodeName) {
        InitiatorNodeName := InitiatorNodeName is String ? StrPtr(InitiatorNodeName) : InitiatorNodeName

        result := DllCall("ISCSIDSC.dll\GetIScsiInitiatorNodeNameA", "ptr", InitiatorNodeName, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} Address 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static AddISNSServerW(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\AddISNSServerW", "ptr", Address, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} Address 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static AddISNSServerA(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\AddISNSServerA", "ptr", Address, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} Address 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RemoveISNSServerW(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\RemoveISNSServerW", "ptr", Address, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} Address 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RemoveISNSServerA(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\RemoveISNSServerA", "ptr", Address, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} Address 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RefreshISNSServerW(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\RefreshISNSServerW", "ptr", Address, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} Address 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RefreshISNSServerA(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\RefreshISNSServerA", "ptr", Address, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} BufferSizeInChar 
     * @param {PWSTR} Buffer 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportISNSServerListW(BufferSizeInChar, Buffer) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := DllCall("ISCSIDSC.dll\ReportISNSServerListW", "uint*", BufferSizeInChar, "ptr", Buffer, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} BufferSizeInChar 
     * @param {PSTR} Buffer 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportISNSServerListA(BufferSizeInChar, Buffer) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := DllCall("ISCSIDSC.dll\ReportISNSServerListA", "uint*", BufferSizeInChar, "ptr", Buffer, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} BufferSize 
     * @param {Pointer<UInt32>} SessionCount 
     * @param {Pointer<ISCSI_SESSION_INFOW>} SessionInfo 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static GetIScsiSessionListW(BufferSize, SessionCount, SessionInfo) {
        result := DllCall("ISCSIDSC.dll\GetIScsiSessionListW", "uint*", BufferSize, "uint*", SessionCount, "ptr", SessionInfo, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} BufferSize 
     * @param {Pointer<UInt32>} SessionCount 
     * @param {Pointer<ISCSI_SESSION_INFOA>} SessionInfo 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static GetIScsiSessionListA(BufferSize, SessionCount, SessionInfo) {
        result := DllCall("ISCSIDSC.dll\GetIScsiSessionListA", "uint*", BufferSize, "uint*", SessionCount, "ptr", SessionInfo, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} BufferSize 
     * @param {Pointer<UInt32>} SessionCountPtr 
     * @param {Pointer<ISCSI_SESSION_INFO_EX>} SessionInfo 
     * @returns {Integer} 
     */
    static GetIScsiSessionListEx(BufferSize, SessionCountPtr, SessionInfo) {
        result := DllCall("ISCSIDSC.dll\GetIScsiSessionListEx", "uint*", BufferSize, "uint*", SessionCountPtr, "ptr", SessionInfo, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId 
     * @param {Pointer<UInt32>} DeviceCount 
     * @param {Pointer<ISCSI_DEVICE_ON_SESSIONW>} Devices 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static GetDevicesForIScsiSessionW(UniqueSessionId, DeviceCount, Devices) {
        result := DllCall("ISCSIDSC.dll\GetDevicesForIScsiSessionW", "ptr", UniqueSessionId, "uint*", DeviceCount, "ptr", Devices, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId 
     * @param {Pointer<UInt32>} DeviceCount 
     * @param {Pointer<ISCSI_DEVICE_ON_SESSIONA>} Devices 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static GetDevicesForIScsiSessionA(UniqueSessionId, DeviceCount, Devices) {
        result := DllCall("ISCSIDSC.dll\GetDevicesForIScsiSessionA", "ptr", UniqueSessionId, "uint*", DeviceCount, "ptr", Devices, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static SetupPersistentIScsiVolumes() {
        result := DllCall("ISCSIDSC.dll\SetupPersistentIScsiVolumes", "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static SetupPersistentIScsiDevices() {
        result := DllCall("ISCSIDSC.dll\SetupPersistentIScsiDevices", "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} DevicePath 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static AddPersistentIScsiDeviceW(DevicePath) {
        DevicePath := DevicePath is String ? StrPtr(DevicePath) : DevicePath

        result := DllCall("ISCSIDSC.dll\AddPersistentIScsiDeviceW", "ptr", DevicePath, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} DevicePath 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static AddPersistentIScsiDeviceA(DevicePath) {
        DevicePath := DevicePath is String ? StrPtr(DevicePath) : DevicePath

        result := DllCall("ISCSIDSC.dll\AddPersistentIScsiDeviceA", "ptr", DevicePath, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} DevicePath 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RemovePersistentIScsiDeviceW(DevicePath) {
        DevicePath := DevicePath is String ? StrPtr(DevicePath) : DevicePath

        result := DllCall("ISCSIDSC.dll\RemovePersistentIScsiDeviceW", "ptr", DevicePath, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} DevicePath 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static RemovePersistentIScsiDeviceA(DevicePath) {
        DevicePath := DevicePath is String ? StrPtr(DevicePath) : DevicePath

        result := DllCall("ISCSIDSC.dll\RemovePersistentIScsiDeviceA", "ptr", DevicePath, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ClearPersistentIScsiDevices() {
        result := DllCall("ISCSIDSC.dll\ClearPersistentIScsiDevices", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} BufferSizeInChar 
     * @param {PWSTR} Buffer 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportPersistentIScsiDevicesW(BufferSizeInChar, Buffer) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := DllCall("ISCSIDSC.dll\ReportPersistentIScsiDevicesW", "uint*", BufferSizeInChar, "ptr", Buffer, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} BufferSizeInChar 
     * @param {PSTR} Buffer 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportPersistentIScsiDevicesA(BufferSizeInChar, Buffer) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := DllCall("ISCSIDSC.dll\ReportPersistentIScsiDevicesA", "uint*", BufferSizeInChar, "ptr", Buffer, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} InitiatorName 
     * @param {PWSTR} TargetName 
     * @param {Pointer<UInt16>} TargetPortalTag 
     * @param {Pointer<UInt32>} ElementCount 
     * @param {Pointer<ISCSI_TARGET_PORTALW>} Portals 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportIScsiTargetPortalsW(InitiatorName, TargetName, TargetPortalTag, ElementCount, Portals) {
        InitiatorName := InitiatorName is String ? StrPtr(InitiatorName) : InitiatorName
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        result := DllCall("ISCSIDSC.dll\ReportIScsiTargetPortalsW", "ptr", InitiatorName, "ptr", TargetName, "ushort*", TargetPortalTag, "uint*", ElementCount, "ptr", Portals, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} InitiatorName 
     * @param {PSTR} TargetName 
     * @param {Pointer<UInt16>} TargetPortalTag 
     * @param {Pointer<UInt32>} ElementCount 
     * @param {Pointer<ISCSI_TARGET_PORTALA>} Portals 
     * @returns {Integer} 
     * @since windows6.0.6000
     */
    static ReportIScsiTargetPortalsA(InitiatorName, TargetName, TargetPortalTag, ElementCount, Portals) {
        InitiatorName := InitiatorName is String ? StrPtr(InitiatorName) : InitiatorName
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        result := DllCall("ISCSIDSC.dll\ReportIScsiTargetPortalsA", "ptr", InitiatorName, "ptr", TargetName, "ushort*", TargetPortalTag, "uint*", ElementCount, "ptr", Portals, "uint")
        return result
    }

    /**
     * AddRadiusServer.
     * @param {PWSTR} Address A string that represents the IP address or DNS name associated with the RADIUS server.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code. Other possible error values include:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied <i>Address</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/nf-iscsidsc-addradiusserverw
     * @since windows6.0.6000
     */
    static AddRadiusServerW(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\AddRadiusServerW", "ptr", Address, "uint")
        return result
    }

    /**
     * AddRadiusServer.
     * @param {PSTR} Address A string that represents the IP address or DNS name associated with the RADIUS server.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code. Other possible error values include:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied <i>Address</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/nf-iscsidsc-addradiusservera
     * @since windows6.0.6000
     */
    static AddRadiusServerA(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\AddRadiusServerA", "ptr", Address, "uint")
        return result
    }

    /**
     * RemoveRadiusServer function removes a Remote Authentication Dial-In User Service (RADIUS) server entry from the RADIUS server list with which an iSCSI initiator is configured.
     * @param {PWSTR} Address A string that represents the IP address or RADIUS server name.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code.
     * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/nf-iscsidsc-removeradiusserverw
     * @since windows6.0.6000
     */
    static RemoveRadiusServerW(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\RemoveRadiusServerW", "ptr", Address, "uint")
        return result
    }

    /**
     * RemoveRadiusServer function removes a Remote Authentication Dial-In User Service (RADIUS) server entry from the RADIUS server list with which an iSCSI initiator is configured.
     * @param {PSTR} Address A string that represents the IP address or RADIUS server name.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code.
     * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/nf-iscsidsc-removeradiusservera
     * @since windows6.0.6000
     */
    static RemoveRadiusServerA(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\RemoveRadiusServerA", "ptr", Address, "uint")
        return result
    }

    /**
     * ReportRadiusServerList function retrieves the list of Remote Authentication Dail-In Service (RADIUS) servers the iSCSI initiator service uses during authentication.
     * @param {Pointer<UInt32>} BufferSizeInChar A <b>ULONG</b> value that specifies the number of list elements contained by the <i>Buffer</i> parameter.
     * @param {PWSTR} Buffer Pointer to a buffer that receives the list of Remote Authentication Dail-In Service (RADIUS) servers on output. Each server name is null terminated, except for the last server name, which is double null-terminated.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code.
     * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/nf-iscsidsc-reportradiusserverlistw
     * @since windows6.0.6000
     */
    static ReportRadiusServerListW(BufferSizeInChar, Buffer) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := DllCall("ISCSIDSC.dll\ReportRadiusServerListW", "uint*", BufferSizeInChar, "ptr", Buffer, "uint")
        return result
    }

    /**
     * ReportRadiusServerList function retrieves the list of Remote Authentication Dail-In Service (RADIUS) servers the iSCSI initiator service uses during authentication.
     * @param {Pointer<UInt32>} BufferSizeInChar A <b>ULONG</b> value that specifies the number of list elements contained by the <i>Buffer</i> parameter.
     * @param {PSTR} Buffer Pointer to a buffer that receives the list of Remote Authentication Dail-In Service (RADIUS) servers on output. Each server name is null terminated, except for the last server name, which is double null-terminated.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code.
     * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/nf-iscsidsc-reportradiusserverlista
     * @since windows6.0.6000
     */
    static ReportRadiusServerListA(BufferSizeInChar, Buffer) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := DllCall("ISCSIDSC.dll\ReportRadiusServerListA", "uint*", BufferSizeInChar, "ptr", Buffer, "uint")
        return result
    }

;@endregion Methods
}
