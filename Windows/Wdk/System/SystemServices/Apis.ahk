#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class SystemServices {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static MCA_EXTREG_V2MAX => 24

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MAJOR_REVISION_SAL_03_00 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MINOR_REVISION_SAL_03_00 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESSOR_STATE_PARAMETER_CACHE_CHECK_SHIFT => 59

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESSOR_STATE_PARAMETER_CACHE_CHECK_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESSOR_STATE_PARAMETER_TLB_CHECK_SHIFT => 60

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESSOR_STATE_PARAMETER_TLB_CHECK_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESSOR_STATE_PARAMETER_BUS_CHECK_SHIFT => 61

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESSOR_STATE_PARAMETER_BUS_CHECK_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESSOR_STATE_PARAMETER_REG_CHECK_SHIFT => 62

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESSOR_STATE_PARAMETER_REG_CHECK_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESSOR_STATE_PARAMETER_MICROARCH_CHECK_SHIFT => 63

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESSOR_STATE_PARAMETER_MICROARCH_CHECK_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESSOR_STATE_PARAMETER_UNKNOWN_CHECK_SHIFT => 63

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESSOR_STATE_PARAMETER_UNKNOWN_CHECK_MASK => 1

    /**
     * @type {Guid}
     */
    static ERROR_MEMORY_GUID => Guid("{e429faf2-3cb7-11d4-bca7-0080c73c8881}")

    /**
     * @type {Guid}
     */
    static ERROR_PCI_BUS_GUID => Guid("{e429faf4-3cb7-11d4-bca7-0080c73c8881}")

    /**
     * @type {Integer (UInt16)}
     */
    static PciBusUnknownError => 0

    /**
     * @type {Integer (UInt16)}
     */
    static PciBusDataParityError => 1

    /**
     * @type {Integer (UInt16)}
     */
    static PciBusSystemError => 2

    /**
     * @type {Integer (UInt16)}
     */
    static PciBusMasterAbort => 3

    /**
     * @type {Integer (UInt16)}
     */
    static PciBusTimeOut => 4

    /**
     * @type {Integer (UInt16)}
     */
    static PciMasterDataParityError => 5

    /**
     * @type {Integer (UInt16)}
     */
    static PciAddressParityError => 6

    /**
     * @type {Integer (UInt16)}
     */
    static PciCommandParityError => 7

    /**
     * @type {Guid}
     */
    static ERROR_PCI_COMPONENT_GUID => Guid("{e429faf6-3cb7-11d4-bca7-0080c73c8881}")

    /**
     * @type {Guid}
     */
    static ERROR_SYSTEM_EVENT_LOG_GUID => Guid("{e429faf3-3cb7-11d4-bca7-0080c73c8881}")

    /**
     * @type {Guid}
     */
    static ERROR_SMBIOS_GUID => Guid("{e429faf5-3cb7-11d4-bca7-0080c73c8881}")

    /**
     * @type {Guid}
     */
    static ERROR_PLATFORM_SPECIFIC_GUID => Guid("{e429faf7-3cb7-11d4-bca7-0080c73c8881}")

    /**
     * @type {Guid}
     */
    static ERROR_PLATFORM_BUS_GUID => Guid("{e429faf9-3cb7-11d4-bca7-0080c73c8881}")

    /**
     * @type {Guid}
     */
    static ERROR_PLATFORM_HOST_CONTROLLER_GUID => Guid("{e429faf8-3cb7-11d4-bca7-0080c73c8881}")

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_STACK_SIZE => 12288

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_LARGE_STACK_SIZE => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_LARGE_STACK_COMMIT => 12288

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_MCA_EXCEPTION_STACK_SIZE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SE_UNSOLICITED_INPUT_PRIVILEGE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_HASH_ALLOCATED_HEADER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_HASH_RESERVED_SIGNATURE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_STACK_WALKING_MODE_FRAMES_TO_SKIP_SHIFT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CHARACTERISTICS_EXPECT_ORDERLY_REMOVAL_EX => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CHARACTERISTICS_EXPECT_SURPRISE_REMOVAL_EX => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CHARACTERISTICS_EXPECT_ORDERLY_REMOVAL_DEPRECATED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CHARACTERISTICS_EXPECT_SURPRISE_REMOVAL_DEPRECATED => 768

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CHARACTERISTICS_REMOVAL_POLICY_MASK_DEPRECATED => 768

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CHARACTERISTICS_EXPECT_ORDERLY_REMOVAL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CHARACTERISTICS_EXPECT_SURPRISE_REMOVAL => 768

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CHARACTERISTICS_REMOVAL_POLICY_MASK => 768

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CHARACTERISTICS_REMOVAL_POLICY_MASK_EX => 768

    /**
     * @type {Integer (UInt32)}
     */
    static SSINFO_FLAGS_ALIGNED_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSINFO_FLAGS_PARTITION_ALIGNED_ON_DEVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SSINFO_FLAGS_NO_SEEK_PENALTY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SSINFO_FLAGS_TRIM_ENABLED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SSINFO_FLAGS_BYTE_ADDRESSABLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SSINFO_OFFSET_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_CSWITCH_PMU_DISABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_CSWITCH_PMU_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_LUID_DOSDEVICES_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_HANDLE_EXCEPTIONS_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_HANDLE_RAISE_UM_EXCEPTION_ON_INVALID_HANDLE_CLOSE_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_HANDLE_RAISE_UM_EXCEPTION_ON_INVALID_HANDLE_CLOSE_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_HANDLE_TRACING_MAX_STACKS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_EXCEPTION_PORT_ALL_STATE_BITS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_THROTTLING_PROCESS_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_THROTTLING_PROCESS_EXECUTION_SPEED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_THROTTLING_PROCESS_DELAYTIMERS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_THROTTLING_PROCESS_IGNORE_TIMER_RESOLUTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_THROTTLING_THREAD_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_THROTTLING_THREAD_EXECUTION_SPEED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_THROTTLING_THREAD_VALID_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCR_MINOR_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCR_MAJOR_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PDI_SHIFT => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PPI_SHIFT => 30

    /**
     * @type {Integer (UInt32)}
     */
    static PTI_SHIFT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PTE_PER_PAGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PDE_PER_PAGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SYSTEM_SPACE_END => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static KUMS_UCH_VOLATILE_BIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RESULT_ZERO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RESULT_NEGATIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESULT_POSITIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NT_PAGING_LEVELS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PDE_BASE => 3224371200

    /**
     * @type {Integer (UInt32)}
     */
    static PTE_BASE => 3221225472

    /**
     * @type {Integer (UInt32)}
     */
    static PTE_TOP => 3225419775

    /**
     * @type {Integer (UInt32)}
     */
    static PDE_TOP => 3224375295

    /**
     * @type {Integer (UInt32)}
     */
    static CP15_PCR_RESERVED_MASK => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static PCR_BTI_MITIGATION_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCR_BTI_MITIGATION_VBAR_MASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PCR_BTI_MITIGATION_CSWAP_HVC => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PCR_BTI_MITIGATION_CSWAP_SMC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ARM64_PCR_RESERVED_MASK => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_VERIFIER_SPECIAL_POOLING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_VERIFIER_FORCE_IRQL_CHECKING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_VERIFIER_INJECT_ALLOCATION_FAILURES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_VERIFIER_TRACK_POOL_ALLOCATIONS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_VERIFIER_IO_CHECKING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NX_SUPPORT_POLICY_ALWAYSOFF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NX_SUPPORT_POLICY_ALWAYSON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NX_SUPPORT_POLICY_OPTIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NX_SUPPORT_POLICY_OPTOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SEH_VALIDATION_POLICY_ON => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SEH_VALIDATION_POLICY_OFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEH_VALIDATION_POLICY_TELEMETRY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SEH_VALIDATION_POLICY_DEFER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_ERROR_PORT_V => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_ELEVATION_ENABLED_V => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_VIRT_ENABLED_V => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_INSTALLER_DETECT_ENABLED_V => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_LKG_ENABLED_V => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_DYNAMIC_PROC_ENABLED_V => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_CONSOLE_BROKER_ENABLED_V => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_SECURE_BOOT_ENABLED_V => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_MULTI_SESSION_SKU_V => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_MULTIUSERS_IN_SESSION_SKU_V => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_STATE_SEPARATION_ENABLED_V => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_SET_GLOBAL_DATA_FLAG => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_CLEAR_GLOBAL_DATA_FLAG => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_CALL_SYSCALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_CALL_INT_2E => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_QPC_BYPASS_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_QPC_BYPASS_USE_HV_PAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_QPC_BYPASS_DISABLE_32BIT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_QPC_BYPASS_USE_MFENCE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_QPC_BYPASS_USE_LFENCE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_QPC_BYPASS_A73_ERRATA => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_GLOBAL_FLAGS_QPC_BYPASS_USE_RDTSCP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypeMaximum => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PCCARD_MAP_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCCARD_DEVICE_PCI => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PCCARD_SCAN_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCCARD_MAP_ZERO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCCARD_NO_TIMER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCCARD_NO_PIC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCCARD_NO_LEGACY_BASE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PCCARD_DUP_LEGACY_BASE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PCCARD_NO_CONTROLLERS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SINGLE_GROUP_LEGACY_API => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CP_GET_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CP_GET_NODATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CP_GET_ERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROTECTED_POOL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IO_KEYBOARD_INCREMENT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IO_MOUSE_INCREMENT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IO_PARALLEL_INCREMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SERIAL_INCREMENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SOUND_INCREMENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IO_VIDEO_INCREMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADD_PHYSICAL_MEMORY_ALREADY_ZEROED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADD_PHYSICAL_MEMORY_LARGE_PAGES_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ADD_PHYSICAL_MEMORY_HUGE_PAGES_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_REMOVE_PHYSICAL_MEMORY_BAD_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_GET_PHYSICAL_MEMORY_RANGES_INCLUDE_FILE_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_GET_PHYSICAL_MEMORY_RANGES_INCLUDE_ALL_PARTITIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COPY_MEMORY_PHYSICAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_COPY_MEMORY_VIRTUAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_GET_CACHE_ATTRIBUTE_IO_SPACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ANY_NODE_OK => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALLOCATE_CONTIGUOUS_MEMORY_FAST_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SECURE_EXCLUSIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SECURE_NO_CHANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SECURE_USER_MODE_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SECURE_NO_INHERIT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_SYSTEM_VIEW_EXCEPTIONS_FOR_INPAGE_ERRORS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_ADDRESSING_MODE_32BIT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PS_IMAGE_NOTIFY_CONFLICTING_ARCHITECTURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SILO_MONITOR_REGISTRATION_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PS_INVALID_SILO_CONTEXT_SLOT => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_DIRECTORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_NOTIFY_CHANGE_DIRECTORY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_NOTIFY_CHANGE_DIRECTORY_EX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_USER_FS_REQUEST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_MOUNT_VOLUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_VERIFY_VOLUME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_LOAD_FILE_SYSTEM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_TRACK_LINK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_KERNEL_CALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_LOCK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_UNLOCK_SINGLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_UNLOCK_ALL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_UNLOCK_ALL_BY_KEY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_FLUSH_AND_PURGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_FLUSH_DATA_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_FLUSH_NO_SYNC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_FLUSH_DATA_SYNC_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_DPC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_MDL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_COMPLETE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_COMPRESSED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_LEGACY_BUS_INFORMATION => 24

    /**
     * @type {Integer (UInt32)}
     */
    static IO_CHECK_CREATE_PARAMETERS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IO_ATTACH_DEVICE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IO_IGNORE_SHARE_ACCESS_CHECK => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DRVO_REINIT_REGISTERED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DRVO_INITIALIZED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DRVO_BOOTREINIT_REGISTERED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DRVO_LEGACY_RESOURCES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TXF_MINIVERSION_DEFAULT_VIEW => 65534

    /**
     * @type {Guid}
     */
    static GUID_ECP_CREATE_USER_PROCESS => Guid("{e0e429ff-6ddc-4e65-aab6-45d05a038a08}")

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_KEY_VERSION_WIN7 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_KEY_VERSION_WIN8 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_KEY_FLAG_PARENT_KEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OPLOCK_KEY_FLAG_TARGET_KEY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ARBITER_FLAG_BOOT_CONFIG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ARBITER_FLAG_ROOT_ENUM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ARBITER_FLAG_OTHER_ENUM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ARBITER_PARTIAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_DEBUG_BARS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DEVICE_FLAG_HAL_SCRATCH_ALLOCATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DEVICE_FLAG_BARS_MAPPED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DEVICE_FLAG_SCRATCH_ALLOCATED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DEVICE_FLAG_UNCACHED_MEMORY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DEVICE_FLAG_SYNTHETIC => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DEVICE_FLAG_HOST_VISIBLE_ALLOCATED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HAL_DISPATCH_VERSION => 5

    /**
     * @type {Integer (Int32)}
     */
    static HAL_PLATFORM_DISABLE_WRITE_COMBINING => 1

    /**
     * @type {Integer (Int32)}
     */
    static HAL_PLATFORM_DISABLE_PTCG => 4

    /**
     * @type {Integer (Int32)}
     */
    static HAL_PLATFORM_DISABLE_UC_MAIN_MEMORY => 8

    /**
     * @type {Integer (Int32)}
     */
    static HAL_PLATFORM_ENABLE_WRITE_COMBINING_MMIO => 16

    /**
     * @type {Integer (Int32)}
     */
    static HAL_PLATFORM_ACPI_TABLES_CACHED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_AGP_RATE_1X => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_AGP_RATE_2X => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_AGP_RATE_4X => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCIX_MODE_CONVENTIONAL_PCI => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCIX_MODE1_66MHZ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCIX_MODE1_100MHZ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCIX_MODE1_133MHZ => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCIX_MODE2_266_66MHZ => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PCIX_MODE2_266_100MHZ => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PCIX_MODE2_266_133MHZ => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PCIX_MODE2_533_66MHZ => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PCIX_MODE2_533_100MHZ => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PCIX_MODE2_533_133MHZ => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PCIX_VERSION_MODE1_ONLY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCIX_VERSION_MODE2_ECC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCIX_VERSION_DUAL_MODE_ECC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OSC_FIRMWARE_FAILURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OSC_UNRECOGNIZED_UUID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OSC_UNRECOGNIZED_REVISION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static OSC_CAPABILITIES_MASKED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ROOT_BUS_OSC_METHOD_CAPABILITY_REVISION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_VECTOR_SIZE_SUPPORTED_256BITS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_VECTOR_SIZE_SUPPORTED_512BITS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_VECTOR_SIZE_SUPPORTED_1KBITS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_VECTOR_SIZE_SUPPORTED_2KBITS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_VECTOR_SIZE_SUPPORTED_4KBITS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_VECTOR_SIZE_SUPPORTED_8KBITS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_RID_VECTOR_GRANULARITY_8RIDS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_RID_VECTOR_GRANULARITY_64RIDS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_RID_VECTOR_GRANULARITY_256RIDS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_LOW_VECTOR_GRANULARITY_1MB => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_LOW_VECTOR_GRANULARITY_2MB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_LOW_VECTOR_GRANULARITY_4MB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_LOW_VECTOR_GRANULARITY_8MB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_LOW_VECTOR_GRANULARITY_16MB => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_HIGH_VECTOR_GRANULARITY_256MB => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_HIGH_VECTOR_GRANULARITY_512MB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_HIGH_VECTOR_GRANULARITY_1GB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_HIGH_VECTOR_GRANULARITY_2GB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_HIGH_VECTOR_GRANULARITY_4GB => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_HIGH_VECTOR_GRANULARITY_8GB => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_HIGH_VECTOR_GRANULARITY_16GB => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_HIGH_VECTOR_GRANULARITY_32GB => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_VECTOR_GRANULARITY_1B => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_MEM_HIGH_VECTOR_GRANULARITY_1MB => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_VECTOR_SELECT_RID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_VECTOR_SELECT_MEM_LOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FPB_VECTOR_SELECT_MEM_HIGH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_DATA_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_TPH_ST_LOCATION_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_TPH_ST_LOCATION_TPH_CAPABILITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_TPH_ST_LOCATION_MSIX_TABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_TPH_ST_LOCATION_RESERVED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_INVALID_ALTERNATE_FUNCTION_NUMBER => 255

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_BUS_INTERFACE_STANDARD_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_INTERNAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_BUS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_MEM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_TLB => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_CACHE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_FUNCTION => 7

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_SELFTEST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_FLOW => 9

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_MAP => 17

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_IMPROPER => 18

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_UNIMPL => 19

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_LOSSOFLOCKSTEP => 20

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_RESPONSE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_PARITY => 22

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_PROTOCOL => 23

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_PATHERROR => 24

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_TIMEOUT => 25

    /**
     * @type {Integer (UInt32)}
     */
    static ERRTYP_POISONED => 26

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_RECORD_VALID_PLATFORMID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_RECORD_VALID_TIMESTAMP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_RECORD_VALID_PARTITIONID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_RECORD_FLAGS_RECOVERED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_RECORD_FLAGS_PREVIOUSERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_RECORD_FLAGS_SIMULATED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_RECORD_FLAGS_DEVICE_DRIVER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_RECORD_REVISION => 528

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_RECORD_SIGNATURE_END => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_SECTION_DESCRIPTOR_FLAGS_PRIMARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_SECTION_DESCRIPTOR_FLAGS_CONTAINMENTWRN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_SECTION_DESCRIPTOR_FLAGS_RESET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_SECTION_DESCRIPTOR_FLAGS_THRESHOLDEXCEEDED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_SECTION_DESCRIPTOR_FLAGS_RESOURCENA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_SECTION_DESCRIPTOR_FLAGS_LATENTERROR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_SECTION_DESCRIPTOR_FLAGS_PROPAGATED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_SECTION_DESCRIPTOR_FLAGS_FRU_TEXT_BY_PLUGIN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_RECORD_SECTION_DESCRIPTOR_REVISION => 768

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_SECTION_DESCRIPTOR_REVISION => 768

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_PROCTYPE_XPF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_PROCTYPE_IPF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_PROCTYPE_ARM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_PROCISA_X86 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_PROCISA_IPF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_PROCISA_X64 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_PROCISA_ARM32 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_PROCISA_ARM64 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_PROCERRTYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_PROCERRTYPE_CACHE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_PROCERRTYPE_TLB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_PROCERRTYPE_BUS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_PROCERRTYPE_MAE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_OP_GENERIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_OP_DATAREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_OP_DATAWRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_OP_INSTRUCTIONEXE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_FLAGS_RESTARTABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_FLAGS_PRECISEIP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_FLAGS_OVERFLOW => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GENPROC_FLAGS_CORRECTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CACHE_CHECK_TRANSACTIONTYPE_INSTRUCTION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CACHE_CHECK_TRANSACTIONTYPE_DATAACCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CACHE_CHECK_TRANSACTIONTYPE_GENERIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CACHE_CHECK_OPERATION_GENERIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CACHE_CHECK_OPERATION_GENREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CACHE_CHECK_OPERATION_GENWRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CACHE_CHECK_OPERATION_DATAREAD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CACHE_CHECK_OPERATION_DATAWRITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CACHE_CHECK_OPERATION_INSTRUCTIONFETCH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CACHE_CHECK_OPERATION_PREFETCH => 6

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CACHE_CHECK_OPERATION_EVICTION => 7

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CACHE_CHECK_OPERATION_SNOOP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_TLB_CHECK_TRANSACTIONTYPE_INSTRUCTION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_TLB_CHECK_TRANSACTIONTYPE_DATAACCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_TLB_CHECK_TRANSACTIONTYPE_GENERIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_TLB_CHECK_OPERATION_GENERIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_TLB_CHECK_OPERATION_GENREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_TLB_CHECK_OPERATION_GENWRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_TLB_CHECK_OPERATION_DATAREAD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_TLB_CHECK_OPERATION_DATAWRITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_TLB_CHECK_OPERATION_INSTRUCTIONFETCH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_TLB_CHECK_OPERATION_PREFETCH => 6

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_TRANSACTIONTYPE_INSTRUCTION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_TRANSACTIONTYPE_DATAACCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_TRANSACTIONTYPE_GENERIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_OPERATION_GENERIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_OPERATION_GENREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_OPERATION_GENWRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_OPERATION_DATAREAD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_OPERATION_DATAWRITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_OPERATION_INSTRUCTIONFETCH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_OPERATION_PREFETCH => 6

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_PARTICIPATION_PROCORIGINATED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_PARTICIPATION_PROCRESPONDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_PARTICIPATION_PROCOBSERVED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_PARTICIPATION_GENERIC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_ADDRESS_MEMORY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_ADDRESS_RESERVED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_ADDRESS_IO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_BUS_CHECK_ADDRESS_OTHER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_MS_CHECK_ERRORTYPE_NOERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_MS_CHECK_ERRORTYPE_UNCLASSIFIED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_MS_CHECK_ERRORTYPE_MCROMPARITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_MS_CHECK_ERRORTYPE_EXTERNAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_MS_CHECK_ERRORTYPE_FRC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_MS_CHECK_ERRORTYPE_INTERNALUNCLASSIFIED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CONTEXT_INFO_UNCLASSIFIEDDATA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CONTEXT_INFO_MSRREGISTERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CONTEXT_INFO_32BITCONTEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CONTEXT_INFO_64BITCONTEXT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CONTEXT_INFO_FXSAVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CONTEXT_INFO_32BITDEBUGREGS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CONTEXT_INFO_64BITDEBUGREGS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static XPF_CONTEXT_INFO_MMREGISTERS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEMERRTYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEMERRTYPE_NOERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEMERRTYPE_SINGLEBITECC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEMERRTYPE_MULTIBITECC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEMERRTYPE_SINGLESYMCHIPKILL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEMERRTYPE_MULTISYMCHIPKILL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEMERRTYPE_MASTERABORT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEMERRTYPE_TARGETABORT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEMERRTYPE_PARITYERROR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEMERRTYPE_WATCHDOGTIMEOUT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEMERRTYPE_INVALIDADDRESS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEMERRTYPE_MIRRORBROKEN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEMERRTYPE_MEMORYSPARING => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_PMEM_ERROR_SECTION_LOCATION_INFO_SIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_PMEM_ERROR_SECTION_MAX_PAGES => 50

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_PCIE_CORRECTABLE_ERROR_SECTION_COUNT_SIZE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PCIXBUS_ERRTYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCIXBUS_ERRTYPE_DATAPARITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCIXBUS_ERRTYPE_SYSTEM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCIXBUS_ERRTYPE_MASTERABORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCIXBUS_ERRTYPE_BUSTIMEOUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCIXBUS_ERRTYPE_MASTERDATAPARITY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PCIXBUS_ERRTYPE_ADDRESSPARITY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PCIXBUS_ERRTYPE_COMMANDPARITY => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_FIRMWARE_RECORD_TYPE_IPFSAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_XPF_MCA_EXTREG_MAX_COUNT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_XPF_MCA_SECTION_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_XPF_MCA_SECTION_VERSION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_XPF_MCA_SECTION_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_AMD_EXT_REG_NUM => 10

    /**
     * @type {Guid}
     */
    static CMC_NOTIFY_TYPE_GUID => Guid("{2dce8bb1-bdd7-450e-b9ad-9cf4ebd4f890}")

    /**
     * @type {Guid}
     */
    static CPE_NOTIFY_TYPE_GUID => Guid("{4e292f96-d843-4a55-a8c2-d481f27ebeee}")

    /**
     * @type {Guid}
     */
    static MCE_NOTIFY_TYPE_GUID => Guid("{e8f56ffe-919c-4cc5-ba88-65abe14913bb}")

    /**
     * @type {Guid}
     */
    static PCIe_NOTIFY_TYPE_GUID => Guid("{cf93c01f-1a16-4dfc-b8bc-9c4daf67c104}")

    /**
     * @type {Guid}
     */
    static INIT_NOTIFY_TYPE_GUID => Guid("{cc5263e8-9308-454a-89d0-340bd39bc98e}")

    /**
     * @type {Guid}
     */
    static NMI_NOTIFY_TYPE_GUID => Guid("{5bad89ff-b7e6-42c9-814a-cf2485d6e98a}")

    /**
     * @type {Guid}
     */
    static BOOT_NOTIFY_TYPE_GUID => Guid("{3d61a466-ab40-409a-a698-f362d464b38f}")

    /**
     * @type {Guid}
     */
    static SEA_NOTIFY_TYPE_GUID => Guid("{9a78788a-bbe8-11e4-809e-67611e5d46b0}")

    /**
     * @type {Guid}
     */
    static SEI_NOTIFY_TYPE_GUID => Guid("{5c284c81-b0ae-4e87-a322-b04c85624323}")

    /**
     * @type {Guid}
     */
    static PEI_NOTIFY_TYPE_GUID => Guid("{09a9d5ac-5204-4214-96e5-94992e752bcd}")

    /**
     * @type {Guid}
     */
    static BMC_NOTIFY_TYPE_GUID => Guid("{487565ba-6494-4367-95ca-4eff893522f6}")

    /**
     * @type {Guid}
     */
    static SCI_NOTIFY_TYPE_GUID => Guid("{e9d59197-94ee-4a4f-8ad8-9b7d8bd93d2e}")

    /**
     * @type {Guid}
     */
    static EXTINT_NOTIFY_TYPE_GUID => Guid("{fe84086e-b557-43cf-ac1b-17982e078470}")

    /**
     * @type {Guid}
     */
    static DEVICE_DRIVER_NOTIFY_TYPE_GUID => Guid("{0033f803-2e70-4e88-992c-6f26daf3db7a}")

    /**
     * @type {Guid}
     */
    static CMCI_NOTIFY_TYPE_GUID => Guid("{919448b2-3739-4b7f-a8f1-e0062805c2a3}")

    /**
     * @type {Guid}
     */
    static WHEA_DEVICE_ERROR_SUMMARY_GUID => Guid("{990b31e9-541a-4db0-a42f-837d344f6923}")

    /**
     * @type {Guid}
     */
    static PROCESSOR_GENERIC_ERROR_SECTION_GUID => Guid("{9876ccad-47b4-4bdb-b65e-16f193c4f3db}")

    /**
     * @type {Guid}
     */
    static XPF_PROCESSOR_ERROR_SECTION_GUID => Guid("{dc3ea0b0-a144-4797-b95b-53fa242b6e1d}")

    /**
     * @type {Guid}
     */
    static ARM_PROCESSOR_ERROR_SECTION_GUID => Guid("{e19e3d16-bc11-11e4-9caa-c2051d5d46b0}")

    /**
     * @type {Guid}
     */
    static MEMORY_ERROR_SECTION_GUID => Guid("{a5bc1114-6f64-4ede-b863-3e83ed7c83b1}")

    /**
     * @type {Guid}
     */
    static PCIEXPRESS_ERROR_SECTION_GUID => Guid("{d995e954-bbc1-430f-ad91-b44dcb3c6f35}")

    /**
     * @type {Guid}
     */
    static PCIXBUS_ERROR_SECTION_GUID => Guid("{c5753963-3b84-4095-bf78-eddad3f9c9dd}")

    /**
     * @type {Guid}
     */
    static PCIXDEVICE_ERROR_SECTION_GUID => Guid("{eb5e4685-ca66-4769-b6a2-26068b001326}")

    /**
     * @type {Guid}
     */
    static FIRMWARE_ERROR_RECORD_REFERENCE_GUID => Guid("{81212a96-09ed-4996-9471-8d729c8e69ed}")

    /**
     * @type {Guid}
     */
    static PMEM_ERROR_SECTION_GUID => Guid("{81687003-dbfd-4728-9ffd-f0904f97597d}")

    /**
     * @type {Guid}
     */
    static MU_TELEMETRY_SECTION_GUID => Guid("{85183a8b-9c41-429c-939c-5c3c087ca280}")

    /**
     * @type {Guid}
     */
    static RECOVERY_INFO_SECTION_GUID => Guid("{c34832a1-02c3-4c52-a9f1-9f1d5d7723fc}")

    /**
     * @type {Guid}
     */
    static WHEA_CACHECHECK_GUID => Guid("{a55701f5-e3ef-43de-ac72-249b573fad2c}")

    /**
     * @type {Guid}
     */
    static WHEA_TLBCHECK_GUID => Guid("{fc06b535-5e1f-4562-9f25-0a3b9adb63c3}")

    /**
     * @type {Guid}
     */
    static WHEA_BUSCHECK_GUID => Guid("{1cf3f8b3-c5b1-49a2-aa59-5eef92ffa63c}")

    /**
     * @type {Guid}
     */
    static WHEA_MSCHECK_GUID => Guid("{48ab7f57-dc34-4f6c-a7d3-b0b5b0a74314}")

    /**
     * @type {Guid}
     */
    static CPER_EMPTY_GUID => Guid("{00000000-0000-0000-0000-000000000000}")

    /**
     * @type {Guid}
     */
    static WHEA_RECORD_CREATOR_GUID => Guid("{cf07c4bd-b789-4e18-b3c4-1f732cb57131}")

    /**
     * @type {Guid}
     */
    static DEFAULT_DEVICE_DRIVER_CREATOR_GUID => Guid("{57217c8d-5e66-44fb-8033-9b74cacedf5b}")

    /**
     * @type {Guid}
     */
    static GENERIC_NOTIFY_TYPE_GUID => Guid("{3e62a467-ab40-409a-a698-f362d464b38f}")

    /**
     * @type {Guid}
     */
    static IPF_SAL_RECORD_SECTION_GUID => Guid("{6f3380d1-6eb0-497f-a578-4d4c65a71617}")

    /**
     * @type {Guid}
     */
    static XPF_MCA_SECTION_GUID => Guid("{8a1e1d01-42f9-4557-9c33-565e5cc3f7e8}")

    /**
     * @type {Guid}
     */
    static NMI_SECTION_GUID => Guid("{e71254e7-c1b9-4940-ab76-909703a4320f}")

    /**
     * @type {Guid}
     */
    static GENERIC_SECTION_GUID => Guid("{e71254e8-c1b9-4940-ab76-909703a4320f}")

    /**
     * @type {Guid}
     */
    static IPMI_MSR_DUMP_SECTION_GUID => Guid("{1c15b445-9b06-4667-ac25-33c056b88803}")

    /**
     * @type {Guid}
     */
    static WHEA_ERROR_PACKET_SECTION_GUID => Guid("{e71254e9-c1b9-4940-ab76-909703a4320f}")

    /**
     * @type {Guid}
     */
    static WHEA_DPC_CAPABILITY_SECTION_GUID => Guid("{ec49534b-30e7-4358-972f-eca6958fae3b}")

    /**
     * @type {Guid}
     */
    static PCIE_CORRECTABLE_ERROR_SUMMARY_SECTION_GUID => Guid("{e96eca99-53e2-4f52-9be7-d2dbe9508ed0}")

    /**
     * @type {Guid}
     */
    static MEMORY_CORRECTABLE_ERROR_SUMMARY_SECTION_GUID => Guid("{0e36c93e-ca15-4a83-ba8a-cbe80f7f0017}")

    /**
     * @type {Guid}
     */
    static SEA_SECTION_GUID => Guid("{f5fe48a6-84ce-4c1e-aa64-20c9a53099f1}")

    /**
     * @type {Guid}
     */
    static SEI_SECTION_GUID => Guid("{f2a4a152-9c6d-4020-aecf-7695b389251b}")

    /**
     * @type {Guid}
     */
    static PCI_RECOVERY_SECTION_GUID => Guid("{dd060800-f6e1-4204-ac27-c4bca9568402}")

    /**
     * @type {Integer (UInt32)}
     */
    static ANY_SIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_PACKET_V1_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_PACKET_V2_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_PACKET_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_PKT_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_LOG_ENTRY_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_TEXT_LEN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_SEL_BUGCHECK_RECOVERY_STATUS_PHASE1_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WCS_RAS_REGISTER_NAME_MAX_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_GENERIC_ENTRY_TEXT_LEN => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_GENERIC_ENTRY_V2_VERSION => 768

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_GENERIC_ENTRY_VERSION => 768

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MAX_LOG_DATA_LEN => 36

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_INVALID_ERR_SRC_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERR_SRC_OVERRIDE_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INJECT_ERRTYPE_PROCESSOR_CORRECTABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INJECT_ERRTYPE_PROCESSOR_UNCORRECTABLENONFATAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INJECT_ERRTYPE_PROCESSOR_UNCORRECTABLEFATAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INJECT_ERRTYPE_MEMORY_CORRECTABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INJECT_ERRTYPE_MEMORY_UNCORRECTABLENONFATAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INJECT_ERRTYPE_MEMORY_UNCORRECTABLEFATAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static INJECT_ERRTYPE_PCIEXPRESS_CORRECTABLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static INJECT_ERRTYPE_PCIEXPRESS_UNCORRECTABLENONFATAL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static INJECT_ERRTYPE_PCIEXPRESS_UNCORRECTABLEFATAL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static INJECT_ERRTYPE_PLATFORM_CORRECTABLE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static INJECT_ERRTYPE_PLATFORM_UNCORRECTABLENONFATAL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static INJECT_ERRTYPE_PLATFORM_UNCORRECTABLEFATAL => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_IN_USE_PAGE_NOTIFY_FLAG_PLATFORMDIRECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_IN_USE_PAGE_NOTIFY_FLAG_NOTIFYALL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_IN_USE_PAGE_NOTIFY_FLAG_PAGEOFFLINED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_PLUGIN_REGISTRATION_PACKET_V1 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_PLUGIN_REGISTRATION_PACKET_V2 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_PLUGIN_REGISTRATION_PACKET_VERSION => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PshedFADiscovery => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PshedFAErrorSourceControl => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PshedFAErrorRecordPersistence => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PshedFAErrorInfoRetrieval => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PshedFAErrorRecovery => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PshedFAErrorInjection => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_WRITE_FLAG_DUMMY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static _STRSAFE_USE_SECURE_CRT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KADDRESS_BASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static UADDRESS_BASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PASSIVE_LEVEL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LOW_LEVEL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static APC_LEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPATCH_LEVEL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CMCI_LEVEL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PROFILE_LEVEL => 27

    /**
     * @type {Integer (UInt32)}
     */
    static CLOCK1_LEVEL => 28

    /**
     * @type {Integer (UInt32)}
     */
    static CLOCK2_LEVEL => 28

    /**
     * @type {Integer (UInt32)}
     */
    static IPI_LEVEL => 29

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_LEVEL => 30

    /**
     * @type {Integer (UInt32)}
     */
    static HIGH_LEVEL => 31

    /**
     * @type {Integer (UInt32)}
     */
    static CLOCK_LEVEL => 28

    /**
     * @type {Integer (UInt32)}
     */
    static DRS_LEVEL => 14

    /**
     * @type {Integer (UInt32)}
     */
    static LOW_PRIORITY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LOW_REALTIME_PRIORITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HIGH_PRIORITY => 31

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_PRIORITY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LOCK_QUEUE_WAIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOCK_QUEUE_WAIT_BIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LOCK_QUEUE_OWNER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LOCK_QUEUE_OWNER_BIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOCK_QUEUE_HALTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LOCK_QUEUE_HALTED_BIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DPC_WATCHDOG_GLOBAL_TRIAGE_BLOCK_SIGNATURE => 2931740382

    /**
     * @type {Integer (UInt32)}
     */
    static DPC_WATCHDOG_GLOBAL_TRIAGE_BLOCK_REVISION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KI_USER_SHARED_DATA => 4292804608

    /**
     * @type {Integer (UInt32)}
     */
    static SharedInterruptTime => 4292804616

    /**
     * @type {Integer (UInt32)}
     */
    static SharedSystemTime => 4292804628

    /**
     * @type {Integer (UInt32)}
     */
    static SharedTickCount => 4292805408

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVILEGE_SET_ALL_NECESSARY => 1

    /**
     * @type {Integer (Int32)}
     */
    static SE_MIN_WELL_KNOWN_PRIVILEGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SE_CREATE_TOKEN_PRIVILEGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SE_ASSIGNPRIMARYTOKEN_PRIVILEGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static SE_LOCK_MEMORY_PRIVILEGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SE_INCREASE_QUOTA_PRIVILEGE => 5

    /**
     * @type {Integer (Int32)}
     */
    static SE_MACHINE_ACCOUNT_PRIVILEGE => 6

    /**
     * @type {Integer (Int32)}
     */
    static SE_TCB_PRIVILEGE => 7

    /**
     * @type {Integer (Int32)}
     */
    static SE_SECURITY_PRIVILEGE => 8

    /**
     * @type {Integer (Int32)}
     */
    static SE_TAKE_OWNERSHIP_PRIVILEGE => 9

    /**
     * @type {Integer (Int32)}
     */
    static SE_LOAD_DRIVER_PRIVILEGE => 10

    /**
     * @type {Integer (Int32)}
     */
    static SE_SYSTEM_PROFILE_PRIVILEGE => 11

    /**
     * @type {Integer (Int32)}
     */
    static SE_SYSTEMTIME_PRIVILEGE => 12

    /**
     * @type {Integer (Int32)}
     */
    static SE_PROF_SINGLE_PROCESS_PRIVILEGE => 13

    /**
     * @type {Integer (Int32)}
     */
    static SE_INC_BASE_PRIORITY_PRIVILEGE => 14

    /**
     * @type {Integer (Int32)}
     */
    static SE_CREATE_PAGEFILE_PRIVILEGE => 15

    /**
     * @type {Integer (Int32)}
     */
    static SE_CREATE_PERMANENT_PRIVILEGE => 16

    /**
     * @type {Integer (Int32)}
     */
    static SE_BACKUP_PRIVILEGE => 17

    /**
     * @type {Integer (Int32)}
     */
    static SE_RESTORE_PRIVILEGE => 18

    /**
     * @type {Integer (Int32)}
     */
    static SE_SHUTDOWN_PRIVILEGE => 19

    /**
     * @type {Integer (Int32)}
     */
    static SE_DEBUG_PRIVILEGE => 20

    /**
     * @type {Integer (Int32)}
     */
    static SE_AUDIT_PRIVILEGE => 21

    /**
     * @type {Integer (Int32)}
     */
    static SE_SYSTEM_ENVIRONMENT_PRIVILEGE => 22

    /**
     * @type {Integer (Int32)}
     */
    static SE_CHANGE_NOTIFY_PRIVILEGE => 23

    /**
     * @type {Integer (Int32)}
     */
    static SE_REMOTE_SHUTDOWN_PRIVILEGE => 24

    /**
     * @type {Integer (Int32)}
     */
    static SE_UNDOCK_PRIVILEGE => 25

    /**
     * @type {Integer (Int32)}
     */
    static SE_SYNC_AGENT_PRIVILEGE => 26

    /**
     * @type {Integer (Int32)}
     */
    static SE_ENABLE_DELEGATION_PRIVILEGE => 27

    /**
     * @type {Integer (Int32)}
     */
    static SE_MANAGE_VOLUME_PRIVILEGE => 28

    /**
     * @type {Integer (Int32)}
     */
    static SE_IMPERSONATE_PRIVILEGE => 29

    /**
     * @type {Integer (Int32)}
     */
    static SE_CREATE_GLOBAL_PRIVILEGE => 30

    /**
     * @type {Integer (Int32)}
     */
    static SE_TRUSTED_CREDMAN_ACCESS_PRIVILEGE => 31

    /**
     * @type {Integer (Int32)}
     */
    static SE_RELABEL_PRIVILEGE => 32

    /**
     * @type {Integer (Int32)}
     */
    static SE_INC_WORKING_SET_PRIVILEGE => 33

    /**
     * @type {Integer (Int32)}
     */
    static SE_TIME_ZONE_PRIVILEGE => 34

    /**
     * @type {Integer (Int32)}
     */
    static SE_CREATE_SYMBOLIC_LINK_PRIVILEGE => 35

    /**
     * @type {Integer (Int32)}
     */
    static SE_DELEGATE_SESSION_USER_IMPERSONATE_PRIVILEGE => 36

    /**
     * @type {Integer (Int32)}
     */
    static SE_MAX_WELL_KNOWN_PRIVILEGE => 36

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SHARE_VALID_FLAGS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_VALID_FLAGS => 32695

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_VALID_SET_FLAGS => 12711

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_VALID_KERNEL_SET_FLAGS => 5910951

    /**
     * @type {Integer (UInt32)}
     */
    static TREE_CONNECT_NO_CLIENT_BUFFERING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TREE_CONNECT_WRITE_THROUGH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VALID_EXTENDED_OPTION_FLAGS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static EX_CREATE_FLAG_FILE_SOURCE_OPEN_FOR_COPY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EX_CREATE_FLAG_FILE_DEST_OPEN_FOR_COPY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_QUERY_RESTART_SCAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_QUERY_RETURN_SINGLE_ENTRY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_QUERY_INDEX_SPECIFIED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_QUERY_RETURN_ON_DISK_ENTRIES_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_QUERY_NO_CURSOR_UPDATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_WRITE_TO_END_OF_FILE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_USE_FILE_POINTER_POSITION => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_BYTE_ALIGNMENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_WORD_ALIGNMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_LONG_ALIGNMENT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_QUAD_ALIGNMENT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_OCTA_ALIGNMENT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_32_BYTE_ALIGNMENT => 31

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_64_BYTE_ALIGNMENT => 63

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_128_BYTE_ALIGNMENT => 127

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_256_BYTE_ALIGNMENT => 255

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_512_BYTE_ALIGNMENT => 511

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_FILENAME_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_REMOVABLE_MEDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_READ_ONLY_DEVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FLOPPY_DISKETTE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_WRITE_ONCE_MEDIA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_REMOTE_DEVICE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_IS_MOUNTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VIRTUAL_VOLUME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_AUTOGENERATED_DEVICE_NAME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_SECURE_OPEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CHARACTERISTIC_PNP_DEVICE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CHARACTERISTIC_TS_DEVICE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CHARACTERISTIC_WEBDAV_DEVICE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CHARACTERISTIC_CSV => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_ALLOW_APPCONTAINER_TRAVERSAL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PORTABLE_DEVICE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_REMOTE_DEVICE_VSMB => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_REQUIRE_SECURITY_CHECK => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SESSION_STATE_ALL_EVENTS => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SESSION_STATE_CREATION_EVENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SESSION_STATE_TERMINATION_EVENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SESSION_STATE_CONNECT_EVENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SESSION_STATE_DISCONNECT_EVENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SESSION_STATE_LOGON_EVENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SESSION_STATE_LOGOFF_EVENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SESSION_STATE_VALID_EVENT_MASK => 63

    /**
     * @type {Integer (Int32)}
     */
    static IO_SESSION_MAX_PAYLOAD_SIZE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SKIP_SET_USER_EVENT_ON_FAST_IO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_LIMIT_SIZE => 240

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_MAXIMUM_MESSAGE_LENGTH => 512

    /**
     * @type {Integer (UInt32)}
     */
    static OBJECT_TYPE_CREATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIRECTORY_QUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIRECTORY_TRAVERSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIRECTORY_CREATE_OBJECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIRECTORY_CREATE_SUBDIRECTORY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SYMBOLIC_LINK_QUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYMBOLIC_LINK_SET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DUPLICATE_SAME_ATTRIBUTES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SECTION_QUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECTION_MAP_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECTION_MAP_READ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SECTION_MAP_EXECUTE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SECTION_MAP_EXECUTE_EXPLICIT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_NOACCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_READONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_READWRITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_WRITECOPY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_EXECUTE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_EXECUTE_READ => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_EXECUTE_READWRITE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_EXECUTE_WRITECOPY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GUARD => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_NOCACHE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_WRITECOMBINE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_NOACCESS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_READONLY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_READWRITE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_EXECUTE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_EXECUTE_READ => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_EXECUTE_READWRITE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_COHERENT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_GRAPHICS_NOCACHE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_ENCLAVE_THREAD_CONTROL => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_REVERT_TO_FILE_MAP => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_TARGETS_NO_UPDATE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_TARGETS_INVALID => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_ENCLAVE_UNVALIDATED => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_ENCLAVE_NO_CHANGE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_COMMIT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_RESERVE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_RESET => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_TOP_DOWN => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_RESET_UNDO => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_LARGE_PAGES => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_DECOMMIT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_RELEASE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_EXTENDED_PARAMETER_EC_CODE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_EXTENDED_PARAMETER_TYPE_BITS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_LARGE_PAGES => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_PRIVATE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_MAPPED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_ALERT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_GET_CONTEXT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PARKING_TOPOLOGY_POLICY_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_QUERY_DEVICE_POWER_STATE => 2703360

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SET_DEVICE_WAKE => 2719748

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_CANCEL_DEVICE_WAKE => 2719752

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_SETTING_VALUE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_PLATFORM_ROLE_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_PLATFORM_ROLE_V2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_PLATFORM_ROLE_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_SERVICE_MEASURED_BOOT_LOAD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypeNull => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypePort => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypeInterrupt => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypeMemory => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypeDma => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypeDeviceSpecific => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypeBusNumber => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypeMemoryLarge => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypeNonArbitrated => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypeConfigData => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypeDevicePrivate => 129

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypePcCardConfig => 130

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypeMfCardConfig => 131

    /**
     * @type {Integer (UInt32)}
     */
    static CmResourceTypeConnection => 132

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_INTERRUPT_LEVEL_SENSITIVE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_INTERRUPT_LATCHED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_INTERRUPT_MESSAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_INTERRUPT_POLICY_INCLUDED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_INTERRUPT_SECONDARY_INTERRUPT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_INTERRUPT_WAKE_HINT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_INTERRUPT_LEVEL_LATCHED_BITS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_READ_WRITE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_READ_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_WRITE_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_WRITEABILITY_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_PREFETCHABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_COMBINEDWRITE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_24 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_CACHEABLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_WINDOW_DECODE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_BAR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_COMPAT_FOR_INACCESSIBLE_RANGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_LARGE => 3584

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_LARGE_40 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_LARGE_48 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_MEMORY_LARGE_64 => 2048

    /**
     * @type {Integer (UInt64)}
     */
    static CM_RESOURCE_MEMORY_LARGE_40_MAXLEN => 1099511627520

    /**
     * @type {Integer (UInt64)}
     */
    static CM_RESOURCE_MEMORY_LARGE_48_MAXLEN => 281474976645120

    /**
     * @type {Integer (UInt64)}
     */
    static CM_RESOURCE_MEMORY_LARGE_64_MAXLEN => 18446744069414584320

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_PORT_MEMORY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_PORT_IO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_PORT_10_BIT_DECODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_PORT_12_BIT_DECODE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_PORT_16_BIT_DECODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_PORT_POSITIVE_DECODE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_PORT_PASSIVE_DECODE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_PORT_WINDOW_DECODE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_PORT_BAR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_DMA_8 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_DMA_16 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_DMA_32 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_DMA_8_AND_16 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_DMA_BUS_MASTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_DMA_TYPE_A => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_DMA_TYPE_B => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_DMA_TYPE_F => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_DMA_V3 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DMAV3_TRANFER_WIDTH_8 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DMAV3_TRANFER_WIDTH_16 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMAV3_TRANFER_WIDTH_32 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMAV3_TRANFER_WIDTH_64 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DMAV3_TRANFER_WIDTH_128 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DMAV3_TRANFER_WIDTH_256 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_CONNECTION_CLASS_GPIO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_CONNECTION_CLASS_SERIAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_CONNECTION_CLASS_FUNCTION_CONFIG => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_CONNECTION_TYPE_GPIO_IO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_CONNECTION_TYPE_SERIAL_I2C => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_CONNECTION_TYPE_SERIAL_SPI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_CONNECTION_TYPE_SERIAL_UART => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CM_RESOURCE_CONNECTION_TYPE_FUNCTION_CONFIG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_FUNCTION_ENABLED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_FREE_FORM_DATA => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_HAS_PORT_INIT_ENTRY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_HAS_PORT_RANGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_HAS_DMA_ENTRY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_HAS_IRQ_ENTRY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_HAS_MEMORY_ENTRY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_HAS_TYPE_ENTRY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_MORE_ENTRIES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_SYSTEM_MEMORY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_MEMORY_TYPE_RAM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_INVALID_SLOT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_INVALID_FUNCTION => 129

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_INVALID_CONFIGURATION => 130

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_EMPTY_SLOT => 131

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_INVALID_BIOS_CALL => 134

    /**
     * @type {Integer (UInt32)}
     */
    static IO_RESOURCE_PREFERRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_RESOURCE_DEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IO_RESOURCE_ALTERNATIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_QUERY_REGISTRY_SUBKEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_QUERY_REGISTRY_TOPKEY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_QUERY_REGISTRY_REQUIRED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_QUERY_REGISTRY_NOVALUE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_QUERY_REGISTRY_NOEXPAND => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_QUERY_REGISTRY_DIRECT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_QUERY_REGISTRY_DELETE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_QUERY_REGISTRY_NOSTRING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_QUERY_REGISTRY_TYPECHECK => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_QUERY_REGISTRY_TYPECHECK_SHIFT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_REGISTRY_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_REGISTRY_SERVICES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_REGISTRY_CONTROL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_REGISTRY_WINDOWS_NT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_REGISTRY_DEVICEMAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_REGISTRY_USER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_REGISTRY_MAXIMUM => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_REGISTRY_HANDLE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_REGISTRY_OPTIONAL => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static HASH_STRING_ALGORITHM_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HASH_STRING_ALGORITHM_X65599 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HASH_STRING_ALGORITHM_INVALID => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_GUID_STRING_SIZE => 38

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_STATUS_CONTROL_C => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_STATUS_SYSRQ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_STATUS_BUGCHECK_FIRST => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_STATUS_BUGCHECK_SECOND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_STATUS_FATAL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_STATUS_DEBUG_CONTROL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_STATUS_WORKER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static LOWBYTE_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static SHORT_LEAST_SIGNIFICANT_BIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHORT_MOST_SIGNIFICANT_BIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LONG_LEAST_SIGNIFICANT_BIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LONG_3RD_MOST_SIGNIFICANT_BIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LONG_2ND_MOST_SIGNIFICANT_BIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LONG_MOST_SIGNIFICANT_BIT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static POOL_TAGGING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DPC_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DPC_THREADED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_SIZE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static PAGE_SHIFT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_ALLOCATED_FIXED_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_LOCKED_PAGE_TABLES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_FREE_EXTRA_PTES => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_DESCRIBES_AWE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_PAGE_CONTENTS_INVARIANT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_INTERNAL => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static KENCODED_TIMER_PROCESSOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TIMER_TOLERABLE_DELAY_BITS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static TIMER_EXPIRED_INDEX_BITS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static TIMER_PROCESSOR_INDEX_BITS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FLUSH_MULTIPLE_MAXIMUM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ALLOC_PRAGMA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALLOC_DATA_PRAGMA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EFLAG_SIGN => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static EFLAG_ZERO => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_EVENT_COUNTERS => 31

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_QUERY_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEMAPHORE_QUERY_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_FEATURE_MAX => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_SOFTWARE_ORIGINATE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_WAIT_OBJECTS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KB_SECONDARY_DATA_FLAG_ADDITIONAL_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KB_SECONDARY_DATA_FLAG_NO_DEVICE_ACCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KB_ADD_PAGES_FLAG_VIRTUAL_ADDRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KB_ADD_PAGES_FLAG_PHYSICAL_ADDRESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KB_ADD_PAGES_FLAG_ADDITIONAL_RANGES_EXIST => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static KB_REMOVE_PAGES_FLAG_VIRTUAL_ADDRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KB_REMOVE_PAGES_FLAG_PHYSICAL_ADDRESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KB_REMOVE_PAGES_FLAG_ADDITIONAL_RANGES_EXIST => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static KE_MAX_TRIAGE_DUMP_DATA_MEMORY_SIZE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static KB_TRIAGE_DUMP_DATA_FLAG_BUGCHECK_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_DIVIDED_BY_ZERO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_DEBUG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_NMI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_INT3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_BOUND_CHECK => 5

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_INVALID_OPCODE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_NPX_NOT_AVAILABLE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_DOUBLE_FAULT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_NPX_OVERRUN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_INVALID_TSS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_SEGMENT_NOT_PRESENT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_STACK_FAULT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_GP_FAULT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_RESERVED_TRAP => 15

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_NPX_ERROR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_ALIGNMENT_CHECK => 17

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_CP_FAULT => 21

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_SE_FAULT => 23

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_VIRTUALIZATION_FAULT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KE_PROCESSOR_CHANGE_ADD_EXISTING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POOL_COLD_ALLOCATION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static POOL_NX_ALLOCATION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static POOL_ZERO_ALLOCATION => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static POOL_NX_OPTIN_AUTO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POOL_QUOTA_FAIL_INSTEAD_OF_RAISE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static POOL_RAISE_IF_ALLOCATION_FAILURE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static POOL_EXTENDED_PARAMETER_TYPE_BITS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static POOL_EXTENDED_PARAMETER_REQUIRED_FIELD_BITS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECURE_POOL_FLAGS_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SECURE_POOL_FLAGS_FREEABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECURE_POOL_FLAGS_MODIFIABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POOL_CREATE_FLG_SECURE_POOL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POOL_CREATE_FLG_USE_GLOBAL_POOL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POOL_CREATE_PARAMS_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FM_LOCK_BIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FM_LOCK_BIT_V => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EX_LOOKASIDE_LIST_EX_FLAGS_RAISE_ON_FAIL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EX_LOOKASIDE_LIST_EX_FLAGS_FAIL_NO_RAISE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EX_MAXIMUM_LOOKASIDE_DEPTH_BASE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static EX_MAXIMUM_LOOKASIDE_DEPTH_LIMIT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ResourceNeverExclusive => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ResourceReleaseByOtherThread => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ResourceOwnedExclusive => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_HASH_TABLE_SIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_OWNER_POINTER_IS_THREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EX_RUNDOWN_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EX_RUNDOWN_COUNT_SHIFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EX_TIMER_HIGH_RESOLUTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EX_TIMER_NO_WAKE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EX_CARR_ALLOCATE_PAGED_POOL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EX_CARR_ALLOCATE_NONPAGED_POOL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EX_CARR_DISABLE_EXPANSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EX_DEFAULT_PUSH_LOCK_FLAGS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ATS_DEVICE_SVM_OPTOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MAXIMUM_DISK_IO_SIZE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PERMANENT_ADDRESS_IS_IO_SPACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DUMP_MAP_CACHED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DUMP_MAP_INVALIDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MdlMappingNoWrite => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static MdlMappingNoExecute => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static MdlMappingWithGuardPtes => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static MM_MAPPING_ADDRESS_DIVISIBLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_DONT_ZERO_ALLOCATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALLOCATE_FROM_LOCAL_NODE_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALLOCATE_FULLY_REQUIRED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALLOCATE_NO_WAIT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALLOCATE_PREFER_CONTIGUOUS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALLOCATE_REQUIRE_CONTIGUOUS_CHUNKS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALLOCATE_FAST_LARGE_PAGES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALLOCATE_TRIM_IF_NECESSARY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MM_ALLOCATE_AND_HOT_REMOVE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MM_FREE_MDL_PAGES_ZERO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROTECT_DRIVER_SECTION_ALLOW_UNLOAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MM_PROTECT_DRIVER_SECTION_VALID_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INITIAL_PRIVILEGE_COUNT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_ADAPTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_CONTROLLER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_DEVICE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_DRIVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_FILE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_IRP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_MASTER_ADAPTER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_OPEN_PACKET => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_TIMER => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_VPB => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_ERROR_LOG => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_ERROR_MESSAGE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_DEVICE_OBJECT_EXTENSION => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_IORING => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_CREATE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_CREATE_NAMED_PIPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_CLOSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_READ => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_WRITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_QUERY_INFORMATION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_SET_INFORMATION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_QUERY_EA => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_SET_EA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_FLUSH_BUFFERS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_QUERY_VOLUME_INFORMATION => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_SET_VOLUME_INFORMATION => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_DIRECTORY_CONTROL => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_FILE_SYSTEM_CONTROL => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_DEVICE_CONTROL => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_INTERNAL_DEVICE_CONTROL => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_SHUTDOWN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_LOCK_CONTROL => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_CLEANUP => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_CREATE_MAILSLOT => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_QUERY_SECURITY => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_SET_SECURITY => 21

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_POWER => 22

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_SYSTEM_CONTROL => 23

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_DEVICE_CHANGE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_QUERY_QUOTA => 25

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_SET_QUOTA => 26

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_PNP => 27

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_PNP_POWER => 27

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_MAXIMUM_FUNCTION => 27

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MJ_SCSI => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_SCSI_CLASS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_START_DEVICE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_REMOVE_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_REMOVE_DEVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_CANCEL_REMOVE_DEVICE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_STOP_DEVICE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_STOP_DEVICE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_CANCEL_STOP_DEVICE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_DEVICE_RELATIONS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_INTERFACE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_CAPABILITIES => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_RESOURCES => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_RESOURCE_REQUIREMENTS => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_DEVICE_TEXT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_FILTER_RESOURCE_REQUIREMENTS => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_READ_CONFIG => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_WRITE_CONFIG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_EJECT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_SET_LOCK => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_ID => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_PNP_DEVICE_STATE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_BUS_INFORMATION => 21

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_DEVICE_USAGE_NOTIFICATION => 22

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_SURPRISE_REMOVAL => 23

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_DEVICE_ENUMERATED => 25

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_WAIT_WAKE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_POWER_SEQUENCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_SET_POWER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_POWER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_ALL_DATA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_QUERY_SINGLE_INSTANCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_CHANGE_SINGLE_INSTANCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_CHANGE_SINGLE_ITEM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_ENABLE_EVENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_DISABLE_EVENTS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_ENABLE_COLLECTION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_DISABLE_COLLECTION => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_REGINFO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_EXECUTE_METHOD => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MN_REGINFO_EX => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IO_FORCE_ACCESS_CHECK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_NO_PARAMETER_CHECKING => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REMOUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_GLOBAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VPB_MOUNTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VPB_LOCKED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VPB_PERSISTENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VPB_REMOVE_PENDING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VPB_RAW_MOUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VPB_DIRECT_WRITES_ALLOWED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static VPB_FLAGS_BYPASSIO_BLOCKED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static VPB_DISMOUNTING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DRVO_UNLOAD_INVOKED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRVO_LEGACY_DRIVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRVO_BUILTIN_DRIVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FO_FILE_OPEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FO_SYNCHRONOUS_IO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FO_ALERTABLE_IO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FO_NO_INTERMEDIATE_BUFFERING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FO_WRITE_THROUGH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FO_SEQUENTIAL_ONLY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FO_CACHE_SUPPORTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FO_NAMED_PIPE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FO_STREAM_FILE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FO_MAILSLOT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FO_GENERATE_AUDIT_ON_CLOSE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FO_QUEUE_IRP_TO_THREAD => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FO_DIRECT_DEVICE_OPEN => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FO_FILE_MODIFIED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FO_FILE_SIZE_CHANGED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FO_CLEANUP_COMPLETE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FO_TEMPORARY_FILE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FO_DELETE_ON_CLOSE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FO_OPENED_CASE_SENSITIVE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FO_HANDLE_CREATED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static FO_FILE_FAST_IO_READ => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static FO_RANDOM_ACCESS => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static FO_FILE_OPEN_CANCELLED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static FO_VOLUME_OPEN => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static FO_BYPASS_IO_ENABLED => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static FO_REMOTE_ORIGIN => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static FO_DISALLOW_EXCLUSIVE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static FO_SKIP_COMPLETION_PORT => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static FO_SKIP_SET_EVENT => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static FO_SKIP_SET_FAST_IO => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static FO_INDIRECT_WAIT_OBJECT => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static FO_SECTION_MINSTORE_TREATMENT => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static FO_FLAGS_VALID_ONLY_DURING_CREATE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_NOCACHE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_PAGING_IO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_MOUNT_COMPLETION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_SYNCHRONOUS_API => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_ASSOCIATED_IRP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_BUFFERED_IO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_DEALLOCATE_BUFFER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_INPUT_OPERATION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_SYNCHRONOUS_PAGING_IO => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_CREATE_OPERATION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_READ_OPERATION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_WRITE_OPERATION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_CLOSE_OPERATION => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_DEFER_IO_COMPLETION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_OB_QUERY_NAME => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_HOLD_DEVICE_QUEUE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_UM_DRIVER_INITIATED_IO => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_QUOTA_CHARGED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_ALLOCATED_MUST_SUCCEED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_ALLOCATED_FIXED_SIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IRP_LOOKASIDE_ALLOCATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SL_PENDING_RETURNED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SL_ERROR_RETURNED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SL_INVOKE_ON_CANCEL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SL_INVOKE_ON_SUCCESS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SL_INVOKE_ON_ERROR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SL_FORCE_ACCESS_CHECK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SL_OPEN_PAGING_FILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SL_OPEN_TARGET_DIRECTORY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SL_STOP_ON_SYMLINK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SL_IGNORE_READONLY_ATTRIBUTE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SL_CASE_SENSITIVE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SL_KEY_SPECIFIED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SL_OVERRIDE_VERIFY_VOLUME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SL_WRITE_THROUGH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SL_FT_SEQUENTIAL_WRITE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SL_FORCE_DIRECT_WRITE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SL_REALTIME_STREAM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SL_PERSISTENT_MEMORY_FIXED_MAPPING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SL_BYPASS_IO => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SL_FORCE_ASYNCHRONOUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SL_READ_ACCESS_GRANTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SL_WRITE_ACCESS_GRANTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SL_FAIL_IMMEDIATELY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SL_EXCLUSIVE_LOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SL_RESTART_SCAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SL_RETURN_SINGLE_ENTRY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SL_INDEX_SPECIFIED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SL_RETURN_ON_DISK_ENTRIES_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SL_NO_CURSOR_UPDATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SL_QUERY_DIRECTORY_MASK => 27

    /**
     * @type {Integer (UInt32)}
     */
    static SL_WATCH_TREE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SL_ALLOW_RAW_MOUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SL_BYPASS_ACCESS_CHECK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SL_INFO_FORCE_ACCESS_CHECK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SL_INFO_IGNORE_READONLY_ATTRIBUTE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_DEVICE_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_DEVICE_DONT_DISPLAY_IN_UI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_DEVICE_FAILED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_DEVICE_REMOVED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_DEVICE_RESOURCE_REQUIREMENTS_CHANGED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_DEVICE_NOT_DISABLEABLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_DEVICE_DISCONNECTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_DEVICE_RESOURCE_UPDATED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_DEVICE_ASSIGNED_TO_GUEST => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SHARE_ACCESS_NO_WRITE_PERMISSION => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SHARE_ACCESS_NON_PRIMARY_STREAM => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IO_CHECK_SHARE_ACCESS_UPDATE_SHARE_ACCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_CHECK_SHARE_ACCESS_DONT_UPDATE_FILE_OBJECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IO_CHECK_SHARE_ACCESS_DONT_CHECK_READ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IO_CHECK_SHARE_ACCESS_DONT_CHECK_WRITE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IO_CHECK_SHARE_ACCESS_DONT_CHECK_DELETE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IO_CHECK_SHARE_ACCESS_FORCE_CHECK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IO_CHECK_SHARE_ACCESS_FORCE_USING_SCB => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_FULLY_SPECIFIED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_LINE_BASED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_MESSAGE_BASED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_FULLY_SPECIFIED_GROUP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_MESSAGE_BASED_PASSIVE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECT_CURRENT_VERSION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WDM_MAJORVERSION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WDM_MINORVERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_ACTION_REGISTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_ACTION_DEREGISTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_ACTION_REREGISTER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_ACTION_UPDATE_GUIDS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_ACTION_BLOCK_IRPS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREGISTER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WMIUPDATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_CSQ_IRP_CONTEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_CSQ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IO_TYPE_CSQ_EX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IO_ATTRIBUTION_INFO_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SET_IRP_IO_ATTRIBUTION_FROM_THREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SET_IRP_IO_ATTRIBUTION_FROM_PROCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IO_SET_IRP_IO_ATTRIBUTION_FLAGS_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static __string_type => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static __guid_type => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static __multiString_type => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SECURITY_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SECURITY_INTERFACE_VERSION2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SECURITY_FULLY_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SECURITY_ENHANCED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SECURITY_GUEST_ASSIGNED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SECURITY_DIRECT_TRANSLATED_P2P => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SECURITY_SRIOV_DIRECT_TRANSLATED_P2P => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ATS_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_EXTENDED_ADDRESS_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3COLD_SUPPORT_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_PTM_TIME_SOURCE_AUX => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static NPEM_CONTROL_INTERFACE_VERSION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NPEM_CONTROL_INTERFACE_VERSION2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NPEM_CONTROL_INTERFACE_CURRENT_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGPLAY_REGKEY_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGPLAY_REGKEY_DRIVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGPLAY_REGKEY_CURRENT_HWPROFILE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_INTERFACE_INCLUDE_NONACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PNPNOTIFY_DEVICE_INTERFACE_INCLUDE_EXISTING_INTERFACES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_SOFT_RESTART_NOTIFICATION_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGPLAY_PROPERTY_PERSISTENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_REPLACE_PARAMETERS_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_REPLACE_DRIVER_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_REPLACE_MEMORY_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_REPLACE_PROCESSOR_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_REPLACE_HARDWARE_MEMORY_MIRRORING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_REPLACE_HARDWARE_PAGE_COPY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_REPLACE_HARDWARE_QUIESCE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_RESET_INTERFACE_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_RESET_INTERFACE_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_RESET_INTERFACE_VERSION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_RESET_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECURE_DRIVER_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SDEV_IDENTIFIER_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DESCRIPTION_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DESCRIPTION_VERSION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DESCRIPTION_VERSION2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DESCRIPTION_VERSION3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_ADAPTER_INFO_VERSION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ADAPTER_INFO_SYNCHRONOUS_CALLBACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ADAPTER_INFO_API_BYPASS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_TRANSFER_INFO_VERSION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_TRANSFER_INFO_VERSION2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_TRANSFER_CONTEXT_VERSION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_TRANSFER_CONTEXT_SIZE_V1 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_SYNCHRONOUS_CALLBACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_ZERO_BUFFERS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_FAIL_ON_BOUNCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HAL_MASK_UNMASK_FLAGS_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HAL_MASK_UNMASK_FLAGS_SERVICING_DEFERRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HAL_MASK_UNMASK_FLAGS_SERVICING_COMPLETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HAL_DMA_ADAPTER_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DOMAIN_COMMON_BUFFER_LARGE_PAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IOMMU_ACCESS_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IOMMU_ACCESS_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IOMMU_ACCESS_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_IOMMU_INTERFACE_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_IOMMU_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_IOMMU_INTERFACE_EX_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_IOMMU_INTERFACE_EX_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_IOMMU_INTERFACE_EX_VERSION_MIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_IOMMU_INTERFACE_EX_VERSION_MAX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_IOMMU_INTERFACE_EX_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PO_MEM_PRESERVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PO_MEM_CLONE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PO_MEM_CL_OR_NCHK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PO_MEM_DISCARD => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PO_MEM_PAGE_ADDRESS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PO_MEM_BOOT_PHASE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PO_FX_VERSION_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PO_FX_VERSION_V2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PO_FX_VERSION_V3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PO_FX_VERSION => 1

    /**
     * @type {Integer (UInt64)}
     */
    static PO_FX_COMPONENT_FLAG_F0_ON_DX => 1

    /**
     * @type {Integer (UInt64)}
     */
    static PO_FX_COMPONENT_FLAG_NO_DEBOUNCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PO_FX_DIRECTED_FX_DEFAULT_IDLE_TIMEOUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PO_FX_UNKNOWN_POWER => 4294967295

    /**
     * @type {Integer (UInt64)}
     */
    static PO_FX_UNKNOWN_TIME => 18446744073709551615

    /**
     * @type {Integer (UInt32)}
     */
    static PO_FX_FLAG_BLOCKING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PO_FX_FLAG_ASYNC_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PO_FX_FLAG_PERF_PEP_OPTIONAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PO_FX_FLAG_PERF_QUERY_ON_F0 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PO_FX_FLAG_PERF_QUERY_ON_ALL_IDLE_STATES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OB_FLT_REGISTRATION_VERSION_0100 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static OB_FLT_REGISTRATION_VERSION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static OB_OPERATION_HANDLE_CREATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OB_OPERATION_HANDLE_DUPLICATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_TYPE0_ADDRESSES => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_TYPE1_ADDRESSES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_TYPE2_ADDRESSES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXTENDED_CONFIG_LENGTH => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_MAX_DEVICES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_MAX_FUNCTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_MAX_BRIDGE_NUMBER => 255

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_MAX_SEGMENT_NUMBER => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_INVALID_VENDORID => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_MULTIFUNCTION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_DEVICE_TYPE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_BRIDGE_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CARDBUS_BRIDGE_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ENABLE_IO_SPACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ENABLE_MEMORY_SPACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ENABLE_BUS_MASTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ENABLE_SPECIAL_CYCLES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ENABLE_WRITE_AND_INVALIDATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ENABLE_VGA_COMPATIBLE_PALETTE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ENABLE_PARITY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ENABLE_WAIT_CYCLE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ENABLE_SERR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ENABLE_FAST_BACK_TO_BACK => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_DISABLE_LEVEL_INTERRUPT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_STATUS_IMMEDIATE_READINESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_STATUS_INTERRUPT_PENDING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_STATUS_CAPABILITIES_LIST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_STATUS_66MHZ_CAPABLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_STATUS_UDF_SUPPORTED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_STATUS_FAST_BACK_TO_BACK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_STATUS_DATA_PARITY_DETECTED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_STATUS_DEVSEL => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_STATUS_SIGNALED_TARGET_ABORT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_STATUS_RECEIVED_TARGET_ABORT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_STATUS_RECEIVED_MASTER_ABORT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_STATUS_SIGNALED_SYSTEM_ERROR => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_STATUS_DETECTED_PARITY_ERROR => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_WHICHSPACE_CONFIG => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_WHICHSPACE_ROM => 1382638416

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_POWER_MANAGEMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_AGP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_VPD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_SLOT_ID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_MSI => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_CPCI_HOTSWAP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_PCIX => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_HYPERTRANSPORT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_VENDOR_SPECIFIC => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_DEBUG_PORT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_CPCI_RES_CTRL => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_SHPC => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_P2P_SSID => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_AGP_TARGET => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_SECURE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_PCI_EXPRESS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_MSIX => 17

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_SATA_CONFIG => 18

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_ADVANCED_FEATURES => 19

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CAPABILITY_ID_FPB => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_ADVANCED_ERROR_REPORTING_CAP_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_VIRTUAL_CHANNEL_CAP_ID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_DEVICE_SERIAL_NUMBER_CAP_ID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_POWER_BUDGETING_CAP_ID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_RC_LINK_DECLARATION_CAP_ID => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_RC_INTERNAL_LINK_CONTROL_CAP_ID => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_RC_EVENT_COLLECTOR_ENDPOINT_ASSOCIATION_CAP_ID => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_MFVC_CAP_ID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_VC_AND_MFVC_CAP_ID => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_RCRB_HEADER_CAP_ID => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_VENDOR_SPECIFIC_CAP_ID => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_CONFIGURATION_ACCESS_CORRELATION_CAP_ID => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_ACCESS_CONTROL_SERVICES_CAP_ID => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_ARI_CAP_ID => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_ATS_CAP_ID => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_SINGLE_ROOT_IO_VIRTUALIZATION_CAP_ID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_MULTI_ROOT_IO_VIRTUALIZATION_CAP_ID => 17

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_MULTICAST_CAP_ID => 18

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_PAGE_REQUEST_CAP_ID => 19

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_RESERVED_FOR_AMD_CAP_ID => 20

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_RESIZABLE_BAR_CAP_ID => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_DPA_CAP_ID => 22

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_TPH_REQUESTER_CAP_ID => 23

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_LTR_CAP_ID => 24

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_SECONDARY_PCI_EXPRESS_CAP_ID => 25

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_PMUX_CAP_ID => 26

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_PASID_CAP_ID => 27

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_LN_REQUESTER_CAP_ID => 28

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_DPC_CAP_ID => 29

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_L1_PM_SS_CAP_ID => 30

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_PTM_CAP_ID => 31

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_MPCIE_CAP_ID => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_FRS_QUEUEING_CAP_ID => 33

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_READINESS_TIME_REPORTING_CAP_ID => 34

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_DESIGNATED_VENDOR_SPECIFIC_CAP_ID => 35

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_NPEM_CAP_ID => 41

    /**
     * @type {Integer (UInt32)}
     */
    static ROOT_CMD_ENABLE_CORRECTABLE_ERROR_REPORTING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ROOT_CMD_ENABLE_NONFATAL_ERROR_REPORTING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ROOT_CMD_ENABLE_FATAL_ERROR_REPORTING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ACS_ALLOWED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ACS_BLOCKED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ACS_REDIRECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_PRE_20 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_MASS_STORAGE_CTLR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_NETWORK_CTLR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_DISPLAY_CTLR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_MULTIMEDIA_DEV => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_MEMORY_CTLR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_BRIDGE_DEV => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_SIMPLE_COMMS_CTLR => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_BASE_SYSTEM_DEV => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_INPUT_DEV => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_DOCKING_STATION => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_PROCESSOR => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_SERIAL_BUS_CTLR => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_WIRELESS_CTLR => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_INTELLIGENT_IO_CTLR => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_SATELLITE_COMMS_CTLR => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_ENCRYPTION_DECRYPTION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_DATA_ACQ_SIGNAL_PROC => 17

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CLASS_NOT_DEFINED => 255

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_PRE_20_NON_VGA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_PRE_20_VGA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MSC_SCSI_BUS_CTLR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MSC_IDE_CTLR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MSC_FLOPPY_CTLR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MSC_IPI_CTLR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MSC_RAID_CTLR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MSC_AHCI_CTLR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MSC_NVM_CTLR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MSC_OTHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_PROGRAMMING_INTERFACE_MSC_NVM_EXPRESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_NET_ETHERNET_CTLR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_NET_TOKEN_RING_CTLR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_NET_FDDI_CTLR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_NET_ATM_CTLR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_NET_ISDN_CTLR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_NET_OTHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_VID_VGA_CTLR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_VID_XGA_CTLR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBLCASS_VID_3D_CTLR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_VID_OTHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MM_VIDEO_DEV => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MM_AUDIO_DEV => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MM_TELEPHONY_DEV => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MM_OTHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MEM_RAM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MEM_FLASH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_MEM_OTHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_BR_HOST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_BR_ISA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_BR_EISA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_BR_MCA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_BR_PCI_TO_PCI => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_BR_PCMCIA => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_BR_NUBUS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_BR_CARDBUS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_BR_RACEWAY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_BR_OTHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_COM_SERIAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_COM_PARALLEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_COM_MULTIPORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_COM_MODEM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_COM_OTHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SYS_INTERRUPT_CTLR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SYS_DMA_CTLR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SYS_SYSTEM_TIMER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SYS_REAL_TIME_CLOCK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SYS_GEN_HOTPLUG_CTLR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SYS_SDIO_CTRL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SYS_RCEC => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SYS_OTHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_INP_KEYBOARD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_INP_DIGITIZER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_INP_MOUSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_INP_SCANNER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_INP_GAMEPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_INP_OTHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_DOC_GENERIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_DOC_OTHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_PROC_386 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_PROC_486 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_PROC_PENTIUM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_PROC_ALPHA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_PROC_POWERPC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_PROC_COPROCESSOR => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SB_IEEE1394 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SB_ACCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SB_SSA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SB_USB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SB_FIBRE_CHANNEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SB_SMBUS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SB_THUNDERBOLT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_WIRELESS_IRDA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_WIRELESS_CON_IR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_WIRELESS_RF => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_WIRELESS_OTHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_INTIO_I2O => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SAT_TV => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SAT_AUDIO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SAT_VOICE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_SAT_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_CRYPTO_NET_COMP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_CRYPTO_ENTERTAINMENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_CRYPTO_OTHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_DASP_DPIO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_SUBCLASS_DASP_OTHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ADDRESS_IO_SPACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ADDRESS_MEMORY_TYPE_MASK => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ADDRESS_MEMORY_PREFETCHABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ADDRESS_IO_ADDRESS_MASK => 4294967292

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ADDRESS_MEMORY_ADDRESS_MASK => 4294967280

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ADDRESS_ROM_ADDRESS_MASK => 4294965248

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_TYPE_32BIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_TYPE_20BIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_TYPE_64BIT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_ROMADDRESS_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_DEVICE_PRESENT_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_USE_SUBSYSTEM_IDS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_USE_REVISION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_USE_VENDEV_IDS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_USE_CLASS_SUBCLASS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_USE_PROGIF => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_USE_LOCAL_BUS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_USE_LOCAL_DEVICE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_LINK_QUIESCENT_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_EXPRESS_ROOT_PORT_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_MSIX_TABLE_CONFIG_INTERFACE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PCW_VERSION_1 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PCW_VERSION_2 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PCW_CURRENT_VERSION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SECURE_SECTION_ALLOW_PARTIAL_MDL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POOL_ZEROING_INFORMATION => 227

    /**
     * @type {Integer (Byte)}
     */
    static ClfsNullRecord => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static ClfsDataRecord => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static ClfsRestartRecord => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static ClfsClientRecord => 0x03

    /**
     * @type {Integer (UInt32)}
     */
    static ClsContainerInitializing => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ClsContainerInactive => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ClsContainerActive => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ClsContainerActivePendingDelete => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ClsContainerPendingArchive => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ClsContainerPendingArchiveAndDelete => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ClfsContainerInitializing => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ClfsContainerInactive => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ClfsContainerActive => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ClfsContainerActivePendingDelete => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ClfsContainerPendingArchive => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ClfsContainerPendingArchiveAndDelete => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CLFS_MAX_CONTAINER_INFO => 256

    /**
     * @type {Integer (Byte)}
     */
    static CLFS_SCAN_INIT => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static CLFS_SCAN_FORWARD => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static CLFS_SCAN_BACKWARD => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static CLFS_SCAN_CLOSE => 0x08

    /**
     * @type {Integer (Byte)}
     */
    static CLFS_SCAN_INITIALIZED => 0x10

    /**
     * @type {Integer (Byte)}
     */
    static CLFS_SCAN_BUFFERED => 0x20
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<UNICODE_STRING>} DriverServiceName 
     * @returns {NTSTATUS} 
     */
    static NtLoadDriver(DriverServiceName) {
        result := DllCall("ntdll.dll\NtLoadDriver", "ptr", DriverServiceName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} DriverServiceName 
     * @returns {NTSTATUS} 
     */
    static NtUnloadDriver(DriverServiceName) {
        result := DllCall("ntdll.dll\NtUnloadDriver", "ptr", DriverServiceName, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @returns {NTSTATUS} 
     */
    static NtMakeTemporaryObject(Handle) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("ntdll.dll\NtMakeTemporaryObject", "ptr", Handle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TmHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<UNICODE_STRING>} LogFileName 
     * @param {Integer} CreateOptions 
     * @param {Integer} CommitStrength 
     * @returns {NTSTATUS} 
     */
    static NtCreateTransactionManager(TmHandle, DesiredAccess, ObjectAttributes, LogFileName, CreateOptions, CommitStrength) {
        result := DllCall("ntdll.dll\NtCreateTransactionManager", "ptr", TmHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", LogFileName, "uint", CreateOptions, "uint", CommitStrength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TmHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<UNICODE_STRING>} LogFileName 
     * @param {Pointer<Guid>} TmIdentity 
     * @param {Integer} OpenOptions 
     * @returns {NTSTATUS} 
     */
    static NtOpenTransactionManager(TmHandle, DesiredAccess, ObjectAttributes, LogFileName, TmIdentity, OpenOptions) {
        result := DllCall("ntdll.dll\NtOpenTransactionManager", "ptr", TmHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", LogFileName, "ptr", TmIdentity, "uint", OpenOptions, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionManagerHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static NtRollforwardTransactionManager(TransactionManagerHandle, TmVirtualClock) {
        TransactionManagerHandle := TransactionManagerHandle is Win32Handle ? NumGet(TransactionManagerHandle, "ptr") : TransactionManagerHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtRollforwardTransactionManager", "ptr", TransactionManagerHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionManagerHandle 
     * @returns {NTSTATUS} 
     */
    static NtRecoverTransactionManager(TransactionManagerHandle) {
        TransactionManagerHandle := TransactionManagerHandle is Win32Handle ? NumGet(TransactionManagerHandle, "ptr") : TransactionManagerHandle

        result := DllCall("ntdll.dll\NtRecoverTransactionManager", "ptr", TransactionManagerHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} RootObjectHandle 
     * @param {Integer} QueryType 
     * @param {Pointer} ObjectCursor 
     * @param {Integer} ObjectCursorLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static NtEnumerateTransactionObject(RootObjectHandle, QueryType, ObjectCursor, ObjectCursorLength, ReturnLength) {
        RootObjectHandle := RootObjectHandle is Win32Handle ? NumGet(RootObjectHandle, "ptr") : RootObjectHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtEnumerateTransactionObject", "ptr", RootObjectHandle, "int", QueryType, "ptr", ObjectCursor, "uint", ObjectCursorLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TransactionHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<Guid>} Uow 
     * @param {HANDLE} TmHandle 
     * @param {Integer} CreateOptions 
     * @param {Integer} IsolationLevel 
     * @param {Integer} IsolationFlags 
     * @param {Pointer<Integer>} Timeout 
     * @param {Pointer<UNICODE_STRING>} Description 
     * @returns {NTSTATUS} 
     */
    static NtCreateTransaction(TransactionHandle, DesiredAccess, ObjectAttributes, Uow, TmHandle, CreateOptions, IsolationLevel, IsolationFlags, Timeout, Description) {
        TmHandle := TmHandle is Win32Handle ? NumGet(TmHandle, "ptr") : TmHandle

        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtCreateTransaction", "ptr", TransactionHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", Uow, "ptr", TmHandle, "uint", CreateOptions, "uint", IsolationLevel, "uint", IsolationFlags, TimeoutMarshal, Timeout, "ptr", Description, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionHandle 
     * @param {Integer} TransactionInformationClass 
     * @param {Pointer} TransactionInformation 
     * @param {Integer} TransactionInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static NtQueryInformationTransaction(TransactionHandle, TransactionInformationClass, TransactionInformation, TransactionInformationLength, ReturnLength) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryInformationTransaction", "ptr", TransactionHandle, "int", TransactionInformationClass, "ptr", TransactionInformation, "uint", TransactionInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionHandle 
     * @param {BOOLEAN} Wait 
     * @returns {NTSTATUS} 
     */
    static NtCommitTransaction(TransactionHandle, Wait) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        result := DllCall("ntdll.dll\NtCommitTransaction", "ptr", TransactionHandle, "char", Wait, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionHandle 
     * @param {BOOLEAN} Wait 
     * @returns {NTSTATUS} 
     */
    static NtRollbackTransaction(TransactionHandle, Wait) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        result := DllCall("ntdll.dll\NtRollbackTransaction", "ptr", TransactionHandle, "char", Wait, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ResourceManagerHandle 
     * @returns {NTSTATUS} 
     */
    static NtRecoverResourceManager(ResourceManagerHandle) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle

        result := DllCall("ntdll.dll\NtRecoverResourceManager", "ptr", ResourceManagerHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ResourceManagerHandle 
     * @param {Integer} ResourceManagerInformationClass 
     * @param {Pointer} ResourceManagerInformation 
     * @param {Integer} ResourceManagerInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static NtQueryInformationResourceManager(ResourceManagerHandle, ResourceManagerInformationClass, ResourceManagerInformation, ResourceManagerInformationLength, ReturnLength) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryInformationResourceManager", "ptr", ResourceManagerHandle, "int", ResourceManagerInformationClass, "ptr", ResourceManagerInformation, "uint", ResourceManagerInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ResourceManagerHandle 
     * @param {Integer} ResourceManagerInformationClass 
     * @param {Pointer} ResourceManagerInformation 
     * @param {Integer} ResourceManagerInformationLength 
     * @returns {NTSTATUS} 
     */
    static NtSetInformationResourceManager(ResourceManagerHandle, ResourceManagerInformationClass, ResourceManagerInformation, ResourceManagerInformationLength) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle

        result := DllCall("ntdll.dll\NtSetInformationResourceManager", "ptr", ResourceManagerHandle, "int", ResourceManagerInformationClass, "ptr", ResourceManagerInformation, "uint", ResourceManagerInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} EnlistmentHandle 
     * @param {Integer} DesiredAccess 
     * @param {HANDLE} ResourceManagerHandle 
     * @param {HANDLE} TransactionHandle 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Integer} CreateOptions 
     * @param {Integer} NotificationMask 
     * @param {Pointer<Void>} EnlistmentKey 
     * @returns {NTSTATUS} 
     */
    static NtCreateEnlistment(EnlistmentHandle, DesiredAccess, ResourceManagerHandle, TransactionHandle, ObjectAttributes, CreateOptions, NotificationMask, EnlistmentKey) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        EnlistmentKeyMarshal := EnlistmentKey is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\NtCreateEnlistment", "ptr", EnlistmentHandle, "uint", DesiredAccess, "ptr", ResourceManagerHandle, "ptr", TransactionHandle, "ptr", ObjectAttributes, "uint", CreateOptions, "uint", NotificationMask, EnlistmentKeyMarshal, EnlistmentKey, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Void>} EnlistmentKey 
     * @returns {NTSTATUS} 
     */
    static NtRecoverEnlistment(EnlistmentHandle, EnlistmentKey) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        EnlistmentKeyMarshal := EnlistmentKey is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\NtRecoverEnlistment", "ptr", EnlistmentHandle, EnlistmentKeyMarshal, EnlistmentKey, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static NtPrePrepareEnlistment(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtPrePrepareEnlistment", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static NtPrepareEnlistment(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtPrepareEnlistment", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static NtCommitEnlistment(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtCommitEnlistment", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static NtRollbackEnlistment(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtRollbackEnlistment", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static NtPrePrepareComplete(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtPrePrepareComplete", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static NtPrepareComplete(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtPrepareComplete", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static NtCommitComplete(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtCommitComplete", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static NtReadOnlyEnlistment(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtReadOnlyEnlistment", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static NtRollbackComplete(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtRollbackComplete", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static NtSinglePhaseReject(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\NtSinglePhaseReject", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} String 
     * @returns {NTSTATUS} 
     */
    static NtDisplayString(String) {
        result := DllCall("ntdll.dll\NtDisplayString", "ptr", String, "int")
        return result
    }

    /**
     * 
     * @param {Integer} InformationLevel 
     * @param {Pointer} InputBuffer 
     * @param {Integer} InputBufferLength 
     * @param {Pointer} OutputBuffer 
     * @param {Integer} OutputBufferLength 
     * @returns {NTSTATUS} 
     */
    static NtPowerInformation(InformationLevel, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength) {
        result := DllCall("ntdll.dll\NtPowerInformation", "int", InformationLevel, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<LUID>} Luid 
     * @returns {NTSTATUS} 
     */
    static NtAllocateLocallyUniqueId(Luid) {
        result := DllCall("ntdll.dll\NtAllocateLocallyUniqueId", "ptr", Luid, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TargetHandle 
     * @param {HANDLE} SourceHandle 
     * @param {Integer} PartitionInformationClass 
     * @param {Pointer} PartitionInformation 
     * @param {Integer} PartitionInformationLength 
     * @returns {NTSTATUS} 
     */
    static ZwManagePartition(TargetHandle, SourceHandle, PartitionInformationClass, PartitionInformation, PartitionInformationLength) {
        TargetHandle := TargetHandle is Win32Handle ? NumGet(TargetHandle, "ptr") : TargetHandle
        SourceHandle := SourceHandle is Win32Handle ? NumGet(SourceHandle, "ptr") : SourceHandle

        result := DllCall("ntdll.dll\ZwManagePartition", "ptr", TargetHandle, "ptr", SourceHandle, "int", PartitionInformationClass, "ptr", PartitionInformation, "uint", PartitionInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ResourceManager 
     * @param {Pointer<Guid>} ProtocolId 
     * @param {Integer} ProtocolInformationSize 
     * @param {Pointer<Void>} ProtocolInformation 
     * @param {Integer} CreateOptions 
     * @returns {NTSTATUS} 
     */
    static ZwRegisterProtocolAddressInformation(ResourceManager, ProtocolId, ProtocolInformationSize, ProtocolInformation, CreateOptions) {
        ResourceManager := ResourceManager is Win32Handle ? NumGet(ResourceManager, "ptr") : ResourceManager

        ProtocolInformationMarshal := ProtocolInformation is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwRegisterProtocolAddressInformation", "ptr", ResourceManager, "ptr", ProtocolId, "uint", ProtocolInformationSize, ProtocolInformationMarshal, ProtocolInformation, "uint", CreateOptions, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} LogFileName 
     * @param {Pointer<Guid>} ExistingTransactionManagerGuid 
     * @returns {NTSTATUS} 
     */
    static ZwRenameTransactionManager(LogFileName, ExistingTransactionManagerGuid) {
        result := DllCall("ntdll.dll\ZwRenameTransactionManager", "ptr", LogFileName, "ptr", ExistingTransactionManagerGuid, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ResourceManagerHandle 
     * @param {Integer} RequestCookie 
     * @param {Integer} BufferLength 
     * @param {Pointer<Void>} Buffer_R 
     * @returns {NTSTATUS} 
     */
    static ZwPropagationComplete(ResourceManagerHandle, RequestCookie, BufferLength, Buffer_R) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle

        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwPropagationComplete", "ptr", ResourceManagerHandle, "uint", RequestCookie, "uint", BufferLength, Buffer_RMarshal, Buffer_R, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ResourceManagerHandle 
     * @param {Integer} RequestCookie 
     * @param {NTSTATUS} PropStatus 
     * @returns {NTSTATUS} 
     */
    static ZwPropagationFailed(ResourceManagerHandle, RequestCookie, PropStatus) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle

        result := DllCall("ntdll.dll\ZwPropagationFailed", "ptr", ResourceManagerHandle, "uint", RequestCookie, "int", PropStatus, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TargetHandle 
     * @param {HANDLE} SourceHandle 
     * @param {Integer} PartitionInformationClass 
     * @param {Pointer} PartitionInformation 
     * @param {Integer} PartitionInformationLength 
     * @returns {NTSTATUS} 
     */
    static NtManagePartition(TargetHandle, SourceHandle, PartitionInformationClass, PartitionInformation, PartitionInformationLength) {
        TargetHandle := TargetHandle is Win32Handle ? NumGet(TargetHandle, "ptr") : TargetHandle
        SourceHandle := SourceHandle is Win32Handle ? NumGet(SourceHandle, "ptr") : SourceHandle

        result := DllCall("ntdll.dll\NtManagePartition", "ptr", TargetHandle, "ptr", SourceHandle, "int", PartitionInformationClass, "ptr", PartitionInformation, "uint", PartitionInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} VoidFailedAssertion 
     * @param {Pointer<Void>} VoidFileName 
     * @param {Integer} LineNumber 
     * @param {PSTR} MutableMessage 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlAssert(VoidFailedAssertion, VoidFileName, LineNumber, MutableMessage) {
        MutableMessage := MutableMessage is String ? StrPtr(MutableMessage) : MutableMessage

        VoidFailedAssertionMarshal := VoidFailedAssertion is VarRef ? "ptr" : "ptr"
        VoidFileNameMarshal := VoidFileName is VarRef ? "ptr" : "ptr"

        DllCall("ntdll.dll\RtlAssert", VoidFailedAssertionMarshal, VoidFailedAssertion, VoidFileNameMarshal, VoidFileName, "uint", LineNumber, "ptr", MutableMessage)
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Base 
     * @param {Pointer<UNICODE_STRING>} String 
     * @returns {NTSTATUS} 
     */
    static RtlIntegerToUnicodeString(Value, Base, String) {
        result := DllCall("ntdll.dll\RtlIntegerToUnicodeString", "uint", Value, "uint", Base, "ptr", String, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Base 
     * @param {Pointer<UNICODE_STRING>} String 
     * @returns {NTSTATUS} 
     */
    static RtlInt64ToUnicodeString(Value, Base, String) {
        result := DllCall("ntdll.dll\RtlInt64ToUnicodeString", "uint", Value, "uint", Base, "ptr", String, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} String 
     * @param {Integer} Base 
     * @param {Pointer<Integer>} Value 
     * @returns {NTSTATUS} 
     */
    static RtlUnicodeStringToInteger(String, Base, Value) {
        ValueMarshal := Value is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlUnicodeStringToInteger", "ptr", String, "uint", Base, ValueMarshal, Value, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} String 
     * @param {Integer} Base 
     * @param {Pointer<Integer>} Number_R 
     * @param {Pointer<PWSTR>} EndPointer 
     * @returns {NTSTATUS} 
     */
    static RtlUnicodeStringToInt64(String, Base, Number_R, EndPointer) {
        Number_RMarshal := Number_R is VarRef ? "int64*" : "ptr"
        EndPointerMarshal := EndPointer is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\RtlUnicodeStringToInt64", "ptr", String, "uint", Base, Number_RMarshal, Number_R, EndPointerMarshal, EndPointer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} DestinationString 
     * @param {Pointer<Integer>} SourceString 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlInitUTF8String(DestinationString, SourceString) {
        SourceStringMarshal := SourceString is VarRef ? "char*" : "ptr"

        DllCall("ntdll.dll\RtlInitUTF8String", "ptr", DestinationString, SourceStringMarshal, SourceString)
    }

    /**
     * 
     * @param {Integer} RelativeTo 
     * @param {PWSTR} Path 
     * @param {Pointer<RTL_QUERY_REGISTRY_TABLE>} QueryTable 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<Void>} Environment 
     * @returns {NTSTATUS} 
     */
    static RtlQueryRegistryValues(RelativeTo, Path, QueryTable, Context, Environment) {
        Path := Path is String ? StrPtr(Path) : Path

        ContextMarshal := Context is VarRef ? "ptr" : "ptr"
        EnvironmentMarshal := Environment is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlQueryRegistryValues", "uint", RelativeTo, "ptr", Path, "ptr", QueryTable, ContextMarshal, Context, EnvironmentMarshal, Environment, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SystemRoutineName 
     * @returns {Pointer<Void>} 
     */
    static MmGetSystemRoutineAddress(SystemRoutineName) {
        result := DllCall("ntoskrnl.exe\MmGetSystemRoutineAddress", "ptr", SystemRoutineName, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} RelativeTo 
     * @param {PWSTR} Path 
     * @param {PWSTR} ValueName 
     * @param {Integer} ValueType 
     * @param {Pointer} ValueData 
     * @param {Integer} ValueLength 
     * @returns {NTSTATUS} 
     */
    static RtlWriteRegistryValue(RelativeTo, Path, ValueName, ValueType, ValueData, ValueLength) {
        Path := Path is String ? StrPtr(Path) : Path
        ValueName := ValueName is String ? StrPtr(ValueName) : ValueName

        result := DllCall("ntdll.dll\RtlWriteRegistryValue", "uint", RelativeTo, "ptr", Path, "ptr", ValueName, "uint", ValueType, "ptr", ValueData, "uint", ValueLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} RelativeTo 
     * @param {PWSTR} Path 
     * @param {PWSTR} ValueName 
     * @returns {NTSTATUS} 
     */
    static RtlDeleteRegistryValue(RelativeTo, Path, ValueName) {
        Path := Path is String ? StrPtr(Path) : Path
        ValueName := ValueName is String ? StrPtr(ValueName) : ValueName

        result := DllCall("ntdll.dll\RtlDeleteRegistryValue", "uint", RelativeTo, "ptr", Path, "ptr", ValueName, "int")
        return result
    }

    /**
     * 
     * @param {Integer} RelativeTo 
     * @param {PWSTR} Path 
     * @returns {NTSTATUS} 
     */
    static RtlCreateRegistryKey(RelativeTo, Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := DllCall("ntdll.dll\RtlCreateRegistryKey", "uint", RelativeTo, "ptr", Path, "int")
        return result
    }

    /**
     * 
     * @param {Integer} RelativeTo 
     * @param {PWSTR} Path 
     * @returns {NTSTATUS} 
     */
    static RtlCheckRegistryKey(RelativeTo, Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := DllCall("ntdll.dll\RtlCheckRegistryKey", "uint", RelativeTo, "ptr", Path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} DestinationString 
     * @param {Pointer<Integer>} SourceString 
     * @returns {NTSTATUS} 
     */
    static RtlInitUTF8StringEx(DestinationString, SourceString) {
        SourceStringMarshal := SourceString is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\RtlInitUTF8StringEx", "ptr", DestinationString, SourceStringMarshal, SourceString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} String1 
     * @param {Pointer} String1Length 
     * @param {Pointer<Integer>} String2 
     * @param {Pointer} String2Length 
     * @param {BOOLEAN} CaseInSensitive 
     * @returns {Integer} 
     */
    static RtlCompareUnicodeStrings(String1, String1Length, String2, String2Length, CaseInSensitive) {
        String1Marshal := String1 is VarRef ? "ushort*" : "ptr"
        String2Marshal := String2 is VarRef ? "ushort*" : "ptr"

        result := DllCall("ntdll.dll\RtlCompareUnicodeStrings", String1Marshal, String1, "ptr", String1Length, String2Marshal, String2, "ptr", String2Length, "char", CaseInSensitive, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} String1 
     * @param {Pointer<UNICODE_STRING>} String2 
     * @param {BOOLEAN} CaseInSensitive 
     * @returns {Integer} 
     */
    static RtlCompareUnicodeString(String1, String2, CaseInSensitive) {
        result := DllCall("ntdll.dll\RtlCompareUnicodeString", "ptr", String1, "ptr", String2, "char", CaseInSensitive, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} String1 
     * @param {Pointer<UNICODE_STRING>} String2 
     * @param {BOOLEAN} CaseInSensitive 
     * @returns {BOOLEAN} 
     */
    static RtlEqualUnicodeString(String1, String2, CaseInSensitive) {
        result := DllCall("ntdll.dll\RtlEqualUnicodeString", "ptr", String1, "ptr", String2, "char", CaseInSensitive, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} String 
     * @param {BOOLEAN} CaseInSensitive 
     * @param {Integer} HashAlgorithm 
     * @param {Pointer<Integer>} HashValue 
     * @returns {NTSTATUS} 
     */
    static RtlHashUnicodeString(String, CaseInSensitive, HashAlgorithm, HashValue) {
        HashValueMarshal := HashValue is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlHashUnicodeString", "ptr", String, "char", CaseInSensitive, "uint", HashAlgorithm, HashValueMarshal, HashValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} DestinationString 
     * @param {Pointer<UNICODE_STRING>} SourceString 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlCopyUnicodeString(DestinationString, SourceString) {
        DllCall("ntdll.dll\RtlCopyUnicodeString", "ptr", DestinationString, "ptr", SourceString)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} Destination 
     * @param {Pointer<UNICODE_STRING>} Source 
     * @returns {NTSTATUS} 
     */
    static RtlAppendUnicodeStringToString(Destination, Source) {
        result := DllCall("ntdll.dll\RtlAppendUnicodeStringToString", "ptr", Destination, "ptr", Source, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} Destination 
     * @param {PWSTR} Source 
     * @returns {NTSTATUS} 
     */
    static RtlAppendUnicodeToString(Destination, Source) {
        Source := Source is String ? StrPtr(Source) : Source

        result := DllCall("ntdll.dll\RtlAppendUnicodeToString", "ptr", Destination, "ptr", Source, "int")
        return result
    }

    /**
     * 
     * @param {Integer} SourceCharacter 
     * @returns {Integer} 
     */
    static RtlUpcaseUnicodeChar(SourceCharacter) {
        result := DllCall("ntdll.dll\RtlUpcaseUnicodeChar", "char", SourceCharacter, "char")
        return result
    }

    /**
     * 
     * @param {Integer} SourceCharacter 
     * @returns {Integer} 
     */
    static RtlDowncaseUnicodeChar(SourceCharacter) {
        result := DllCall("ntdll.dll\RtlDowncaseUnicodeChar", "char", SourceCharacter, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} utf8String 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlFreeUTF8String(utf8String) {
        DllCall("ntdll.dll\RtlFreeUTF8String", "ptr", utf8String)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} UnicodeString 
     * @returns {Integer} 
     */
    static RtlxUnicodeStringToAnsiSize(UnicodeString) {
        result := DllCall("ntdll.dll\RtlxUnicodeStringToAnsiSize", "ptr", UnicodeString, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} AnsiString 
     * @returns {Integer} 
     */
    static RtlxAnsiStringToUnicodeSize(AnsiString) {
        result := DllCall("ntdll.dll\RtlxAnsiStringToUnicodeSize", "ptr", AnsiString, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} UTF8StringDestination 
     * @param {Integer} UTF8StringMaxByteCount 
     * @param {Pointer<Integer>} UTF8StringActualByteCount 
     * @param {Pointer} UnicodeStringSource 
     * @param {Integer} UnicodeStringByteCount 
     * @returns {NTSTATUS} 
     */
    static RtlUnicodeToUTF8N(UTF8StringDestination, UTF8StringMaxByteCount, UTF8StringActualByteCount, UnicodeStringSource, UnicodeStringByteCount) {
        UTF8StringActualByteCountMarshal := UTF8StringActualByteCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlUnicodeToUTF8N", "ptr", UTF8StringDestination, "uint", UTF8StringMaxByteCount, UTF8StringActualByteCountMarshal, UTF8StringActualByteCount, "ptr", UnicodeStringSource, "uint", UnicodeStringByteCount, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} UnicodeStringDestination 
     * @param {Integer} UnicodeStringMaxByteCount 
     * @param {Pointer<Integer>} UnicodeStringActualByteCount 
     * @param {Pointer} UTF8StringSource 
     * @param {Integer} UTF8StringByteCount 
     * @returns {NTSTATUS} 
     */
    static RtlUTF8ToUnicodeN(UnicodeStringDestination, UnicodeStringMaxByteCount, UnicodeStringActualByteCount, UTF8StringSource, UTF8StringByteCount) {
        UnicodeStringActualByteCountMarshal := UnicodeStringActualByteCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlUTF8ToUnicodeN", "ptr", UnicodeStringDestination, "uint", UnicodeStringMaxByteCount, UnicodeStringActualByteCountMarshal, UnicodeStringActualByteCount, "ptr", UTF8StringSource, "uint", UTF8StringByteCount, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} DestinationString 
     * @param {Pointer<UNICODE_STRING>} SourceString 
     * @param {BOOLEAN} AllocateDestinationString 
     * @returns {NTSTATUS} 
     */
    static RtlUnicodeStringToUTF8String(DestinationString, SourceString, AllocateDestinationString) {
        result := DllCall("ntdll.dll\RtlUnicodeStringToUTF8String", "ptr", DestinationString, "ptr", SourceString, "char", AllocateDestinationString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} DestinationString 
     * @param {Pointer<STRING>} SourceString 
     * @param {BOOLEAN} AllocateDestinationString 
     * @returns {NTSTATUS} 
     */
    static RtlUTF8StringToUnicodeString(DestinationString, SourceString, AllocateDestinationString) {
        result := DllCall("ntdll.dll\RtlUTF8StringToUnicodeString", "ptr", DestinationString, "ptr", SourceString, "char", AllocateDestinationString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Guid 
     * @param {Pointer<UNICODE_STRING>} GuidString 
     * @returns {NTSTATUS} 
     */
    static RtlStringFromGUID(Guid, GuidString) {
        result := DllCall("ntdll.dll\RtlStringFromGUID", "ptr", Guid, "ptr", GuidString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} GuidString 
     * @param {Pointer<Guid>} Guid 
     * @returns {NTSTATUS} 
     */
    static RtlGUIDFromString(GuidString, Guid) {
        result := DllCall("ntdll.dll\RtlGUIDFromString", "ptr", GuidString, "ptr", Guid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} NamespaceGuid 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<Guid>} Guid 
     * @returns {NTSTATUS} 
     */
    static RtlGenerateClass5Guid(NamespaceGuid, Buffer_R, BufferSize, Guid) {
        result := DllCall("ntoskrnl.exe\RtlGenerateClass5Guid", "ptr", NamespaceGuid, "ptr", Buffer_R, "uint", BufferSize, "ptr", Guid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Source 
     * @param {Pointer} Length 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlPrefetchMemoryNonTemporal(Source, Length) {
        SourceMarshal := Source is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\RtlPrefetchMemoryNonTemporal", SourceMarshal, Source, "ptr", Length)
    }

    /**
     * 
     * @param {Integer} Status 
     * @returns {String} Nothing - always returns an empty string
     */
    static DbgBreakPointWithStatus(Status) {
        DllCall("ntoskrnl.exe\DbgBreakPointWithStatus", "uint", Status)
    }

    /**
     * 
     * @param {PSTR} Format 
     * @returns {Integer} 
     */
    static DbgPrint(Format) {
        Format := Format is String ? StrPtr(Format) : Format

        result := DllCall("ntdll.dll\DbgPrint", "ptr", Format, "CDecl uint")
        return result
    }

    /**
     * 
     * @param {Integer} ComponentId 
     * @param {Integer} Level 
     * @param {PSTR} Format 
     * @returns {Integer} 
     */
    static DbgPrintEx(ComponentId, Level, Format) {
        Format := Format is String ? StrPtr(Format) : Format

        result := DllCall("ntdll.dll\DbgPrintEx", "uint", ComponentId, "uint", Level, "ptr", Format, "CDecl uint")
        return result
    }

    /**
     * 
     * @param {Integer} ComponentId 
     * @param {Integer} Level 
     * @param {PSTR} Format 
     * @param {Pointer<Integer>} arglist 
     * @returns {Integer} 
     */
    static vDbgPrintEx(ComponentId, Level, Format, arglist) {
        Format := Format is String ? StrPtr(Format) : Format

        arglistMarshal := arglist is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\vDbgPrintEx", "uint", ComponentId, "uint", Level, "ptr", Format, arglistMarshal, arglist, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} Prefix 
     * @param {Integer} ComponentId 
     * @param {Integer} Level 
     * @param {PSTR} Format 
     * @param {Pointer<Integer>} arglist 
     * @returns {Integer} 
     */
    static vDbgPrintExWithPrefix(Prefix, ComponentId, Level, Format, arglist) {
        Prefix := Prefix is String ? StrPtr(Prefix) : Prefix
        Format := Format is String ? StrPtr(Format) : Format

        arglistMarshal := arglist is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\vDbgPrintExWithPrefix", "ptr", Prefix, "uint", ComponentId, "uint", Level, "ptr", Format, arglistMarshal, arglist, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} Format 
     * @returns {Integer} 
     */
    static DbgPrintReturnControlC(Format) {
        Format := Format is String ? StrPtr(Format) : Format

        result := DllCall("ntdll.dll\DbgPrintReturnControlC", "ptr", Format, "CDecl uint")
        return result
    }

    /**
     * 
     * @param {Integer} ComponentId 
     * @param {Integer} Level 
     * @returns {NTSTATUS} 
     */
    static DbgQueryDebugFilterState(ComponentId, Level) {
        result := DllCall("ntdll.dll\DbgQueryDebugFilterState", "uint", ComponentId, "uint", Level, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ComponentId 
     * @param {Integer} Level 
     * @param {BOOLEAN} State 
     * @returns {NTSTATUS} 
     */
    static DbgSetDebugFilterState(ComponentId, Level, State) {
        result := DllCall("ntdll.dll\DbgSetDebugFilterState", "uint", ComponentId, "uint", Level, "char", State, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PDEBUG_PRINT_CALLBACK>} DebugPrintCallback 
     * @param {BOOLEAN} Enable 
     * @returns {NTSTATUS} 
     */
    static DbgSetDebugPrintCallback(DebugPrintCallback, Enable) {
        result := DllCall("ntoskrnl.exe\DbgSetDebugPrintCallback", "ptr", DebugPrintCallback, "char", Enable, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Time 
     * @param {Pointer<TIME_FIELDS>} TimeFields 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlTimeToTimeFields(Time, TimeFields) {
        TimeMarshal := Time is VarRef ? "int64*" : "ptr"

        DllCall("ntdll.dll\RtlTimeToTimeFields", TimeMarshal, Time, "ptr", TimeFields)
    }

    /**
     * 
     * @param {Pointer<TIME_FIELDS>} TimeFields 
     * @param {Pointer<Integer>} Time 
     * @returns {BOOLEAN} 
     */
    static RtlTimeFieldsToTime(TimeFields, Time) {
        TimeMarshal := Time is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\RtlTimeFieldsToTime", "ptr", TimeFields, TimeMarshal, Time, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Pointer<Integer>} BitMapBuffer 
     * @param {Integer} SizeOfBitMap 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlInitializeBitMap(BitMapHeader, BitMapBuffer, SizeOfBitMap) {
        BitMapBufferMarshal := BitMapBuffer is VarRef ? "uint*" : "ptr"

        DllCall("ntdll.dll\RtlInitializeBitMap", "ptr", BitMapHeader, BitMapBufferMarshal, BitMapBuffer, "uint", SizeOfBitMap)
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} BitNumber 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlClearBit(BitMapHeader, BitNumber) {
        DllCall("ntdll.dll\RtlClearBit", "ptr", BitMapHeader, "uint", BitNumber)
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} BitNumber 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlSetBit(BitMapHeader, BitNumber) {
        DllCall("ntdll.dll\RtlSetBit", "ptr", BitMapHeader, "uint", BitNumber)
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} BitNumber 
     * @returns {BOOLEAN} 
     */
    static RtlTestBit(BitMapHeader, BitNumber) {
        result := DllCall("ntdll.dll\RtlTestBit", "ptr", BitMapHeader, "uint", BitNumber, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlClearAllBits(BitMapHeader) {
        DllCall("ntdll.dll\RtlClearAllBits", "ptr", BitMapHeader)
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlSetAllBits(BitMapHeader) {
        DllCall("ntdll.dll\RtlSetAllBits", "ptr", BitMapHeader)
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} NumberToFind 
     * @param {Integer} HintIndex 
     * @returns {Integer} 
     */
    static RtlFindClearBits(BitMapHeader, NumberToFind, HintIndex) {
        result := DllCall("ntdll.dll\RtlFindClearBits", "ptr", BitMapHeader, "uint", NumberToFind, "uint", HintIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} NumberToFind 
     * @param {Integer} HintIndex 
     * @returns {Integer} 
     */
    static RtlFindSetBits(BitMapHeader, NumberToFind, HintIndex) {
        result := DllCall("ntdll.dll\RtlFindSetBits", "ptr", BitMapHeader, "uint", NumberToFind, "uint", HintIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} NumberToFind 
     * @param {Integer} HintIndex 
     * @returns {Integer} 
     */
    static RtlFindClearBitsAndSet(BitMapHeader, NumberToFind, HintIndex) {
        result := DllCall("ntdll.dll\RtlFindClearBitsAndSet", "ptr", BitMapHeader, "uint", NumberToFind, "uint", HintIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} NumberToFind 
     * @param {Integer} HintIndex 
     * @returns {Integer} 
     */
    static RtlFindSetBitsAndClear(BitMapHeader, NumberToFind, HintIndex) {
        result := DllCall("ntdll.dll\RtlFindSetBitsAndClear", "ptr", BitMapHeader, "uint", NumberToFind, "uint", HintIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} StartingIndex 
     * @param {Integer} NumberToClear 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlClearBits(BitMapHeader, StartingIndex, NumberToClear) {
        DllCall("ntdll.dll\RtlClearBits", "ptr", BitMapHeader, "uint", StartingIndex, "uint", NumberToClear)
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} StartingIndex 
     * @param {Integer} NumberToSet 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlSetBits(BitMapHeader, StartingIndex, NumberToSet) {
        DllCall("ntdll.dll\RtlSetBits", "ptr", BitMapHeader, "uint", StartingIndex, "uint", NumberToSet)
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Pointer<RTL_BITMAP_RUN>} RunArray 
     * @param {Integer} SizeOfRunArray 
     * @param {BOOLEAN} LocateLongestRuns 
     * @returns {Integer} 
     */
    static RtlFindClearRuns(BitMapHeader, RunArray, SizeOfRunArray, LocateLongestRuns) {
        result := DllCall("ntdll.dll\RtlFindClearRuns", "ptr", BitMapHeader, "ptr", RunArray, "uint", SizeOfRunArray, "char", LocateLongestRuns, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Pointer<Integer>} StartingIndex 
     * @returns {Integer} 
     */
    static RtlFindLongestRunClear(BitMapHeader, StartingIndex) {
        StartingIndexMarshal := StartingIndex is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlFindLongestRunClear", "ptr", BitMapHeader, StartingIndexMarshal, StartingIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Pointer<Integer>} StartingIndex 
     * @returns {Integer} 
     */
    static RtlFindFirstRunClear(BitMapHeader, StartingIndex) {
        StartingIndexMarshal := StartingIndex is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\RtlFindFirstRunClear", "ptr", BitMapHeader, StartingIndexMarshal, StartingIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} StartingIndex 
     * @param {Integer} Length 
     * @returns {Integer} 
     */
    static RtlNumberOfClearBitsInRange(BitMapHeader, StartingIndex, Length) {
        result := DllCall("ntdll.dll\RtlNumberOfClearBitsInRange", "ptr", BitMapHeader, "uint", StartingIndex, "uint", Length, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} StartingIndex 
     * @param {Integer} Length 
     * @returns {Integer} 
     */
    static RtlNumberOfSetBitsInRange(BitMapHeader, StartingIndex, Length) {
        result := DllCall("ntdll.dll\RtlNumberOfSetBitsInRange", "ptr", BitMapHeader, "uint", StartingIndex, "uint", Length, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @returns {Integer} 
     */
    static RtlNumberOfClearBits(BitMapHeader) {
        result := DllCall("ntdll.dll\RtlNumberOfClearBits", "ptr", BitMapHeader, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @returns {Integer} 
     */
    static RtlNumberOfSetBits(BitMapHeader) {
        result := DllCall("ntdll.dll\RtlNumberOfSetBits", "ptr", BitMapHeader, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} StartingIndex 
     * @param {Integer} Length 
     * @returns {BOOLEAN} 
     */
    static RtlAreBitsClear(BitMapHeader, StartingIndex, Length) {
        result := DllCall("ntdll.dll\RtlAreBitsClear", "ptr", BitMapHeader, "uint", StartingIndex, "uint", Length, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} StartingIndex 
     * @param {Integer} Length 
     * @returns {BOOLEAN} 
     */
    static RtlAreBitsSet(BitMapHeader, StartingIndex, Length) {
        result := DllCall("ntdll.dll\RtlAreBitsSet", "ptr", BitMapHeader, "uint", StartingIndex, "uint", Length, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} FromIndex 
     * @param {Pointer<Integer>} StartingRunIndex 
     * @returns {Integer} 
     */
    static RtlFindNextForwardRunClear(BitMapHeader, FromIndex, StartingRunIndex) {
        StartingRunIndexMarshal := StartingRunIndex is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlFindNextForwardRunClear", "ptr", BitMapHeader, "uint", FromIndex, StartingRunIndexMarshal, StartingRunIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} BitMapHeader 
     * @param {Integer} FromIndex 
     * @param {Pointer<Integer>} StartingRunIndex 
     * @returns {Integer} 
     */
    static RtlFindLastBackwardRunClear(BitMapHeader, FromIndex, StartingRunIndex) {
        StartingRunIndexMarshal := StartingRunIndex is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlFindLastBackwardRunClear", "ptr", BitMapHeader, "uint", FromIndex, StartingRunIndexMarshal, StartingRunIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Set 
     * @returns {Integer} 
     */
    static RtlFindLeastSignificantBit(Set) {
        result := DllCall("ntdll.dll\RtlFindLeastSignificantBit", "uint", Set, "char")
        return result
    }

    /**
     * 
     * @param {Integer} Set 
     * @returns {Integer} 
     */
    static RtlFindMostSignificantBit(Set) {
        result := DllCall("ntdll.dll\RtlFindMostSignificantBit", "uint", Set, "char")
        return result
    }

    /**
     * 
     * @param {Pointer} Target 
     * @returns {Integer} 
     */
    static RtlNumberOfSetBitsUlongPtr(Target) {
        result := DllCall("ntdll.dll\RtlNumberOfSetBitsUlongPtr", "ptr", Target, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} Source 
     * @param {Pointer<RTL_BITMAP>} Destination 
     * @param {Integer} TargetBit 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlCopyBitMap(Source, Destination, TargetBit) {
        DllCall("ntdll.dll\RtlCopyBitMap", "ptr", Source, "ptr", Destination, "uint", TargetBit)
    }

    /**
     * 
     * @param {Pointer<RTL_BITMAP>} Source 
     * @param {Pointer<RTL_BITMAP>} Destination 
     * @param {Integer} TargetBit 
     * @param {Integer} NumberOfBits 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlExtractBitMap(Source, Destination, TargetBit, NumberOfBits) {
        DllCall("ntdll.dll\RtlExtractBitMap", "ptr", Source, "ptr", Destination, "uint", TargetBit, "uint", NumberOfBits)
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Integer} Revision 
     * @returns {NTSTATUS} 
     */
    static RtlCreateSecurityDescriptor(SecurityDescriptor, Revision) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ntdll.dll\RtlCreateSecurityDescriptor", "ptr", SecurityDescriptor, "uint", Revision, "int")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @returns {BOOLEAN} 
     */
    static RtlValidSecurityDescriptor(SecurityDescriptor) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ntdll.dll\RtlValidSecurityDescriptor", "ptr", SecurityDescriptor, "char")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @returns {Integer} 
     */
    static RtlLengthSecurityDescriptor(SecurityDescriptor) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ntdll.dll\RtlLengthSecurityDescriptor", "ptr", SecurityDescriptor, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} SecurityDescriptorInput 
     * @param {Integer} SecurityDescriptorLength 
     * @param {Integer} RequiredInformation 
     * @returns {BOOLEAN} 
     */
    static RtlValidRelativeSecurityDescriptor(SecurityDescriptorInput, SecurityDescriptorLength, RequiredInformation) {
        result := DllCall("ntdll.dll\RtlValidRelativeSecurityDescriptor", "ptr", SecurityDescriptorInput, "uint", SecurityDescriptorLength, "uint", RequiredInformation, "char")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {BOOLEAN} DaclPresent 
     * @param {Pointer<ACL>} Dacl 
     * @param {BOOLEAN} DaclDefaulted 
     * @returns {NTSTATUS} 
     */
    static RtlSetDaclSecurityDescriptor(SecurityDescriptor, DaclPresent, Dacl, DaclDefaulted) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        result := DllCall("ntdll.dll\RtlSetDaclSecurityDescriptor", "ptr", SecurityDescriptor, "char", DaclPresent, "ptr", Dacl, "char", DaclDefaulted, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<OSVERSIONINFOW>} lpVersionInformation 
     * @returns {NTSTATUS} 
     */
    static RtlGetVersion(lpVersionInformation) {
        result := DllCall("ntdll.dll\RtlGetVersion", "ptr", lpVersionInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<OSVERSIONINFOEXW>} VersionInfo 
     * @param {Integer} TypeMask 
     * @param {Integer} ConditionMask 
     * @returns {NTSTATUS} 
     */
    static RtlVerifyVersionInfo(VersionInfo, TypeMask, ConditionMask) {
        result := DllCall("ntdll.dll\RtlVerifyVersionInfo", "ptr", VersionInfo, "uint", TypeMask, "uint", ConditionMask, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Version 
     * @returns {BOOLEAN} 
     */
    static RtlIsNtDdiVersionAvailable(Version) {
        result := DllCall("ntoskrnl.exe\RtlIsNtDdiVersionAvailable", "uint", Version, "char")
        return result
    }

    /**
     * 
     * @param {Integer} Version 
     * @returns {BOOLEAN} 
     */
    static RtlIsServicePackVersionInstalled(Version) {
        result := DllCall("ntoskrnl.exe\RtlIsServicePackVersionInstalled", "uint", Version, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<IO_RESOURCE_DESCRIPTOR>} Descriptor 
     * @param {Integer} Type 
     * @param {Integer} Length 
     * @param {Integer} Alignment 
     * @param {Integer} MinimumAddress 
     * @param {Integer} MaximumAddress 
     * @returns {NTSTATUS} 
     */
    static RtlIoEncodeMemIoResource(Descriptor, Type, Length, Alignment, MinimumAddress, MaximumAddress) {
        result := DllCall("ntdll.dll\RtlIoEncodeMemIoResource", "ptr", Descriptor, "char", Type, "uint", Length, "uint", Alignment, "uint", MinimumAddress, "uint", MaximumAddress, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CM_PARTIAL_RESOURCE_DESCRIPTOR>} Descriptor 
     * @param {Integer} Type 
     * @param {Integer} Length 
     * @param {Integer} Start 
     * @returns {NTSTATUS} 
     */
    static RtlCmEncodeMemIoResource(Descriptor, Type, Length, Start) {
        result := DllCall("ntdll.dll\RtlCmEncodeMemIoResource", "ptr", Descriptor, "char", Type, "uint", Length, "uint", Start, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IO_RESOURCE_DESCRIPTOR>} Descriptor 
     * @param {Pointer<Integer>} Alignment 
     * @param {Pointer<Integer>} MinimumAddress 
     * @param {Pointer<Integer>} MaximumAddress 
     * @returns {Integer} 
     */
    static RtlIoDecodeMemIoResource(Descriptor, Alignment, MinimumAddress, MaximumAddress) {
        AlignmentMarshal := Alignment is VarRef ? "uint*" : "ptr"
        MinimumAddressMarshal := MinimumAddress is VarRef ? "uint*" : "ptr"
        MaximumAddressMarshal := MaximumAddress is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlIoDecodeMemIoResource", "ptr", Descriptor, AlignmentMarshal, Alignment, MinimumAddressMarshal, MinimumAddress, MaximumAddressMarshal, MaximumAddress, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<CM_PARTIAL_RESOURCE_DESCRIPTOR>} Descriptor 
     * @param {Pointer<Integer>} Start 
     * @returns {Integer} 
     */
    static RtlCmDecodeMemIoResource(Descriptor, Start) {
        StartMarshal := Start is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlCmDecodeMemIoResource", "ptr", Descriptor, StartMarshal, Start, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} SourceLength 
     * @param {Pointer<Integer>} TargetLength 
     * @returns {NTSTATUS} 
     */
    static RtlFindClosestEncodableLength(SourceLength, TargetLength) {
        TargetLengthMarshal := TargetLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlFindClosestEncodableLength", "uint", SourceLength, TargetLengthMarshal, TargetLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<BOOLEAN>} UntrustedObject 
     * @returns {NTSTATUS} 
     */
    static RtlIsUntrustedObject(Handle, Object_R, UntrustedObject) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        UntrustedObjectMarshal := UntrustedObject is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\RtlIsUntrustedObject", "ptr", Handle, Object_RMarshal, Object_R, UntrustedObjectMarshal, UntrustedObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} ComponentName 
     * @returns {Integer} 
     */
    static RtlQueryValidationRunlevel(ComponentName) {
        result := DllCall("ntdll.dll\RtlQueryValidationRunlevel", "ptr", ComponentName, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} LogFileName 
     * @param {Pointer<Guid>} ExistingTransactionManagerGuid 
     * @returns {NTSTATUS} 
     */
    static NtRenameTransactionManager(LogFileName, ExistingTransactionManagerGuid) {
        result := DllCall("ntdll.dll\NtRenameTransactionManager", "ptr", LogFileName, "ptr", ExistingTransactionManagerGuid, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionManagerHandle 
     * @param {Integer} TransactionManagerInformationClass 
     * @param {Pointer} TransactionManagerInformation 
     * @param {Integer} TransactionManagerInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static NtQueryInformationTransactionManager(TransactionManagerHandle, TransactionManagerInformationClass, TransactionManagerInformation, TransactionManagerInformationLength, ReturnLength) {
        TransactionManagerHandle := TransactionManagerHandle is Win32Handle ? NumGet(TransactionManagerHandle, "ptr") : TransactionManagerHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryInformationTransactionManager", "ptr", TransactionManagerHandle, "int", TransactionManagerInformationClass, "ptr", TransactionManagerInformation, "uint", TransactionManagerInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TmHandle 
     * @param {Integer} TransactionManagerInformationClass 
     * @param {Pointer} TransactionManagerInformation 
     * @param {Integer} TransactionManagerInformationLength 
     * @returns {NTSTATUS} 
     */
    static NtSetInformationTransactionManager(TmHandle, TransactionManagerInformationClass, TransactionManagerInformation, TransactionManagerInformationLength) {
        TmHandle := TmHandle is Win32Handle ? NumGet(TmHandle, "ptr") : TmHandle

        result := DllCall("ntdll.dll\NtSetInformationTransactionManager", "ptr", TmHandle, "int", TransactionManagerInformationClass, "ptr", TransactionManagerInformation, "uint", TransactionManagerInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TransactionHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<Guid>} Uow 
     * @param {HANDLE} TmHandle 
     * @returns {NTSTATUS} 
     */
    static NtOpenTransaction(TransactionHandle, DesiredAccess, ObjectAttributes, Uow, TmHandle) {
        TmHandle := TmHandle is Win32Handle ? NumGet(TmHandle, "ptr") : TmHandle

        result := DllCall("ntdll.dll\NtOpenTransaction", "ptr", TransactionHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", Uow, "ptr", TmHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionHandle 
     * @param {Integer} TransactionInformationClass 
     * @param {Pointer} TransactionInformation 
     * @param {Integer} TransactionInformationLength 
     * @returns {NTSTATUS} 
     */
    static NtSetInformationTransaction(TransactionHandle, TransactionInformationClass, TransactionInformation, TransactionInformationLength) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        result := DllCall("ntdll.dll\NtSetInformationTransaction", "ptr", TransactionHandle, "int", TransactionInformationClass, "ptr", TransactionInformation, "uint", TransactionInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} EnlistmentHandle 
     * @param {Integer} DesiredAccess 
     * @param {HANDLE} ResourceManagerHandle 
     * @param {Pointer<Guid>} EnlistmentGuid 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static NtOpenEnlistment(EnlistmentHandle, DesiredAccess, ResourceManagerHandle, EnlistmentGuid, ObjectAttributes) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle

        result := DllCall("ntdll.dll\NtOpenEnlistment", "ptr", EnlistmentHandle, "uint", DesiredAccess, "ptr", ResourceManagerHandle, "ptr", EnlistmentGuid, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Integer} EnlistmentInformationClass 
     * @param {Pointer} EnlistmentInformation 
     * @param {Integer} EnlistmentInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static NtQueryInformationEnlistment(EnlistmentHandle, EnlistmentInformationClass, EnlistmentInformation, EnlistmentInformationLength, ReturnLength) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtQueryInformationEnlistment", "ptr", EnlistmentHandle, "int", EnlistmentInformationClass, "ptr", EnlistmentInformation, "uint", EnlistmentInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Integer} EnlistmentInformationClass 
     * @param {Pointer} EnlistmentInformation 
     * @param {Integer} EnlistmentInformationLength 
     * @returns {NTSTATUS} 
     */
    static NtSetInformationEnlistment(EnlistmentHandle, EnlistmentInformationClass, EnlistmentInformation, EnlistmentInformationLength) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        result := DllCall("ntdll.dll\NtSetInformationEnlistment", "ptr", EnlistmentHandle, "int", EnlistmentInformationClass, "ptr", EnlistmentInformation, "uint", EnlistmentInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} ResourceManagerHandle 
     * @param {Integer} DesiredAccess 
     * @param {HANDLE} TmHandle 
     * @param {Pointer<Guid>} RmGuid 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Integer} CreateOptions 
     * @param {Pointer<UNICODE_STRING>} Description 
     * @returns {NTSTATUS} 
     */
    static NtCreateResourceManager(ResourceManagerHandle, DesiredAccess, TmHandle, RmGuid, ObjectAttributes, CreateOptions, Description) {
        TmHandle := TmHandle is Win32Handle ? NumGet(TmHandle, "ptr") : TmHandle

        result := DllCall("ntdll.dll\NtCreateResourceManager", "ptr", ResourceManagerHandle, "uint", DesiredAccess, "ptr", TmHandle, "ptr", RmGuid, "ptr", ObjectAttributes, "uint", CreateOptions, "ptr", Description, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} ResourceManagerHandle 
     * @param {Integer} DesiredAccess 
     * @param {HANDLE} TmHandle 
     * @param {Pointer<Guid>} ResourceManagerGuid 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static NtOpenResourceManager(ResourceManagerHandle, DesiredAccess, TmHandle, ResourceManagerGuid, ObjectAttributes) {
        TmHandle := TmHandle is Win32Handle ? NumGet(TmHandle, "ptr") : TmHandle

        result := DllCall("ntdll.dll\NtOpenResourceManager", "ptr", ResourceManagerHandle, "uint", DesiredAccess, "ptr", TmHandle, "ptr", ResourceManagerGuid, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ResourceManagerHandle 
     * @param {Pointer<TRANSACTION_NOTIFICATION>} TransactionNotification 
     * @param {Integer} NotificationLength 
     * @param {Pointer<Integer>} Timeout 
     * @param {Pointer<Integer>} ReturnLength 
     * @param {Integer} Asynchronous 
     * @param {Pointer} AsynchronousContext 
     * @returns {NTSTATUS} 
     */
    static NtGetNotificationResourceManager(ResourceManagerHandle, TransactionNotification, NotificationLength, Timeout, ReturnLength, Asynchronous, AsynchronousContext) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle

        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\NtGetNotificationResourceManager", "ptr", ResourceManagerHandle, "ptr", TransactionNotification, "uint", NotificationLength, TimeoutMarshal, Timeout, ReturnLengthMarshal, ReturnLength, "uint", Asynchronous, "ptr", AsynchronousContext, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ResourceManager 
     * @param {Pointer<Guid>} ProtocolId 
     * @param {Integer} ProtocolInformationSize 
     * @param {Pointer<Void>} ProtocolInformation 
     * @param {Integer} CreateOptions 
     * @returns {NTSTATUS} 
     */
    static NtRegisterProtocolAddressInformation(ResourceManager, ProtocolId, ProtocolInformationSize, ProtocolInformation, CreateOptions) {
        ResourceManager := ResourceManager is Win32Handle ? NumGet(ResourceManager, "ptr") : ResourceManager

        ProtocolInformationMarshal := ProtocolInformation is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\NtRegisterProtocolAddressInformation", "ptr", ResourceManager, "ptr", ProtocolId, "uint", ProtocolInformationSize, ProtocolInformationMarshal, ProtocolInformation, "uint", CreateOptions, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ResourceManagerHandle 
     * @param {Integer} RequestCookie 
     * @param {Integer} BufferLength 
     * @param {Pointer<Void>} Buffer_R 
     * @returns {NTSTATUS} 
     */
    static NtPropagationComplete(ResourceManagerHandle, RequestCookie, BufferLength, Buffer_R) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle

        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\NtPropagationComplete", "ptr", ResourceManagerHandle, "uint", RequestCookie, "uint", BufferLength, Buffer_RMarshal, Buffer_R, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ResourceManagerHandle 
     * @param {Integer} RequestCookie 
     * @param {NTSTATUS} PropStatus 
     * @returns {NTSTATUS} 
     */
    static NtPropagationFailed(ResourceManagerHandle, RequestCookie, PropStatus) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle

        result := DllCall("ntdll.dll\NtPropagationFailed", "ptr", ResourceManagerHandle, "uint", RequestCookie, "int", PropStatus, "int")
        return result
    }

    /**
     * 
     * @param {Integer} NewIrql 
     * @returns {Integer} 
     */
    static KfRaiseIrql(NewIrql) {
        result := DllCall("ntoskrnl.exe\KfRaiseIrql", "char", NewIrql, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<MDL>} Mdl 
     * @param {BOOLEAN} ReadOperation 
     * @param {BOOLEAN} DmaOperation 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeFlushIoBuffers(Mdl, ReadOperation, DmaOperation) {
        DllCall("ntoskrnl.exe\KeFlushIoBuffers", "ptr", Mdl, "char", ReadOperation, "char", DmaOperation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static KeGetCurrentIrql() {
        result := DllCall("ntoskrnl.exe\KeGetCurrentIrql", "char")
        return result
    }

    /**
     * 
     * @param {Pointer<KDPC>} Dpc 
     * @param {Pointer<PKDEFERRED_ROUTINE>} DeferredRoutine 
     * @param {Pointer<Void>} DeferredContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeInitializeDpc(Dpc, DeferredRoutine, DeferredContext) {
        DeferredContextMarshal := DeferredContext is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\KeInitializeDpc", "ptr", Dpc, "ptr", DeferredRoutine, DeferredContextMarshal, DeferredContext)
    }

    /**
     * 
     * @param {Pointer<KDPC>} Dpc 
     * @param {Pointer<PKDEFERRED_ROUTINE>} DeferredRoutine 
     * @param {Pointer<Void>} DeferredContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeInitializeThreadedDpc(Dpc, DeferredRoutine, DeferredContext) {
        DeferredContextMarshal := DeferredContext is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\KeInitializeThreadedDpc", "ptr", Dpc, "ptr", DeferredRoutine, DeferredContextMarshal, DeferredContext)
    }

    /**
     * 
     * @param {Pointer<KDPC>} Dpc 
     * @param {Pointer<Void>} SystemArgument1 
     * @param {Pointer<Void>} SystemArgument2 
     * @returns {BOOLEAN} 
     */
    static KeInsertQueueDpc(Dpc, SystemArgument1, SystemArgument2) {
        SystemArgument1Marshal := SystemArgument1 is VarRef ? "ptr" : "ptr"
        SystemArgument2Marshal := SystemArgument2 is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\KeInsertQueueDpc", "ptr", Dpc, SystemArgument1Marshal, SystemArgument1, SystemArgument2Marshal, SystemArgument2, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<KDPC>} Dpc 
     * @returns {BOOLEAN} 
     */
    static KeRemoveQueueDpc(Dpc) {
        result := DllCall("ntoskrnl.exe\KeRemoveQueueDpc", "ptr", Dpc, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<KDPC>} Dpc 
     * @param {BOOLEAN} WaitIfActive 
     * @returns {BOOLEAN} 
     */
    static KeRemoveQueueDpcEx(Dpc, WaitIfActive) {
        result := DllCall("ntoskrnl.exe\KeRemoveQueueDpcEx", "ptr", Dpc, "char", WaitIfActive, "char")
        return result
    }

    /**
     * 
     * @param {Integer} DumpType 
     * @param {Integer} Flags 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BufferNeeded 
     * @returns {NTSTATUS} 
     */
    static KeInitializeCrashDumpHeader(DumpType, Flags, Buffer_R, BufferSize, BufferNeeded) {
        BufferNeededMarshal := BufferNeeded is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeInitializeCrashDumpHeader", "uint", DumpType, "uint", Flags, "ptr", Buffer_R, "uint", BufferSize, BufferNeededMarshal, BufferNeeded, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KDPC>} Dpc 
     * @param {Integer} Importance 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeSetImportanceDpc(Dpc, Importance) {
        DllCall("ntoskrnl.exe\KeSetImportanceDpc", "ptr", Dpc, "int", Importance)
    }

    /**
     * 
     * @param {Pointer<KDPC>} Dpc 
     * @param {Integer} Number_R 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeSetTargetProcessorDpc(Dpc, Number_R) {
        DllCall("ntoskrnl.exe\KeSetTargetProcessorDpc", "ptr", Dpc, "char", Number_R)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeFlushQueuedDpcs() {
        DllCall("ntoskrnl.exe\KeFlushQueuedDpcs")
    }

    /**
     * 
     * @param {Pointer<KDEVICE_QUEUE>} DeviceQueue 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeInitializeDeviceQueue(DeviceQueue) {
        DllCall("ntoskrnl.exe\KeInitializeDeviceQueue", "ptr", DeviceQueue)
    }

    /**
     * 
     * @param {Pointer<KDEVICE_QUEUE>} DeviceQueue 
     * @param {Pointer<KDEVICE_QUEUE_ENTRY>} DeviceQueueEntry 
     * @returns {BOOLEAN} 
     */
    static KeInsertDeviceQueue(DeviceQueue, DeviceQueueEntry) {
        result := DllCall("ntoskrnl.exe\KeInsertDeviceQueue", "ptr", DeviceQueue, "ptr", DeviceQueueEntry, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<KDEVICE_QUEUE>} DeviceQueue 
     * @param {Pointer<KDEVICE_QUEUE_ENTRY>} DeviceQueueEntry 
     * @param {Integer} SortKey 
     * @returns {BOOLEAN} 
     */
    static KeInsertByKeyDeviceQueue(DeviceQueue, DeviceQueueEntry, SortKey) {
        result := DllCall("ntoskrnl.exe\KeInsertByKeyDeviceQueue", "ptr", DeviceQueue, "ptr", DeviceQueueEntry, "uint", SortKey, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<KDEVICE_QUEUE>} DeviceQueue 
     * @returns {Pointer<KDEVICE_QUEUE_ENTRY>} 
     */
    static KeRemoveDeviceQueue(DeviceQueue) {
        result := DllCall("ntoskrnl.exe\KeRemoveDeviceQueue", "ptr", DeviceQueue, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<KDEVICE_QUEUE>} DeviceQueue 
     * @param {Integer} SortKey 
     * @returns {Pointer<KDEVICE_QUEUE_ENTRY>} 
     */
    static KeRemoveByKeyDeviceQueue(DeviceQueue, SortKey) {
        result := DllCall("ntoskrnl.exe\KeRemoveByKeyDeviceQueue", "ptr", DeviceQueue, "uint", SortKey, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<KDEVICE_QUEUE>} DeviceQueue 
     * @param {Integer} SortKey 
     * @returns {Pointer<KDEVICE_QUEUE_ENTRY>} 
     */
    static KeRemoveByKeyDeviceQueueIfBusy(DeviceQueue, SortKey) {
        result := DllCall("ntoskrnl.exe\KeRemoveByKeyDeviceQueueIfBusy", "ptr", DeviceQueue, "uint", SortKey, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<KDEVICE_QUEUE>} DeviceQueue 
     * @param {Pointer<KDEVICE_QUEUE_ENTRY>} DeviceQueueEntry 
     * @returns {BOOLEAN} 
     */
    static KeRemoveEntryDeviceQueue(DeviceQueue, DeviceQueueEntry) {
        result := DllCall("ntoskrnl.exe\KeRemoveEntryDeviceQueue", "ptr", DeviceQueue, "ptr", DeviceQueueEntry, "char")
        return result
    }

    /**
     * 
     * @param {PKINTERRUPT} Interrupt 
     * @param {Pointer<PKSYNCHRONIZE_ROUTINE>} SynchronizeRoutine 
     * @param {Pointer<Void>} SynchronizeContext 
     * @returns {BOOLEAN} 
     */
    static KeSynchronizeExecution(Interrupt, SynchronizeRoutine, SynchronizeContext) {
        SynchronizeContextMarshal := SynchronizeContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\KeSynchronizeExecution", "ptr", Interrupt, "ptr", SynchronizeRoutine, SynchronizeContextMarshal, SynchronizeContext, "char")
        return result
    }

    /**
     * 
     * @param {PKINTERRUPT} Interrupt 
     * @returns {Integer} 
     */
    static KeAcquireInterruptSpinLock(Interrupt) {
        result := DllCall("ntoskrnl.exe\KeAcquireInterruptSpinLock", "ptr", Interrupt, "char")
        return result
    }

    /**
     * 
     * @param {PKINTERRUPT} Interrupt 
     * @param {Integer} OldIrql 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeReleaseInterruptSpinLock(Interrupt, OldIrql) {
        DllCall("ntoskrnl.exe\KeReleaseInterruptSpinLock", "ptr", Interrupt, "char", OldIrql)
    }

    /**
     * 
     * @param {Pointer<KEVENT>} Event 
     * @param {Integer} Type 
     * @param {BOOLEAN} State 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeInitializeEvent(Event, Type, State) {
        DllCall("ntoskrnl.exe\KeInitializeEvent", "ptr", Event, "int", Type, "char", State)
    }

    /**
     * 
     * @param {Pointer<KEVENT>} Event 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeClearEvent(Event) {
        DllCall("ntoskrnl.exe\KeClearEvent", "ptr", Event)
    }

    /**
     * 
     * @param {Pointer<KEVENT>} Event 
     * @returns {Integer} 
     */
    static KeReadStateEvent(Event) {
        result := DllCall("ntoskrnl.exe\KeReadStateEvent", "ptr", Event, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KEVENT>} Event 
     * @returns {Integer} 
     */
    static KeResetEvent(Event) {
        result := DllCall("ntoskrnl.exe\KeResetEvent", "ptr", Event, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KEVENT>} Event 
     * @param {Integer} Increment 
     * @param {BOOLEAN} Wait 
     * @returns {Integer} 
     */
    static KeSetEvent(Event, Increment, Wait) {
        result := DllCall("ntoskrnl.exe\KeSetEvent", "ptr", Event, "int", Increment, "char", Wait, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KMUTANT>} Mutex 
     * @param {Integer} Level 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeInitializeMutex(Mutex, Level) {
        DllCall("ntoskrnl.exe\KeInitializeMutex", "ptr", Mutex, "uint", Level)
    }

    /**
     * 
     * @param {Pointer<KMUTANT>} Mutex 
     * @returns {Integer} 
     */
    static KeReadStateMutex(Mutex) {
        result := DllCall("ntoskrnl.exe\KeReadStateMutex", "ptr", Mutex, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KMUTANT>} Mutex 
     * @param {BOOLEAN} Wait 
     * @returns {Integer} 
     */
    static KeReleaseMutex(Mutex, Wait) {
        result := DllCall("ntoskrnl.exe\KeReleaseMutex", "ptr", Mutex, "char", Wait, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KSEMAPHORE>} Semaphore 
     * @param {Integer} Count 
     * @param {Integer} Limit 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeInitializeSemaphore(Semaphore, Count, Limit) {
        DllCall("ntoskrnl.exe\KeInitializeSemaphore", "ptr", Semaphore, "int", Count, "int", Limit)
    }

    /**
     * 
     * @param {Pointer<KSEMAPHORE>} Semaphore 
     * @returns {Integer} 
     */
    static KeReadStateSemaphore(Semaphore) {
        result := DllCall("ntoskrnl.exe\KeReadStateSemaphore", "ptr", Semaphore, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KSEMAPHORE>} Semaphore 
     * @param {Integer} Increment 
     * @param {Integer} Adjustment 
     * @param {BOOLEAN} Wait 
     * @returns {Integer} 
     */
    static KeReleaseSemaphore(Semaphore, Increment, Adjustment, Wait) {
        result := DllCall("ntoskrnl.exe\KeReleaseSemaphore", "ptr", Semaphore, "int", Increment, "int", Adjustment, "char", Wait, "int")
        return result
    }

    /**
     * 
     * @param {Integer} WaitMode 
     * @param {BOOLEAN} Alertable 
     * @param {Pointer<Integer>} Interval 
     * @returns {NTSTATUS} 
     */
    static KeDelayExecutionThread(WaitMode, Alertable, Interval) {
        IntervalMarshal := Interval is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeDelayExecutionThread", "char", WaitMode, "char", Alertable, IntervalMarshal, Interval, "int")
        return result
    }

    /**
     * 
     * @param {PKTHREAD} Thread 
     * @returns {Integer} 
     */
    static KeQueryPriorityThread(Thread) {
        result := DllCall("ntoskrnl.exe\KeQueryPriorityThread", "ptr", Thread, "int")
        return result
    }

    /**
     * 
     * @param {PKTHREAD} Thread 
     * @param {Pointer<Integer>} UserTime 
     * @returns {Integer} 
     */
    static KeQueryRuntimeThread(Thread, UserTime) {
        UserTimeMarshal := UserTime is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeQueryRuntimeThread", "ptr", Thread, UserTimeMarshal, UserTime, "uint")
        return result
    }

    /**
     * 
     * @param {PKTHREAD} Thread 
     * @param {Pointer<Integer>} CycleTimeStamp 
     * @returns {Integer} 
     */
    static KeQueryTotalCycleTimeThread(Thread, CycleTimeStamp) {
        CycleTimeStampMarshal := CycleTimeStamp is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeQueryTotalCycleTimeThread", "ptr", Thread, CycleTimeStampMarshal, CycleTimeStamp, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<KDPC>} Dpc 
     * @param {Pointer<PROCESSOR_NUMBER>} ProcNumber 
     * @returns {NTSTATUS} 
     */
    static KeSetTargetProcessorDpcEx(Dpc, ProcNumber) {
        result := DllCall("ntoskrnl.exe\KeSetTargetProcessorDpcEx", "ptr", Dpc, "ptr", ProcNumber, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeRevertToUserAffinityThread() {
        DllCall("ntoskrnl.exe\KeRevertToUserAffinityThread")
    }

    /**
     * 
     * @param {Pointer} Affinity 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeSetSystemAffinityThread(Affinity) {
        DllCall("ntoskrnl.exe\KeSetSystemAffinityThread", "ptr", Affinity)
    }

    /**
     * 
     * @param {Pointer} Affinity 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeRevertToUserAffinityThreadEx(Affinity) {
        DllCall("ntoskrnl.exe\KeRevertToUserAffinityThreadEx", "ptr", Affinity)
    }

    /**
     * 
     * @param {Pointer<GROUP_AFFINITY>} Affinity 
     * @param {Pointer<GROUP_AFFINITY>} PreviousAffinity 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeSetSystemGroupAffinityThread(Affinity, PreviousAffinity) {
        DllCall("ntoskrnl.exe\KeSetSystemGroupAffinityThread", "ptr", Affinity, "ptr", PreviousAffinity)
    }

    /**
     * 
     * @param {Pointer<GROUP_AFFINITY>} PreviousAffinity 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeRevertToUserGroupAffinityThread(PreviousAffinity) {
        DllCall("ntoskrnl.exe\KeRevertToUserGroupAffinityThread", "ptr", PreviousAffinity)
    }

    /**
     * 
     * @param {Pointer} Affinity 
     * @returns {Pointer} 
     */
    static KeSetSystemAffinityThreadEx(Affinity) {
        result := DllCall("ntoskrnl.exe\KeSetSystemAffinityThreadEx", "ptr", Affinity, "ptr")
        return result
    }

    /**
     * 
     * @param {PKTHREAD} Thread 
     * @param {Integer} Priority 
     * @returns {Integer} 
     */
    static KeSetPriorityThread(Thread, Priority) {
        result := DllCall("ntoskrnl.exe\KeSetPriorityThread", "ptr", Thread, "int", Priority, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeEnterCriticalRegion() {
        DllCall("ntoskrnl.exe\KeEnterCriticalRegion")
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeLeaveCriticalRegion() {
        DllCall("ntoskrnl.exe\KeLeaveCriticalRegion")
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeEnterGuardedRegion() {
        DllCall("ntoskrnl.exe\KeEnterGuardedRegion")
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeLeaveGuardedRegion() {
        DllCall("ntoskrnl.exe\KeLeaveGuardedRegion")
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static KeAreApcsDisabled() {
        result := DllCall("ntoskrnl.exe\KeAreApcsDisabled", "char")
        return result
    }

    /**
     * 
     * @param {Pointer<KTIMER>} Timer 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeInitializeTimer(Timer) {
        DllCall("ntoskrnl.exe\KeInitializeTimer", "ptr", Timer)
    }

    /**
     * 
     * @param {Pointer<KTIMER>} Timer 
     * @param {Integer} Type 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeInitializeTimerEx(Timer, Type) {
        DllCall("ntoskrnl.exe\KeInitializeTimerEx", "ptr", Timer, "int", Type)
    }

    /**
     * 
     * @param {Pointer<KTIMER>} param0 
     * @returns {BOOLEAN} 
     */
    static KeCancelTimer(param0) {
        result := DllCall("ntoskrnl.exe\KeCancelTimer", "ptr", param0, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<KTIMER>} Timer 
     * @returns {BOOLEAN} 
     */
    static KeReadStateTimer(Timer) {
        result := DllCall("ntoskrnl.exe\KeReadStateTimer", "ptr", Timer, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<KTIMER>} Timer 
     * @param {Integer} DueTime 
     * @param {Pointer<KDPC>} Dpc 
     * @returns {BOOLEAN} 
     */
    static KeSetTimer(Timer, DueTime, Dpc) {
        result := DllCall("ntoskrnl.exe\KeSetTimer", "ptr", Timer, "int64", DueTime, "ptr", Dpc, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<KTIMER>} Timer 
     * @param {Integer} DueTime 
     * @param {Integer} Period 
     * @param {Pointer<KDPC>} Dpc 
     * @returns {BOOLEAN} 
     */
    static KeSetTimerEx(Timer, DueTime, Period, Dpc) {
        result := DllCall("ntoskrnl.exe\KeSetTimerEx", "ptr", Timer, "int64", DueTime, "int", Period, "ptr", Dpc, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<KTIMER>} Timer 
     * @param {Integer} DueTime 
     * @param {Integer} Period 
     * @param {Integer} TolerableDelay 
     * @param {Pointer<KDPC>} Dpc 
     * @returns {BOOLEAN} 
     */
    static KeSetCoalescableTimer(Timer, DueTime, Period, TolerableDelay, Dpc) {
        result := DllCall("ntoskrnl.exe\KeSetCoalescableTimer", "ptr", Timer, "int64", DueTime, "uint", Period, "uint", TolerableDelay, "ptr", Dpc, "char")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Pointer<Void>>} Object_R 
     * @param {Integer} WaitType 
     * @param {Integer} WaitReason 
     * @param {Integer} WaitMode 
     * @param {BOOLEAN} Alertable 
     * @param {Pointer<Integer>} Timeout 
     * @param {Pointer<KWAIT_BLOCK>} WaitBlockArray 
     * @returns {NTSTATUS} 
     */
    static KeWaitForMultipleObjects(Count, Object_R, WaitType, WaitReason, WaitMode, Alertable, Timeout, WaitBlockArray) {
        Object_RMarshal := Object_R is VarRef ? "ptr*" : "ptr"
        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeWaitForMultipleObjects", "uint", Count, Object_RMarshal, Object_R, "int", WaitType, "int", WaitReason, "char", WaitMode, "char", Alertable, TimeoutMarshal, Timeout, "ptr", WaitBlockArray, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Integer} WaitReason 
     * @param {Integer} WaitMode 
     * @param {BOOLEAN} Alertable 
     * @param {Pointer<Integer>} Timeout 
     * @returns {NTSTATUS} 
     */
    static KeWaitForSingleObject(Object_R, WaitReason, WaitMode, Alertable, Timeout) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeWaitForSingleObject", Object_RMarshal, Object_R, "int", WaitReason, "char", WaitMode, "char", Alertable, TimeoutMarshal, Timeout, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PKIPI_BROADCAST_WORKER>} BroadcastFunction 
     * @param {Pointer} Context 
     * @returns {Pointer} 
     */
    static KeIpiGenericCall(BroadcastFunction, Context) {
        result := DllCall("ntoskrnl.exe\KeIpiGenericCall", "ptr", BroadcastFunction, "ptr", Context, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} SpinLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeInitializeSpinLock(SpinLock) {
        SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\KeInitializeSpinLock", SpinLockMarshal, SpinLock)
    }

    /**
     * 
     * @param {Pointer<Pointer>} SpinLock 
     * @returns {BOOLEAN} 
     */
    static KeTestSpinLock(SpinLock) {
        SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeTestSpinLock", SpinLockMarshal, SpinLock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} SpinLock 
     * @returns {BOOLEAN} 
     */
    static KeTryToAcquireSpinLockAtDpcLevel(SpinLock) {
        SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeTryToAcquireSpinLockAtDpcLevel", SpinLockMarshal, SpinLock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} SpinLock 
     * @returns {Integer} 
     */
    static KeAcquireSpinLockForDpc(SpinLock) {
        SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeAcquireSpinLockForDpc", SpinLockMarshal, SpinLock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} SpinLock 
     * @param {Integer} OldIrql 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeReleaseSpinLockForDpc(SpinLock, OldIrql) {
        SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\KeReleaseSpinLockForDpc", SpinLockMarshal, SpinLock, "char", OldIrql)
    }

    /**
     * 
     * @param {Pointer<Pointer>} SpinLock 
     * @param {Pointer<KLOCK_QUEUE_HANDLE>} LockHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeAcquireInStackQueuedSpinLock(SpinLock, LockHandle) {
        SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\KeAcquireInStackQueuedSpinLock", SpinLockMarshal, SpinLock, "ptr", LockHandle)
    }

    /**
     * 
     * @param {Pointer<KLOCK_QUEUE_HANDLE>} LockHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeReleaseInStackQueuedSpinLock(LockHandle) {
        DllCall("ntoskrnl.exe\KeReleaseInStackQueuedSpinLock", "ptr", LockHandle)
    }

    /**
     * 
     * @param {Pointer<Pointer>} SpinLock 
     * @param {Pointer<KLOCK_QUEUE_HANDLE>} LockHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeAcquireInStackQueuedSpinLockAtDpcLevel(SpinLock, LockHandle) {
        SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\KeAcquireInStackQueuedSpinLockAtDpcLevel", SpinLockMarshal, SpinLock, "ptr", LockHandle)
    }

    /**
     * 
     * @param {Pointer<KLOCK_QUEUE_HANDLE>} LockHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeReleaseInStackQueuedSpinLockFromDpcLevel(LockHandle) {
        DllCall("ntoskrnl.exe\KeReleaseInStackQueuedSpinLockFromDpcLevel", "ptr", LockHandle)
    }

    /**
     * 
     * @param {Pointer<Pointer>} SpinLock 
     * @param {Pointer<KLOCK_QUEUE_HANDLE>} LockHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeAcquireInStackQueuedSpinLockForDpc(SpinLock, LockHandle) {
        SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\KeAcquireInStackQueuedSpinLockForDpc", SpinLockMarshal, SpinLock, "ptr", LockHandle)
    }

    /**
     * 
     * @param {Pointer<KLOCK_QUEUE_HANDLE>} LockHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeReleaseInStackQueuedSpinLockForDpc(LockHandle) {
        DllCall("ntoskrnl.exe\KeReleaseInStackQueuedSpinLockForDpc", "ptr", LockHandle)
    }

    /**
     * 
     * @param {Pointer<KDPC_WATCHDOG_INFORMATION>} WatchdogInformation 
     * @returns {NTSTATUS} 
     */
    static KeQueryDpcWatchdogInformation(WatchdogInformation) {
        result := DllCall("ntoskrnl.exe\KeQueryDpcWatchdogInformation", "ptr", WatchdogInformation, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static KeIsExecutingDpc() {
        result := DllCall("ntoskrnl.exe\KeIsExecutingDpc", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<KBUGCHECK_CALLBACK_RECORD>} CallbackRecord 
     * @returns {BOOLEAN} 
     */
    static KeDeregisterBugCheckCallback(CallbackRecord) {
        result := DllCall("ntoskrnl.exe\KeDeregisterBugCheckCallback", "ptr", CallbackRecord, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<KBUGCHECK_CALLBACK_RECORD>} CallbackRecord 
     * @param {Pointer<PKBUGCHECK_CALLBACK_ROUTINE>} CallbackRoutine 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} Component 
     * @returns {BOOLEAN} 
     */
    static KeRegisterBugCheckCallback(CallbackRecord, CallbackRoutine, Buffer_R, Length, Component) {
        ComponentMarshal := Component is VarRef ? "char*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeRegisterBugCheckCallback", "ptr", CallbackRecord, "ptr", CallbackRoutine, "ptr", Buffer_R, "uint", Length, ComponentMarshal, Component, "char")
        return result
    }

    /**
     * 
     * @param {Pointer} KtriageDumpDataArray 
     * @param {Integer} Size 
     * @returns {NTSTATUS} 
     */
    static KeInitializeTriageDumpDataArray(KtriageDumpDataArray, Size) {
        result := DllCall("ntoskrnl.exe\KeInitializeTriageDumpDataArray", "ptr", KtriageDumpDataArray, "uint", Size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KTRIAGE_DUMP_DATA_ARRAY>} KtriageDumpDataArray 
     * @param {Pointer<Void>} Address 
     * @param {Pointer} Size 
     * @returns {NTSTATUS} 
     */
    static KeAddTriageDumpDataBlock(KtriageDumpDataArray, Address, Size) {
        AddressMarshal := Address is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\KeAddTriageDumpDataBlock", "ptr", KtriageDumpDataArray, AddressMarshal, Address, "ptr", Size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KBUGCHECK_REASON_CALLBACK_RECORD>} CallbackRecord 
     * @returns {BOOLEAN} 
     */
    static KeDeregisterBugCheckReasonCallback(CallbackRecord) {
        result := DllCall("ntoskrnl.exe\KeDeregisterBugCheckReasonCallback", "ptr", CallbackRecord, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<KBUGCHECK_REASON_CALLBACK_RECORD>} CallbackRecord 
     * @param {Pointer<PKBUGCHECK_REASON_CALLBACK_ROUTINE>} CallbackRoutine 
     * @param {Integer} Reason 
     * @param {Pointer<Integer>} Component 
     * @returns {BOOLEAN} 
     */
    static KeRegisterBugCheckReasonCallback(CallbackRecord, CallbackRoutine, Reason, Component) {
        ComponentMarshal := Component is VarRef ? "char*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeRegisterBugCheckReasonCallback", "ptr", CallbackRecord, "ptr", CallbackRoutine, "int", Reason, ComponentMarshal, Component, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<PNMI_CALLBACK>} CallbackRoutine 
     * @param {Pointer<Void>} Context 
     * @returns {Pointer<Void>} 
     */
    static KeRegisterNmiCallback(CallbackRoutine, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\KeRegisterNmiCallback", "ptr", CallbackRoutine, ContextMarshal, Context, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @returns {NTSTATUS} 
     */
    static KeDeregisterNmiCallback(Handle) {
        HandleMarshal := Handle is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\KeDeregisterNmiCallback", HandleMarshal, Handle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PBOUND_CALLBACK>} CallbackRoutine 
     * @returns {Pointer<Void>} 
     */
    static KeRegisterBoundCallback(CallbackRoutine) {
        result := DllCall("ntoskrnl.exe\KeRegisterBoundCallback", "ptr", CallbackRoutine, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @returns {NTSTATUS} 
     */
    static KeDeregisterBoundCallback(Handle) {
        HandleMarshal := Handle is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\KeDeregisterBoundCallback", HandleMarshal, Handle, "int")
        return result
    }

    /**
     * 
     * @param {Integer} BugCheckCode 
     * @param {Pointer} BugCheckParameter1 
     * @param {Pointer} BugCheckParameter2 
     * @param {Pointer} BugCheckParameter3 
     * @param {Pointer} BugCheckParameter4 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeBugCheckEx(BugCheckCode, BugCheckParameter1, BugCheckParameter2, BugCheckParameter3, BugCheckParameter4) {
        DllCall("ntoskrnl.exe\KeBugCheckEx", "uint", BugCheckCode, "ptr", BugCheckParameter1, "ptr", BugCheckParameter2, "ptr", BugCheckParameter3, "ptr", BugCheckParameter4)
    }

    /**
     * 
     * @param {Pointer<Integer>} CurrentTime 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeQuerySystemTimePrecise(CurrentTime) {
        CurrentTimeMarshal := CurrentTime is VarRef ? "int64*" : "ptr"

        DllCall("ntoskrnl.exe\KeQuerySystemTimePrecise", CurrentTimeMarshal, CurrentTime)
    }

    /**
     * 
     * @param {Pointer<Integer>} QpcTimeStamp 
     * @returns {Integer} 
     */
    static KeQueryInterruptTimePrecise(QpcTimeStamp) {
        QpcTimeStampMarshal := QpcTimeStamp is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeQueryInterruptTimePrecise", QpcTimeStampMarshal, QpcTimeStamp, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} QpcTimeStamp 
     * @returns {Integer} 
     */
    static KeQueryUnbiasedInterruptTimePrecise(QpcTimeStamp) {
        QpcTimeStampMarshal := QpcTimeStamp is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeQueryUnbiasedInterruptTimePrecise", QpcTimeStampMarshal, QpcTimeStamp, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static KeQueryTimeIncrement() {
        result := DllCall("ntoskrnl.exe\KeQueryTimeIncrement", "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static KeQueryUnbiasedInterruptTime() {
        result := DllCall("ntoskrnl.exe\KeQueryUnbiasedInterruptTime", "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static KeGetRecommendedSharedDataAlignment() {
        result := DllCall("ntoskrnl.exe\KeGetRecommendedSharedDataAlignment", "uint")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    static KeQueryActiveProcessors() {
        result := DllCall("ntoskrnl.exe\KeQueryActiveProcessors", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} ActiveProcessors 
     * @returns {Integer} 
     */
    static KeQueryActiveProcessorCount(ActiveProcessors) {
        ActiveProcessorsMarshal := ActiveProcessors is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeQueryActiveProcessorCount", ActiveProcessorsMarshal, ActiveProcessors, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} GroupNumber 
     * @returns {Integer} 
     */
    static KeQueryActiveProcessorCountEx(GroupNumber) {
        result := DllCall("ntoskrnl.exe\KeQueryActiveProcessorCountEx", "ushort", GroupNumber, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static KeQueryMaximumProcessorCount() {
        result := DllCall("ntoskrnl.exe\KeQueryMaximumProcessorCount", "uint")
        return result
    }

    /**
     * 
     * @param {Integer} GroupNumber 
     * @returns {Integer} 
     */
    static KeQueryMaximumProcessorCountEx(GroupNumber) {
        result := DllCall("ntoskrnl.exe\KeQueryMaximumProcessorCountEx", "ushort", GroupNumber, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static KeQueryActiveGroupCount() {
        result := DllCall("ntoskrnl.exe\KeQueryActiveGroupCount", "ushort")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static KeQueryMaximumGroupCount() {
        result := DllCall("ntoskrnl.exe\KeQueryMaximumGroupCount", "ushort")
        return result
    }

    /**
     * 
     * @param {Integer} GroupNumber 
     * @returns {Pointer} 
     */
    static KeQueryGroupAffinity(GroupNumber) {
        result := DllCall("ntoskrnl.exe\KeQueryGroupAffinity", "ushort", GroupNumber, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<PROCESSOR_NUMBER>} ProcNumber 
     * @returns {Integer} 
     */
    static KeGetCurrentProcessorNumberEx(ProcNumber) {
        result := DllCall("ntoskrnl.exe\KeGetCurrentProcessorNumberEx", "ptr", ProcNumber, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} NodeNumber 
     * @param {Pointer<GROUP_AFFINITY>} Affinity 
     * @param {Pointer<Integer>} Count 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeQueryNodeActiveAffinity(NodeNumber, Affinity, Count) {
        CountMarshal := Count is VarRef ? "ushort*" : "ptr"

        DllCall("ntoskrnl.exe\KeQueryNodeActiveAffinity", "ushort", NodeNumber, "ptr", Affinity, CountMarshal, Count)
    }

    /**
     * 
     * @param {Integer} NodeNumber 
     * @returns {Integer} 
     */
    static KeQueryNodeMaximumProcessorCount(NodeNumber) {
        result := DllCall("ntoskrnl.exe\KeQueryNodeMaximumProcessorCount", "ushort", NodeNumber, "ushort")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static KeQueryHighestNodeNumber() {
        result := DllCall("ntoskrnl.exe\KeQueryHighestNodeNumber", "ushort")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static KeGetCurrentNodeNumber() {
        result := DllCall("ntoskrnl.exe\KeGetCurrentNodeNumber", "ushort")
        return result
    }

    /**
     * 
     * @param {Pointer<PROCESSOR_NUMBER>} ProcessorNumber 
     * @param {Integer} RelationshipType 
     * @param {Pointer} Information 
     * @param {Pointer<Integer>} Length 
     * @returns {NTSTATUS} 
     */
    static KeQueryLogicalProcessorRelationship(ProcessorNumber, RelationshipType, Information, Length) {
        LengthMarshal := Length is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeQueryLogicalProcessorRelationship", "ptr", ProcessorNumber, "int", RelationshipType, "ptr", Information, LengthMarshal, Length, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static KeShouldYieldProcessor() {
        result := DllCall("ntoskrnl.exe\KeShouldYieldProcessor", "uint")
        return result
    }

    /**
     * 
     * @param {Integer} NodeNumber 
     * @param {Pointer<GROUP_AFFINITY>} GroupAffinities 
     * @param {Integer} GroupAffinitiesCount 
     * @param {Pointer<Integer>} GroupAffinitiesRequired 
     * @returns {NTSTATUS} 
     */
    static KeQueryNodeActiveAffinity2(NodeNumber, GroupAffinities, GroupAffinitiesCount, GroupAffinitiesRequired) {
        GroupAffinitiesRequiredMarshal := GroupAffinitiesRequired is VarRef ? "ushort*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeQueryNodeActiveAffinity2", "ushort", NodeNumber, "ptr", GroupAffinities, "ushort", GroupAffinitiesCount, GroupAffinitiesRequiredMarshal, GroupAffinitiesRequired, "int")
        return result
    }

    /**
     * 
     * @param {Integer} NodeNumber 
     * @returns {Integer} 
     */
    static KeQueryNodeActiveProcessorCount(NodeNumber) {
        result := DllCall("ntoskrnl.exe\KeQueryNodeActiveProcessorCount", "ushort", NodeNumber, "uint")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static KeAreAllApcsDisabled() {
        result := DllCall("ntoskrnl.exe\KeAreAllApcsDisabled", "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FAST_MUTEX>} Mutex 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeInitializeGuardedMutex(Mutex) {
        DllCall("ntoskrnl.exe\KeInitializeGuardedMutex", "ptr", Mutex)
    }

    /**
     * 
     * @param {Pointer<FAST_MUTEX>} Mutex 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeAcquireGuardedMutex(Mutex) {
        DllCall("ntoskrnl.exe\KeAcquireGuardedMutex", "ptr", Mutex)
    }

    /**
     * 
     * @param {Pointer<FAST_MUTEX>} Mutex 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeReleaseGuardedMutex(Mutex) {
        DllCall("ntoskrnl.exe\KeReleaseGuardedMutex", "ptr", Mutex)
    }

    /**
     * 
     * @param {Pointer<FAST_MUTEX>} Mutex 
     * @returns {BOOLEAN} 
     */
    static KeTryToAcquireGuardedMutex(Mutex) {
        result := DllCall("ntoskrnl.exe\KeTryToAcquireGuardedMutex", "ptr", Mutex, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FAST_MUTEX>} FastMutex 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeAcquireGuardedMutexUnsafe(FastMutex) {
        DllCall("ntoskrnl.exe\KeAcquireGuardedMutexUnsafe", "ptr", FastMutex)
    }

    /**
     * 
     * @param {Pointer<FAST_MUTEX>} FastMutex 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeReleaseGuardedMutexUnsafe(FastMutex) {
        DllCall("ntoskrnl.exe\KeReleaseGuardedMutexUnsafe", "ptr", FastMutex)
    }

    /**
     * 
     * @param {Pointer<PPROCESSOR_CALLBACK_FUNCTION>} CallbackFunction 
     * @param {Pointer<Void>} CallbackContext 
     * @param {Integer} Flags 
     * @returns {Pointer<Void>} 
     */
    static KeRegisterProcessorChangeCallback(CallbackFunction, CallbackContext, Flags) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\KeRegisterProcessorChangeCallback", "ptr", CallbackFunction, CallbackContextMarshal, CallbackContext, "uint", Flags, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} CallbackHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeDeregisterProcessorChangeCallback(CallbackHandle) {
        CallbackHandleMarshal := CallbackHandle is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\KeDeregisterProcessorChangeCallback", CallbackHandleMarshal, CallbackHandle)
    }

    /**
     * 
     * @param {Integer} ProcIndex 
     * @param {Pointer<PROCESSOR_NUMBER>} ProcNumber 
     * @returns {NTSTATUS} 
     */
    static KeGetProcessorNumberFromIndex(ProcIndex, ProcNumber) {
        result := DllCall("ntoskrnl.exe\KeGetProcessorNumberFromIndex", "uint", ProcIndex, "ptr", ProcNumber, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PROCESSOR_NUMBER>} ProcNumber 
     * @returns {Integer} 
     */
    static KeGetProcessorIndexFromNumber(ProcNumber) {
        result := DllCall("ntoskrnl.exe\KeGetProcessorIndexFromNumber", "ptr", ProcNumber, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Mask 
     * @param {Pointer<XSTATE_SAVE>} XStateSave 
     * @returns {NTSTATUS} 
     */
    static KeSaveExtendedProcessorState(Mask, XStateSave) {
        result := DllCall("ntoskrnl.exe\KeSaveExtendedProcessorState", "uint", Mask, "ptr", XStateSave, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<XSTATE_SAVE>} XStateSave 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeRestoreExtendedProcessorState(XStateSave) {
        DllCall("ntoskrnl.exe\KeRestoreExtendedProcessorState", "ptr", XStateSave)
    }

    /**
     * 
     * @param {Integer} AuxiliaryCounterValue 
     * @param {Pointer<Integer>} PerformanceCounterValue 
     * @param {Pointer<Integer>} ConversionError 
     * @returns {NTSTATUS} 
     */
    static KeConvertAuxiliaryCounterToPerformanceCounter(AuxiliaryCounterValue, PerformanceCounterValue, ConversionError) {
        PerformanceCounterValueMarshal := PerformanceCounterValue is VarRef ? "uint*" : "ptr"
        ConversionErrorMarshal := ConversionError is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeConvertAuxiliaryCounterToPerformanceCounter", "uint", AuxiliaryCounterValue, PerformanceCounterValueMarshal, PerformanceCounterValue, ConversionErrorMarshal, ConversionError, "int")
        return result
    }

    /**
     * 
     * @param {Integer} PerformanceCounterValue 
     * @param {Pointer<Integer>} AuxiliaryCounterValue 
     * @param {Pointer<Integer>} ConversionError 
     * @returns {NTSTATUS} 
     */
    static KeConvertPerformanceCounterToAuxiliaryCounter(PerformanceCounterValue, AuxiliaryCounterValue, ConversionError) {
        AuxiliaryCounterValueMarshal := AuxiliaryCounterValue is VarRef ? "uint*" : "ptr"
        ConversionErrorMarshal := ConversionError is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeConvertPerformanceCounterToAuxiliaryCounter", "uint", PerformanceCounterValue, AuxiliaryCounterValueMarshal, AuxiliaryCounterValue, ConversionErrorMarshal, ConversionError, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} AuxiliaryCounterFrequency 
     * @returns {NTSTATUS} 
     */
    static KeQueryAuxiliaryCounterFrequency(AuxiliaryCounterFrequency) {
        AuxiliaryCounterFrequencyMarshal := AuxiliaryCounterFrequency is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeQueryAuxiliaryCounterFrequency", AuxiliaryCounterFrequencyMarshal, AuxiliaryCounterFrequency, "int")
        return result
    }

    /**
     * 
     * @returns {NTSTATUS} 
     */
    static KdDisableDebugger() {
        result := DllCall("ntoskrnl.exe\KdDisableDebugger", "int")
        return result
    }

    /**
     * 
     * @returns {NTSTATUS} 
     */
    static KdEnableDebugger() {
        result := DllCall("ntoskrnl.exe\KdEnableDebugger", "int")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static KdRefreshDebuggerNotPresent() {
        result := DllCall("ntoskrnl.exe\KdRefreshDebuggerNotPresent", "char")
        return result
    }

    /**
     * 
     * @param {Integer} Option 
     * @param {Integer} InBufferBytes 
     * @param {Pointer<Void>} InBuffer 
     * @param {Integer} OutBufferBytes 
     * @param {Pointer<Void>} OutBuffer 
     * @param {Pointer<Integer>} OutBufferNeeded 
     * @returns {NTSTATUS} 
     */
    static KdChangeOption(Option, InBufferBytes, InBuffer, OutBufferBytes, OutBuffer, OutBufferNeeded) {
        InBufferMarshal := InBuffer is VarRef ? "ptr" : "ptr"
        OutBufferMarshal := OutBuffer is VarRef ? "ptr" : "ptr"
        OutBufferNeededMarshal := OutBufferNeeded is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\KdChangeOption", "int", Option, "uint", InBufferBytes, InBufferMarshal, InBuffer, "uint", OutBufferBytes, OutBufferMarshal, OutBuffer, OutBufferNeededMarshal, OutBufferNeeded, "int")
        return result
    }

    /**
     * 
     * @param {Integer} PoolType 
     * @param {Pointer} NumberOfBytes 
     * @returns {Pointer<Void>} 
     * @deprecated ExAllocatePool is deprecated, use ExAllocatePool2.
     */
    static ExAllocatePool(PoolType, NumberOfBytes) {
        result := DllCall("ntoskrnl.exe\ExAllocatePool", "int", PoolType, "ptr", NumberOfBytes, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} PoolType 
     * @param {Pointer} NumberOfBytes 
     * @returns {Pointer<Void>} 
     * @deprecated ExAllocatePoolWithQuota is deprecated, use ExAllocatePool2.
     */
    static ExAllocatePoolWithQuota(PoolType, NumberOfBytes) {
        result := DllCall("ntoskrnl.exe\ExAllocatePoolWithQuota", "int", PoolType, "ptr", NumberOfBytes, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} PoolType 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} Tag 
     * @returns {Pointer<Void>} 
     * @deprecated ExAllocatePoolWithTag is deprecated, use ExAllocatePool2.
     */
    static ExAllocatePoolWithTag(PoolType, NumberOfBytes, Tag) {
        result := DllCall("ntoskrnl.exe\ExAllocatePoolWithTag", "int", PoolType, "ptr", NumberOfBytes, "uint", Tag, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} PoolType 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} Tag 
     * @param {Integer} Priority 
     * @returns {Pointer<Void>} 
     * @deprecated ExAllocatePoolWithTagPriority is deprecated, use ExAllocatePool3.
     */
    static ExAllocatePoolWithTagPriority(PoolType, NumberOfBytes, Tag, Priority) {
        result := DllCall("ntoskrnl.exe\ExAllocatePoolWithTagPriority", "int", PoolType, "ptr", NumberOfBytes, "uint", Tag, "int", Priority, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} Tag 
     * @returns {Pointer<Void>} 
     */
    static ExAllocatePool2(Flags, NumberOfBytes, Tag) {
        result := DllCall("ntoskrnl.exe\ExAllocatePool2", "uint", Flags, "ptr", NumberOfBytes, "uint", Tag, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} Tag 
     * @param {Pointer<POOL_EXTENDED_PARAMETER>} ExtendedParameters 
     * @param {Integer} ExtendedParametersCount 
     * @returns {Pointer<Void>} 
     */
    static ExAllocatePool3(Flags, NumberOfBytes, Tag, ExtendedParameters, ExtendedParametersCount) {
        result := DllCall("ntoskrnl.exe\ExAllocatePool3", "uint", Flags, "ptr", NumberOfBytes, "uint", Tag, "ptr", ExtendedParameters, "uint", ExtendedParametersCount, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} P 
     * @param {Integer} Tag 
     * @param {Pointer<POOL_EXTENDED_PARAMETER>} ExtendedParameters 
     * @param {Integer} ExtendedParametersCount 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExFreePool2(P, Tag, ExtendedParameters, ExtendedParametersCount) {
        PMarshal := P is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\ExFreePool2", PMarshal, P, "uint", Tag, "ptr", ExtendedParameters, "uint", ExtendedParametersCount)
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer} Tag 
     * @param {Pointer<POOL_CREATE_EXTENDED_PARAMS>} Params 
     * @param {Pointer<HANDLE>} PoolHandle 
     * @returns {NTSTATUS} 
     */
    static ExCreatePool(Flags, Tag, Params, PoolHandle) {
        result := DllCall("ntoskrnl.exe\ExCreatePool", "uint", Flags, "ptr", Tag, "ptr", Params, "ptr", PoolHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} PoolHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExDestroyPool(PoolHandle) {
        PoolHandle := PoolHandle is Win32Handle ? NumGet(PoolHandle, "ptr") : PoolHandle

        DllCall("ntoskrnl.exe\ExDestroyPool", "ptr", PoolHandle)
    }

    /**
     * 
     * @param {HANDLE} SecurePoolHandle 
     * @param {Integer} Tag 
     * @param {Pointer<Void>} Allocation 
     * @param {Pointer} Cookie 
     * @param {Pointer} Offset 
     * @param {Pointer} Size 
     * @param {Pointer<Void>} Buffer_R 
     * @returns {NTSTATUS} 
     */
    static ExSecurePoolUpdate(SecurePoolHandle, Tag, Allocation, Cookie, Offset, Size, Buffer_R) {
        SecurePoolHandle := SecurePoolHandle is Win32Handle ? NumGet(SecurePoolHandle, "ptr") : SecurePoolHandle

        AllocationMarshal := Allocation is VarRef ? "ptr" : "ptr"
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ExSecurePoolUpdate", "ptr", SecurePoolHandle, "uint", Tag, AllocationMarshal, Allocation, "ptr", Cookie, "ptr", Offset, "ptr", Size, Buffer_RMarshal, Buffer_R, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} SecurePoolHandle 
     * @param {Integer} Tag 
     * @param {Pointer<Void>} Allocation 
     * @param {Pointer} Cookie 
     * @returns {Integer} 
     */
    static ExSecurePoolValidate(SecurePoolHandle, Tag, Allocation, Cookie) {
        SecurePoolHandle := SecurePoolHandle is Win32Handle ? NumGet(SecurePoolHandle, "ptr") : SecurePoolHandle

        AllocationMarshal := Allocation is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ExSecurePoolValidate", "ptr", SecurePoolHandle, "uint", Tag, AllocationMarshal, Allocation, "ptr", Cookie, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} PoolType 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} Tag 
     * @returns {Pointer<Void>} 
     * @deprecated ExAllocatePoolWithQuotaTag is deprecated, use ExAllocatePool2.
     */
    static ExAllocatePoolWithQuotaTag(PoolType, NumberOfBytes, Tag) {
        result := DllCall("ntoskrnl.exe\ExAllocatePoolWithQuotaTag", "int", PoolType, "ptr", NumberOfBytes, "uint", Tag, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} P 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExFreePool(P) {
        PMarshal := P is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\ExFreePool", PMarshal, P)
    }

    /**
     * 
     * @param {Pointer<Void>} P 
     * @param {Integer} Tag 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExFreePoolWithTag(P, Tag) {
        PMarshal := P is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\ExFreePoolWithTag", PMarshal, P, "uint", Tag)
    }

    /**
     * 
     * @param {Pointer<FAST_MUTEX>} FastMutex 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExAcquireFastMutexUnsafe(FastMutex) {
        DllCall("ntoskrnl.exe\ExAcquireFastMutexUnsafe", "ptr", FastMutex)
    }

    /**
     * 
     * @param {Pointer<FAST_MUTEX>} FastMutex 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleaseFastMutexUnsafe(FastMutex) {
        DllCall("ntoskrnl.exe\ExReleaseFastMutexUnsafe", "ptr", FastMutex)
    }

    /**
     * 
     * @param {Pointer<FAST_MUTEX>} FastMutex 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExAcquireFastMutex(FastMutex) {
        DllCall("ntoskrnl.exe\ExAcquireFastMutex", "ptr", FastMutex)
    }

    /**
     * 
     * @param {Pointer<FAST_MUTEX>} FastMutex 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleaseFastMutex(FastMutex) {
        DllCall("ntoskrnl.exe\ExReleaseFastMutex", "ptr", FastMutex)
    }

    /**
     * 
     * @param {Pointer<FAST_MUTEX>} FastMutex 
     * @returns {BOOLEAN} 
     */
    static ExTryToAcquireFastMutex(FastMutex) {
        result := DllCall("ntoskrnl.exe\ExTryToAcquireFastMutex", "ptr", FastMutex, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Addend 
     * @param {Integer} Increment 
     * @param {Pointer<Pointer>} Lock 
     * @returns {Integer} 
     */
    static ExInterlockedAddLargeInteger(Addend, Increment, Lock) {
        AddendMarshal := Addend is VarRef ? "int64*" : "ptr"
        LockMarshal := Lock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\ExInterlockedAddLargeInteger", AddendMarshal, Addend, "int64", Increment, LockMarshal, Lock, "int64")
        return result
    }

    /**
     * 
     * @param {Pointer} Address 
     * @param {Pointer} Length 
     * @param {Integer} Alignment 
     * @returns {String} Nothing - always returns an empty string
     */
    static ProbeForRead(Address, Length, Alignment) {
        DllCall("ntoskrnl.exe\ProbeForRead", "ptr", Address, "ptr", Length, "uint", Alignment)
    }

    /**
     * 
     * @param {NTSTATUS} Status 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExRaiseStatus(Status) {
        DllCall("ntoskrnl.exe\ExRaiseStatus", "int", Status)
    }

    /**
     * 
     * @param {Pointer} Address 
     * @param {Pointer} Length 
     * @param {Integer} Alignment 
     * @returns {String} Nothing - always returns an empty string
     */
    static ProbeForWrite(Address, Length, Alignment) {
        DllCall("ntoskrnl.exe\ProbeForWrite", "ptr", Address, "ptr", Length, "uint", Alignment)
    }

    /**
     * 
     * @param {Pointer<WORK_QUEUE_ITEM>} WorkItem 
     * @param {Integer} QueueType 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExQueueWorkItem(WorkItem, QueueType) {
        DllCall("ntoskrnl.exe\ExQueueWorkItem", "ptr", WorkItem, "int", QueueType)
    }

    /**
     * 
     * @param {Integer} ProcessorFeature 
     * @returns {BOOLEAN} 
     */
    static ExIsProcessorFeaturePresent(ProcessorFeature) {
        result := DllCall("ntoskrnl.exe\ExIsProcessorFeaturePresent", "uint", ProcessorFeature, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {NTSTATUS} 
     */
    static ExInitializeResourceLite(Resource) {
        result := DllCall("ntoskrnl.exe\ExInitializeResourceLite", "ptr", Resource, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {NTSTATUS} 
     */
    static ExReinitializeResourceLite(Resource) {
        result := DllCall("ntoskrnl.exe\ExReinitializeResourceLite", "ptr", Resource, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @param {BOOLEAN} Wait 
     * @returns {BOOLEAN} 
     */
    static ExAcquireResourceSharedLite(Resource, Wait) {
        result := DllCall("ntoskrnl.exe\ExAcquireResourceSharedLite", "ptr", Resource, "char", Wait, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {Pointer<Void>} 
     */
    static ExEnterCriticalRegionAndAcquireResourceShared(Resource) {
        result := DllCall("ntoskrnl.exe\ExEnterCriticalRegionAndAcquireResourceShared", "ptr", Resource, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @param {BOOLEAN} Wait 
     * @returns {BOOLEAN} 
     */
    static ExAcquireResourceExclusiveLite(Resource, Wait) {
        result := DllCall("ntoskrnl.exe\ExAcquireResourceExclusiveLite", "ptr", Resource, "char", Wait, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {Pointer<Void>} 
     */
    static ExEnterCriticalRegionAndAcquireResourceExclusive(Resource) {
        result := DllCall("ntoskrnl.exe\ExEnterCriticalRegionAndAcquireResourceExclusive", "ptr", Resource, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @param {BOOLEAN} Wait 
     * @returns {BOOLEAN} 
     */
    static ExAcquireSharedStarveExclusive(Resource, Wait) {
        result := DllCall("ntoskrnl.exe\ExAcquireSharedStarveExclusive", "ptr", Resource, "char", Wait, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @param {BOOLEAN} Wait 
     * @returns {BOOLEAN} 
     */
    static ExAcquireSharedWaitForExclusive(Resource, Wait) {
        result := DllCall("ntoskrnl.exe\ExAcquireSharedWaitForExclusive", "ptr", Resource, "char", Wait, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {Pointer<Void>} 
     */
    static ExEnterCriticalRegionAndAcquireSharedWaitForExclusive(Resource) {
        result := DllCall("ntoskrnl.exe\ExEnterCriticalRegionAndAcquireSharedWaitForExclusive", "ptr", Resource, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleaseResourceLite(Resource) {
        DllCall("ntoskrnl.exe\ExReleaseResourceLite", "ptr", Resource)
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleaseResourceAndLeaveCriticalRegion(Resource) {
        DllCall("ntoskrnl.exe\ExReleaseResourceAndLeaveCriticalRegion", "ptr", Resource)
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @param {Pointer} ResourceThreadId 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleaseResourceForThreadLite(Resource, ResourceThreadId) {
        DllCall("ntoskrnl.exe\ExReleaseResourceForThreadLite", "ptr", Resource, "ptr", ResourceThreadId)
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @param {Pointer<Void>} OwnerPointer 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExSetResourceOwnerPointer(Resource, OwnerPointer) {
        OwnerPointerMarshal := OwnerPointer is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\ExSetResourceOwnerPointer", "ptr", Resource, OwnerPointerMarshal, OwnerPointer)
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @param {Pointer<Void>} OwnerPointer 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExSetResourceOwnerPointerEx(Resource, OwnerPointer, Flags) {
        OwnerPointerMarshal := OwnerPointer is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\ExSetResourceOwnerPointerEx", "ptr", Resource, OwnerPointerMarshal, OwnerPointer, "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExConvertExclusiveToSharedLite(Resource) {
        DllCall("ntoskrnl.exe\ExConvertExclusiveToSharedLite", "ptr", Resource)
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {NTSTATUS} 
     */
    static ExDeleteResourceLite(Resource) {
        result := DllCall("ntoskrnl.exe\ExDeleteResourceLite", "ptr", Resource, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {Integer} 
     */
    static ExGetExclusiveWaiterCount(Resource) {
        result := DllCall("ntoskrnl.exe\ExGetExclusiveWaiterCount", "ptr", Resource, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {Integer} 
     */
    static ExGetSharedWaiterCount(Resource) {
        result := DllCall("ntoskrnl.exe\ExGetSharedWaiterCount", "ptr", Resource, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {BOOLEAN} 
     */
    static ExIsResourceAcquiredExclusiveLite(Resource) {
        result := DllCall("ntoskrnl.exe\ExIsResourceAcquiredExclusiveLite", "ptr", Resource, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<ERESOURCE>} Resource 
     * @returns {Integer} 
     */
    static ExIsResourceAcquiredSharedLite(Resource) {
        result := DllCall("ntoskrnl.exe\ExIsResourceAcquiredSharedLite", "ptr", Resource, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static ExGetPreviousMode() {
        result := DllCall("ntoskrnl.exe\ExGetPreviousMode", "char")
        return result
    }

    /**
     * 
     * @param {Integer} DesiredTime 
     * @param {BOOLEAN} SetResolution 
     * @returns {Integer} 
     */
    static ExSetTimerResolution(DesiredTime, SetResolution) {
        result := DllCall("ntoskrnl.exe\ExSetTimerResolution", "uint", DesiredTime, "char", SetResolution, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} MaximumTime 
     * @param {Pointer<Integer>} MinimumTime 
     * @param {Pointer<Integer>} CurrentTime 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExQueryTimerResolution(MaximumTime, MinimumTime, CurrentTime) {
        MaximumTimeMarshal := MaximumTime is VarRef ? "uint*" : "ptr"
        MinimumTimeMarshal := MinimumTime is VarRef ? "uint*" : "ptr"
        CurrentTimeMarshal := CurrentTime is VarRef ? "uint*" : "ptr"

        DllCall("ntoskrnl.exe\ExQueryTimerResolution", MaximumTimeMarshal, MaximumTime, MinimumTimeMarshal, MinimumTime, CurrentTimeMarshal, CurrentTime)
    }

    /**
     * 
     * @param {Pointer<Integer>} SystemTime 
     * @param {Pointer<Integer>} LocalTime 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExSystemTimeToLocalTime(SystemTime, LocalTime) {
        SystemTimeMarshal := SystemTime is VarRef ? "int64*" : "ptr"
        LocalTimeMarshal := LocalTime is VarRef ? "int64*" : "ptr"

        DllCall("ntoskrnl.exe\ExSystemTimeToLocalTime", SystemTimeMarshal, SystemTime, LocalTimeMarshal, LocalTime)
    }

    /**
     * 
     * @param {Pointer<Integer>} LocalTime 
     * @param {Pointer<Integer>} SystemTime 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExLocalTimeToSystemTime(LocalTime, SystemTime) {
        LocalTimeMarshal := LocalTime is VarRef ? "int64*" : "ptr"
        SystemTimeMarshal := SystemTime is VarRef ? "int64*" : "ptr"

        DllCall("ntoskrnl.exe\ExLocalTimeToSystemTime", LocalTimeMarshal, LocalTime, SystemTimeMarshal, SystemTime)
    }

    /**
     * 
     * @param {Pointer<PEXT_CALLBACK>} Callback 
     * @param {Pointer<Void>} CallbackContext 
     * @param {Integer} Attributes 
     * @returns {PEX_TIMER} 
     */
    static ExAllocateTimer(Callback, CallbackContext, Attributes) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ExAllocateTimer", "ptr", Callback, CallbackContextMarshal, CallbackContext, "uint", Attributes, "ptr")
        return result
    }

    /**
     * 
     * @param {PEX_TIMER} Timer 
     * @param {Integer} DueTime 
     * @param {Integer} Period 
     * @param {Pointer<_EXT_SET_PARAMETERS_V0>} Parameters 
     * @returns {BOOLEAN} 
     */
    static ExSetTimer(Timer, DueTime, Period, Parameters) {
        result := DllCall("ntoskrnl.exe\ExSetTimer", "ptr", Timer, "int64", DueTime, "int64", Period, "ptr", Parameters, "char")
        return result
    }

    /**
     * 
     * @param {PEX_TIMER} Timer 
     * @param {Pointer<Void>} Parameters 
     * @returns {BOOLEAN} 
     */
    static ExCancelTimer(Timer, Parameters) {
        ParametersMarshal := Parameters is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ExCancelTimer", "ptr", Timer, ParametersMarshal, Parameters, "char")
        return result
    }

    /**
     * 
     * @param {PEX_TIMER} Timer 
     * @param {BOOLEAN} Cancel 
     * @param {BOOLEAN} Wait 
     * @param {Pointer<EXT_DELETE_PARAMETERS>} Parameters 
     * @returns {BOOLEAN} 
     */
    static ExDeleteTimer(Timer, Cancel, Wait, Parameters) {
        result := DllCall("ntoskrnl.exe\ExDeleteTimer", "ptr", Timer, "char", Cancel, "char", Wait, "ptr", Parameters, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<PCALLBACK_OBJECT>} CallbackObject 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {BOOLEAN} Create 
     * @param {BOOLEAN} AllowMultipleCallbacks 
     * @returns {NTSTATUS} 
     */
    static ExCreateCallback(CallbackObject, ObjectAttributes, Create, AllowMultipleCallbacks) {
        CallbackObjectMarshal := CallbackObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\ExCreateCallback", CallbackObjectMarshal, CallbackObject, "ptr", ObjectAttributes, "char", Create, "char", AllowMultipleCallbacks, "int")
        return result
    }

    /**
     * 
     * @param {PCALLBACK_OBJECT} CallbackObject 
     * @param {Pointer<PCALLBACK_FUNCTION>} CallbackFunction 
     * @param {Pointer<Void>} CallbackContext 
     * @returns {Pointer<Void>} 
     */
    static ExRegisterCallback(CallbackObject, CallbackFunction, CallbackContext) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ExRegisterCallback", "ptr", CallbackObject, "ptr", CallbackFunction, CallbackContextMarshal, CallbackContext, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} CallbackRegistration 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExUnregisterCallback(CallbackRegistration) {
        CallbackRegistrationMarshal := CallbackRegistration is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\ExUnregisterCallback", CallbackRegistrationMarshal, CallbackRegistration)
    }

    /**
     * 
     * @param {Pointer<Void>} CallbackObject 
     * @param {Pointer<Void>} Argument1 
     * @param {Pointer<Void>} Argument2 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExNotifyCallback(CallbackObject, Argument1, Argument2) {
        CallbackObjectMarshal := CallbackObject is VarRef ? "ptr" : "ptr"
        Argument1Marshal := Argument1 is VarRef ? "ptr" : "ptr"
        Argument2Marshal := Argument2 is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\ExNotifyCallback", CallbackObjectMarshal, CallbackObject, Argument1Marshal, Argument1, Argument2Marshal, Argument2)
    }

    /**
     * 
     * @param {Integer} SuiteType 
     * @returns {BOOLEAN} 
     */
    static ExVerifySuite(SuiteType) {
        result := DllCall("ntoskrnl.exe\ExVerifySuite", "int", SuiteType, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExInitializeRundownProtection(RunRef) {
        DllCall("ntoskrnl.exe\ExInitializeRundownProtection", "ptr", RunRef)
    }

    /**
     * 
     * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReInitializeRundownProtection(RunRef) {
        DllCall("ntoskrnl.exe\ExReInitializeRundownProtection", "ptr", RunRef)
    }

    /**
     * 
     * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
     * @returns {BOOLEAN} 
     */
    static ExAcquireRundownProtection(RunRef) {
        result := DllCall("ntoskrnl.exe\ExAcquireRundownProtection", "ptr", RunRef, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
     * @param {Integer} Count 
     * @returns {BOOLEAN} 
     */
    static ExAcquireRundownProtectionEx(RunRef, Count) {
        result := DllCall("ntoskrnl.exe\ExAcquireRundownProtectionEx", "ptr", RunRef, "uint", Count, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleaseRundownProtection(RunRef) {
        DllCall("ntoskrnl.exe\ExReleaseRundownProtection", "ptr", RunRef)
    }

    /**
     * 
     * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
     * @param {Integer} Count 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleaseRundownProtectionEx(RunRef, Count) {
        DllCall("ntoskrnl.exe\ExReleaseRundownProtectionEx", "ptr", RunRef, "uint", Count)
    }

    /**
     * 
     * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExRundownCompleted(RunRef) {
        DllCall("ntoskrnl.exe\ExRundownCompleted", "ptr", RunRef)
    }

    /**
     * 
     * @param {Pointer<EX_RUNDOWN_REF>} RunRef 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExWaitForRundownProtectionRelease(RunRef) {
        DllCall("ntoskrnl.exe\ExWaitForRundownProtectionRelease", "ptr", RunRef)
    }

    /**
     * 
     * @param {Integer} PoolType 
     * @param {Integer} PoolTag 
     * @returns {PEX_RUNDOWN_REF_CACHE_AWARE} 
     */
    static ExAllocateCacheAwareRundownProtection(PoolType, PoolTag) {
        result := DllCall("ntoskrnl.exe\ExAllocateCacheAwareRundownProtection", "int", PoolType, "uint", PoolTag, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     */
    static ExSizeOfRundownProtectionCacheAware() {
        result := DllCall("ntoskrnl.exe\ExSizeOfRundownProtectionCacheAware", "ptr")
        return result
    }

    /**
     * 
     * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
     * @param {Pointer} RunRefSize 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExInitializeRundownProtectionCacheAware(RunRefCacheAware, RunRefSize) {
        DllCall("ntoskrnl.exe\ExInitializeRundownProtectionCacheAware", "ptr", RunRefCacheAware, "ptr", RunRefSize)
    }

    /**
     * 
     * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExFreeCacheAwareRundownProtection(RunRefCacheAware) {
        DllCall("ntoskrnl.exe\ExFreeCacheAwareRundownProtection", "ptr", RunRefCacheAware)
    }

    /**
     * 
     * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
     * @returns {BOOLEAN} 
     */
    static ExAcquireRundownProtectionCacheAware(RunRefCacheAware) {
        result := DllCall("ntoskrnl.exe\ExAcquireRundownProtectionCacheAware", "ptr", RunRefCacheAware, "char")
        return result
    }

    /**
     * 
     * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleaseRundownProtectionCacheAware(RunRefCacheAware) {
        DllCall("ntoskrnl.exe\ExReleaseRundownProtectionCacheAware", "ptr", RunRefCacheAware)
    }

    /**
     * 
     * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
     * @param {Integer} Count 
     * @returns {BOOLEAN} 
     */
    static ExAcquireRundownProtectionCacheAwareEx(RunRefCacheAware, Count) {
        result := DllCall("ntoskrnl.exe\ExAcquireRundownProtectionCacheAwareEx", "ptr", RunRefCacheAware, "uint", Count, "char")
        return result
    }

    /**
     * 
     * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRef 
     * @param {Integer} Count 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleaseRundownProtectionCacheAwareEx(RunRef, Count) {
        DllCall("ntoskrnl.exe\ExReleaseRundownProtectionCacheAwareEx", "ptr", RunRef, "uint", Count)
    }

    /**
     * 
     * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRef 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExWaitForRundownProtectionReleaseCacheAware(RunRef) {
        DllCall("ntoskrnl.exe\ExWaitForRundownProtectionReleaseCacheAware", "ptr", RunRef)
    }

    /**
     * 
     * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReInitializeRundownProtectionCacheAware(RunRefCacheAware) {
        DllCall("ntoskrnl.exe\ExReInitializeRundownProtectionCacheAware", "ptr", RunRefCacheAware)
    }

    /**
     * 
     * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExRundownCompletedCacheAware(RunRefCacheAware) {
        DllCall("ntoskrnl.exe\ExRundownCompletedCacheAware", "ptr", RunRefCacheAware)
    }

    /**
     * 
     * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExInitializeRundownProtectionCacheAwareEx(RunRefCacheAware, Flags) {
        DllCall("ntoskrnl.exe\ExInitializeRundownProtectionCacheAwareEx", "ptr", RunRefCacheAware, "uint", Flags)
    }

    /**
     * 
     * @param {PEX_RUNDOWN_REF_CACHE_AWARE} RunRefCacheAware 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExCleanupRundownProtectionCacheAware(RunRefCacheAware) {
        DllCall("ntoskrnl.exe\ExCleanupRundownProtectionCacheAware", "ptr", RunRefCacheAware)
    }

    /**
     * 
     * @param {Pointer<Pointer>} PushLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExInitializePushLock(PushLock) {
        PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\ExInitializePushLock", PushLockMarshal, PushLock)
    }

    /**
     * 
     * @param {Pointer<Pointer>} PushLock 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExAcquirePushLockExclusiveEx(PushLock, Flags) {
        PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\ExAcquirePushLockExclusiveEx", PushLockMarshal, PushLock, "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<Pointer>} PushLock 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExAcquirePushLockSharedEx(PushLock, Flags) {
        PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\ExAcquirePushLockSharedEx", PushLockMarshal, PushLock, "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<Pointer>} PushLock 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleasePushLockExclusiveEx(PushLock, Flags) {
        PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\ExReleasePushLockExclusiveEx", PushLockMarshal, PushLock, "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<Pointer>} PushLock 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleasePushLockSharedEx(PushLock, Flags) {
        PushLockMarshal := PushLock is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\ExReleasePushLockSharedEx", PushLockMarshal, PushLock, "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} SpinLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExAcquireSpinLockSharedAtDpcLevel(SpinLock) {
        SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

        DllCall("ntoskrnl.exe\ExAcquireSpinLockSharedAtDpcLevel", SpinLockMarshal, SpinLock)
    }

    /**
     * 
     * @param {Pointer<Integer>} SpinLock 
     * @returns {Integer} 
     */
    static ExAcquireSpinLockShared(SpinLock) {
        SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

        result := DllCall("ntoskrnl.exe\ExAcquireSpinLockShared", SpinLockMarshal, SpinLock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SpinLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleaseSpinLockSharedFromDpcLevel(SpinLock) {
        SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

        DllCall("ntoskrnl.exe\ExReleaseSpinLockSharedFromDpcLevel", SpinLockMarshal, SpinLock)
    }

    /**
     * 
     * @param {Pointer<Integer>} SpinLock 
     * @param {Integer} OldIrql 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleaseSpinLockShared(SpinLock, OldIrql) {
        SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

        DllCall("ntoskrnl.exe\ExReleaseSpinLockShared", SpinLockMarshal, SpinLock, "char", OldIrql)
    }

    /**
     * 
     * @param {Pointer<Integer>} SpinLock 
     * @returns {Integer} 
     */
    static ExTryConvertSharedSpinLockExclusive(SpinLock) {
        SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

        result := DllCall("ntoskrnl.exe\ExTryConvertSharedSpinLockExclusive", SpinLockMarshal, SpinLock, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SpinLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExAcquireSpinLockExclusiveAtDpcLevel(SpinLock) {
        SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

        DllCall("ntoskrnl.exe\ExAcquireSpinLockExclusiveAtDpcLevel", SpinLockMarshal, SpinLock)
    }

    /**
     * 
     * @param {Pointer<Integer>} SpinLock 
     * @returns {Integer} 
     */
    static ExAcquireSpinLockExclusive(SpinLock) {
        SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

        result := DllCall("ntoskrnl.exe\ExAcquireSpinLockExclusive", SpinLockMarshal, SpinLock, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SpinLock 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleaseSpinLockExclusiveFromDpcLevel(SpinLock) {
        SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

        DllCall("ntoskrnl.exe\ExReleaseSpinLockExclusiveFromDpcLevel", SpinLockMarshal, SpinLock)
    }

    /**
     * 
     * @param {Pointer<Integer>} SpinLock 
     * @param {Integer} OldIrql 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExReleaseSpinLockExclusive(SpinLock, OldIrql) {
        SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

        DllCall("ntoskrnl.exe\ExReleaseSpinLockExclusive", SpinLockMarshal, SpinLock, "char", OldIrql)
    }

    /**
     * 
     * @param {Pointer<Integer>} SpinLock 
     * @returns {Integer} 
     */
    static ExTryAcquireSpinLockSharedAtDpcLevel(SpinLock) {
        SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

        result := DllCall("ntoskrnl.exe\ExTryAcquireSpinLockSharedAtDpcLevel", SpinLockMarshal, SpinLock, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SpinLock 
     * @returns {Integer} 
     */
    static ExTryAcquireSpinLockExclusiveAtDpcLevel(SpinLock) {
        SpinLockMarshal := SpinLock is VarRef ? "int*" : "ptr"

        result := DllCall("ntoskrnl.exe\ExTryAcquireSpinLockExclusiveAtDpcLevel", SpinLockMarshal, SpinLock, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} VariableName 
     * @param {Pointer<Guid>} VendorGuid 
     * @param {Pointer} Value 
     * @param {Pointer<Integer>} ValueLength 
     * @param {Pointer<Integer>} Attributes 
     * @returns {NTSTATUS} 
     */
    static ExGetFirmwareEnvironmentVariable(VariableName, VendorGuid, Value, ValueLength, Attributes) {
        ValueLengthMarshal := ValueLength is VarRef ? "uint*" : "ptr"
        AttributesMarshal := Attributes is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\ExGetFirmwareEnvironmentVariable", "ptr", VariableName, "ptr", VendorGuid, "ptr", Value, ValueLengthMarshal, ValueLength, AttributesMarshal, Attributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} VariableName 
     * @param {Pointer<Guid>} VendorGuid 
     * @param {Pointer} Value 
     * @param {Integer} ValueLength 
     * @param {Integer} Attributes 
     * @returns {NTSTATUS} 
     */
    static ExSetFirmwareEnvironmentVariable(VariableName, VendorGuid, Value, ValueLength, Attributes) {
        result := DllCall("ntoskrnl.exe\ExSetFirmwareEnvironmentVariable", "ptr", VariableName, "ptr", VendorGuid, "ptr", Value, "uint", ValueLength, "uint", Attributes, "int")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static ExIsManufacturingModeEnabled() {
        result := DllCall("ntoskrnl.exe\ExIsManufacturingModeEnabled", "char")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static ExIsSoftBoot() {
        result := DllCall("ntoskrnl.exe\ExIsSoftBoot", "char")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static ExGetFirmwareType() {
        result := DllCall("ntoskrnl.exe\ExGetFirmwareType", "int")
        return result
    }

    /**
     * 
     * @param {Integer} FirmwareTableProviderSignature 
     * @param {Pointer} FirmwareTableBuffer 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ExEnumerateSystemFirmwareTables(FirmwareTableProviderSignature, FirmwareTableBuffer, BufferLength, ReturnLength) {
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\ExEnumerateSystemFirmwareTables", "uint", FirmwareTableProviderSignature, "ptr", FirmwareTableBuffer, "uint", BufferLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} FirmwareTableProviderSignature 
     * @param {Integer} FirmwareTableID 
     * @param {Pointer} FirmwareTableBuffer 
     * @param {Integer} BufferLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ExGetSystemFirmwareTable(FirmwareTableProviderSignature, FirmwareTableID, FirmwareTableBuffer, BufferLength, ReturnLength) {
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\ExGetSystemFirmwareTable", "uint", FirmwareTableProviderSignature, "uint", FirmwareTableID, "ptr", FirmwareTableBuffer, "uint", BufferLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PEX_CALLBACK_FUNCTION>} Function 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<Integer>} Cookie 
     * @returns {NTSTATUS} 
     */
    static CmRegisterCallback(Function, Context, Cookie) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"
        CookieMarshal := Cookie is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\CmRegisterCallback", "ptr", Function, ContextMarshal, Context, CookieMarshal, Cookie, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Cookie 
     * @returns {NTSTATUS} 
     */
    static CmUnRegisterCallback(Cookie) {
        result := DllCall("ntoskrnl.exe\CmUnRegisterCallback", "int64", Cookie, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PEX_CALLBACK_FUNCTION>} Function 
     * @param {Pointer<UNICODE_STRING>} Altitude 
     * @param {Pointer<Void>} Driver 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<Integer>} Cookie 
     * @returns {NTSTATUS} 
     */
    static CmRegisterCallbackEx(Function, Altitude, Driver, Context, Cookie) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        DriverMarshal := Driver is VarRef ? "ptr" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"
        CookieMarshal := Cookie is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\CmRegisterCallbackEx", "ptr", Function, "ptr", Altitude, DriverMarshal, Driver, ContextMarshal, Context, CookieMarshal, Cookie, "ptr", Reserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Major 
     * @param {Pointer<Integer>} Minor 
     * @returns {String} Nothing - always returns an empty string
     */
    static CmGetCallbackVersion(Major, Minor) {
        MajorMarshal := Major is VarRef ? "uint*" : "ptr"
        MinorMarshal := Minor is VarRef ? "uint*" : "ptr"

        DllCall("ntoskrnl.exe\CmGetCallbackVersion", MajorMarshal, Major, MinorMarshal, Minor)
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<Integer>} Cookie 
     * @param {Pointer<Void>} NewContext 
     * @param {Pointer<Pointer<Void>>} OldContext 
     * @returns {NTSTATUS} 
     */
    static CmSetCallbackObjectContext(Object_R, Cookie, NewContext, OldContext) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        CookieMarshal := Cookie is VarRef ? "int64*" : "ptr"
        NewContextMarshal := NewContext is VarRef ? "ptr" : "ptr"
        OldContextMarshal := OldContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\CmSetCallbackObjectContext", Object_RMarshal, Object_R, CookieMarshal, Cookie, NewContextMarshal, NewContext, OldContextMarshal, OldContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Cookie 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<Pointer>} ObjectID 
     * @param {Pointer<Pointer<UNICODE_STRING>>} ObjectName 
     * @returns {NTSTATUS} 
     */
    static CmCallbackGetKeyObjectID(Cookie, Object_R, ObjectID, ObjectName) {
        CookieMarshal := Cookie is VarRef ? "int64*" : "ptr"
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        ObjectIDMarshal := ObjectID is VarRef ? "ptr*" : "ptr"
        ObjectNameMarshal := ObjectName is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\CmCallbackGetKeyObjectID", CookieMarshal, Cookie, Object_RMarshal, Object_R, ObjectIDMarshal, ObjectID, ObjectNameMarshal, ObjectName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Cookie 
     * @param {Pointer<Void>} Object_R 
     * @returns {Pointer<Void>} 
     */
    static CmGetBoundTransaction(Cookie, Object_R) {
        CookieMarshal := Cookie is VarRef ? "int64*" : "ptr"
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\CmGetBoundTransaction", CookieMarshal, Cookie, Object_RMarshal, Object_R, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Cookie 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<Pointer>} ObjectID 
     * @param {Pointer<Pointer<UNICODE_STRING>>} ObjectName 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static CmCallbackGetKeyObjectIDEx(Cookie, Object_R, ObjectID, ObjectName, Flags) {
        CookieMarshal := Cookie is VarRef ? "int64*" : "ptr"
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        ObjectIDMarshal := ObjectID is VarRef ? "ptr*" : "ptr"
        ObjectNameMarshal := ObjectName is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\CmCallbackGetKeyObjectIDEx", CookieMarshal, Cookie, Object_RMarshal, Object_R, ObjectIDMarshal, ObjectID, ObjectNameMarshal, ObjectName, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} ObjectName 
     * @returns {String} Nothing - always returns an empty string
     */
    static CmCallbackReleaseKeyObjectIDEx(ObjectName) {
        DllCall("ntoskrnl.exe\CmCallbackReleaseKeyObjectIDEx", "ptr", ObjectName)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static MmQuerySystemSize() {
        result := DllCall("ntoskrnl.exe\MmQuerySystemSize", "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} VerifierFlags 
     * @returns {NTSTATUS} 
     */
    static MmIsVerifierEnabled(VerifierFlags) {
        VerifierFlagsMarshal := VerifierFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmIsVerifierEnabled", VerifierFlagsMarshal, VerifierFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} ThunkBuffer 
     * @param {Integer} ThunkBufferSize 
     * @returns {NTSTATUS} 
     */
    static MmAddVerifierThunks(ThunkBuffer, ThunkBufferSize) {
        result := DllCall("ntoskrnl.exe\MmAddVerifierThunks", "ptr", ThunkBuffer, "uint", ThunkBufferSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} EntryRoutine 
     * @param {Pointer} ThunkBuffer 
     * @param {Integer} ThunkBufferSize 
     * @returns {NTSTATUS} 
     */
    static MmAddVerifierSpecialThunks(EntryRoutine, ThunkBuffer, ThunkBufferSize) {
        result := DllCall("ntoskrnl.exe\MmAddVerifierSpecialThunks", "ptr", EntryRoutine, "ptr", ThunkBuffer, "uint", ThunkBufferSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @param {Pointer<FILE_SEGMENT_ELEMENT>} SegmentArray 
     * @param {Integer} AccessMode 
     * @param {Integer} Operation 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmProbeAndLockSelectedPages(MemoryDescriptorList, SegmentArray, AccessMode, Operation) {
        DllCall("ntoskrnl.exe\MmProbeAndLockSelectedPages", "ptr", MemoryDescriptorList, "ptr", SegmentArray, "char", AccessMode, "int", Operation)
    }

    /**
     * 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @param {PEPROCESS} Process 
     * @param {Integer} AccessMode 
     * @param {Integer} Operation 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmProbeAndLockProcessPages(MemoryDescriptorList, Process, AccessMode, Operation) {
        DllCall("ntoskrnl.exe\MmProbeAndLockProcessPages", "ptr", MemoryDescriptorList, "ptr", Process, "char", AccessMode, "int", Operation)
    }

    /**
     * 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @param {Integer} AccessMode 
     * @param {Integer} Operation 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmProbeAndLockPages(MemoryDescriptorList, AccessMode, Operation) {
        DllCall("ntoskrnl.exe\MmProbeAndLockPages", "ptr", MemoryDescriptorList, "char", AccessMode, "int", Operation)
    }

    /**
     * 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmUnlockPages(MemoryDescriptorList) {
        DllCall("ntoskrnl.exe\MmUnlockPages", "ptr", MemoryDescriptorList)
    }

    /**
     * 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmBuildMdlForNonPagedPool(MemoryDescriptorList) {
        DllCall("ntoskrnl.exe\MmBuildMdlForNonPagedPool", "ptr", MemoryDescriptorList)
    }

    /**
     * 
     * @param {Pointer<MM_PHYSICAL_ADDRESS_LIST>} PhysicalAddressList 
     * @param {Pointer} NumberOfEntries 
     * @param {Pointer<Pointer<MDL>>} NewMdl 
     * @returns {NTSTATUS} 
     */
    static MmAllocateMdlForIoSpace(PhysicalAddressList, NumberOfEntries, NewMdl) {
        NewMdlMarshal := NewMdl is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmAllocateMdlForIoSpace", "ptr", PhysicalAddressList, "ptr", NumberOfEntries, NewMdlMarshal, NewMdl, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @returns {Integer} 
     */
    static MmAreMdlPagesCached(MemoryDescriptorList) {
        result := DllCall("ntoskrnl.exe\MmAreMdlPagesCached", "ptr", MemoryDescriptorList, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} StartAddress 
     * @param {Integer} NumberOfBytes 
     * @param {Integer} CacheType 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static MmSetPermanentCacheAttribute(StartAddress, NumberOfBytes, CacheType, Flags) {
        result := DllCall("ntoskrnl.exe\MmSetPermanentCacheAttribute", "int64", StartAddress, "int64", NumberOfBytes, "int", CacheType, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @param {Integer} AccessMode 
     * @returns {Pointer<Void>} 
     */
    static MmMapLockedPages(MemoryDescriptorList, AccessMode) {
        result := DllCall("ntoskrnl.exe\MmMapLockedPages", "ptr", MemoryDescriptorList, "char", AccessMode, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @param {Integer} Protection 
     * @param {Pointer<PMM_MDL_ROUTINE>} DriverRoutine 
     * @param {Pointer<Void>} DriverContext 
     * @returns {NTSTATUS} 
     */
    static MmMapMdl(MemoryDescriptorList, Protection, DriverRoutine, DriverContext) {
        DriverContextMarshal := DriverContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmMapMdl", "ptr", MemoryDescriptorList, "uint", Protection, "ptr", DriverRoutine, DriverContextMarshal, DriverContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Va 
     * @param {Integer} PageTotal 
     * @param {Pointer<MDL>} MemoryDumpMdl 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static MmMapMemoryDumpMdlEx(Va, PageTotal, MemoryDumpMdl, Flags) {
        VaMarshal := Va is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmMapMemoryDumpMdlEx", VaMarshal, Va, "uint", PageTotal, "ptr", MemoryDumpMdl, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Integer} StartAddress 
     * @param {Pointer} NumberOfBytes 
     * @returns {Integer} 
     */
    static MmIsIoSpaceActive(StartAddress, NumberOfBytes) {
        result := DllCall("ntoskrnl.exe\MmIsIoSpaceActive", "int64", StartAddress, "ptr", NumberOfBytes, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<MDL>} Mdl 
     * @param {Integer} NumberOfBytes 
     * @returns {NTSTATUS} 
     */
    static MmAdvanceMdl(Mdl, NumberOfBytes) {
        result := DllCall("ntoskrnl.exe\MmAdvanceMdl", "ptr", Mdl, "uint", NumberOfBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @param {Integer} NewProtect 
     * @returns {NTSTATUS} 
     */
    static MmProtectMdlSystemAddress(MemoryDescriptorList, NewProtect) {
        result := DllCall("ntoskrnl.exe\MmProtectMdlSystemAddress", "ptr", MemoryDescriptorList, "uint", NewProtect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @param {Integer} AccessMode 
     * @param {Integer} CacheType 
     * @param {Pointer<Void>} RequestedAddress 
     * @param {Integer} BugCheckOnFailure 
     * @param {Integer} Priority 
     * @returns {Pointer<Void>} 
     */
    static MmMapLockedPagesSpecifyCache(MemoryDescriptorList, AccessMode, CacheType, RequestedAddress, BugCheckOnFailure, Priority) {
        RequestedAddressMarshal := RequestedAddress is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmMapLockedPagesSpecifyCache", "ptr", MemoryDescriptorList, "char", AccessMode, "int", CacheType, RequestedAddressMarshal, RequestedAddress, "uint", BugCheckOnFailure, "uint", Priority, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} BaseAddress 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmUnmapLockedPages(BaseAddress, MemoryDescriptorList) {
        BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\MmUnmapLockedPages", BaseAddressMarshal, BaseAddress, "ptr", MemoryDescriptorList)
    }

    /**
     * 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} PoolTag 
     * @param {Integer} Flags 
     * @returns {Pointer<Void>} 
     */
    static MmAllocateMappingAddressEx(NumberOfBytes, PoolTag, Flags) {
        result := DllCall("ntoskrnl.exe\MmAllocateMappingAddressEx", "ptr", NumberOfBytes, "uint", PoolTag, "uint", Flags, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} PoolTag 
     * @returns {Pointer<Void>} 
     */
    static MmAllocateMappingAddress(NumberOfBytes, PoolTag) {
        result := DllCall("ntoskrnl.exe\MmAllocateMappingAddress", "ptr", NumberOfBytes, "uint", PoolTag, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} BaseAddress 
     * @param {Integer} PoolTag 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmFreeMappingAddress(BaseAddress, PoolTag) {
        BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\MmFreeMappingAddress", BaseAddressMarshal, BaseAddress, "uint", PoolTag)
    }

    /**
     * 
     * @param {Pointer<Void>} MappingAddress 
     * @param {Integer} PoolTag 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @param {Integer} CacheType 
     * @returns {Pointer<Void>} 
     */
    static MmMapLockedPagesWithReservedMapping(MappingAddress, PoolTag, MemoryDescriptorList, CacheType) {
        MappingAddressMarshal := MappingAddress is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmMapLockedPagesWithReservedMapping", MappingAddressMarshal, MappingAddress, "uint", PoolTag, "ptr", MemoryDescriptorList, "int", CacheType, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} BaseAddress 
     * @param {Integer} PoolTag 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmUnmapReservedMapping(BaseAddress, PoolTag, MemoryDescriptorList) {
        BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\MmUnmapReservedMapping", BaseAddressMarshal, BaseAddress, "uint", PoolTag, "ptr", MemoryDescriptorList)
    }

    /**
     * 
     * @param {Integer} LowAddress 
     * @param {Integer} HighAddress 
     * @param {Integer} SkipBytes 
     * @param {Pointer} TotalBytes 
     * @param {Integer} CacheType 
     * @param {Integer} IdealNode 
     * @param {Integer} Flags 
     * @returns {Pointer<MDL>} 
     */
    static MmAllocateNodePagesForMdlEx(LowAddress, HighAddress, SkipBytes, TotalBytes, CacheType, IdealNode, Flags) {
        result := DllCall("ntoskrnl.exe\MmAllocateNodePagesForMdlEx", "int64", LowAddress, "int64", HighAddress, "int64", SkipBytes, "ptr", TotalBytes, "int", CacheType, "uint", IdealNode, "uint", Flags, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} LowAddress 
     * @param {Integer} HighAddress 
     * @param {Integer} SkipBytes 
     * @param {Pointer} TotalBytes 
     * @param {Integer} CacheType 
     * @param {Integer} IdealNode 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} PartitionObject 
     * @returns {Pointer<MDL>} 
     */
    static MmAllocatePartitionNodePagesForMdlEx(LowAddress, HighAddress, SkipBytes, TotalBytes, CacheType, IdealNode, Flags, PartitionObject) {
        PartitionObjectMarshal := PartitionObject is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmAllocatePartitionNodePagesForMdlEx", "int64", LowAddress, "int64", HighAddress, "int64", SkipBytes, "ptr", TotalBytes, "int", CacheType, "uint", IdealNode, "uint", Flags, PartitionObjectMarshal, PartitionObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} LowAddress 
     * @param {Integer} HighAddress 
     * @param {Integer} SkipBytes 
     * @param {Pointer} TotalBytes 
     * @param {Integer} CacheType 
     * @param {Integer} Flags 
     * @returns {Pointer<MDL>} 
     */
    static MmAllocatePagesForMdlEx(LowAddress, HighAddress, SkipBytes, TotalBytes, CacheType, Flags) {
        result := DllCall("ntoskrnl.exe\MmAllocatePagesForMdlEx", "int64", LowAddress, "int64", HighAddress, "int64", SkipBytes, "ptr", TotalBytes, "int", CacheType, "uint", Flags, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} LowAddress 
     * @param {Integer} HighAddress 
     * @param {Integer} SkipBytes 
     * @param {Pointer} TotalBytes 
     * @returns {Pointer<MDL>} 
     */
    static MmAllocatePagesForMdl(LowAddress, HighAddress, SkipBytes, TotalBytes) {
        result := DllCall("ntoskrnl.exe\MmAllocatePagesForMdl", "int64", LowAddress, "int64", HighAddress, "int64", SkipBytes, "ptr", TotalBytes, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmFreePagesFromMdlEx(MemoryDescriptorList, Flags) {
        DllCall("ntoskrnl.exe\MmFreePagesFromMdlEx", "ptr", MemoryDescriptorList, "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmFreePagesFromMdl(MemoryDescriptorList) {
        DllCall("ntoskrnl.exe\MmFreePagesFromMdl", "ptr", MemoryDescriptorList)
    }

    /**
     * 
     * @param {Integer} PhysicalAddress 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} CacheType 
     * @returns {Pointer<Void>} 
     */
    static MmMapIoSpace(PhysicalAddress, NumberOfBytes, CacheType) {
        result := DllCall("ntoskrnl.exe\MmMapIoSpace", "int64", PhysicalAddress, "ptr", NumberOfBytes, "int", CacheType, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} BaseAddress 
     * @param {Pointer} NumberOfBytes 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmUnmapIoSpace(BaseAddress, NumberOfBytes) {
        DllCall("ntoskrnl.exe\MmUnmapIoSpace", "ptr", BaseAddress, "ptr", NumberOfBytes)
    }

    /**
     * 
     * @param {Integer} PhysicalAddress 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} Protect 
     * @returns {Pointer<Void>} 
     */
    static MmMapIoSpaceEx(PhysicalAddress, NumberOfBytes, Protect) {
        result := DllCall("ntoskrnl.exe\MmMapIoSpaceEx", "int64", PhysicalAddress, "ptr", NumberOfBytes, "uint", Protect, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} HighestAcceptableAddress 
     * @returns {Pointer<Void>} 
     */
    static MmAllocateContiguousMemory(NumberOfBytes, HighestAcceptableAddress) {
        result := DllCall("ntoskrnl.exe\MmAllocateContiguousMemory", "ptr", NumberOfBytes, "int64", HighestAcceptableAddress, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} LowestAcceptableAddress 
     * @param {Integer} HighestAcceptableAddress 
     * @param {Integer} BoundaryAddressMultiple 
     * @param {Integer} CacheType 
     * @returns {Pointer<Void>} 
     */
    static MmAllocateContiguousMemorySpecifyCache(NumberOfBytes, LowestAcceptableAddress, HighestAcceptableAddress, BoundaryAddressMultiple, CacheType) {
        result := DllCall("ntoskrnl.exe\MmAllocateContiguousMemorySpecifyCache", "ptr", NumberOfBytes, "int64", LowestAcceptableAddress, "int64", HighestAcceptableAddress, "int64", BoundaryAddressMultiple, "int", CacheType, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} LowestAcceptableAddress 
     * @param {Integer} HighestAcceptableAddress 
     * @param {Integer} BoundaryAddressMultiple 
     * @param {Integer} CacheType 
     * @param {Integer} PreferredNode 
     * @returns {Pointer<Void>} 
     */
    static MmAllocateContiguousMemorySpecifyCacheNode(NumberOfBytes, LowestAcceptableAddress, HighestAcceptableAddress, BoundaryAddressMultiple, CacheType, PreferredNode) {
        result := DllCall("ntoskrnl.exe\MmAllocateContiguousMemorySpecifyCacheNode", "ptr", NumberOfBytes, "int64", LowestAcceptableAddress, "int64", HighestAcceptableAddress, "int64", BoundaryAddressMultiple, "int", CacheType, "uint", PreferredNode, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} LowestAcceptableAddress 
     * @param {Integer} HighestAcceptableAddress 
     * @param {Integer} BoundaryAddressMultiple 
     * @param {Integer} Protect 
     * @param {Integer} PreferredNode 
     * @returns {Pointer<Void>} 
     */
    static MmAllocateContiguousNodeMemory(NumberOfBytes, LowestAcceptableAddress, HighestAcceptableAddress, BoundaryAddressMultiple, Protect, PreferredNode) {
        result := DllCall("ntoskrnl.exe\MmAllocateContiguousNodeMemory", "ptr", NumberOfBytes, "int64", LowestAcceptableAddress, "int64", HighestAcceptableAddress, "int64", BoundaryAddressMultiple, "uint", Protect, "uint", PreferredNode, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} NumberOfBytes 
     * @param {Integer} LowestAcceptableAddress 
     * @param {Integer} HighestAcceptableAddress 
     * @param {Integer} BoundaryAddressMultiple 
     * @param {Integer} PreferredNode 
     * @param {Integer} Protect 
     * @param {Pointer<Void>} PartitionObject 
     * @param {Integer} Tag 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<Void>>} BaseAddress 
     * @returns {NTSTATUS} 
     */
    static MmAllocateContiguousMemoryEx(NumberOfBytes, LowestAcceptableAddress, HighestAcceptableAddress, BoundaryAddressMultiple, PreferredNode, Protect, PartitionObject, Tag, Flags, BaseAddress) {
        NumberOfBytesMarshal := NumberOfBytes is VarRef ? "ptr*" : "ptr"
        PartitionObjectMarshal := PartitionObject is VarRef ? "ptr" : "ptr"
        BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmAllocateContiguousMemoryEx", NumberOfBytesMarshal, NumberOfBytes, "int64", LowestAcceptableAddress, "int64", HighestAcceptableAddress, "int64", BoundaryAddressMultiple, "uint", PreferredNode, "uint", Protect, PartitionObjectMarshal, PartitionObject, "uint", Tag, "uint", Flags, BaseAddressMarshal, BaseAddress, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} BaseAddress 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmFreeContiguousMemory(BaseAddress) {
        BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\MmFreeContiguousMemory", BaseAddressMarshal, BaseAddress)
    }

    /**
     * 
     * @param {Pointer} BaseAddress 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} CacheType 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmFreeContiguousMemorySpecifyCache(BaseAddress, NumberOfBytes, CacheType) {
        DllCall("ntoskrnl.exe\MmFreeContiguousMemorySpecifyCache", "ptr", BaseAddress, "ptr", NumberOfBytes, "int", CacheType)
    }

    /**
     * 
     * @param {Pointer} Base 
     * @param {Pointer} Length 
     * @returns {Pointer} 
     */
    static MmSizeOfMdl(Base, Length) {
        result := DllCall("ntoskrnl.exe\MmSizeOfMdl", "ptr", Base, "ptr", Length, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @param {Pointer} Base 
     * @param {Pointer} Length 
     * @returns {Pointer<MDL>} 
     */
    static MmCreateMdl(MemoryDescriptorList, Base, Length) {
        result := DllCall("ntoskrnl.exe\MmCreateMdl", "ptr", MemoryDescriptorList, "ptr", Base, "ptr", Length, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<MDL>} MemoryDescriptorList 
     * @param {Integer} State 
     * @returns {Integer} 
     */
    static MmMdlPageContentsState(MemoryDescriptorList, State) {
        result := DllCall("ntoskrnl.exe\MmMdlPageContentsState", "ptr", MemoryDescriptorList, "int", State, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} AddressWithinSection 
     * @returns {Pointer<Void>} 
     */
    static MmLockPagableDataSection(AddressWithinSection) {
        AddressWithinSectionMarshal := AddressWithinSection is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmLockPagableDataSection", AddressWithinSectionMarshal, AddressWithinSection, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} AddressWithinSection 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmResetDriverPaging(AddressWithinSection) {
        AddressWithinSectionMarshal := AddressWithinSection is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\MmResetDriverPaging", AddressWithinSectionMarshal, AddressWithinSection)
    }

    /**
     * 
     * @param {Pointer<Void>} AddressWithinSection 
     * @returns {Pointer<Void>} 
     */
    static MmPageEntireDriver(AddressWithinSection) {
        AddressWithinSectionMarshal := AddressWithinSection is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmPageEntireDriver", AddressWithinSectionMarshal, AddressWithinSection, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ImageSectionHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmUnlockPagableImageSection(ImageSectionHandle) {
        ImageSectionHandleMarshal := ImageSectionHandle is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\MmUnlockPagableImageSection", ImageSectionHandleMarshal, ImageSectionHandle)
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @returns {Integer} 
     */
    static MmIsDriverSuspectForVerifier(DriverObject) {
        result := DllCall("ntoskrnl.exe\MmIsDriverSuspectForVerifier", "ptr", DriverObject, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @returns {Integer} 
     */
    static MmIsDriverVerifying(DriverObject) {
        result := DllCall("ntoskrnl.exe\MmIsDriverVerifying", "ptr", DriverObject, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} AddressWithinSection 
     * @returns {Integer} 
     */
    static MmIsDriverVerifyingByAddress(AddressWithinSection) {
        AddressWithinSectionMarshal := AddressWithinSection is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmIsDriverVerifyingByAddress", AddressWithinSectionMarshal, AddressWithinSection, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} AddressWithinSection 
     * @param {Pointer} Size 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static MmProtectDriverSection(AddressWithinSection, Size, Flags) {
        AddressWithinSectionMarshal := AddressWithinSection is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmProtectDriverSection", AddressWithinSectionMarshal, AddressWithinSection, "ptr", Size, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeCaptureSubjectContext(SubjectContext) {
        DllCall("ntoskrnl.exe\SeCaptureSubjectContext", "ptr", SubjectContext)
    }

    /**
     * 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeLockSubjectContext(SubjectContext) {
        DllCall("ntoskrnl.exe\SeLockSubjectContext", "ptr", SubjectContext)
    }

    /**
     * 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeUnlockSubjectContext(SubjectContext) {
        DllCall("ntoskrnl.exe\SeUnlockSubjectContext", "ptr", SubjectContext)
    }

    /**
     * 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeReleaseSubjectContext(SubjectContext) {
        DllCall("ntoskrnl.exe\SeReleaseSubjectContext", "ptr", SubjectContext)
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} ParentDescriptor 
     * @param {PSECURITY_DESCRIPTOR} ExplicitDescriptor 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} NewDescriptor 
     * @param {BOOLEAN} IsDirectoryObject 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {Integer} PoolType 
     * @returns {NTSTATUS} 
     */
    static SeAssignSecurity(ParentDescriptor, ExplicitDescriptor, NewDescriptor, IsDirectoryObject, SubjectContext, GenericMapping, PoolType) {
        ParentDescriptor := ParentDescriptor is Win32Handle ? NumGet(ParentDescriptor, "ptr") : ParentDescriptor
        ExplicitDescriptor := ExplicitDescriptor is Win32Handle ? NumGet(ExplicitDescriptor, "ptr") : ExplicitDescriptor

        result := DllCall("ntoskrnl.exe\SeAssignSecurity", "ptr", ParentDescriptor, "ptr", ExplicitDescriptor, "ptr", NewDescriptor, "char", IsDirectoryObject, "ptr", SubjectContext, "ptr", GenericMapping, "int", PoolType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ObjectType 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {PSECURITY_DESCRIPTOR} ParentSecurityDescriptor 
     * @returns {Integer} 
     */
    static SeComputeAutoInheritByObjectType(ObjectType, SecurityDescriptor, ParentSecurityDescriptor) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor
        ParentSecurityDescriptor := ParentSecurityDescriptor is Win32Handle ? NumGet(ParentSecurityDescriptor, "ptr") : ParentSecurityDescriptor

        ObjectTypeMarshal := ObjectType is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\SeComputeAutoInheritByObjectType", ObjectTypeMarshal, ObjectType, "ptr", SecurityDescriptor, "ptr", ParentSecurityDescriptor, "uint")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} ParentDescriptor 
     * @param {PSECURITY_DESCRIPTOR} ExplicitDescriptor 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} NewDescriptor 
     * @param {Pointer<Guid>} ObjectType 
     * @param {BOOLEAN} IsDirectoryObject 
     * @param {Integer} AutoInheritFlags 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {Integer} PoolType 
     * @returns {NTSTATUS} 
     */
    static SeAssignSecurityEx(ParentDescriptor, ExplicitDescriptor, NewDescriptor, ObjectType, IsDirectoryObject, AutoInheritFlags, SubjectContext, GenericMapping, PoolType) {
        ParentDescriptor := ParentDescriptor is Win32Handle ? NumGet(ParentDescriptor, "ptr") : ParentDescriptor
        ExplicitDescriptor := ExplicitDescriptor is Win32Handle ? NumGet(ExplicitDescriptor, "ptr") : ExplicitDescriptor

        result := DllCall("ntoskrnl.exe\SeAssignSecurityEx", "ptr", ParentDescriptor, "ptr", ExplicitDescriptor, "ptr", NewDescriptor, "ptr", ObjectType, "char", IsDirectoryObject, "uint", AutoInheritFlags, "ptr", SubjectContext, "ptr", GenericMapping, "int", PoolType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} SecurityDescriptor 
     * @returns {NTSTATUS} 
     */
    static SeDeassignSecurity(SecurityDescriptor) {
        result := DllCall("ntoskrnl.exe\SeDeassignSecurity", "ptr", SecurityDescriptor, "int")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectSecurityContext 
     * @param {BOOLEAN} SubjectContextLocked 
     * @param {Integer} DesiredAccess 
     * @param {Integer} PreviouslyGrantedAccess 
     * @param {Pointer<Pointer<PRIVILEGE_SET>>} Privileges 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @param {Integer} AccessMode 
     * @param {Pointer<Integer>} GrantedAccess 
     * @param {Pointer<Integer>} AccessStatus 
     * @returns {BOOLEAN} 
     */
    static SeAccessCheck(SecurityDescriptor, SubjectSecurityContext, SubjectContextLocked, DesiredAccess, PreviouslyGrantedAccess, Privileges, GenericMapping, AccessMode, GrantedAccess, AccessStatus) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        PrivilegesMarshal := Privileges is VarRef ? "ptr*" : "ptr"
        GrantedAccessMarshal := GrantedAccess is VarRef ? "uint*" : "ptr"
        AccessStatusMarshal := AccessStatus is VarRef ? "int*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeAccessCheck", "ptr", SecurityDescriptor, "ptr", SubjectSecurityContext, "char", SubjectContextLocked, "uint", DesiredAccess, "uint", PreviouslyGrantedAccess, PrivilegesMarshal, Privileges, "ptr", GenericMapping, "char", AccessMode, GrantedAccessMarshal, GrantedAccess, AccessStatusMarshal, AccessStatus, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<SE_ADT_PARAMETER_ARRAY>} AuditParameters 
     * @param {Integer} Type 
     * @param {Integer} Index 
     * @param {Pointer<Void>} Data 
     * @returns {NTSTATUS} 
     */
    static SeSetAuditParameter(AuditParameters, Type, Index, Data) {
        DataMarshal := Data is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\SeSetAuditParameter", "ptr", AuditParameters, "int", Type, "uint", Index, DataMarshal, Data, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<UNICODE_STRING>} SourceName 
     * @param {PSID} UserSid 
     * @param {Pointer<SE_ADT_PARAMETER_ARRAY>} AuditParameters 
     * @returns {NTSTATUS} 
     */
    static SeReportSecurityEvent(Flags, SourceName, UserSid, AuditParameters) {
        result := DllCall("ntoskrnl.exe\SeReportSecurityEvent", "uint", Flags, "ptr", SourceName, "ptr", UserSid, "ptr", AuditParameters, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Length 
     * @param {Pointer} SecurityDescriptor 
     * @returns {BOOLEAN} 
     */
    static SeValidSecurityDescriptor(Length, SecurityDescriptor) {
        result := DllCall("ntoskrnl.exe\SeValidSecurityDescriptor", "uint", Length, "ptr", SecurityDescriptor, "char")
        return result
    }

    /**
     * 
     * @param {Integer} ImageType 
     * @param {Integer} CallbackType 
     * @param {Pointer<PSE_IMAGE_VERIFICATION_CALLBACK_FUNCTION>} CallbackFunction 
     * @param {Pointer<Void>} CallbackContext 
     * @param {Pointer<Pointer<Void>>} CallbackHandle 
     * @returns {NTSTATUS} 
     */
    static SeRegisterImageVerificationCallback(ImageType, CallbackType, CallbackFunction, CallbackContext, CallbackHandle) {
        static Token := 0 ;Reserved parameters must always be NULL

        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"
        CallbackHandleMarshal := CallbackHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\SeRegisterImageVerificationCallback", "int", ImageType, "int", CallbackType, "ptr", CallbackFunction, CallbackContextMarshal, CallbackContext, "ptr", Token, CallbackHandleMarshal, CallbackHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} CallbackHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static SeUnregisterImageVerificationCallback(CallbackHandle) {
        CallbackHandleMarshal := CallbackHandle is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\SeUnregisterImageVerificationCallback", CallbackHandleMarshal, CallbackHandle)
    }

    /**
     * 
     * @param {Pointer<HANDLE>} ThreadHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<CLIENT_ID>} ClientId 
     * @param {Pointer<PKSTART_ROUTINE>} StartRoutine 
     * @param {Pointer<Void>} StartContext 
     * @returns {NTSTATUS} 
     */
    static PsCreateSystemThread(ThreadHandle, DesiredAccess, ObjectAttributes, ProcessHandle, ClientId, StartRoutine, StartContext) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        StartContextMarshal := StartContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\PsCreateSystemThread", "ptr", ThreadHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", ProcessHandle, "ptr", ClientId, "ptr", StartRoutine, StartContextMarshal, StartContext, "int")
        return result
    }

    /**
     * 
     * @param {NTSTATUS} ExitStatus 
     * @returns {NTSTATUS} 
     */
    static PsTerminateSystemThread(ExitStatus) {
        result := DllCall("ntoskrnl.exe\PsTerminateSystemThread", "int", ExitStatus, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} ApcContext 
     * @param {Pointer<Pointer<Void>>} ApcRoutine 
     * @returns {NTSTATUS} 
     */
    static PsWrapApcWow64Thread(ApcContext, ApcRoutine) {
        ApcContextMarshal := ApcContext is VarRef ? "ptr*" : "ptr"
        ApcRoutineMarshal := ApcRoutine is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsWrapApcWow64Thread", ApcContextMarshal, ApcContext, ApcRoutineMarshal, ApcRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} MajorVersion 
     * @param {Pointer<Integer>} MinorVersion 
     * @param {Pointer<Integer>} BuildNumber 
     * @param {Pointer<UNICODE_STRING>} CSDVersion 
     * @returns {BOOLEAN} 
     */
    static PsGetVersion(MajorVersion, MinorVersion, BuildNumber, CSDVersion) {
        MajorVersionMarshal := MajorVersion is VarRef ? "uint*" : "ptr"
        MinorVersionMarshal := MinorVersion is VarRef ? "uint*" : "ptr"
        BuildNumberMarshal := BuildNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsGetVersion", MajorVersionMarshal, MajorVersion, MinorVersionMarshal, MinorVersion, BuildNumberMarshal, BuildNumber, "ptr", CSDVersion, "char")
        return result
    }

    /**
     * 
     * @param {PEPROCESS} Process 
     * @param {Pointer<Integer>} CycleTimeStamp 
     * @returns {Integer} 
     */
    static PsQueryTotalCycleTimeProcess(Process, CycleTimeStamp) {
        CycleTimeStampMarshal := CycleTimeStamp is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsQueryTotalCycleTimeProcess", "ptr", Process, CycleTimeStampMarshal, CycleTimeStamp, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PAFFINITY_TOKEN>} AffinityToken 
     * @returns {NTSTATUS} 
     */
    static PsAllocateAffinityToken(AffinityToken) {
        AffinityTokenMarshal := AffinityToken is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsAllocateAffinityToken", AffinityTokenMarshal, AffinityToken, "int")
        return result
    }

    /**
     * 
     * @param {PAFFINITY_TOKEN} AffinityToken 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsFreeAffinityToken(AffinityToken) {
        DllCall("ntoskrnl.exe\PsFreeAffinityToken", "ptr", AffinityToken)
    }

    /**
     * 
     * @param {Pointer<GROUP_AFFINITY>} GroupAffinities 
     * @param {Integer} GroupCount 
     * @param {PAFFINITY_TOKEN} AffinityToken 
     * @returns {NTSTATUS} 
     */
    static PsSetSystemMultipleGroupAffinityThread(GroupAffinities, GroupCount, AffinityToken) {
        result := DllCall("ntoskrnl.exe\PsSetSystemMultipleGroupAffinityThread", "ptr", GroupAffinities, "ushort", GroupCount, "ptr", AffinityToken, "int")
        return result
    }

    /**
     * 
     * @param {PAFFINITY_TOKEN} AffinityToken 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsRevertToUserMultipleGroupAffinityThread(AffinityToken) {
        DllCall("ntoskrnl.exe\PsRevertToUserMultipleGroupAffinityThread", "ptr", AffinityToken)
    }

    /**
     * 
     * @param {Pointer<Integer>} Irql 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoAcquireCancelSpinLock(Irql) {
        IrqlMarshal := Irql is VarRef ? "char*" : "ptr"

        DllCall("ntoskrnl.exe\IoAcquireCancelSpinLock", IrqlMarshal, Irql)
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<Void>} ClientIdentificationAddress 
     * @param {Integer} DriverObjectExtensionSize 
     * @param {Pointer<Pointer<Void>>} DriverObjectExtension 
     * @returns {NTSTATUS} 
     */
    static IoAllocateDriverObjectExtension(DriverObject, ClientIdentificationAddress, DriverObjectExtensionSize, DriverObjectExtension) {
        ClientIdentificationAddressMarshal := ClientIdentificationAddress is VarRef ? "ptr" : "ptr"
        DriverObjectExtensionMarshal := DriverObjectExtension is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoAllocateDriverObjectExtension", "ptr", DriverObject, ClientIdentificationAddressMarshal, ClientIdentificationAddress, "uint", DriverObjectExtensionSize, DriverObjectExtensionMarshal, DriverObjectExtension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} IoObject 
     * @param {Integer} EntrySize 
     * @returns {Pointer<Void>} 
     */
    static IoAllocateErrorLogEntry(IoObject, EntrySize) {
        IoObjectMarshal := IoObject is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoAllocateErrorLogEntry", IoObjectMarshal, IoObject, "char", EntrySize, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} StackSize 
     * @param {BOOLEAN} ChargeQuota 
     * @returns {Pointer<IRP>} 
     */
    static IoAllocateIrp(StackSize, ChargeQuota) {
        result := DllCall("ntoskrnl.exe\IoAllocateIrp", "char", StackSize, "char", ChargeQuota, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} StackSize 
     * @param {BOOLEAN} ChargeQuota 
     * @returns {Pointer<IRP>} 
     */
    static IoAllocateIrpEx(DeviceObject, StackSize, ChargeQuota) {
        result := DllCall("ntoskrnl.exe\IoAllocateIrpEx", "ptr", DeviceObject, "char", StackSize, "char", ChargeQuota, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} VirtualAddress 
     * @param {Integer} Length 
     * @param {BOOLEAN} SecondaryBuffer 
     * @param {BOOLEAN} ChargeQuota 
     * @param {Pointer<IRP>} Irp 
     * @returns {Pointer<MDL>} 
     */
    static IoAllocateMdl(VirtualAddress, Length, SecondaryBuffer, ChargeQuota, Irp) {
        VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoAllocateMdl", VirtualAddressMarshal, VirtualAddress, "uint", Length, "char", SecondaryBuffer, "char", ChargeQuota, "ptr", Irp, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} SourceDevice 
     * @param {Pointer<UNICODE_STRING>} TargetDevice 
     * @param {Pointer<Pointer<DEVICE_OBJECT>>} AttachedDevice 
     * @returns {NTSTATUS} 
     */
    static IoAttachDevice(SourceDevice, TargetDevice, AttachedDevice) {
        AttachedDeviceMarshal := AttachedDevice is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoAttachDevice", "ptr", SourceDevice, "ptr", TargetDevice, AttachedDeviceMarshal, AttachedDevice, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} SourceDevice 
     * @param {Pointer<DEVICE_OBJECT>} TargetDevice 
     * @returns {Pointer<DEVICE_OBJECT>} 
     */
    static IoAttachDeviceToDeviceStack(SourceDevice, TargetDevice) {
        result := DllCall("ntoskrnl.exe\IoAttachDeviceToDeviceStack", "ptr", SourceDevice, "ptr", TargetDevice, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} MajorFunction 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<Void>} Buffer_R 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} StartingOffset 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @returns {Pointer<IRP>} 
     */
    static IoBuildAsynchronousFsdRequest(MajorFunction, DeviceObject, Buffer_R, Length, StartingOffset, IoStatusBlock) {
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"
        StartingOffsetMarshal := StartingOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoBuildAsynchronousFsdRequest", "uint", MajorFunction, "ptr", DeviceObject, Buffer_RMarshal, Buffer_R, "uint", Length, StartingOffsetMarshal, StartingOffset, "ptr", IoStatusBlock, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} IoControlCode 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<Void>} InputBuffer 
     * @param {Integer} InputBufferLength 
     * @param {Pointer<Void>} OutputBuffer 
     * @param {Integer} OutputBufferLength 
     * @param {BOOLEAN} InternalDeviceIoControl 
     * @param {Pointer<KEVENT>} Event 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @returns {Pointer<IRP>} 
     */
    static IoBuildDeviceIoControlRequest(IoControlCode, DeviceObject, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength, InternalDeviceIoControl, Event, IoStatusBlock) {
        InputBufferMarshal := InputBuffer is VarRef ? "ptr" : "ptr"
        OutputBufferMarshal := OutputBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoBuildDeviceIoControlRequest", "uint", IoControlCode, "ptr", DeviceObject, InputBufferMarshal, InputBuffer, "uint", InputBufferLength, OutputBufferMarshal, OutputBuffer, "uint", OutputBufferLength, "char", InternalDeviceIoControl, "ptr", Event, "ptr", IoStatusBlock, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<MDL>} SourceMdl 
     * @param {Pointer<MDL>} TargetMdl 
     * @param {Pointer<Void>} VirtualAddress 
     * @param {Integer} Length 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoBuildPartialMdl(SourceMdl, TargetMdl, VirtualAddress, Length) {
        VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\IoBuildPartialMdl", "ptr", SourceMdl, "ptr", TargetMdl, VirtualAddressMarshal, VirtualAddress, "uint", Length)
    }

    /**
     * 
     * @param {Pointer<BOOTDISK_INFORMATION>} BootDiskInformation 
     * @param {Integer} Size 
     * @returns {NTSTATUS} 
     */
    static IoGetBootDiskInformation(BootDiskInformation, Size) {
        result := DllCall("ntoskrnl.exe\IoGetBootDiskInformation", "ptr", BootDiskInformation, "uint", Size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<BOOTDISK_INFORMATION_LITE>>} BootDiskInformation 
     * @returns {NTSTATUS} 
     */
    static IoGetBootDiskInformationLite(BootDiskInformation) {
        BootDiskInformationMarshal := BootDiskInformation is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetBootDiskInformationLite", BootDiskInformationMarshal, BootDiskInformation, "int")
        return result
    }

    /**
     * 
     * @param {Integer} MajorFunction 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<Void>} Buffer_R 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} StartingOffset 
     * @param {Pointer<KEVENT>} Event 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @returns {Pointer<IRP>} 
     */
    static IoBuildSynchronousFsdRequest(MajorFunction, DeviceObject, Buffer_R, Length, StartingOffset, Event, IoStatusBlock) {
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"
        StartingOffsetMarshal := StartingOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoBuildSynchronousFsdRequest", "uint", MajorFunction, "ptr", DeviceObject, Buffer_RMarshal, Buffer_R, "uint", Length, StartingOffsetMarshal, StartingOffset, "ptr", Event, "ptr", IoStatusBlock, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<IRP>} Irp 
     * @returns {NTSTATUS} 
     */
    static IofCallDriver(DeviceObject, Irp) {
        result := DllCall("ntoskrnl.exe\IofCallDriver", "ptr", DeviceObject, "ptr", Irp, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {BOOLEAN} 
     */
    static IoCancelIrp(Irp) {
        result := DllCall("ntoskrnl.exe\IoCancelIrp", "ptr", Irp, "char")
        return result
    }

    /**
     * 
     * @param {Integer} DesiredAccess 
     * @param {Integer} DesiredShareAccess 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<SHARE_ACCESS>} ShareAccess 
     * @param {BOOLEAN} Update 
     * @returns {NTSTATUS} 
     */
    static IoCheckShareAccess(DesiredAccess, DesiredShareAccess, FileObject, ShareAccess, Update) {
        result := DllCall("ntoskrnl.exe\IoCheckShareAccess", "uint", DesiredAccess, "uint", DesiredShareAccess, "ptr", FileObject, "ptr", ShareAccess, "char", Update, "int")
        return result
    }

    /**
     * 
     * @param {Integer} DesiredAccess 
     * @param {Integer} DesiredShareAccess 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<SHARE_ACCESS>} ShareAccess 
     * @param {BOOLEAN} Update 
     * @param {Pointer<BOOLEAN>} WritePermission 
     * @returns {NTSTATUS} 
     */
    static IoCheckShareAccessEx(DesiredAccess, DesiredShareAccess, FileObject, ShareAccess, Update, WritePermission) {
        WritePermissionMarshal := WritePermission is VarRef ? "char*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoCheckShareAccessEx", "uint", DesiredAccess, "uint", DesiredShareAccess, "ptr", FileObject, "ptr", ShareAccess, "char", Update, WritePermissionMarshal, WritePermission, "int")
        return result
    }

    /**
     * 
     * @param {Integer} DesiredAccess 
     * @param {Integer} DesiredShareAccess 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<SHARE_ACCESS>} ShareAccess 
     * @param {Pointer<LINK_SHARE_ACCESS>} LinkShareAccess 
     * @param {Integer} IoShareAccessFlags 
     * @returns {NTSTATUS} 
     */
    static IoCheckLinkShareAccess(DesiredAccess, DesiredShareAccess, FileObject, ShareAccess, LinkShareAccess, IoShareAccessFlags) {
        result := DllCall("ntoskrnl.exe\IoCheckLinkShareAccess", "uint", DesiredAccess, "uint", DesiredShareAccess, "ptr", FileObject, "ptr", ShareAccess, "ptr", LinkShareAccess, "uint", IoShareAccessFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Integer} PriorityBoost 
     * @returns {String} Nothing - always returns an empty string
     */
    static IofCompleteRequest(Irp, PriorityBoost) {
        DllCall("ntoskrnl.exe\IofCompleteRequest", "ptr", Irp, "char", PriorityBoost)
    }

    /**
     * 
     * @param {Pointer<PKINTERRUPT>} InterruptObject 
     * @param {Pointer<PKSERVICE_ROUTINE>} ServiceRoutine 
     * @param {Pointer<Void>} ServiceContext 
     * @param {Pointer<Pointer>} SpinLock 
     * @param {Integer} Vector 
     * @param {Integer} Irql 
     * @param {Integer} SynchronizeIrql 
     * @param {Integer} InterruptMode 
     * @param {BOOLEAN} ShareVector 
     * @param {Pointer} ProcessorEnableMask 
     * @param {BOOLEAN} FloatingSave 
     * @returns {NTSTATUS} 
     */
    static IoConnectInterrupt(InterruptObject, ServiceRoutine, ServiceContext, SpinLock, Vector, Irql, SynchronizeIrql, InterruptMode, ShareVector, ProcessorEnableMask, FloatingSave) {
        InterruptObjectMarshal := InterruptObject is VarRef ? "ptr*" : "ptr"
        ServiceContextMarshal := ServiceContext is VarRef ? "ptr" : "ptr"
        SpinLockMarshal := SpinLock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoConnectInterrupt", InterruptObjectMarshal, InterruptObject, "ptr", ServiceRoutine, ServiceContextMarshal, ServiceContext, SpinLockMarshal, SpinLock, "uint", Vector, "char", Irql, "char", SynchronizeIrql, "int", InterruptMode, "char", ShareVector, "ptr", ProcessorEnableMask, "char", FloatingSave, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IO_CONNECT_INTERRUPT_PARAMETERS>} Parameters 
     * @returns {NTSTATUS} 
     */
    static IoConnectInterruptEx(Parameters) {
        result := DllCall("ntoskrnl.exe\IoConnectInterruptEx", "ptr", Parameters, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Integer} DeviceExtensionSize 
     * @param {Pointer<UNICODE_STRING>} DeviceName 
     * @param {Integer} DeviceType 
     * @param {Integer} DeviceCharacteristics 
     * @param {BOOLEAN} Exclusive 
     * @param {Pointer<Pointer<DEVICE_OBJECT>>} DeviceObject 
     * @returns {NTSTATUS} 
     */
    static IoCreateDevice(DriverObject, DeviceExtensionSize, DeviceName, DeviceType, DeviceCharacteristics, Exclusive, DeviceObject) {
        DeviceObjectMarshal := DeviceObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoCreateDevice", "ptr", DriverObject, "uint", DeviceExtensionSize, "ptr", DeviceName, "uint", DeviceType, "uint", DeviceCharacteristics, "char", Exclusive, DeviceObjectMarshal, DeviceObject, "int")
        return result
    }

    /**
     * 
     * @param {Integer} MajorVersion 
     * @param {Integer} MinorVersion 
     * @returns {BOOLEAN} 
     */
    static IoIsWdmVersionAvailable(MajorVersion, MinorVersion) {
        result := DllCall("ntoskrnl.exe\IoIsWdmVersionAvailable", "char", MajorVersion, "char", MinorVersion, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} FileHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer<Integer>} AllocationSize 
     * @param {Integer} FileAttributes 
     * @param {Integer} ShareAccess 
     * @param {Integer} Disposition 
     * @param {Integer} CreateOptions 
     * @param {Pointer<Void>} EaBuffer 
     * @param {Integer} EaLength 
     * @param {Integer} CreateFileType 
     * @param {Pointer<Void>} InternalParameters 
     * @param {Integer} Options 
     * @returns {NTSTATUS} 
     */
    static IoCreateFile(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, Disposition, CreateOptions, EaBuffer, EaLength, CreateFileType, InternalParameters, Options) {
        AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"
        EaBufferMarshal := EaBuffer is VarRef ? "ptr" : "ptr"
        InternalParametersMarshal := InternalParameters is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoCreateFile", "ptr", FileHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", Disposition, "uint", CreateOptions, EaBufferMarshal, EaBuffer, "uint", EaLength, "int", CreateFileType, InternalParametersMarshal, InternalParameters, "uint", Options, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} EventName 
     * @param {Pointer<HANDLE>} EventHandle 
     * @returns {Pointer<KEVENT>} 
     */
    static IoCreateNotificationEvent(EventName, EventHandle) {
        result := DllCall("ntoskrnl.exe\IoCreateNotificationEvent", "ptr", EventName, "ptr", EventHandle, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
     * @param {Pointer<UNICODE_STRING>} DeviceName 
     * @returns {NTSTATUS} 
     */
    static IoCreateSymbolicLink(SymbolicLinkName, DeviceName) {
        result := DllCall("ntoskrnl.exe\IoCreateSymbolicLink", "ptr", SymbolicLinkName, "ptr", DeviceName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} EventName 
     * @param {Pointer<HANDLE>} EventHandle 
     * @returns {Pointer<KEVENT>} 
     */
    static IoCreateSynchronizationEvent(EventName, EventHandle) {
        result := DllCall("ntoskrnl.exe\IoCreateSynchronizationEvent", "ptr", EventName, "ptr", EventHandle, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
     * @param {Pointer<UNICODE_STRING>} DeviceName 
     * @returns {NTSTATUS} 
     */
    static IoCreateUnprotectedSymbolicLink(SymbolicLinkName, DeviceName) {
        result := DllCall("ntoskrnl.exe\IoCreateUnprotectedSymbolicLink", "ptr", SymbolicLinkName, "ptr", DeviceName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoDeleteDevice(DeviceObject) {
        DllCall("ntoskrnl.exe\IoDeleteDevice", "ptr", DeviceObject)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
     * @returns {NTSTATUS} 
     */
    static IoDeleteSymbolicLink(SymbolicLinkName) {
        result := DllCall("ntoskrnl.exe\IoDeleteSymbolicLink", "ptr", SymbolicLinkName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} TargetDevice 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoDetachDevice(TargetDevice) {
        DllCall("ntoskrnl.exe\IoDetachDevice", "ptr", TargetDevice)
    }

    /**
     * 
     * @param {PKINTERRUPT} InterruptObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoDisconnectInterrupt(InterruptObject) {
        DllCall("ntoskrnl.exe\IoDisconnectInterrupt", "ptr", InterruptObject)
    }

    /**
     * 
     * @param {Pointer<IO_DISCONNECT_INTERRUPT_PARAMETERS>} Parameters 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoDisconnectInterruptEx(Parameters) {
        DllCall("ntoskrnl.exe\IoDisconnectInterruptEx", "ptr", Parameters)
    }

    /**
     * 
     * @param {Pointer<IO_REPORT_INTERRUPT_ACTIVE_STATE_PARAMETERS>} Parameters 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoReportInterruptActive(Parameters) {
        DllCall("ntoskrnl.exe\IoReportInterruptActive", "ptr", Parameters)
    }

    /**
     * 
     * @param {Pointer<IO_REPORT_INTERRUPT_ACTIVE_STATE_PARAMETERS>} Parameters 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoReportInterruptInactive(Parameters) {
        DllCall("ntoskrnl.exe\IoReportInterruptInactive", "ptr", Parameters)
    }

    /**
     * 
     * @param {PKINTERRUPT} InterruptObject 
     * @param {Pointer<GROUP_AFFINITY>} GroupAffinity 
     * @returns {NTSTATUS} 
     */
    static IoGetAffinityInterrupt(InterruptObject, GroupAffinity) {
        result := DllCall("ntoskrnl.exe\IoGetAffinityInterrupt", "ptr", InterruptObject, "ptr", GroupAffinity, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoFreeIrp(Irp) {
        DllCall("ntoskrnl.exe\IoFreeIrp", "ptr", Irp)
    }

    /**
     * 
     * @param {Pointer<MDL>} Mdl 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoFreeMdl(Mdl) {
        DllCall("ntoskrnl.exe\IoFreeMdl", "ptr", Mdl)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {Pointer<DEVICE_OBJECT>} 
     */
    static IoGetAttachedDeviceReference(DeviceObject) {
        result := DllCall("ntoskrnl.exe\IoGetAttachedDeviceReference", "ptr", DeviceObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<Void>} ClientIdentificationAddress 
     * @returns {Pointer<Void>} 
     */
    static IoGetDriverObjectExtension(DriverObject, ClientIdentificationAddress) {
        ClientIdentificationAddressMarshal := ClientIdentificationAddress is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetDriverObjectExtension", "ptr", DriverObject, ClientIdentificationAddressMarshal, ClientIdentificationAddress, "ptr")
        return result
    }

    /**
     * 
     * @returns {PEPROCESS} 
     */
    static IoGetCurrentProcess() {
        result := DllCall("ntoskrnl.exe\IoGetCurrentProcess", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} ObjectName 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<Pointer<FILE_OBJECT>>} FileObject 
     * @param {Pointer<Pointer<DEVICE_OBJECT>>} DeviceObject 
     * @returns {NTSTATUS} 
     */
    static IoGetDeviceObjectPointer(ObjectName, DesiredAccess, FileObject, DeviceObject) {
        FileObjectMarshal := FileObject is VarRef ? "ptr*" : "ptr"
        DeviceObjectMarshal := DeviceObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetDeviceObjectPointer", "ptr", ObjectName, "uint", DesiredAccess, FileObjectMarshal, FileObject, DeviceObjectMarshal, DeviceObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<DEVICE_DESCRIPTION>} DeviceDescription 
     * @param {Pointer<Integer>} NumberOfMapRegisters 
     * @returns {Pointer<DMA_ADAPTER>} 
     */
    static IoGetDmaAdapter(PhysicalDeviceObject, DeviceDescription, NumberOfMapRegisters) {
        NumberOfMapRegistersMarshal := NumberOfMapRegisters is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetDmaAdapter", "ptr", PhysicalDeviceObject, "ptr", DeviceDescription, NumberOfMapRegistersMarshal, NumberOfMapRegisters, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Version 
     * @param {Pointer<DMA_IOMMU_INTERFACE>} InterfaceOut 
     * @returns {NTSTATUS} 
     */
    static IoGetIommuInterface(Version, InterfaceOut) {
        result := DllCall("ntoskrnl.exe\IoGetIommuInterface", "uint", Version, "ptr", InterfaceOut, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Version 
     * @param {Integer} Flags 
     * @param {Pointer<DMA_IOMMU_INTERFACE_EX>} InterfaceOut 
     * @returns {NTSTATUS} 
     */
    static IoGetIommuInterfaceEx(Version, Flags, InterfaceOut) {
        result := DllCall("ntoskrnl.exe\IoGetIommuInterfaceEx", "uint", Version, "uint", Flags, "ptr", InterfaceOut, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<IRP>} Irp 
     * @returns {BOOLEAN} 
     */
    static IoForwardIrpSynchronously(DeviceObject, Irp) {
        result := DllCall("ntoskrnl.exe\IoForwardIrpSynchronously", "ptr", DeviceObject, "ptr", Irp, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<IRP>} Irp 
     * @returns {NTSTATUS} 
     */
    static IoSynchronousCallDriver(DeviceObject, Irp) {
        result := DllCall("ntoskrnl.exe\IoSynchronousCallDriver", "ptr", DeviceObject, "ptr", Irp, "int")
        return result
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    static IoGetInitialStack() {
        result := DllCall("ntoskrnl.exe\IoGetInitialStack", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} LowLimit 
     * @param {Pointer<Pointer>} HighLimit 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoGetStackLimits(LowLimit, HighLimit) {
        LowLimitMarshal := LowLimit is VarRef ? "ptr*" : "ptr"
        HighLimitMarshal := HighLimit is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\IoGetStackLimits", LowLimitMarshal, LowLimit, HighLimitMarshal, HighLimit)
    }

    /**
     * 
     * @param {Pointer} RegionStart 
     * @param {Pointer} RegionSize 
     * @returns {Integer} 
     */
    static IoWithinStackLimits(RegionStart, RegionSize) {
        result := DllCall("ntoskrnl.exe\IoWithinStackLimits", "ptr", RegionStart, "ptr", RegionSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {Pointer<DEVICE_OBJECT>} 
     */
    static IoGetRelatedDeviceObject(FileObject) {
        result := DllCall("ntoskrnl.exe\IoGetRelatedDeviceObject", "ptr", FileObject, "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<IRP>} 
     */
    static IoGetTopLevelIrp() {
        result := DllCall("ntoskrnl.exe\IoGetTopLevelIrp", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Integer} PacketSize 
     * @param {Integer} StackSize 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoInitializeIrp(Irp, PacketSize, StackSize) {
        DllCall("ntoskrnl.exe\IoInitializeIrp", "ptr", Irp, "ushort", PacketSize, "char", StackSize)
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoCleanupIrp(Irp) {
        DllCall("ntoskrnl.exe\IoCleanupIrp", "ptr", Irp)
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} PacketSize 
     * @param {Integer} StackSize 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoInitializeIrpEx(Irp, DeviceObject, PacketSize, StackSize) {
        DllCall("ntoskrnl.exe\IoInitializeIrpEx", "ptr", Irp, "ptr", DeviceObject, "ushort", PacketSize, "char", StackSize)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<PIO_TIMER_ROUTINE>} TimerRoutine 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static IoInitializeTimer(DeviceObject, TimerRoutine, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoInitializeTimer", "ptr", DeviceObject, "ptr", TimerRoutine, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {NTSTATUS} Iostatus 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoReuseIrp(Irp, Iostatus) {
        DllCall("ntoskrnl.exe\IoReuseIrp", "ptr", Irp, "int", Iostatus)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {NTSTATUS} 
     */
    static IoRegisterShutdownNotification(DeviceObject) {
        result := DllCall("ntoskrnl.exe\IoRegisterShutdownNotification", "ptr", DeviceObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {NTSTATUS} 
     */
    static IoRegisterLastChanceShutdownNotification(DeviceObject) {
        result := DllCall("ntoskrnl.exe\IoRegisterLastChanceShutdownNotification", "ptr", DeviceObject, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Irql 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoReleaseCancelSpinLock(Irql) {
        DllCall("ntoskrnl.exe\IoReleaseCancelSpinLock", "char", Irql)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<SHARE_ACCESS>} ShareAccess 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoRemoveShareAccess(FileObject, ShareAccess) {
        DllCall("ntoskrnl.exe\IoRemoveShareAccess", "ptr", FileObject, "ptr", ShareAccess)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<SHARE_ACCESS>} ShareAccess 
     * @param {Pointer<LINK_SHARE_ACCESS>} LinkShareAccess 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoRemoveLinkShareAccess(FileObject, ShareAccess, LinkShareAccess) {
        DllCall("ntoskrnl.exe\IoRemoveLinkShareAccess", "ptr", FileObject, "ptr", ShareAccess, "ptr", LinkShareAccess)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<SHARE_ACCESS>} ShareAccess 
     * @param {Pointer<LINK_SHARE_ACCESS>} LinkShareAccess 
     * @param {Integer} IoShareAccessFlags 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoRemoveLinkShareAccessEx(FileObject, ShareAccess, LinkShareAccess, IoShareAccessFlags) {
        DllCall("ntoskrnl.exe\IoRemoveLinkShareAccessEx", "ptr", FileObject, "ptr", ShareAccess, "ptr", LinkShareAccess, "uint", IoShareAccessFlags)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<PIO_COMPLETION_ROUTINE>} CompletionRoutine 
     * @param {Pointer<Void>} Context 
     * @param {BOOLEAN} InvokeOnSuccess 
     * @param {BOOLEAN} InvokeOnError 
     * @param {BOOLEAN} InvokeOnCancel 
     * @returns {NTSTATUS} 
     */
    static IoSetCompletionRoutineEx(DeviceObject, Irp, CompletionRoutine, Context, InvokeOnSuccess, InvokeOnError, InvokeOnCancel) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoSetCompletionRoutineEx", "ptr", DeviceObject, "ptr", Irp, "ptr", CompletionRoutine, ContextMarshal, Context, "char", InvokeOnSuccess, "char", InvokeOnError, "char", InvokeOnCancel, "int")
        return result
    }

    /**
     * 
     * @param {Integer} DesiredAccess 
     * @param {Integer} DesiredShareAccess 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<SHARE_ACCESS>} ShareAccess 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoSetShareAccess(DesiredAccess, DesiredShareAccess, FileObject, ShareAccess) {
        DllCall("ntoskrnl.exe\IoSetShareAccess", "uint", DesiredAccess, "uint", DesiredShareAccess, "ptr", FileObject, "ptr", ShareAccess)
    }

    /**
     * 
     * @param {Integer} DesiredAccess 
     * @param {Integer} DesiredShareAccess 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<SHARE_ACCESS>} ShareAccess 
     * @param {Pointer<BOOLEAN>} WritePermission 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoSetShareAccessEx(DesiredAccess, DesiredShareAccess, FileObject, ShareAccess, WritePermission) {
        WritePermissionMarshal := WritePermission is VarRef ? "char*" : "ptr"

        DllCall("ntoskrnl.exe\IoSetShareAccessEx", "uint", DesiredAccess, "uint", DesiredShareAccess, "ptr", FileObject, "ptr", ShareAccess, WritePermissionMarshal, WritePermission)
    }

    /**
     * 
     * @param {Integer} DesiredAccess 
     * @param {Integer} DesiredShareAccess 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<SHARE_ACCESS>} ShareAccess 
     * @param {Pointer<LINK_SHARE_ACCESS>} LinkShareAccess 
     * @param {Integer} IoShareAccessFlags 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoSetLinkShareAccess(DesiredAccess, DesiredShareAccess, FileObject, ShareAccess, LinkShareAccess, IoShareAccessFlags) {
        DllCall("ntoskrnl.exe\IoSetLinkShareAccess", "uint", DesiredAccess, "uint", DesiredShareAccess, "ptr", FileObject, "ptr", ShareAccess, "ptr", LinkShareAccess, "uint", IoShareAccessFlags)
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoSetTopLevelIrp(Irp) {
        DllCall("ntoskrnl.exe\IoSetTopLevelIrp", "ptr", Irp)
    }

    /**
     * 
     * @param {Pointer<IO_REMOVE_LOCK>} Lock 
     * @param {Integer} AllocateTag 
     * @param {Integer} MaxLockedMinutes 
     * @param {Integer} HighWatermark 
     * @param {Integer} RemlockSize 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoInitializeRemoveLockEx(Lock, AllocateTag, MaxLockedMinutes, HighWatermark, RemlockSize) {
        DllCall("ntoskrnl.exe\IoInitializeRemoveLockEx", "ptr", Lock, "uint", AllocateTag, "uint", MaxLockedMinutes, "uint", HighWatermark, "uint", RemlockSize)
    }

    /**
     * 
     * @param {Pointer<IO_REMOVE_LOCK>} RemoveLock 
     * @param {Pointer<Void>} Tag 
     * @param {PSTR} File 
     * @param {Integer} Line 
     * @param {Integer} RemlockSize 
     * @returns {NTSTATUS} 
     */
    static IoAcquireRemoveLockEx(RemoveLock, Tag, File, Line, RemlockSize) {
        File := File is String ? StrPtr(File) : File

        TagMarshal := Tag is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoAcquireRemoveLockEx", "ptr", RemoveLock, TagMarshal, Tag, "ptr", File, "uint", Line, "uint", RemlockSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IO_REMOVE_LOCK>} RemoveLock 
     * @param {Pointer<Void>} Tag 
     * @param {Integer} RemlockSize 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoReleaseRemoveLockEx(RemoveLock, Tag, RemlockSize) {
        TagMarshal := Tag is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\IoReleaseRemoveLockEx", "ptr", RemoveLock, TagMarshal, Tag, "uint", RemlockSize)
    }

    /**
     * 
     * @param {Pointer<IO_REMOVE_LOCK>} RemoveLock 
     * @param {Pointer<Void>} Tag 
     * @param {Integer} RemlockSize 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoReleaseRemoveLockAndWaitEx(RemoveLock, Tag, RemlockSize) {
        TagMarshal := Tag is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\IoReleaseRemoveLockAndWaitEx", "ptr", RemoveLock, TagMarshal, Tag, "uint", RemlockSize)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} StackSize 
     * @returns {Integer} 
     */
    static IoSizeOfIrpEx(DeviceObject, StackSize) {
        result := DllCall("ntoskrnl.exe\IoSizeOfIrpEx", "ptr", DeviceObject, "char", StackSize, "ushort")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {BOOLEAN} Cancelable 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoStartNextPacket(DeviceObject, Cancelable) {
        DllCall("ntoskrnl.exe\IoStartNextPacket", "ptr", DeviceObject, "char", Cancelable)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {BOOLEAN} Cancelable 
     * @param {Integer} Key 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoStartNextPacketByKey(DeviceObject, Cancelable, Key) {
        DllCall("ntoskrnl.exe\IoStartNextPacketByKey", "ptr", DeviceObject, "char", Cancelable, "uint", Key)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Integer>} Key 
     * @param {Pointer<DRIVER_CANCEL>} CancelFunction 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoStartPacket(DeviceObject, Irp, Key, CancelFunction) {
        KeyMarshal := Key is VarRef ? "uint*" : "ptr"

        DllCall("ntoskrnl.exe\IoStartPacket", "ptr", DeviceObject, "ptr", Irp, KeyMarshal, Key, "ptr", CancelFunction)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {BOOLEAN} DeferredStartIo 
     * @param {BOOLEAN} NonCancelable 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoSetStartIoAttributes(DeviceObject, DeferredStartIo, NonCancelable) {
        DllCall("ntoskrnl.exe\IoSetStartIoAttributes", "ptr", DeviceObject, "char", DeferredStartIo, "char", NonCancelable)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoStartTimer(DeviceObject) {
        DllCall("ntoskrnl.exe\IoStartTimer", "ptr", DeviceObject)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoStopTimer(DeviceObject) {
        DllCall("ntoskrnl.exe\IoStopTimer", "ptr", DeviceObject)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoUnregisterShutdownNotification(DeviceObject) {
        DllCall("ntoskrnl.exe\IoUnregisterShutdownNotification", "ptr", DeviceObject)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<SHARE_ACCESS>} ShareAccess 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoUpdateShareAccess(FileObject, ShareAccess) {
        DllCall("ntoskrnl.exe\IoUpdateShareAccess", "ptr", FileObject, "ptr", ShareAccess)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<SHARE_ACCESS>} ShareAccess 
     * @param {Pointer<LINK_SHARE_ACCESS>} LinkShareAccess 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoUpdateLinkShareAccess(FileObject, ShareAccess, LinkShareAccess) {
        DllCall("ntoskrnl.exe\IoUpdateLinkShareAccess", "ptr", FileObject, "ptr", ShareAccess, "ptr", LinkShareAccess)
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<SHARE_ACCESS>} ShareAccess 
     * @param {Pointer<LINK_SHARE_ACCESS>} LinkShareAccess 
     * @param {Integer} IoShareAccessFlags 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoUpdateLinkShareAccessEx(FileObject, ShareAccess, LinkShareAccess, IoShareAccessFlags) {
        DllCall("ntoskrnl.exe\IoUpdateLinkShareAccessEx", "ptr", FileObject, "ptr", ShareAccess, "ptr", LinkShareAccess, "uint", IoShareAccessFlags)
    }

    /**
     * 
     * @param {Pointer<Void>} ElEntry 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoWriteErrorLogEntry(ElEntry) {
        ElEntryMarshal := ElEntry is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\IoWriteErrorLogEntry", ElEntryMarshal, ElEntry)
    }

    /**
     * 
     * @param {Pointer<Void>} IoObject 
     * @param {Pointer<HANDLE>} ThreadHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<CLIENT_ID>} ClientId 
     * @param {Pointer<PKSTART_ROUTINE>} StartRoutine 
     * @param {Pointer<Void>} StartContext 
     * @returns {NTSTATUS} 
     */
    static IoCreateSystemThread(IoObject, ThreadHandle, DesiredAccess, ObjectAttributes, ProcessHandle, ClientId, StartRoutine, StartContext) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        IoObjectMarshal := IoObject is VarRef ? "ptr" : "ptr"
        StartContextMarshal := StartContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoCreateSystemThread", IoObjectMarshal, IoObject, "ptr", ThreadHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", ProcessHandle, "ptr", ClientId, "ptr", StartRoutine, StartContextMarshal, StartContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {PIO_WORKITEM} 
     */
    static IoAllocateWorkItem(DeviceObject) {
        result := DllCall("ntoskrnl.exe\IoAllocateWorkItem", "ptr", DeviceObject, "ptr")
        return result
    }

    /**
     * 
     * @param {PIO_WORKITEM} IoWorkItem 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoFreeWorkItem(IoWorkItem) {
        DllCall("ntoskrnl.exe\IoFreeWorkItem", "ptr", IoWorkItem)
    }

    /**
     * 
     * @param {PIO_WORKITEM} IoWorkItem 
     * @param {Pointer<PIO_WORKITEM_ROUTINE>} WorkerRoutine 
     * @param {Integer} QueueType 
     * @param {Pointer<Void>} Context 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoQueueWorkItem(IoWorkItem, WorkerRoutine, QueueType, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\IoQueueWorkItem", "ptr", IoWorkItem, "ptr", WorkerRoutine, "int", QueueType, ContextMarshal, Context)
    }

    /**
     * 
     * @param {PIO_WORKITEM} IoWorkItem 
     * @param {Pointer<PIO_WORKITEM_ROUTINE_EX>} WorkerRoutine 
     * @param {Integer} QueueType 
     * @param {Pointer<Void>} Context 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoQueueWorkItemEx(IoWorkItem, WorkerRoutine, QueueType, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\IoQueueWorkItemEx", "ptr", IoWorkItem, "ptr", WorkerRoutine, "int", QueueType, ContextMarshal, Context)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static IoSizeofWorkItem() {
        result := DllCall("ntoskrnl.exe\IoSizeofWorkItem", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} IoObject 
     * @param {PIO_WORKITEM} IoWorkItem 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoInitializeWorkItem(IoObject, IoWorkItem) {
        IoObjectMarshal := IoObject is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\IoInitializeWorkItem", IoObjectMarshal, IoObject, "ptr", IoWorkItem)
    }

    /**
     * 
     * @param {PIO_WORKITEM} IoWorkItem 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoUninitializeWorkItem(IoWorkItem) {
        DllCall("ntoskrnl.exe\IoUninitializeWorkItem", "ptr", IoWorkItem)
    }

    /**
     * 
     * @param {PIO_WORKITEM} IoWorkItem 
     * @param {Pointer<PIO_WORKITEM_ROUTINE_EX>} WorkerRoutine 
     * @param {Integer} QueueType 
     * @param {Pointer<Void>} Context 
     * @returns {BOOLEAN} 
     */
    static IoTryQueueWorkItem(IoWorkItem, WorkerRoutine, QueueType, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoTryQueueWorkItem", "ptr", IoWorkItem, "ptr", WorkerRoutine, "int", QueueType, ContextMarshal, Context, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} Action 
     * @returns {NTSTATUS} 
     */
    static IoWMIRegistrationControl(DeviceObject, Action) {
        result := DllCall("ntoskrnl.exe\IoWMIRegistrationControl", "ptr", DeviceObject, "uint", Action, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Guid 
     * @param {Integer} InstanceCount 
     * @param {Pointer<Integer>} FirstInstanceId 
     * @returns {NTSTATUS} 
     */
    static IoWMIAllocateInstanceIds(Guid, InstanceCount, FirstInstanceId) {
        FirstInstanceIdMarshal := FirstInstanceId is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoWMIAllocateInstanceIds", "ptr", Guid, "uint", InstanceCount, FirstInstanceIdMarshal, FirstInstanceId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
     * @param {BOOLEAN} CombineNames 
     * @param {Pointer<UNICODE_STRING>} SuggestedInstanceName 
     * @returns {NTSTATUS} 
     */
    static IoWMISuggestInstanceName(PhysicalDeviceObject, SymbolicLinkName, CombineNames, SuggestedInstanceName) {
        result := DllCall("ntoskrnl.exe\IoWMISuggestInstanceName", "ptr", PhysicalDeviceObject, "ptr", SymbolicLinkName, "char", CombineNames, "ptr", SuggestedInstanceName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} WnodeEventItem 
     * @returns {NTSTATUS} 
     */
    static IoWMIWriteEvent(WnodeEventItem) {
        WnodeEventItemMarshal := WnodeEventItem is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoWMIWriteEvent", WnodeEventItemMarshal, WnodeEventItem, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Guid 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<Pointer<Void>>} DataBlockObject 
     * @returns {NTSTATUS} 
     */
    static IoWMIOpenBlock(Guid, DesiredAccess, DataBlockObject) {
        DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoWMIOpenBlock", "ptr", Guid, "uint", DesiredAccess, DataBlockObjectMarshal, DataBlockObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DataBlockObject 
     * @param {Pointer<Integer>} InOutBufferSize 
     * @param {Pointer} OutBuffer 
     * @returns {NTSTATUS} 
     */
    static IoWMIQueryAllData(DataBlockObject, InOutBufferSize, OutBuffer) {
        DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr" : "ptr"
        InOutBufferSizeMarshal := InOutBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoWMIQueryAllData", DataBlockObjectMarshal, DataBlockObject, InOutBufferSizeMarshal, InOutBufferSize, "ptr", OutBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} DataBlockObjectList 
     * @param {Integer} ObjectCount 
     * @param {Pointer<Integer>} InOutBufferSize 
     * @param {Pointer} OutBuffer 
     * @returns {NTSTATUS} 
     */
    static IoWMIQueryAllDataMultiple(DataBlockObjectList, ObjectCount, InOutBufferSize, OutBuffer) {
        DataBlockObjectListMarshal := DataBlockObjectList is VarRef ? "ptr*" : "ptr"
        InOutBufferSizeMarshal := InOutBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoWMIQueryAllDataMultiple", DataBlockObjectListMarshal, DataBlockObjectList, "uint", ObjectCount, InOutBufferSizeMarshal, InOutBufferSize, "ptr", OutBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DataBlockObject 
     * @param {Pointer<UNICODE_STRING>} InstanceName 
     * @param {Pointer<Integer>} InOutBufferSize 
     * @param {Pointer} OutBuffer 
     * @returns {NTSTATUS} 
     */
    static IoWMIQuerySingleInstance(DataBlockObject, InstanceName, InOutBufferSize, OutBuffer) {
        DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr" : "ptr"
        InOutBufferSizeMarshal := InOutBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoWMIQuerySingleInstance", DataBlockObjectMarshal, DataBlockObject, "ptr", InstanceName, InOutBufferSizeMarshal, InOutBufferSize, "ptr", OutBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} DataBlockObjectList 
     * @param {Pointer<UNICODE_STRING>} InstanceNames 
     * @param {Integer} ObjectCount 
     * @param {Pointer<Integer>} InOutBufferSize 
     * @param {Pointer} OutBuffer 
     * @returns {NTSTATUS} 
     */
    static IoWMIQuerySingleInstanceMultiple(DataBlockObjectList, InstanceNames, ObjectCount, InOutBufferSize, OutBuffer) {
        DataBlockObjectListMarshal := DataBlockObjectList is VarRef ? "ptr*" : "ptr"
        InOutBufferSizeMarshal := InOutBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoWMIQuerySingleInstanceMultiple", DataBlockObjectListMarshal, DataBlockObjectList, "ptr", InstanceNames, "uint", ObjectCount, InOutBufferSizeMarshal, InOutBufferSize, "ptr", OutBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DataBlockObject 
     * @param {Pointer<UNICODE_STRING>} InstanceName 
     * @param {Integer} Version 
     * @param {Integer} ValueBufferSize 
     * @param {Pointer} ValueBuffer 
     * @returns {NTSTATUS} 
     */
    static IoWMISetSingleInstance(DataBlockObject, InstanceName, Version, ValueBufferSize, ValueBuffer) {
        DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoWMISetSingleInstance", DataBlockObjectMarshal, DataBlockObject, "ptr", InstanceName, "uint", Version, "uint", ValueBufferSize, "ptr", ValueBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DataBlockObject 
     * @param {Pointer<UNICODE_STRING>} InstanceName 
     * @param {Integer} DataItemId 
     * @param {Integer} Version 
     * @param {Integer} ValueBufferSize 
     * @param {Pointer} ValueBuffer 
     * @returns {NTSTATUS} 
     */
    static IoWMISetSingleItem(DataBlockObject, InstanceName, DataItemId, Version, ValueBufferSize, ValueBuffer) {
        DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoWMISetSingleItem", DataBlockObjectMarshal, DataBlockObject, "ptr", InstanceName, "uint", DataItemId, "uint", Version, "uint", ValueBufferSize, "ptr", ValueBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DataBlockObject 
     * @param {Pointer<UNICODE_STRING>} InstanceName 
     * @param {Integer} MethodId 
     * @param {Integer} InBufferSize 
     * @param {Pointer<Integer>} OutBufferSize 
     * @param {Pointer} InOutBuffer 
     * @returns {NTSTATUS} 
     */
    static IoWMIExecuteMethod(DataBlockObject, InstanceName, MethodId, InBufferSize, OutBufferSize, InOutBuffer) {
        DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr" : "ptr"
        OutBufferSizeMarshal := OutBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoWMIExecuteMethod", DataBlockObjectMarshal, DataBlockObject, "ptr", InstanceName, "uint", MethodId, "uint", InBufferSize, OutBufferSizeMarshal, OutBufferSize, "ptr", InOutBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<WMI_NOTIFICATION_CALLBACK>} Callback 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static IoWMISetNotificationCallback(Object_R, Callback, Context) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoWMISetNotificationCallback", Object_RMarshal, Object_R, "ptr", Callback, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DataBlockObject 
     * @param {HANDLE} FileHandle 
     * @param {Pointer<UNICODE_STRING>} InstanceName 
     * @returns {NTSTATUS} 
     */
    static IoWMIHandleToInstanceName(DataBlockObject, FileHandle, InstanceName) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoWMIHandleToInstanceName", DataBlockObjectMarshal, DataBlockObject, "ptr", FileHandle, "ptr", InstanceName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DataBlockObject 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<UNICODE_STRING>} InstanceName 
     * @returns {NTSTATUS} 
     */
    static IoWMIDeviceObjectToInstanceName(DataBlockObject, DeviceObject, InstanceName) {
        DataBlockObjectMarshal := DataBlockObject is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoWMIDeviceObjectToInstanceName", DataBlockObjectMarshal, DataBlockObject, "ptr", DeviceObject, "ptr", InstanceName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {BOOLEAN} 
     */
    static IoIs32bitProcess(Irp) {
        result := DllCall("ntoskrnl.exe\IoIs32bitProcess", "ptr", Irp, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {BOOLEAN} 
     */
    static IoIsInitiator32bitProcess(Irp) {
        result := DllCall("ntoskrnl.exe\IoIsInitiator32bitProcess", "ptr", Irp, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ElEntry 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoFreeErrorLogEntry(ElEntry) {
        ElEntryMarshal := ElEntry is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\IoFreeErrorLogEntry", ElEntryMarshal, ElEntry)
    }

    /**
     * 
     * @param {Pointer<IO_CSQ>} Csq 
     * @param {Pointer<PIO_CSQ_INSERT_IRP>} CsqInsertIrp 
     * @param {Pointer<PIO_CSQ_REMOVE_IRP>} CsqRemoveIrp 
     * @param {Pointer<PIO_CSQ_PEEK_NEXT_IRP>} CsqPeekNextIrp 
     * @param {Pointer<PIO_CSQ_ACQUIRE_LOCK>} CsqAcquireLock 
     * @param {Pointer<PIO_CSQ_RELEASE_LOCK>} CsqReleaseLock 
     * @param {Pointer<PIO_CSQ_COMPLETE_CANCELED_IRP>} CsqCompleteCanceledIrp 
     * @returns {NTSTATUS} 
     */
    static IoCsqInitialize(Csq, CsqInsertIrp, CsqRemoveIrp, CsqPeekNextIrp, CsqAcquireLock, CsqReleaseLock, CsqCompleteCanceledIrp) {
        result := DllCall("ntoskrnl.exe\IoCsqInitialize", "ptr", Csq, "ptr", CsqInsertIrp, "ptr", CsqRemoveIrp, "ptr", CsqPeekNextIrp, "ptr", CsqAcquireLock, "ptr", CsqReleaseLock, "ptr", CsqCompleteCanceledIrp, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IO_CSQ>} Csq 
     * @param {Pointer<PIO_CSQ_INSERT_IRP_EX>} CsqInsertIrp 
     * @param {Pointer<PIO_CSQ_REMOVE_IRP>} CsqRemoveIrp 
     * @param {Pointer<PIO_CSQ_PEEK_NEXT_IRP>} CsqPeekNextIrp 
     * @param {Pointer<PIO_CSQ_ACQUIRE_LOCK>} CsqAcquireLock 
     * @param {Pointer<PIO_CSQ_RELEASE_LOCK>} CsqReleaseLock 
     * @param {Pointer<PIO_CSQ_COMPLETE_CANCELED_IRP>} CsqCompleteCanceledIrp 
     * @returns {NTSTATUS} 
     */
    static IoCsqInitializeEx(Csq, CsqInsertIrp, CsqRemoveIrp, CsqPeekNextIrp, CsqAcquireLock, CsqReleaseLock, CsqCompleteCanceledIrp) {
        result := DllCall("ntoskrnl.exe\IoCsqInitializeEx", "ptr", Csq, "ptr", CsqInsertIrp, "ptr", CsqRemoveIrp, "ptr", CsqPeekNextIrp, "ptr", CsqAcquireLock, "ptr", CsqReleaseLock, "ptr", CsqCompleteCanceledIrp, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IO_CSQ>} Csq 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<IO_CSQ_IRP_CONTEXT>} Context 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoCsqInsertIrp(Csq, Irp, Context) {
        DllCall("ntoskrnl.exe\IoCsqInsertIrp", "ptr", Csq, "ptr", Irp, "ptr", Context)
    }

    /**
     * 
     * @param {Pointer<IO_CSQ>} Csq 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<IO_CSQ_IRP_CONTEXT>} Context 
     * @param {Pointer<Void>} InsertContext 
     * @returns {NTSTATUS} 
     */
    static IoCsqInsertIrpEx(Csq, Irp, Context, InsertContext) {
        InsertContextMarshal := InsertContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoCsqInsertIrpEx", "ptr", Csq, "ptr", Irp, "ptr", Context, InsertContextMarshal, InsertContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IO_CSQ>} Csq 
     * @param {Pointer<Void>} PeekContext 
     * @returns {Pointer<IRP>} 
     */
    static IoCsqRemoveNextIrp(Csq, PeekContext) {
        PeekContextMarshal := PeekContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoCsqRemoveNextIrp", "ptr", Csq, PeekContextMarshal, PeekContext, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<IO_CSQ>} Csq 
     * @param {Pointer<IO_CSQ_IRP_CONTEXT>} Context 
     * @returns {Pointer<IRP>} 
     */
    static IoCsqRemoveIrp(Csq, Context) {
        result := DllCall("ntoskrnl.exe\IoCsqRemoveIrp", "ptr", Csq, "ptr", Context, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Integer} RequiredAccess 
     * @returns {NTSTATUS} 
     */
    static IoValidateDeviceIoControlAccess(Irp, RequiredAccess) {
        result := DllCall("ntoskrnl.exe\IoValidateDeviceIoControlAccess", "ptr", Irp, "uint", RequiredAccess, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {Integer} 
     */
    static IoGetIoPriorityHint(Irp) {
        result := DllCall("ntoskrnl.exe\IoGetIoPriorityHint", "ptr", Irp, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Integer} PriorityHint 
     * @returns {NTSTATUS} 
     */
    static IoSetIoPriorityHint(Irp, PriorityHint) {
        result := DllCall("ntoskrnl.exe\IoSetIoPriorityHint", "ptr", Irp, "int", PriorityHint, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Integer} Length 
     * @param {Pointer<Void>} Signature 
     * @param {Pointer<Pointer<Void>>} StreamIdentifier 
     * @returns {NTSTATUS} 
     */
    static IoAllocateSfioStreamIdentifier(FileObject, Length, Signature, StreamIdentifier) {
        SignatureMarshal := Signature is VarRef ? "ptr" : "ptr"
        StreamIdentifierMarshal := StreamIdentifier is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoAllocateSfioStreamIdentifier", "ptr", FileObject, "uint", Length, SignatureMarshal, Signature, StreamIdentifierMarshal, StreamIdentifier, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Void>} Signature 
     * @returns {Pointer<Void>} 
     */
    static IoGetSfioStreamIdentifier(FileObject, Signature) {
        SignatureMarshal := Signature is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetSfioStreamIdentifier", "ptr", FileObject, SignatureMarshal, Signature, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Void>} Signature 
     * @returns {NTSTATUS} 
     */
    static IoFreeSfioStreamIdentifier(FileObject, Signature) {
        SignatureMarshal := Signature is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoFreeSfioStreamIdentifier", "ptr", FileObject, SignatureMarshal, Signature, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Pointer<Void>>} IoAttributionHandle 
     * @returns {NTSTATUS} 
     */
    static IoGetIoAttributionHandle(Irp, IoAttributionHandle) {
        IoAttributionHandleMarshal := IoAttributionHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetIoAttributionHandle", "ptr", Irp, IoAttributionHandleMarshal, IoAttributionHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} OpaqueHandle 
     * @param {Pointer<IO_ATTRIBUTION_INFORMATION>} AttributionInformation 
     * @returns {NTSTATUS} 
     */
    static IoRecordIoAttribution(OpaqueHandle, AttributionInformation) {
        OpaqueHandleMarshal := OpaqueHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoRecordIoAttribution", OpaqueHandleMarshal, OpaqueHandle, "ptr", AttributionInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Void>} AttributionSource 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static IoSetIoAttributionIrp(Irp, AttributionSource, Flags) {
        AttributionSourceMarshal := AttributionSource is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoSetIoAttributionIrp", "ptr", Irp, AttributionSourceMarshal, AttributionSource, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Integer} InformationClass 
     * @param {Pointer<Void>} ContainerObject 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferLength 
     * @returns {NTSTATUS} 
     */
    static IoGetContainerInformation(InformationClass, ContainerObject, Buffer_R, BufferLength) {
        ContainerObjectMarshal := ContainerObject is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetContainerInformation", "int", InformationClass, ContainerObjectMarshal, ContainerObject, "ptr", Buffer_R, "uint", BufferLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} NotificationClass 
     * @param {Pointer<PIO_CONTAINER_NOTIFICATION_FUNCTION>} CallbackFunction 
     * @param {Pointer} NotificationInformation 
     * @param {Integer} NotificationInformationLength 
     * @param {Pointer<Void>} CallbackRegistration 
     * @returns {NTSTATUS} 
     */
    static IoRegisterContainerNotification(NotificationClass, CallbackFunction, NotificationInformation, NotificationInformationLength, CallbackRegistration) {
        CallbackRegistrationMarshal := CallbackRegistration is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoRegisterContainerNotification", "int", NotificationClass, "ptr", CallbackFunction, "ptr", NotificationInformation, "uint", NotificationInformationLength, CallbackRegistrationMarshal, CallbackRegistration, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} CallbackRegistration 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoUnregisterContainerNotification(CallbackRegistration) {
        CallbackRegistrationMarshal := CallbackRegistration is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\IoUnregisterContainerNotification", CallbackRegistrationMarshal, CallbackRegistration)
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer} Size 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<Void>>} DataHandle 
     * @returns {NTSTATUS} 
     */
    static IoReserveKsrPersistentMemory(DriverObject, PhysicalDeviceObject, Size, Flags, DataHandle) {
        DataHandleMarshal := DataHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoReserveKsrPersistentMemory", "ptr", DriverObject, "ptr", PhysicalDeviceObject, "ptr", Size, "uint", Flags, DataHandleMarshal, DataHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DataHandle 
     * @returns {NTSTATUS} 
     */
    static IoFreeKsrPersistentMemory(DataHandle) {
        DataHandleMarshal := DataHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoFreeKsrPersistentMemory", DataHandleMarshal, DataHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<Pointer>} BufferSize 
     * @returns {NTSTATUS} 
     */
    static IoQueryKsrPersistentMemorySize(DriverObject, PhysicalDeviceObject, BufferSize) {
        BufferSizeMarshal := BufferSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoQueryKsrPersistentMemorySize", "ptr", DriverObject, "ptr", PhysicalDeviceObject, BufferSizeMarshal, BufferSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer} Buffer_R 
     * @param {Pointer<Pointer>} Size 
     * @returns {NTSTATUS} 
     */
    static IoAcquireKsrPersistentMemory(DriverObject, PhysicalDeviceObject, Buffer_R, Size) {
        SizeMarshal := Size is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoAcquireKsrPersistentMemory", "ptr", DriverObject, "ptr", PhysicalDeviceObject, "ptr", Buffer_R, SizeMarshal, Size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DataHandle 
     * @param {Pointer} Buffer_R 
     * @param {Pointer} Size 
     * @returns {NTSTATUS} 
     */
    static IoWriteKsrPersistentMemory(DataHandle, Buffer_R, Size) {
        DataHandleMarshal := DataHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoWriteKsrPersistentMemory", DataHandleMarshal, DataHandle, "ptr", Buffer_R, "ptr", Size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<UNICODE_STRING>} PhysicalDeviceId 
     * @param {Pointer<PIO_PERSISTED_MEMORY_ENUMERATION_CALLBACK>} Callback 
     * @param {Pointer<Void>} CallbackContext 
     * @returns {NTSTATUS} 
     */
    static IoEnumerateKsrPersistentMemoryEx(DriverObject, PhysicalDeviceObject, PhysicalDeviceId, Callback, CallbackContext) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoEnumerateKsrPersistentMemoryEx", "ptr", DriverObject, "ptr", PhysicalDeviceObject, "ptr", PhysicalDeviceId, "ptr", Callback, CallbackContextMarshal, CallbackContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<UNICODE_STRING>} PhysicalDeviceId 
     * @param {Pointer<Integer>} DataTag 
     * @param {Integer} DataVersion 
     * @param {Pointer} Size 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<Void>>} DataHandle 
     * @returns {NTSTATUS} 
     */
    static IoReserveKsrPersistentMemoryEx(DriverObject, PhysicalDeviceObject, PhysicalDeviceId, DataTag, DataVersion, Size, Flags, DataHandle) {
        DataTagMarshal := DataTag is VarRef ? "ushort*" : "ptr"
        DataHandleMarshal := DataHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoReserveKsrPersistentMemoryEx", "ptr", DriverObject, "ptr", PhysicalDeviceObject, "ptr", PhysicalDeviceId, DataTagMarshal, DataTag, "uint", DataVersion, "ptr", Size, "uint", Flags, DataHandleMarshal, DataHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<UNICODE_STRING>} PhysicalDeviceId 
     * @param {Pointer<Integer>} DataTag 
     * @param {Pointer<Integer>} DataVersion 
     * @param {Pointer<Pointer>} BufferSize 
     * @returns {NTSTATUS} 
     */
    static IoQueryKsrPersistentMemorySizeEx(DriverObject, PhysicalDeviceObject, PhysicalDeviceId, DataTag, DataVersion, BufferSize) {
        DataTagMarshal := DataTag is VarRef ? "ushort*" : "ptr"
        DataVersionMarshal := DataVersion is VarRef ? "uint*" : "ptr"
        BufferSizeMarshal := BufferSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoQueryKsrPersistentMemorySizeEx", "ptr", DriverObject, "ptr", PhysicalDeviceObject, "ptr", PhysicalDeviceId, DataTagMarshal, DataTag, DataVersionMarshal, DataVersion, BufferSizeMarshal, BufferSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<UNICODE_STRING>} PhysicalDeviceId 
     * @param {Pointer<Integer>} DataTag 
     * @param {Pointer<Integer>} DataVersion 
     * @param {Pointer} Buffer_R 
     * @param {Pointer<Pointer>} Size 
     * @returns {NTSTATUS} 
     */
    static IoAcquireKsrPersistentMemoryEx(DriverObject, PhysicalDeviceObject, PhysicalDeviceId, DataTag, DataVersion, Buffer_R, Size) {
        DataTagMarshal := DataTag is VarRef ? "ushort*" : "ptr"
        DataVersionMarshal := DataVersion is VarRef ? "uint*" : "ptr"
        SizeMarshal := Size is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoAcquireKsrPersistentMemoryEx", "ptr", DriverObject, "ptr", PhysicalDeviceObject, "ptr", PhysicalDeviceId, DataTagMarshal, DataTag, DataVersionMarshal, DataVersion, "ptr", Buffer_R, SizeMarshal, Size, "int")
        return result
    }

    /**
     * 
     * @param {Integer} TraceInformationClass 
     * @param {Pointer} TraceInformation 
     * @param {Integer} TraceInformationLength 
     * @param {Pointer<Integer>} RequiredLength 
     * @param {Pointer<Void>} Buffer_R 
     * @returns {NTSTATUS} 
     */
    static WmiQueryTraceInformation(TraceInformationClass, TraceInformation, TraceInformationLength, RequiredLength, Buffer_R) {
        RequiredLengthMarshal := RequiredLength is VarRef ? "uint*" : "ptr"
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\WmiQueryTraceInformation", "int", TraceInformationClass, "ptr", TraceInformation, "uint", TraceInformationLength, RequiredLengthMarshal, RequiredLength, Buffer_RMarshal, Buffer_R, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProviderId 
     * @param {Pointer<PETWENABLECALLBACK>} EnableCallback 
     * @param {Pointer<Void>} CallbackContext 
     * @param {Pointer<REGHANDLE>} RegHandle 
     * @returns {NTSTATUS} 
     */
    static EtwRegister(ProviderId, EnableCallback, CallbackContext, RegHandle) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\EtwRegister", "ptr", ProviderId, "ptr", EnableCallback, CallbackContextMarshal, CallbackContext, "ptr", RegHandle, "int")
        return result
    }

    /**
     * 
     * @param {REGHANDLE} RegHandle 
     * @returns {NTSTATUS} 
     */
    static EtwUnregister(RegHandle) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ntoskrnl.exe\EtwUnregister", "ptr", RegHandle, "int")
        return result
    }

    /**
     * 
     * @param {REGHANDLE} RegHandle 
     * @param {Integer} InformationClass 
     * @param {Pointer} EventInformation 
     * @param {Integer} InformationLength 
     * @returns {NTSTATUS} 
     */
    static EtwSetInformation(RegHandle, InformationClass, EventInformation, InformationLength) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ntoskrnl.exe\EtwSetInformation", "ptr", RegHandle, "int", InformationClass, "ptr", EventInformation, "uint", InformationLength, "int")
        return result
    }

    /**
     * 
     * @param {REGHANDLE} RegHandle 
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor 
     * @returns {BOOLEAN} 
     */
    static EtwEventEnabled(RegHandle, EventDescriptor) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ntdll.dll\EtwEventEnabled", "ptr", RegHandle, "ptr", EventDescriptor, "char")
        return result
    }

    /**
     * 
     * @param {REGHANDLE} RegHandle 
     * @param {Integer} Level 
     * @param {Integer} Keyword 
     * @returns {BOOLEAN} 
     */
    static EtwProviderEnabled(RegHandle, Level, Keyword) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ntoskrnl.exe\EtwProviderEnabled", "ptr", RegHandle, "char", Level, "uint", Keyword, "char")
        return result
    }

    /**
     * 
     * @param {Integer} ControlCode 
     * @param {Pointer<Guid>} ActivityId 
     * @returns {NTSTATUS} 
     */
    static EtwActivityIdControl(ControlCode, ActivityId) {
        result := DllCall("ntoskrnl.exe\EtwActivityIdControl", "uint", ControlCode, "ptr", ActivityId, "int")
        return result
    }

    /**
     * 
     * @param {REGHANDLE} RegHandle 
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor 
     * @param {Pointer<Guid>} ActivityId 
     * @param {Integer} UserDataCount 
     * @param {Pointer<EVENT_DATA_DESCRIPTOR>} UserData 
     * @returns {NTSTATUS} 
     */
    static EtwWrite(RegHandle, EventDescriptor, ActivityId, UserDataCount, UserData) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ntoskrnl.exe\EtwWrite", "ptr", RegHandle, "ptr", EventDescriptor, "ptr", ActivityId, "uint", UserDataCount, "ptr", UserData, "int")
        return result
    }

    /**
     * 
     * @param {REGHANDLE} RegHandle 
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor 
     * @param {Pointer<Guid>} ActivityId 
     * @param {Pointer<Guid>} RelatedActivityId 
     * @param {Integer} UserDataCount 
     * @param {Pointer<EVENT_DATA_DESCRIPTOR>} UserData 
     * @returns {NTSTATUS} 
     */
    static EtwWriteTransfer(RegHandle, EventDescriptor, ActivityId, RelatedActivityId, UserDataCount, UserData) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ntoskrnl.exe\EtwWriteTransfer", "ptr", RegHandle, "ptr", EventDescriptor, "ptr", ActivityId, "ptr", RelatedActivityId, "uint", UserDataCount, "ptr", UserData, "int")
        return result
    }

    /**
     * 
     * @param {REGHANDLE} RegHandle 
     * @param {Integer} Level 
     * @param {Integer} Keyword 
     * @param {Pointer<Guid>} ActivityId 
     * @param {PWSTR} String 
     * @returns {NTSTATUS} 
     */
    static EtwWriteString(RegHandle, Level, Keyword, ActivityId, String) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle
        String := String is String ? StrPtr(String) : String

        result := DllCall("ntoskrnl.exe\EtwWriteString", "ptr", RegHandle, "char", Level, "uint", Keyword, "ptr", ActivityId, "ptr", String, "int")
        return result
    }

    /**
     * 
     * @param {REGHANDLE} RegHandle 
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor 
     * @param {Integer} Filter 
     * @param {Integer} Flags 
     * @param {Pointer<Guid>} ActivityId 
     * @param {Pointer<Guid>} RelatedActivityId 
     * @param {Integer} UserDataCount 
     * @param {Pointer<EVENT_DATA_DESCRIPTOR>} UserData 
     * @returns {NTSTATUS} 
     */
    static EtwWriteEx(RegHandle, EventDescriptor, Filter, Flags, ActivityId, RelatedActivityId, UserDataCount, UserData) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ntoskrnl.exe\EtwWriteEx", "ptr", RegHandle, "ptr", EventDescriptor, "uint", Filter, "uint", Flags, "ptr", ActivityId, "ptr", RelatedActivityId, "uint", UserDataCount, "ptr", UserData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} CveId 
     * @param {Pointer<UNICODE_STRING>} AdditionalDetails 
     * @returns {NTSTATUS} 
     */
    static SeEtwWriteKMCveEvent(CveId, AdditionalDetails) {
        result := DllCall("ntoskrnl.exe\SeEtwWriteKMCveEvent", "ptr", CveId, "ptr", AdditionalDetails, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} Type 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoInvalidateDeviceRelations(DeviceObject, Type) {
        DllCall("ntoskrnl.exe\IoInvalidateDeviceRelations", "ptr", DeviceObject, "int", Type)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoRequestDeviceEject(PhysicalDeviceObject) {
        DllCall("ntoskrnl.exe\IoRequestDeviceEject", "ptr", PhysicalDeviceObject)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<PIO_DEVICE_EJECT_CALLBACK>} Callback 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @returns {NTSTATUS} 
     */
    static IoRequestDeviceEjectEx(PhysicalDeviceObject, Callback, Context, DriverObject) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoRequestDeviceEjectEx", "ptr", PhysicalDeviceObject, "ptr", Callback, ContextMarshal, Context, "ptr", DriverObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} DeviceProperty 
     * @param {Integer} BufferLength 
     * @param {Pointer} PropertyBuffer 
     * @param {Pointer<Integer>} ResultLength 
     * @returns {NTSTATUS} 
     */
    static IoGetDeviceProperty(DeviceObject, DeviceProperty, BufferLength, PropertyBuffer, ResultLength) {
        ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetDeviceProperty", "ptr", DeviceObject, "int", DeviceProperty, "uint", BufferLength, "ptr", PropertyBuffer, ResultLengthMarshal, ResultLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} DevInstKeyType 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<HANDLE>} DeviceRegKey 
     * @returns {NTSTATUS} 
     */
    static IoOpenDeviceRegistryKey(DeviceObject, DevInstKeyType, DesiredAccess, DeviceRegKey) {
        result := DllCall("ntoskrnl.exe\IoOpenDeviceRegistryKey", "ptr", DeviceObject, "uint", DevInstKeyType, "uint", DesiredAccess, "ptr", DeviceRegKey, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<Guid>} InterfaceClassGuid 
     * @param {Pointer<UNICODE_STRING>} ReferenceString 
     * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
     * @returns {NTSTATUS} 
     */
    static IoRegisterDeviceInterface(PhysicalDeviceObject, InterfaceClassGuid, ReferenceString, SymbolicLinkName) {
        result := DllCall("ntoskrnl.exe\IoRegisterDeviceInterface", "ptr", PhysicalDeviceObject, "ptr", InterfaceClassGuid, "ptr", ReferenceString, "ptr", SymbolicLinkName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<HANDLE>} DeviceInterfaceRegKey 
     * @returns {NTSTATUS} 
     */
    static IoOpenDeviceInterfaceRegistryKey(SymbolicLinkName, DesiredAccess, DeviceInterfaceRegKey) {
        result := DllCall("ntoskrnl.exe\IoOpenDeviceInterfaceRegistryKey", "ptr", SymbolicLinkName, "uint", DesiredAccess, "ptr", DeviceInterfaceRegKey, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
     * @param {BOOLEAN} Enable 
     * @returns {NTSTATUS} 
     */
    static IoSetDeviceInterfaceState(SymbolicLinkName, Enable) {
        result := DllCall("ntoskrnl.exe\IoSetDeviceInterfaceState", "ptr", SymbolicLinkName, "char", Enable, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} InterfaceClassGuid 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Integer} Flags 
     * @param {Pointer<PWSTR>} SymbolicLinkList 
     * @returns {NTSTATUS} 
     */
    static IoGetDeviceInterfaces(InterfaceClassGuid, PhysicalDeviceObject, Flags, SymbolicLinkList) {
        SymbolicLinkListMarshal := SymbolicLinkList is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetDeviceInterfaces", "ptr", InterfaceClassGuid, "ptr", PhysicalDeviceObject, "uint", Flags, SymbolicLinkListMarshal, SymbolicLinkList, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
     * @param {Pointer<Guid>} AliasInterfaceClassGuid 
     * @param {Pointer<UNICODE_STRING>} AliasSymbolicLinkName 
     * @returns {NTSTATUS} 
     */
    static IoGetDeviceInterfaceAlias(SymbolicLinkName, AliasInterfaceClassGuid, AliasSymbolicLinkName) {
        result := DllCall("ntoskrnl.exe\IoGetDeviceInterfaceAlias", "ptr", SymbolicLinkName, "ptr", AliasInterfaceClassGuid, "ptr", AliasSymbolicLinkName, "int")
        return result
    }

    /**
     * 
     * @param {Integer} EventCategory 
     * @param {Integer} EventCategoryFlags 
     * @param {Pointer<Void>} EventCategoryData 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DRIVER_NOTIFICATION_CALLBACK_ROUTINE>} CallbackRoutine 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<Pointer<Void>>} NotificationEntry 
     * @returns {NTSTATUS} 
     */
    static IoRegisterPlugPlayNotification(EventCategory, EventCategoryFlags, EventCategoryData, DriverObject, CallbackRoutine, Context, NotificationEntry) {
        EventCategoryDataMarshal := EventCategoryData is VarRef ? "ptr" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"
        NotificationEntryMarshal := NotificationEntry is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoRegisterPlugPlayNotification", "int", EventCategory, "uint", EventCategoryFlags, EventCategoryDataMarshal, EventCategoryData, "ptr", DriverObject, "ptr", CallbackRoutine, ContextMarshal, Context, NotificationEntryMarshal, NotificationEntry, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NotificationEntry 
     * @returns {NTSTATUS} 
     */
    static IoUnregisterPlugPlayNotification(NotificationEntry) {
        NotificationEntryMarshal := NotificationEntry is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoUnregisterPlugPlayNotification", NotificationEntryMarshal, NotificationEntry, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NotificationEntry 
     * @returns {NTSTATUS} 
     */
    static IoUnregisterPlugPlayNotificationEx(NotificationEntry) {
        NotificationEntryMarshal := NotificationEntry is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoUnregisterPlugPlayNotificationEx", NotificationEntryMarshal, NotificationEntry, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<Void>} NotificationStructure 
     * @returns {NTSTATUS} 
     */
    static IoReportTargetDeviceChange(PhysicalDeviceObject, NotificationStructure) {
        NotificationStructureMarshal := NotificationStructure is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoReportTargetDeviceChange", "ptr", PhysicalDeviceObject, NotificationStructureMarshal, NotificationStructure, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoInvalidateDeviceState(PhysicalDeviceObject) {
        DllCall("ntoskrnl.exe\IoInvalidateDeviceState", "ptr", PhysicalDeviceObject)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<Void>} NotificationStructure 
     * @param {Pointer<PDEVICE_CHANGE_COMPLETE_CALLBACK>} Callback 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static IoReportTargetDeviceChangeAsynchronous(PhysicalDeviceObject, NotificationStructure, Callback, Context) {
        NotificationStructureMarshal := NotificationStructure is VarRef ? "ptr" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoReportTargetDeviceChangeAsynchronous", "ptr", PhysicalDeviceObject, NotificationStructureMarshal, NotificationStructure, "ptr", Callback, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Integer} DirectoryType 
     * @param {Integer} Flags 
     * @param {Pointer<HANDLE>} DriverDirectoryHandle 
     * @returns {NTSTATUS} 
     */
    static IoGetDriverDirectory(DriverObject, DirectoryType, Flags, DriverDirectoryHandle) {
        result := DllCall("ntoskrnl.exe\IoGetDriverDirectory", "ptr", DriverObject, "int", DirectoryType, "uint", Flags, "ptr", DriverDirectoryHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Integer} DirectoryType 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<HANDLE>} DeviceDirectoryHandle 
     * @returns {NTSTATUS} 
     */
    static IoGetDeviceDirectory(PhysicalDeviceObject, DirectoryType, Flags, Reserved, DeviceDirectoryHandle) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetDeviceDirectory", "ptr", PhysicalDeviceObject, "int", DirectoryType, "uint", Flags, ReservedMarshal, Reserved, "ptr", DeviceDirectoryHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Integer} RegKeyType 
     * @param {Integer} DesiredAccess 
     * @param {Integer} Flags 
     * @param {Pointer<HANDLE>} DriverRegKey 
     * @returns {NTSTATUS} 
     */
    static IoOpenDriverRegistryKey(DriverObject, RegKeyType, DesiredAccess, Flags, DriverRegKey) {
        result := DllCall("ntoskrnl.exe\IoOpenDriverRegistryKey", "ptr", DriverObject, "int", RegKeyType, "uint", DesiredAccess, "uint", Flags, "ptr", DriverRegKey, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} Pdo 
     * @param {Pointer<DEVPROPKEY>} PropertyKey 
     * @param {Integer} Lcid 
     * @param {Integer} Flags 
     * @param {Integer} Type 
     * @param {Integer} Size 
     * @param {Pointer} Data 
     * @returns {NTSTATUS} 
     */
    static IoSetDevicePropertyData(Pdo, PropertyKey, Lcid, Flags, Type, Size, Data) {
        result := DllCall("ntoskrnl.exe\IoSetDevicePropertyData", "ptr", Pdo, "ptr", PropertyKey, "uint", Lcid, "uint", Flags, "uint", Type, "uint", Size, "ptr", Data, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} Pdo 
     * @param {Pointer<DEVPROPKEY>} PropertyKey 
     * @param {Integer} Lcid 
     * @param {Integer} Size 
     * @param {Pointer} Data 
     * @param {Pointer<Integer>} RequiredSize 
     * @param {Pointer<Integer>} Type 
     * @returns {NTSTATUS} 
     */
    static IoGetDevicePropertyData(Pdo, PropertyKey, Lcid, Size, Data, RequiredSize, Type) {
        static Flags := 0 ;Reserved parameters must always be NULL

        RequiredSizeMarshal := RequiredSize is VarRef ? "uint*" : "ptr"
        TypeMarshal := Type is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetDevicePropertyData", "ptr", Pdo, "ptr", PropertyKey, "uint", Lcid, "uint", Flags, "uint", Size, "ptr", Data, RequiredSizeMarshal, RequiredSize, TypeMarshal, Type, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
     * @param {Pointer<DEVPROPKEY>} PropertyKey 
     * @param {Integer} Lcid 
     * @param {Integer} Flags 
     * @param {Integer} Type 
     * @param {Integer} Size 
     * @param {Pointer} Data 
     * @returns {NTSTATUS} 
     */
    static IoSetDeviceInterfacePropertyData(SymbolicLinkName, PropertyKey, Lcid, Flags, Type, Size, Data) {
        result := DllCall("ntoskrnl.exe\IoSetDeviceInterfacePropertyData", "ptr", SymbolicLinkName, "ptr", PropertyKey, "uint", Lcid, "uint", Flags, "uint", Type, "uint", Size, "ptr", Data, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} SymbolicLinkName 
     * @param {Pointer<DEVPROPKEY>} PropertyKey 
     * @param {Integer} Lcid 
     * @param {Integer} Size 
     * @param {Pointer} Data 
     * @param {Pointer<Integer>} RequiredSize 
     * @param {Pointer<Integer>} Type 
     * @returns {NTSTATUS} 
     */
    static IoGetDeviceInterfacePropertyData(SymbolicLinkName, PropertyKey, Lcid, Size, Data, RequiredSize, Type) {
        static Flags := 0 ;Reserved parameters must always be NULL

        RequiredSizeMarshal := RequiredSize is VarRef ? "uint*" : "ptr"
        TypeMarshal := Type is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetDeviceInterfacePropertyData", "ptr", SymbolicLinkName, "ptr", PropertyKey, "uint", Lcid, "uint", Flags, "uint", Size, "ptr", Data, RequiredSizeMarshal, RequiredSize, TypeMarshal, Type, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} Pdo 
     * @param {Pointer<Integer>} NodeNumber 
     * @returns {NTSTATUS} 
     */
    static IoGetDeviceNumaNode(Pdo, NodeNumber) {
        NodeNumberMarshal := NodeNumber is VarRef ? "ushort*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetDeviceNumaNode", "ptr", Pdo, NodeNumberMarshal, NodeNumber, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} TargetPdo 
     * @param {Pointer<DEVICE_OBJECT>} SparePdo 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static IoReplacePartitionUnit(TargetPdo, SparePdo, Flags) {
        result := DllCall("ntoskrnl.exe\IoReplacePartitionUnit", "ptr", TargetPdo, "ptr", SparePdo, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeFlushWriteBuffer() {
        DllCall("HAL.dll\KeFlushWriteBuffer")
    }

    /**
     * 
     * @param {Pointer<Integer>} PerformanceFrequency 
     * @returns {Integer} 
     */
    static KeQueryPerformanceCounter(PerformanceFrequency) {
        PerformanceFrequencyMarshal := PerformanceFrequency is VarRef ? "int64*" : "ptr"

        result := DllCall("HAL.dll\KeQueryPerformanceCounter", PerformanceFrequencyMarshal, PerformanceFrequency, "int64")
        return result
    }

    /**
     * 
     * @param {Integer} MicroSeconds 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeStallExecutionProcessor(MicroSeconds) {
        DllCall("HAL.dll\KeStallExecutionProcessor", "uint", MicroSeconds)
    }

    /**
     * 
     * @param {Pointer<Void>} MemoryMap 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} Address 
     * @param {Pointer} Length 
     * @param {Integer} Tag 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoSetHiberRange(MemoryMap, Flags, Address, Length, Tag) {
        MemoryMapMarshal := MemoryMap is VarRef ? "ptr" : "ptr"
        AddressMarshal := Address is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\PoSetHiberRange", MemoryMapMarshal, MemoryMap, "uint", Flags, AddressMarshal, Address, "ptr", Length, "uint", Tag)
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoSetSystemState(Flags) {
        DllCall("ntoskrnl.exe\PoSetSystemState", "uint", Flags)
    }

    /**
     * 
     * @param {Pointer<Void>} StateHandle 
     * @param {Integer} Flags 
     * @returns {Pointer<Void>} 
     */
    static PoRegisterSystemState(StateHandle, Flags) {
        StateHandleMarshal := StateHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\PoRegisterSystemState", StateHandleMarshal, StateHandle, "uint", Flags, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} PowerRequest 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<COUNTED_REASON_CONTEXT>} Context 
     * @returns {NTSTATUS} 
     */
    static PoCreatePowerRequest(PowerRequest, DeviceObject, Context) {
        PowerRequestMarshal := PowerRequest is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PoCreatePowerRequest", PowerRequestMarshal, PowerRequest, "ptr", DeviceObject, "ptr", Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} PowerRequest 
     * @param {Integer} Type 
     * @returns {NTSTATUS} 
     */
    static PoSetPowerRequest(PowerRequest, Type) {
        PowerRequestMarshal := PowerRequest is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\PoSetPowerRequest", PowerRequestMarshal, PowerRequest, "int", Type, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} PowerRequest 
     * @param {Integer} Type 
     * @returns {NTSTATUS} 
     */
    static PoClearPowerRequest(PowerRequest, Type) {
        PowerRequestMarshal := PowerRequest is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\PoClearPowerRequest", PowerRequestMarshal, PowerRequest, "int", Type, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} PowerRequest 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoDeletePowerRequest(PowerRequest) {
        PowerRequestMarshal := PowerRequest is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\PoDeletePowerRequest", PowerRequestMarshal, PowerRequest)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} MinorFunction 
     * @param {POWER_STATE} PowerState 
     * @param {Pointer<PREQUEST_POWER_COMPLETE>} CompletionFunction 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<Pointer<IRP>>} Irp 
     * @returns {NTSTATUS} 
     */
    static PoRequestPowerIrp(DeviceObject, MinorFunction, PowerState, CompletionFunction, Context, Irp) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"
        IrpMarshal := Irp is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PoRequestPowerIrp", "ptr", DeviceObject, "char", MinorFunction, "ptr", PowerState, "ptr", CompletionFunction, ContextMarshal, Context, IrpMarshal, Irp, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoSetSystemWake(Irp) {
        DllCall("ntoskrnl.exe\PoSetSystemWake", "ptr", Irp)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoSetSystemWakeDevice(DeviceObject) {
        DllCall("ntoskrnl.exe\PoSetSystemWakeDevice", "ptr", DeviceObject)
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {BOOLEAN} 
     */
    static PoGetSystemWake(Irp) {
        result := DllCall("ntoskrnl.exe\PoGetSystemWake", "ptr", Irp, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} StateHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoUnregisterSystemState(StateHandle) {
        StateHandleMarshal := StateHandle is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\PoUnregisterSystemState", StateHandleMarshal, StateHandle)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} Type 
     * @param {POWER_STATE} State 
     * @returns {POWER_STATE} 
     */
    static PoSetPowerState(DeviceObject, Type, State) {
        result := DllCall("ntoskrnl.exe\PoSetPowerState", "ptr", DeviceObject, "int", Type, "ptr", State, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<IRP>} Irp 
     * @returns {NTSTATUS} 
     */
    static PoCallDriver(DeviceObject, Irp) {
        result := DllCall("ntoskrnl.exe\PoCallDriver", "ptr", DeviceObject, "ptr", Irp, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoStartNextPowerIrp(Irp) {
        DllCall("ntoskrnl.exe\PoStartNextPowerIrp", "ptr", Irp)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} ConservationIdleTime 
     * @param {Integer} PerformanceIdleTime 
     * @param {Integer} State 
     * @returns {Pointer<Integer>} 
     */
    static PoRegisterDeviceForIdleDetection(DeviceObject, ConservationIdleTime, PerformanceIdleTime, State) {
        result := DllCall("ntoskrnl.exe\PoRegisterDeviceForIdleDetection", "ptr", DeviceObject, "uint", ConservationIdleTime, "uint", PerformanceIdleTime, "int", State, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} IdlePointer 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoSetDeviceBusyEx(IdlePointer) {
        IdlePointerMarshal := IdlePointer is VarRef ? "uint*" : "ptr"

        DllCall("ntoskrnl.exe\PoSetDeviceBusyEx", IdlePointerMarshal, IdlePointer)
    }

    /**
     * 
     * @param {Pointer<Integer>} IdlePointer 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoStartDeviceBusy(IdlePointer) {
        IdlePointerMarshal := IdlePointer is VarRef ? "uint*" : "ptr"

        DllCall("ntoskrnl.exe\PoStartDeviceBusy", IdlePointerMarshal, IdlePointer)
    }

    /**
     * 
     * @param {Pointer<Integer>} IdlePointer 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoEndDeviceBusy(IdlePointer) {
        IdlePointerMarshal := IdlePointer is VarRef ? "uint*" : "ptr"

        DllCall("ntoskrnl.exe\PoEndDeviceBusy", IdlePointerMarshal, IdlePointer)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} Pdo 
     * @param {Pointer<Integer>} SecondsRemaining 
     * @returns {BOOLEAN} 
     */
    static PoQueryWatchdogTime(Pdo, SecondsRemaining) {
        SecondsRemainingMarshal := SecondsRemaining is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\PoQueryWatchdogTime", "ptr", Pdo, SecondsRemainingMarshal, SecondsRemaining, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<Guid>} SettingGuid 
     * @param {Pointer<PPOWER_SETTING_CALLBACK>} Callback 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<Pointer<Void>>} Handle 
     * @returns {NTSTATUS} 
     */
    static PoRegisterPowerSettingCallback(DeviceObject, SettingGuid, Callback, Context, Handle) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"
        HandleMarshal := Handle is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PoRegisterPowerSettingCallback", "ptr", DeviceObject, "ptr", SettingGuid, "ptr", Callback, ContextMarshal, Context, HandleMarshal, Handle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Handle 
     * @returns {NTSTATUS} 
     */
    static PoUnregisterPowerSettingCallback(Handle) {
        HandleMarshal := Handle is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\PoUnregisterPowerSettingCallback", HandleMarshal, Handle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} Pdo 
     * @param {Pointer<PO_FX_DEVICE_V1>} Device 
     * @param {Pointer<POHANDLE>} Handle 
     * @returns {NTSTATUS} 
     */
    static PoFxRegisterDevice(Pdo, Device, Handle) {
        HandleMarshal := Handle is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PoFxRegisterDevice", "ptr", Pdo, "ptr", Device, HandleMarshal, Handle, "int")
        return result
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxStartDevicePowerManagement(Handle) {
        DllCall("ntoskrnl.exe\PoFxStartDevicePowerManagement", "ptr", Handle)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxUnregisterDevice(Handle) {
        DllCall("ntoskrnl.exe\PoFxUnregisterDevice", "ptr", Handle)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @returns {NTSTATUS} 
     */
    static PoFxRegisterCrashdumpDevice(Handle) {
        result := DllCall("ntoskrnl.exe\PoFxRegisterCrashdumpDevice", "ptr", Handle, "int")
        return result
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static PoFxPowerOnCrashdumpDevice(Handle, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\PoFxPowerOnCrashdumpDevice", "ptr", Handle, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Integer} Component 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxActivateComponent(Handle, Component, Flags) {
        DllCall("ntoskrnl.exe\PoFxActivateComponent", "ptr", Handle, "uint", Component, "uint", Flags)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxCompleteDevicePowerNotRequired(Handle) {
        DllCall("ntoskrnl.exe\PoFxCompleteDevicePowerNotRequired", "ptr", Handle)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Integer} Component 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxCompleteIdleCondition(Handle, Component) {
        DllCall("ntoskrnl.exe\PoFxCompleteIdleCondition", "ptr", Handle, "uint", Component)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Integer} Component 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxCompleteIdleState(Handle, Component) {
        DllCall("ntoskrnl.exe\PoFxCompleteIdleState", "ptr", Handle, "uint", Component)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Integer} Component 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxIdleComponent(Handle, Component, Flags) {
        DllCall("ntoskrnl.exe\PoFxIdleComponent", "ptr", Handle, "uint", Component, "uint", Flags)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Integer} Component 
     * @param {Integer} Latency 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxSetComponentLatency(Handle, Component, Latency) {
        DllCall("ntoskrnl.exe\PoFxSetComponentLatency", "ptr", Handle, "uint", Component, "uint", Latency)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Integer} Component 
     * @param {Integer} Residency 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxSetComponentResidency(Handle, Component, Residency) {
        DllCall("ntoskrnl.exe\PoFxSetComponentResidency", "ptr", Handle, "uint", Component, "uint", Residency)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Integer} Component 
     * @param {BOOLEAN} WakeHint 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxSetComponentWake(Handle, Component, WakeHint) {
        DllCall("ntoskrnl.exe\PoFxSetComponentWake", "ptr", Handle, "uint", Component, "char", WakeHint)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Integer} IdleTimeout 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxSetDeviceIdleTimeout(Handle, IdleTimeout) {
        DllCall("ntoskrnl.exe\PoFxSetDeviceIdleTimeout", "ptr", Handle, "uint", IdleTimeout)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxReportDevicePoweredOn(Handle) {
        DllCall("ntoskrnl.exe\PoFxReportDevicePoweredOn", "ptr", Handle)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Pointer<Guid>} PowerControlCode 
     * @param {Pointer<Void>} InBuffer 
     * @param {Pointer} InBufferSize 
     * @param {Pointer<Void>} OutBuffer 
     * @param {Pointer} OutBufferSize 
     * @param {Pointer<Pointer>} BytesReturned 
     * @returns {NTSTATUS} 
     */
    static PoFxPowerControl(Handle, PowerControlCode, InBuffer, InBufferSize, OutBuffer, OutBufferSize, BytesReturned) {
        InBufferMarshal := InBuffer is VarRef ? "ptr" : "ptr"
        OutBufferMarshal := OutBuffer is VarRef ? "ptr" : "ptr"
        BytesReturnedMarshal := BytesReturned is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PoFxPowerControl", "ptr", Handle, "ptr", PowerControlCode, InBufferMarshal, InBuffer, "ptr", InBufferSize, OutBufferMarshal, OutBuffer, "ptr", OutBufferSize, BytesReturnedMarshal, BytesReturned, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} Pdo 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxNotifySurprisePowerOn(Pdo) {
        DllCall("ntoskrnl.exe\PoFxNotifySurprisePowerOn", "ptr", Pdo)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Integer} Component 
     * @param {Integer} Flags 
     * @param {Pointer<PPO_FX_COMPONENT_PERF_STATE_CALLBACK>} ComponentPerfStateCallback 
     * @param {Pointer<PO_FX_COMPONENT_PERF_INFO>} InputStateInfo 
     * @param {Pointer<Pointer<PO_FX_COMPONENT_PERF_INFO>>} OutputStateInfo 
     * @returns {NTSTATUS} 
     */
    static PoFxRegisterComponentPerfStates(Handle, Component, Flags, ComponentPerfStateCallback, InputStateInfo, OutputStateInfo) {
        OutputStateInfoMarshal := OutputStateInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PoFxRegisterComponentPerfStates", "ptr", Handle, "uint", Component, "uint", Flags, "ptr", ComponentPerfStateCallback, "ptr", InputStateInfo, OutputStateInfoMarshal, OutputStateInfo, "int")
        return result
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Integer} Flags 
     * @param {Integer} Component 
     * @param {Pointer<PO_FX_PERF_STATE_CHANGE>} PerfChange 
     * @param {Pointer<Void>} Context 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxIssueComponentPerfStateChange(Handle, Flags, Component, PerfChange, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\PoFxIssueComponentPerfStateChange", "ptr", Handle, "uint", Flags, "uint", Component, "ptr", PerfChange, ContextMarshal, Context)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Integer} Flags 
     * @param {Integer} Component 
     * @param {Integer} PerfChangesCount 
     * @param {Pointer<PO_FX_PERF_STATE_CHANGE>} PerfChanges 
     * @param {Pointer<Void>} Context 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxIssueComponentPerfStateChangeMultiple(Handle, Flags, Component, PerfChangesCount, PerfChanges, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\PoFxIssueComponentPerfStateChangeMultiple", "ptr", Handle, "uint", Flags, "uint", Component, "uint", PerfChangesCount, "ptr", PerfChanges, ContextMarshal, Context)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Integer} Flags 
     * @param {Integer} Component 
     * @param {Integer} SetIndex 
     * @param {Pointer<Integer>} CurrentPerf 
     * @returns {NTSTATUS} 
     */
    static PoFxQueryCurrentComponentPerfState(Handle, Flags, Component, SetIndex, CurrentPerf) {
        CurrentPerfMarshal := CurrentPerf is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\PoFxQueryCurrentComponentPerfState", "ptr", Handle, "uint", Flags, "uint", Component, "uint", SetIndex, CurrentPerfMarshal, CurrentPerf, "int")
        return result
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Integer} TargetState 
     * @returns {NTSTATUS} 
     */
    static PoFxSetTargetDripsDevicePowerState(Handle, TargetState) {
        result := DllCall("ntoskrnl.exe\PoFxSetTargetDripsDevicePowerState", "ptr", Handle, "int", TargetState, "int")
        return result
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxCompleteDirectedPowerDown(Handle) {
        DllCall("ntoskrnl.exe\PoFxCompleteDirectedPowerDown", "ptr", Handle)
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} ThermalRequest 
     * @param {Pointer<DEVICE_OBJECT>} TargetDeviceObject 
     * @param {Pointer<DEVICE_OBJECT>} PolicyDeviceObject 
     * @param {Pointer<COUNTED_REASON_CONTEXT>} Context 
     * @param {Integer} Flags 
     * @returns {NTSTATUS} 
     */
    static PoCreateThermalRequest(ThermalRequest, TargetDeviceObject, PolicyDeviceObject, Context, Flags) {
        ThermalRequestMarshal := ThermalRequest is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PoCreateThermalRequest", ThermalRequestMarshal, ThermalRequest, "ptr", TargetDeviceObject, "ptr", PolicyDeviceObject, "ptr", Context, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ThermalRequest 
     * @param {Integer} Type 
     * @returns {BOOLEAN} 
     */
    static PoGetThermalRequestSupport(ThermalRequest, Type) {
        ThermalRequestMarshal := ThermalRequest is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\PoGetThermalRequestSupport", ThermalRequestMarshal, ThermalRequest, "int", Type, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ThermalRequest 
     * @param {Integer} Throttle 
     * @returns {NTSTATUS} 
     */
    static PoSetThermalPassiveCooling(ThermalRequest, Throttle) {
        ThermalRequestMarshal := ThermalRequest is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\PoSetThermalPassiveCooling", ThermalRequestMarshal, ThermalRequest, "char", Throttle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ThermalRequest 
     * @param {BOOLEAN} Engaged 
     * @returns {NTSTATUS} 
     */
    static PoSetThermalActiveCooling(ThermalRequest, Engaged) {
        ThermalRequestMarshal := ThermalRequest is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\PoSetThermalActiveCooling", ThermalRequestMarshal, ThermalRequest, "char", Engaged, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ThermalRequest 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoDeleteThermalRequest(ThermalRequest) {
        ThermalRequestMarshal := ThermalRequest is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\PoDeleteThermalRequest", ThermalRequestMarshal, ThermalRequest)
    }

    /**
     * 
     * @param {POHANDLE} Handle 
     * @param {Pointer<PPO_FX_DRIPS_WATCHDOG_CALLBACK>} Callback 
     * @param {BOOLEAN} IncludeChildDevices 
     * @param {Pointer<DRIVER_OBJECT>} MatchingDriverObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static PoFxRegisterDripsWatchdogCallback(Handle, Callback, IncludeChildDevices, MatchingDriverObject) {
        DllCall("ntoskrnl.exe\PoFxRegisterDripsWatchdogCallback", "ptr", Handle, "ptr", Callback, "char", IncludeChildDevices, "ptr", MatchingDriverObject)
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @param {Integer} DesiredAccess 
     * @param {POBJECT_TYPE} ObjectType 
     * @param {Integer} AccessMode 
     * @param {Pointer<Pointer<Void>>} Object_R 
     * @param {Pointer<OBJECT_HANDLE_INFORMATION>} HandleInformation 
     * @returns {NTSTATUS} 
     */
    static ObReferenceObjectByHandle(Handle, DesiredAccess, ObjectType, AccessMode, Object_R, HandleInformation) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        Object_RMarshal := Object_R is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\ObReferenceObjectByHandle", "ptr", Handle, "uint", DesiredAccess, "ptr", ObjectType, "char", AccessMode, Object_RMarshal, Object_R, "ptr", HandleInformation, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @param {Integer} DesiredAccess 
     * @param {POBJECT_TYPE} ObjectType 
     * @param {Integer} AccessMode 
     * @param {Integer} Tag 
     * @param {Pointer<Pointer<Void>>} Object_R 
     * @param {Pointer<OBJECT_HANDLE_INFORMATION>} HandleInformation 
     * @returns {NTSTATUS} 
     */
    static ObReferenceObjectByHandleWithTag(Handle, DesiredAccess, ObjectType, AccessMode, Tag, Object_R, HandleInformation) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        Object_RMarshal := Object_R is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\ObReferenceObjectByHandleWithTag", "ptr", Handle, "uint", DesiredAccess, "ptr", ObjectType, "char", AccessMode, "uint", Tag, Object_RMarshal, Object_R, "ptr", HandleInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @returns {BOOLEAN} 
     */
    static ObReferenceObjectSafe(Object_R) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ObReferenceObjectSafe", Object_RMarshal, Object_R, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Integer} Tag 
     * @returns {BOOLEAN} 
     */
    static ObReferenceObjectSafeWithTag(Object_R, Tag) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ObReferenceObjectSafeWithTag", Object_RMarshal, Object_R, "uint", Tag, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @param {Integer} PreviousMode 
     * @returns {NTSTATUS} 
     */
    static ObCloseHandle(Handle, PreviousMode) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("ntoskrnl.exe\ObCloseHandle", "ptr", Handle, "char", PreviousMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @returns {Pointer} 
     */
    static ObfReferenceObject(Object_R) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ObfReferenceObject", Object_RMarshal, Object_R, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Integer} Tag 
     * @returns {Pointer} 
     */
    static ObfReferenceObjectWithTag(Object_R, Tag) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ObfReferenceObjectWithTag", Object_RMarshal, Object_R, "uint", Tag, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Integer} DesiredAccess 
     * @param {POBJECT_TYPE} ObjectType 
     * @param {Integer} AccessMode 
     * @returns {NTSTATUS} 
     */
    static ObReferenceObjectByPointer(Object_R, DesiredAccess, ObjectType, AccessMode) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ObReferenceObjectByPointer", Object_RMarshal, Object_R, "uint", DesiredAccess, "ptr", ObjectType, "char", AccessMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Integer} DesiredAccess 
     * @param {POBJECT_TYPE} ObjectType 
     * @param {Integer} AccessMode 
     * @param {Integer} Tag 
     * @returns {NTSTATUS} 
     */
    static ObReferenceObjectByPointerWithTag(Object_R, DesiredAccess, ObjectType, AccessMode, Tag) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ObReferenceObjectByPointerWithTag", Object_RMarshal, Object_R, "uint", DesiredAccess, "ptr", ObjectType, "char", AccessMode, "uint", Tag, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @returns {Pointer} 
     */
    static ObfDereferenceObject(Object_R) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ObfDereferenceObject", Object_RMarshal, Object_R, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Integer} Tag 
     * @returns {Pointer} 
     */
    static ObfDereferenceObjectWithTag(Object_R, Tag) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ObfDereferenceObjectWithTag", Object_RMarshal, Object_R, "uint", Tag, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @returns {String} Nothing - always returns an empty string
     */
    static ObDereferenceObjectDeferDelete(Object_R) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\ObDereferenceObjectDeferDelete", Object_RMarshal, Object_R)
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Integer} Tag 
     * @returns {String} Nothing - always returns an empty string
     */
    static ObDereferenceObjectDeferDeleteWithTag(Object_R, Tag) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\ObDereferenceObjectDeferDeleteWithTag", Object_RMarshal, Object_R, "uint", Tag)
    }

    /**
     * 
     * @param {Pointer<Void>} Object_R 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} SecurityDescriptor 
     * @param {Pointer<BOOLEAN>} MemoryAllocated 
     * @returns {NTSTATUS} 
     */
    static ObGetObjectSecurity(Object_R, SecurityDescriptor, MemoryAllocated) {
        Object_RMarshal := Object_R is VarRef ? "ptr" : "ptr"
        MemoryAllocatedMarshal := MemoryAllocated is VarRef ? "char*" : "ptr"

        result := DllCall("ntoskrnl.exe\ObGetObjectSecurity", Object_RMarshal, Object_R, "ptr", SecurityDescriptor, MemoryAllocatedMarshal, MemoryAllocated, "int")
        return result
    }

    /**
     * 
     * @param {PSECURITY_DESCRIPTOR} SecurityDescriptor 
     * @param {BOOLEAN} MemoryAllocated 
     * @returns {String} Nothing - always returns an empty string
     */
    static ObReleaseObjectSecurity(SecurityDescriptor, MemoryAllocated) {
        SecurityDescriptor := SecurityDescriptor is Win32Handle ? NumGet(SecurityDescriptor, "ptr") : SecurityDescriptor

        DllCall("ntoskrnl.exe\ObReleaseObjectSecurity", "ptr", SecurityDescriptor, "char", MemoryAllocated)
    }

    /**
     * 
     * @param {Pointer<OB_CALLBACK_REGISTRATION>} CallbackRegistration 
     * @param {Pointer<Pointer<Void>>} RegistrationHandle 
     * @returns {NTSTATUS} 
     */
    static ObRegisterCallbacks(CallbackRegistration, RegistrationHandle) {
        RegistrationHandleMarshal := RegistrationHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\ObRegisterCallbacks", "ptr", CallbackRegistration, RegistrationHandleMarshal, RegistrationHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} RegistrationHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static ObUnRegisterCallbacks(RegistrationHandle) {
        RegistrationHandleMarshal := RegistrationHandle is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\ObUnRegisterCallbacks", RegistrationHandleMarshal, RegistrationHandle)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static ObGetFilterVersion() {
        result := DllCall("ntoskrnl.exe\ObGetFilterVersion", "ushort")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} FileHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer<Integer>} AllocationSize 
     * @param {Integer} FileAttributes 
     * @param {Integer} ShareAccess 
     * @param {Integer} CreateDisposition 
     * @param {Integer} CreateOptions 
     * @param {Pointer} EaBuffer 
     * @param {Integer} EaLength 
     * @returns {NTSTATUS} 
     */
    static ZwCreateFile(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, CreateDisposition, CreateOptions, EaBuffer, EaLength) {
        AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwCreateFile", "ptr", FileHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", CreateDisposition, "uint", CreateOptions, "ptr", EaBuffer, "uint", EaLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} FileHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Integer} ShareAccess 
     * @param {Integer} OpenOptions 
     * @returns {NTSTATUS} 
     */
    static ZwOpenFile(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, ShareAccess, OpenOptions) {
        result := DllCall("ntdll.dll\ZwOpenFile", "ptr", FileHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", IoStatusBlock, "uint", ShareAccess, "uint", OpenOptions, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} DriverServiceName 
     * @returns {NTSTATUS} 
     */
    static ZwLoadDriver(DriverServiceName) {
        result := DllCall("ntdll.dll\ZwLoadDriver", "ptr", DriverServiceName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} DriverServiceName 
     * @returns {NTSTATUS} 
     */
    static ZwUnloadDriver(DriverServiceName) {
        result := DllCall("ntdll.dll\ZwUnloadDriver", "ptr", DriverServiceName, "int")
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
    static ZwQueryInformationFile(FileHandle, IoStatusBlock, FileInformation, Length, FileInformationClass) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\ZwQueryInformationFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "int")
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
    static ZwSetInformationFile(FileHandle, IoStatusBlock, FileInformation, Length, FileInformationClass) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        result := DllCall("ntdll.dll\ZwSetInformationFile", "ptr", FileHandle, "ptr", IoStatusBlock, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "int")
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
    static ZwReadFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, Buffer_R, Length, ByteOffset, Key) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"
        ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
        KeyMarshal := Key is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwReadFile", "ptr", FileHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "ptr", Buffer_R, "uint", Length, ByteOffsetMarshal, ByteOffset, KeyMarshal, Key, "int")
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
    static ZwWriteFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, Buffer_R, Length, ByteOffset, Key) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"
        ByteOffsetMarshal := ByteOffset is VarRef ? "int64*" : "ptr"
        KeyMarshal := Key is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwWriteFile", "ptr", FileHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "ptr", Buffer_R, "uint", Length, ByteOffsetMarshal, ByteOffset, KeyMarshal, Key, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @returns {NTSTATUS} 
     */
    static ZwClose(Handle) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("ntdll.dll\ZwClose", "ptr", Handle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} Handle 
     * @returns {NTSTATUS} 
     */
    static ZwMakeTemporaryObject(Handle) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("ntdll.dll\ZwMakeTemporaryObject", "ptr", Handle, "int")
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
    static ZwCreateSection(SectionHandle, DesiredAccess, ObjectAttributes, MaximumSize, SectionPageProtection, AllocationAttributes, FileHandle) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle

        MaximumSizeMarshal := MaximumSize is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwCreateSection", "ptr", SectionHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, MaximumSizeMarshal, MaximumSize, "uint", SectionPageProtection, "uint", AllocationAttributes, "ptr", FileHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} LinkHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static ZwOpenSymbolicLinkObject(LinkHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\ZwOpenSymbolicLinkObject", "ptr", LinkHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} LinkHandle 
     * @param {Pointer<UNICODE_STRING>} LinkTarget 
     * @param {Pointer<Integer>} ReturnedLength 
     * @returns {NTSTATUS} 
     */
    static ZwQuerySymbolicLinkObject(LinkHandle, LinkTarget, ReturnedLength) {
        LinkHandle := LinkHandle is Win32Handle ? NumGet(LinkHandle, "ptr") : LinkHandle

        ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQuerySymbolicLinkObject", "ptr", LinkHandle, "ptr", LinkTarget, ReturnedLengthMarshal, ReturnedLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TmHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<UNICODE_STRING>} LogFileName 
     * @param {Integer} CreateOptions 
     * @param {Integer} CommitStrength 
     * @returns {NTSTATUS} 
     */
    static ZwCreateTransactionManager(TmHandle, DesiredAccess, ObjectAttributes, LogFileName, CreateOptions, CommitStrength) {
        result := DllCall("ntdll.dll\ZwCreateTransactionManager", "ptr", TmHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", LogFileName, "uint", CreateOptions, "uint", CommitStrength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TmHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<UNICODE_STRING>} LogFileName 
     * @param {Pointer<Guid>} TmIdentity 
     * @param {Integer} OpenOptions 
     * @returns {NTSTATUS} 
     */
    static ZwOpenTransactionManager(TmHandle, DesiredAccess, ObjectAttributes, LogFileName, TmIdentity, OpenOptions) {
        result := DllCall("ntdll.dll\ZwOpenTransactionManager", "ptr", TmHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", LogFileName, "ptr", TmIdentity, "uint", OpenOptions, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionManagerHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static ZwRollforwardTransactionManager(TransactionManagerHandle, TmVirtualClock) {
        TransactionManagerHandle := TransactionManagerHandle is Win32Handle ? NumGet(TransactionManagerHandle, "ptr") : TransactionManagerHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwRollforwardTransactionManager", "ptr", TransactionManagerHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionManagerHandle 
     * @returns {NTSTATUS} 
     */
    static ZwRecoverTransactionManager(TransactionManagerHandle) {
        TransactionManagerHandle := TransactionManagerHandle is Win32Handle ? NumGet(TransactionManagerHandle, "ptr") : TransactionManagerHandle

        result := DllCall("ntdll.dll\ZwRecoverTransactionManager", "ptr", TransactionManagerHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionManagerHandle 
     * @param {Integer} TransactionManagerInformationClass 
     * @param {Pointer} TransactionManagerInformation 
     * @param {Integer} TransactionManagerInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ZwQueryInformationTransactionManager(TransactionManagerHandle, TransactionManagerInformationClass, TransactionManagerInformation, TransactionManagerInformationLength, ReturnLength) {
        TransactionManagerHandle := TransactionManagerHandle is Win32Handle ? NumGet(TransactionManagerHandle, "ptr") : TransactionManagerHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryInformationTransactionManager", "ptr", TransactionManagerHandle, "int", TransactionManagerInformationClass, "ptr", TransactionManagerInformation, "uint", TransactionManagerInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TmHandle 
     * @param {Integer} TransactionManagerInformationClass 
     * @param {Pointer<Void>} TransactionManagerInformation 
     * @param {Integer} TransactionManagerInformationLength 
     * @returns {NTSTATUS} 
     */
    static ZwSetInformationTransactionManager(TmHandle, TransactionManagerInformationClass, TransactionManagerInformation, TransactionManagerInformationLength) {
        TmHandle := TmHandle is Win32Handle ? NumGet(TmHandle, "ptr") : TmHandle

        TransactionManagerInformationMarshal := TransactionManagerInformation is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwSetInformationTransactionManager", "ptr", TmHandle, "int", TransactionManagerInformationClass, TransactionManagerInformationMarshal, TransactionManagerInformation, "uint", TransactionManagerInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} RootObjectHandle 
     * @param {Integer} QueryType 
     * @param {Pointer} ObjectCursor 
     * @param {Integer} ObjectCursorLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ZwEnumerateTransactionObject(RootObjectHandle, QueryType, ObjectCursor, ObjectCursorLength, ReturnLength) {
        RootObjectHandle := RootObjectHandle is Win32Handle ? NumGet(RootObjectHandle, "ptr") : RootObjectHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwEnumerateTransactionObject", "ptr", RootObjectHandle, "int", QueryType, "ptr", ObjectCursor, "uint", ObjectCursorLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TransactionHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<Guid>} Uow 
     * @param {HANDLE} TmHandle 
     * @param {Integer} CreateOptions 
     * @param {Integer} IsolationLevel 
     * @param {Integer} IsolationFlags 
     * @param {Pointer<Integer>} Timeout 
     * @param {Pointer<UNICODE_STRING>} Description 
     * @returns {NTSTATUS} 
     */
    static ZwCreateTransaction(TransactionHandle, DesiredAccess, ObjectAttributes, Uow, TmHandle, CreateOptions, IsolationLevel, IsolationFlags, Timeout, Description) {
        TmHandle := TmHandle is Win32Handle ? NumGet(TmHandle, "ptr") : TmHandle

        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwCreateTransaction", "ptr", TransactionHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", Uow, "ptr", TmHandle, "uint", CreateOptions, "uint", IsolationLevel, "uint", IsolationFlags, TimeoutMarshal, Timeout, "ptr", Description, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} TransactionHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<Guid>} Uow 
     * @param {HANDLE} TmHandle 
     * @returns {NTSTATUS} 
     */
    static ZwOpenTransaction(TransactionHandle, DesiredAccess, ObjectAttributes, Uow, TmHandle) {
        TmHandle := TmHandle is Win32Handle ? NumGet(TmHandle, "ptr") : TmHandle

        result := DllCall("ntdll.dll\ZwOpenTransaction", "ptr", TransactionHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", Uow, "ptr", TmHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionHandle 
     * @param {Integer} TransactionInformationClass 
     * @param {Pointer} TransactionInformation 
     * @param {Integer} TransactionInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ZwQueryInformationTransaction(TransactionHandle, TransactionInformationClass, TransactionInformation, TransactionInformationLength, ReturnLength) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryInformationTransaction", "ptr", TransactionHandle, "int", TransactionInformationClass, "ptr", TransactionInformation, "uint", TransactionInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionHandle 
     * @param {Integer} TransactionInformationClass 
     * @param {Pointer<Void>} TransactionInformation 
     * @param {Integer} TransactionInformationLength 
     * @returns {NTSTATUS} 
     */
    static ZwSetInformationTransaction(TransactionHandle, TransactionInformationClass, TransactionInformation, TransactionInformationLength) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        TransactionInformationMarshal := TransactionInformation is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwSetInformationTransaction", "ptr", TransactionHandle, "int", TransactionInformationClass, TransactionInformationMarshal, TransactionInformation, "uint", TransactionInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionHandle 
     * @param {BOOLEAN} Wait 
     * @returns {NTSTATUS} 
     */
    static ZwCommitTransaction(TransactionHandle, Wait) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        result := DllCall("ntdll.dll\ZwCommitTransaction", "ptr", TransactionHandle, "char", Wait, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} TransactionHandle 
     * @param {BOOLEAN} Wait 
     * @returns {NTSTATUS} 
     */
    static ZwRollbackTransaction(TransactionHandle, Wait) {
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        result := DllCall("ntdll.dll\ZwRollbackTransaction", "ptr", TransactionHandle, "char", Wait, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} ResourceManagerHandle 
     * @param {Integer} DesiredAccess 
     * @param {HANDLE} TmHandle 
     * @param {Pointer<Guid>} ResourceManagerGuid 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Integer} CreateOptions 
     * @param {Pointer<UNICODE_STRING>} Description 
     * @returns {NTSTATUS} 
     */
    static ZwCreateResourceManager(ResourceManagerHandle, DesiredAccess, TmHandle, ResourceManagerGuid, ObjectAttributes, CreateOptions, Description) {
        TmHandle := TmHandle is Win32Handle ? NumGet(TmHandle, "ptr") : TmHandle

        result := DllCall("ntdll.dll\ZwCreateResourceManager", "ptr", ResourceManagerHandle, "uint", DesiredAccess, "ptr", TmHandle, "ptr", ResourceManagerGuid, "ptr", ObjectAttributes, "uint", CreateOptions, "ptr", Description, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} ResourceManagerHandle 
     * @param {Integer} DesiredAccess 
     * @param {HANDLE} TmHandle 
     * @param {Pointer<Guid>} ResourceManagerGuid 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static ZwOpenResourceManager(ResourceManagerHandle, DesiredAccess, TmHandle, ResourceManagerGuid, ObjectAttributes) {
        TmHandle := TmHandle is Win32Handle ? NumGet(TmHandle, "ptr") : TmHandle

        result := DllCall("ntdll.dll\ZwOpenResourceManager", "ptr", ResourceManagerHandle, "uint", DesiredAccess, "ptr", TmHandle, "ptr", ResourceManagerGuid, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ResourceManagerHandle 
     * @returns {NTSTATUS} 
     */
    static ZwRecoverResourceManager(ResourceManagerHandle) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle

        result := DllCall("ntdll.dll\ZwRecoverResourceManager", "ptr", ResourceManagerHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ResourceManagerHandle 
     * @param {Pointer<TRANSACTION_NOTIFICATION>} TransactionNotification 
     * @param {Integer} NotificationLength 
     * @param {Pointer<Integer>} Timeout 
     * @param {Pointer<Integer>} ReturnLength 
     * @param {Integer} Asynchronous 
     * @param {Pointer} AsynchronousContext 
     * @returns {NTSTATUS} 
     */
    static ZwGetNotificationResourceManager(ResourceManagerHandle, TransactionNotification, NotificationLength, Timeout, ReturnLength, Asynchronous, AsynchronousContext) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle

        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwGetNotificationResourceManager", "ptr", ResourceManagerHandle, "ptr", TransactionNotification, "uint", NotificationLength, TimeoutMarshal, Timeout, ReturnLengthMarshal, ReturnLength, "uint", Asynchronous, "ptr", AsynchronousContext, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ResourceManagerHandle 
     * @param {Integer} ResourceManagerInformationClass 
     * @param {Pointer} ResourceManagerInformation 
     * @param {Integer} ResourceManagerInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ZwQueryInformationResourceManager(ResourceManagerHandle, ResourceManagerInformationClass, ResourceManagerInformation, ResourceManagerInformationLength, ReturnLength) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryInformationResourceManager", "ptr", ResourceManagerHandle, "int", ResourceManagerInformationClass, "ptr", ResourceManagerInformation, "uint", ResourceManagerInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ResourceManagerHandle 
     * @param {Integer} ResourceManagerInformationClass 
     * @param {Pointer} ResourceManagerInformation 
     * @param {Integer} ResourceManagerInformationLength 
     * @returns {NTSTATUS} 
     */
    static ZwSetInformationResourceManager(ResourceManagerHandle, ResourceManagerInformationClass, ResourceManagerInformation, ResourceManagerInformationLength) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle

        result := DllCall("ntdll.dll\ZwSetInformationResourceManager", "ptr", ResourceManagerHandle, "int", ResourceManagerInformationClass, "ptr", ResourceManagerInformation, "uint", ResourceManagerInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} EnlistmentHandle 
     * @param {Integer} DesiredAccess 
     * @param {HANDLE} ResourceManagerHandle 
     * @param {HANDLE} TransactionHandle 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Integer} CreateOptions 
     * @param {Integer} NotificationMask 
     * @param {Pointer<Void>} EnlistmentKey 
     * @returns {NTSTATUS} 
     */
    static ZwCreateEnlistment(EnlistmentHandle, DesiredAccess, ResourceManagerHandle, TransactionHandle, ObjectAttributes, CreateOptions, NotificationMask, EnlistmentKey) {
        ResourceManagerHandle := ResourceManagerHandle is Win32Handle ? NumGet(ResourceManagerHandle, "ptr") : ResourceManagerHandle
        TransactionHandle := TransactionHandle is Win32Handle ? NumGet(TransactionHandle, "ptr") : TransactionHandle

        EnlistmentKeyMarshal := EnlistmentKey is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwCreateEnlistment", "ptr", EnlistmentHandle, "uint", DesiredAccess, "ptr", ResourceManagerHandle, "ptr", TransactionHandle, "ptr", ObjectAttributes, "uint", CreateOptions, "uint", NotificationMask, EnlistmentKeyMarshal, EnlistmentKey, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} EnlistmentHandle 
     * @param {Integer} DesiredAccess 
     * @param {HANDLE} RmHandle 
     * @param {Pointer<Guid>} EnlistmentGuid 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static ZwOpenEnlistment(EnlistmentHandle, DesiredAccess, RmHandle, EnlistmentGuid, ObjectAttributes) {
        RmHandle := RmHandle is Win32Handle ? NumGet(RmHandle, "ptr") : RmHandle

        result := DllCall("ntdll.dll\ZwOpenEnlistment", "ptr", EnlistmentHandle, "uint", DesiredAccess, "ptr", RmHandle, "ptr", EnlistmentGuid, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Integer} EnlistmentInformationClass 
     * @param {Pointer} EnlistmentInformation 
     * @param {Integer} EnlistmentInformationLength 
     * @param {Pointer<Integer>} ReturnLength 
     * @returns {NTSTATUS} 
     */
    static ZwQueryInformationEnlistment(EnlistmentHandle, EnlistmentInformationClass, EnlistmentInformation, EnlistmentInformationLength, ReturnLength) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\ZwQueryInformationEnlistment", "ptr", EnlistmentHandle, "int", EnlistmentInformationClass, "ptr", EnlistmentInformation, "uint", EnlistmentInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Integer} EnlistmentInformationClass 
     * @param {Pointer} EnlistmentInformation 
     * @param {Integer} EnlistmentInformationLength 
     * @returns {NTSTATUS} 
     */
    static ZwSetInformationEnlistment(EnlistmentHandle, EnlistmentInformationClass, EnlistmentInformation, EnlistmentInformationLength) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        result := DllCall("ntdll.dll\ZwSetInformationEnlistment", "ptr", EnlistmentHandle, "int", EnlistmentInformationClass, "ptr", EnlistmentInformation, "uint", EnlistmentInformationLength, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Void>} EnlistmentKey 
     * @returns {NTSTATUS} 
     */
    static ZwRecoverEnlistment(EnlistmentHandle, EnlistmentKey) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        EnlistmentKeyMarshal := EnlistmentKey is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwRecoverEnlistment", "ptr", EnlistmentHandle, EnlistmentKeyMarshal, EnlistmentKey, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static ZwPrePrepareEnlistment(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwPrePrepareEnlistment", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static ZwPrepareEnlistment(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwPrepareEnlistment", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static ZwCommitEnlistment(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwCommitEnlistment", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static ZwRollbackEnlistment(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwRollbackEnlistment", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static ZwPrePrepareComplete(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwPrePrepareComplete", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static ZwPrepareComplete(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwPrepareComplete", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static ZwCommitComplete(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwCommitComplete", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static ZwReadOnlyEnlistment(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwReadOnlyEnlistment", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static ZwRollbackComplete(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwRollbackComplete", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} EnlistmentHandle 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static ZwSinglePhaseReject(EnlistmentHandle, TmVirtualClock) {
        EnlistmentHandle := EnlistmentHandle is Win32Handle ? NumGet(EnlistmentHandle, "ptr") : EnlistmentHandle

        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntdll.dll\ZwSinglePhaseReject", "ptr", EnlistmentHandle, TmVirtualClockMarshal, TmVirtualClock, "int")
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
    static ZwQueryInformationByName(ObjectAttributes, IoStatusBlock, FileInformation, Length, FileInformationClass) {
        result := DllCall("ntdll.dll\ZwQueryInformationByName", "ptr", ObjectAttributes, "ptr", IoStatusBlock, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CLS_LSN>} plsn1 
     * @param {Pointer<CLS_LSN>} plsn2 
     * @returns {BOOLEAN} 
     */
    static ClfsLsnEqual(plsn1, plsn2) {
        result := DllCall("CLFS.SYS\ClfsLsnEqual", "ptr", plsn1, "ptr", plsn2, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<CLS_LSN>} plsn1 
     * @param {Pointer<CLS_LSN>} plsn2 
     * @returns {BOOLEAN} 
     */
    static ClfsLsnLess(plsn1, plsn2) {
        result := DllCall("CLFS.SYS\ClfsLsnLess", "ptr", plsn1, "ptr", plsn2, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<CLS_LSN>} plsn1 
     * @param {Pointer<CLS_LSN>} plsn2 
     * @returns {BOOLEAN} 
     */
    static ClfsLsnGreater(plsn1, plsn2) {
        result := DllCall("CLFS.SYS\ClfsLsnGreater", "ptr", plsn1, "ptr", plsn2, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<CLS_LSN>} plsn 
     * @returns {BOOLEAN} 
     */
    static ClfsLsnNull(plsn) {
        result := DllCall("CLFS.SYS\ClfsLsnNull", "ptr", plsn, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<CLS_LSN>} plsn 
     * @returns {Integer} 
     */
    static ClfsLsnContainer(plsn) {
        result := DllCall("CLFS.SYS\ClfsLsnContainer", "ptr", plsn, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} cidContainer 
     * @param {Integer} offBlock 
     * @param {Integer} cRecord 
     * @returns {CLS_LSN} 
     */
    static ClfsLsnCreate(cidContainer, offBlock, cRecord) {
        result := DllCall("CLFS.SYS\ClfsLsnCreate", "uint", cidContainer, "uint", offBlock, "uint", cRecord, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<CLS_LSN>} plsn 
     * @returns {Integer} 
     */
    static ClfsLsnBlockOffset(plsn) {
        result := DllCall("CLFS.SYS\ClfsLsnBlockOffset", "ptr", plsn, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<CLS_LSN>} plsn 
     * @returns {Integer} 
     */
    static ClfsLsnRecordSequence(plsn) {
        result := DllCall("CLFS.SYS\ClfsLsnRecordSequence", "ptr", plsn, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<CLS_LSN>} plsn 
     * @returns {BOOLEAN} 
     */
    static ClfsLsnInvalid(plsn) {
        result := DllCall("CLFS.SYS\ClfsLsnInvalid", "ptr", plsn, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} LogFile 
     * @param {Pointer<CLFS_MGMT_CLIENT_REGISTRATION>} RegistrationData 
     * @param {Pointer<Pointer<Void>>} ClientCookie 
     * @returns {NTSTATUS} 
     */
    static ClfsMgmtRegisterManagedClient(LogFile, RegistrationData, ClientCookie) {
        ClientCookieMarshal := ClientCookie is VarRef ? "ptr*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsMgmtRegisterManagedClient", "ptr", LogFile, "ptr", RegistrationData, ClientCookieMarshal, ClientCookie, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ClientCookie 
     * @returns {NTSTATUS} 
     */
    static ClfsMgmtDeregisterManagedClient(ClientCookie) {
        ClientCookieMarshal := ClientCookie is VarRef ? "ptr" : "ptr"

        result := DllCall("CLFS.SYS\ClfsMgmtDeregisterManagedClient", ClientCookieMarshal, ClientCookie, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Client 
     * @param {NTSTATUS} Reason 
     * @returns {NTSTATUS} 
     */
    static ClfsMgmtTailAdvanceFailure(Client, Reason) {
        ClientMarshal := Client is VarRef ? "ptr" : "ptr"

        result := DllCall("CLFS.SYS\ClfsMgmtTailAdvanceFailure", ClientMarshal, Client, "int", Reason, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Client 
     * @returns {NTSTATUS} 
     */
    static ClfsMgmtHandleLogFileFull(Client) {
        ClientMarshal := Client is VarRef ? "ptr" : "ptr"

        result := DllCall("CLFS.SYS\ClfsMgmtHandleLogFileFull", ClientMarshal, Client, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} LogFile 
     * @param {Pointer} Policy 
     * @param {Integer} PolicyLength 
     * @returns {NTSTATUS} 
     */
    static ClfsMgmtInstallPolicy(LogFile, Policy, PolicyLength) {
        result := DllCall("CLFS.SYS\ClfsMgmtInstallPolicy", "ptr", LogFile, "ptr", Policy, "uint", PolicyLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} LogFile 
     * @param {Integer} PolicyType 
     * @param {Pointer} Policy 
     * @param {Pointer<Integer>} PolicyLength 
     * @returns {NTSTATUS} 
     */
    static ClfsMgmtQueryPolicy(LogFile, PolicyType, Policy, PolicyLength) {
        PolicyLengthMarshal := PolicyLength is VarRef ? "uint*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsMgmtQueryPolicy", "ptr", LogFile, "int", PolicyType, "ptr", Policy, PolicyLengthMarshal, PolicyLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} LogFile 
     * @param {Integer} PolicyType 
     * @returns {NTSTATUS} 
     */
    static ClfsMgmtRemovePolicy(LogFile, PolicyType) {
        result := DllCall("CLFS.SYS\ClfsMgmtRemovePolicy", "ptr", LogFile, "int", PolicyType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} LogFile 
     * @param {Pointer<Integer>} NewSizeInContainers 
     * @param {Pointer<Integer>} ResultingSizeInContainers 
     * @param {Pointer<PCLFS_SET_LOG_SIZE_COMPLETE_CALLBACK>} CompletionRoutine 
     * @param {Pointer<Void>} CompletionRoutineData 
     * @returns {NTSTATUS} 
     */
    static ClfsMgmtSetLogFileSize(LogFile, NewSizeInContainers, ResultingSizeInContainers, CompletionRoutine, CompletionRoutineData) {
        NewSizeInContainersMarshal := NewSizeInContainers is VarRef ? "uint*" : "ptr"
        ResultingSizeInContainersMarshal := ResultingSizeInContainers is VarRef ? "uint*" : "ptr"
        CompletionRoutineDataMarshal := CompletionRoutineData is VarRef ? "ptr" : "ptr"

        result := DllCall("CLFS.SYS\ClfsMgmtSetLogFileSize", "ptr", LogFile, NewSizeInContainersMarshal, NewSizeInContainers, ResultingSizeInContainersMarshal, ResultingSizeInContainers, "ptr", CompletionRoutine, CompletionRoutineDataMarshal, CompletionRoutineData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} LogFile 
     * @param {Pointer<Pointer<Void>>} ClientCookie 
     * @param {Pointer<Integer>} NewSizeInContainers 
     * @param {Pointer<Integer>} ResultingSizeInContainers 
     * @param {Pointer<PCLFS_SET_LOG_SIZE_COMPLETE_CALLBACK>} CompletionRoutine 
     * @param {Pointer<Void>} CompletionRoutineData 
     * @returns {NTSTATUS} 
     */
    static ClfsMgmtSetLogFileSizeAsClient(LogFile, ClientCookie, NewSizeInContainers, ResultingSizeInContainers, CompletionRoutine, CompletionRoutineData) {
        ClientCookieMarshal := ClientCookie is VarRef ? "ptr*" : "ptr"
        NewSizeInContainersMarshal := NewSizeInContainers is VarRef ? "uint*" : "ptr"
        ResultingSizeInContainersMarshal := ResultingSizeInContainers is VarRef ? "uint*" : "ptr"
        CompletionRoutineDataMarshal := CompletionRoutineData is VarRef ? "ptr" : "ptr"

        result := DllCall("CLFS.SYS\ClfsMgmtSetLogFileSizeAsClient", "ptr", LogFile, ClientCookieMarshal, ClientCookie, NewSizeInContainersMarshal, NewSizeInContainers, ResultingSizeInContainersMarshal, ResultingSizeInContainers, "ptr", CompletionRoutine, CompletionRoutineDataMarshal, CompletionRoutineData, "int")
        return result
    }

    /**
     * 
     * @returns {NTSTATUS} 
     */
    static ClfsInitialize() {
        result := DllCall("CLFS.SYS\ClfsInitialize", "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static ClfsFinalize() {
        DllCall("CLFS.SYS\ClfsFinalize")
    }

    /**
     * 
     * @param {Pointer<Pointer<FILE_OBJECT>>} pplfoLog 
     * @param {Pointer<UNICODE_STRING>} puszLogFileName 
     * @param {Integer} fDesiredAccess 
     * @param {Integer} dwShareMode 
     * @param {PSECURITY_DESCRIPTOR} psdLogFile 
     * @param {Integer} fCreateDisposition 
     * @param {Integer} fCreateOptions 
     * @param {Integer} fFlagsAndAttributes 
     * @param {Integer} fLogOptionFlag 
     * @param {Pointer} pvContext 
     * @param {Integer} cbContext 
     * @returns {NTSTATUS} 
     */
    static ClfsCreateLogFile(pplfoLog, puszLogFileName, fDesiredAccess, dwShareMode, psdLogFile, fCreateDisposition, fCreateOptions, fFlagsAndAttributes, fLogOptionFlag, pvContext, cbContext) {
        psdLogFile := psdLogFile is Win32Handle ? NumGet(psdLogFile, "ptr") : psdLogFile

        pplfoLogMarshal := pplfoLog is VarRef ? "ptr*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsCreateLogFile", pplfoLogMarshal, pplfoLog, "ptr", puszLogFileName, "uint", fDesiredAccess, "uint", dwShareMode, "ptr", psdLogFile, "uint", fCreateDisposition, "uint", fCreateOptions, "uint", fFlagsAndAttributes, "uint", fLogOptionFlag, "ptr", pvContext, "uint", cbContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @returns {NTSTATUS} 
     */
    static ClfsDeleteLogByPointer(plfoLog) {
        result := DllCall("CLFS.SYS\ClfsDeleteLogByPointer", "ptr", plfoLog, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} puszLogFileName 
     * @param {Pointer<Void>} pvReserved 
     * @param {Integer} fLogOptionFlag 
     * @param {Pointer} pvContext 
     * @param {Integer} cbContext 
     * @returns {NTSTATUS} 
     */
    static ClfsDeleteLogFile(puszLogFileName, pvReserved, fLogOptionFlag, pvContext, cbContext) {
        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

        result := DllCall("CLFS.SYS\ClfsDeleteLogFile", "ptr", puszLogFileName, pvReservedMarshal, pvReserved, "uint", fLogOptionFlag, "ptr", pvContext, "uint", cbContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @param {Pointer<Integer>} pcbContainer 
     * @param {Pointer<UNICODE_STRING>} puszContainerPath 
     * @returns {NTSTATUS} 
     */
    static ClfsAddLogContainer(plfoLog, pcbContainer, puszContainerPath) {
        pcbContainerMarshal := pcbContainer is VarRef ? "uint*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsAddLogContainer", "ptr", plfoLog, pcbContainerMarshal, pcbContainer, "ptr", puszContainerPath, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @param {Integer} cContainers 
     * @param {Pointer<Integer>} pcbContainer 
     * @param {Pointer<UNICODE_STRING>} rguszContainerPath 
     * @returns {NTSTATUS} 
     */
    static ClfsAddLogContainerSet(plfoLog, cContainers, pcbContainer, rguszContainerPath) {
        pcbContainerMarshal := pcbContainer is VarRef ? "uint*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsAddLogContainerSet", "ptr", plfoLog, "ushort", cContainers, pcbContainerMarshal, pcbContainer, "ptr", rguszContainerPath, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @param {Pointer<UNICODE_STRING>} puszContainerPath 
     * @param {BOOLEAN} fForce 
     * @returns {NTSTATUS} 
     */
    static ClfsRemoveLogContainer(plfoLog, puszContainerPath, fForce) {
        result := DllCall("CLFS.SYS\ClfsRemoveLogContainer", "ptr", plfoLog, "ptr", puszContainerPath, "char", fForce, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @param {Integer} cContainers 
     * @param {Pointer<UNICODE_STRING>} rgwszContainerPath 
     * @param {BOOLEAN} fForce 
     * @returns {NTSTATUS} 
     */
    static ClfsRemoveLogContainerSet(plfoLog, cContainers, rgwszContainerPath, fForce) {
        result := DllCall("CLFS.SYS\ClfsRemoveLogContainerSet", "ptr", plfoLog, "ushort", cContainers, "ptr", rgwszContainerPath, "char", fForce, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @param {Pointer<CLS_LSN>} plsnArchiveTail 
     * @returns {NTSTATUS} 
     */
    static ClfsSetArchiveTail(plfoLog, plsnArchiveTail) {
        result := DllCall("CLFS.SYS\ClfsSetArchiveTail", "ptr", plfoLog, "ptr", plsnArchiveTail, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @param {Pointer<CLS_LSN>} plsnEnd 
     * @returns {NTSTATUS} 
     */
    static ClfsSetEndOfLog(plfoLog, plsnEnd) {
        result := DllCall("CLFS.SYS\ClfsSetEndOfLog", "ptr", plfoLog, "ptr", plsnEnd, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @param {Integer} cFromContainer 
     * @param {Integer} cContainers 
     * @param {Integer} eScanMode 
     * @param {Pointer<CLS_SCAN_CONTEXT>} pcxScan 
     * @returns {NTSTATUS} 
     */
    static ClfsCreateScanContext(plfoLog, cFromContainer, cContainers, eScanMode, pcxScan) {
        result := DllCall("CLFS.SYS\ClfsCreateScanContext", "ptr", plfoLog, "uint", cFromContainer, "uint", cContainers, "char", eScanMode, "ptr", pcxScan, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CLS_SCAN_CONTEXT>} pcxScan 
     * @param {Integer} eScanMode 
     * @returns {NTSTATUS} 
     */
    static ClfsScanLogContainers(pcxScan, eScanMode) {
        result := DllCall("CLFS.SYS\ClfsScanLogContainers", "ptr", pcxScan, "char", eScanMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @param {Integer} cidLogicalContainer 
     * @param {Pointer<UNICODE_STRING>} puszContainerName 
     * @param {Pointer<Integer>} pcActualLenContainerName 
     * @returns {NTSTATUS} 
     */
    static ClfsGetContainerName(plfoLog, cidLogicalContainer, puszContainerName, pcActualLenContainerName) {
        pcActualLenContainerNameMarshal := pcActualLenContainerName is VarRef ? "uint*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsGetContainerName", "ptr", plfoLog, "uint", cidLogicalContainer, "ptr", puszContainerName, pcActualLenContainerNameMarshal, pcActualLenContainerName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @param {Pointer} pinfoBuffer 
     * @param {Pointer<Integer>} pcbInfoBuffer 
     * @returns {NTSTATUS} 
     */
    static ClfsGetLogFileInformation(plfoLog, pinfoBuffer, pcbInfoBuffer) {
        pcbInfoBufferMarshal := pcbInfoBuffer is VarRef ? "uint*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsGetLogFileInformation", "ptr", plfoLog, "ptr", pinfoBuffer, pcbInfoBufferMarshal, pcbInfoBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @param {Integer} eInformationClass 
     * @param {Pointer} pinfoInputBuffer 
     * @param {Integer} cbinfoInputBuffer 
     * @param {Pointer} pinfoBuffer 
     * @param {Pointer<Integer>} pcbInfoBuffer 
     * @returns {NTSTATUS} 
     */
    static ClfsQueryLogFileInformation(plfoLog, eInformationClass, pinfoInputBuffer, cbinfoInputBuffer, pinfoBuffer, pcbInfoBuffer) {
        pcbInfoBufferMarshal := pcbInfoBuffer is VarRef ? "uint*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsQueryLogFileInformation", "ptr", plfoLog, "int", eInformationClass, "ptr", pinfoInputBuffer, "uint", cbinfoInputBuffer, "ptr", pinfoBuffer, pcbInfoBufferMarshal, pcbInfoBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @param {Integer} eInformationClass 
     * @param {Pointer} pinfoBuffer 
     * @param {Integer} cbBuffer 
     * @returns {NTSTATUS} 
     */
    static ClfsSetLogFileInformation(plfoLog, eInformationClass, pinfoBuffer, cbBuffer) {
        result := DllCall("CLFS.SYS\ClfsSetLogFileInformation", "ptr", plfoLog, "int", eInformationClass, "ptr", pinfoBuffer, "uint", cbBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvMarshalContext 
     * @param {Pointer<Pointer<Void>>} ppvRestartBuffer 
     * @param {Pointer<Integer>} pcbRestartBuffer 
     * @param {Pointer<CLS_LSN>} plsn 
     * @param {Pointer<Pointer<Void>>} ppvReadContext 
     * @returns {NTSTATUS} 
     */
    static ClfsReadRestartArea(pvMarshalContext, ppvRestartBuffer, pcbRestartBuffer, plsn, ppvReadContext) {
        pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
        ppvRestartBufferMarshal := ppvRestartBuffer is VarRef ? "ptr*" : "ptr"
        pcbRestartBufferMarshal := pcbRestartBuffer is VarRef ? "uint*" : "ptr"
        ppvReadContextMarshal := ppvReadContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsReadRestartArea", pvMarshalContextMarshal, pvMarshalContext, ppvRestartBufferMarshal, ppvRestartBuffer, pcbRestartBufferMarshal, pcbRestartBuffer, "ptr", plsn, ppvReadContextMarshal, ppvReadContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvReadContext 
     * @param {Pointer<Pointer<Void>>} ppvRestartBuffer 
     * @param {Pointer<Integer>} pcbRestartBuffer 
     * @param {Pointer<CLS_LSN>} plsnRestart 
     * @returns {NTSTATUS} 
     */
    static ClfsReadPreviousRestartArea(pvReadContext, ppvRestartBuffer, pcbRestartBuffer, plsnRestart) {
        pvReadContextMarshal := pvReadContext is VarRef ? "ptr" : "ptr"
        ppvRestartBufferMarshal := ppvRestartBuffer is VarRef ? "ptr*" : "ptr"
        pcbRestartBufferMarshal := pcbRestartBuffer is VarRef ? "uint*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsReadPreviousRestartArea", pvReadContextMarshal, pvReadContext, ppvRestartBufferMarshal, ppvRestartBuffer, pcbRestartBufferMarshal, pcbRestartBuffer, "ptr", plsnRestart, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvMarshalContext 
     * @param {Pointer} pvRestartBuffer 
     * @param {Integer} cbRestartBuffer 
     * @param {Pointer<CLS_LSN>} plsnBase 
     * @param {Integer} fFlags 
     * @param {Pointer<Integer>} pcbWritten 
     * @param {Pointer<CLS_LSN>} plsnNext 
     * @returns {NTSTATUS} 
     */
    static ClfsWriteRestartArea(pvMarshalContext, pvRestartBuffer, cbRestartBuffer, plsnBase, fFlags, pcbWritten, plsnNext) {
        pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
        pcbWrittenMarshal := pcbWritten is VarRef ? "uint*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsWriteRestartArea", pvMarshalContextMarshal, pvMarshalContext, "ptr", pvRestartBuffer, "uint", cbRestartBuffer, "ptr", plsnBase, "uint", fFlags, pcbWrittenMarshal, pcbWritten, "ptr", plsnNext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvMarshalContext 
     * @param {Pointer<CLS_LSN>} plsnBase 
     * @param {Integer} fFlags 
     * @returns {NTSTATUS} 
     */
    static ClfsAdvanceLogBase(pvMarshalContext, plsnBase, fFlags) {
        pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"

        result := DllCall("CLFS.SYS\ClfsAdvanceLogBase", pvMarshalContextMarshal, pvMarshalContext, "ptr", plsnBase, "uint", fFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @returns {NTSTATUS} 
     */
    static ClfsCloseAndResetLogFile(plfoLog) {
        result := DllCall("CLFS.SYS\ClfsCloseAndResetLogFile", "ptr", plfoLog, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @returns {NTSTATUS} 
     */
    static ClfsCloseLogFileObject(plfoLog) {
        result := DllCall("CLFS.SYS\ClfsCloseLogFileObject", "ptr", plfoLog, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @param {Integer} ePoolType 
     * @param {Pointer<PALLOCATE_FUNCTION>} pfnAllocBuffer 
     * @param {Pointer<PFREE_FUNCTION>} pfnFreeBuffer 
     * @param {Integer} cbMarshallingBuffer 
     * @param {Integer} cMaxWriteBuffers 
     * @param {Integer} cMaxReadBuffers 
     * @param {Pointer<Pointer<Void>>} ppvMarshalContext 
     * @returns {NTSTATUS} 
     */
    static ClfsCreateMarshallingArea(plfoLog, ePoolType, pfnAllocBuffer, pfnFreeBuffer, cbMarshallingBuffer, cMaxWriteBuffers, cMaxReadBuffers, ppvMarshalContext) {
        ppvMarshalContextMarshal := ppvMarshalContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsCreateMarshallingArea", "ptr", plfoLog, "int", ePoolType, "ptr", pfnAllocBuffer, "ptr", pfnFreeBuffer, "uint", cbMarshallingBuffer, "uint", cMaxWriteBuffers, "uint", cMaxReadBuffers, ppvMarshalContextMarshal, ppvMarshalContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @param {Integer} ePoolType 
     * @param {Pointer<PALLOCATE_FUNCTION>} pfnAllocBuffer 
     * @param {Pointer<PFREE_FUNCTION>} pfnFreeBuffer 
     * @param {Integer} cbMarshallingBuffer 
     * @param {Integer} cMaxWriteBuffers 
     * @param {Integer} cMaxReadBuffers 
     * @param {Integer} cAlignmentSize 
     * @param {Integer} fFlags 
     * @param {Pointer<Pointer<Void>>} ppvMarshalContext 
     * @returns {NTSTATUS} 
     */
    static ClfsCreateMarshallingAreaEx(plfoLog, ePoolType, pfnAllocBuffer, pfnFreeBuffer, cbMarshallingBuffer, cMaxWriteBuffers, cMaxReadBuffers, cAlignmentSize, fFlags, ppvMarshalContext) {
        ppvMarshalContextMarshal := ppvMarshalContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsCreateMarshallingAreaEx", "ptr", plfoLog, "int", ePoolType, "ptr", pfnAllocBuffer, "ptr", pfnFreeBuffer, "uint", cbMarshallingBuffer, "uint", cMaxWriteBuffers, "uint", cMaxReadBuffers, "uint", cAlignmentSize, "uint", fFlags, ppvMarshalContextMarshal, ppvMarshalContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvMarshalContext 
     * @returns {NTSTATUS} 
     */
    static ClfsDeleteMarshallingArea(pvMarshalContext) {
        pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"

        result := DllCall("CLFS.SYS\ClfsDeleteMarshallingArea", pvMarshalContextMarshal, pvMarshalContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvMarshalContext 
     * @param {Pointer<CLS_WRITE_ENTRY>} rgWriteEntries 
     * @param {Integer} cWriteEntries 
     * @param {Pointer<CLS_LSN>} plsnUndoNext 
     * @param {Pointer<CLS_LSN>} plsnPrevious 
     * @param {Integer} cReserveRecords 
     * @param {Pointer<Integer>} rgcbReservation 
     * @param {Integer} fFlags 
     * @param {Pointer<CLS_LSN>} plsn 
     * @returns {NTSTATUS} 
     */
    static ClfsReserveAndAppendLog(pvMarshalContext, rgWriteEntries, cWriteEntries, plsnUndoNext, plsnPrevious, cReserveRecords, rgcbReservation, fFlags, plsn) {
        pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
        rgcbReservationMarshal := rgcbReservation is VarRef ? "int64*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsReserveAndAppendLog", pvMarshalContextMarshal, pvMarshalContext, "ptr", rgWriteEntries, "uint", cWriteEntries, "ptr", plsnUndoNext, "ptr", plsnPrevious, "uint", cReserveRecords, rgcbReservationMarshal, rgcbReservation, "uint", fFlags, "ptr", plsn, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvMarshalContext 
     * @param {Pointer<CLS_WRITE_ENTRY>} rgWriteEntries 
     * @param {Integer} cWriteEntries 
     * @param {Integer} cbEntryAlignment 
     * @param {Pointer<CLS_LSN>} plsnUndoNext 
     * @param {Pointer<CLS_LSN>} plsnPrevious 
     * @param {Integer} cReserveRecords 
     * @param {Pointer<Integer>} rgcbReservation 
     * @param {Integer} fFlags 
     * @param {Pointer<CLS_LSN>} plsn 
     * @returns {NTSTATUS} 
     */
    static ClfsReserveAndAppendLogAligned(pvMarshalContext, rgWriteEntries, cWriteEntries, cbEntryAlignment, plsnUndoNext, plsnPrevious, cReserveRecords, rgcbReservation, fFlags, plsn) {
        pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
        rgcbReservationMarshal := rgcbReservation is VarRef ? "int64*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsReserveAndAppendLogAligned", pvMarshalContextMarshal, pvMarshalContext, "ptr", rgWriteEntries, "uint", cWriteEntries, "uint", cbEntryAlignment, "ptr", plsnUndoNext, "ptr", plsnPrevious, "uint", cReserveRecords, rgcbReservationMarshal, rgcbReservation, "uint", fFlags, "ptr", plsn, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvMarshalContext 
     * @param {Integer} cRecords 
     * @param {Pointer<Integer>} rgcbReservation 
     * @param {Pointer<Integer>} pcbAlignReservation 
     * @returns {NTSTATUS} 
     */
    static ClfsAlignReservedLog(pvMarshalContext, cRecords, rgcbReservation, pcbAlignReservation) {
        pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
        rgcbReservationMarshal := rgcbReservation is VarRef ? "int64*" : "ptr"
        pcbAlignReservationMarshal := pcbAlignReservation is VarRef ? "int64*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsAlignReservedLog", pvMarshalContextMarshal, pvMarshalContext, "uint", cRecords, rgcbReservationMarshal, rgcbReservation, pcbAlignReservationMarshal, pcbAlignReservation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvMarshalContext 
     * @param {Integer} cRecords 
     * @param {Pointer<Integer>} pcbAdjustment 
     * @returns {NTSTATUS} 
     */
    static ClfsAllocReservedLog(pvMarshalContext, cRecords, pcbAdjustment) {
        pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
        pcbAdjustmentMarshal := pcbAdjustment is VarRef ? "int64*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsAllocReservedLog", pvMarshalContextMarshal, pvMarshalContext, "uint", cRecords, pcbAdjustmentMarshal, pcbAdjustment, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvMarshalContext 
     * @param {Integer} cRecords 
     * @param {Pointer<Integer>} pcbAdjustment 
     * @returns {NTSTATUS} 
     */
    static ClfsFreeReservedLog(pvMarshalContext, cRecords, pcbAdjustment) {
        pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
        pcbAdjustmentMarshal := pcbAdjustment is VarRef ? "int64*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsFreeReservedLog", pvMarshalContextMarshal, pvMarshalContext, "uint", cRecords, pcbAdjustmentMarshal, pcbAdjustment, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvMarshalContext 
     * @returns {NTSTATUS} 
     */
    static ClfsFlushBuffers(pvMarshalContext) {
        pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"

        result := DllCall("CLFS.SYS\ClfsFlushBuffers", pvMarshalContextMarshal, pvMarshalContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvMarshalContext 
     * @param {Pointer<CLS_LSN>} plsnFlush 
     * @param {Pointer<CLS_LSN>} plsnLastFlushed 
     * @returns {NTSTATUS} 
     */
    static ClfsFlushToLsn(pvMarshalContext, plsnFlush, plsnLastFlushed) {
        pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"

        result := DllCall("CLFS.SYS\ClfsFlushToLsn", pvMarshalContextMarshal, pvMarshalContext, "ptr", plsnFlush, "ptr", plsnLastFlushed, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvMarshalContext 
     * @param {Pointer<CLS_LSN>} plsnFirst 
     * @param {Integer} peContextMode 
     * @param {Pointer<Pointer<Void>>} ppvReadBuffer 
     * @param {Pointer<Integer>} pcbReadBuffer 
     * @param {Pointer<Integer>} peRecordType 
     * @param {Pointer<CLS_LSN>} plsnUndoNext 
     * @param {Pointer<CLS_LSN>} plsnPrevious 
     * @param {Pointer<Pointer<Void>>} ppvReadContext 
     * @returns {NTSTATUS} 
     */
    static ClfsReadLogRecord(pvMarshalContext, plsnFirst, peContextMode, ppvReadBuffer, pcbReadBuffer, peRecordType, plsnUndoNext, plsnPrevious, ppvReadContext) {
        pvMarshalContextMarshal := pvMarshalContext is VarRef ? "ptr" : "ptr"
        ppvReadBufferMarshal := ppvReadBuffer is VarRef ? "ptr*" : "ptr"
        pcbReadBufferMarshal := pcbReadBuffer is VarRef ? "uint*" : "ptr"
        peRecordTypeMarshal := peRecordType is VarRef ? "char*" : "ptr"
        ppvReadContextMarshal := ppvReadContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsReadLogRecord", pvMarshalContextMarshal, pvMarshalContext, "ptr", plsnFirst, "int", peContextMode, ppvReadBufferMarshal, ppvReadBuffer, pcbReadBufferMarshal, pcbReadBuffer, peRecordTypeMarshal, peRecordType, "ptr", plsnUndoNext, "ptr", plsnPrevious, ppvReadContextMarshal, ppvReadContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvReadContext 
     * @param {Pointer<Pointer<Void>>} ppvBuffer 
     * @param {Pointer<Integer>} pcbBuffer 
     * @param {Pointer<Integer>} peRecordType 
     * @param {Pointer<CLS_LSN>} plsnUser 
     * @param {Pointer<CLS_LSN>} plsnUndoNext 
     * @param {Pointer<CLS_LSN>} plsnPrevious 
     * @param {Pointer<CLS_LSN>} plsnRecord 
     * @returns {NTSTATUS} 
     */
    static ClfsReadNextLogRecord(pvReadContext, ppvBuffer, pcbBuffer, peRecordType, plsnUser, plsnUndoNext, plsnPrevious, plsnRecord) {
        pvReadContextMarshal := pvReadContext is VarRef ? "ptr" : "ptr"
        ppvBufferMarshal := ppvBuffer is VarRef ? "ptr*" : "ptr"
        pcbBufferMarshal := pcbBuffer is VarRef ? "uint*" : "ptr"
        peRecordTypeMarshal := peRecordType is VarRef ? "char*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsReadNextLogRecord", pvReadContextMarshal, pvReadContext, ppvBufferMarshal, ppvBuffer, pcbBufferMarshal, pcbBuffer, peRecordTypeMarshal, peRecordType, "ptr", plsnUser, "ptr", plsnUndoNext, "ptr", plsnPrevious, "ptr", plsnRecord, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvCursorContext 
     * @returns {NTSTATUS} 
     */
    static ClfsTerminateReadLog(pvCursorContext) {
        pvCursorContextMarshal := pvCursorContext is VarRef ? "ptr" : "ptr"

        result := DllCall("CLFS.SYS\ClfsTerminateReadLog", pvCursorContextMarshal, pvCursorContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} plfoLog 
     * @param {Pointer} pvStatsBuffer 
     * @param {Integer} cbStatsBuffer 
     * @param {Integer} eStatsClass 
     * @param {Pointer<Integer>} pcbStatsWritten 
     * @returns {NTSTATUS} 
     */
    static ClfsGetIoStatistics(plfoLog, pvStatsBuffer, cbStatsBuffer, eStatsClass, pcbStatsWritten) {
        pcbStatsWrittenMarshal := pcbStatsWritten is VarRef ? "uint*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsGetIoStatistics", "ptr", plfoLog, "ptr", pvStatsBuffer, "uint", cbStatsBuffer, "int", eStatsClass, pcbStatsWrittenMarshal, pcbStatsWritten, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CLS_LSN>} plsn 
     * @returns {CLS_LSN} 
     */
    static ClfsLaterLsn(plsn) {
        result := DllCall("CLFS.SYS\ClfsLaterLsn", "ptr", plsn, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<CLS_LSN>} plsn 
     * @returns {CLS_LSN} 
     */
    static ClfsEarlierLsn(plsn) {
        result := DllCall("CLFS.SYS\ClfsEarlierLsn", "ptr", plsn, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<CLS_LSN>} plsnStart 
     * @param {Pointer<CLS_LSN>} plsnFinish 
     * @param {Integer} cbContainer 
     * @param {Integer} cbMaxBlock 
     * @param {Pointer<Integer>} pcbDifference 
     * @returns {NTSTATUS} 
     */
    static ClfsLsnDifference(plsnStart, plsnFinish, cbContainer, cbMaxBlock, pcbDifference) {
        pcbDifferenceMarshal := pcbDifference is VarRef ? "int64*" : "ptr"

        result := DllCall("CLFS.SYS\ClfsLsnDifference", "ptr", plsnStart, "ptr", plsnFinish, "uint", cbContainer, "uint", cbMaxBlock, pcbDifferenceMarshal, pcbDifference, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} TransactionManager 
     * @param {Pointer<UNICODE_STRING>} LogFileName 
     * @param {Pointer<Guid>} TmId 
     * @param {Integer} CreateOptions 
     * @returns {NTSTATUS} 
     */
    static TmInitializeTransactionManager(TransactionManager, LogFileName, TmId, CreateOptions) {
        TransactionManagerMarshal := TransactionManager is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmInitializeTransactionManager", TransactionManagerMarshal, TransactionManager, "ptr", LogFileName, "ptr", TmId, "uint", CreateOptions, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} LogFileName 
     * @param {Pointer<Guid>} ExistingTransactionManagerGuid 
     * @returns {NTSTATUS} 
     */
    static TmRenameTransactionManager(LogFileName, ExistingTransactionManagerGuid) {
        result := DllCall("ntoskrnl.exe\TmRenameTransactionManager", "ptr", LogFileName, "ptr", ExistingTransactionManagerGuid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KTM>} Tm 
     * @param {Pointer<Integer>} TargetVirtualClock 
     * @returns {NTSTATUS} 
     */
    static TmRecoverTransactionManager(Tm, TargetVirtualClock) {
        TmMarshal := Tm is VarRef ? "ptr*" : "ptr"
        TargetVirtualClockMarshal := TargetVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmRecoverTransactionManager", TmMarshal, Tm, TargetVirtualClockMarshal, TargetVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @param {BOOLEAN} Wait 
     * @returns {NTSTATUS} 
     */
    static TmCommitTransaction(Transaction, Wait) {
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmCommitTransaction", TransactionMarshal, Transaction, "char", Wait, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @param {BOOLEAN} Wait 
     * @returns {NTSTATUS} 
     */
    static TmRollbackTransaction(Transaction, Wait) {
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmRollbackTransaction", TransactionMarshal, Transaction, "char", Wait, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} EnlistmentHandle 
     * @param {Integer} PreviousMode 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<Pointer>} ResourceManager 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @param {Integer} CreateOptions 
     * @param {Integer} NotificationMask 
     * @param {Pointer<Void>} EnlistmentKey 
     * @returns {NTSTATUS} 
     */
    static TmCreateEnlistment(EnlistmentHandle, PreviousMode, DesiredAccess, ObjectAttributes, ResourceManager, Transaction, CreateOptions, NotificationMask, EnlistmentKey) {
        ResourceManagerMarshal := ResourceManager is VarRef ? "ptr*" : "ptr"
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"
        EnlistmentKeyMarshal := EnlistmentKey is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\TmCreateEnlistment", "ptr", EnlistmentHandle, "char", PreviousMode, "uint", DesiredAccess, "ptr", ObjectAttributes, ResourceManagerMarshal, ResourceManager, TransactionMarshal, Transaction, "uint", CreateOptions, "uint", NotificationMask, EnlistmentKeyMarshal, EnlistmentKey, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} Enlistment 
     * @param {Pointer<Void>} EnlistmentKey 
     * @returns {NTSTATUS} 
     */
    static TmRecoverEnlistment(Enlistment, EnlistmentKey) {
        EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
        EnlistmentKeyMarshal := EnlistmentKey is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\TmRecoverEnlistment", EnlistmentMarshal, Enlistment, EnlistmentKeyMarshal, EnlistmentKey, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} Enlistment 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static TmPrePrepareEnlistment(Enlistment, TmVirtualClock) {
        EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmPrePrepareEnlistment", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} Enlistment 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static TmPrepareEnlistment(Enlistment, TmVirtualClock) {
        EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmPrepareEnlistment", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} Enlistment 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static TmCommitEnlistment(Enlistment, TmVirtualClock) {
        EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmCommitEnlistment", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} Enlistment 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static TmRollbackEnlistment(Enlistment, TmVirtualClock) {
        EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmRollbackEnlistment", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} Enlistment 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static TmPrePrepareComplete(Enlistment, TmVirtualClock) {
        EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmPrePrepareComplete", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} Enlistment 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static TmPrepareComplete(Enlistment, TmVirtualClock) {
        EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmPrepareComplete", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} Enlistment 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static TmReadOnlyEnlistment(Enlistment, TmVirtualClock) {
        EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmReadOnlyEnlistment", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} Enlistment 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static TmCommitComplete(Enlistment, TmVirtualClock) {
        EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmCommitComplete", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} Enlistment 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static TmRollbackComplete(Enlistment, TmVirtualClock) {
        EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmRollbackComplete", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} Enlistment 
     * @param {Pointer<Pointer<Void>>} Key 
     * @returns {NTSTATUS} 
     */
    static TmReferenceEnlistmentKey(Enlistment, Key) {
        EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
        KeyMarshal := Key is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmReferenceEnlistmentKey", EnlistmentMarshal, Enlistment, KeyMarshal, Key, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} Enlistment 
     * @param {Pointer<BOOLEAN>} LastReference 
     * @returns {NTSTATUS} 
     */
    static TmDereferenceEnlistmentKey(Enlistment, LastReference) {
        EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
        LastReferenceMarshal := LastReference is VarRef ? "char*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmDereferenceEnlistmentKey", EnlistmentMarshal, Enlistment, LastReferenceMarshal, LastReference, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} Enlistment 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static TmSinglePhaseReject(Enlistment, TmVirtualClock) {
        EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmSinglePhaseReject", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KENLISTMENT>} Enlistment 
     * @param {Pointer<Integer>} TmVirtualClock 
     * @returns {NTSTATUS} 
     */
    static TmRequestOutcomeEnlistment(Enlistment, TmVirtualClock) {
        EnlistmentMarshal := Enlistment is VarRef ? "ptr*" : "ptr"
        TmVirtualClockMarshal := TmVirtualClock is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmRequestOutcomeEnlistment", EnlistmentMarshal, Enlistment, TmVirtualClockMarshal, TmVirtualClock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KRESOURCEMANAGER>} ResourceManager 
     * @param {Pointer<PTM_RM_NOTIFICATION>} CallbackRoutine 
     * @param {Pointer<Void>} RMKey 
     * @returns {NTSTATUS} 
     */
    static TmEnableCallbacks(ResourceManager, CallbackRoutine, RMKey) {
        ResourceManagerMarshal := ResourceManager is VarRef ? "ptr*" : "ptr"
        RMKeyMarshal := RMKey is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\TmEnableCallbacks", ResourceManagerMarshal, ResourceManager, "ptr", CallbackRoutine, RMKeyMarshal, RMKey, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KRESOURCEMANAGER>} ResourceManager 
     * @returns {NTSTATUS} 
     */
    static TmRecoverResourceManager(ResourceManager) {
        ResourceManagerMarshal := ResourceManager is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmRecoverResourceManager", ResourceManagerMarshal, ResourceManager, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KRESOURCEMANAGER>} ResourceManager 
     * @param {Integer} RequestCookie 
     * @param {Integer} BufferLength 
     * @param {Pointer<Void>} Buffer_R 
     * @returns {NTSTATUS} 
     */
    static TmPropagationComplete(ResourceManager, RequestCookie, BufferLength, Buffer_R) {
        ResourceManagerMarshal := ResourceManager is VarRef ? "ptr*" : "ptr"
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\TmPropagationComplete", ResourceManagerMarshal, ResourceManager, "uint", RequestCookie, "uint", BufferLength, Buffer_RMarshal, Buffer_R, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KRESOURCEMANAGER>} ResourceManager 
     * @param {Integer} RequestCookie 
     * @param {NTSTATUS} Status 
     * @returns {NTSTATUS} 
     */
    static TmPropagationFailed(ResourceManager, RequestCookie, Status) {
        ResourceManagerMarshal := ResourceManager is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmPropagationFailed", ResourceManagerMarshal, ResourceManager, "uint", RequestCookie, "int", Status, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @param {Pointer<Guid>} TransactionId 
     * @returns {String} Nothing - always returns an empty string
     */
    static TmGetTransactionId(Transaction, TransactionId) {
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\TmGetTransactionId", TransactionMarshal, Transaction, "ptr", TransactionId)
    }

    /**
     * 
     * @param {Pointer<KTRANSACTION>} Transaction 
     * @returns {BOOLEAN} 
     */
    static TmIsTransactionActive(Transaction) {
        TransactionMarshal := Transaction is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\TmIsTransactionActive", TransactionMarshal, Transaction, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<PPCW_REGISTRATION>} Registration 
     * @param {Pointer<PCW_REGISTRATION_INFORMATION>} Info 
     * @returns {NTSTATUS} 
     */
    static PcwRegister(Registration, Info) {
        RegistrationMarshal := Registration is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PcwRegister", RegistrationMarshal, Registration, "ptr", Info, "int")
        return result
    }

    /**
     * 
     * @param {PPCW_REGISTRATION} Registration 
     * @returns {String} Nothing - always returns an empty string
     */
    static PcwUnregister(Registration) {
        DllCall("ntoskrnl.exe\PcwUnregister", "ptr", Registration)
    }

    /**
     * 
     * @param {Pointer<PPCW_INSTANCE>} Instance 
     * @param {PPCW_REGISTRATION} Registration 
     * @param {Pointer<UNICODE_STRING>} Name 
     * @param {Integer} Count 
     * @param {Pointer<PCW_DATA>} Data 
     * @returns {NTSTATUS} 
     */
    static PcwCreateInstance(Instance, Registration, Name, Count, Data) {
        InstanceMarshal := Instance is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PcwCreateInstance", InstanceMarshal, Instance, "ptr", Registration, "ptr", Name, "uint", Count, "ptr", Data, "int")
        return result
    }

    /**
     * 
     * @param {PPCW_INSTANCE} Instance 
     * @returns {String} Nothing - always returns an empty string
     */
    static PcwCloseInstance(Instance) {
        DllCall("ntoskrnl.exe\PcwCloseInstance", "ptr", Instance)
    }

    /**
     * 
     * @param {PPCW_BUFFER} Buffer_R 
     * @param {Pointer<UNICODE_STRING>} Name 
     * @param {Integer} Id 
     * @param {Integer} Count 
     * @param {Pointer<PCW_DATA>} Data 
     * @returns {NTSTATUS} 
     */
    static PcwAddInstance(Buffer_R, Name, Id, Count, Data) {
        result := DllCall("ntoskrnl.exe\PcwAddInstance", "ptr", Buffer_R, "ptr", Name, "uint", Id, "uint", Count, "ptr", Data, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} Handle 
     * @param {PEPROCESS} TargetProcess 
     * @param {Pointer<MDL>} Mdl 
     * @param {Integer} DevicePageProtection 
     * @param {Integer} Attributes 
     * @returns {NTSTATUS} 
     */
    static VslCreateSecureSection(Handle, TargetProcess, Mdl, DevicePageProtection, Attributes) {
        result := DllCall("ntoskrnl.exe\VslCreateSecureSection", "ptr", Handle, "ptr", TargetProcess, "ptr", Mdl, "uint", DevicePageProtection, "uint", Attributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} GlobalHandle 
     * @returns {NTSTATUS} 
     */
    static VslDeleteSecureSection(GlobalHandle) {
        GlobalHandle := GlobalHandle is Win32Handle ? NumGet(GlobalHandle, "ptr") : GlobalHandle

        result := DllCall("ntoskrnl.exe\VslDeleteSecureSection", "ptr", GlobalHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<INIT_ONCE>} RunOnce 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlRunOnceInitialize(RunOnce) {
        DllCall("ntdll.dll\RtlRunOnceInitialize", "ptr", RunOnce)
    }

    /**
     * 
     * @param {Pointer<INIT_ONCE>} RunOnce 
     * @param {Pointer<PRTL_RUN_ONCE_INIT_FN>} InitFn 
     * @param {Pointer<Void>} Parameter 
     * @param {Pointer<Pointer<Void>>} Context 
     * @returns {NTSTATUS} 
     */
    static RtlRunOnceExecuteOnce(RunOnce, InitFn, Parameter, Context) {
        ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\RtlRunOnceExecuteOnce", "ptr", RunOnce, "ptr", InitFn, ParameterMarshal, Parameter, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<INIT_ONCE>} RunOnce 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<Void>>} Context 
     * @returns {NTSTATUS} 
     */
    static RtlRunOnceBeginInitialize(RunOnce, Flags, Context) {
        ContextMarshal := Context is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\RtlRunOnceBeginInitialize", "ptr", RunOnce, "uint", Flags, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<INIT_ONCE>} RunOnce 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static RtlRunOnceComplete(RunOnce, Flags, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlRunOnceComplete", "ptr", RunOnce, "uint", Flags, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @param {Pointer<PRTL_AVL_COMPARE_ROUTINE>} CompareRoutine 
     * @param {Pointer<PRTL_AVL_ALLOCATE_ROUTINE>} AllocateRoutine 
     * @param {Pointer<PRTL_AVL_FREE_ROUTINE>} FreeRoutine 
     * @param {Pointer<Void>} TableContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlInitializeGenericTableAvl(Table, CompareRoutine, AllocateRoutine, FreeRoutine, TableContext) {
        TableContextMarshal := TableContext is VarRef ? "ptr" : "ptr"

        DllCall("ntdll.dll\RtlInitializeGenericTableAvl", "ptr", Table, "ptr", CompareRoutine, "ptr", AllocateRoutine, "ptr", FreeRoutine, TableContextMarshal, TableContext)
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<BOOLEAN>} NewElement 
     * @returns {Pointer<Void>} 
     */
    static RtlInsertElementGenericTableAvl(Table, Buffer_R, BufferSize, NewElement) {
        NewElementMarshal := NewElement is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\RtlInsertElementGenericTableAvl", "ptr", Table, "ptr", Buffer_R, "uint", BufferSize, NewElementMarshal, NewElement, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<BOOLEAN>} NewElement 
     * @param {Pointer<Void>} NodeOrParent 
     * @param {Integer} SearchResult 
     * @returns {Pointer<Void>} 
     */
    static RtlInsertElementGenericTableFullAvl(Table, Buffer_R, BufferSize, NewElement, NodeOrParent, SearchResult) {
        NewElementMarshal := NewElement is VarRef ? "char*" : "ptr"
        NodeOrParentMarshal := NodeOrParent is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlInsertElementGenericTableFullAvl", "ptr", Table, "ptr", Buffer_R, "uint", BufferSize, NewElementMarshal, NewElement, NodeOrParentMarshal, NodeOrParent, "int", SearchResult, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @param {Pointer<Void>} Buffer_R 
     * @returns {BOOLEAN} 
     */
    static RtlDeleteElementGenericTableAvl(Table, Buffer_R) {
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlDeleteElementGenericTableAvl", "ptr", Table, Buffer_RMarshal, Buffer_R, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @param {Pointer<Void>} NodeOrParent 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlDeleteElementGenericTableAvlEx(Table, NodeOrParent) {
        NodeOrParentMarshal := NodeOrParent is VarRef ? "ptr" : "ptr"

        DllCall("ntdll.dll\RtlDeleteElementGenericTableAvlEx", "ptr", Table, NodeOrParentMarshal, NodeOrParent)
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @param {Pointer<Void>} Buffer_R 
     * @returns {Pointer<Void>} 
     */
    static RtlLookupElementGenericTableAvl(Table, Buffer_R) {
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlLookupElementGenericTableAvl", "ptr", Table, Buffer_RMarshal, Buffer_R, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @param {Pointer<Void>} Buffer_R 
     * @param {Pointer<Pointer<Void>>} NodeOrParent 
     * @param {Pointer<Integer>} SearchResult 
     * @returns {Pointer<Void>} 
     */
    static RtlLookupElementGenericTableFullAvl(Table, Buffer_R, NodeOrParent, SearchResult) {
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"
        NodeOrParentMarshal := NodeOrParent is VarRef ? "ptr*" : "ptr"
        SearchResultMarshal := SearchResult is VarRef ? "int*" : "ptr"

        result := DllCall("ntdll.dll\RtlLookupElementGenericTableFullAvl", "ptr", Table, Buffer_RMarshal, Buffer_R, NodeOrParentMarshal, NodeOrParent, SearchResultMarshal, SearchResult, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @param {BOOLEAN} Restart 
     * @returns {Pointer<Void>} 
     */
    static RtlEnumerateGenericTableAvl(Table, Restart) {
        result := DllCall("ntdll.dll\RtlEnumerateGenericTableAvl", "ptr", Table, "char", Restart, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @param {Pointer<Pointer<Void>>} RestartKey 
     * @returns {Pointer<Void>} 
     */
    static RtlEnumerateGenericTableWithoutSplayingAvl(Table, RestartKey) {
        RestartKeyMarshal := RestartKey is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\RtlEnumerateGenericTableWithoutSplayingAvl", "ptr", Table, RestartKeyMarshal, RestartKey, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @param {Pointer<Void>} Buffer_R 
     * @param {Pointer<Pointer<Void>>} RestartKey 
     * @returns {Pointer<Void>} 
     */
    static RtlLookupFirstMatchingElementGenericTableAvl(Table, Buffer_R, RestartKey) {
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"
        RestartKeyMarshal := RestartKey is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\RtlLookupFirstMatchingElementGenericTableAvl", "ptr", Table, Buffer_RMarshal, Buffer_R, RestartKeyMarshal, RestartKey, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @param {Pointer<PRTL_AVL_MATCH_FUNCTION>} MatchFunction 
     * @param {Pointer<Void>} MatchData 
     * @param {Integer} NextFlag 
     * @param {Pointer<Pointer<Void>>} RestartKey 
     * @param {Pointer<Integer>} DeleteCount 
     * @param {Pointer<Void>} Buffer_R 
     * @returns {Pointer<Void>} 
     */
    static RtlEnumerateGenericTableLikeADirectory(Table, MatchFunction, MatchData, NextFlag, RestartKey, DeleteCount, Buffer_R) {
        MatchDataMarshal := MatchData is VarRef ? "ptr" : "ptr"
        RestartKeyMarshal := RestartKey is VarRef ? "ptr*" : "ptr"
        DeleteCountMarshal := DeleteCount is VarRef ? "uint*" : "ptr"
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlEnumerateGenericTableLikeADirectory", "ptr", Table, "ptr", MatchFunction, MatchDataMarshal, MatchData, "uint", NextFlag, RestartKeyMarshal, RestartKey, DeleteCountMarshal, DeleteCount, Buffer_RMarshal, Buffer_R, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @param {Integer} I 
     * @returns {Pointer<Void>} 
     */
    static RtlGetElementGenericTableAvl(Table, I) {
        result := DllCall("ntdll.dll\RtlGetElementGenericTableAvl", "ptr", Table, "uint", I, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @returns {Integer} 
     */
    static RtlNumberGenericTableElementsAvl(Table) {
        result := DllCall("ntdll.dll\RtlNumberGenericTableElementsAvl", "ptr", Table, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @returns {BOOLEAN} 
     */
    static RtlIsGenericTableEmptyAvl(Table) {
        result := DllCall("ntdll.dll\RtlIsGenericTableEmptyAvl", "ptr", Table, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_SPLAY_LINKS>} Links 
     * @returns {Pointer<RTL_SPLAY_LINKS>} 
     */
    static RtlSplay(Links) {
        result := DllCall("ntdll.dll\RtlSplay", "ptr", Links, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_SPLAY_LINKS>} Links 
     * @returns {Pointer<RTL_SPLAY_LINKS>} 
     */
    static RtlDelete(Links) {
        result := DllCall("ntdll.dll\RtlDelete", "ptr", Links, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_SPLAY_LINKS>} Links 
     * @param {Pointer<Pointer<RTL_SPLAY_LINKS>>} Root 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlDeleteNoSplay(Links, Root) {
        RootMarshal := Root is VarRef ? "ptr*" : "ptr"

        DllCall("ntdll.dll\RtlDeleteNoSplay", "ptr", Links, RootMarshal, Root)
    }

    /**
     * 
     * @param {Pointer<RTL_SPLAY_LINKS>} Links 
     * @returns {Pointer<RTL_SPLAY_LINKS>} 
     */
    static RtlSubtreeSuccessor(Links) {
        result := DllCall("ntdll.dll\RtlSubtreeSuccessor", "ptr", Links, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_SPLAY_LINKS>} Links 
     * @returns {Pointer<RTL_SPLAY_LINKS>} 
     */
    static RtlSubtreePredecessor(Links) {
        result := DllCall("ntdll.dll\RtlSubtreePredecessor", "ptr", Links, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_SPLAY_LINKS>} Links 
     * @returns {Pointer<RTL_SPLAY_LINKS>} 
     */
    static RtlRealSuccessor(Links) {
        result := DllCall("ntdll.dll\RtlRealSuccessor", "ptr", Links, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_SPLAY_LINKS>} Links 
     * @returns {Pointer<RTL_SPLAY_LINKS>} 
     */
    static RtlRealPredecessor(Links) {
        result := DllCall("ntdll.dll\RtlRealPredecessor", "ptr", Links, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_GENERIC_TABLE>} Table 
     * @param {Pointer<PRTL_GENERIC_COMPARE_ROUTINE>} CompareRoutine 
     * @param {Pointer<PRTL_GENERIC_ALLOCATE_ROUTINE>} AllocateRoutine 
     * @param {Pointer<PRTL_GENERIC_FREE_ROUTINE>} FreeRoutine 
     * @param {Pointer<Void>} TableContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlInitializeGenericTable(Table, CompareRoutine, AllocateRoutine, FreeRoutine, TableContext) {
        TableContextMarshal := TableContext is VarRef ? "ptr" : "ptr"

        DllCall("ntdll.dll\RtlInitializeGenericTable", "ptr", Table, "ptr", CompareRoutine, "ptr", AllocateRoutine, "ptr", FreeRoutine, TableContextMarshal, TableContext)
    }

    /**
     * 
     * @param {Pointer<RTL_GENERIC_TABLE>} Table 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<BOOLEAN>} NewElement 
     * @returns {Pointer<Void>} 
     */
    static RtlInsertElementGenericTable(Table, Buffer_R, BufferSize, NewElement) {
        NewElementMarshal := NewElement is VarRef ? "char*" : "ptr"

        result := DllCall("ntdll.dll\RtlInsertElementGenericTable", "ptr", Table, "ptr", Buffer_R, "uint", BufferSize, NewElementMarshal, NewElement, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_GENERIC_TABLE>} Table 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @param {Pointer<BOOLEAN>} NewElement 
     * @param {Pointer<Void>} NodeOrParent 
     * @param {Integer} SearchResult 
     * @returns {Pointer<Void>} 
     */
    static RtlInsertElementGenericTableFull(Table, Buffer_R, BufferSize, NewElement, NodeOrParent, SearchResult) {
        NewElementMarshal := NewElement is VarRef ? "char*" : "ptr"
        NodeOrParentMarshal := NodeOrParent is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlInsertElementGenericTableFull", "ptr", Table, "ptr", Buffer_R, "uint", BufferSize, NewElementMarshal, NewElement, NodeOrParentMarshal, NodeOrParent, "int", SearchResult, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_GENERIC_TABLE>} Table 
     * @param {Pointer<Void>} Buffer_R 
     * @returns {BOOLEAN} 
     */
    static RtlDeleteElementGenericTable(Table, Buffer_R) {
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlDeleteElementGenericTable", "ptr", Table, Buffer_RMarshal, Buffer_R, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_GENERIC_TABLE>} Table 
     * @param {Pointer<Void>} Buffer_R 
     * @returns {Pointer<Void>} 
     */
    static RtlLookupElementGenericTable(Table, Buffer_R) {
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlLookupElementGenericTable", "ptr", Table, Buffer_RMarshal, Buffer_R, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_GENERIC_TABLE>} Table 
     * @param {Pointer<Void>} Buffer_R 
     * @param {Pointer<Pointer<Void>>} NodeOrParent 
     * @param {Pointer<Integer>} SearchResult 
     * @returns {Pointer<Void>} 
     */
    static RtlLookupElementGenericTableFull(Table, Buffer_R, NodeOrParent, SearchResult) {
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"
        NodeOrParentMarshal := NodeOrParent is VarRef ? "ptr*" : "ptr"
        SearchResultMarshal := SearchResult is VarRef ? "int*" : "ptr"

        result := DllCall("ntdll.dll\RtlLookupElementGenericTableFull", "ptr", Table, Buffer_RMarshal, Buffer_R, NodeOrParentMarshal, NodeOrParent, SearchResultMarshal, SearchResult, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_GENERIC_TABLE>} Table 
     * @param {BOOLEAN} Restart 
     * @returns {Pointer<Void>} 
     */
    static RtlEnumerateGenericTable(Table, Restart) {
        result := DllCall("ntdll.dll\RtlEnumerateGenericTable", "ptr", Table, "char", Restart, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_GENERIC_TABLE>} Table 
     * @param {Pointer<Pointer<Void>>} RestartKey 
     * @returns {Pointer<Void>} 
     */
    static RtlEnumerateGenericTableWithoutSplaying(Table, RestartKey) {
        RestartKeyMarshal := RestartKey is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\RtlEnumerateGenericTableWithoutSplaying", "ptr", Table, RestartKeyMarshal, RestartKey, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_GENERIC_TABLE>} Table 
     * @param {Integer} I 
     * @returns {Pointer<Void>} 
     */
    static RtlGetElementGenericTable(Table, I) {
        result := DllCall("ntdll.dll\RtlGetElementGenericTable", "ptr", Table, "uint", I, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_GENERIC_TABLE>} Table 
     * @returns {Integer} 
     */
    static RtlNumberGenericTableElements(Table) {
        result := DllCall("ntdll.dll\RtlNumberGenericTableElements", "ptr", Table, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_GENERIC_TABLE>} Table 
     * @returns {BOOLEAN} 
     */
    static RtlIsGenericTableEmpty(Table) {
        result := DllCall("ntdll.dll\RtlIsGenericTableEmpty", "ptr", Table, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<RTL_DYNAMIC_HASH_TABLE>>} HashTable 
     * @param {Integer} Shift 
     * @returns {BOOLEAN} 
     */
    static RtlCreateHashTable(HashTable, Shift) {
        static Flags := 0 ;Reserved parameters must always be NULL

        HashTableMarshal := HashTable is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\RtlCreateHashTable", HashTableMarshal, HashTable, "uint", Shift, "uint", Flags, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<RTL_DYNAMIC_HASH_TABLE>>} HashTable 
     * @param {Integer} InitialSize 
     * @param {Integer} Shift 
     * @returns {BOOLEAN} 
     */
    static RtlCreateHashTableEx(HashTable, InitialSize, Shift) {
        static Flags := 0 ;Reserved parameters must always be NULL

        HashTableMarshal := HashTable is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\RtlCreateHashTableEx", HashTableMarshal, HashTable, "uint", InitialSize, "uint", Shift, "uint", Flags, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlDeleteHashTable(HashTable) {
        DllCall("ntdll.dll\RtlDeleteHashTable", "ptr", HashTable)
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENTRY>} Entry 
     * @param {Pointer} Signature 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_CONTEXT>} Context 
     * @returns {BOOLEAN} 
     */
    static RtlInsertEntryHashTable(HashTable, Entry, Signature, Context) {
        result := DllCall("ntdll.dll\RtlInsertEntryHashTable", "ptr", HashTable, "ptr", Entry, "ptr", Signature, "ptr", Context, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENTRY>} Entry 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_CONTEXT>} Context 
     * @returns {BOOLEAN} 
     */
    static RtlRemoveEntryHashTable(HashTable, Entry, Context) {
        result := DllCall("ntdll.dll\RtlRemoveEntryHashTable", "ptr", HashTable, "ptr", Entry, "ptr", Context, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @param {Pointer} Signature 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_CONTEXT>} Context 
     * @returns {Pointer<RTL_DYNAMIC_HASH_TABLE_ENTRY>} 
     */
    static RtlLookupEntryHashTable(HashTable, Signature, Context) {
        result := DllCall("ntdll.dll\RtlLookupEntryHashTable", "ptr", HashTable, "ptr", Signature, "ptr", Context, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_CONTEXT>} Context 
     * @returns {Pointer<RTL_DYNAMIC_HASH_TABLE_ENTRY>} 
     */
    static RtlGetNextEntryHashTable(HashTable, Context) {
        result := DllCall("ntdll.dll\RtlGetNextEntryHashTable", "ptr", HashTable, "ptr", Context, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} Enumerator 
     * @returns {BOOLEAN} 
     */
    static RtlInitEnumerationHashTable(HashTable, Enumerator) {
        result := DllCall("ntdll.dll\RtlInitEnumerationHashTable", "ptr", HashTable, "ptr", Enumerator, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} Enumerator 
     * @returns {Pointer<RTL_DYNAMIC_HASH_TABLE_ENTRY>} 
     */
    static RtlEnumerateEntryHashTable(HashTable, Enumerator) {
        result := DllCall("ntdll.dll\RtlEnumerateEntryHashTable", "ptr", HashTable, "ptr", Enumerator, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} Enumerator 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlEndEnumerationHashTable(HashTable, Enumerator) {
        DllCall("ntdll.dll\RtlEndEnumerationHashTable", "ptr", HashTable, "ptr", Enumerator)
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} Enumerator 
     * @returns {BOOLEAN} 
     */
    static RtlInitWeakEnumerationHashTable(HashTable, Enumerator) {
        result := DllCall("ntdll.dll\RtlInitWeakEnumerationHashTable", "ptr", HashTable, "ptr", Enumerator, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} Enumerator 
     * @returns {Pointer<RTL_DYNAMIC_HASH_TABLE_ENTRY>} 
     */
    static RtlWeaklyEnumerateEntryHashTable(HashTable, Enumerator) {
        result := DllCall("ntdll.dll\RtlWeaklyEnumerateEntryHashTable", "ptr", HashTable, "ptr", Enumerator, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} Enumerator 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlEndWeakEnumerationHashTable(HashTable, Enumerator) {
        DllCall("ntdll.dll\RtlEndWeakEnumerationHashTable", "ptr", HashTable, "ptr", Enumerator)
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} Enumerator 
     * @returns {BOOLEAN} 
     */
    static RtlInitStrongEnumerationHashTable(HashTable, Enumerator) {
        result := DllCall("ntdll.dll\RtlInitStrongEnumerationHashTable", "ptr", HashTable, "ptr", Enumerator, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} Enumerator 
     * @returns {Pointer<RTL_DYNAMIC_HASH_TABLE_ENTRY>} 
     */
    static RtlStronglyEnumerateEntryHashTable(HashTable, Enumerator) {
        result := DllCall("ntdll.dll\RtlStronglyEnumerateEntryHashTable", "ptr", HashTable, "ptr", Enumerator, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE_ENUMERATOR>} Enumerator 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlEndStrongEnumerationHashTable(HashTable, Enumerator) {
        DllCall("ntdll.dll\RtlEndStrongEnumerationHashTable", "ptr", HashTable, "ptr", Enumerator)
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @returns {BOOLEAN} 
     */
    static RtlExpandHashTable(HashTable) {
        result := DllCall("ntdll.dll\RtlExpandHashTable", "ptr", HashTable, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<RTL_DYNAMIC_HASH_TABLE>} HashTable 
     * @returns {BOOLEAN} 
     */
    static RtlContractHashTable(HashTable) {
        result := DllCall("ntdll.dll\RtlContractHashTable", "ptr", HashTable, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} CallersAddress 
     * @param {Pointer<Pointer<Void>>} CallersCaller 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlGetCallersAddress(CallersAddress, CallersCaller) {
        CallersAddressMarshal := CallersAddress is VarRef ? "ptr*" : "ptr"
        CallersCallerMarshal := CallersCaller is VarRef ? "ptr*" : "ptr"

        DllCall("ntdll.dll\RtlGetCallersAddress", CallersAddressMarshal, CallersAddress, CallersCallerMarshal, CallersCaller)
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} Callers 
     * @param {Integer} Count 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static RtlWalkFrameChain(Callers, Count, Flags) {
        CallersMarshal := Callers is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\RtlWalkFrameChain", CallersMarshal, Callers, "uint", Count, "uint", Flags, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} FeatureMask 
     * @returns {Integer} 
     */
    static RtlGetEnabledExtendedFeatures(FeatureMask) {
        result := DllCall("ntdll.dll\RtlGetEnabledExtendedFeatures", "uint", FeatureMask, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} DestinationString 
     * @param {Pointer<STRING>} SourceString 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlCopyString(DestinationString, SourceString) {
        DllCall("ntdll.dll\RtlCopyString", "ptr", DestinationString, "ptr", SourceString)
    }

    /**
     * 
     * @param {CHAR} Character 
     * @returns {CHAR} 
     */
    static RtlUpperChar(Character) {
        result := DllCall("ntdll.dll\RtlUpperChar", "char", Character, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} String1 
     * @param {Pointer<STRING>} String2 
     * @param {BOOLEAN} CaseInSensitive 
     * @returns {Integer} 
     */
    static RtlCompareString(String1, String2, CaseInSensitive) {
        result := DllCall("ntdll.dll\RtlCompareString", "ptr", String1, "ptr", String2, "char", CaseInSensitive, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} String1 
     * @param {Pointer<STRING>} String2 
     * @param {BOOLEAN} CaseInSensitive 
     * @returns {BOOLEAN} 
     */
    static RtlEqualString(String1, String2, CaseInSensitive) {
        result := DllCall("ntdll.dll\RtlEqualString", "ptr", String1, "ptr", String2, "char", CaseInSensitive, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<STRING>} DestinationString 
     * @param {Pointer<STRING>} SourceString 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlUpperString(DestinationString, SourceString) {
        DllCall("ntdll.dll\RtlUpperString", "ptr", DestinationString, "ptr", SourceString)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} String1 
     * @param {Pointer<UNICODE_STRING>} String2 
     * @param {BOOLEAN} CaseInSensitive 
     * @returns {BOOLEAN} 
     */
    static RtlPrefixUnicodeString(String1, String2, CaseInSensitive) {
        result := DllCall("ntdll.dll\RtlPrefixUnicodeString", "ptr", String1, "ptr", String2, "char", CaseInSensitive, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} String1 
     * @param {Pointer<UNICODE_STRING>} String2 
     * @param {BOOLEAN} CaseInSensitive 
     * @returns {BOOLEAN} 
     */
    static RtlSuffixUnicodeString(String1, String2, CaseInSensitive) {
        result := DllCall("ntoskrnl.exe\RtlSuffixUnicodeString", "ptr", String1, "ptr", String2, "char", CaseInSensitive, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} DestinationString 
     * @param {Pointer<UNICODE_STRING>} SourceString 
     * @param {BOOLEAN} AllocateDestinationString 
     * @returns {NTSTATUS} 
     */
    static RtlUpcaseUnicodeString(DestinationString, SourceString, AllocateDestinationString) {
        result := DllCall("ntdll.dll\RtlUpcaseUnicodeString", "ptr", DestinationString, "ptr", SourceString, "char", AllocateDestinationString, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} PrimaryHandle 
     * @param {HANDLE} FallbackHandle 
     * @param {Pointer<UNICODE_STRING>} ValueName 
     * @param {Integer} ValueLength 
     * @param {Pointer<Integer>} ValueType 
     * @param {Pointer} ValueData 
     * @param {Pointer<Integer>} ResultLength 
     * @returns {NTSTATUS} 
     */
    static RtlQueryRegistryValueWithFallback(PrimaryHandle, FallbackHandle, ValueName, ValueLength, ValueType, ValueData, ResultLength) {
        PrimaryHandle := PrimaryHandle is Win32Handle ? NumGet(PrimaryHandle, "ptr") : PrimaryHandle
        FallbackHandle := FallbackHandle is Win32Handle ? NumGet(FallbackHandle, "ptr") : FallbackHandle

        ValueTypeMarshal := ValueType is VarRef ? "uint*" : "ptr"
        ResultLengthMarshal := ResultLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlQueryRegistryValueWithFallback", "ptr", PrimaryHandle, "ptr", FallbackHandle, "ptr", ValueName, "uint", ValueLength, ValueTypeMarshal, ValueType, "ptr", ValueData, ResultLengthMarshal, ResultLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} AccessMask 
     * @param {Pointer<GENERIC_MAPPING>} GenericMapping 
     * @returns {String} Nothing - always returns an empty string
     */
    static RtlMapGenericMask(AccessMask, GenericMapping) {
        AccessMaskMarshal := AccessMask is VarRef ? "uint*" : "ptr"

        DllCall("ntdll.dll\RtlMapGenericMask", AccessMaskMarshal, AccessMask, "ptr", GenericMapping)
    }

    /**
     * 
     * @param {Pointer<Void>} VolumeDeviceObject 
     * @param {Pointer<UNICODE_STRING>} DosName 
     * @returns {NTSTATUS} 
     */
    static RtlVolumeDeviceToDosName(VolumeDeviceObject, DosName) {
        VolumeDeviceObjectMarshal := VolumeDeviceObject is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\RtlVolumeDeviceToDosName", VolumeDeviceObjectMarshal, VolumeDeviceObject, "ptr", DosName, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} Prompt 
     * @param {Pointer} Response 
     * @param {Integer} Length 
     * @returns {Integer} 
     */
    static DbgPrompt(Prompt, Response, Length) {
        Prompt := Prompt is String ? StrPtr(Prompt) : Prompt

        result := DllCall("ntdll.dll\DbgPrompt", "ptr", Prompt, "ptr", Response, "uint", Length, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static RtlGetActiveConsoleId() {
        result := DllCall("ntdll.dll\RtlGetActiveConsoleId", "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static RtlGetConsoleSessionForegroundProcessId() {
        result := DllCall("ntdll.dll\RtlGetConsoleSessionForegroundProcessId", "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static RtlGetSuiteMask() {
        result := DllCall("ntdll.dll\RtlGetSuiteMask", "uint")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static RtlIsMultiSessionSku() {
        result := DllCall("ntdll.dll\RtlIsMultiSessionSku", "char")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static RtlIsStateSeparationEnabled() {
        result := DllCall("ntdll.dll\RtlIsStateSeparationEnabled", "char")
        return result
    }

    /**
     * 
     * @param {PWSTR} SourceID 
     * @param {PWSTR} CustomValue 
     * @param {PWSTR} DefaultPath 
     * @param {Integer} StateLocationType 
     * @param {Pointer} TargetPath 
     * @param {Integer} BufferLengthIn 
     * @param {Pointer<Integer>} BufferLengthOut 
     * @returns {NTSTATUS} 
     */
    static RtlGetPersistedStateLocation(SourceID, CustomValue, DefaultPath, StateLocationType, TargetPath, BufferLengthIn, BufferLengthOut) {
        SourceID := SourceID is String ? StrPtr(SourceID) : SourceID
        CustomValue := CustomValue is String ? StrPtr(CustomValue) : CustomValue
        DefaultPath := DefaultPath is String ? StrPtr(DefaultPath) : DefaultPath

        BufferLengthOutMarshal := BufferLengthOut is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlGetPersistedStateLocation", "ptr", SourceID, "ptr", CustomValue, "ptr", DefaultPath, "int", StateLocationType, "ptr", TargetPath, "uint", BufferLengthIn, BufferLengthOutMarshal, BufferLengthOut, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} apiSetName 
     * @returns {NTSTATUS} 
     */
    static RtlIsApiSetImplemented(apiSetName) {
        apiSetName := apiSetName is String ? StrPtr(apiSetName) : apiSetName

        result := DllCall("ntdll.dll\RtlIsApiSetImplemented", "ptr", apiSetName, "int")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static RtlIsMultiUsersInSessionSku() {
        result := DllCall("ntdll.dll\RtlIsMultiUsersInSessionSku", "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} NtProductType 
     * @returns {BOOLEAN} 
     */
    static RtlGetNtProductType(NtProductType) {
        NtProductTypeMarshal := NtProductType is VarRef ? "int*" : "ptr"

        result := DllCall("ntdll.dll\RtlGetNtProductType", NtProductTypeMarshal, NtProductType, "char")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    static RtlGetNtSystemRoot() {
        result := DllCall("ntdll.dll\RtlGetNtSystemRoot", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} SecurityDescriptor 
     * @param {Integer} SecurityDescriptorLength 
     * @param {Pointer<PSECURITY_DESCRIPTOR>} NewSecurityDescriptor 
     * @param {Pointer<Integer>} NewSecurityDescriptorLength 
     * @param {BOOLEAN} CheckOnly 
     * @returns {BOOLEAN} 
     */
    static RtlNormalizeSecurityDescriptor(SecurityDescriptor, SecurityDescriptorLength, NewSecurityDescriptor, NewSecurityDescriptorLength, CheckOnly) {
        NewSecurityDescriptorLengthMarshal := NewSecurityDescriptorLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ntdll.dll\RtlNormalizeSecurityDescriptor", "ptr", SecurityDescriptor, "uint", SecurityDescriptorLength, "ptr", NewSecurityDescriptor, NewSecurityDescriptorLengthMarshal, NewSecurityDescriptorLength, "char", CheckOnly, "char")
        return result
    }

    /**
     * 
     * @param {Integer} DataId 
     * @param {Pointer<Void>} Buffer_R 
     * @param {Integer} Size 
     * @returns {NTSTATUS} 
     */
    static RtlSetSystemGlobalData(DataId, Buffer_R, Size) {
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\RtlSetSystemGlobalData", "int", DataId, Buffer_RMarshal, Buffer_R, "uint", Size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<KEVENT>} Event 
     * @param {Integer} Increment 
     * @param {BOOLEAN} Wait 
     * @returns {Integer} 
     */
    static KePulseEvent(Event, Increment, Wait) {
        result := DllCall("ntoskrnl.exe\KePulseEvent", "ptr", Event, "int", Increment, "char", Wait, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PEXPAND_STACK_CALLOUT>} Callout 
     * @param {Pointer<Void>} Parameter 
     * @param {Pointer} Size 
     * @returns {NTSTATUS} 
     */
    static KeExpandKernelStackAndCallout(Callout, Parameter, Size) {
        ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\KeExpandKernelStackAndCallout", "ptr", Callout, ParameterMarshal, Parameter, "ptr", Size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PEXPAND_STACK_CALLOUT>} Callout 
     * @param {Pointer<Void>} Parameter 
     * @param {Pointer} Size 
     * @param {BOOLEAN} Wait 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static KeExpandKernelStackAndCalloutEx(Callout, Parameter, Size, Wait, Context) {
        ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\KeExpandKernelStackAndCalloutEx", "ptr", Callout, ParameterMarshal, Parameter, "ptr", Size, "char", Wait, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {PKTHREAD} Thread 
     * @param {Integer} Increment 
     * @returns {Integer} 
     */
    static KeSetBasePriorityThread(Thread, Increment) {
        result := DllCall("ntoskrnl.exe\KeSetBasePriorityThread", "ptr", Thread, "int", Increment, "int")
        return result
    }

    /**
     * 
     * @param {Integer} BugCheckCode 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeBugCheck(BugCheckCode) {
        DllCall("ntoskrnl.exe\KeBugCheck", "uint", BugCheckCode)
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static KeInvalidateAllCaches() {
        result := DllCall("ntoskrnl.exe\KeInvalidateAllCaches", "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} BaseAddress 
     * @param {Integer} Length 
     * @returns {String} Nothing - always returns an empty string
     */
    static KeInvalidateRangeAllCaches(BaseAddress, Length) {
        BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\KeInvalidateRangeAllCaches", BaseAddressMarshal, BaseAddress, "uint", Length)
    }

    /**
     * 
     * @param {Pointer<HARDWARE_COUNTER>} CounterArray 
     * @param {Integer} Count 
     * @returns {NTSTATUS} 
     */
    static KeSetHardwareCounterConfiguration(CounterArray, Count) {
        result := DllCall("ntoskrnl.exe\KeSetHardwareCounterConfiguration", "ptr", CounterArray, "uint", Count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HARDWARE_COUNTER>} CounterArray 
     * @param {Integer} MaximumCount 
     * @param {Pointer<Integer>} Count 
     * @returns {NTSTATUS} 
     */
    static KeQueryHardwareCounterConfiguration(CounterArray, MaximumCount, Count) {
        CountMarshal := Count is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\KeQueryHardwareCounterConfiguration", "ptr", CounterArray, "uint", MaximumCount, CountMarshal, Count, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExRaiseDatatypeMisalignment() {
        DllCall("ntoskrnl.exe\ExRaiseDatatypeMisalignment")
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static ExRaiseAccessViolation() {
        DllCall("ntoskrnl.exe\ExRaiseAccessViolation")
    }

    /**
     * 
     * @param {Pointer<ZONE_HEADER>} Zone 
     * @param {Integer} BlockSize 
     * @param {Pointer<Void>} InitialSegment 
     * @param {Integer} InitialSegmentSize 
     * @returns {NTSTATUS} 
     */
    static ExInitializeZone(Zone, BlockSize, InitialSegment, InitialSegmentSize) {
        InitialSegmentMarshal := InitialSegment is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ExInitializeZone", "ptr", Zone, "uint", BlockSize, InitialSegmentMarshal, InitialSegment, "uint", InitialSegmentSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ZONE_HEADER>} Zone 
     * @param {Pointer<Void>} Segment 
     * @param {Integer} SegmentSize 
     * @returns {NTSTATUS} 
     */
    static ExExtendZone(Zone, Segment, SegmentSize) {
        SegmentMarshal := Segment is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\ExExtendZone", "ptr", Zone, SegmentMarshal, Segment, "uint", SegmentSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ZONE_HEADER>} Zone 
     * @param {Pointer<Void>} Segment 
     * @param {Integer} SegmentSize 
     * @param {Pointer<Pointer>} Lock 
     * @returns {NTSTATUS} 
     */
    static ExInterlockedExtendZone(Zone, Segment, SegmentSize, Lock) {
        SegmentMarshal := Segment is VarRef ? "ptr" : "ptr"
        LockMarshal := Lock is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\ExInterlockedExtendZone", "ptr", Zone, SegmentMarshal, Segment, "uint", SegmentSize, LockMarshal, Lock, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Uuid 
     * @returns {NTSTATUS} 
     */
    static ExUuidCreate(Uuid) {
        result := DllCall("ntoskrnl.exe\ExUuidCreate", "ptr", Uuid, "int")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static MmIsThisAnNtAsSystem() {
        result := DllCall("ntoskrnl.exe\MmIsThisAnNtAsSystem", "char")
        return result
    }

    /**
     * 
     * @param {Pointer} BaseAddress 
     * @param {Pointer} NumberOfBytes 
     * @param {Pointer<Void>} PageAddress 
     * @returns {NTSTATUS} 
     */
    static MmMapUserAddressesToPage(BaseAddress, NumberOfBytes, PageAddress) {
        PageAddressMarshal := PageAddress is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmMapUserAddressesToPage", "ptr", BaseAddress, "ptr", NumberOfBytes, PageAddressMarshal, PageAddress, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} StartAddress 
     * @param {Pointer<Integer>} NumberOfBytes 
     * @returns {NTSTATUS} 
     */
    static MmAddPhysicalMemory(StartAddress, NumberOfBytes) {
        StartAddressMarshal := StartAddress is VarRef ? "int64*" : "ptr"
        NumberOfBytesMarshal := NumberOfBytes is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmAddPhysicalMemory", StartAddressMarshal, StartAddress, NumberOfBytesMarshal, NumberOfBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} VirtualAddress 
     * @param {Pointer<Pointer>} NumberOfBytes 
     * @param {Pointer<MDL>} NewMdl 
     * @param {Integer} Direction 
     * @param {Pointer<PMM_ROTATE_COPY_CALLBACK_FUNCTION>} CopyFunction 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static MmRotatePhysicalView(VirtualAddress, NumberOfBytes, NewMdl, Direction, CopyFunction, Context) {
        VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"
        NumberOfBytesMarshal := NumberOfBytes is VarRef ? "ptr*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmRotatePhysicalView", VirtualAddressMarshal, VirtualAddress, NumberOfBytesMarshal, NumberOfBytes, "ptr", NewMdl, "int", Direction, "ptr", CopyFunction, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} StartAddress 
     * @param {Pointer<Integer>} NumberOfBytes 
     * @returns {NTSTATUS} 
     */
    static MmRemovePhysicalMemory(StartAddress, NumberOfBytes) {
        StartAddressMarshal := StartAddress is VarRef ? "int64*" : "ptr"
        NumberOfBytesMarshal := NumberOfBytes is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmRemovePhysicalMemory", StartAddressMarshal, StartAddress, NumberOfBytesMarshal, NumberOfBytes, "int")
        return result
    }

    /**
     * 
     * @returns {Pointer<PHYSICAL_MEMORY_RANGE>} 
     */
    static MmGetPhysicalMemoryRanges() {
        result := DllCall("ntoskrnl.exe\MmGetPhysicalMemoryRanges", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} PartitionObject 
     * @returns {Pointer<PHYSICAL_MEMORY_RANGE>} 
     */
    static MmGetPhysicalMemoryRangesEx(PartitionObject) {
        PartitionObjectMarshal := PartitionObject is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmGetPhysicalMemoryRangesEx", PartitionObjectMarshal, PartitionObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} PartitionObject 
     * @param {Integer} Flags 
     * @returns {Pointer<PHYSICAL_MEMORY_RANGE>} 
     */
    static MmGetPhysicalMemoryRangesEx2(PartitionObject, Flags) {
        PartitionObjectMarshal := PartitionObject is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmGetPhysicalMemoryRangesEx2", PartitionObjectMarshal, PartitionObject, "uint", Flags, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} PhysicalAddress 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} CacheType 
     * @returns {Pointer<Void>} 
     */
    static MmMapVideoDisplay(PhysicalAddress, NumberOfBytes, CacheType) {
        result := DllCall("ntoskrnl.exe\MmMapVideoDisplay", "int64", PhysicalAddress, "ptr", NumberOfBytes, "int", CacheType, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} BaseAddress 
     * @param {Pointer} NumberOfBytes 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmUnmapVideoDisplay(BaseAddress, NumberOfBytes) {
        DllCall("ntoskrnl.exe\MmUnmapVideoDisplay", "ptr", BaseAddress, "ptr", NumberOfBytes)
    }

    /**
     * 
     * @param {Pointer<Void>} BaseAddress 
     * @returns {Integer} 
     */
    static MmGetPhysicalAddress(BaseAddress) {
        BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmGetPhysicalAddress", BaseAddressMarshal, BaseAddress, "int64")
        return result
    }

    /**
     * 
     * @param {Integer} PhysicalAddress 
     * @param {Pointer<Integer>} CacheType 
     * @returns {NTSTATUS} 
     */
    static MmGetCacheAttribute(PhysicalAddress, CacheType) {
        CacheTypeMarshal := CacheType is VarRef ? "int*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmGetCacheAttribute", "int64", PhysicalAddress, CacheTypeMarshal, CacheType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} TargetAddress 
     * @param {MM_COPY_ADDRESS} SourceAddress 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer>} NumberOfBytesTransferred 
     * @returns {NTSTATUS} 
     */
    static MmCopyMemory(TargetAddress, SourceAddress, NumberOfBytes, Flags, NumberOfBytesTransferred) {
        TargetAddressMarshal := TargetAddress is VarRef ? "ptr" : "ptr"
        NumberOfBytesTransferredMarshal := NumberOfBytesTransferred is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmCopyMemory", TargetAddressMarshal, TargetAddress, "ptr", SourceAddress, "ptr", NumberOfBytes, "uint", Flags, NumberOfBytesTransferredMarshal, NumberOfBytesTransferred, "int")
        return result
    }

    /**
     * 
     * @param {Integer} PhysicalAddress 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} CacheType 
     * @returns {NTSTATUS} 
     */
    static MmGetCacheAttributeEx(PhysicalAddress, Flags, CacheType) {
        CacheTypeMarshal := CacheType is VarRef ? "int*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmGetCacheAttributeEx", "int64", PhysicalAddress, "uint", Flags, CacheTypeMarshal, CacheType, "int")
        return result
    }

    /**
     * 
     * @param {Integer} PhysicalAddress 
     * @returns {Pointer<Void>} 
     */
    static MmGetVirtualForPhysical(PhysicalAddress) {
        result := DllCall("ntoskrnl.exe\MmGetVirtualForPhysical", "int64", PhysicalAddress, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} NumberOfBytes 
     * @returns {Pointer<Void>} 
     */
    static MmAllocateNonCachedMemory(NumberOfBytes) {
        result := DllCall("ntoskrnl.exe\MmAllocateNonCachedMemory", "ptr", NumberOfBytes, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} BaseAddress 
     * @param {Pointer} NumberOfBytes 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmFreeNonCachedMemory(BaseAddress, NumberOfBytes) {
        DllCall("ntoskrnl.exe\MmFreeNonCachedMemory", "ptr", BaseAddress, "ptr", NumberOfBytes)
    }

    /**
     * 
     * @param {Pointer<Void>} VirtualAddress 
     * @returns {BOOLEAN} 
     */
    static MmIsAddressValid(VirtualAddress) {
        VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmIsAddressValid", VirtualAddressMarshal, VirtualAddress, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} VirtualAddress 
     * @returns {BOOLEAN} 
     */
    static MmIsNonPagedSystemAddressValid(VirtualAddress) {
        VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmIsNonPagedSystemAddressValid", VirtualAddressMarshal, VirtualAddress, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ImageSectionHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmLockPagableSectionByHandle(ImageSectionHandle) {
        ImageSectionHandleMarshal := ImageSectionHandle is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\MmLockPagableSectionByHandle", ImageSectionHandleMarshal, ImageSectionHandle)
    }

    /**
     * 
     * @param {Pointer} Address 
     * @param {Pointer} Size 
     * @param {Integer} ProbeMode 
     * @returns {HANDLE} 
     */
    static MmSecureVirtualMemory(Address, Size, ProbeMode) {
        result := DllCall("ntoskrnl.exe\MmSecureVirtualMemory", "ptr", Address, "ptr", Size, "uint", ProbeMode, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {Pointer} Address 
     * @param {Pointer} Size 
     * @param {Integer} ProbeMode 
     * @param {Integer} Flags 
     * @returns {HANDLE} 
     */
    static MmSecureVirtualMemoryEx(Address, Size, ProbeMode, Flags) {
        result := DllCall("ntoskrnl.exe\MmSecureVirtualMemoryEx", "ptr", Address, "ptr", Size, "uint", ProbeMode, "uint", Flags, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {HANDLE} SecureHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static MmUnsecureVirtualMemory(SecureHandle) {
        SecureHandle := SecureHandle is Win32Handle ? NumGet(SecureHandle, "ptr") : SecureHandle

        DllCall("ntoskrnl.exe\MmUnsecureVirtualMemory", "ptr", SecureHandle)
    }

    /**
     * 
     * @param {Pointer<Void>} Section 
     * @param {Pointer<Pointer<Void>>} MappedBase 
     * @param {Pointer<Pointer>} ViewSize 
     * @param {Pointer<Integer>} SectionOffset 
     * @param {Pointer} Flags 
     * @returns {NTSTATUS} 
     */
    static MmMapViewInSystemSpaceEx(Section, MappedBase, ViewSize, SectionOffset, Flags) {
        SectionMarshal := Section is VarRef ? "ptr" : "ptr"
        MappedBaseMarshal := MappedBase is VarRef ? "ptr*" : "ptr"
        ViewSizeMarshal := ViewSize is VarRef ? "ptr*" : "ptr"
        SectionOffsetMarshal := SectionOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmMapViewInSystemSpaceEx", SectionMarshal, Section, MappedBaseMarshal, MappedBase, ViewSizeMarshal, ViewSize, SectionOffsetMarshal, SectionOffset, "ptr", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Section 
     * @param {Pointer<Pointer<Void>>} MappedBase 
     * @param {Pointer<Pointer>} ViewSize 
     * @returns {NTSTATUS} 
     */
    static MmMapViewInSystemSpace(Section, MappedBase, ViewSize) {
        SectionMarshal := Section is VarRef ? "ptr" : "ptr"
        MappedBaseMarshal := MappedBase is VarRef ? "ptr*" : "ptr"
        ViewSizeMarshal := ViewSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmMapViewInSystemSpace", SectionMarshal, Section, MappedBaseMarshal, MappedBase, ViewSizeMarshal, ViewSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} MappedBase 
     * @returns {NTSTATUS} 
     */
    static MmUnmapViewInSystemSpace(MappedBase) {
        MappedBaseMarshal := MappedBase is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmUnmapViewInSystemSpace", MappedBaseMarshal, MappedBase, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Section 
     * @param {Pointer<Pointer<Void>>} MappedBase 
     * @param {Pointer<Pointer>} ViewSize 
     * @param {Pointer<Integer>} SectionOffset 
     * @param {Pointer} Flags 
     * @returns {NTSTATUS} 
     */
    static MmMapViewInSessionSpaceEx(Section, MappedBase, ViewSize, SectionOffset, Flags) {
        SectionMarshal := Section is VarRef ? "ptr" : "ptr"
        MappedBaseMarshal := MappedBase is VarRef ? "ptr*" : "ptr"
        ViewSizeMarshal := ViewSize is VarRef ? "ptr*" : "ptr"
        SectionOffsetMarshal := SectionOffset is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmMapViewInSessionSpaceEx", SectionMarshal, Section, MappedBaseMarshal, MappedBase, ViewSizeMarshal, ViewSize, SectionOffsetMarshal, SectionOffset, "ptr", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Section 
     * @param {Pointer<Pointer<Void>>} MappedBase 
     * @param {Pointer<Pointer>} ViewSize 
     * @returns {NTSTATUS} 
     */
    static MmMapViewInSessionSpace(Section, MappedBase, ViewSize) {
        SectionMarshal := Section is VarRef ? "ptr" : "ptr"
        MappedBaseMarshal := MappedBase is VarRef ? "ptr*" : "ptr"
        ViewSizeMarshal := ViewSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\MmMapViewInSessionSpace", SectionMarshal, Section, MappedBaseMarshal, MappedBase, ViewSizeMarshal, ViewSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} MappedBase 
     * @returns {NTSTATUS} 
     */
    static MmUnmapViewInSessionSpace(MappedBase) {
        MappedBaseMarshal := MappedBase is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\MmUnmapViewInSessionSpace", MappedBaseMarshal, MappedBase, "int")
        return result
    }

    /**
     * 
     * @returns {NTSTATUS} 
     */
    static MmCreateMirror() {
        result := DllCall("ntoskrnl.exe\MmCreateMirror", "int")
        return result
    }

    /**
     * 
     * @param {LUID} PrivilegeValue 
     * @param {Integer} PreviousMode 
     * @returns {BOOLEAN} 
     */
    static SeSinglePrivilegeCheck(PrivilegeValue, PreviousMode) {
        result := DllCall("ntoskrnl.exe\SeSinglePrivilegeCheck", "ptr", PrivilegeValue, "char", PreviousMode, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<PCREATE_PROCESS_NOTIFY_ROUTINE>} NotifyRoutine 
     * @param {BOOLEAN} Remove 
     * @returns {NTSTATUS} 
     */
    static PsSetCreateProcessNotifyRoutine(NotifyRoutine, Remove) {
        result := DllCall("ntoskrnl.exe\PsSetCreateProcessNotifyRoutine", "ptr", NotifyRoutine, "char", Remove, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PCREATE_PROCESS_NOTIFY_ROUTINE_EX>} NotifyRoutine 
     * @param {BOOLEAN} Remove 
     * @returns {NTSTATUS} 
     */
    static PsSetCreateProcessNotifyRoutineEx(NotifyRoutine, Remove) {
        result := DllCall("ntoskrnl.exe\PsSetCreateProcessNotifyRoutineEx", "ptr", NotifyRoutine, "char", Remove, "int")
        return result
    }

    /**
     * 
     * @param {Integer} NotifyType 
     * @param {Pointer<Void>} NotifyInformation 
     * @param {BOOLEAN} Remove 
     * @returns {NTSTATUS} 
     */
    static PsSetCreateProcessNotifyRoutineEx2(NotifyType, NotifyInformation, Remove) {
        NotifyInformationMarshal := NotifyInformation is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\PsSetCreateProcessNotifyRoutineEx2", "int", NotifyType, NotifyInformationMarshal, NotifyInformation, "char", Remove, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PCREATE_THREAD_NOTIFY_ROUTINE>} NotifyRoutine 
     * @returns {NTSTATUS} 
     */
    static PsSetCreateThreadNotifyRoutine(NotifyRoutine) {
        result := DllCall("ntoskrnl.exe\PsSetCreateThreadNotifyRoutine", "ptr", NotifyRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Integer} NotifyType 
     * @param {Pointer<Void>} NotifyInformation 
     * @returns {NTSTATUS} 
     */
    static PsSetCreateThreadNotifyRoutineEx(NotifyType, NotifyInformation) {
        NotifyInformationMarshal := NotifyInformation is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\PsSetCreateThreadNotifyRoutineEx", "int", NotifyType, NotifyInformationMarshal, NotifyInformation, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PCREATE_THREAD_NOTIFY_ROUTINE>} NotifyRoutine 
     * @returns {NTSTATUS} 
     */
    static PsRemoveCreateThreadNotifyRoutine(NotifyRoutine) {
        result := DllCall("ntoskrnl.exe\PsRemoveCreateThreadNotifyRoutine", "ptr", NotifyRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PLOAD_IMAGE_NOTIFY_ROUTINE>} NotifyRoutine 
     * @returns {NTSTATUS} 
     */
    static PsSetLoadImageNotifyRoutine(NotifyRoutine) {
        result := DllCall("ntoskrnl.exe\PsSetLoadImageNotifyRoutine", "ptr", NotifyRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PLOAD_IMAGE_NOTIFY_ROUTINE>} NotifyRoutine 
     * @param {Pointer} Flags 
     * @returns {NTSTATUS} 
     */
    static PsSetLoadImageNotifyRoutineEx(NotifyRoutine, Flags) {
        result := DllCall("ntoskrnl.exe\PsSetLoadImageNotifyRoutineEx", "ptr", NotifyRoutine, "ptr", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PLOAD_IMAGE_NOTIFY_ROUTINE>} NotifyRoutine 
     * @returns {NTSTATUS} 
     */
    static PsRemoveLoadImageNotifyRoutine(NotifyRoutine) {
        result := DllCall("ntoskrnl.exe\PsRemoveLoadImageNotifyRoutine", "ptr", NotifyRoutine, "int")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    static PsGetCurrentProcessId() {
        result := DllCall("ntoskrnl.exe\PsGetCurrentProcessId", "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    static PsGetCurrentThreadId() {
        result := DllCall("ntoskrnl.exe\PsGetCurrentThreadId", "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {BOOLEAN} Prefetching 
     * @returns {BOOLEAN} 
     */
    static PsSetCurrentThreadPrefetching(Prefetching) {
        result := DllCall("ntoskrnl.exe\PsSetCurrentThreadPrefetching", "char", Prefetching, "char")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static PsIsCurrentThreadPrefetching() {
        result := DllCall("ntoskrnl.exe\PsIsCurrentThreadPrefetching", "char")
        return result
    }

    /**
     * 
     * @param {PEPROCESS} Process 
     * @returns {Integer} 
     */
    static PsGetProcessCreateTimeQuadPart(Process) {
        result := DllCall("ntoskrnl.exe\PsGetProcessCreateTimeQuadPart", "ptr", Process, "int64")
        return result
    }

    /**
     * 
     * @param {PEPROCESS} Process 
     * @returns {Integer} 
     */
    static PsGetProcessStartKey(Process) {
        result := DllCall("ntoskrnl.exe\PsGetProcessStartKey", "ptr", Process, "uint")
        return result
    }

    /**
     * 
     * @param {PEPROCESS} Process 
     * @returns {NTSTATUS} 
     */
    static PsGetProcessExitStatus(Process) {
        result := DllCall("ntoskrnl.exe\PsGetProcessExitStatus", "ptr", Process, "int")
        return result
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @returns {NTSTATUS} 
     */
    static PsGetThreadExitStatus(Thread) {
        result := DllCall("ntoskrnl.exe\PsGetThreadExitStatus", "ptr", Thread, "int")
        return result
    }

    /**
     * 
     * @param {PEPROCESS} Process 
     * @returns {HANDLE} 
     */
    static PsGetProcessId(Process) {
        result := DllCall("ntoskrnl.exe\PsGetProcessId", "ptr", Process, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @returns {HANDLE} 
     */
    static PsGetThreadId(Thread) {
        result := DllCall("ntoskrnl.exe\PsGetThreadId", "ptr", Thread, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @param {Pointer} Key 
     * @param {Integer} Flags 
     * @returns {Pointer<Void>} 
     */
    static PsGetThreadProperty(Thread, Key, Flags) {
        result := DllCall("ntoskrnl.exe\PsGetThreadProperty", "ptr", Thread, "ptr", Key, "uint", Flags, "ptr")
        return result
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @returns {HANDLE} 
     */
    static PsGetThreadProcessId(Thread) {
        result := DllCall("ntoskrnl.exe\PsGetThreadProcessId", "ptr", Thread, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @returns {Integer} 
     */
    static PsGetThreadCreateTime(Thread) {
        result := DllCall("ntoskrnl.exe\PsGetThreadCreateTime", "ptr", Thread, "int64")
        return result
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    static PsGetCurrentThreadTeb() {
        result := DllCall("ntoskrnl.exe\PsGetCurrentThreadTeb", "ptr")
        return result
    }

    /**
     * 
     * @param {PEJOB} Job 
     * @param {Pointer<PESILO>} Silo 
     * @returns {NTSTATUS} 
     */
    static PsGetJobSilo(Job, Silo) {
        SiloMarshal := Silo is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsGetJobSilo", "ptr", Job, SiloMarshal, Silo, "int")
        return result
    }

    /**
     * 
     * @param {PEJOB} Job 
     * @param {Pointer<PESILO>} ServerSilo 
     * @returns {NTSTATUS} 
     */
    static PsGetJobServerSilo(Job, ServerSilo) {
        ServerSiloMarshal := ServerSilo is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsGetJobServerSilo", "ptr", Job, ServerSiloMarshal, ServerSilo, "int")
        return result
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @returns {PESILO} 
     */
    static PsGetEffectiveServerSilo(Silo) {
        result := DllCall("ntoskrnl.exe\PsGetEffectiveServerSilo", "ptr", Silo, "ptr")
        return result
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @returns {PESILO} 
     */
    static PsAttachSiloToCurrentThread(Silo) {
        result := DllCall("ntoskrnl.exe\PsAttachSiloToCurrentThread", "ptr", Silo, "ptr")
        return result
    }

    /**
     * 
     * @param {PESILO} PreviousSilo 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsDetachSiloFromCurrentThread(PreviousSilo) {
        DllCall("ntoskrnl.exe\PsDetachSiloFromCurrentThread", "ptr", PreviousSilo)
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @returns {BOOLEAN} 
     */
    static PsIsHostSilo(Silo) {
        result := DllCall("ntoskrnl.exe\PsIsHostSilo", "ptr", Silo, "char")
        return result
    }

    /**
     * 
     * @returns {PESILO} 
     */
    static PsGetHostSilo() {
        result := DllCall("ntoskrnl.exe\PsGetHostSilo", "ptr")
        return result
    }

    /**
     * 
     * @returns {PESILO} 
     */
    static PsGetCurrentSilo() {
        result := DllCall("ntoskrnl.exe\PsGetCurrentSilo", "ptr")
        return result
    }

    /**
     * 
     * @returns {PESILO} 
     */
    static PsGetCurrentServerSilo() {
        result := DllCall("ntoskrnl.exe\PsGetCurrentServerSilo", "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<UNICODE_STRING>} 
     */
    static PsGetCurrentServerSiloName() {
        result := DllCall("ntoskrnl.exe\PsGetCurrentServerSiloName", "ptr")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static PsIsCurrentThreadInServerSilo() {
        result := DllCall("ntoskrnl.exe\PsIsCurrentThreadInServerSilo", "char")
        return result
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @returns {NTSTATUS} 
     */
    static PsAcquireSiloHardReference(Silo) {
        result := DllCall("ntoskrnl.exe\PsAcquireSiloHardReference", "ptr", Silo, "int")
        return result
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsReleaseSiloHardReference(Silo) {
        DllCall("ntoskrnl.exe\PsReleaseSiloHardReference", "ptr", Silo)
    }

    /**
     * 
     * @param {Pointer} Reserved 
     * @param {Pointer<Integer>} ReturnedContextSlot 
     * @returns {NTSTATUS} 
     */
    static PsAllocSiloContextSlot(Reserved, ReturnedContextSlot) {
        ReturnedContextSlotMarshal := ReturnedContextSlot is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsAllocSiloContextSlot", "ptr", Reserved, ReturnedContextSlotMarshal, ReturnedContextSlot, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ContextSlot 
     * @returns {NTSTATUS} 
     */
    static PsFreeSiloContextSlot(ContextSlot) {
        result := DllCall("ntoskrnl.exe\PsFreeSiloContextSlot", "uint", ContextSlot, "int")
        return result
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @param {Integer} Size 
     * @param {Integer} PoolType 
     * @param {Pointer<SILO_CONTEXT_CLEANUP_CALLBACK>} ContextCleanupCallback 
     * @param {Pointer<Pointer<Void>>} ReturnedSiloContext 
     * @returns {NTSTATUS} 
     */
    static PsCreateSiloContext(Silo, Size, PoolType, ContextCleanupCallback, ReturnedSiloContext) {
        ReturnedSiloContextMarshal := ReturnedSiloContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsCreateSiloContext", "ptr", Silo, "uint", Size, "int", PoolType, "ptr", ContextCleanupCallback, ReturnedSiloContextMarshal, ReturnedSiloContext, "int")
        return result
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @param {Integer} ContextSlot 
     * @param {Pointer<Void>} SiloContext 
     * @returns {NTSTATUS} 
     */
    static PsInsertSiloContext(Silo, ContextSlot, SiloContext) {
        SiloContextMarshal := SiloContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\PsInsertSiloContext", "ptr", Silo, "uint", ContextSlot, SiloContextMarshal, SiloContext, "int")
        return result
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @param {Integer} ContextSlot 
     * @param {Pointer<Void>} NewSiloContext 
     * @param {Pointer<Pointer<Void>>} OldSiloContext 
     * @returns {NTSTATUS} 
     */
    static PsReplaceSiloContext(Silo, ContextSlot, NewSiloContext, OldSiloContext) {
        NewSiloContextMarshal := NewSiloContext is VarRef ? "ptr" : "ptr"
        OldSiloContextMarshal := OldSiloContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsReplaceSiloContext", "ptr", Silo, "uint", ContextSlot, NewSiloContextMarshal, NewSiloContext, OldSiloContextMarshal, OldSiloContext, "int")
        return result
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @param {Integer} ContextSlot 
     * @param {Pointer<Pointer<Void>>} ReturnedSiloContext 
     * @returns {NTSTATUS} 
     */
    static PsGetSiloContext(Silo, ContextSlot, ReturnedSiloContext) {
        ReturnedSiloContextMarshal := ReturnedSiloContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsGetSiloContext", "ptr", Silo, "uint", ContextSlot, ReturnedSiloContextMarshal, ReturnedSiloContext, "int")
        return result
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @param {Integer} ContextSlot 
     * @param {Pointer<Pointer<Void>>} RemovedSiloContext 
     * @returns {NTSTATUS} 
     */
    static PsRemoveSiloContext(Silo, ContextSlot, RemovedSiloContext) {
        RemovedSiloContextMarshal := RemovedSiloContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsRemoveSiloContext", "ptr", Silo, "uint", ContextSlot, RemovedSiloContextMarshal, RemovedSiloContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} SiloContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsReferenceSiloContext(SiloContext) {
        SiloContextMarshal := SiloContext is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\PsReferenceSiloContext", SiloContextMarshal, SiloContext)
    }

    /**
     * 
     * @param {Pointer<Void>} SiloContext 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsDereferenceSiloContext(SiloContext) {
        SiloContextMarshal := SiloContext is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\PsDereferenceSiloContext", SiloContextMarshal, SiloContext)
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @param {Integer} ContextSlot 
     * @param {Pointer<Void>} SiloContext 
     * @returns {NTSTATUS} 
     */
    static PsInsertPermanentSiloContext(Silo, ContextSlot, SiloContext) {
        SiloContextMarshal := SiloContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\PsInsertPermanentSiloContext", "ptr", Silo, "uint", ContextSlot, SiloContextMarshal, SiloContext, "int")
        return result
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @param {Integer} ContextSlot 
     * @returns {NTSTATUS} 
     */
    static PsMakeSiloContextPermanent(Silo, ContextSlot) {
        result := DllCall("ntoskrnl.exe\PsMakeSiloContextPermanent", "ptr", Silo, "uint", ContextSlot, "int")
        return result
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @param {Integer} ContextSlot 
     * @param {Pointer<Pointer<Void>>} ReturnedSiloContext 
     * @returns {NTSTATUS} 
     */
    static PsGetPermanentSiloContext(Silo, ContextSlot, ReturnedSiloContext) {
        ReturnedSiloContextMarshal := ReturnedSiloContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsGetPermanentSiloContext", "ptr", Silo, "uint", ContextSlot, ReturnedSiloContextMarshal, ReturnedSiloContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<SILO_MONITOR_REGISTRATION>} Registration 
     * @param {Pointer<PSILO_MONITOR>} ReturnedMonitor 
     * @returns {NTSTATUS} 
     */
    static PsRegisterSiloMonitor(Registration, ReturnedMonitor) {
        ReturnedMonitorMarshal := ReturnedMonitor is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\PsRegisterSiloMonitor", "ptr", Registration, ReturnedMonitorMarshal, ReturnedMonitor, "int")
        return result
    }

    /**
     * 
     * @param {PSILO_MONITOR} Monitor 
     * @returns {NTSTATUS} 
     */
    static PsStartSiloMonitor(Monitor) {
        result := DllCall("ntoskrnl.exe\PsStartSiloMonitor", "ptr", Monitor, "int")
        return result
    }

    /**
     * 
     * @param {PSILO_MONITOR} Monitor 
     * @returns {Integer} 
     */
    static PsGetSiloMonitorContextSlot(Monitor) {
        result := DllCall("ntoskrnl.exe\PsGetSiloMonitorContextSlot", "ptr", Monitor, "uint")
        return result
    }

    /**
     * 
     * @param {PSILO_MONITOR} Monitor 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsUnregisterSiloMonitor(Monitor) {
        DllCall("ntoskrnl.exe\PsUnregisterSiloMonitor", "ptr", Monitor)
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @returns {Integer} 
     */
    static PsGetServerSiloServiceSessionId(Silo) {
        result := DllCall("ntoskrnl.exe\PsGetServerSiloServiceSessionId", "ptr", Silo, "uint")
        return result
    }

    /**
     * 
     * @param {PESILO} ServerSilo 
     * @param {NTSTATUS} ExitStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    static PsTerminateServerSilo(ServerSilo, ExitStatus) {
        DllCall("ntoskrnl.exe\PsTerminateServerSilo", "ptr", ServerSilo, "int", ExitStatus)
    }

    /**
     * 
     * @param {PEJOB} Job 
     * @returns {PESILO} 
     */
    static PsGetParentSilo(Job) {
        result := DllCall("ntoskrnl.exe\PsGetParentSilo", "ptr", Job, "ptr")
        return result
    }

    /**
     * 
     * @param {PETHREAD} Thread 
     * @returns {PESILO} 
     */
    static PsGetThreadServerSilo(Thread) {
        result := DllCall("ntoskrnl.exe\PsGetThreadServerSilo", "ptr", Thread, "ptr")
        return result
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @returns {Pointer<Guid>} 
     */
    static PsGetSiloContainerId(Silo) {
        result := DllCall("ntoskrnl.exe\PsGetSiloContainerId", "ptr", Silo, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} NumberOfMapRegisters 
     * @param {Pointer<DRIVER_CONTROL>} ExecutionRoutine 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static IoAllocateAdapterChannel(AdapterObject, DeviceObject, NumberOfMapRegisters, ExecutionRoutine, Context) {
        AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoAllocateAdapterChannel", AdapterObjectMarshal, AdapterObject, "ptr", DeviceObject, "uint", NumberOfMapRegisters, "ptr", ExecutionRoutine, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CONTROLLER_OBJECT>} ControllerObject 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<DRIVER_CONTROL>} ExecutionRoutine 
     * @param {Pointer<Void>} Context 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoAllocateController(ControllerObject, DeviceObject, ExecutionRoutine, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\IoAllocateController", "ptr", ControllerObject, "ptr", DeviceObject, "ptr", ExecutionRoutine, ContextMarshal, Context)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} RegistryPath 
     * @param {Pointer<UNICODE_STRING>} DriverClassName 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<IO_RESOURCE_REQUIREMENTS_LIST>} RequestedResources 
     * @param {Pointer<Pointer<CM_RESOURCE_LIST>>} AllocatedResources 
     * @returns {NTSTATUS} 
     */
    static IoAssignResources(RegistryPath, DriverClassName, DriverObject, DeviceObject, RequestedResources, AllocatedResources) {
        AllocatedResourcesMarshal := AllocatedResources is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoAssignResources", "ptr", RegistryPath, "ptr", DriverClassName, "ptr", DriverObject, "ptr", DeviceObject, "ptr", RequestedResources, AllocatedResourcesMarshal, AllocatedResources, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} SourceDevice 
     * @param {Pointer<DEVICE_OBJECT>} TargetDevice 
     * @returns {NTSTATUS} 
     */
    static IoAttachDeviceByPointer(SourceDevice, TargetDevice) {
        result := DllCall("ntoskrnl.exe\IoAttachDeviceByPointer", "ptr", SourceDevice, "ptr", TargetDevice, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Size 
     * @returns {Pointer<CONTROLLER_OBJECT>} 
     */
    static IoCreateController(Size) {
        result := DllCall("ntoskrnl.exe\IoCreateController", "uint", Size, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<CONTROLLER_OBJECT>} ControllerObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoDeleteController(ControllerObject) {
        DllCall("ntoskrnl.exe\IoDeleteController", "ptr", ControllerObject)
    }

    /**
     * 
     * @param {Pointer<CONTROLLER_OBJECT>} ControllerObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoFreeController(ControllerObject) {
        DllCall("ntoskrnl.exe\IoFreeController", "ptr", ControllerObject)
    }

    /**
     * 
     * @returns {Pointer<CONFIGURATION_INFORMATION>} 
     */
    static IoGetConfigurationInformation() {
        result := DllCall("ntoskrnl.exe\IoGetConfigurationInformation", "ptr")
        return result
    }

    /**
     * 
     * @returns {Pointer<GENERIC_MAPPING>} 
     */
    static IoGetFileObjectGenericMapping() {
        result := DllCall("ntoskrnl.exe\IoGetFileObjectGenericMapping", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoCancelFileOpen(DeviceObject, FileObject) {
        DllCall("ntoskrnl.exe\IoCancelFileOpen", "ptr", DeviceObject, "ptr", FileObject)
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Integer} StackSize 
     * @returns {Pointer<IRP>} 
     */
    static IoMakeAssociatedIrp(Irp, StackSize) {
        result := DllCall("ntoskrnl.exe\IoMakeAssociatedIrp", "ptr", Irp, "char", StackSize, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} StackSize 
     * @returns {Pointer<IRP>} 
     */
    static IoMakeAssociatedIrpEx(Irp, DeviceObject, StackSize) {
        result := DllCall("ntoskrnl.exe\IoMakeAssociatedIrpEx", "ptr", Irp, "ptr", DeviceObject, "char", StackSize, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} BusType 
     * @param {Pointer<Integer>} BusNumber 
     * @param {Pointer<Integer>} ControllerType 
     * @param {Pointer<Integer>} ControllerNumber 
     * @param {Pointer<Integer>} PeripheralType 
     * @param {Pointer<Integer>} PeripheralNumber 
     * @param {Pointer<PIO_QUERY_DEVICE_ROUTINE>} CalloutRoutine 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static IoQueryDeviceDescription(BusType, BusNumber, ControllerType, ControllerNumber, PeripheralType, PeripheralNumber, CalloutRoutine, Context) {
        BusTypeMarshal := BusType is VarRef ? "int*" : "ptr"
        BusNumberMarshal := BusNumber is VarRef ? "uint*" : "ptr"
        ControllerTypeMarshal := ControllerType is VarRef ? "int*" : "ptr"
        ControllerNumberMarshal := ControllerNumber is VarRef ? "uint*" : "ptr"
        PeripheralTypeMarshal := PeripheralType is VarRef ? "int*" : "ptr"
        PeripheralNumberMarshal := PeripheralNumber is VarRef ? "uint*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoQueryDeviceDescription", BusTypeMarshal, BusType, BusNumberMarshal, BusNumber, ControllerTypeMarshal, ControllerType, ControllerNumberMarshal, ControllerNumber, PeripheralTypeMarshal, PeripheralType, PeripheralNumberMarshal, PeripheralNumber, "ptr", CalloutRoutine, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<VPB>} Vpb 
     * @param {Pointer<DEVICE_OBJECT>} RealDeviceObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoRaiseHardError(Irp, Vpb, RealDeviceObject) {
        DllCall("ntoskrnl.exe\IoRaiseHardError", "ptr", Irp, "ptr", Vpb, "ptr", RealDeviceObject)
    }

    /**
     * 
     * @param {NTSTATUS} ErrorStatus 
     * @param {Pointer<UNICODE_STRING>} String 
     * @param {PKTHREAD} Thread 
     * @returns {BOOLEAN} 
     */
    static IoRaiseInformationalHardError(ErrorStatus, String, Thread) {
        result := DllCall("ntoskrnl.exe\IoRaiseInformationalHardError", "int", ErrorStatus, "ptr", String, "ptr", Thread, "char")
        return result
    }

    /**
     * 
     * @param {BOOLEAN} EnableHardErrors 
     * @returns {BOOLEAN} 
     */
    static IoSetThreadHardErrorMode(EnableHardErrors) {
        result := DllCall("ntoskrnl.exe\IoSetThreadHardErrorMode", "char", EnableHardErrors, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DRIVER_REINITIALIZE>} DriverReinitializationRoutine 
     * @param {Pointer<Void>} Context 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoRegisterBootDriverReinitialization(DriverObject, DriverReinitializationRoutine, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\IoRegisterBootDriverReinitialization", "ptr", DriverObject, "ptr", DriverReinitializationRoutine, ContextMarshal, Context)
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DRIVER_REINITIALIZE>} DriverReinitializationRoutine 
     * @param {Pointer<Void>} Context 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoRegisterDriverReinitialization(DriverObject, DriverReinitializationRoutine, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\IoRegisterDriverReinitialization", "ptr", DriverObject, "ptr", DriverReinitializationRoutine, ContextMarshal, Context)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} DriverClassName 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer} DriverList 
     * @param {Integer} DriverListSize 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer} DeviceList 
     * @param {Integer} DeviceListSize 
     * @param {BOOLEAN} OverrideConflict 
     * @param {Pointer<BOOLEAN>} ConflictDetected 
     * @returns {NTSTATUS} 
     */
    static IoReportResourceUsage(DriverClassName, DriverObject, DriverList, DriverListSize, DeviceObject, DeviceList, DeviceListSize, OverrideConflict, ConflictDetected) {
        ConflictDetectedMarshal := ConflictDetected is VarRef ? "char*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoReportResourceUsage", "ptr", DriverClassName, "ptr", DriverObject, "ptr", DriverList, "uint", DriverListSize, "ptr", DeviceObject, "ptr", DeviceList, "uint", DeviceListSize, "char", OverrideConflict, ConflictDetectedMarshal, ConflictDetected, "int")
        return result
    }

    /**
     * 
     * @param {Integer} InterfaceType 
     * @param {Integer} BusNumber 
     * @param {Integer} BusAddress 
     * @param {Pointer<Integer>} AddressSpace 
     * @param {Pointer<Integer>} TranslatedAddress 
     * @returns {BOOLEAN} 
     */
    static IoTranslateBusAddress(InterfaceType, BusNumber, BusAddress, AddressSpace, TranslatedAddress) {
        AddressSpaceMarshal := AddressSpace is VarRef ? "uint*" : "ptr"
        TranslatedAddressMarshal := TranslatedAddress is VarRef ? "int64*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoTranslateBusAddress", "int", InterfaceType, "uint", BusNumber, "int64", BusAddress, AddressSpaceMarshal, AddressSpace, TranslatedAddressMarshal, TranslatedAddress, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoSetHardErrorOrVerifyDevice(Irp, DeviceObject) {
        DllCall("ntoskrnl.exe\IoSetHardErrorOrVerifyDevice", "ptr", Irp, "ptr", DeviceObject)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} SectorSize 
     * @param {Integer} MBRTypeIdentifier 
     * @param {Pointer<Pointer<Void>>} Buffer_R 
     * @returns {String} Nothing - always returns an empty string
     */
    static HalExamineMBR(DeviceObject, SectorSize, MBRTypeIdentifier, Buffer_R) {
        Buffer_RMarshal := Buffer_R is VarRef ? "ptr*" : "ptr"

        DllCall("ntoskrnl.exe\HalExamineMBR", "ptr", DeviceObject, "uint", SectorSize, "uint", MBRTypeIdentifier, Buffer_RMarshal, Buffer_R)
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} SectorSize 
     * @param {BOOLEAN} ReturnRecognizedPartitions 
     * @param {Pointer<Pointer<DRIVE_LAYOUT_INFORMATION>>} PartitionBuffer 
     * @returns {NTSTATUS} 
     */
    static IoReadPartitionTable(DeviceObject, SectorSize, ReturnRecognizedPartitions, PartitionBuffer) {
        PartitionBufferMarshal := PartitionBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoReadPartitionTable", "ptr", DeviceObject, "uint", SectorSize, "char", ReturnRecognizedPartitions, PartitionBufferMarshal, PartitionBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} SectorSize 
     * @param {Integer} PartitionNumber 
     * @param {Integer} PartitionType 
     * @returns {NTSTATUS} 
     */
    static IoSetPartitionInformation(DeviceObject, SectorSize, PartitionNumber, PartitionType) {
        result := DllCall("ntoskrnl.exe\IoSetPartitionInformation", "ptr", DeviceObject, "uint", SectorSize, "uint", PartitionNumber, "uint", PartitionType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} SectorSize 
     * @param {Integer} SectorsPerTrack 
     * @param {Integer} NumberOfHeads 
     * @param {Pointer<DRIVE_LAYOUT_INFORMATION>} PartitionBuffer 
     * @returns {NTSTATUS} 
     */
    static IoWritePartitionTable(DeviceObject, SectorSize, SectorsPerTrack, NumberOfHeads, PartitionBuffer) {
        result := DllCall("ntoskrnl.exe\IoWritePartitionTable", "ptr", DeviceObject, "uint", SectorSize, "uint", SectorsPerTrack, "uint", NumberOfHeads, "ptr", PartitionBuffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<CREATE_DISK>} Disk 
     * @returns {NTSTATUS} 
     */
    static IoCreateDisk(DeviceObject, Disk) {
        result := DllCall("ntoskrnl.exe\IoCreateDisk", "ptr", DeviceObject, "ptr", Disk, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<Pointer<DRIVE_LAYOUT_INFORMATION_EX>>} DriveLayout 
     * @returns {NTSTATUS} 
     */
    static IoReadPartitionTableEx(DeviceObject, DriveLayout) {
        DriveLayoutMarshal := DriveLayout is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoReadPartitionTableEx", "ptr", DeviceObject, DriveLayoutMarshal, DriveLayout, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<DRIVE_LAYOUT_INFORMATION_EX>} DriveLayout 
     * @returns {NTSTATUS} 
     */
    static IoWritePartitionTableEx(DeviceObject, DriveLayout) {
        result := DllCall("ntoskrnl.exe\IoWritePartitionTableEx", "ptr", DeviceObject, "ptr", DriveLayout, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} PartitionNumber 
     * @param {Pointer<SET_PARTITION_INFORMATION_EX>} PartitionInfo 
     * @returns {NTSTATUS} 
     */
    static IoSetPartitionInformationEx(DeviceObject, PartitionNumber, PartitionInfo) {
        result := DllCall("ntoskrnl.exe\IoSetPartitionInformationEx", "ptr", DeviceObject, "uint", PartitionNumber, "ptr", PartitionInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {BOOLEAN} FixErrors 
     * @returns {NTSTATUS} 
     */
    static IoVerifyPartitionTable(DeviceObject, FixErrors) {
        result := DllCall("ntoskrnl.exe\IoVerifyPartitionTable", "ptr", DeviceObject, "char", FixErrors, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} BytesPerSector 
     * @param {Pointer<DISK_SIGNATURE>} Signature 
     * @returns {NTSTATUS} 
     */
    static IoReadDiskSignature(DeviceObject, BytesPerSector, Signature) {
        result := DllCall("ntoskrnl.exe\IoReadDiskSignature", "ptr", DeviceObject, "uint", BytesPerSector, "ptr", Signature, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} VolumeDeviceObject 
     * @param {Pointer<UNICODE_STRING>} DosName 
     * @returns {NTSTATUS} 
     */
    static IoVolumeDeviceToDosName(VolumeDeviceObject, DosName) {
        VolumeDeviceObjectMarshal := VolumeDeviceObject is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoVolumeDeviceToDosName", VolumeDeviceObjectMarshal, VolumeDeviceObject, "ptr", DosName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} VolumeDeviceObject 
     * @param {Pointer<UNICODE_STRING>} GuidPath 
     * @returns {NTSTATUS} 
     */
    static IoVolumeDeviceToGuidPath(VolumeDeviceObject, GuidPath) {
        VolumeDeviceObjectMarshal := VolumeDeviceObject is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoVolumeDeviceToGuidPath", VolumeDeviceObjectMarshal, VolumeDeviceObject, "ptr", GuidPath, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} VolumeDeviceObject 
     * @param {Pointer<Guid>} Guid 
     * @returns {NTSTATUS} 
     */
    static IoVolumeDeviceToGuid(VolumeDeviceObject, Guid) {
        VolumeDeviceObjectMarshal := VolumeDeviceObject is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoVolumeDeviceToGuid", VolumeDeviceObjectMarshal, VolumeDeviceObject, "ptr", Guid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} VolumeDeviceName 
     * @param {Pointer<Guid>} Guid 
     * @returns {NTSTATUS} 
     */
    static IoVolumeDeviceNameToGuid(VolumeDeviceName, Guid) {
        result := DllCall("ntoskrnl.exe\IoVolumeDeviceNameToGuid", "ptr", VolumeDeviceName, "ptr", Guid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} VolumeDeviceName 
     * @param {Pointer<UNICODE_STRING>} GuidPath 
     * @returns {NTSTATUS} 
     */
    static IoVolumeDeviceNameToGuidPath(VolumeDeviceName, GuidPath) {
        result := DllCall("ntoskrnl.exe\IoVolumeDeviceNameToGuidPath", "ptr", VolumeDeviceName, "ptr", GuidPath, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} VolumeNameString 
     * @returns {NTSTATUS} 
     */
    static IoSetSystemPartition(VolumeNameString) {
        result := DllCall("ntoskrnl.exe\IoSetSystemPartition", "ptr", VolumeNameString, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} FileHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer<Integer>} AllocationSize 
     * @param {Integer} FileAttributes 
     * @param {Integer} ShareAccess 
     * @param {Integer} Disposition 
     * @param {Integer} CreateOptions 
     * @param {Pointer<Void>} EaBuffer 
     * @param {Integer} EaLength 
     * @param {Integer} CreateFileType 
     * @param {Pointer<Void>} InternalParameters 
     * @param {Integer} Options 
     * @param {Pointer<Void>} DeviceObject 
     * @returns {NTSTATUS} 
     */
    static IoCreateFileSpecifyDeviceObjectHint(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, Disposition, CreateOptions, EaBuffer, EaLength, CreateFileType, InternalParameters, Options, DeviceObject) {
        AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"
        EaBufferMarshal := EaBuffer is VarRef ? "ptr" : "ptr"
        InternalParametersMarshal := InternalParameters is VarRef ? "ptr" : "ptr"
        DeviceObjectMarshal := DeviceObject is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoCreateFileSpecifyDeviceObjectHint", "ptr", FileHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", Disposition, "uint", CreateOptions, EaBufferMarshal, EaBuffer, "uint", EaLength, "int", CreateFileType, InternalParametersMarshal, InternalParameters, "uint", Options, DeviceObjectMarshal, DeviceObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {Pointer<IO_FOEXT_SILO_PARAMETERS>} 
     */
    static IoGetSiloParameters(FileObject) {
        result := DllCall("ntoskrnl.exe\IoGetSiloParameters", "ptr", FileObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {PESILO} 
     */
    static IoGetSilo(FileObject) {
        result := DllCall("ntoskrnl.exe\IoGetSilo", "ptr", FileObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {Pointer<TXN_PARAMETER_BLOCK>} 
     */
    static IoGetTransactionParameterBlock(FileObject) {
        result := DllCall("ntoskrnl.exe\IoGetTransactionParameterBlock", "ptr", FileObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} FileHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer<Integer>} AllocationSize 
     * @param {Integer} FileAttributes 
     * @param {Integer} ShareAccess 
     * @param {Integer} Disposition 
     * @param {Integer} CreateOptions 
     * @param {Pointer<Void>} EaBuffer 
     * @param {Integer} EaLength 
     * @param {Integer} CreateFileType 
     * @param {Pointer<Void>} InternalParameters 
     * @param {Integer} Options 
     * @param {Pointer<IO_DRIVER_CREATE_CONTEXT>} DriverContext 
     * @returns {NTSTATUS} 
     */
    static IoCreateFileEx(FileHandle, DesiredAccess, ObjectAttributes, IoStatusBlock, AllocationSize, FileAttributes, ShareAccess, Disposition, CreateOptions, EaBuffer, EaLength, CreateFileType, InternalParameters, Options, DriverContext) {
        AllocationSizeMarshal := AllocationSize is VarRef ? "int64*" : "ptr"
        EaBufferMarshal := EaBuffer is VarRef ? "ptr" : "ptr"
        InternalParametersMarshal := InternalParameters is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoCreateFileEx", "ptr", FileHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "ptr", IoStatusBlock, AllocationSizeMarshal, AllocationSize, "uint", FileAttributes, "uint", ShareAccess, "uint", Disposition, "uint", CreateOptions, EaBufferMarshal, EaBuffer, "uint", EaLength, "int", CreateFileType, InternalParametersMarshal, InternalParameters, "uint", Options, "ptr", DriverContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Pointer>} ExtraCreateParameter 
     * @returns {NTSTATUS} 
     */
    static IoSetIrpExtraCreateParameter(Irp, ExtraCreateParameter) {
        ExtraCreateParameterMarshal := ExtraCreateParameter is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoSetIrpExtraCreateParameter", "ptr", Irp, ExtraCreateParameterMarshal, ExtraCreateParameter, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoClearIrpExtraCreateParameter(Irp) {
        DllCall("ntoskrnl.exe\IoClearIrpExtraCreateParameter", "ptr", Irp)
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Pointer<Pointer>>} ExtraCreateParameter 
     * @returns {NTSTATUS} 
     */
    static IoGetIrpExtraCreateParameter(Irp, ExtraCreateParameter) {
        ExtraCreateParameterMarshal := ExtraCreateParameter is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetIrpExtraCreateParameter", "ptr", Irp, ExtraCreateParameterMarshal, ExtraCreateParameter, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Pointer} FileInformation 
     * @param {Integer} Length 
     * @param {Integer} FileInformationClass 
     * @param {Integer} Options 
     * @param {Pointer<IO_DRIVER_CREATE_CONTEXT>} DriverContext 
     * @returns {NTSTATUS} 
     */
    static IoQueryInformationByName(ObjectAttributes, IoStatusBlock, FileInformation, Length, FileInformationClass, Options, DriverContext) {
        result := DllCall("ntoskrnl.exe\IoQueryInformationByName", "ptr", ObjectAttributes, "ptr", IoStatusBlock, "ptr", FileInformation, "uint", Length, "int", FileInformationClass, "uint", Options, "ptr", DriverContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} SourceDevice 
     * @param {Pointer<DEVICE_OBJECT>} TargetDevice 
     * @param {Pointer<Pointer<DEVICE_OBJECT>>} AttachedToDeviceObject 
     * @returns {NTSTATUS} 
     */
    static IoAttachDeviceToDeviceStackSafe(SourceDevice, TargetDevice, AttachedToDeviceObject) {
        AttachedToDeviceObjectMarshal := AttachedToDeviceObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoAttachDeviceToDeviceStackSafe", "ptr", SourceDevice, "ptr", TargetDevice, AttachedToDeviceObjectMarshal, AttachedToDeviceObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {BOOLEAN} 
     */
    static IoIsFileOriginRemote(FileObject) {
        result := DllCall("ntoskrnl.exe\IoIsFileOriginRemote", "ptr", FileObject, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {BOOLEAN} Remote 
     * @returns {NTSTATUS} 
     */
    static IoSetFileOrigin(FileObject, Remote) {
        result := DllCall("ntoskrnl.exe\IoSetFileOrigin", "ptr", FileObject, "char", Remote, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {BOOLEAN} 
     */
    static IoIsFileObjectIgnoringSharing(FileObject) {
        result := DllCall("ntoskrnl.exe\IoIsFileObjectIgnoringSharing", "ptr", FileObject, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {NTSTATUS} 
     */
    static IoSetFileObjectIgnoreSharing(FileObject) {
        result := DllCall("ntoskrnl.exe\IoSetFileObjectIgnoreSharing", "ptr", FileObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {Integer} 
     */
    static IoGetPagingIoPriority(Irp) {
        result := DllCall("ntoskrnl.exe\IoGetPagingIoPriority", "ptr", Irp, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PBOOT_DRIVER_CALLBACK_FUNCTION>} CallbackFunction 
     * @param {Pointer<Void>} CallbackContext 
     * @returns {Pointer<Void>} 
     */
    static IoRegisterBootDriverCallback(CallbackFunction, CallbackContext) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\IoRegisterBootDriverCallback", "ptr", CallbackFunction, CallbackContextMarshal, CallbackContext, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} CallbackHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoUnregisterBootDriverCallback(CallbackHandle) {
        CallbackHandleMarshal := CallbackHandle is VarRef ? "ptr" : "ptr"

        DllCall("ntoskrnl.exe\IoUnregisterBootDriverCallback", CallbackHandleMarshal, CallbackHandle)
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Guid>} Guid 
     * @returns {NTSTATUS} 
     */
    static IoGetActivityIdIrp(Irp, Guid) {
        result := DllCall("ntoskrnl.exe\IoGetActivityIdIrp", "ptr", Irp, "ptr", Guid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Guid>} Guid 
     * @returns {NTSTATUS} 
     */
    static IoSetActivityIdIrp(Irp, Guid) {
        result := DllCall("ntoskrnl.exe\IoSetActivityIdIrp", "ptr", Irp, "ptr", Guid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Guid>} PropagatedId 
     * @param {Pointer<Pointer<Guid>>} OriginalId 
     * @returns {NTSTATUS} 
     */
    static IoPropagateActivityIdToThread(Irp, PropagatedId, OriginalId) {
        OriginalIdMarshal := OriginalId is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoPropagateActivityIdToThread", "ptr", Irp, "ptr", PropagatedId, OriginalIdMarshal, OriginalId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ActivityId 
     * @returns {Pointer<Guid>} 
     */
    static IoSetActivityIdThread(ActivityId) {
        result := DllCall("ntoskrnl.exe\IoSetActivityIdThread", "ptr", ActivityId, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} OriginalId 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoClearActivityIdThread(OriginalId) {
        DllCall("ntoskrnl.exe\IoClearActivityIdThread", "ptr", OriginalId)
    }

    /**
     * 
     * @returns {Pointer<Guid>} 
     */
    static IoGetActivityIdThread() {
        result := DllCall("ntoskrnl.exe\IoGetActivityIdThread", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ActivityId 
     * @param {Pointer<Guid>} RelatedActivityId 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoTransferActivityId(ActivityId, RelatedActivityId) {
        DllCall("ntoskrnl.exe\IoTransferActivityId", "ptr", ActivityId, "ptr", RelatedActivityId)
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Pointer<Integer>} ZeroingOffset 
     * @returns {NTSTATUS} 
     */
    static IoGetFsZeroingOffset(Irp, ZeroingOffset) {
        ZeroingOffsetMarshal := ZeroingOffset is VarRef ? "uint*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoGetFsZeroingOffset", "ptr", Irp, ZeroingOffsetMarshal, ZeroingOffset, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @returns {NTSTATUS} 
     */
    static IoSetFsZeroingOffsetRequired(Irp) {
        result := DllCall("ntoskrnl.exe\IoSetFsZeroingOffsetRequired", "ptr", Irp, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} Irp 
     * @param {Integer} ZeroingOffset 
     * @returns {NTSTATUS} 
     */
    static IoSetFsZeroingOffset(Irp, ZeroingOffset) {
        result := DllCall("ntoskrnl.exe\IoSetFsZeroingOffset", "ptr", Irp, "uint", ZeroingOffset, "int")
        return result
    }

    /**
     * 
     * @param {NTSTATUS} Status 
     * @returns {Integer} 
     */
    static IoIsValidIrpStatus(Status) {
        result := DllCall("ntoskrnl.exe\IoIsValidIrpStatus", "int", Status, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {PEPROCESS} Process 
     * @returns {NTSTATUS} 
     */
    static IoIncrementKeepAliveCount(FileObject, Process) {
        result := DllCall("ntoskrnl.exe\IoIncrementKeepAliveCount", "ptr", FileObject, "ptr", Process, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {PEPROCESS} Process 
     * @returns {NTSTATUS} 
     */
    static IoDecrementKeepAliveCount(FileObject, Process) {
        result := DllCall("ntoskrnl.exe\IoDecrementKeepAliveCount", "ptr", FileObject, "ptr", Process, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @returns {PEPROCESS} 
     */
    static IoGetInitiatorProcess(FileObject) {
        result := DllCall("ntoskrnl.exe\IoGetInitiatorProcess", "ptr", FileObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<IRP>} MasterIrp 
     * @param {NTSTATUS} Status 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoSetMasterIrpStatus(MasterIrp, Status) {
        DllCall("ntoskrnl.exe\IoSetMasterIrpStatus", "ptr", MasterIrp, "int", Status)
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<UNICODE_STRING>} FullPath 
     * @returns {NTSTATUS} 
     */
    static IoQueryFullDriverPath(DriverObject, FullPath) {
        result := DllCall("ntoskrnl.exe\IoQueryFullDriverPath", "ptr", DriverObject, "ptr", FullPath, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Integer} LegacyBusType 
     * @param {Integer} BusNumber 
     * @param {Integer} SlotNumber 
     * @param {Pointer<CM_RESOURCE_LIST>} ResourceList 
     * @param {Pointer<IO_RESOURCE_REQUIREMENTS_LIST>} ResourceRequirements 
     * @param {BOOLEAN} ResourceAssigned 
     * @param {Pointer<Pointer<DEVICE_OBJECT>>} DeviceObject 
     * @returns {NTSTATUS} 
     */
    static IoReportDetectedDevice(DriverObject, LegacyBusType, BusNumber, SlotNumber, ResourceList, ResourceRequirements, ResourceAssigned, DeviceObject) {
        DeviceObjectMarshal := DeviceObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoReportDetectedDevice", "ptr", DriverObject, "int", LegacyBusType, "uint", BusNumber, "uint", SlotNumber, "ptr", ResourceList, "ptr", ResourceRequirements, "char", ResourceAssigned, DeviceObjectMarshal, DeviceObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @returns {NTSTATUS} 
     */
    static IoReportRootDevice(DriverObject) {
        result := DllCall("ntoskrnl.exe\IoReportRootDevice", "ptr", DriverObject, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer} DriverList 
     * @param {Integer} DriverListSize 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer} DeviceList 
     * @param {Integer} DeviceListSize 
     * @param {Pointer<BOOLEAN>} ConflictDetected 
     * @returns {NTSTATUS} 
     */
    static IoReportResourceForDetection(DriverObject, DriverList, DriverListSize, DeviceObject, DeviceList, DeviceListSize, ConflictDetected) {
        ConflictDetectedMarshal := ConflictDetected is VarRef ? "char*" : "ptr"

        result := DllCall("ntoskrnl.exe\IoReportResourceForDetection", "ptr", DriverObject, "ptr", DriverList, "uint", DriverListSize, "ptr", DeviceObject, "ptr", DeviceList, "uint", DeviceListSize, ConflictDetectedMarshal, ConflictDetected, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PHAL_RESET_DISPLAY_PARAMETERS>} ResetDisplayParameters 
     * @returns {String} Nothing - always returns an empty string
     */
    static HalAcquireDisplayOwnership(ResetDisplayParameters) {
        DllCall("HAL.dll\HalAcquireDisplayOwnership", "ptr", ResetDisplayParameters)
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} RegistryPath 
     * @param {Pointer<UNICODE_STRING>} DriverClassName 
     * @param {Pointer<DRIVER_OBJECT>} DriverObject 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} BusType 
     * @param {Integer} BusNumber 
     * @param {Integer} SlotNumber 
     * @param {Pointer<Pointer<CM_RESOURCE_LIST>>} AllocatedResources 
     * @returns {NTSTATUS} 
     */
    static HalAssignSlotResources(RegistryPath, DriverClassName, DriverObject, DeviceObject, BusType, BusNumber, SlotNumber, AllocatedResources) {
        AllocatedResourcesMarshal := AllocatedResources is VarRef ? "ptr*" : "ptr"

        result := DllCall("HAL.dll\HalAssignSlotResources", "ptr", RegistryPath, "ptr", DriverClassName, "ptr", DriverObject, "ptr", DeviceObject, "int", BusType, "uint", BusNumber, "uint", SlotNumber, AllocatedResourcesMarshal, AllocatedResources, "int")
        return result
    }

    /**
     * 
     * @param {Integer} InterfaceType 
     * @param {Integer} BusNumber 
     * @param {Integer} BusInterruptLevel 
     * @param {Integer} BusInterruptVector 
     * @param {Pointer<Integer>} Irql 
     * @param {Pointer<Pointer>} Affinity 
     * @returns {Integer} 
     */
    static HalGetInterruptVector(InterfaceType, BusNumber, BusInterruptLevel, BusInterruptVector, Irql, Affinity) {
        IrqlMarshal := Irql is VarRef ? "char*" : "ptr"
        AffinityMarshal := Affinity is VarRef ? "ptr*" : "ptr"

        result := DllCall("HAL.dll\HalGetInterruptVector", "int", InterfaceType, "uint", BusNumber, "uint", BusInterruptLevel, "uint", BusInterruptVector, IrqlMarshal, Irql, AffinityMarshal, Affinity, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} BusDataType 
     * @param {Integer} BusNumber 
     * @param {Integer} SlotNumber 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length 
     * @returns {Integer} 
     */
    static HalSetBusData(BusDataType, BusNumber, SlotNumber, Buffer_R, Length) {
        result := DllCall("HAL.dll\HalSetBusData", "int", BusDataType, "uint", BusNumber, "uint", SlotNumber, "ptr", Buffer_R, "uint", Length, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} BusDataType 
     * @param {Integer} BusNumber 
     * @param {Integer} SlotNumber 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @returns {Integer} 
     */
    static HalSetBusDataByOffset(BusDataType, BusNumber, SlotNumber, Buffer_R, Offset, Length) {
        result := DllCall("HAL.dll\HalSetBusDataByOffset", "int", BusDataType, "uint", BusNumber, "uint", SlotNumber, "ptr", Buffer_R, "uint", Offset, "uint", Length, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} InterfaceType 
     * @param {Integer} BusNumber 
     * @param {Integer} BusAddress 
     * @param {Pointer<Integer>} AddressSpace 
     * @param {Pointer<Integer>} TranslatedAddress 
     * @returns {BOOLEAN} 
     */
    static HalTranslateBusAddress(InterfaceType, BusNumber, BusAddress, AddressSpace, TranslatedAddress) {
        AddressSpaceMarshal := AddressSpace is VarRef ? "uint*" : "ptr"
        TranslatedAddressMarshal := TranslatedAddress is VarRef ? "int64*" : "ptr"

        result := DllCall("HAL.dll\HalTranslateBusAddress", "int", InterfaceType, "uint", BusNumber, "int64", BusAddress, AddressSpaceMarshal, AddressSpace, TranslatedAddressMarshal, TranslatedAddress, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
     * @param {Pointer<Integer>} NumberOfMapRegisters 
     * @returns {Pointer<Void>} 
     */
    static HalAllocateCrashDumpRegisters(AdapterObject, NumberOfMapRegisters) {
        AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"
        NumberOfMapRegistersMarshal := NumberOfMapRegisters is VarRef ? "uint*" : "ptr"

        result := DllCall("HAL.dll\HalAllocateCrashDumpRegisters", AdapterObjectMarshal, AdapterObject, NumberOfMapRegistersMarshal, NumberOfMapRegisters, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<_ADAPTER_OBJECT>} Adapter 
     * @param {Integer} NumberOfMapRegisters 
     * @param {Integer} Type 
     * @param {Pointer<Pointer<Void>>} MapRegisterBase 
     * @param {Pointer<Integer>} MapRegistersAvailable 
     * @returns {NTSTATUS} 
     */
    static HalDmaAllocateCrashDumpRegistersEx(Adapter, NumberOfMapRegisters, Type, MapRegisterBase, MapRegistersAvailable) {
        AdapterMarshal := Adapter is VarRef ? "ptr*" : "ptr"
        MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr*" : "ptr"
        MapRegistersAvailableMarshal := MapRegistersAvailable is VarRef ? "uint*" : "ptr"

        result := DllCall("HAL.dll\HalDmaAllocateCrashDumpRegistersEx", AdapterMarshal, Adapter, "uint", NumberOfMapRegisters, "int", Type, MapRegisterBaseMarshal, MapRegisterBase, MapRegistersAvailableMarshal, MapRegistersAvailable, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<_ADAPTER_OBJECT>} Adapter 
     * @param {Integer} Type 
     * @returns {NTSTATUS} 
     */
    static HalDmaFreeCrashDumpRegistersEx(Adapter, Type) {
        AdapterMarshal := Adapter is VarRef ? "ptr*" : "ptr"

        result := DllCall("HAL.dll\HalDmaFreeCrashDumpRegistersEx", AdapterMarshal, Adapter, "int", Type, "int")
        return result
    }

    /**
     * 
     * @param {Integer} BusDataType 
     * @param {Integer} BusNumber 
     * @param {Integer} SlotNumber 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Length 
     * @returns {Integer} 
     */
    static HalGetBusData(BusDataType, BusNumber, SlotNumber, Buffer_R, Length) {
        result := DllCall("HAL.dll\HalGetBusData", "int", BusDataType, "uint", BusNumber, "uint", SlotNumber, "ptr", Buffer_R, "uint", Length, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} BusDataType 
     * @param {Integer} BusNumber 
     * @param {Integer} SlotNumber 
     * @param {Pointer} Buffer_R 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @returns {Integer} 
     */
    static HalGetBusDataByOffset(BusDataType, BusNumber, SlotNumber, Buffer_R, Offset, Length) {
        result := DllCall("HAL.dll\HalGetBusDataByOffset", "int", BusDataType, "uint", BusNumber, "uint", SlotNumber, "ptr", Buffer_R, "uint", Offset, "uint", Length, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVICE_DESCRIPTION>} DeviceDescription 
     * @param {Pointer<Integer>} NumberOfMapRegisters 
     * @returns {Pointer<_ADAPTER_OBJECT>} 
     */
    static HalGetAdapter(DeviceDescription, NumberOfMapRegisters) {
        NumberOfMapRegistersMarshal := NumberOfMapRegisters is VarRef ? "uint*" : "ptr"

        result := DllCall("HAL.dll\HalGetAdapter", "ptr", DeviceDescription, NumberOfMapRegistersMarshal, NumberOfMapRegisters, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} Frequency 
     * @returns {BOOLEAN} 
     */
    static HalMakeBeep(Frequency) {
        result := DllCall("HAL.dll\HalMakeBeep", "uint", Frequency, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
     * @param {Pointer<WAIT_CONTEXT_BLOCK>} Wcb 
     * @param {Integer} NumberOfMapRegisters 
     * @param {Pointer<DRIVER_CONTROL>} ExecutionRoutine 
     * @returns {NTSTATUS} 
     */
    static HalAllocateAdapterChannel(AdapterObject, Wcb, NumberOfMapRegisters, ExecutionRoutine) {
        AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("HAL.dll\HalAllocateAdapterChannel", AdapterObjectMarshal, AdapterObject, "ptr", Wcb, "uint", NumberOfMapRegisters, "ptr", ExecutionRoutine, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} LogicalAddress 
     * @param {BOOLEAN} CacheEnabled 
     * @returns {Pointer<Void>} 
     */
    static HalAllocateCommonBuffer(AdapterObject, Length, LogicalAddress, CacheEnabled) {
        AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"
        LogicalAddressMarshal := LogicalAddress is VarRef ? "int64*" : "ptr"

        result := DllCall("HAL.dll\HalAllocateCommonBuffer", AdapterObjectMarshal, AdapterObject, "uint", Length, LogicalAddressMarshal, LogicalAddress, "char", CacheEnabled, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
     * @param {Integer} Length 
     * @param {Integer} LogicalAddress 
     * @param {Pointer<Void>} VirtualAddress 
     * @param {BOOLEAN} CacheEnabled 
     * @returns {String} Nothing - always returns an empty string
     */
    static HalFreeCommonBuffer(AdapterObject, Length, LogicalAddress, VirtualAddress, CacheEnabled) {
        AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"
        VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"

        DllCall("HAL.dll\HalFreeCommonBuffer", AdapterObjectMarshal, AdapterObject, "uint", Length, "int64", LogicalAddress, VirtualAddressMarshal, VirtualAddress, "char", CacheEnabled)
    }

    /**
     * 
     * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
     * @returns {Integer} 
     */
    static HalReadDmaCounter(AdapterObject) {
        AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"

        result := DllCall("HAL.dll\HalReadDmaCounter", AdapterObjectMarshal, AdapterObject, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
     * @param {Pointer<MDL>} Mdl 
     * @param {Pointer<Void>} MapRegisterBase 
     * @param {Pointer<Void>} CurrentVa 
     * @param {Integer} Length 
     * @param {BOOLEAN} WriteToDevice 
     * @returns {BOOLEAN} 
     */
    static IoFlushAdapterBuffers(AdapterObject, Mdl, MapRegisterBase, CurrentVa, Length, WriteToDevice) {
        AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"
        MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr" : "ptr"
        CurrentVaMarshal := CurrentVa is VarRef ? "ptr" : "ptr"

        result := DllCall("HAL.dll\IoFlushAdapterBuffers", AdapterObjectMarshal, AdapterObject, "ptr", Mdl, MapRegisterBaseMarshal, MapRegisterBase, CurrentVaMarshal, CurrentVa, "uint", Length, "char", WriteToDevice, "char")
        return result
    }

    /**
     * 
     * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoFreeAdapterChannel(AdapterObject) {
        AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"

        DllCall("HAL.dll\IoFreeAdapterChannel", AdapterObjectMarshal, AdapterObject)
    }

    /**
     * 
     * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
     * @param {Pointer<Void>} MapRegisterBase 
     * @param {Integer} NumberOfMapRegisters 
     * @returns {String} Nothing - always returns an empty string
     */
    static IoFreeMapRegisters(AdapterObject, MapRegisterBase, NumberOfMapRegisters) {
        AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"
        MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr" : "ptr"

        DllCall("HAL.dll\IoFreeMapRegisters", AdapterObjectMarshal, AdapterObject, MapRegisterBaseMarshal, MapRegisterBase, "uint", NumberOfMapRegisters)
    }

    /**
     * 
     * @param {Pointer<_ADAPTER_OBJECT>} AdapterObject 
     * @param {Pointer<MDL>} Mdl 
     * @param {Pointer<Void>} MapRegisterBase 
     * @param {Pointer<Void>} CurrentVa 
     * @param {Pointer<Integer>} Length 
     * @param {BOOLEAN} WriteToDevice 
     * @returns {Integer} 
     */
    static IoMapTransfer(AdapterObject, Mdl, MapRegisterBase, CurrentVa, Length, WriteToDevice) {
        AdapterObjectMarshal := AdapterObject is VarRef ? "ptr*" : "ptr"
        MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr" : "ptr"
        CurrentVaMarshal := CurrentVa is VarRef ? "ptr" : "ptr"
        LengthMarshal := Length is VarRef ? "uint*" : "ptr"

        result := DllCall("HAL.dll\IoMapTransfer", AdapterObjectMarshal, AdapterObject, "ptr", Mdl, MapRegisterBaseMarshal, MapRegisterBase, CurrentVaMarshal, CurrentVa, LengthMarshal, Length, "char", WriteToDevice, "int64")
        return result
    }

    /**
     * 
     * @param {Pointer<WHEA_ERROR_SOURCE_DESCRIPTOR>} ErrorSource 
     * @param {Pointer<WHEA_ERROR_RECORD>} ErrorRecord 
     * @returns {String} Nothing - always returns an empty string
     */
    static HalBugCheckSystem(ErrorSource, ErrorRecord) {
        DllCall("HAL.dll\HalBugCheckSystem", "ptr", ErrorSource, "ptr", ErrorRecord)
    }

    /**
     * 
     * @param {Pointer<GROUP_AFFINITY>} GroupAffinty 
     * @param {Integer} GroupCount 
     * @param {Pointer<PHYSICAL_COUNTER_RESOURCE_LIST>} ResourceList 
     * @param {Pointer<HANDLE>} CounterSetHandle 
     * @returns {NTSTATUS} 
     */
    static HalAllocateHardwareCounters(GroupAffinty, GroupCount, ResourceList, CounterSetHandle) {
        result := DllCall("HAL.dll\HalAllocateHardwareCounters", "ptr", GroupAffinty, "uint", GroupCount, "ptr", ResourceList, "ptr", CounterSetHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} CounterSetHandle 
     * @returns {NTSTATUS} 
     */
    static HalFreeHardwareCounters(CounterSetHandle) {
        CounterSetHandle := CounterSetHandle is Win32Handle ? NumGet(CounterSetHandle, "ptr") : CounterSetHandle

        result := DllCall("HAL.dll\HalFreeHardwareCounters", "ptr", CounterSetHandle, "int")
        return result
    }

    /**
     * 
     * @param {NTSTATUS} Status 
     * @returns {BOOLEAN} 
     */
    static FsRtlIsTotalDeviceFailure(Status) {
        result := DllCall("ntoskrnl.exe\FsRtlIsTotalDeviceFailure", "int", Status, "char")
        return result
    }

    /**
     * 
     * @param {HANDLE} FileHandle 
     * @param {HANDLE} Event 
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine 
     * @param {Pointer<Void>} ApcContext 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Integer} IoControlCode 
     * @param {Pointer} InputBuffer 
     * @param {Integer} InputBufferLength 
     * @param {Pointer} OutputBuffer 
     * @param {Integer} OutputBufferLength 
     * @returns {NTSTATUS} 
     */
    static ZwDeviceIoControlFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, IoControlCode, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwDeviceIoControlFile", "ptr", FileHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "uint", IoControlCode, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} String 
     * @returns {NTSTATUS} 
     */
    static ZwDisplayString(String) {
        result := DllCall("ntdll.dll\ZwDisplayString", "ptr", String, "int")
        return result
    }

    /**
     * 
     * @param {Integer} InformationLevel 
     * @param {Pointer} InputBuffer 
     * @param {Integer} InputBufferLength 
     * @param {Pointer} OutputBuffer 
     * @param {Integer} OutputBufferLength 
     * @returns {NTSTATUS} 
     */
    static ZwPowerInformation(InformationLevel, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength) {
        result := DllCall("ntdll.dll\ZwPowerInformation", "int", InformationLevel, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<LUID>} Luid 
     * @returns {NTSTATUS} 
     */
    static ZwAllocateLocallyUniqueId(Luid) {
        result := DllCall("ntdll.dll\ZwAllocateLocallyUniqueId", "ptr", Luid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER>} Configuration 
     * @param {Integer} NumberPreallocatedErrorReports 
     * @returns {NTSTATUS} 
     */
    static WheaAddErrorSourceDeviceDriver(Context, Configuration, NumberPreallocatedErrorReports) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\WheaAddErrorSourceDeviceDriver", ContextMarshal, Context, "ptr", Configuration, "uint", NumberPreallocatedErrorReports, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER>} Configuration 
     * @param {Integer} NumBuffersToPreallocate 
     * @param {Integer} MaxDataLength 
     * @returns {NTSTATUS} 
     */
    static WheaAddErrorSourceDeviceDriverV1(Context, Configuration, NumBuffersToPreallocate, MaxDataLength) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\WheaAddErrorSourceDeviceDriverV1", ContextMarshal, Context, "ptr", Configuration, "uint", NumBuffersToPreallocate, "uint", MaxDataLength, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ErrorSourceId 
     * @returns {NTSTATUS} 
     */
    static WheaRemoveErrorSourceDeviceDriver(ErrorSourceId) {
        result := DllCall("ntoskrnl.exe\WheaRemoveErrorSourceDeviceDriver", "uint", ErrorSourceId, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ErrorSourceId 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer} ErrorData 
     * @param {Integer} ErrorDataLength 
     * @param {Pointer<Guid>} SectionTypeGuid 
     * @param {Integer} ErrorSeverity 
     * @param {PSTR} DeviceFriendlyName 
     * @returns {NTSTATUS} 
     */
    static WheaReportHwErrorDeviceDriver(ErrorSourceId, DeviceObject, ErrorData, ErrorDataLength, SectionTypeGuid, ErrorSeverity, DeviceFriendlyName) {
        DeviceFriendlyName := DeviceFriendlyName is String ? StrPtr(DeviceFriendlyName) : DeviceFriendlyName

        result := DllCall("ntoskrnl.exe\WheaReportHwErrorDeviceDriver", "uint", ErrorSourceId, "ptr", DeviceObject, "ptr", ErrorData, "uint", ErrorDataLength, "ptr", SectionTypeGuid, "int", ErrorSeverity, "ptr", DeviceFriendlyName, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ErrorSourceId 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {Pointer<Void>} 
     */
    static WheaCreateHwErrorReportDeviceDriver(ErrorSourceId, DeviceObject) {
        result := DllCall("ntoskrnl.exe\WheaCreateHwErrorReportDeviceDriver", "uint", ErrorSourceId, "ptr", DeviceObject, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ErrorHandle 
     * @param {Integer} SectionDataLength 
     * @param {Pointer<WHEA_DRIVER_BUFFER_SET>} BufferSet 
     * @returns {NTSTATUS} 
     */
    static WheaAddHwErrorReportSectionDeviceDriver(ErrorHandle, SectionDataLength, BufferSet) {
        ErrorHandleMarshal := ErrorHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\WheaAddHwErrorReportSectionDeviceDriver", ErrorHandleMarshal, ErrorHandle, "uint", SectionDataLength, "ptr", BufferSet, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ErrorHandle 
     * @returns {NTSTATUS} 
     */
    static WheaHwErrorReportAbandonDeviceDriver(ErrorHandle) {
        ErrorHandleMarshal := ErrorHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\WheaHwErrorReportAbandonDeviceDriver", ErrorHandleMarshal, ErrorHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ErrorHandle 
     * @returns {NTSTATUS} 
     */
    static WheaHwErrorReportSubmitDeviceDriver(ErrorHandle) {
        ErrorHandleMarshal := ErrorHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\WheaHwErrorReportSubmitDeviceDriver", ErrorHandleMarshal, ErrorHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ErrorHandle 
     * @param {Integer} ErrorSeverity 
     * @returns {NTSTATUS} 
     */
    static WheaHwErrorReportSetSeverityDeviceDriver(ErrorHandle, ErrorSeverity) {
        ErrorHandleMarshal := ErrorHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\WheaHwErrorReportSetSeverityDeviceDriver", ErrorHandleMarshal, ErrorHandle, "int", ErrorSeverity, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<WHEA_DRIVER_BUFFER_SET>} BufferSet 
     * @param {Integer} NameLength 
     * @param {Pointer} Name 
     * @returns {NTSTATUS} 
     */
    static WheaHwErrorReportSetSectionNameDeviceDriver(BufferSet, NameLength, Name) {
        result := DllCall("ntoskrnl.exe\WheaHwErrorReportSetSectionNameDeviceDriver", "ptr", BufferSet, "uint", NameLength, "ptr", Name, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<WHEA_ERROR_PACKET_V2>} ErrorPacket 
     * @returns {NTSTATUS} 
     */
    static WheaReportHwError(ErrorPacket) {
        result := DllCall("ntoskrnl.exe\WheaReportHwError", "ptr", ErrorPacket, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<WHEA_ERROR_SOURCE_DESCRIPTOR>} ErrorSource 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static WheaAddErrorSource(ErrorSource, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\WheaAddErrorSource", "ptr", ErrorSource, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<WHEA_ERROR_RECORD_HEADER>} Header 
     * @returns {NTSTATUS} 
     */
    static WheaInitializeRecordHeader(Header) {
        result := DllCall("ntoskrnl.exe\WheaInitializeRecordHeader", "ptr", Header, "int")
        return result
    }

    /**
     * 
     * @param {Integer} SourceType 
     * @param {Pointer<WHEA_ERROR_SOURCE_CONFIGURATION>} Configuration 
     * @returns {NTSTATUS} 
     */
    static WheaConfigureErrorSource(SourceType, Configuration) {
        result := DllCall("ntoskrnl.exe\WheaConfigureErrorSource", "int", SourceType, "ptr", Configuration, "int")
        return result
    }

    /**
     * 
     * @param {Integer} SourceType 
     * @returns {NTSTATUS} 
     */
    static WheaUnconfigureErrorSource(SourceType) {
        result := DllCall("ntoskrnl.exe\WheaUnconfigureErrorSource", "int", SourceType, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ErrorSourceId 
     * @returns {String} Nothing - always returns an empty string
     */
    static WheaRemoveErrorSource(ErrorSourceId) {
        DllCall("ntoskrnl.exe\WheaRemoveErrorSource", "uint", ErrorSourceId)
    }

    /**
     * 
     * @param {Pointer<WHEA_EVENT_LOG_ENTRY>} Entry 
     * @returns {String} Nothing - always returns an empty string
     */
    static WheaLogInternalEvent(Entry) {
        DllCall("ntoskrnl.exe\WheaLogInternalEvent", "ptr", Entry)
    }

    /**
     * 
     * @param {Integer} ErrorSourceId 
     * @returns {Integer} 
     */
    static WheaErrorSourceGetState(ErrorSourceId) {
        result := DllCall("ntoskrnl.exe\WheaErrorSourceGetState", "uint", ErrorSourceId, "int")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static WheaIsCriticalState() {
        result := DllCall("ntoskrnl.exe\WheaIsCriticalState", "char")
        return result
    }

    /**
     * 
     * @param {Pointer<PFN_WHEA_HIGH_IRQL_LOG_SEL_EVENT_HANDLER>} Handler 
     * @param {Pointer<Void>} Context 
     * @returns {BOOLEAN} 
     */
    static WheaHighIrqlLogSelEventHandlerRegister(Handler, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\WheaHighIrqlLogSelEventHandlerRegister", "ptr", Handler, ContextMarshal, Context, "char")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    static WheaHighIrqlLogSelEventHandlerUnregister() {
        DllCall("ntoskrnl.exe\WheaHighIrqlLogSelEventHandlerUnregister")
    }

    /**
     * 
     * @param {Pointer<PFN_IN_USE_PAGE_OFFLINE_NOTIFY>} Callback 
     * @param {Pointer<Void>} Context 
     * @returns {NTSTATUS} 
     */
    static WheaRegisterInUsePageOfflineNotification(Callback, Context) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        result := DllCall("ntoskrnl.exe\WheaRegisterInUsePageOfflineNotification", "ptr", Callback, ContextMarshal, Context, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PFN_IN_USE_PAGE_OFFLINE_NOTIFY>} Callback 
     * @returns {NTSTATUS} 
     */
    static WheaUnregisterInUsePageOfflineNotification(Callback) {
        result := DllCall("ntoskrnl.exe\WheaUnregisterInUsePageOfflineNotification", "ptr", Callback, "int")
        return result
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static WheaGetNotifyAllOfflinesPolicy() {
        result := DllCall("ntoskrnl.exe\WheaGetNotifyAllOfflinesPolicy", "char")
        return result
    }

    /**
     * 
     * @param {Pointer<PHVL_WHEA_ERROR_NOTIFICATION>} Callback 
     * @returns {NTSTATUS} 
     */
    static HvlRegisterWheaErrorNotification(Callback) {
        result := DllCall("ntoskrnl.exe\HvlRegisterWheaErrorNotification", "ptr", Callback, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PHVL_WHEA_ERROR_NOTIFICATION>} Callback 
     * @returns {NTSTATUS} 
     */
    static HvlUnregisterWheaErrorNotification(Callback) {
        result := DllCall("ntoskrnl.exe\HvlUnregisterWheaErrorNotification", "ptr", Callback, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Size 
     * @returns {Pointer<Void>} 
     */
    static PshedAllocateMemory(Size) {
        result := DllCall("PSHED.dll\PshedAllocateMemory", "uint", Size, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Address 
     * @returns {String} Nothing - always returns an empty string
     */
    static PshedFreeMemory(Address) {
        AddressMarshal := Address is VarRef ? "ptr" : "ptr"

        DllCall("PSHED.dll\PshedFreeMemory", AddressMarshal, Address)
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    static PshedIsSystemWheaEnabled() {
        result := DllCall("PSHED.dll\PshedIsSystemWheaEnabled", "char")
        return result
    }

    /**
     * 
     * @param {Pointer<WHEA_PSHED_PLUGIN_REGISTRATION_PACKET_V2>} Packet 
     * @returns {NTSTATUS} 
     */
    static PshedRegisterPlugin(Packet) {
        result := DllCall("PSHED.dll\PshedRegisterPlugin", "ptr", Packet, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} PluginHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static PshedUnregisterPlugin(PluginHandle) {
        PluginHandleMarshal := PluginHandle is VarRef ? "ptr" : "ptr"

        DllCall("PSHED.dll\PshedUnregisterPlugin", PluginHandleMarshal, PluginHandle)
    }

    /**
     * 
     * @param {Pointer<WHEA_ERROR_SOURCE_DESCRIPTOR>} ErrorSource 
     * @param {Pointer<PKSYNCHRONIZE_ROUTINE>} SynchronizeRoutine 
     * @param {Pointer<Void>} SynchronizeContext 
     * @returns {BOOLEAN} 
     */
    static PshedSynchronizeExecution(ErrorSource, SynchronizeRoutine, SynchronizeContext) {
        SynchronizeContextMarshal := SynchronizeContext is VarRef ? "ptr" : "ptr"

        result := DllCall("PSHED.dll\PshedSynchronizeExecution", "ptr", ErrorSource, "ptr", SynchronizeRoutine, SynchronizeContextMarshal, SynchronizeContext, "char")
        return result
    }

;@endregion Methods
}
