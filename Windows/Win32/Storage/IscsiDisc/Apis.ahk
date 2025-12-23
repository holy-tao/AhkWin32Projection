#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

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
     * @type {Guid}
     */
    static ScsiRawInterfaceGuid => Guid("{53f56309-b6bf-11d0-94f2-00a0c91efb8b}")

    /**
     * @type {Guid}
     */
    static WmiScsiAddressGuid => Guid("{53f5630f-b6bf-11d0-94f2-00a0c91efb8b}")

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
     * GetIscsiVersionInformation function retrieves information about the initiator version.
     * @param {Pointer<ISCSI_VERSION_INFO>} VersionInfo Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_version_info">ISCSI_VERSION_INFO</a> structure that contains  initiator version information.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-getiscsiversioninformation
     * @since windows6.0.6000
     */
    static GetIScsiVersionInformation(VersionInfo) {
        result := DllCall("ISCSIDSC.dll\GetIScsiVersionInformation", "ptr", VersionInfo, "uint")
        return result
    }

    /**
     * GetIscsiTargetInformation function retrieves information about the specified target. (Unicode)
     * @remarks
     * The iSCSI initiator service can acquire information about a single target through multiple discovery mechanisms and initiators, and the information can be different in each case, so the iSCSI initiator service maintains a list of <i>target instances</i> which are organized according to the discovery method.
     * 
     * For instance, if a single target is discovered by multiple initiators, each of which uses a different target portal group to discover the target, the iSCSI initiator will create multiple target instances for the target, each of which refers to a different target portal group.
     * 
     * Since the information associated with a target is relative to the way in which it was discovered, the caller must specify the discovery mechanism in the <i>DiscoveryMechanism</i> parameter, using a correctly formatted string identifier for the discovery mechanism. The caller can retrieve a list of valid identifiers for discovery mechanisms by setting the <i>InfoClass</i> parameter to <b>null</b>.
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines GetIScsiTargetInformation as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} TargetName The name of the target for which information is retrieved.
     * @param {PWSTR} DiscoveryMechanism A text description of the mechanism that was used to discover the target (for example, "iSNS:", "SendTargets:" or "HBA:"). A value of <b>null</b> indicates that no discovery mechanism is specified.
     * @param {Integer} InfoClass A value of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ne-iscsidsc-target_information_class">TARGET_INFORMATION_CLASS</a> that indicates the type of information to retrieve.
     * @param {Pointer<Integer>} BufferSize A pointer to a location that, on input, contains the size (in bytes) of the buffer that <i>Buffer</i> points to. If the operation succeeds, the location receives the number of bytes retrieved. If the operation fails, the location receives the size of the buffer required to contain the output data.
     * @param {Pointer<Void>} Buffer_R 
     * @returns {Integer} Returns ERROR_SUCCESS if successful and ERROR_INSUFFICIENT_BUFFER if the buffer size at Buffer was insufficient to contain the output data. Otherwise, <b>GetIscsiTargetInformation</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-getiscsitargetinformationw
     * @since windows6.0.6000
     */
    static GetIScsiTargetInformationW(TargetName, DiscoveryMechanism, InfoClass, BufferSize, Buffer_R) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName
        DiscoveryMechanism := DiscoveryMechanism is String ? StrPtr(DiscoveryMechanism) : DiscoveryMechanism

        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ISCSIDSC.dll\GetIScsiTargetInformationW", "ptr", TargetName, "ptr", DiscoveryMechanism, "int", InfoClass, BufferSizeMarshal, BufferSize, Buffer_RMarshal, Buffer_R, "uint")
        return result
    }

    /**
     * GetIscsiTargetInformation function retrieves information about the specified target. (ANSI)
     * @remarks
     * The iSCSI initiator service can acquire information about a single target through multiple discovery mechanisms and initiators, and the information can be different in each case, so the iSCSI initiator service maintains a list of <i>target instances</i> which are organized according to the discovery method.
     * 
     * For instance, if a single target is discovered by multiple initiators, each of which uses a different target portal group to discover the target, the iSCSI initiator will create multiple target instances for the target, each of which refers to a different target portal group.
     * 
     * Since the information associated with a target is relative to the way in which it was discovered, the caller must specify the discovery mechanism in the <i>DiscoveryMechanism</i> parameter, using a correctly formatted string identifier for the discovery mechanism. The caller can retrieve a list of valid identifiers for discovery mechanisms by setting the <i>InfoClass</i> parameter to <b>null</b>.
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines GetIScsiTargetInformation as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} TargetName The name of the target for which information is retrieved.
     * @param {PSTR} DiscoveryMechanism A text description of the mechanism that was used to discover the target (for example, "iSNS:", "SendTargets:" or "HBA:"). A value of <b>null</b> indicates that no discovery mechanism is specified.
     * @param {Integer} InfoClass A value of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ne-iscsidsc-target_information_class">TARGET_INFORMATION_CLASS</a> that indicates the type of information to retrieve.
     * @param {Pointer<Integer>} BufferSize A pointer to a location that, on input, contains the size (in bytes) of the buffer that <i>Buffer</i> points to. If the operation succeeds, the location receives the number of bytes retrieved. If the operation fails, the location receives the size of the buffer required to contain the output data.
     * @param {Pointer<Void>} Buffer_R 
     * @returns {Integer} Returns ERROR_SUCCESS if successful and ERROR_INSUFFICIENT_BUFFER if the buffer size at Buffer was insufficient to contain the output data. Otherwise, <b>GetIscsiTargetInformation</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-getiscsitargetinformationa
     * @since windows6.0.6000
     */
    static GetIScsiTargetInformationA(TargetName, DiscoveryMechanism, InfoClass, BufferSize, Buffer_R) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName
        DiscoveryMechanism := DiscoveryMechanism is String ? StrPtr(DiscoveryMechanism) : DiscoveryMechanism

        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ISCSIDSC.dll\GetIScsiTargetInformationA", "ptr", TargetName, "ptr", DiscoveryMechanism, "int", InfoClass, BufferSizeMarshal, BufferSize, Buffer_RMarshal, Buffer_R, "uint")
        return result
    }

    /**
     * AddIscsiConnection function adds a new iSCSI connection to an existing session. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines AddIScsiConnection as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId A pointer to a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> that, on input, contains the session identifier for the session that was added.
     * @param {Pointer<Void>} Reserved This member should be <b>null</b> on input.
     * @param {Integer} InitiatorPortNumber The number of the port on the initiator that the initiator uses to add the connection. A value of <b>ISCSI_ANY_INITIATOR_PORT</b> indicates that the initiator can use any of its ports to add the connection.
     * @param {Pointer<ISCSI_TARGET_PORTALW>} TargetPortal A pointer to an ISCSI_TARGET_PORTAL-type structure that indicates the target portal to use when adding the connection. 
     * 
     * The portal must belong to the same portal group that the initiator used to login to the target, and it must be a portal that the initiator discovered. The iSCSI initiator service does not verify that the target portal meets these requirements.
     * @param {Integer} SecurityFlags A bitmap that specifies the characteristics of the IPsec connection that the initiator uses to establish the connection. If IPsec security policy between the initiator and the target portal is already configured because of the portal group policy or a previous connection to the portal, the existing configuration takes precedence over the configuration specified in SecurityFlags and the security bitmap is ignored. 
     * 
     * If the <b>ISCSI_SECURITY_FLAG_VALID</b> flag is set to 0, the iSCSI initiator service uses default values for the security flags that are defined in the registry.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED"></a><a id="iscsi_security_flag_tunnel_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection in IPsec tunnel mode. Caller should set this flag or the ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED"></a><a id="iscsi_security_flag_transport_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection in IPsec transport mode. Caller should set this flag or the ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_PFS_ENABLED"></a><a id="iscsi_security_flag_pfs_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_PFS_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with Perfect Forward Secrecy (PFS) mode enabled; otherwise, the initiator should make the connection with PFS mode disabled. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED"></a><a id="iscsi_security_flag_aggressive_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with aggressive mode enabled. Caller should set this flag or the ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED flag, but not both. 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  The Microsoft software initiator driver does not support aggressive mode.
     * </div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED"></a><a id="iscsi_security_flag_main_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with main mode enabled. Caller should set this flag or the ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED"></a><a id="iscsi_security_flag_ike_ipsec_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with the IKE/IPsec protocol enabled; otherwise, the IKE/IPsec protocol is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_VALID"></a><a id="iscsi_security_flag_valid"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the other mask values are valid; otherwise, the iSCSI initiator service will use bitmap values that were previously defined for the target portal, or if none are available, the initiator service uses the default values defined in the registry. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_login_options">ISCSI_LOGIN_OPTIONS</a> that contains the options that specify the characteristics of the login session.
     * @param {Integer} KeySize The size, in bytes, of the preshared key that is passed to the target.
     * @param {PSTR} Key If the IPsec security policy between the initiator and the target portal is already configured as a result of the portal group policy or a previous connection to the portal, the existing key takes precedence over the key currently specified in this member.
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} ConnectionId An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb870817(v=vs.85)">ISCSI_UNIQUE_CONNECTION_ID</a>-type structure that, on output, receives an opaque value that uniquely identifies the connection that was added to the session.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-addiscsiconnectionw
     * @since windows6.0.6000
     */
    static AddIScsiConnectionW(UniqueSessionId, Reserved, InitiatorPortNumber, TargetPortal, SecurityFlags, LoginOptions, KeySize, Key, ConnectionId) {
        Key := Key is String ? StrPtr(Key) : Key

        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := DllCall("ISCSIDSC.dll\AddIScsiConnectionW", "ptr", UniqueSessionId, ReservedMarshal, Reserved, "uint", InitiatorPortNumber, "ptr", TargetPortal, "uint", SecurityFlags, "ptr", LoginOptions, "uint", KeySize, "ptr", Key, "ptr", ConnectionId, "uint")
        return result
    }

    /**
     * AddIscsiConnection function adds a new iSCSI connection to an existing session. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines AddIScsiConnection as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId A pointer to a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> that, on input, contains the session identifier for the session that was added.
     * @param {Pointer<Void>} Reserved This member should be <b>null</b> on input.
     * @param {Integer} InitiatorPortNumber The number of the port on the initiator that the initiator uses to add the connection. A value of <b>ISCSI_ANY_INITIATOR_PORT</b> indicates that the initiator can use any of its ports to add the connection.
     * @param {Pointer<ISCSI_TARGET_PORTALA>} TargetPortal A pointer to an ISCSI_TARGET_PORTAL-type structure that indicates the target portal to use when adding the connection. 
     * 
     * The portal must belong to the same portal group that the initiator used to login to the target, and it must be a portal that the initiator discovered. The iSCSI initiator service does not verify that the target portal meets these requirements.
     * @param {Integer} SecurityFlags A bitmap that specifies the characteristics of the IPsec connection that the initiator uses to establish the connection. If IPsec security policy between the initiator and the target portal is already configured because of the portal group policy or a previous connection to the portal, the existing configuration takes precedence over the configuration specified in SecurityFlags and the security bitmap is ignored. 
     * 
     * If the <b>ISCSI_SECURITY_FLAG_VALID</b> flag is set to 0, the iSCSI initiator service uses default values for the security flags that are defined in the registry.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED"></a><a id="iscsi_security_flag_tunnel_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection in IPsec tunnel mode. Caller should set this flag or the ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED"></a><a id="iscsi_security_flag_transport_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection in IPsec transport mode. Caller should set this flag or the ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_PFS_ENABLED"></a><a id="iscsi_security_flag_pfs_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_PFS_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with Perfect Forward Secrecy (PFS) mode enabled; otherwise, the initiator should make the connection with PFS mode disabled. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED"></a><a id="iscsi_security_flag_aggressive_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with aggressive mode enabled. Caller should set this flag or the ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED flag, but not both. 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  The Microsoft software initiator driver does not support aggressive mode.
     * </div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED"></a><a id="iscsi_security_flag_main_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with main mode enabled. Caller should set this flag or the ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED"></a><a id="iscsi_security_flag_ike_ipsec_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with the IKE/IPsec protocol enabled; otherwise, the IKE/IPsec protocol is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_VALID"></a><a id="iscsi_security_flag_valid"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the other mask values are valid; otherwise, the iSCSI initiator service will use bitmap values that were previously defined for the target portal, or if none are available, the initiator service uses the default values defined in the registry. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_login_options">ISCSI_LOGIN_OPTIONS</a> that contains the options that specify the characteristics of the login session.
     * @param {Integer} KeySize The size, in bytes, of the preshared key that is passed to the target.
     * @param {PSTR} Key If the IPsec security policy between the initiator and the target portal is already configured as a result of the portal group policy or a previous connection to the portal, the existing key takes precedence over the key currently specified in this member.
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} ConnectionId An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb870817(v=vs.85)">ISCSI_UNIQUE_CONNECTION_ID</a>-type structure that, on output, receives an opaque value that uniquely identifies the connection that was added to the session.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-addiscsiconnectiona
     * @since windows6.0.6000
     */
    static AddIScsiConnectionA(UniqueSessionId, Reserved, InitiatorPortNumber, TargetPortal, SecurityFlags, LoginOptions, KeySize, Key, ConnectionId) {
        Key := Key is String ? StrPtr(Key) : Key

        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := DllCall("ISCSIDSC.dll\AddIScsiConnectionA", "ptr", UniqueSessionId, ReservedMarshal, Reserved, "uint", InitiatorPortNumber, "ptr", TargetPortal, "uint", SecurityFlags, "ptr", LoginOptions, "uint", KeySize, "ptr", Key, "ptr", ConnectionId, "uint")
        return result
    }

    /**
     * RemoveIscsiConnection function removes a connection from an active session.
     * @remarks
     * The <b>RemoveIscsiConnection</b> function will not remove the last connection of a session or the leading connection of a session. The caller must close the session by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-logoutiscsitarget">LogoutIscsiTarget</a> to remove the last connection.
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId A pointer to a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> that specifies the unique session identifier of the session that the connection belongs to.
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} ConnectionId A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb870817(v=vs.85)">ISCSI_UNIQUE_CONNECTION_ID</a> that specifies the connection to remove.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-removeiscsiconnection
     * @since windows6.0.6000
     */
    static RemoveIScsiConnection(UniqueSessionId, ConnectionId) {
        result := DllCall("ISCSIDSC.dll\RemoveIScsiConnection", "ptr", UniqueSessionId, "ptr", ConnectionId, "uint")
        return result
    }

    /**
     * ReportIscsiTargets function retrieves the list of targets that the iSCSI initiator service has discovered, and can also instruct the iSCSI initiator service to refresh the list. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportIScsiTargets as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {BOOLEAN} ForceUpdate If <b>true</b>, the iSCSI initiator service updates the list of discovered targets before returning the target list data to the caller.
     * @param {Pointer<Integer>} BufferSize A <b>ULONG</b> value that specifies the number of list elements contained by the <i>Buffer</i> parameter.
     * @param {PWSTR} Buffer_R 
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer size is insufficient to contain  the output data. Otherwise, <b>ReportIscsiTargets</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportiscsitargetsw
     * @since windows6.0.6000
     */
    static ReportIScsiTargetsW(ForceUpdate, BufferSize, Buffer_R) {
        Buffer_R := Buffer_R is String ? StrPtr(Buffer_R) : Buffer_R

        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportIScsiTargetsW", "char", ForceUpdate, BufferSizeMarshal, BufferSize, "ptr", Buffer_R, "uint")
        return result
    }

    /**
     * ReportIscsiTargets function retrieves the list of targets that the iSCSI initiator service has discovered, and can also instruct the iSCSI initiator service to refresh the list. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportIScsiTargets as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {BOOLEAN} ForceUpdate If <b>true</b>, the iSCSI initiator service updates the list of discovered targets before returning the target list data to the caller.
     * @param {Pointer<Integer>} BufferSize A <b>ULONG</b> value that specifies the number of list elements contained by the <i>Buffer</i> parameter.
     * @param {PSTR} Buffer_R 
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer size is insufficient to contain  the output data. Otherwise, <b>ReportIscsiTargets</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportiscsitargetsa
     * @since windows6.0.6000
     */
    static ReportIScsiTargetsA(ForceUpdate, BufferSize, Buffer_R) {
        Buffer_R := Buffer_R is String ? StrPtr(Buffer_R) : Buffer_R

        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportIScsiTargetsA", "char", ForceUpdate, BufferSizeMarshal, BufferSize, "ptr", Buffer_R, "uint")
        return result
    }

    /**
     * AddIscsiStaticTarget function adds a target to the list of static targets available to the iSCSI initiator. (Unicode)
     * @remarks
     * This routine adds a target to the iSCSI initiator service's list of static targets. If the caller specifies a value of <b>true</b> in <i>Persist</i>, the target is stored in the registry and information about the target persists across restarts of the initiator service and reboots of the operating system.
     * 
     * By setting the <b>ISCSI_TARGET_FLAG_HIDE_STATIC_TARGET</b> flag, callers can configure default login information for a target prior to its discovery by an iSCSI initiator, the iSNS service, or a SendTargets request.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines AddIScsiStaticTarget as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} TargetName The name of the target to add to the static target list.
     * @param {PWSTR} TargetAlias An alias associated with the <i>TargetName</i>.
     * @param {Integer} TargetFlags A bitmap of flags that affect how, and under what circumstances, a target is discovered and enumerated. 
     * 
     * The following table lists the flags that can be associated with a target and the meaning of each flag.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_TARGET_FLAG_HIDE_STATIC_TARGET"></a><a id="iscsi_target_flag_hide_static_target"></a><dl>
     * <dt><b>ISCSI_TARGET_FLAG_HIDE_STATIC_TARGET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target is added to the list of static targets. However, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-reportiscsitargetsa">ReportIscsiTargets</a> does not report the target, unless it was also discovered dynamically by the iSCSI initiator, the Internet Storage Name Service (iSNS), or a <b>SendTargets</b> request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_TARGET_FLAG_MERGE_TARGET_INFORMATION"></a><a id="iscsi_target_flag_merge_target_information"></a><dl>
     * <dt><b>ISCSI_TARGET_FLAG_MERGE_TARGET_INFORMATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The iSCSI initiator service merges the information (if any) that it already has for this static target with the information that the caller passes to <b>AddIscsiStaticTarget</b>. 
     * 
     * If this flag is not set, the iSCSI initiator service overwrites the stored information with the information that the caller passes in.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BOOLEAN} Persist If <b>true</b>, the target information persists across restarts of the iSCSI initiator service.
     * @param {Pointer<ISCSI_TARGET_MAPPINGW>} Mappings A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_mappinga">ISCSI_TARGET_MAPPING</a> that contains a set of mappings that the initiator uses when assigning values for the bus, target, and LUN numbers to the iSCSI LUNs associated with the target. 
     * If <i>Mappings</i> is <b>null</b>, the initiator will select the bus, target, and LUN numbers.
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_login_options">ISCSI_LOGIN_OPTIONS</a> that contains the options that specify the default login parameters that an initiator uses to login to a target.
     * @param {Pointer<ISCSI_TARGET_PORTAL_GROUPW>} PortalGroup A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portal_groupa">ISCSI_TARGET_PORTAL_GROUP</a> that indicates the group of portals that an initiator can use login to the target.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-addiscsistatictargetw
     * @since windows6.0.6000
     */
    static AddIScsiStaticTargetW(TargetName, TargetAlias, TargetFlags, Persist, Mappings, LoginOptions, PortalGroup) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName
        TargetAlias := TargetAlias is String ? StrPtr(TargetAlias) : TargetAlias

        result := DllCall("ISCSIDSC.dll\AddIScsiStaticTargetW", "ptr", TargetName, "ptr", TargetAlias, "uint", TargetFlags, "char", Persist, "ptr", Mappings, "ptr", LoginOptions, "ptr", PortalGroup, "uint")
        return result
    }

    /**
     * AddIscsiStaticTarget function adds a target to the list of static targets available to the iSCSI initiator. (ANSI)
     * @remarks
     * This routine adds a target to the iSCSI initiator service's list of static targets. If the caller specifies a value of <b>true</b> in <i>Persist</i>, the target is stored in the registry and information about the target persists across restarts of the initiator service and reboots of the operating system.
     * 
     * By setting the <b>ISCSI_TARGET_FLAG_HIDE_STATIC_TARGET</b> flag, callers can configure default login information for a target prior to its discovery by an iSCSI initiator, the iSNS service, or a SendTargets request.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines AddIScsiStaticTarget as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} TargetName The name of the target to add to the static target list.
     * @param {PSTR} TargetAlias An alias associated with the <i>TargetName</i>.
     * @param {Integer} TargetFlags A bitmap of flags that affect how, and under what circumstances, a target is discovered and enumerated. 
     * 
     * The following table lists the flags that can be associated with a target and the meaning of each flag.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_TARGET_FLAG_HIDE_STATIC_TARGET"></a><a id="iscsi_target_flag_hide_static_target"></a><dl>
     * <dt><b>ISCSI_TARGET_FLAG_HIDE_STATIC_TARGET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The target is added to the list of static targets. However, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-reportiscsitargetsa">ReportIscsiTargets</a> does not report the target, unless it was also discovered dynamically by the iSCSI initiator, the Internet Storage Name Service (iSNS), or a <b>SendTargets</b> request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_TARGET_FLAG_MERGE_TARGET_INFORMATION"></a><a id="iscsi_target_flag_merge_target_information"></a><dl>
     * <dt><b>ISCSI_TARGET_FLAG_MERGE_TARGET_INFORMATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The iSCSI initiator service merges the information (if any) that it already has for this static target with the information that the caller passes to <b>AddIscsiStaticTarget</b>. 
     * 
     * If this flag is not set, the iSCSI initiator service overwrites the stored information with the information that the caller passes in.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BOOLEAN} Persist If <b>true</b>, the target information persists across restarts of the iSCSI initiator service.
     * @param {Pointer<ISCSI_TARGET_MAPPINGA>} Mappings A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_mappinga">ISCSI_TARGET_MAPPING</a> that contains a set of mappings that the initiator uses when assigning values for the bus, target, and LUN numbers to the iSCSI LUNs associated with the target. 
     * If <i>Mappings</i> is <b>null</b>, the initiator will select the bus, target, and LUN numbers.
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_login_options">ISCSI_LOGIN_OPTIONS</a> that contains the options that specify the default login parameters that an initiator uses to login to a target.
     * @param {Pointer<ISCSI_TARGET_PORTAL_GROUPA>} PortalGroup A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portal_groupa">ISCSI_TARGET_PORTAL_GROUP</a> that indicates the group of portals that an initiator can use login to the target.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-addiscsistatictargeta
     * @since windows6.0.6000
     */
    static AddIScsiStaticTargetA(TargetName, TargetAlias, TargetFlags, Persist, Mappings, LoginOptions, PortalGroup) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName
        TargetAlias := TargetAlias is String ? StrPtr(TargetAlias) : TargetAlias

        result := DllCall("ISCSIDSC.dll\AddIScsiStaticTargetA", "ptr", TargetName, "ptr", TargetAlias, "uint", TargetFlags, "char", Persist, "ptr", Mappings, "ptr", LoginOptions, "ptr", PortalGroup, "uint")
        return result
    }

    /**
     * RemoveIscsiStaticTarget function removes a target from the list of static targets made available to the machine. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines RemoveIScsiStaticTarget as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} TargetName The name of the iSCSI target to remove from the static list.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-removeiscsistatictargetw
     * @since windows6.0.6000
     */
    static RemoveIScsiStaticTargetW(TargetName) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        result := DllCall("ISCSIDSC.dll\RemoveIScsiStaticTargetW", "ptr", TargetName, "uint")
        return result
    }

    /**
     * RemoveIscsiStaticTarget function removes a target from the list of static targets made available to the machine. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines RemoveIScsiStaticTarget as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} TargetName The name of the iSCSI target to remove from the static list.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-removeiscsistatictargeta
     * @since windows6.0.6000
     */
    static RemoveIScsiStaticTargetA(TargetName) {
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        result := DllCall("ISCSIDSC.dll\RemoveIScsiStaticTargetA", "ptr", TargetName, "uint")
        return result
    }

    /**
     * AddIscsiSendTargetPortal function adds a static target portal to the list of target portals to which the iSCSI initiator service transmits SendTargets requests. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines AddIScsiSendTargetPortal as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} InitiatorInstance The initiator that the iSCSI initiator service utilizes to transmit <b>SendTargets</b> requests to the specified target portal. If <b>null</b>, the iSCSI initiator service will use any initiator that can reach the target portal.
     * @param {Integer} InitiatorPortNumber The port number to use for the <b>SendTargets</b> request. This port number corresponds to the source IP address on the Host-Bus Adapter (HBA).  A value of <b>ISCSI_ALL_INITIATOR_PORTS</b> indicates that the initiator must select the appropriate port based upon current routing information.
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_login_options">ISCSI_LOGIN_OPTIONS</a> that contains the login options to use with the target portal.
     * @param {Integer} SecurityFlags A bitmap that specifies the characteristics of the IPsec connection that the initiator adds to the session. If IPsec security policy between the initiator and the target portal is already configured as a result  of the portal group policy or a previous connection to the portal, the existing configuration takes precedence over the configuration specified in SecurityFlags and the security bitmap is ignored. 
     * 
     * If the <b>ISCSI_SECURITY_FLAG_VALID</b> flag is set to 0, the iSCSI initiator service uses default values for the security flags that are defined in the registry.
     * 
     * Caller can set any of the following flags in the bitmap:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED"></a><a id="iscsi_security_flag_tunnel_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection in IPsec tunnel mode. Caller should set this flag or the ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED"></a><a id="iscsi_security_flag_transport_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection in IPsec transport mode. Caller should set this flag or the ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_PFS_ENABLED"></a><a id="iscsi_security_flag_pfs_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_PFS_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with Perfect Forward Secrecy (PFS) mode enabled; otherwise, the initiator should make the connection with PFS mode disabled. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED"></a><a id="iscsi_security_flag_aggressive_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with aggressive mode enabled. Caller should set this flag or the ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED flag, but not both. 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  The Microsoft software initiator driver does not support aggressive mode.
     * </div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED"></a><a id="iscsi_security_flag_main_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with main mode enabled. Caller should set this flag or the ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED"></a><a id="iscsi_security_flag_ike_ipsec_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with the IKE/IPsec protocol enabled; otherwise, the IKE/IPsec protocol is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_VALID"></a><a id="iscsi_security_flag_valid"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the other mask values are valid; otherwise, the iSCSI initiator service will use bitmap values that were previously defined for the target portal, or if none are available, the initiator service uses the default values defined in the registry. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<ISCSI_TARGET_PORTALW>} Portal A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portala">ISCSI_TARGET_PORTAL</a> that indicates the portal to which SendTargets will be sent for target discovery.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-addiscsisendtargetportalw
     * @since windows6.0.6000
     */
    static AddIScsiSendTargetPortalW(InitiatorInstance, InitiatorPortNumber, LoginOptions, SecurityFlags, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance

        result := DllCall("ISCSIDSC.dll\AddIScsiSendTargetPortalW", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", LoginOptions, "uint", SecurityFlags, "ptr", Portal, "uint")
        return result
    }

    /**
     * AddIscsiSendTargetPortal function adds a static target portal to the list of target portals to which the iSCSI initiator service transmits SendTargets requests. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines AddIScsiSendTargetPortal as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} InitiatorInstance The initiator that the iSCSI initiator service utilizes to transmit <b>SendTargets</b> requests to the specified target portal. If <b>null</b>, the iSCSI initiator service will use any initiator that can reach the target portal.
     * @param {Integer} InitiatorPortNumber The port number to use for the <b>SendTargets</b> request. This port number corresponds to the source IP address on the Host-Bus Adapter (HBA).  A value of <b>ISCSI_ALL_INITIATOR_PORTS</b> indicates that the initiator must select the appropriate port based upon current routing information.
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_login_options">ISCSI_LOGIN_OPTIONS</a> that contains the login options to use with the target portal.
     * @param {Integer} SecurityFlags A bitmap that specifies the characteristics of the IPsec connection that the initiator adds to the session. If IPsec security policy between the initiator and the target portal is already configured as a result  of the portal group policy or a previous connection to the portal, the existing configuration takes precedence over the configuration specified in SecurityFlags and the security bitmap is ignored. 
     * 
     * If the <b>ISCSI_SECURITY_FLAG_VALID</b> flag is set to 0, the iSCSI initiator service uses default values for the security flags that are defined in the registry.
     * 
     * Caller can set any of the following flags in the bitmap:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED"></a><a id="iscsi_security_flag_tunnel_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection in IPsec tunnel mode. Caller should set this flag or the ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED"></a><a id="iscsi_security_flag_transport_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection in IPsec transport mode. Caller should set this flag or the ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_PFS_ENABLED"></a><a id="iscsi_security_flag_pfs_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_PFS_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with Perfect Forward Secrecy (PFS) mode enabled; otherwise, the initiator should make the connection with PFS mode disabled. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED"></a><a id="iscsi_security_flag_aggressive_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with aggressive mode enabled. Caller should set this flag or the ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED flag, but not both. 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  The Microsoft software initiator driver does not support aggressive mode.
     * </div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED"></a><a id="iscsi_security_flag_main_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with main mode enabled. Caller should set this flag or the ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED"></a><a id="iscsi_security_flag_ike_ipsec_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with the IKE/IPsec protocol enabled; otherwise, the IKE/IPsec protocol is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_VALID"></a><a id="iscsi_security_flag_valid"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the other mask values are valid; otherwise, the iSCSI initiator service will use bitmap values that were previously defined for the target portal, or if none are available, the initiator service uses the default values defined in the registry. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<ISCSI_TARGET_PORTALA>} Portal A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portala">ISCSI_TARGET_PORTAL</a> that indicates the portal to which SendTargets will be sent for target discovery.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-addiscsisendtargetportala
     * @since windows6.0.6000
     */
    static AddIScsiSendTargetPortalA(InitiatorInstance, InitiatorPortNumber, LoginOptions, SecurityFlags, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance

        result := DllCall("ISCSIDSC.dll\AddIScsiSendTargetPortalA", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", LoginOptions, "uint", SecurityFlags, "ptr", Portal, "uint")
        return result
    }

    /**
     * RemoveIscsiSendTargetPortal function removes a portal from the list of portals to which the iSCSI initiator service sends SendTargets requests for target discovery. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines RemoveIScsiSendTargetPortal as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} InitiatorInstance The name of the Host Bus Adapter (HBA) that the iSCSI initiator service uses to establish a discovery session and perform <b>SendTargets</b> requests. A value of <b>null</b> indicates that the iSCSI initiator service will use any HBA that is capable of accessing the target portal.
     * @param {Integer} InitiatorPortNumber The port number on the HBA that the iSCSI initiator service use to perform <b>SendTargets</b> requests.
     * @param {Pointer<ISCSI_TARGET_PORTALW>} Portal A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portala">ISCSI_TARGET_PORTAL</a> that specifies the target portal that the iSCSI initiator service removes from its list of portals.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-removeiscsisendtargetportalw
     * @since windows6.0.6000
     */
    static RemoveIScsiSendTargetPortalW(InitiatorInstance, InitiatorPortNumber, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance

        result := DllCall("ISCSIDSC.dll\RemoveIScsiSendTargetPortalW", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", Portal, "uint")
        return result
    }

    /**
     * RemoveIscsiSendTargetPortal function removes a portal from the list of portals to which the iSCSI initiator service sends SendTargets requests for target discovery. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines RemoveIScsiSendTargetPortal as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} InitiatorInstance The name of the Host Bus Adapter (HBA) that the iSCSI initiator service uses to establish a discovery session and perform <b>SendTargets</b> requests. A value of <b>null</b> indicates that the iSCSI initiator service will use any HBA that is capable of accessing the target portal.
     * @param {Integer} InitiatorPortNumber The port number on the HBA that the iSCSI initiator service use to perform <b>SendTargets</b> requests.
     * @param {Pointer<ISCSI_TARGET_PORTALA>} Portal A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portala">ISCSI_TARGET_PORTAL</a> that specifies the target portal that the iSCSI initiator service removes from its list of portals.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-removeiscsisendtargetportala
     * @since windows6.0.6000
     */
    static RemoveIScsiSendTargetPortalA(InitiatorInstance, InitiatorPortNumber, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance

        result := DllCall("ISCSIDSC.dll\RemoveIScsiSendTargetPortalA", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", Portal, "uint")
        return result
    }

    /**
     * RefreshIscsiSendTargetPortal function instructs the iSCSI initiator service to establish a discovery session with the indicated target portal and transmit a SendTargets request to refresh the list of discovered targets for the iSCSI initiator service. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines RefreshIScsiSendTargetPortal as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} InitiatorInstance The name of the Host Bus Adapter (HBA) to use for the <b>SendTargets</b> request. If <b>null</b>, the iSCSI initiator service uses any HBA that can reach the indicated target portal is chosen.
     * @param {Integer} InitiatorPortNumber The port number on the HBA to use for the <b>SendTargets</b> request. If the value is <b>ISCSI_ALL_INITIATOR_PORTS</b>, the initiator HBA will choose the appropriate port based upon current routing information.
     * @param {Pointer<ISCSI_TARGET_PORTALW>} Portal A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portala">ISCSI_TARGET_PORTAL</a>  indicating the portal to which the iSCSI initiator service sends the <b>SendTargets</b> request to refresh the list of targets.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-refreshiscsisendtargetportalw
     * @since windows6.0.6000
     */
    static RefreshIScsiSendTargetPortalW(InitiatorInstance, InitiatorPortNumber, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance

        result := DllCall("ISCSIDSC.dll\RefreshIScsiSendTargetPortalW", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", Portal, "uint")
        return result
    }

    /**
     * RefreshIscsiSendTargetPortal function instructs the iSCSI initiator service to establish a discovery session with the indicated target portal and transmit a SendTargets request to refresh the list of discovered targets for the iSCSI initiator service. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines RefreshIScsiSendTargetPortal as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} InitiatorInstance The name of the Host Bus Adapter (HBA) to use for the <b>SendTargets</b> request. If <b>null</b>, the iSCSI initiator service uses any HBA that can reach the indicated target portal is chosen.
     * @param {Integer} InitiatorPortNumber The port number on the HBA to use for the <b>SendTargets</b> request. If the value is <b>ISCSI_ALL_INITIATOR_PORTS</b>, the initiator HBA will choose the appropriate port based upon current routing information.
     * @param {Pointer<ISCSI_TARGET_PORTALA>} Portal A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portala">ISCSI_TARGET_PORTAL</a>  indicating the portal to which the iSCSI initiator service sends the <b>SendTargets</b> request to refresh the list of targets.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-refreshiscsisendtargetportala
     * @since windows6.0.6000
     */
    static RefreshIScsiSendTargetPortalA(InitiatorInstance, InitiatorPortNumber, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance

        result := DllCall("ISCSIDSC.dll\RefreshIScsiSendTargetPortalA", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", Portal, "uint")
        return result
    }

    /**
     * ReportIscsiSendTargetPortals function retrieves a list of target portals that the iSCSI initiator service uses to perform automatic discovery with SendTarget requests. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportIScsiSendTargetPortals as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} PortalCount A pointer to a location that, on input, contains the number of entries in the <i>PortalInfo</i> array. On output, this parameter specifies the number of elements that contain return data.
     * @param {Pointer<ISCSI_TARGET_PORTAL_INFOW>} PortalInfo Pointer to an array of elements contained in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portal_infoa">ISCSI_TARGET_PORTAL_INFO</a> structures that describe the portals that the iSCSI initiator service utilizes to perform discovery with <b>SendTargets</b> requests.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer size of Buffer is insufficient to contain the output data.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportiscsisendtargetportalsw
     * @since windows6.0.6000
     */
    static ReportIScsiSendTargetPortalsW(PortalCount, PortalInfo) {
        PortalCountMarshal := PortalCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportIScsiSendTargetPortalsW", PortalCountMarshal, PortalCount, "ptr", PortalInfo, "uint")
        return result
    }

    /**
     * ReportIscsiSendTargetPortals function retrieves a list of target portals that the iSCSI initiator service uses to perform automatic discovery with SendTarget requests. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportIScsiSendTargetPortals as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} PortalCount A pointer to a location that, on input, contains the number of entries in the <i>PortalInfo</i> array. On output, this parameter specifies the number of elements that contain return data.
     * @param {Pointer<ISCSI_TARGET_PORTAL_INFOA>} PortalInfo Pointer to an array of elements contained in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portal_infoa">ISCSI_TARGET_PORTAL_INFO</a> structures that describe the portals that the iSCSI initiator service utilizes to perform discovery with <b>SendTargets</b> requests.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer size of Buffer is insufficient to contain the output data.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportiscsisendtargetportalsa
     * @since windows6.0.6000
     */
    static ReportIScsiSendTargetPortalsA(PortalCount, PortalInfo) {
        PortalCountMarshal := PortalCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportIScsiSendTargetPortalsA", PortalCountMarshal, PortalCount, "ptr", PortalInfo, "uint")
        return result
    }

    /**
     * ReportIscsiSendTargetPortalsEx function retrieves a list of static target portals that the iSCSI initiator service uses to perform automatic discovery with SendTarget requests. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportIScsiSendTargetPortalsEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} PortalCount A pointer to a location that, on input, contains the number of entries in the <i>PortalInfo</i> array. On output, this parameter specifies the number of elements that contain return data.
     * @param {Pointer<Integer>} PortalInfoSize A pointer to a location that, on input, contains the byte-size of the buffer specified by <i>PortalInfo</i>. On output, this parameter specifies the number of bytes retrieved.
     * @param {Pointer<ISCSI_TARGET_PORTAL_INFO_EXW>} PortalInfo Pointer to an array of elements contained in a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portal_infoa">ISCSI_TARGET_PORTAL_INFO_EX</a> structure that describe the portals that the iSCSI initiator service utilizes to perform discovery with <b>SendTargets</b> requests.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the size of the buffer at <i>PortalInfo</i> is insufficient to contain the output data. Otherwise, <b>ReportIscsiSendTargetPortalsEx</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportiscsisendtargetportalsexw
     * @since windows6.0.6000
     */
    static ReportIScsiSendTargetPortalsExW(PortalCount, PortalInfoSize, PortalInfo) {
        PortalCountMarshal := PortalCount is VarRef ? "uint*" : "ptr"
        PortalInfoSizeMarshal := PortalInfoSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportIScsiSendTargetPortalsExW", PortalCountMarshal, PortalCount, PortalInfoSizeMarshal, PortalInfoSize, "ptr", PortalInfo, "uint")
        return result
    }

    /**
     * ReportIscsiSendTargetPortalsEx function retrieves a list of static target portals that the iSCSI initiator service uses to perform automatic discovery with SendTarget requests. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportIScsiSendTargetPortalsEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} PortalCount A pointer to a location that, on input, contains the number of entries in the <i>PortalInfo</i> array. On output, this parameter specifies the number of elements that contain return data.
     * @param {Pointer<Integer>} PortalInfoSize A pointer to a location that, on input, contains the byte-size of the buffer specified by <i>PortalInfo</i>. On output, this parameter specifies the number of bytes retrieved.
     * @param {Pointer<ISCSI_TARGET_PORTAL_INFO_EXA>} PortalInfo Pointer to an array of elements contained in a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portal_infoa">ISCSI_TARGET_PORTAL_INFO_EX</a> structure that describe the portals that the iSCSI initiator service utilizes to perform discovery with <b>SendTargets</b> requests.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the size of the buffer at <i>PortalInfo</i> is insufficient to contain the output data. Otherwise, <b>ReportIscsiSendTargetPortalsEx</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportiscsisendtargetportalsexa
     * @since windows6.0.6000
     */
    static ReportIScsiSendTargetPortalsExA(PortalCount, PortalInfoSize, PortalInfo) {
        PortalCountMarshal := PortalCount is VarRef ? "uint*" : "ptr"
        PortalInfoSizeMarshal := PortalInfoSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportIScsiSendTargetPortalsExA", PortalCountMarshal, PortalCount, PortalInfoSizeMarshal, PortalInfoSize, "ptr", PortalInfo, "uint")
        return result
    }

    /**
     * LoginIscsiTarget function establishes a full featured login session with the indicated target. (Unicode)
     * @remarks
     * The <b>LoginIscsiTarget</b> function either establishes a single login session with a target, or creates a persistent login to a target. If <b>LoginIscsiTarget</b> creates a persistent login, the specified initiator should log in to the target each time the initiator is started, typically at system boot. Callers to <b>LoginIscsiTarget</b> can request the creation of a persistent login by setting the <i>IsPersistent</i> parameter to <b>true</b>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines LoginIScsiTarget as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} TargetName The name of the target with which to establish a login session. The target must already exist in the list of discovered targets for the iSCSI initiator service.
     * @param {BOOLEAN} IsInformationalSession If <b>true</b>, the <b>LoginIscsiTarget</b> function establishes a login session, but the operation does not report the LUNs on the target to the "Plug and Play" Manager. If the login succeeds, management applications will be able to query the target for information with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-sendscsireportluns">SendScsiReportLuns</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-sendscsireadcapacity">SendScsiReadCapacity</a> functions, but the storage stack will not enumerate the target or load a driver for it. 
     * 
     * If <i>IsInformationalSession</i> is <b>false</b>, <b>LoginIscsiTarget</b> reports the LUNs associated with the target to the "Plug and Play" Manager, and the system loads drivers for the LUNs.
     * @param {PWSTR} InitiatorInstance The name of the initiator that logs in to the target. If <i>InitiatorName</i> is <b>null</b>, the iSCSI initiator service selects an initiator.
     * @param {Integer} InitiatorPortNumber The port number of the Host Bus Adapter (HBA) that initiates the login session. If this parameter is <b>ISCSI_ANY_INITIATOR_PORT</b>, the caller did not specify a port for the initiator HBA to use when logging in to the target. 
     * 
     * If <i>InitiatorName</i> is <b>null</b>, <i>InitiatorPortNumber</i> must be <b>ISCSI_ANY_INITIATOR_PORT</b>.
     * @param {Pointer<ISCSI_TARGET_PORTALW>} TargetPortal Pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portala">ISCSI_TARGET_PORTAL</a> that indicates the portal that the initiator uses to open the session. The specified portal must belong to a portal group that is associated with the <i>TargetName</i>. If <i>TargetPortal</i> is <b>null</b>, the iSCSI initiator service instructs the initiator to use any portal through which the target is accessible to the initiator. If the caller specifies the value for <i>TargetPortal</i>, the iSCSI initiator service will not verify that the <i>TargetPortal</i> is accessible to the initiator HBA.
     * @param {Integer} SecurityFlags A bitmap that specifies the characteristics of the IPsec connection that the initiator adds to the session. If an IPsec security policy between the initiator and the target portal is already configured as a result of the current portal group policy or a previous connection to the target, the existing configuration takes precedence over the configuration specified in <i>SecurityFlags</i>. 
     * 
     * If the ISCSI_SECURITY_FLAG_VALID flag is set to 0, the iSCSI initiator service uses default values for the security flags that are defined in the registry. 
     * 
     * Caller can set any of the following flags in the bitmap: 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED"></a><a id="iscsi_security_flag_tunnel_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection in IPsec tunnel mode. Caller should set this flag or the ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED"></a><a id="iscsi_security_flag_transport_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection in IPsec transport mode. Caller should set this flag or the ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_PFS_ENABLED"></a><a id="iscsi_security_flag_pfs_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_PFS_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with Perfect Forward Secrecy (PFS) mode enabled; otherwise, the initiator should make the connection with PFS mode disabled. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED"></a><a id="iscsi_security_flag_aggressive_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with aggressive mode enabled. Caller should set this flag or the ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED flag, but not both. 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  The Microsoft software initiator driver does not support aggressive mode.
     * </div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED"></a><a id="iscsi_security_flag_main_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with main mode enabled. Caller should set this flag or the ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED"></a><a id="iscsi_security_flag_ike_ipsec_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with the IKE/IPsec protocol enabled; otherwise, the IKE/IPsec protocol is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_VALID"></a><a id="iscsi_security_flag_valid"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the other mask values are valid; otherwise, the iSCSI initiator service will use bitmap values that were previously defined for the target portal, or if none are available, the initiator service uses the default values defined in the registry. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<ISCSI_TARGET_MAPPINGW>} Mappings An array of structures of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_mappinga">ISCSI_TARGET_MAPPING</a>, each of which holds information that the initiator uses to assign bus, target and LUN numbers to the devices that are associated with the target. If <i>Mappings</i> is <b>null</b>, the initiator will select the bus, target and LUN numbers.
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_login_options">ISCSI_LOGIN_OPTIONS</a> that contains the options that specify the characteristics of the login session.
     * @param {Integer} KeySize The size, in bytes, of the target's preshared key specified by the <i>Key</i> parameter.
     * @param {PSTR} Key A preshared key to use when logging in to the target portal that exposes this target. 
     * 
     * <div class="alert"><b>Note</b>  If an IPsec policy is already associated with the target portal, the IPsec settings in this call are ignored.</div>
     * <div> </div>
     * @param {BOOLEAN} IsPersistent If <b>true</b>, the initiator should save the characteristics of the login session in non-volatile storage, so that the information persists across restarts of the initiator device and reboots of the operating system. The initiator should not establish the login session until after saving the persistent data. 
     * 
     * Whenever the initiator device restarts, it should automatically attempt to re-establish the login session with the same characteristics. If <b>false</b>, the initiator device simply logs in to the target without saving the characteristics of the login session.
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId A pointer to a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> that, on return, contains a unique session identifier for the login session.
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueConnectionId A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb870817(v=vs.85)">ISCSI_UNIQUE_CONNECTION_ID</a> that, on return, contains a unique connection identifier for the login session.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-loginiscsitargetw
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
     * LoginIscsiTarget function establishes a full featured login session with the indicated target. (ANSI)
     * @remarks
     * The <b>LoginIscsiTarget</b> function either establishes a single login session with a target, or creates a persistent login to a target. If <b>LoginIscsiTarget</b> creates a persistent login, the specified initiator should log in to the target each time the initiator is started, typically at system boot. Callers to <b>LoginIscsiTarget</b> can request the creation of a persistent login by setting the <i>IsPersistent</i> parameter to <b>true</b>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines LoginIScsiTarget as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} TargetName The name of the target with which to establish a login session. The target must already exist in the list of discovered targets for the iSCSI initiator service.
     * @param {BOOLEAN} IsInformationalSession If <b>true</b>, the <b>LoginIscsiTarget</b> function establishes a login session, but the operation does not report the LUNs on the target to the "Plug and Play" Manager. If the login succeeds, management applications will be able to query the target for information with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-sendscsireportluns">SendScsiReportLuns</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-sendscsireadcapacity">SendScsiReadCapacity</a> functions, but the storage stack will not enumerate the target or load a driver for it. 
     * 
     * If <i>IsInformationalSession</i> is <b>false</b>, <b>LoginIscsiTarget</b> reports the LUNs associated with the target to the "Plug and Play" Manager, and the system loads drivers for the LUNs.
     * @param {PSTR} InitiatorInstance The name of the initiator that logs in to the target. If <i>InitiatorName</i> is <b>null</b>, the iSCSI initiator service selects an initiator.
     * @param {Integer} InitiatorPortNumber The port number of the Host Bus Adapter (HBA) that initiates the login session. If this parameter is <b>ISCSI_ANY_INITIATOR_PORT</b>, the caller did not specify a port for the initiator HBA to use when logging in to the target. 
     * 
     * If <i>InitiatorName</i> is <b>null</b>, <i>InitiatorPortNumber</i> must be <b>ISCSI_ANY_INITIATOR_PORT</b>.
     * @param {Pointer<ISCSI_TARGET_PORTALA>} TargetPortal Pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portala">ISCSI_TARGET_PORTAL</a> that indicates the portal that the initiator uses to open the session. The specified portal must belong to a portal group that is associated with the <i>TargetName</i>. If <i>TargetPortal</i> is <b>null</b>, the iSCSI initiator service instructs the initiator to use any portal through which the target is accessible to the initiator. If the caller specifies the value for <i>TargetPortal</i>, the iSCSI initiator service will not verify that the <i>TargetPortal</i> is accessible to the initiator HBA.
     * @param {Integer} SecurityFlags A bitmap that specifies the characteristics of the IPsec connection that the initiator adds to the session. If an IPsec security policy between the initiator and the target portal is already configured as a result of the current portal group policy or a previous connection to the target, the existing configuration takes precedence over the configuration specified in <i>SecurityFlags</i>. 
     * 
     * If the ISCSI_SECURITY_FLAG_VALID flag is set to 0, the iSCSI initiator service uses default values for the security flags that are defined in the registry. 
     * 
     * Caller can set any of the following flags in the bitmap: 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED"></a><a id="iscsi_security_flag_tunnel_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection in IPsec tunnel mode. Caller should set this flag or the ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED"></a><a id="iscsi_security_flag_transport_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection in IPsec transport mode. Caller should set this flag or the ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_PFS_ENABLED"></a><a id="iscsi_security_flag_pfs_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_PFS_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with Perfect Forward Secrecy (PFS) mode enabled; otherwise, the initiator should make the connection with PFS mode disabled. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED"></a><a id="iscsi_security_flag_aggressive_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with aggressive mode enabled. Caller should set this flag or the ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED flag, but not both. 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  The Microsoft software initiator driver does not support aggressive mode.
     * </div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED"></a><a id="iscsi_security_flag_main_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with main mode enabled. Caller should set this flag or the ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED"></a><a id="iscsi_security_flag_ike_ipsec_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with the IKE/IPsec protocol enabled; otherwise, the IKE/IPsec protocol is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_VALID"></a><a id="iscsi_security_flag_valid"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the other mask values are valid; otherwise, the iSCSI initiator service will use bitmap values that were previously defined for the target portal, or if none are available, the initiator service uses the default values defined in the registry. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<ISCSI_TARGET_MAPPINGA>} Mappings An array of structures of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_mappinga">ISCSI_TARGET_MAPPING</a>, each of which holds information that the initiator uses to assign bus, target and LUN numbers to the devices that are associated with the target. If <i>Mappings</i> is <b>null</b>, the initiator will select the bus, target and LUN numbers.
     * @param {Pointer<ISCSI_LOGIN_OPTIONS>} LoginOptions A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_login_options">ISCSI_LOGIN_OPTIONS</a> that contains the options that specify the characteristics of the login session.
     * @param {Integer} KeySize The size, in bytes, of the target's preshared key specified by the <i>Key</i> parameter.
     * @param {PSTR} Key A preshared key to use when logging in to the target portal that exposes this target. 
     * 
     * <div class="alert"><b>Note</b>  If an IPsec policy is already associated with the target portal, the IPsec settings in this call are ignored.</div>
     * <div> </div>
     * @param {BOOLEAN} IsPersistent If <b>true</b>, the initiator should save the characteristics of the login session in non-volatile storage, so that the information persists across restarts of the initiator device and reboots of the operating system. The initiator should not establish the login session until after saving the persistent data. 
     * 
     * Whenever the initiator device restarts, it should automatically attempt to re-establish the login session with the same characteristics. If <b>false</b>, the initiator device simply logs in to the target without saving the characteristics of the login session.
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId A pointer to a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> that, on return, contains a unique session identifier for the login session.
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueConnectionId A pointer to a structure of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb870817(v=vs.85)">ISCSI_UNIQUE_CONNECTION_ID</a> that, on return, contains a unique connection identifier for the login session.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-loginiscsitargeta
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
     * ReportIscsiPersistentLogins function retrieves the list of persistent login targets. (Unicode)
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-persistent_iscsi_login_infoa">PERSISTENT_ISCSI_LOGIN_INFO</a> structure provides an initiator with the information required to log in to a target each time the initiator device is started.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportIScsiPersistentLogins as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} Count A pointer to the location that receives a count of the elements specified by  <i>PersistentLoginInfo</i>.
     * @param {Pointer<PERSISTENT_ISCSI_LOGIN_INFOW>} PersistentLoginInfo An array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-persistent_iscsi_login_infoa">PERSISTENT_ISCSI_LOGIN_INFO</a> structures that, on output, describe the persistent login targets.
     * @param {Pointer<Integer>} BufferSizeInBytes A pointer to a location that, on input, contains the byte-size of the buffer space that <i>PersistentLoginInfo</i>  specifies. If the buffer size is insufficient, this parameter specifies what is  required to contain the output data.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer specified by <i>PersistentLoginInfo</i> is insufficient to contain the output data. 
     * 
     * Otherwise, <b>ReportIscsiPersistentLogins</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportiscsipersistentloginsw
     * @since windows6.0.6000
     */
    static ReportIScsiPersistentLoginsW(Count, PersistentLoginInfo, BufferSizeInBytes) {
        CountMarshal := Count is VarRef ? "uint*" : "ptr"
        BufferSizeInBytesMarshal := BufferSizeInBytes is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportIScsiPersistentLoginsW", CountMarshal, Count, "ptr", PersistentLoginInfo, BufferSizeInBytesMarshal, BufferSizeInBytes, "uint")
        return result
    }

    /**
     * ReportIscsiPersistentLogins function retrieves the list of persistent login targets. (ANSI)
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-persistent_iscsi_login_infoa">PERSISTENT_ISCSI_LOGIN_INFO</a> structure provides an initiator with the information required to log in to a target each time the initiator device is started.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportIScsiPersistentLogins as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} Count A pointer to the location that receives a count of the elements specified by  <i>PersistentLoginInfo</i>.
     * @param {Pointer<PERSISTENT_ISCSI_LOGIN_INFOA>} PersistentLoginInfo An array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-persistent_iscsi_login_infoa">PERSISTENT_ISCSI_LOGIN_INFO</a> structures that, on output, describe the persistent login targets.
     * @param {Pointer<Integer>} BufferSizeInBytes A pointer to a location that, on input, contains the byte-size of the buffer space that <i>PersistentLoginInfo</i>  specifies. If the buffer size is insufficient, this parameter specifies what is  required to contain the output data.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer specified by <i>PersistentLoginInfo</i> is insufficient to contain the output data. 
     * 
     * Otherwise, <b>ReportIscsiPersistentLogins</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportiscsipersistentloginsa
     * @since windows6.0.6000
     */
    static ReportIScsiPersistentLoginsA(Count, PersistentLoginInfo, BufferSizeInBytes) {
        CountMarshal := Count is VarRef ? "uint*" : "ptr"
        BufferSizeInBytesMarshal := BufferSizeInBytes is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportIScsiPersistentLoginsA", CountMarshal, Count, "ptr", PersistentLoginInfo, BufferSizeInBytesMarshal, BufferSizeInBytes, "uint")
        return result
    }

    /**
     * The LogoutIscsiTarget routine closes the specified login session.
     * @remarks
     * If the login session is not for informational purposes, the iSCSI initiator service ensures that all devices associated with the session can be safely removed from the device stack before allowing the initiator to close the session. If the session is an informational session, the iSCSI initiator service closes the session immediately.
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId A pointer to a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> that contains a unique session identifier for the login session end.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-logoutiscsitarget
     * @since windows6.0.6000
     */
    static LogoutIScsiTarget(UniqueSessionId) {
        result := DllCall("ISCSIDSC.dll\LogoutIScsiTarget", "ptr", UniqueSessionId, "uint")
        return result
    }

    /**
     * RemoveIscsiPersistentTarget function removes a persistent login for the specified hardware initiator Host Bus Adapter (HBA), initiator port, and target portal. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines RemoveIScsiPersistentTarget as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} InitiatorInstance The name of the initiator that maintains the persistent login to remove.
     * @param {Integer} InitiatorPortNumber The port number on which the initiator connects to <i>TargetName</i>. If <i>InitiatorPortNumber</i> is <b>ISCSI_ALL_INITIATOR_PORTS</b> the miniport driver for the initiator HBA removes the <i>TargetName</i> from the persistent login lists for all initiator ports.
     * @param {PWSTR} TargetName The name of the target.
     * @param {Pointer<ISCSI_TARGET_PORTALW>} Portal The portal through which the initiator connects to the target. If <i>Portal</i> is <b>null</b> or contains no information, the miniport driver for the initiator HBA removes persistent logins for the target on all portals.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-removeiscsipersistenttargetw
     * @since windows6.0.6000
     */
    static RemoveIScsiPersistentTargetW(InitiatorInstance, InitiatorPortNumber, TargetName, Portal) {
        InitiatorInstance := InitiatorInstance is String ? StrPtr(InitiatorInstance) : InitiatorInstance
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        result := DllCall("ISCSIDSC.dll\RemoveIScsiPersistentTargetW", "ptr", InitiatorInstance, "uint", InitiatorPortNumber, "ptr", TargetName, "ptr", Portal, "uint")
        return result
    }

    /**
     * RemoveIscsiPersistentTarget function removes a persistent login for the specified hardware initiator Host Bus Adapter (HBA), initiator port, and target portal. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines RemoveIScsiPersistentTarget as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} InitiatorInstance The name of the initiator that maintains the persistent login to remove.
     * @param {Integer} InitiatorPortNumber The port number on which the initiator connects to <i>TargetName</i>. If <i>InitiatorPortNumber</i> is <b>ISCSI_ALL_INITIATOR_PORTS</b> the miniport driver for the initiator HBA removes the <i>TargetName</i> from the persistent login lists for all initiator ports.
     * @param {PSTR} TargetName The name of the target.
     * @param {Pointer<ISCSI_TARGET_PORTALA>} Portal The portal through which the initiator connects to the target. If <i>Portal</i> is <b>null</b> or contains no information, the miniport driver for the initiator HBA removes persistent logins for the target on all portals.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-removeiscsipersistenttargeta
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
     * @param {Pointer<Integer>} ScsiStatus A pointer to a location that reports the execution status of the CDB.
     * @param {Pointer<Integer>} ResponseSize A pointer to the location that, on input, specifies the byte-size of  <i>ResponseBuffer</i>. On output, this location specifies the number of bytes required to contain the response data for the READ CAPACITY command in the <i>ResponseBuffer</i>.
     * @param {Pointer<Integer>} ResponseBuffer The buffer that holds the inquiry data.
     * @param {Pointer<Integer>} SenseSize A pointer to a location that, on input, contains the byte-size of <i>SenseBuffer</i>. On output, the location pointed to receives the byte-size required for  <i>SenseBuffer</i>  to contain the sense data. This value will always be greater than or equal to 18 bytes.
     * @param {Pointer<Integer>} SenseBuffer The buffer that holds the sense data.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer specified by <i>ResponseBuffer</i> is insufficient to contain the sense data.
     * 
     * 
     * 
     * If the device returns a SCSI error while processing the REPORT LUNS request, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-sendscsireportluns">SendScsiReportLuns</a> returns an error code of ISDSC_SCSI_REQUEST_FAILED, and the locations pointed to by <i>ScsiStatus</i> and <i>SenseBuffer</i> contain information detailing the SCSI error.
     * 
     *  
     * 
     * Otherwise, <b>SendScsiInquiry</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-sendscsiinquiry
     * @since windows6.0.6000
     */
    static SendScsiInquiry(UniqueSessionId, Lun, EvpdCmddt, PageCode, ScsiStatus, ResponseSize, ResponseBuffer, SenseSize, SenseBuffer) {
        ScsiStatusMarshal := ScsiStatus is VarRef ? "char*" : "ptr"
        ResponseSizeMarshal := ResponseSize is VarRef ? "uint*" : "ptr"
        ResponseBufferMarshal := ResponseBuffer is VarRef ? "char*" : "ptr"
        SenseSizeMarshal := SenseSize is VarRef ? "uint*" : "ptr"
        SenseBufferMarshal := SenseBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("ISCSIDSC.dll\SendScsiInquiry", "ptr", UniqueSessionId, "uint", Lun, "char", EvpdCmddt, "char", PageCode, ScsiStatusMarshal, ScsiStatus, ResponseSizeMarshal, ResponseSize, ResponseBufferMarshal, ResponseBuffer, SenseSizeMarshal, SenseSize, SenseBufferMarshal, SenseBuffer, "uint")
        return result
    }

    /**
     * SendScsiReadCapacity function sends a SCSI READ CAPACITY command to the indicated target.
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> structure containing the session identifier for the login session specific to the target to which the READ CAPACITY command is sent.
     * @param {Integer} Lun The logical unit on the target to query with the READ CAPACITY command.
     * @param {Pointer<Integer>} ScsiStatus A pointer to a location that contains the execution status of the CDB.
     * @param {Pointer<Integer>} ResponseSize A pointer to the location that, on input, specifies the byte-size of  <i>ResponseBuffer</i>. On output, this location specifies the number of bytes required to contain the response data for the READ CAPACITY command in the <i>ResponseBuffer</i>.
     * @param {Pointer<Integer>} ResponseBuffer The buffer that receives the response data from the READ CAPACITY command.
     * @param {Pointer<Integer>} SenseSize A pointer to a location that, on input, contains the byte-size of <i>SenseBuffer</i>. On output, the location pointed to receives the byte-size required for  <i>SenseBuffer</i>  to contain the sense data. This value will always be greater than or equal to 18 bytes.
     * @param {Pointer<Integer>} SenseBuffer The buffer that receives the sense data.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer specified by <i>ResponseBuffer</i> is insufficient to contain the sense data.
     * 
     * 
     * 
     * If the device returns a SCSI error while processing the REPORT LUNS request, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-sendscsireportluns">SendScsiReportLuns</a> returns an error code of ISDSC_SCSI_REQUEST_FAILED, and the locations pointed to by <i>ScsiStatus</i> and <i>SenseBuffer</i> contain information detailing the SCSI error.
     * 
     *  
     * 
     * Otherwise, this function returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-sendscsireadcapacity
     * @since windows6.0.6000
     */
    static SendScsiReadCapacity(UniqueSessionId, Lun, ScsiStatus, ResponseSize, ResponseBuffer, SenseSize, SenseBuffer) {
        ScsiStatusMarshal := ScsiStatus is VarRef ? "char*" : "ptr"
        ResponseSizeMarshal := ResponseSize is VarRef ? "uint*" : "ptr"
        ResponseBufferMarshal := ResponseBuffer is VarRef ? "char*" : "ptr"
        SenseSizeMarshal := SenseSize is VarRef ? "uint*" : "ptr"
        SenseBufferMarshal := SenseBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("ISCSIDSC.dll\SendScsiReadCapacity", "ptr", UniqueSessionId, "uint", Lun, ScsiStatusMarshal, ScsiStatus, ResponseSizeMarshal, ResponseSize, ResponseBufferMarshal, ResponseBuffer, SenseSizeMarshal, SenseSize, SenseBufferMarshal, SenseBuffer, "uint")
        return result
    }

    /**
     * SendScsiReportLuns function sends a SCSI REPORT LUNS command to a specified target.
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> structure that contains the session identifier for the login session of the target to query with the SCSI REPORT LUNS command.
     * @param {Pointer<Integer>} ScsiStatus A pointer to the location that receives the execution status of the CDB.
     * @param {Pointer<Integer>} ResponseSize A pointer to the location that, on input, specifies the byte-size of  <i>ResponseBuffer</i>. On output, this location specifies the number of bytes required to contain the response data for the READ CAPACITY command in the <i>ResponseBuffer</i>.
     * @param {Pointer<Integer>} ResponseBuffer The buffer that receives  response data for the READ CAPACITY command.
     * @param {Pointer<Integer>} SenseSize A pointer to a location that, on input, contains the byte-size of <i>SenseBuffer</i>. On output, the location pointed to receives the byte-size required for  <i>SenseBuffer</i>  to contain the sense data. This value will always be greater than or equal to 18 bytes.
     * @param {Pointer<Integer>} SenseBuffer The buffer that receives the sense data.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer specified by <i>ResponseBuffer</i> is insufficient to hold the sense data.
     * 
     * 
     * 
     * If the device returns a SCSI error while processing the REPORT LUNS request, <b>SendScsiReportLuns</b> returns an error code of ISDSC_SCSI_REQUEST_FAILED, and the locations pointed to by <i>ScsiStatus</i> and <i>SenseBuffer</i> contain information detailing the SCSI error.
     * 
     *  
     * 
     * Otherwise, this function returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-sendscsireportluns
     * @since windows6.0.6000
     */
    static SendScsiReportLuns(UniqueSessionId, ScsiStatus, ResponseSize, ResponseBuffer, SenseSize, SenseBuffer) {
        ScsiStatusMarshal := ScsiStatus is VarRef ? "char*" : "ptr"
        ResponseSizeMarshal := ResponseSize is VarRef ? "uint*" : "ptr"
        ResponseBufferMarshal := ResponseBuffer is VarRef ? "char*" : "ptr"
        SenseSizeMarshal := SenseSize is VarRef ? "uint*" : "ptr"
        SenseBufferMarshal := SenseBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("ISCSIDSC.dll\SendScsiReportLuns", "ptr", UniqueSessionId, ScsiStatusMarshal, ScsiStatus, ResponseSizeMarshal, ResponseSize, ResponseBufferMarshal, ResponseBuffer, SenseSizeMarshal, SenseSize, SenseBufferMarshal, SenseBuffer, "uint")
        return result
    }

    /**
     * ReportIscsiInitiatorList function retrieves the list of initiator Host Bus Adapters that are running on the machine. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportIScsiInitiatorList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} BufferSize A <b>ULONG</b> value that specifies the number of list elements contained by the <i>Buffer</i> parameter. 
     * If the operation succeeds, this location receives the size, represented by a number of elements, that corresponds to the retreived data.
     * @param {PWSTR} Buffer_R 
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer size of Buffer is insufficient to contain the output data.
     * 
     *  Otherwise, <b>ReportIscsiInitiatorList</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportiscsiinitiatorlistw
     * @since windows6.0.6000
     */
    static ReportIScsiInitiatorListW(BufferSize, Buffer_R) {
        Buffer_R := Buffer_R is String ? StrPtr(Buffer_R) : Buffer_R

        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportIScsiInitiatorListW", BufferSizeMarshal, BufferSize, "ptr", Buffer_R, "uint")
        return result
    }

    /**
     * ReportIscsiInitiatorList function retrieves the list of initiator Host Bus Adapters that are running on the machine. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportIScsiInitiatorList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} BufferSize A <b>ULONG</b> value that specifies the number of list elements contained by the <i>Buffer</i> parameter. 
     * If the operation succeeds, this location receives the size, represented by a number of elements, that corresponds to the retreived data.
     * @param {PSTR} Buffer_R 
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer size of Buffer is insufficient to contain the output data.
     * 
     *  Otherwise, <b>ReportIscsiInitiatorList</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportiscsiinitiatorlista
     * @since windows6.0.6000
     */
    static ReportIScsiInitiatorListA(BufferSize, Buffer_R) {
        Buffer_R := Buffer_R is String ? StrPtr(Buffer_R) : Buffer_R

        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportIScsiInitiatorListA", BufferSizeMarshal, BufferSize, "ptr", Buffer_R, "uint")
        return result
    }

    /**
     * ReportActiveIscsiTargetMappings function retrieves the target mappings that are currently active for all initiators on the computer. (Unicode)
     * @remarks
     * Target mappings associate bus, target and LUN numbers with the LUNs on a target device.
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportActiveIScsiTargetMappings as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} BufferSize A pointer to a location that, on input, contains the size, in bytes, of the buffer that <i>Mappings</i> points to. If the operation succeeds, the location receives the size, in bytes, of the mapping data that was retrieved. If the buffer  that <i>Mappings</i> points to is not sufficient to contain the output data, the location receives the buffer size, in bytes, that is required.
     * @param {Pointer<Integer>} MappingCount If the operation succeeds, the location pointed to by <i>MappingCount</i> receives the number of mappings that were retrieved.
     * @param {Pointer<ISCSI_TARGET_MAPPINGW>} Mappings A pointer to an array of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_mappinga">ISCSI_TARGET_MAPPING</a> that, on output, is filled with the active target mappings for all initiators.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer is not large enough.
     * 
     * Otherwise, <b>ReportActiveIscsiTargetMappings</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportactiveiscsitargetmappingsw
     * @since windows6.0.6000
     */
    static ReportActiveIScsiTargetMappingsW(BufferSize, MappingCount, Mappings) {
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"
        MappingCountMarshal := MappingCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportActiveIScsiTargetMappingsW", BufferSizeMarshal, BufferSize, MappingCountMarshal, MappingCount, "ptr", Mappings, "uint")
        return result
    }

    /**
     * ReportActiveIscsiTargetMappings function retrieves the target mappings that are currently active for all initiators on the computer. (ANSI)
     * @remarks
     * Target mappings associate bus, target and LUN numbers with the LUNs on a target device.
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportActiveIScsiTargetMappings as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} BufferSize A pointer to a location that, on input, contains the size, in bytes, of the buffer that <i>Mappings</i> points to. If the operation succeeds, the location receives the size, in bytes, of the mapping data that was retrieved. If the buffer  that <i>Mappings</i> points to is not sufficient to contain the output data, the location receives the buffer size, in bytes, that is required.
     * @param {Pointer<Integer>} MappingCount If the operation succeeds, the location pointed to by <i>MappingCount</i> receives the number of mappings that were retrieved.
     * @param {Pointer<ISCSI_TARGET_MAPPINGA>} Mappings A pointer to an array of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_mappinga">ISCSI_TARGET_MAPPING</a> that, on output, is filled with the active target mappings for all initiators.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer is not large enough.
     * 
     * Otherwise, <b>ReportActiveIscsiTargetMappings</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportactiveiscsitargetmappingsa
     * @since windows6.0.6000
     */
    static ReportActiveIScsiTargetMappingsA(BufferSize, MappingCount, Mappings) {
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"
        MappingCountMarshal := MappingCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportActiveIScsiTargetMappingsA", BufferSizeMarshal, BufferSize, MappingCountMarshal, MappingCount, "ptr", Mappings, "uint")
        return result
    }

    /**
     * SetIscsiTunnelModeOuterAddress function establishes the tunnel-mode outer address that the indicated initiator Host Bus Adapter (HBA) uses when communicating in IPsec tunnel mode through the specified port. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines SetIScsiTunnelModeOuterAddress as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} InitiatorName The name of the initiator with which the tunnel-mode outer address will be associated. If this parameter is <b>null</b>, all HBA initiators are configured to use the indicated tunnel-mode outer address.
     * @param {Integer} InitiatorPortNumber Indicates the number of the port with which the tunnel-mode outer address is associated. If this parameter contains <b>ISCSI_ALL_PORTS</b>, all ports on the indicated initiator are associated with the tunnel-mode outer address.
     * @param {PWSTR} DestinationAddress The destination address to associate with the tunnel-mode outer address indicated by <i>OuterModeAddress</i>.
     * @param {PWSTR} OuterModeAddress The tunnel-mode outer address to associate with indicated initiators and ports.
     * @param {BOOLEAN} Persist When <b>true</b>, this parameter indicates that the iSCSI initiator service stores the tunnel-mode outer address in non-volatile memory and that the address will persist across restarts of the initiator and the iSCSI initiator service.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds.Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-setiscsitunnelmodeouteraddressw
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
     * SetIscsiTunnelModeOuterAddress function establishes the tunnel-mode outer address that the indicated initiator Host Bus Adapter (HBA) uses when communicating in IPsec tunnel mode through the specified port. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines SetIScsiTunnelModeOuterAddress as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} InitiatorName The name of the initiator with which the tunnel-mode outer address will be associated. If this parameter is <b>null</b>, all HBA initiators are configured to use the indicated tunnel-mode outer address.
     * @param {Integer} InitiatorPortNumber Indicates the number of the port with which the tunnel-mode outer address is associated. If this parameter contains <b>ISCSI_ALL_PORTS</b>, all ports on the indicated initiator are associated with the tunnel-mode outer address.
     * @param {PSTR} DestinationAddress The destination address to associate with the tunnel-mode outer address indicated by <i>OuterModeAddress</i>.
     * @param {PSTR} OuterModeAddress The tunnel-mode outer address to associate with indicated initiators and ports.
     * @param {BOOLEAN} Persist When <b>true</b>, this parameter indicates that the iSCSI initiator service stores the tunnel-mode outer address in non-volatile memory and that the address will persist across restarts of the initiator and the iSCSI initiator service.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds.Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-setiscsitunnelmodeouteraddressa
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
     * SetIscsiIKEInfo function establishes the IPsec policy and preshared key for the indicated initiator to use when performing iSCSI connections. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines SetIScsiIKEInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} InitiatorName The name of the initiator HBA for which the IPsec policy is established.
     * @param {Integer} InitiatorPortNumber The port on the initiator HBA with which to associate the key. If this parameter contains a value of <b>ISCSI_ALL_INITIATOR_PORTS</b>, all ports on the initiator are associated with the key.
     * @param {Pointer<IKE_AUTHENTICATION_INFORMATION>} AuthInfo A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-ike_authentication_information">IKE_AUTHENTICATION_INFORMATION</a> structure that contains the authentication method. Currently, only the IKE_AUTHENTICATION_PRESHARED_KEY_METHOD is supported.
     * @param {BOOLEAN} Persist If <b>true</b>, this parameter indicates that the preshared key information will be stored in non-volatile memory and will persist across restarts of the computer or the iSCSI initiator service.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-setiscsiikeinfow
     * @since windows6.0.6000
     */
    static SetIScsiIKEInfoW(InitiatorName, InitiatorPortNumber, AuthInfo, Persist) {
        InitiatorName := InitiatorName is String ? StrPtr(InitiatorName) : InitiatorName

        result := DllCall("ISCSIDSC.dll\SetIScsiIKEInfoW", "ptr", InitiatorName, "uint", InitiatorPortNumber, "ptr", AuthInfo, "char", Persist, "uint")
        return result
    }

    /**
     * SetIscsiIKEInfo function establishes the IPsec policy and preshared key for the indicated initiator to use when performing iSCSI connections. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines SetIScsiIKEInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} InitiatorName The name of the initiator HBA for which the IPsec policy is established.
     * @param {Integer} InitiatorPortNumber The port on the initiator HBA with which to associate the key. If this parameter contains a value of <b>ISCSI_ALL_INITIATOR_PORTS</b>, all ports on the initiator are associated with the key.
     * @param {Pointer<IKE_AUTHENTICATION_INFORMATION>} AuthInfo A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-ike_authentication_information">IKE_AUTHENTICATION_INFORMATION</a> structure that contains the authentication method. Currently, only the IKE_AUTHENTICATION_PRESHARED_KEY_METHOD is supported.
     * @param {BOOLEAN} Persist If <b>true</b>, this parameter indicates that the preshared key information will be stored in non-volatile memory and will persist across restarts of the computer or the iSCSI initiator service.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-setiscsiikeinfoa
     * @since windows6.0.6000
     */
    static SetIScsiIKEInfoA(InitiatorName, InitiatorPortNumber, AuthInfo, Persist) {
        InitiatorName := InitiatorName is String ? StrPtr(InitiatorName) : InitiatorName

        result := DllCall("ISCSIDSC.dll\SetIScsiIKEInfoA", "ptr", InitiatorName, "uint", InitiatorPortNumber, "ptr", AuthInfo, "char", Persist, "uint")
        return result
    }

    /**
     * GetIscsiIKEInfo function retrieves the IPsec policy and any established pre-shared key values associated with an initiator Host-Bus Adapter (HBA). (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines GetIScsiIKEInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} InitiatorName A string that represents the name of the initiator HBA for which the IPsec policy is established.
     * @param {Integer} InitiatorPortNumber A <b>ULONG</b> value that represents the port on the initiator HBA with which to associate the key. If this parameter specifies a value of <b>ISCSI_ALL_INITIATOR_PORTS</b>, all ports on the initiator are associated with the key.
     * @param {Pointer<Integer>} Reserved This value is reserved.
     * @param {Pointer<IKE_AUTHENTICATION_INFORMATION>} AuthInfo A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-ike_authentication_information">IKE_AUTHENTICATION_INFORMATION</a> structure that contains data specifying the authentication method. Currently, only the <b>IKE_AUTHENTICATION_PRESHARED_KEY_METHOD</b> is supported.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-getiscsiikeinfow
     * @since windows6.0.6000
     */
    static GetIScsiIKEInfoW(InitiatorName, InitiatorPortNumber, Reserved, AuthInfo) {
        InitiatorName := InitiatorName is String ? StrPtr(InitiatorName) : InitiatorName

        ReservedMarshal := Reserved is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\GetIScsiIKEInfoW", "ptr", InitiatorName, "uint", InitiatorPortNumber, ReservedMarshal, Reserved, "ptr", AuthInfo, "uint")
        return result
    }

    /**
     * GetIscsiIKEInfo function retrieves the IPsec policy and any established pre-shared key values associated with an initiator Host-Bus Adapter (HBA). (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines GetIScsiIKEInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} InitiatorName A string that represents the name of the initiator HBA for which the IPsec policy is established.
     * @param {Integer} InitiatorPortNumber A <b>ULONG</b> value that represents the port on the initiator HBA with which to associate the key. If this parameter specifies a value of <b>ISCSI_ALL_INITIATOR_PORTS</b>, all ports on the initiator are associated with the key.
     * @param {Pointer<Integer>} Reserved This value is reserved.
     * @param {Pointer<IKE_AUTHENTICATION_INFORMATION>} AuthInfo A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-ike_authentication_information">IKE_AUTHENTICATION_INFORMATION</a> structure that contains data specifying the authentication method. Currently, only the <b>IKE_AUTHENTICATION_PRESHARED_KEY_METHOD</b> is supported.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-getiscsiikeinfoa
     * @since windows6.0.6000
     */
    static GetIScsiIKEInfoA(InitiatorName, InitiatorPortNumber, Reserved, AuthInfo) {
        InitiatorName := InitiatorName is String ? StrPtr(InitiatorName) : InitiatorName

        ReservedMarshal := Reserved is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\GetIScsiIKEInfoA", "ptr", InitiatorName, "uint", InitiatorPortNumber, ReservedMarshal, Reserved, "ptr", AuthInfo, "uint")
        return result
    }

    /**
     * SetIscsiGroupPresharedKey function establishes the default group preshared key for all initiators on the computer.
     * @param {Integer} KeyLength The size, in bytes, of the preshared key.
     * @param {Pointer<Integer>} Key The buffer that contains the preshared key.
     * @param {BOOLEAN} Persist If <b>true</b>, this parameter indicates that the preshared key information will be stored in non-volatile memory and will persist across restarts of the computer or the iSCSI initiator service.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-setiscsigrouppresharedkey
     * @since windows6.0.6000
     */
    static SetIScsiGroupPresharedKey(KeyLength, Key, Persist) {
        KeyMarshal := Key is VarRef ? "char*" : "ptr"

        result := DllCall("ISCSIDSC.dll\SetIScsiGroupPresharedKey", "uint", KeyLength, KeyMarshal, Key, "char", Persist, "uint")
        return result
    }

    /**
     * The SetIscsiInitiatorCHAPSharedSecret function establishes the default Challenge Handshake Authentication Protocol (CHAP) shared secret for all initiators on the computer.
     * @remarks
     * When an initiator attempts to log in to a target, the initiator can issue a challenge if mutual CHAP is used. The target must respond to the challenge with the initiator CHAP shared secret.
     * 
     * The <b>SetIscsiInitiatorCHAPSharedSecret</b> function specifies the default CHAP secret that all initiators on the computer use to authenticate a target when performing mutual CHAP. Management software can specify the CHAP secret for the initiator to provide when challenged by the target when the initiator calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-loginiscsitargeta">LoginIscsiTarget</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-addiscsistatictargeta">AddIscsiStaticTarget</a> function.
     * @param {Integer} SharedSecretLength The size, in bytes, of the shared secret contained by the buffer specified by <i>SharedSecret</i>. The shared secret must be at least 96 bits (12 bytes) for non-IPsec connections, at least 8 bits (1 byte) for IPsec connections, and less than 128 bits (16 bytes) for all connection types.
     * @param {Pointer<Integer>} SharedSecret The buffer that contains the shared secret.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-setiscsiinitiatorchapsharedsecret
     * @since windows6.0.6000
     */
    static SetIScsiInitiatorCHAPSharedSecret(SharedSecretLength, SharedSecret) {
        SharedSecretMarshal := SharedSecret is VarRef ? "char*" : "ptr"

        result := DllCall("ISCSIDSC.dll\SetIScsiInitiatorCHAPSharedSecret", "uint", SharedSecretLength, SharedSecretMarshal, SharedSecret, "uint")
        return result
    }

    /**
     * SetIscsiInitiatorRADIUSSharedSecret function establishes the Remote Authentication Dial-In User Service (RADIUS) shared secret.
     * @remarks
     * When an initiator attempts to log in to a target, the initiator can use the RADIUS server for authentication, or to authenticate a target. During this process the initiator uses the <i>SharedSecret</i> to communicate with the RADIUS server.
     * @param {Integer} SharedSecretLength A <b>ULONG</b> value that represents the size, in bytes, of the shared secret contained by the buffer specified by SharedSecret. The shared secret must be at least 22 bytes, and less than, or equal to, 26 bytes in size.
     * @param {Pointer<Integer>} SharedSecret A string that specifies the buffer containing the shared secret.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-setiscsiinitiatorradiussharedsecret
     * @since windows6.0.6000
     */
    static SetIScsiInitiatorRADIUSSharedSecret(SharedSecretLength, SharedSecret) {
        SharedSecretMarshal := SharedSecret is VarRef ? "char*" : "ptr"

        result := DllCall("ISCSIDSC.dll\SetIScsiInitiatorRADIUSSharedSecret", "uint", SharedSecretLength, SharedSecretMarshal, SharedSecret, "uint")
        return result
    }

    /**
     * SetIscsiInitiatorNodeName function establishes an initiator node name for the computer. This name is utilized by any initiator nodes on the computer that are communicating with other nodes. (Unicode)
     * @remarks
     * The <b>SetIscsiInitiatorNodeName</b> routine does not verify that the format of the name in <i>InitiatorNodeName</i> is correct.
     * 
     * Some hardware initiator drivers can respond immediately to a change of the node name, while others must be restarted to finalize the change to the node name.
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines SetIScsiInitiatorNodeName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} InitiatorNodeName The initiator node name. If this parameter is <b>null</b>, initiators use a default initiator node name based upon the computer name.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-setiscsiinitiatornodenamew
     * @since windows6.0.6000
     */
    static SetIScsiInitiatorNodeNameW(InitiatorNodeName) {
        InitiatorNodeName := InitiatorNodeName is String ? StrPtr(InitiatorNodeName) : InitiatorNodeName

        result := DllCall("ISCSIDSC.dll\SetIScsiInitiatorNodeNameW", "ptr", InitiatorNodeName, "uint")
        return result
    }

    /**
     * SetIscsiInitiatorNodeName function establishes an initiator node name for the computer. This name is utilized by any initiator nodes on the computer that are communicating with other nodes. (ANSI)
     * @remarks
     * The <b>SetIscsiInitiatorNodeName</b> routine does not verify that the format of the name in <i>InitiatorNodeName</i> is correct.
     * 
     * Some hardware initiator drivers can respond immediately to a change of the node name, while others must be restarted to finalize the change to the node name.
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines SetIScsiInitiatorNodeName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} InitiatorNodeName The initiator node name. If this parameter is <b>null</b>, initiators use a default initiator node name based upon the computer name.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-setiscsiinitiatornodenamea
     * @since windows6.0.6000
     */
    static SetIScsiInitiatorNodeNameA(InitiatorNodeName) {
        InitiatorNodeName := InitiatorNodeName is String ? StrPtr(InitiatorNodeName) : InitiatorNodeName

        result := DllCall("ISCSIDSC.dll\SetIScsiInitiatorNodeNameA", "ptr", InitiatorNodeName, "uint")
        return result
    }

    /**
     * The GetIscsiInitiatorNodeName function retrieves the common initiator node name that is used when establishing sessions from the local machine. (Unicode)
     * @remarks
     * All initiator Host Bus Adapters, both software and hardware, use the same node name when establishing sessions.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines GetIScsiInitiatorNodeName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} InitiatorNodeName A caller-allocated buffer that, on output, receives the node name. The buffer must be large enough to hold <b>MAX_ISCSI_NAME_LEN+1</b> bytes.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and the appropriate Win32 or iSCSI error code if the operation fails.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-getiscsiinitiatornodenamew
     * @since windows6.0.6000
     */
    static GetIScsiInitiatorNodeNameW(InitiatorNodeName) {
        InitiatorNodeName := InitiatorNodeName is String ? StrPtr(InitiatorNodeName) : InitiatorNodeName

        result := DllCall("ISCSIDSC.dll\GetIScsiInitiatorNodeNameW", "ptr", InitiatorNodeName, "uint")
        return result
    }

    /**
     * The GetIscsiInitiatorNodeName function retrieves the common initiator node name that is used when establishing sessions from the local machine. (ANSI)
     * @remarks
     * All initiator Host Bus Adapters, both software and hardware, use the same node name when establishing sessions.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines GetIScsiInitiatorNodeName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} InitiatorNodeName A caller-allocated buffer that, on output, receives the node name. The buffer must be large enough to hold <b>MAX_ISCSI_NAME_LEN+1</b> bytes.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and the appropriate Win32 or iSCSI error code if the operation fails.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-getiscsiinitiatornodenamea
     * @since windows6.0.6000
     */
    static GetIScsiInitiatorNodeNameA(InitiatorNodeName) {
        InitiatorNodeName := InitiatorNodeName is String ? StrPtr(InitiatorNodeName) : InitiatorNodeName

        result := DllCall("ISCSIDSC.dll\GetIScsiInitiatorNodeNameA", "ptr", InitiatorNodeName, "uint")
        return result
    }

    /**
     * AddIsnsServer function adds a new server to the list of Internet Storage Name Service (iSNS) servers that the iSCSI initiator service uses to discover targets. (Unicode)
     * @remarks
     * When the iSCSI initiator service receives a request from the <b>AddIsnsServer</b> user-mode library function to add an iSNS server, the initiator service saves relevant data about the iSNS server in non-volatile storage. The iSCSI initiator service queries the newly added server for discovered targets immediately after adding it. From that point forward, the iSCSI initiator service automatically queries the iSNS server whenever the initiator service refreshes the target list of the iSNS server. The initiator service also refreshes the target list of the iSNS server at startup or whenever the iSNS server indicates a change.
     * 
     * If management software does not call <b>AddIsnsServer</b> to manually add the new iSNS servers to the service list of the iSCSI initiator service, the initiator service must rely on automatic discovery mechanisms, such as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/about-dynamic-host-configuration-protocol">DHCP</a>, to add new iSNS servers to the list.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines AddISNSServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} Address IP address or the DNS name of the server.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. If the operation fails, because of a problem with a socket connection, <b>AddIsnsServer</b> returns a Winsock error code. If the Address parameter does not point to a valid iSNS server name, the <b>AddIsnsServer</b> routine returns ERROR_INVALID_PARAMETER.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-addisnsserverw
     * @since windows6.0.6000
     */
    static AddISNSServerW(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\AddISNSServerW", "ptr", Address, "uint")
        return result
    }

    /**
     * AddIsnsServer function adds a new server to the list of Internet Storage Name Service (iSNS) servers that the iSCSI initiator service uses to discover targets. (ANSI)
     * @remarks
     * When the iSCSI initiator service receives a request from the <b>AddIsnsServer</b> user-mode library function to add an iSNS server, the initiator service saves relevant data about the iSNS server in non-volatile storage. The iSCSI initiator service queries the newly added server for discovered targets immediately after adding it. From that point forward, the iSCSI initiator service automatically queries the iSNS server whenever the initiator service refreshes the target list of the iSNS server. The initiator service also refreshes the target list of the iSNS server at startup or whenever the iSNS server indicates a change.
     * 
     * If management software does not call <b>AddIsnsServer</b> to manually add the new iSNS servers to the service list of the iSCSI initiator service, the initiator service must rely on automatic discovery mechanisms, such as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/about-dynamic-host-configuration-protocol">DHCP</a>, to add new iSNS servers to the list.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines AddISNSServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} Address IP address or the DNS name of the server.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. If the operation fails, because of a problem with a socket connection, <b>AddIsnsServer</b> returns a Winsock error code. If the Address parameter does not point to a valid iSNS server name, the <b>AddIsnsServer</b> routine returns ERROR_INVALID_PARAMETER.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-addisnsservera
     * @since windows6.0.6000
     */
    static AddISNSServerA(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\AddISNSServerA", "ptr", Address, "uint")
        return result
    }

    /**
     * RemoveIsnsServer function removes a server from the list of Internet Storage Name Service (iSNS) servers that the iSCSI initiator service uses to discover targets. (Unicode)
     * @remarks
     * The <b>RemoveIsnsServer</b> function does not affect the list of discovered targets for the iSCSI initiator service. Targets previously discovered by the iSNS server that is being removed remain on the list of discovered targets. However, the iSNS server is also removed from the persistent list of iSNS servers.
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines RemoveISNSServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} Address The DNS or IP Address of the server to remove.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-removeisnsserverw
     * @since windows6.0.6000
     */
    static RemoveISNSServerW(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\RemoveISNSServerW", "ptr", Address, "uint")
        return result
    }

    /**
     * RemoveIsnsServer function removes a server from the list of Internet Storage Name Service (iSNS) servers that the iSCSI initiator service uses to discover targets. (ANSI)
     * @remarks
     * The <b>RemoveIsnsServer</b> function does not affect the list of discovered targets for the iSCSI initiator service. Targets previously discovered by the iSNS server that is being removed remain on the list of discovered targets. However, the iSNS server is also removed from the persistent list of iSNS servers.
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines RemoveISNSServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} Address The DNS or IP Address of the server to remove.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-removeisnsservera
     * @since windows6.0.6000
     */
    static RemoveISNSServerA(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\RemoveISNSServerA", "ptr", Address, "uint")
        return result
    }

    /**
     * RefreshIsnsServer function instructs the iSCSI initiator service to query the indicated Internet Storage Name Service (iSNS) server to refresh the list of discovered targets for the iSCSI initiator service. (Unicode)
     * @remarks
     * If the refresh succeeds, the iSCSI initiator service replaces the previous list of targets discovered by the indicated iSNS server with the updated list.
     * 
     * If the iSNS server supports State Change Notifications (SCN), the iSCSI initiator can keep the iSNS target list up to date, without requiring calls of the <b>RefreshIsnsServer</b> function.
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines RefreshISNSServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} Address The DNS or IP Address of the iSNS server.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-refreshisnsserverw
     * @since windows6.0.6000
     */
    static RefreshISNSServerW(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\RefreshISNSServerW", "ptr", Address, "uint")
        return result
    }

    /**
     * RefreshIsnsServer function instructs the iSCSI initiator service to query the indicated Internet Storage Name Service (iSNS) server to refresh the list of discovered targets for the iSCSI initiator service. (ANSI)
     * @remarks
     * If the refresh succeeds, the iSCSI initiator service replaces the previous list of targets discovered by the indicated iSNS server with the updated list.
     * 
     * If the iSNS server supports State Change Notifications (SCN), the iSCSI initiator can keep the iSNS target list up to date, without requiring calls of the <b>RefreshIsnsServer</b> function.
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines RefreshISNSServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} Address The DNS or IP Address of the iSNS server.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-refreshisnsservera
     * @since windows6.0.6000
     */
    static RefreshISNSServerA(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\RefreshISNSServerA", "ptr", Address, "uint")
        return result
    }

    /**
     * ReportIsnsServerList function retrieves the list of Internet Storage Name Service (iSNS) servers that the iSCSI initiator service queries for discovered targets. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportISNSServerList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} BufferSizeInChar A <b>ULONG</b> value that specifies the number of list elements contained by the <i>Buffer</i> parameter. 
     * If the operation succeeds, this location receives the size, represented by a number of  elements, that corresponds to the number of retrieved iSNS servers.
     * @param {PWSTR} Buffer_R 
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer is too small to hold the output data. 
     * 
     * Otherwise, <b>ReportIsnsServerList</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportisnsserverlistw
     * @since windows6.0.6000
     */
    static ReportISNSServerListW(BufferSizeInChar, Buffer_R) {
        Buffer_R := Buffer_R is String ? StrPtr(Buffer_R) : Buffer_R

        BufferSizeInCharMarshal := BufferSizeInChar is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportISNSServerListW", BufferSizeInCharMarshal, BufferSizeInChar, "ptr", Buffer_R, "uint")
        return result
    }

    /**
     * ReportIsnsServerList function retrieves the list of Internet Storage Name Service (iSNS) servers that the iSCSI initiator service queries for discovered targets. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportISNSServerList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} BufferSizeInChar A <b>ULONG</b> value that specifies the number of list elements contained by the <i>Buffer</i> parameter. 
     * If the operation succeeds, this location receives the size, represented by a number of  elements, that corresponds to the number of retrieved iSNS servers.
     * @param {PSTR} Buffer_R 
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the buffer is too small to hold the output data. 
     * 
     * Otherwise, <b>ReportIsnsServerList</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportisnsserverlista
     * @since windows6.0.6000
     */
    static ReportISNSServerListA(BufferSizeInChar, Buffer_R) {
        Buffer_R := Buffer_R is String ? StrPtr(Buffer_R) : Buffer_R

        BufferSizeInCharMarshal := BufferSizeInChar is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportISNSServerListA", BufferSizeInCharMarshal, BufferSizeInChar, "ptr", Buffer_R, "uint")
        return result
    }

    /**
     * GetIscsiSessionList function retrieves the list of active iSCSI sessions. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines GetIScsiSessionList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} BufferSize A pointer to a location that, on input, contains the size, in bytes, of the caller-allocated buffer that <i>SessionInfo</i> points to. If the operation succeeds, the location receives the size, in bytes, of the session information data that was retrieved. 
     * 
     * If the operation fails because the output buffer size was insufficient, the location receives the size, in bytes, of the buffer size required to contain the output data.
     * @param {Pointer<Integer>} SessionCount A pointer to a location that, on input, contains the number of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_session_infoa">ISCSI_SESSION_INFO</a> structures that the buffer that <i>SessionInfo</i> points to can contain. If the operation succeeds, the location receives the number of <b>ISCSI_SESSION_INFO</b> structures that were retrieved.
     * @param {Pointer<ISCSI_SESSION_INFOW>} SessionInfo A pointer to a buffer that contains a series of contiguous structures of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_session_infoa">ISCSI_SESSION_INFO</a> that describe the active login sessions.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the size of the buffer at <i>SessionInfo</i> was insufficient to hold the output data. 
     * 
     * Otherwise, <b>GetIscsiSessionList</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-getiscsisessionlistw
     * @since windows6.0.6000
     */
    static GetIScsiSessionListW(BufferSize, SessionCount, SessionInfo) {
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"
        SessionCountMarshal := SessionCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\GetIScsiSessionListW", BufferSizeMarshal, BufferSize, SessionCountMarshal, SessionCount, "ptr", SessionInfo, "uint")
        return result
    }

    /**
     * GetIscsiSessionList function retrieves the list of active iSCSI sessions. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines GetIScsiSessionList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} BufferSize A pointer to a location that, on input, contains the size, in bytes, of the caller-allocated buffer that <i>SessionInfo</i> points to. If the operation succeeds, the location receives the size, in bytes, of the session information data that was retrieved. 
     * 
     * If the operation fails because the output buffer size was insufficient, the location receives the size, in bytes, of the buffer size required to contain the output data.
     * @param {Pointer<Integer>} SessionCount A pointer to a location that, on input, contains the number of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_session_infoa">ISCSI_SESSION_INFO</a> structures that the buffer that <i>SessionInfo</i> points to can contain. If the operation succeeds, the location receives the number of <b>ISCSI_SESSION_INFO</b> structures that were retrieved.
     * @param {Pointer<ISCSI_SESSION_INFOA>} SessionInfo A pointer to a buffer that contains a series of contiguous structures of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_session_infoa">ISCSI_SESSION_INFO</a> that describe the active login sessions.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the size of the buffer at <i>SessionInfo</i> was insufficient to hold the output data. 
     * 
     * Otherwise, <b>GetIscsiSessionList</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-getiscsisessionlista
     * @since windows6.0.6000
     */
    static GetIScsiSessionListA(BufferSize, SessionCount, SessionInfo) {
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"
        SessionCountMarshal := SessionCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\GetIScsiSessionListA", BufferSizeMarshal, BufferSize, SessionCountMarshal, SessionCount, "ptr", SessionInfo, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} BufferSize 
     * @param {Pointer<Integer>} SessionCountPtr 
     * @param {Pointer<ISCSI_SESSION_INFO_EX>} SessionInfo 
     * @returns {Integer} 
     */
    static GetIScsiSessionListEx(BufferSize, SessionCountPtr, SessionInfo) {
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"
        SessionCountPtrMarshal := SessionCountPtr is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\GetIScsiSessionListEx", BufferSizeMarshal, BufferSize, SessionCountPtrMarshal, SessionCountPtr, "ptr", SessionInfo, "uint")
        return result
    }

    /**
     * GetDevicesForIscsiSession function retrieves information about the devices associated with the current session. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines GetDevicesForIScsiSession as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId A pointer to a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> that contains the session identifier for the session.
     * @param {Pointer<Integer>} DeviceCount A pointer to a location that, on input, contains the number of elements of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_device_on_sessiona">ISCSI_DEVICE_ON_SESSION</a> that can fit in the buffer that <i>Devices</i> points to. If the operation succeeds, the location receives the number of elements retrieved. If <b>GetDevicesForIscsiSession</b> returns ERROR_INSUFFICIENT_BUFFER, the location still receives the number of elements the buffer is capable of containing.
     * @param {Pointer<ISCSI_DEVICE_ON_SESSIONW>} Devices An array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_device_on_sessiona">ISCSI_DEVICE_ON_SESSION</a>-type structures that, on output, receives information about each device associated with the session.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the caller allocated insufficient buffer space for the array in Devices. 
     * 
     * Otherwise, <b>GetDevicesForIscsiSession</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-getdevicesforiscsisessionw
     * @since windows6.0.6000
     */
    static GetDevicesForIScsiSessionW(UniqueSessionId, DeviceCount, Devices) {
        DeviceCountMarshal := DeviceCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\GetDevicesForIScsiSessionW", "ptr", UniqueSessionId, DeviceCountMarshal, DeviceCount, "ptr", Devices, "uint")
        return result
    }

    /**
     * GetDevicesForIscsiSession function retrieves information about the devices associated with the current session. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines GetDevicesForIScsiSession as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<ISCSI_UNIQUE_SESSION_ID>} UniqueSessionId A pointer to a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> that contains the session identifier for the session.
     * @param {Pointer<Integer>} DeviceCount A pointer to a location that, on input, contains the number of elements of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_device_on_sessiona">ISCSI_DEVICE_ON_SESSION</a> that can fit in the buffer that <i>Devices</i> points to. If the operation succeeds, the location receives the number of elements retrieved. If <b>GetDevicesForIscsiSession</b> returns ERROR_INSUFFICIENT_BUFFER, the location still receives the number of elements the buffer is capable of containing.
     * @param {Pointer<ISCSI_DEVICE_ON_SESSIONA>} Devices An array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_device_on_sessiona">ISCSI_DEVICE_ON_SESSION</a>-type structures that, on output, receives information about each device associated with the session.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ERROR_INSUFFICIENT_BUFFER if the caller allocated insufficient buffer space for the array in Devices. 
     * 
     * Otherwise, <b>GetDevicesForIscsiSession</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-getdevicesforiscsisessiona
     * @since windows6.0.6000
     */
    static GetDevicesForIScsiSessionA(UniqueSessionId, DeviceCount, Devices) {
        DeviceCountMarshal := DeviceCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\GetDevicesForIScsiSessionA", "ptr", UniqueSessionId, DeviceCountMarshal, DeviceCount, "ptr", Devices, "uint")
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
     * SetupPersistentIscsiDevices function builds the list of devices and volumes assigned to iSCSI targets that are connected to the computer, and saves this list in non-volatile cache of the iSCSI initiator service.
     * @remarks
     * When the iSCSI Initiator service starts, it does not complete initialization until the storage stack can access and enumerate all persistent iSCSI volumes and devices. If there is a service that is dependent on data stored on a persistent volume or device, it should be configured to have a dependency on the iSCSI service (MSiSCSI).
     * 
     * The correct procedure for a system administrator to configure a computer to use external persistent volumes is as follows:
     * 
     *  
     * 
     *  
     * 
     * 
     *  
     * 
     * 
     * 
     * <ul>
     * <li>Login to all of the targets that contain the volumes</li>
     * <li>Configure all volumes on top of the disks</li>
     * <li>Use management software to call the <b>SetupPersistentIscsiDevices</b> routine, so that the iSCSI initiator service will add the volumes to its list of persistent volumes.</li>
     * </ul>
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns the appropriate Win32 or iSCSI error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-setuppersistentiscsidevices
     * @since windows6.0.6000
     */
    static SetupPersistentIScsiDevices() {
        result := DllCall("ISCSIDSC.dll\SetupPersistentIScsiDevices", "uint")
        return result
    }

    /**
     * AddPersistentIscsiDevice function adds a volume device name, drive letter, or mount point symbolic link to the list of iSCSI persistently bound volumes and devices. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines AddPersistentIScsiDevice as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} DevicePath A drive letter or symbolic link for a mount point of the volume.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns one of the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ISDSC_DEVICE_NOT_ISCSI_OR_PERSISTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume or device is not located on a iSCSI target or the session to the iSCSI target is not persistent. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ISDSC_VOLUME_ALREADY_PERSISTENTLY_BOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume or device is already in the persistent volume or device list. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-addpersistentiscsidevicew
     * @since windows6.0.6000
     */
    static AddPersistentIScsiDeviceW(DevicePath) {
        DevicePath := DevicePath is String ? StrPtr(DevicePath) : DevicePath

        result := DllCall("ISCSIDSC.dll\AddPersistentIScsiDeviceW", "ptr", DevicePath, "uint")
        return result
    }

    /**
     * AddPersistentIscsiDevice function adds a volume device name, drive letter, or mount point symbolic link to the list of iSCSI persistently bound volumes and devices. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines AddPersistentIScsiDevice as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} DevicePath A drive letter or symbolic link for a mount point of the volume.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds. Otherwise, it returns one of the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ISDSC_DEVICE_NOT_ISCSI_OR_PERSISTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume or device is not located on a iSCSI target or the session to the iSCSI target is not persistent. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ISDSC_VOLUME_ALREADY_PERSISTENTLY_BOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The volume or device is already in the persistent volume or device list. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-addpersistentiscsidevicea
     * @since windows6.0.6000
     */
    static AddPersistentIScsiDeviceA(DevicePath) {
        DevicePath := DevicePath is String ? StrPtr(DevicePath) : DevicePath

        result := DllCall("ISCSIDSC.dll\AddPersistentIScsiDeviceA", "ptr", DevicePath, "uint")
        return result
    }

    /**
     * RemovePersistentIscsiDevice function removes a device or volume from the list of persistently bound iSCSI volumes. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines RemovePersistentIScsiDevice as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} DevicePath A drive letter, mount point, or device path for the volume or device.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ISDSC_DEVICE_NOT_FOUND if the volume that is specified by <i>VolumePath</i> is not in the list of persistently bound volumes. 
     * 
     * Otherwise, <b>RemovePersistentIscsiDevice</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-removepersistentiscsidevicew
     * @since windows6.0.6000
     */
    static RemovePersistentIScsiDeviceW(DevicePath) {
        DevicePath := DevicePath is String ? StrPtr(DevicePath) : DevicePath

        result := DllCall("ISCSIDSC.dll\RemovePersistentIScsiDeviceW", "ptr", DevicePath, "uint")
        return result
    }

    /**
     * RemovePersistentIscsiDevice function removes a device or volume from the list of persistently bound iSCSI volumes. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines RemovePersistentIScsiDevice as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} DevicePath A drive letter, mount point, or device path for the volume or device.
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds and ISDSC_DEVICE_NOT_FOUND if the volume that is specified by <i>VolumePath</i> is not in the list of persistently bound volumes. 
     * 
     * Otherwise, <b>RemovePersistentIscsiDevice</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-removepersistentiscsidevicea
     * @since windows6.0.6000
     */
    static RemovePersistentIScsiDeviceA(DevicePath) {
        DevicePath := DevicePath is String ? StrPtr(DevicePath) : DevicePath

        result := DllCall("ISCSIDSC.dll\RemovePersistentIScsiDeviceA", "ptr", DevicePath, "uint")
        return result
    }

    /**
     * ClearPersistentIscsiDevices function removes all volumes and devices from the list of persistently bound iSCSI volumes.
     * @returns {Integer} returns ERROR_SUCCESS if the operation succeeds and the appropriate Win32 or iSCSI error code if the operation fails.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-clearpersistentiscsidevices
     * @since windows6.0.6000
     */
    static ClearPersistentIScsiDevices() {
        result := DllCall("ISCSIDSC.dll\ClearPersistentIScsiDevices", "uint")
        return result
    }

    /**
     * The ReportPersistentIscsiDevices function retrieves the list of persistently bound volumes and devices. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportPersistentIScsiDevices as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} BufferSizeInChar A <b>ULONG</b> value that specifies the number of list elements contained by the <i>Buffer</i> parameter.
     * @param {PWSTR} Buffer_R 
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds or ERROR_INSUFFICIENT_BUFFER if the buffer was insufficient to receive the output data. Otherwise, <b>ReportPersistentiScsiDevices</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportpersistentiscsidevicesw
     * @since windows6.0.6000
     */
    static ReportPersistentIScsiDevicesW(BufferSizeInChar, Buffer_R) {
        Buffer_R := Buffer_R is String ? StrPtr(Buffer_R) : Buffer_R

        BufferSizeInCharMarshal := BufferSizeInChar is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportPersistentIScsiDevicesW", BufferSizeInCharMarshal, BufferSizeInChar, "ptr", Buffer_R, "uint")
        return result
    }

    /**
     * The ReportPersistentIscsiDevices function retrieves the list of persistently bound volumes and devices. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportPersistentIScsiDevices as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} BufferSizeInChar A <b>ULONG</b> value that specifies the number of list elements contained by the <i>Buffer</i> parameter.
     * @param {PSTR} Buffer_R 
     * @returns {Integer} Returns ERROR_SUCCESS if the operation succeeds or ERROR_INSUFFICIENT_BUFFER if the buffer was insufficient to receive the output data. Otherwise, <b>ReportPersistentiScsiDevices</b> returns the appropriate Win32 or iSCSI error code on failure.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportpersistentiscsidevicesa
     * @since windows6.0.6000
     */
    static ReportPersistentIScsiDevicesA(BufferSizeInChar, Buffer_R) {
        Buffer_R := Buffer_R is String ? StrPtr(Buffer_R) : Buffer_R

        BufferSizeInCharMarshal := BufferSizeInChar is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportPersistentIScsiDevicesA", BufferSizeInCharMarshal, BufferSizeInChar, "ptr", Buffer_R, "uint")
        return result
    }

    /**
     * ReportIscsiTargetPortals function retrieves target portal information discovered by the iSCSI initiator service. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportIScsiTargetPortals as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} InitiatorName A string that represents the name of the initiator node.
     * @param {PWSTR} TargetName A string that represents the name of the target for which the portal information is retrieved.
     * @param {Pointer<Integer>} TargetPortalTag A <b>USHORT</b> value that represents a tag associated with the portal.
     * @param {Pointer<Integer>} ElementCount A <b>ULONG</b> value that specifies the number of portals currently reported for the specified target.
     * @param {Pointer<ISCSI_TARGET_PORTALW>} Portals A variable-length array of an <b>ISCSI_TARGET_PORTALW</b> structure. The number of elements contained in this array is specified by the value of <i>ElementCount</i>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportiscsitargetportalsw
     * @since windows6.0.6000
     */
    static ReportIScsiTargetPortalsW(InitiatorName, TargetName, TargetPortalTag, ElementCount, Portals) {
        InitiatorName := InitiatorName is String ? StrPtr(InitiatorName) : InitiatorName
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        TargetPortalTagMarshal := TargetPortalTag is VarRef ? "ushort*" : "ptr"
        ElementCountMarshal := ElementCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportIScsiTargetPortalsW", "ptr", InitiatorName, "ptr", TargetName, TargetPortalTagMarshal, TargetPortalTag, ElementCountMarshal, ElementCount, "ptr", Portals, "uint")
        return result
    }

    /**
     * ReportIscsiTargetPortals function retrieves target portal information discovered by the iSCSI initiator service. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportIScsiTargetPortals as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} InitiatorName A string that represents the name of the initiator node.
     * @param {PSTR} TargetName A string that represents the name of the target for which the portal information is retrieved.
     * @param {Pointer<Integer>} TargetPortalTag A <b>USHORT</b> value that represents a tag associated with the portal.
     * @param {Pointer<Integer>} ElementCount A <b>ULONG</b> value that specifies the number of portals currently reported for the specified target.
     * @param {Pointer<ISCSI_TARGET_PORTALA>} Portals A variable-length array of an <b>ISCSI_TARGET_PORTALW</b> structure. The number of elements contained in this array is specified by the value of <i>ElementCount</i>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportiscsitargetportalsa
     * @since windows6.0.6000
     */
    static ReportIScsiTargetPortalsA(InitiatorName, TargetName, TargetPortalTag, ElementCount, Portals) {
        InitiatorName := InitiatorName is String ? StrPtr(InitiatorName) : InitiatorName
        TargetName := TargetName is String ? StrPtr(TargetName) : TargetName

        TargetPortalTagMarshal := TargetPortalTag is VarRef ? "ushort*" : "ptr"
        ElementCountMarshal := ElementCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportIScsiTargetPortalsA", "ptr", InitiatorName, "ptr", TargetName, TargetPortalTagMarshal, TargetPortalTag, ElementCountMarshal, ElementCount, "ptr", Portals, "uint")
        return result
    }

    /**
     * AddRadiusServer. (Unicode)
     * @remarks
     * When the iSCSI initiator service receives a request from the <b>AddRadiusServer</b> user-mode library function to add a RADIUS server, the initiator service saves data associated with the server in non-volatile storage. This allows the iSCSI initiator service to utilize the RADIUS server to authenticate targets or obtain authentication information.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines AddRadiusServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
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
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-addradiusserverw
     * @since windows6.0.6000
     */
    static AddRadiusServerW(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\AddRadiusServerW", "ptr", Address, "uint")
        return result
    }

    /**
     * AddRadiusServer. (ANSI)
     * @remarks
     * When the iSCSI initiator service receives a request from the <b>AddRadiusServer</b> user-mode library function to add a RADIUS server, the initiator service saves data associated with the server in non-volatile storage. This allows the iSCSI initiator service to utilize the RADIUS server to authenticate targets or obtain authentication information.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The iscsidsc.h header defines AddRadiusServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
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
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-addradiusservera
     * @since windows6.0.6000
     */
    static AddRadiusServerA(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\AddRadiusServerA", "ptr", Address, "uint")
        return result
    }

    /**
     * RemoveRadiusServer function removes a Remote Authentication Dial-In User Service (RADIUS) server entry from the RADIUS server list with which an iSCSI initiator is configured. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines RemoveRadiusServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} Address A string that represents the IP address or RADIUS server name.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-removeradiusserverw
     * @since windows6.0.6000
     */
    static RemoveRadiusServerW(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\RemoveRadiusServerW", "ptr", Address, "uint")
        return result
    }

    /**
     * RemoveRadiusServer function removes a Remote Authentication Dial-In User Service (RADIUS) server entry from the RADIUS server list with which an iSCSI initiator is configured. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines RemoveRadiusServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} Address A string that represents the IP address or RADIUS server name.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-removeradiusservera
     * @since windows6.0.6000
     */
    static RemoveRadiusServerA(Address) {
        Address := Address is String ? StrPtr(Address) : Address

        result := DllCall("ISCSIDSC.dll\RemoveRadiusServerA", "ptr", Address, "uint")
        return result
    }

    /**
     * ReportRadiusServerList function retrieves the list of Remote Authentication Dial-In Service (RADIUS) servers the iSCSI initiator service uses during authentication. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportRadiusServerList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} BufferSizeInChar A <b>ULONG</b> value that specifies the number of list elements contained by the <i>Buffer</i> parameter.
     * @param {PWSTR} Buffer_R 
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportradiusserverlistw
     * @since windows6.0.6000
     */
    static ReportRadiusServerListW(BufferSizeInChar, Buffer_R) {
        Buffer_R := Buffer_R is String ? StrPtr(Buffer_R) : Buffer_R

        BufferSizeInCharMarshal := BufferSizeInChar is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportRadiusServerListW", BufferSizeInCharMarshal, BufferSizeInChar, "ptr", Buffer_R, "uint")
        return result
    }

    /**
     * ReportRadiusServerList function retrieves the list of Remote Authentication Dial-In Service (RADIUS) servers the iSCSI initiator service uses during authentication. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The iscsidsc.h header defines ReportRadiusServerList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} BufferSizeInChar A <b>ULONG</b> value that specifies the number of list elements contained by the <i>Buffer</i> parameter.
     * @param {PSTR} Buffer_R 
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the operation is successful. If the operation fails due to a socket connection error, this function will return a Winsock error code.
     * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/nf-iscsidsc-reportradiusserverlista
     * @since windows6.0.6000
     */
    static ReportRadiusServerListA(BufferSizeInChar, Buffer_R) {
        Buffer_R := Buffer_R is String ? StrPtr(Buffer_R) : Buffer_R

        BufferSizeInCharMarshal := BufferSizeInChar is VarRef ? "uint*" : "ptr"

        result := DllCall("ISCSIDSC.dll\ReportRadiusServerListA", BufferSizeInCharMarshal, BufferSizeInChar, "ptr", Buffer_R, "uint")
        return result
    }

;@endregion Methods
}
