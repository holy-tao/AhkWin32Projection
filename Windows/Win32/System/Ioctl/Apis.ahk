#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\DEVPROPKEY.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class Ioctl {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_BASE => 45

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCMBUS_BASE => 89

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_BASE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CHANGER_BASE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SPECIAL_ACCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_UNKNOWN => 34

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_DISK => Guid("{53f56307-b6bf-11d0-94f2-00a0c91efb8b}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_CDROM => Guid("{53f56308-b6bf-11d0-94f2-00a0c91efb8b}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_PARTITION => Guid("{53f5630a-b6bf-11d0-94f2-00a0c91efb8b}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_TAPE => Guid("{53f5630b-b6bf-11d0-94f2-00a0c91efb8b}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_WRITEONCEDISK => Guid("{53f5630c-b6bf-11d0-94f2-00a0c91efb8b}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_VOLUME => Guid("{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_MEDIUMCHANGER => Guid("{53f56310-b6bf-11d0-94f2-00a0c91efb8b}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_FLOPPY => Guid("{53f56311-b6bf-11d0-94f2-00a0c91efb8b}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_CDCHANGER => Guid("{53f56312-b6bf-11d0-94f2-00a0c91efb8b}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_STORAGEPORT => Guid("{2accfe60-c130-11d2-b082-00a0c91efb8b}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_VMLUN => Guid("{6f416619-9f29-42a5-b20b-37e219ca02b0}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_SES => Guid("{1790c9ec-47d5-4df3-b5af-9adf3cf23e48}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_ZNSDISK => Guid("{b87941c5-ffdb-43c7-b6b1-20b632f0b109}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_HIDDEN_DISK => Guid("{7fccc86c-228a-40ad-8a58-f590af7bfdce}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_SERVICE_VOLUME => Guid("{6ead3d82-25ec-46bc-b7fd-c1f0df8f5037}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_HIDDEN_VOLUME => Guid("{7f108a28-9833-4b3b-b780-2c6b5fa5c062}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_UNIFIED_ACCESS_RPMB => Guid("{27447c21-bcc3-4d07-a05b-a3395bb4eee7}")

    /**
     * @type {Guid}
     */
    static GUID_DEVICEDUMP_STORAGE_DEVICE => Guid("{d8e2592f-1aab-4d56-a746-1f7585df40f4}")

    /**
     * @type {Guid}
     */
    static GUID_DEVICEDUMP_DRIVER_STORAGE_PORT => Guid("{da82441d-7142-4bc1-b844-0807c5a4b67f}")

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Storage_Portable {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4d1ebee8-0803-4774-9842-b77db50265e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Storage_Removable_Media {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4d1ebee8-0803-4774-9842-b77db50265e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 3
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Storage_System_Critical {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4d1ebee8-0803-4774-9842-b77db50265e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 4
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Storage_Disk_Number {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4d1ebee8-0803-4774-9842-b77db50265e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 5
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Storage_Partition_Number {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4d1ebee8-0803-4774-9842-b77db50265e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 6
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Storage_Mbr_Type {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4d1ebee8-0803-4774-9842-b77db50265e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 7
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Storage_Gpt_Type {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4d1ebee8-0803-4774-9842-b77db50265e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 8
            return value
        }
    }

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_Storage_Gpt_Name {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{4d1ebee8-0803-4774-9842-b77db50265e9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 9
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_CHECK_VERIFY => 2967552

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_CHECK_VERIFY2 => 2951168

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_MEDIA_REMOVAL => 2967556

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_EJECT_MEDIA => 2967560

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_LOAD_MEDIA => 2967564

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_LOAD_MEDIA2 => 2951180

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_RESERVE => 2967568

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_RELEASE => 2967572

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_FIND_NEW_DEVICES => 2967576

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_MANAGE_BYPASS_IO => 2951360

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_EJECTION_CONTROL => 2951488

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_MCN_CONTROL => 2951492

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_GET_MEDIA_TYPES => 2952192

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_GET_MEDIA_TYPES_EX => 2952196

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_GET_MEDIA_SERIAL_NUMBER => 2952208

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_GET_HOTPLUG_INFO => 2952212

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_SET_HOTPLUG_INFO => 3001368

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_RESET_BUS => 2969600

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_RESET_DEVICE => 2969604

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_BREAK_RESERVATION => 2969620

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_PERSISTENT_RESERVE_IN => 2969624

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_PERSISTENT_RESERVE_OUT => 3002396

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_GET_DEVICE_NUMBER => 2953344

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_GET_DEVICE_NUMBER_EX => 2953348

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_PREDICT_FAILURE => 2953472

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_FAILURE_PREDICTION_CONFIG => 2953476

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_GET_COUNTERS => 2953480

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_READ_CAPACITY => 2969920

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_GET_DEVICE_TELEMETRY => 3002816

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_DEVICE_TELEMETRY_NOTIFY => 3002820

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_DEVICE_TELEMETRY_QUERY_CAPS => 3002824

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_GET_DEVICE_TELEMETRY_RAW => 3002828

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_SET_TEMPERATURE_THRESHOLD => 3002880

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_PROTOCOL_COMMAND => 3003328

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_SET_PROPERTY => 2987004

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_QUERY_PROPERTY => 2954240

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES => 2987012

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_GET_LB_PROVISIONING_MAP_RESOURCES => 2970632

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_REINITIALIZE_MEDIA => 2987584

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_GET_BC_PROPERTIES => 2971648

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_ALLOCATE_BC_STREAM => 3004420

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_FREE_BC_STREAM => 3004424

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_CHECK_PRIORITY_HINT_SUPPORT => 2955392

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_START_DATA_INTEGRITY_CHECK => 3004548

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_STOP_DATA_INTEGRITY_CHECK => 3004552

    /**
     * @type {Integer (UInt32)}
     */
    static OBSOLETE_IOCTL_STORAGE_RESET_BUS => 3002368

    /**
     * @type {Integer (UInt32)}
     */
    static OBSOLETE_IOCTL_STORAGE_RESET_DEVICE => 3002372

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_FIRMWARE_GET_INFO => 2956288

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_FIRMWARE_DOWNLOAD => 3005444

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_FIRMWARE_ACTIVATE => 3005448

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_ENABLE_IDLE_POWER => 2956416

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_GET_IDLE_POWERUP_REASON => 2956420

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_POWER_ACTIVE => 2956424

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_POWER_IDLE => 2956428

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_EVENT_NOTIFICATION => 2956432

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_DEVICE_POWER_CAP => 2956436

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_RPMB_COMMAND => 2956440

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_ATTRIBUTE_MANAGEMENT => 3005596

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_DIAGNOSTIC => 2956448

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_GET_PHYSICAL_ELEMENT_STATUS => 2956452

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_REMOVE_ELEMENT_AND_TRUNCATE => 2956480

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_GET_DEVICE_INTERNAL_LOG => 2956484

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DEVICE_FLAGS_RANDOM_DEVICEGUID_REASON_CONFLICT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DEVICE_FLAGS_RANDOM_DEVICEGUID_REASON_NOHWID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DEVICE_FLAGS_PAGE_83_DEVICEGUID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RECOVERED_WRITES_VALID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UNRECOVERED_WRITES_VALID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RECOVERED_READS_VALID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static UNRECOVERED_READS_VALID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WRITE_COMPRESSION_INFO_VALID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static READ_COMPRESSION_INFO_VALID => 32

    /**
     * @type {Integer (Int32)}
     */
    static TAPE_RETURN_STATISTICS => 0

    /**
     * @type {Integer (Int32)}
     */
    static TAPE_RETURN_ENV_INFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static TAPE_RESET_STATISTICS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MEDIA_ERASEABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MEDIA_WRITE_ONCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MEDIA_READ_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MEDIA_READ_WRITE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MEDIA_WRITE_PROTECTED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MEDIA_CURRENTLY_MOUNTED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_FAILURE_PREDICTION_CONFIG_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SRB_TYPE_SCSI_REQUEST_BLOCK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SRB_TYPE_STORAGE_REQUEST_BLOCK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_ADDRESS_TYPE_BTL8 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_RPMB_DESCRIPTOR_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_RPMB_MINIMUM_RELIABLE_WRITE_SIZE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_CRYPTO_CAPABILITY_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_CRYPTO_CAPABILITY_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_CRYPTO_DESCRIPTOR_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_CRYPTO_DESCRIPTOR_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_TIER_NAME_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_TIER_DESCRIPTION_LENGTH => 512

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_TIER_FLAG_NO_SEEK_PENALTY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_TIER_FLAG_WRITE_BACK_CACHE => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_TIER_FLAG_READ_CACHE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_TIER_FLAG_PARITY => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_TIER_FLAG_SMR => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_DATA_DESCRIPTOR_EXT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_TEMPERATURE_VALUE_NOT_REPORTED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_TEMPERATURE_THRESHOLD_FLAG_ADAPTER_REQUEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_COMPONENT_ROLE_CACHE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_COMPONENT_ROLE_TIERING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_COMPONENT_ROLE_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_ATTRIBUTE_BYTE_ADDRESSABLE_IO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_ATTRIBUTE_BLOCK_IO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_ATTRIBUTE_DYNAMIC_PERSISTENCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_ATTRIBUTE_VOLATILE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_ATTRIBUTE_ASYNC_EVENT_NOTIFICATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_ATTRIBUTE_PERF_SIZE_INDEPENDENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DEVICE_MAX_OPERATIONAL_STATUS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_ADAPTER_SERIAL_NUMBER_V1_MAX_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DeviceDsmActionFlag_NonDestructive => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_FLAG_ENTIRE_DATA_SET_RANGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_FLAG_TRIM_NOT_FS_ALLOCATED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_FLAG_TRIM_BYPASS_RZAT => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_NOTIFY_FLAG_BEGIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_NOTIFY_FLAG_END => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_OFFLOAD_MAX_TOKEN_LENGTH => 512

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_OFFLOAD_TOKEN_ID_LENGTH => 504

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_OFFLOAD_TOKEN_TYPE_ZERO_DATA => 4294901761

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_OFFLOAD_READ_RANGE_TRUNCATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_OFFLOAD_WRITE_RANGE_TRUNCATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_OFFLOAD_TOKEN_INVALID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_FLAG_ALLOCATION_CONSOLIDATEABLE_ONLY => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_PARAMETERS_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DATA_SET_LBP_STATE_PARAMETERS_VERSION_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_FLAG_REPAIR_INPUT_TOPOLOGY_ID_PRESENT => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_FLAG_REPAIR_OUTPUT_PARITY_EXTENT => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_FLAG_SCRUB_SKIP_IN_SYNC => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_FLAG_SCRUB_OUTPUT_PARITY_EXTENT => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_FLAG_PHYSICAL_ADDRESSES_OMIT_TOTAL_RANGES => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_PHYSICAL_ADDRESSES_OUTPUT_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_PHYSICAL_ADDRESSES_OUTPUT_VERSION_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_STORAGE_NO_ERRORS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_RANGE_ERROR_OUTPUT_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DSM_RANGE_ERROR_INFO_VERSION_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_STORAGE_BC_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PRIORITY_HINT_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DIAGNOSTIC_FLAG_ADAPTER_REQUEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HISTORY_DIRECTORY_ENTRY_DEFAULT_COUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEDUMP_STRUCTURE_VERSION_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEDUMP_MAX_IDSTRING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_FW_BUCKET_ID_LENGTH => 132

    /**
     * @type {String}
     */
    static STORAGE_CRASH_TELEMETRY_REGKEY => "\Registry\Machine\System\CurrentControlSet\Control\CrashControl\StorageTelemetry"

    /**
     * @type {String}
     */
    static STORAGE_DEVICE_TELEMETRY_REGKEY => "\Registry\Machine\System\CurrentControlSet\Control\Storage\StorageTelemetry"

    /**
     * @type {Integer (UInt32)}
     */
    static DDUMP_FLAG_DATA_READ_FROM_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FW_ISSUEID_NO_ISSUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FW_ISSUEID_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static TC_PUBLIC_DEVICEDUMP_CONTENT_SMART => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TC_PUBLIC_DEVICEDUMP_CONTENT_GPLOG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TC_PUBLIC_DEVICEDUMP_CONTENT_GPLOG_MAX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TC_DEVICEDUMP_SUBSECTION_DESC_LENGTH => 16

    /**
     * @type {String}
     */
    static TC_PUBLIC_DATA_TYPE_ATAGP => "ATAGPLogPages"

    /**
     * @type {String}
     */
    static TC_PUBLIC_DATA_TYPE_ATASMART => "ATASMARTPages"

    /**
     * @type {Integer (UInt32)}
     */
    static CDB_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TELEMETRY_COMMAND_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEDUMP_CAP_PRIVATE_SECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICEDUMP_CAP_RESTRICTED_SECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_IDLE_POWERUP_REASON_VERSION_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DEVICE_POWER_CAP_VERSION_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_EVENT_NOTIFICATION_VERSION_V1 => 1

    /**
     * @type {Integer (UInt64)}
     */
    static STORAGE_EVENT_MEDIA_STATUS => 1

    /**
     * @type {Integer (UInt64)}
     */
    static STORAGE_EVENT_DEVICE_STATUS => 2

    /**
     * @type {Integer (UInt64)}
     */
    static STORAGE_EVENT_DEVICE_OPERATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static READ_COPY_NUMBER_KEY => 1380142592

    /**
     * @type {Integer (UInt32)}
     */
    static READ_COPY_NUMBER_BYPASS_CACHE_FLAG => 256

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_HW_FIRMWARE_REQUEST_FLAG_CONTROLLER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_HW_FIRMWARE_REQUEST_FLAG_LAST_SEGMENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_HW_FIRMWARE_REQUEST_FLAG_FIRST_SEGMENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_HW_FIRMWARE_REQUEST_FLAG_SWITCH_TO_FIRMWARE_WITHOUT_RESET => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_HW_FIRMWARE_REQUEST_FLAG_REPLACE_AND_SWITCH_UPON_RESET => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_HW_FIRMWARE_REQUEST_FLAG_REPLACE_EXISTING_IMAGE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_HW_FIRMWARE_REQUEST_FLAG_SWITCH_TO_EXISTING_FIRMWARE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_HW_FIRMWARE_INVALID_SLOT => 255

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_HW_FIRMWARE_REVISION_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_STRUCTURE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_COMMAND_FLAG_ADAPTER_REQUEST => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_STATUS_PENDING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_STATUS_SUCCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_STATUS_ERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_STATUS_INVALID_REQUEST => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_STATUS_NO_DEVICE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_STATUS_BUSY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_STATUS_DATA_OVERRUN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_STATUS_INSUFFICIENT_RESOURCES => 7

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_STATUS_THROTTLED_REQUEST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_STATUS_NOT_SUPPORTED => 255

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_COMMAND_LENGTH_NVME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_SPECIFIC_NVME_ADMIN_COMMAND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_PROTOCOL_SPECIFIC_NVME_NVM_COMMAND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORATTRIBUTE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STORATTRIBUTE_MANAGEMENT_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_SUPPORTED_FEATURES_BYPASS_IO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_SUPPORTED_FEATURES_MASK => 1

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_SCM_PHYSICAL_DEVICE => Guid("{4283609d-4dc2-43be-bbb4-4f15dfce2c61}")

    /**
     * @type {Guid}
     */
    static GUID_SCM_PD_HEALTH_NOTIFICATION => Guid("{9da2d386-72f5-4ee3-8155-eca0678e3b06}")

    /**
     * @type {Guid}
     */
    static GUID_SCM_PD_PASSTHROUGH_INVDIMM => Guid("{4309ac30-0d11-11e4-9191-0800200c9a66}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_COMPORT => Guid("{86e0d1e0-8089-11d0-9ce4-08003e301f73}")

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_SERENUM_BUS_ENUMERATOR => Guid("{4d36e978-e325-11ce-bfc1-08002be10318}")

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_BEEP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_CD_ROM_FILE_SYSTEM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_CONTROLLER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_DATALINK => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_DFS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_DISK_FILE_SYSTEM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_FILE_SYSTEM => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_INPORT_PORT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_KEYBOARD => 11

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_MAILSLOT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_MIDI_IN => 13

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_MIDI_OUT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_MOUSE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_MULTI_UNC_PROVIDER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_NAMED_PIPE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_NETWORK => 18

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_NETWORK_BROWSER => 19

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_NETWORK_FILE_SYSTEM => 20

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_NULL => 21

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_PARALLEL_PORT => 22

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_PHYSICAL_NETCARD => 23

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_PRINTER => 24

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_SCANNER => 25

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_SERIAL_MOUSE_PORT => 26

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_SERIAL_PORT => 27

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_SCREEN => 28

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_SOUND => 29

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_STREAMS => 30

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_TAPE_FILE_SYSTEM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_TRANSPORT => 33

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_VIDEO => 35

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_VIRTUAL_DISK => 36

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_WAVE_IN => 37

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_WAVE_OUT => 38

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_8042_PORT => 39

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_NETWORK_REDIRECTOR => 40

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_BATTERY => 41

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_BUS_EXTENDER => 42

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_MODEM => 43

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_VDM => 44

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_MASS_STORAGE => 45

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_SMB => 46

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_KS => 47

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_CHANGER => 48

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_ACPI => 50

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_FULLSCREEN_VIDEO => 52

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_DFS_FILE_SYSTEM => 53

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_DFS_VOLUME => 54

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_SERENUM => 55

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_TERMSRV => 56

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_KSEC => 57

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_FIPS => 58

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_INFINIBAND => 59

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_VMBUS => 62

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_CRYPT_PROVIDER => 63

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_WPD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_BLUETOOTH => 65

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_MT_COMPOSITE => 66

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_MT_TRANSPORT => 67

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_BIOMETRIC => 68

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_PMI => 69

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_EHSTOR => 70

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_DEVAPI => 71

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_GPIO => 72

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_USBEX => 73

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_CONSOLE => 80

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_NFP => 81

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_SYSENV => 82

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_VIRTUAL_BLOCK => 83

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_POINT_OF_SERVICE => 84

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_STORAGE_REPLICATION => 85

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_TRUST_ENV => 86

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_UCM => 87

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_UCMTCPCI => 88

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_PERSISTENT_MEMORY => 89

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_NVDIMM => 90

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_HOLOGRAPHIC => 91

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_SDFXHCI => 92

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_UCMUCSI => 93

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_PRM => 94

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_EVENT_COLLECTOR => 95

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_USB4 => 96

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_SOUNDWIRE => 97

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_FABRIC_NVME => 98

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_SVM => 99

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_HARDWARE_ACCELERATOR => 100

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_I3C => 101

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_BUFFERED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_IN_DIRECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_OUT_DIRECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_NEITHER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_DIRECT_TO_HARDWARE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static METHOD_DIRECT_FROM_HARDWARE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ANY_ACCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_READ_ACCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_WRITE_ACCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DEVICE_NUMA_NODE_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCMBUS_DEVICE_FUNCTION_BASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_LOGICAL_DEVICE_FUNCTION_BASE => 768

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_PHYSICAL_DEVICE_FUNCTION_BASE => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_BUS_GET_LOGICAL_DEVICES => 5832704

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_BUS_GET_PHYSICAL_DEVICES => 5832708

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_BUS_GET_REGIONS => 5832712

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_BUS_QUERY_PROPERTY => 5832716

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_BUS_SET_PROPERTY => 5865492

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_BUS_RUNTIME_FW_ACTIVATE => 5865488

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_BUS_REFRESH_NAMESPACE => 5832728

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_LD_GET_INTERLEAVE_SET => 5835776

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_PD_QUERY_PROPERTY => 5838848

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_PD_FIRMWARE_DOWNLOAD => 5871620

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_PD_FIRMWARE_ACTIVATE => 5871624

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_PD_PASSTHROUGH => 5888012

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_PD_UPDATE_MANAGEMENT_STATUS => 5838864

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_PD_REINITIALIZE_MEDIA => 5871636

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SCM_PD_SET_PROPERTY => 5871640

    /**
     * @type {Integer (UInt32)}
     */
    static SCM_MAX_SYMLINK_LEN_IN_CHARS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_INTERFACE_CODES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SCM_PD_FIRMWARE_REVISION_LENGTH_BYTES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SCM_PD_PROPERTY_NAME_LENGTH_IN_CHARS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SCM_PD_MAX_OPERATIONAL_STATUS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SCM_PD_FIRMWARE_LAST_DOWNLOAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_GET_DRIVE_GEOMETRY => 458752

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_GET_PARTITION_INFO => 475140

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_SET_PARTITION_INFO => 507912

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_GET_DRIVE_LAYOUT => 475148

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_SET_DRIVE_LAYOUT => 507920

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_VERIFY => 458772

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_FORMAT_TRACKS => 507928

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_REASSIGN_BLOCKS => 507932

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_PERFORMANCE => 458784

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_IS_WRITABLE => 458788

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_LOGGING => 458792

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_FORMAT_TRACKS_EX => 507948

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_HISTOGRAM_STRUCTURE => 458800

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_HISTOGRAM_DATA => 458804

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_HISTOGRAM_RESET => 458808

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_REQUEST_STRUCTURE => 458812

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_REQUEST_DATA => 458816

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_PERFORMANCE_OFF => 458848

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_CONTROLLER_NUMBER => 458820

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_GET_VERSION => 475264

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_SEND_DRIVE_COMMAND => 508036

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_RCV_DRIVE_DATA => 508040

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_RCV_DRIVE_DATA_EX => 458892

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_GET_PARTITION_INFO_EX => 458824

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_SET_PARTITION_INFO_EX => 507980

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_GET_DRIVE_LAYOUT_EX => 458832

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_SET_DRIVE_LAYOUT_EX => 507988

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_CREATE_DISK => 507992

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_GET_LENGTH_INFO => 475228

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_GET_DRIVE_GEOMETRY_EX => 458912

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_REASSIGN_BLOCKS_EX => 508068

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_UPDATE_DRIVE_SIZE => 508104

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_GROW_PARTITION => 508112

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_GET_CACHE_INFORMATION => 475348

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_SET_CACHE_INFORMATION => 508120

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_GET_WRITE_CACHE_STATE => 475356

    /**
     * @type {Integer (UInt32)}
     */
    static OBSOLETE_DISK_GET_WRITE_CACHE_STATE => 475356

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_DELETE_DRIVE_LAYOUT => 508160

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_UPDATE_PROPERTIES => 459072

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_FORMAT_DRIVE => 508876

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_SENSE_DEVICE => 459744

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_CHECK_VERIFY => 477184

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_MEDIA_REMOVAL => 477188

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_EJECT_MEDIA => 477192

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_LOAD_MEDIA => 477196

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_RESERVE => 477200

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_RELEASE => 477204

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_FIND_NEW_DEVICES => 477208

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_GET_MEDIA_TYPES => 461824

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_ENTRY_UNUSED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_FAT_12 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_XENIX_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_XENIX_2 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_FAT_16 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_EXTENDED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_HUGE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_IFS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_OS2BOOTMGR => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_FAT32 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_FAT32_XINT13 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_XINT13 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_XINT13_EXTENDED => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_MSFT_RECOVERY => 39

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_MAIN_OS => 40

    /**
     * @type {Integer (UInt32)}
     */
    static PARTIITON_OS_DATA => 41

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_PRE_INSTALLED => 42

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_BSP => 43

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_DPP => 44

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_WINDOWS_SYSTEM => 45

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_PREP => 65

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_LDM => 66

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_DM => 84

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_EZDRIVE => 85

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_UNIX => 99

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_SPACES_DATA => 215

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_SPACES => 231

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_GPT => 238

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_SYSTEM => 239

    /**
     * @type {Integer (UInt32)}
     */
    static VALID_NTFT => 192

    /**
     * @type {Integer (UInt32)}
     */
    static PARTITION_NTFT => 128

    /**
     * @type {Guid}
     */
    static WMI_DISK_GEOMETRY_GUID => Guid("{25007f51-57c2-11d1-a528-00a0c9062910}")

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_ATTRIBUTE_NO_BLOCK_IO_PROTOCOL => 2

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_ATTRIBUTE_LEGACY_BIOS_BOOTABLE => 4

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_BASIC_DATA_ATTRIBUTE_OFFLINE => 576460752303423488

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_BASIC_DATA_ATTRIBUTE_DAX => 288230376151711744

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_BASIC_DATA_ATTRIBUTE_SERVICE => 144115188075855872

    /**
     * @type {Integer (UInt64)}
     */
    static GPT_SPACES_ATTRIBUTE_NO_METADATA => 9223372036854775808

    /**
     * @type {Integer (UInt32)}
     */
    static HIST_NO_OF_BUCKETS => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DISK_LOGGING_START => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISK_LOGGING_STOP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISK_LOGGING_DUMP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISK_BINNING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CAP_ATA_ID_CMD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CAP_ATAPI_ID_CMD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CAP_SMART_CMD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ATAPI_ID_CMD => 161

    /**
     * @type {Integer (UInt32)}
     */
    static ID_CMD => 236

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_CMD => 176

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_CYL_LOW => 79

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_CYL_HI => 194

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_NO_ERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_IDE_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_INVALID_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_INVALID_COMMAND => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_INVALID_BUFFER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_INVALID_DRIVE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_INVALID_IOCTL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_ERROR_NO_MEM => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_INVALID_REGISTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_NOT_SUPPORTED => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_NO_IDE_DEVICE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_OFFLINE_ROUTINE_OFFLINE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_SHORT_SELFTEST_OFFLINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_EXTENDED_SELFTEST_OFFLINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_ABORT_OFFLINE_SELFTEST => 127

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_SHORT_SELFTEST_CAPTIVE => 129

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_EXTENDED_SELFTEST_CAPTIVE => 130

    /**
     * @type {Integer (UInt32)}
     */
    static READ_ATTRIBUTE_BUFFER_SIZE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IDENTIFY_BUFFER_SIZE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static READ_THRESHOLD_BUFFER_SIZE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_LOG_SECTOR_SIZE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static READ_ATTRIBUTES => 208

    /**
     * @type {Integer (UInt32)}
     */
    static READ_THRESHOLDS => 209

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_DISABLE_AUTOSAVE => 210

    /**
     * @type {Integer (UInt32)}
     */
    static SAVE_ATTRIBUTE_VALUES => 211

    /**
     * @type {Integer (UInt32)}
     */
    static EXECUTE_OFFLINE_DIAGS => 212

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_READ_LOG => 213

    /**
     * @type {Integer (UInt32)}
     */
    static SMART_WRITE_LOG => 214

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_SMART => 216

    /**
     * @type {Integer (UInt32)}
     */
    static DISABLE_SMART => 217

    /**
     * @type {Integer (UInt32)}
     */
    static RETURN_SMART_STATUS => 218

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_DISABLE_AUTO_OFFLINE => 219

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_GET_DISK_ATTRIBUTES => 458992

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_SET_DISK_ATTRIBUTES => 508148

    /**
     * @type {Integer (UInt64)}
     */
    static DISK_ATTRIBUTE_OFFLINE => 1

    /**
     * @type {Integer (UInt64)}
     */
    static DISK_ATTRIBUTE_READ_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_DISK_RESET_SNAPSHOT_INFO => 508432

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CHANGER_GET_PARAMETERS => 3162112

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CHANGER_GET_STATUS => 3162116

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CHANGER_GET_PRODUCT_DATA => 3162120

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CHANGER_SET_ACCESS => 3194896

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CHANGER_GET_ELEMENT_STATUS => 3194900

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CHANGER_INITIALIZE_ELEMENT_STATUS => 3162136

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CHANGER_SET_POSITION => 3162140

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CHANGER_EXCHANGE_MEDIUM => 3162144

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CHANGER_MOVE_MEDIUM => 3162148

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CHANGER_REINITIALIZE_TRANSPORT => 3162152

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CHANGER_QUERY_VOLUME_TAGS => 3194924

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_VOLUME_ID_SIZE => 36

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_VOLUME_TEMPLATE_SIZE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static VENDOR_ID_LENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ID_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static REVISION_LENGTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_NUMBER_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_RESERVED_BIT => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_TO_TRANSPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_TO_SLOT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_TO_IEPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_TO_DRIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LOCK_UNLOCK_IEPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOCK_UNLOCK_DOOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LOCK_UNLOCK_KEYPAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LOCK_ELEMENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static UNLOCK_ELEMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXTEND_IEPORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RETRACT_IEPORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LABEL_UNREADABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LABEL_QUESTIONABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SLOT_NOT_PRESENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DRIVE_NOT_INSTALLED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRAY_MALFUNCTION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INIT_STATUS_NEEDED => 17

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNHANDLED_ERROR => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static SEARCH_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SEARCH_PRIMARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEARCH_ALTERNATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SEARCH_ALL_NO_SEQ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SEARCH_PRI_NO_SEQ => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SEARCH_ALT_NO_SEQ => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ASSERT_PRIMARY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ASSERT_ALTERNATE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static REPLACE_PRIMARY => 10

    /**
     * @type {Integer (UInt32)}
     */
    static REPLACE_ALTERNATE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static UNDEFINE_PRIMARY => 12

    /**
     * @type {Integer (UInt32)}
     */
    static UNDEFINE_ALTERNATE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_LSRMST_INSERT => 1769596

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERENUM_EXPOSE_HARDWARE => 3604992

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERENUM_REMOVE_HARDWARE => 3604996

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERENUM_PORT_DESC => 3605000

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERENUM_GET_PORT_NAME => 3605004

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_IOC_FCR_FIFO_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_IOC_FCR_RCVR_RESET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_IOC_FCR_XMIT_RESET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_IOC_FCR_DMA_MODE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_IOC_FCR_RES1 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_IOC_FCR_RES2 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_IOC_FCR_RCVR_TRIGGER_LSB => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_IOC_FCR_RCVR_TRIGGER_MSB => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_IOC_MCR_DTR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_IOC_MCR_RTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_IOC_MCR_OUT1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_IOC_MCR_OUT2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_IOC_MCR_LOOP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REQUEST_OPLOCK_LEVEL_1 => 589824

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REQUEST_OPLOCK_LEVEL_2 => 589828

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REQUEST_BATCH_OPLOCK => 589832

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_OPLOCK_BREAK_ACKNOWLEDGE => 589836

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_OPBATCH_ACK_CLOSE_PENDING => 589840

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_OPLOCK_BREAK_NOTIFY => 589844

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_LOCK_VOLUME => 589848

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_UNLOCK_VOLUME => 589852

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_DISMOUNT_VOLUME => 589856

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_IS_VOLUME_MOUNTED => 589864

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_IS_PATHNAME_VALID => 589868

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_MARK_VOLUME_DIRTY => 589872

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_RETRIEVAL_POINTERS => 589883

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_COMPRESSION => 589884

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_COMPRESSION => 639040

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_BOOTLOADER_ACCESSED => 589903

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_MARK_AS_SYSTEM_HIVE => 589903

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_OPLOCK_BREAK_ACK_NO_2 => 589904

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_INVALIDATE_VOLUMES => 589908

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_FAT_BPB => 589912

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REQUEST_FILTER_OPLOCK => 589916

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_FILESYSTEM_GET_STATISTICS => 589920

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_NTFS_VOLUME_DATA => 589924

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_NTFS_FILE_RECORD => 589928

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_VOLUME_BITMAP => 589935

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_RETRIEVAL_POINTERS => 589939

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_MOVE_FILE => 589940

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_IS_VOLUME_DIRTY => 589944

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_ALLOW_EXTENDED_DASD_IO => 589955

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_FIND_FILES_BY_SID => 589967

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_OBJECT_ID => 589976

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_OBJECT_ID => 589980

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_DELETE_OBJECT_ID => 589984

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_REPARSE_POINT => 589988

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_REPARSE_POINT => 589992

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_DELETE_REPARSE_POINT => 589996

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_ENUM_USN_DATA => 590003

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SECURITY_ID_CHECK => 606391

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_READ_USN_JOURNAL => 590011

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_OBJECT_ID_EXTENDED => 590012

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CREATE_OR_GET_OBJECT_ID => 590016

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_SPARSE => 590020

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_ZERO_DATA => 622792

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_ALLOCATED_RANGES => 606415

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_ENABLE_UPGRADE => 622800

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_ENCRYPTION => 590039

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_ENCRYPTION_FSCTL_IO => 590043

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_WRITE_RAW_ENCRYPTED => 590047

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_READ_RAW_ENCRYPTED => 590051

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CREATE_USN_JOURNAL => 590055

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_READ_FILE_USN_DATA => 590059

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_WRITE_USN_CLOSE_RECORD => 590063

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_EXTEND_VOLUME => 590064

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_USN_JOURNAL => 590068

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_DELETE_USN_JOURNAL => 590072

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_MARK_HANDLE => 590076

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SIS_COPYFILE => 590080

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SIS_LINK_FILES => 639236

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_RECALL_FILE => 590103

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_READ_FROM_PLEX => 606494

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_FILE_PREFETCH => 590112

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_MAKE_MEDIA_COMPATIBLE => 622896

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_DEFECT_MANAGEMENT => 622900

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_SPARING_INFO => 590136

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_ON_DISK_VOLUME_INFO => 590140

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_VOLUME_COMPRESSION_STATE => 590144

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_MODIFY_RM => 622916

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_QUERY_RM_INFORMATION => 606536

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_ROLLFORWARD_REDO => 622928

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_ROLLFORWARD_UNDO => 622932

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_START_RM => 622936

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_SHUTDOWN_RM => 622940

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_READ_BACKUP_INFORMATION => 606560

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_WRITE_BACKUP_INFORMATION => 622948

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_CREATE_SECONDARY_RM => 622952

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_GET_METADATA_INFO => 606572

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_GET_TRANSACTED_VERSION => 606576

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_SAVEPOINT_INFORMATION => 622968

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_CREATE_MINIVERSION => 622972

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_TRANSACTION_ACTIVE => 606604

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_ZERO_ON_DEALLOCATION => 590228

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_REPAIR => 590232

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_REPAIR => 590236

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_WAIT_FOR_REPAIR => 590240

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_INITIATE_REPAIR => 590248

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CSC_INTERNAL => 590255

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SHRINK_VOLUME => 590256

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_SHORT_NAME_BEHAVIOR => 590260

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_DFSR_SET_GHOST_HANDLE_STATE => 590264

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_LIST_TRANSACTION_LOCKED_FILES => 606688

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_LIST_TRANSACTIONS => 606692

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_PAGEFILE_ENCRYPTION => 590312

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_RESET_VOLUME_ALLOCATION_HINTS => 590316

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_DEPENDENT_VOLUME => 590320

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SD_GLOBAL_CHANGE => 590324

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_READ_BACKUP_INFORMATION2 => 590328

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_LOOKUP_STREAM_FROM_CLUSTER => 590332

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TXFS_WRITE_BACKUP_INFORMATION2 => 590336

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_FILE_TYPE_NOTIFICATION => 590340

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_FILE_LEVEL_TRIM => 623112

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_BOOT_AREA_INFO => 590384

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_RETRIEVAL_POINTER_BASE => 590388

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_PERSISTENT_VOLUME_STATE => 590392

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_PERSISTENT_VOLUME_STATE => 590396

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REQUEST_OPLOCK => 590400

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CSV_TUNNEL_REQUEST => 590404

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_IS_CSV_FILE => 590408

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_FILE_SYSTEM_RECOGNITION => 590412

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CSV_GET_VOLUME_PATH_NAME => 590416

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CSV_GET_VOLUME_NAME_FOR_VOLUME_MOUNT_POINT => 590420

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CSV_GET_VOLUME_PATH_NAMES_FOR_VOLUME_NAME => 590424

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_IS_FILE_ON_CSV_VOLUME => 590428

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CORRUPTION_HANDLING => 590432

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_OFFLOAD_READ => 606820

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_OFFLOAD_WRITE => 623208

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CSV_INTERNAL => 590444

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_PURGE_FAILURE_MODE => 590448

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_FILE_LAYOUT => 590455

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_IS_VOLUME_OWNED_BYCSVFS => 590456

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_INTEGRITY_INFORMATION => 590460

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_INTEGRITY_INFORMATION => 639616

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_FILE_REGIONS => 590468

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_RKF_INTERNAL => 590511

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SCRUB_DATA => 590512

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REPAIR_COPIES => 639668

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_DISABLE_LOCAL_BUFFERING => 590520

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CSV_MGMT_LOCK => 590524

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CSV_QUERY_DOWN_LEVEL_FILE_SYSTEM_CHARACTERISTICS => 590528

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_ADVANCE_FILE_ID => 590532

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CSV_SYNC_TUNNEL_REQUEST => 590536

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CSV_QUERY_VETO_FILE_DIRECT_IO => 590540

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_WRITE_USN_REASON => 590544

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CSV_CONTROL => 590548

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_REFS_VOLUME_DATA => 590552

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CSV_H_BREAKING_SYNC_TUNNEL_REQUEST => 590564

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_STORAGE_CLASSES => 590572

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_REGION_INFO => 590576

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_USN_TRACK_MODIFIED_RANGES => 590580

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_SHARED_VIRTUAL_DISK_SUPPORT => 590592

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SVHDX_SYNC_TUNNEL_REQUEST => 590596

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SVHDX_SET_INITIATOR_INFORMATION => 590600

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_EXTERNAL_BACKING => 590604

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_EXTERNAL_BACKING => 590608

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_DELETE_EXTERNAL_BACKING => 590612

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_ENUM_EXTERNAL_BACKING => 590616

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_ENUM_OVERLAY => 590623

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_ADD_OVERLAY => 623408

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REMOVE_OVERLAY => 623412

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_UPDATE_OVERLAY => 623416

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SHUFFLE_FILE => 639808

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_DUPLICATE_EXTENTS_TO_FILE => 623428

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SPARSE_OVERALLOCATE => 590668

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_STORAGE_QOS_CONTROL => 590672

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_INITIATE_FILE_METADATA_OPTIMIZATION => 590684

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_FILE_METADATA_OPTIMIZATION => 590688

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SVHDX_ASYNC_TUNNEL_REQUEST => 590692

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_WOF_VERSION => 590696

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_HCS_SYNC_TUNNEL_REQUEST => 590700

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_HCS_ASYNC_TUNNEL_REQUEST => 590704

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_EXTENT_READ_CACHE_INFO => 590711

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_REFS_VOLUME_COUNTER_INFO => 590715

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CLEAN_VOLUME_METADATA => 590716

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_INTEGRITY_INFORMATION_EX => 590720

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SUSPEND_OVERLAY => 590724

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_VIRTUAL_STORAGE_QUERY_PROPERTY => 590728

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_FILESYSTEM_GET_STATISTICS_EX => 590732

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_VOLUME_CONTAINER_STATE => 590736

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_LAYER_ROOT => 590740

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_DIRECT_ACCESS_EXTENTS => 590747

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_NOTIFY_STORAGE_SPACE_ALLOCATION => 590748

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SSDI_STORAGE_REQUEST => 590752

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_DIRECT_IMAGE_ORIGINAL_BASE => 590756

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_READ_UNPRIVILEGED_USN_JOURNAL => 590763

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GHOST_FILE_EXTENTS => 623532

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_GHOSTED_FILE_EXTENTS => 590768

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_UNMAP_SPACE => 590772

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_HCS_SYNC_NO_WRITE_TUNNEL_REQUEST => 590776

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_START_VIRTUALIZATION_INSTANCE => 590784

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_FILTER_FILE_IDENTIFIER => 590788

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_STREAMS_QUERY_PARAMETERS => 590788

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_STREAMS_ASSOCIATE_ID => 590792

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_STREAMS_QUERY_ID => 590796

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_RETRIEVAL_POINTERS_AND_REFCOUNT => 590803

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_VOLUME_NUMA_INFO => 590804

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REFS_DEALLOCATE_RANGES => 590808

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_REFS_SMR_VOLUME_INFO => 590812

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_REFS_SMR_VOLUME_GC_PARAMETERS => 590816

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_REFS_FILE_STRICTLY_SEQUENTIAL => 590820

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_DUPLICATE_EXTENTS_TO_FILE_EX => 623592

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_BAD_RANGES => 590828

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_DAX_ALLOC_ALIGNMENT_HINT => 590832

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_DELETE_CORRUPTED_REFS_CONTAINER => 590836

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SCRUB_UNDISCOVERABLE_ID => 590840

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_NOTIFY_DATA_CHANGE => 590844

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_START_VIRTUALIZATION_INSTANCE_EX => 590848

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_ENCRYPTION_KEY_CONTROL => 590852

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_VIRTUAL_STORAGE_SET_BEHAVIOR => 590856

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_REPARSE_POINT_EX => 590860

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REARRANGE_FILE => 640032

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_VIRTUAL_STORAGE_PASSTHROUGH => 590884

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_GET_RETRIEVAL_POINTER_COUNT => 590891

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_ENABLE_PER_IO_FLAGS => 590892

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_ASYNC_DUPLICATE_EXTENTS_STATUS => 590896

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SMB_SHARE_FLUSH_AND_PURGE => 590908

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REFS_STREAM_SNAPSHOT_MANAGEMENT => 590912

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_MANAGE_BYPASS_IO => 590920

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REFS_DEALLOCATE_RANGES_EX => 590924

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_SET_CACHED_RUNS_STATE => 590928

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REFS_SET_VOLUME_COMPRESSION_INFO => 590932

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REFS_QUERY_VOLUME_COMPRESSION_INFO => 590936

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_DUPLICATE_CLUSTER => 590940

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CREATE_LCN_WEAK_REFERENCE => 590944

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CLEAR_LCN_WEAK_REFERENCE => 590948

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_QUERY_LCN_WEAK_REFERENCE => 590952

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CLEAR_ALL_LCN_WEAK_REFERENCES => 590956

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REFS_SET_VOLUME_DEDUP_INFO => 590960

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REFS_QUERY_VOLUME_DEDUP_INFO => 590964

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_LMR_QUERY_INFO => 590968

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REFS_CHECKPOINT_VOLUME => 590972

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REFS_QUERY_VOLUME_TOTAL_SHARED_LCNS => 590976

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_UPGRADE_VOLUME => 590980

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REFS_SET_VOLUME_IO_METRICS_INFO => 590984

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REFS_QUERY_VOLUME_IO_METRICS_INFO => 590988

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REFS_SET_ROLLBACK_PROTECTION_INFO => 590992

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_REFS_QUERY_ROLLBACK_PROTECTION_INFO => 590996

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_FILE_SOV_CHECK_RANGE => 591000

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_CASCADES_REFS_SET_FILE_REMOTE => 591004

    /**
     * @type {Integer (UInt32)}
     */
    static GET_VOLUME_BITMAP_FLAG_MASK_METADATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_USN_TRACK_MODIFIED_RANGES_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USN_PAGE_SIZE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_DATA_OVERWRITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_DATA_EXTEND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_DATA_TRUNCATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_NAMED_DATA_OVERWRITE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_NAMED_DATA_EXTEND => 32

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_NAMED_DATA_TRUNCATION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_FILE_CREATE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_FILE_DELETE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_EA_CHANGE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_SECURITY_CHANGE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_RENAME_OLD_NAME => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_RENAME_NEW_NAME => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_INDEXABLE_CHANGE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_BASIC_INFO_CHANGE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_HARD_LINK_CHANGE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_COMPRESSION_CHANGE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_ENCRYPTION_CHANGE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_OBJECT_ID_CHANGE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_REPARSE_POINT_CHANGE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_STREAM_CHANGE => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_TRANSACTED_CHANGE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_INTEGRITY_CHANGE => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_DESIRED_STORAGE_CLASS_CHANGE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static USN_REASON_CLOSE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static USN_DELETE_VALID_FLAGS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_PROTECT_CLUSTERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_TXF_SYSTEM_LOG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_NOT_TXF_SYSTEM_LOG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_REALTIME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_NOT_REALTIME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_CLOUD_SYNC => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_READ_COPY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_NOT_READ_COPY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_FILTER_METADATA => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_RETURN_PURGE_FAILURE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_DISABLE_FILE_METADATA_OPTIMIZATION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_ENABLE_USN_SOURCE_ON_PAGING_IO => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_SKIP_COHERENCY_SYNC_DISALLOW_WRITES => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_SUPPRESS_VOLUME_OPEN_FLUSH => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_HANDLE_ENABLE_CPU_CACHE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static VOLUME_IS_DIRTY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VOLUME_UPGRADE_SCHEDULED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VOLUME_SESSION_OPEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PREFETCH_TYPE_FOR_CREATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PREFETCH_TYPE_FOR_DIRENUM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PREFETCH_TYPE_FOR_CREATE_EX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PREFETCH_TYPE_FOR_DIRENUM_EX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PREFETCH_TYPE_MAX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILESYSTEM_STATISTICS_TYPE_REFS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ZERO_DATA_INFORMATION_FLAG_PRESERVE_CACHED_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SET_ENCRYPTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CLEAR_ENCRYPTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_SET_ENCRYPTION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_CLEAR_ENCRYPTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_ENCRYPTION_VALUE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ENCRYPTION_FORMAT_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENCRYPTED_DATA_INFO_SPARSE_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENCRYPTED_DATA_INFO_SPARSE_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENCRYPTED_DATA_INFO_4K_SPARSE_UNIT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COPYFILE_SIS_LINK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COPYFILE_SIS_REPLACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COPYFILE_SIS_FLAGS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SET_REPAIR_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SET_REPAIR_WARN_ABOUT_DATA_LOSS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SET_REPAIR_DISABLED_AND_BUGCHECK_ON_CORRUPT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SET_REPAIR_VALID_MASK => 25

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_FILE_RECORD_NOT_IN_USE => 1

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_FILE_RECORD_REUSED => 2

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_FILE_RECORD_NOT_EXIST => 4

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_FILE_RECORD_NOT_BASE_RECORD => 8

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_SYSTEM_FILE => 16

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_NOT_IMPLEMENTED => 32

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_UNABLE_TO_REPAIR => 64

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_REPAIR_DISABLED => 128

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_RECURSIVELY_CORRUPTED => 256

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_ORPHAN_GENERATED => 512

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_REPAIRED => 1024

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_NOTHING_WRONG => 2048

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_ATTRIBUTE_NOT_FOUND => 4096

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_POTENTIAL_CROSSLINK => 8192

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_STALE_INFORMATION => 16384

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_CLUSTERS_ALREADY_IN_USE => 32768

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_LCN_NOT_EXIST => 65536

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_INVALID_RUN_LENGTH => 131072

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_FILE_RECORD_NOT_ORPHAN => 262144

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_FILE_RECORD_IS_BASE_RECORD => 524288

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_INVALID_ARRAY_LENGTH_COUNT => 1048576

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_SID_VALID => 2097152

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_SID_MISMATCH => 4194304

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_INVALID_PARENT => 8388608

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_PARENT_FILE_RECORD_NOT_IN_USE => 16777216

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_PARENT_FILE_RECORD_REUSED => 33554432

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_PARENT_FILE_RECORD_NOT_EXIST => 67108864

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_PARENT_FILE_RECORD_NOT_BASE_RECORD => 134217728

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_PARENT_FILE_RECORD_NOT_INDEX => 268435456

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_VALID_INDEX_ENTRY => 536870912

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_OUT_OF_GENERIC_NAMES => 1073741824

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_OUT_OF_RESOURCE => 2147483648

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_INVALID_LCN => 4294967296

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_INVALID_VCN => 8589934592

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_NAME_CONFLICT => 17179869184

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_ORPHAN => 34359738368

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_ATTRIBUTE_TOO_SMALL => 68719476736

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_ATTRIBUTE_NON_RESIDENT => 137438953472

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_DENY_DEFRAG => 274877906944

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_PREVIOUS_PARENT_STILL_VALID => 549755813888

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_INDEX_ENTRY_MISMATCH => 1099511627776

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_INVALID_ORPHAN_RECOVERY_NAME => 2199023255552

    /**
     * @type {Integer (UInt64)}
     */
    static FILE_INITIATE_REPAIR_HINT1_MULTIPLE_FILE_NAME_ATTRIBUTES => 4398046511104

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_LOGGING_MODE_SIMPLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_LOGGING_MODE_FULL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_TRANSACTION_STATE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_TRANSACTION_STATE_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_TRANSACTION_STATE_PREPARED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_TRANSACTION_STATE_NOTACTIVE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_STATE_NOT_STARTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_STATE_STARTING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_STATE_ACTIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_STATE_SHUTTING_DOWN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_ROLLFORWARD_REDO_FLAG_USE_LAST_REDO_LSN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_ROLLFORWARD_REDO_FLAG_USE_LAST_VIRTUAL_CLOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_START_RM_FLAG_LOG_CONTAINER_COUNT_MAX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_START_RM_FLAG_LOG_CONTAINER_COUNT_MIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_START_RM_FLAG_LOG_CONTAINER_SIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_START_RM_FLAG_LOG_GROWTH_INCREMENT_NUM_CONTAINERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_START_RM_FLAG_LOG_GROWTH_INCREMENT_PERCENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_START_RM_FLAG_LOG_AUTO_SHRINK_PERCENTAGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_START_RM_FLAG_LOG_NO_CONTAINER_COUNT_MAX => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_START_RM_FLAG_LOG_NO_CONTAINER_COUNT_MIN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_START_RM_FLAG_RECOVER_BEST_EFFORT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_START_RM_FLAG_LOGGING_MODE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_START_RM_FLAG_PRESERVE_CHANGES => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_START_RM_FLAG_PREFER_CONSISTENCY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_START_RM_FLAG_PREFER_AVAILABILITY => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_LIST_TRANSACTION_LOCKED_FILES_ENTRY_FLAG_CREATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_LIST_TRANSACTION_LOCKED_FILES_ENTRY_FLAG_DELETED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_TRANSACTED_VERSION_NONTRANSACTED => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_TRANSACTED_VERSION_UNCOMMITTED => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_SAVEPOINT_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_SAVEPOINT_ROLLBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_SAVEPOINT_CLEAR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_SAVEPOINT_CLEAR_ALL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_SHORT_NAME_CREATION_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_VOLUME_SCRUB_DISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_GLOBAL_METADATA_NO_SEEK_PENALTY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_LOCAL_METADATA_NO_SEEK_PENALTY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_NO_HEAT_GATHERING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_CONTAINS_BACKING_WIM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_BACKED_BY_WIM => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_NO_WRITE_AUTO_TIERING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_TXF_DISABLED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_REALLOCATE_ALL_DATA_WRITES => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_CHKDSK_RAN_ONCE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_MODIFIED_BY_CHKDSK => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_DAX_FORMATTED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_DEV_VOLUME => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PERSISTENT_VOLUME_STATE_TRUSTED_VOLUME => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_LEVEL_CACHE_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_LEVEL_CACHE_HANDLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_LEVEL_CACHE_WRITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static REQUEST_OPLOCK_INPUT_FLAG_REQUEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REQUEST_OPLOCK_INPUT_FLAG_ACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REQUEST_OPLOCK_INPUT_FLAG_COMPLETE_ACK_ON_CLOSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static REQUEST_OPLOCK_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REQUEST_OPLOCK_OUTPUT_FLAG_ACK_REQUIRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REQUEST_OPLOCK_OUTPUT_FLAG_MODES_PROVIDED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REQUEST_OPLOCK_OUTPUT_FLAG_WRITABLE_SECTION_PRESENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_DEPENDENT_VOLUME_REQUEST_FLAG_HOST_VOLUMES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_DEPENDENT_VOLUME_REQUEST_FLAG_GUEST_VOLUMES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SD_GLOBAL_CHANGE_TYPE_MACHINE_SID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SD_GLOBAL_CHANGE_TYPE_QUERY_STATS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SD_GLOBAL_CHANGE_TYPE_ENUM_SDS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static LOOKUP_STREAM_FROM_CLUSTER_ENTRY_FLAG_PAGE_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOOKUP_STREAM_FROM_CLUSTER_ENTRY_FLAG_DENY_DEFRAG_SET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LOOKUP_STREAM_FROM_CLUSTER_ENTRY_FLAG_FS_SYSTEM_FILE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LOOKUP_STREAM_FROM_CLUSTER_ENTRY_FLAG_TXF_SYSTEM_FILE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LOOKUP_STREAM_FROM_CLUSTER_ENTRY_ATTRIBUTE_MASK => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static LOOKUP_STREAM_FROM_CLUSTER_ENTRY_ATTRIBUTE_DATA => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static LOOKUP_STREAM_FROM_CLUSTER_ENTRY_ATTRIBUTE_INDEX => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static LOOKUP_STREAM_FROM_CLUSTER_ENTRY_ATTRIBUTE_SYSTEM => 50331648

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_TYPE_NOTIFICATION_FLAG_USAGE_BEGIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_TYPE_NOTIFICATION_FLAG_USAGE_END => 2

    /**
     * @type {Guid}
     */
    static FILE_TYPE_NOTIFICATION_GUID_PAGE_FILE => Guid("{0d0a64a1-38fc-4db8-9fe7-3f4352cd7c5c}")

    /**
     * @type {Guid}
     */
    static FILE_TYPE_NOTIFICATION_GUID_HIBERNATION_FILE => Guid("{b7624d64-b9a3-4cf8-8011-5b86c940e7b7}")

    /**
     * @type {Guid}
     */
    static FILE_TYPE_NOTIFICATION_GUID_CRASHDUMP_FILE => Guid("{9d453eb7-d2a6-4dbd-a2e3-fbd0ed9109a9}")

    /**
     * @type {Integer (UInt32)}
     */
    static CSV_MGMTLOCK_CHECK_VOLUME_REDIRECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSV_INVALID_DEVICE_NUMBER => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static CSV_QUERY_MDS_PATH_V2_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSV_QUERY_MDS_PATH_FLAG_STORAGE_ON_THIS_NODE_IS_CONNECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSV_QUERY_MDS_PATH_FLAG_CSV_DIRECT_IO_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CSV_QUERY_MDS_PATH_FLAG_SMB_BYPASS_CSV_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_RESTART => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_NAMES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_STREAMS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_EXTENTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_EXTRA_INFO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_STREAMS_WITH_NO_CLUSTERS_ALLOCATED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_FULL_PATH_IN_NAMES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_STREAM_INFORMATION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_STREAM_INFORMATION_FOR_DSC_ATTRIBUTE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_STREAM_INFORMATION_FOR_TXF_ATTRIBUTE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_STREAM_INFORMATION_FOR_EFS_ATTRIBUTE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_ONLY_FILES_WITH_SPECIFIC_ATTRIBUTES => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_FILES_WITH_DSC_ATTRIBUTE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_STREAM_INFORMATION_FOR_DATA_ATTRIBUTE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_STREAM_INFORMATION_FOR_REPARSE_ATTRIBUTE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_INCLUDE_STREAM_INFORMATION_FOR_EA_ATTRIBUTE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_SINGLE_INSTANCED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_LAYOUT_NAME_ENTRY_PRIMARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_LAYOUT_NAME_ENTRY_DOS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_LAYOUT_ENTRY_IMMOVABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_LAYOUT_ENTRY_PINNED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_LAYOUT_ENTRY_RESIDENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_LAYOUT_ENTRY_NO_CLUSTERS_ALLOCATED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_LAYOUT_ENTRY_HAS_INFORMATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_EXTENT_ENTRY_AS_RETRIEVAL_POINTERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STREAM_EXTENT_ENTRY_ALL_EXTENTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKSUM_TYPE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKSUM_TYPE_CRC32 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKSUM_TYPE_CRC64 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKSUM_TYPE_ECC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKSUM_TYPE_SHA256 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKSUM_TYPE_XXH64 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKSUM_TYPE_FIRST_UNUSED_TYPE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_INTEGRITY_FLAG_CHECKSUM_ENFORCEMENT_OFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OFFLOAD_READ_FLAG_ALL_ZERO_BEYOND_CURRENT_RANGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SET_PURGE_FAILURE_MODE_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SET_PURGE_FAILURE_MODE_DISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_REGION_USAGE_VALID_CACHED_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_REGION_USAGE_VALID_NONCACHED_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_REGION_USAGE_OTHER_PAGE_ALIGNMENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_REGION_USAGE_LARGE_PAGE_ALIGNMENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_REGION_USAGE_HUGE_PAGE_ALIGNMENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_REGION_USAGE_QUERY_ALIGNMENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_STORAGE_TIER_NAME_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_STORAGE_TIER_DESCRIPTION_LENGTH => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_STORAGE_TIER_FLAG_WRITE_BACK_CACHE => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_STORAGE_TIER_FLAG_READ_CACHE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_STORAGE_TIER_FLAG_PARITY => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_STORAGE_TIER_FLAG_SMR => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_STORAGE_CLASSES_FLAGS_MEASURE_WRITE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_STORAGE_CLASSES_FLAGS_MEASURE_READ => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_STORAGE_CLASSES_FLAGS_NO_DEFRAG_VOLUME => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_REPARSE_DATA_INVALID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_FILE_LAYOUT_REPARSE_TAG_INVALID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DUPLICATE_EXTENTS_DATA_EX_SOURCE_ATOMIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DUPLICATE_EXTENTS_DATA_EX_ASYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REFS_SMR_VOLUME_INFO_OUTPUT_VERSION_V0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REFS_SMR_VOLUME_INFO_OUTPUT_VERSION_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REFS_SMR_VOLUME_GC_PARAMETERS_VERSION_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STREAMS_INVALID_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STREAMS_MAX_ID => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static STREAMS_ASSOCIATE_ID_CLEAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STREAMS_ASSOCIATE_ID_SET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DAX_ALLOC_ALIGNMENT_FLAG_MANDATORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DAX_ALLOC_ALIGNMENT_FLAG_FALLBACK_SPECIFIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WOF_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WOF_PROVIDER_CLOUD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIM_PROVIDER_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIM_PROVIDER_EXTERNAL_FLAG_NOT_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIM_PROVIDER_EXTERNAL_FLAG_SUSPENDED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PROVIDER_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PROVIDER_SINGLE_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PROVIDER_COMPRESSION_MAXIMUM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PROVIDER_FLAG_COMPRESS_ON_WRITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONTAINER_VOLUME_STATE_HOSTING_CONTAINER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONTAINER_ROOT_INFO_FLAG_SCRATCH_ROOT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONTAINER_ROOT_INFO_FLAG_LAYER_ROOT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CONTAINER_ROOT_INFO_FLAG_VIRTUALIZATION_ROOT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CONTAINER_ROOT_INFO_FLAG_VIRTUALIZATION_TARGET_ROOT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CONTAINER_ROOT_INFO_FLAG_VIRTUALIZATION_EXCEPTION_ROOT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CONTAINER_ROOT_INFO_FLAG_BIND_ROOT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CONTAINER_ROOT_INFO_FLAG_BIND_TARGET_ROOT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CONTAINER_ROOT_INFO_FLAG_BIND_EXCEPTION_ROOT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CONTAINER_ROOT_INFO_FLAG_BIND_DO_NOT_MAP_NAME => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CONTAINER_ROOT_INFO_FLAG_UNION_LAYER_ROOT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CONTAINER_ROOT_INFO_VALID_FLAGS => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static PROJFS_PROTOCOL_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EFS_TRACKED_OFFSET_HEADER_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPACES_TRACKED_OFFSET_HEADER_FLAG => 2
;@endregion Constants

;@region Methods
;@endregion Methods
}
