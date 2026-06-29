#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global MCA_EXTREG_V2MAX := 24

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_MAJOR_REVISION_SAL_03_00 := 0

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_MINOR_REVISION_SAL_03_00 := 2

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROCESSOR_STATE_PARAMETER_CACHE_CHECK_SHIFT := 59

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROCESSOR_STATE_PARAMETER_CACHE_CHECK_MASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROCESSOR_STATE_PARAMETER_TLB_CHECK_SHIFT := 60

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROCESSOR_STATE_PARAMETER_TLB_CHECK_MASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROCESSOR_STATE_PARAMETER_BUS_CHECK_SHIFT := 61

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROCESSOR_STATE_PARAMETER_BUS_CHECK_MASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROCESSOR_STATE_PARAMETER_REG_CHECK_SHIFT := 62

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROCESSOR_STATE_PARAMETER_REG_CHECK_MASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROCESSOR_STATE_PARAMETER_MICROARCH_CHECK_SHIFT := 63

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROCESSOR_STATE_PARAMETER_MICROARCH_CHECK_MASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROCESSOR_STATE_PARAMETER_UNKNOWN_CHECK_SHIFT := 63

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PROCESSOR_STATE_PARAMETER_UNKNOWN_CHECK_MASK := 1

/**
 * @type {Guid}
 */
export global ERROR_MEMORY_GUID := Guid("{e429faf2-3cb7-11d4-bca7-0080c73c8881}")

/**
 * @type {Guid}
 */
export global ERROR_PCI_BUS_GUID := Guid("{e429faf4-3cb7-11d4-bca7-0080c73c8881}")

/**
 * @type {Integer (UInt16)}
 */
export global PciBusUnknownError := 0

/**
 * @type {Integer (UInt16)}
 */
export global PciBusDataParityError := 1

/**
 * @type {Integer (UInt16)}
 */
export global PciBusSystemError := 2

/**
 * @type {Integer (UInt16)}
 */
export global PciBusMasterAbort := 3

/**
 * @type {Integer (UInt16)}
 */
export global PciBusTimeOut := 4

/**
 * @type {Integer (UInt16)}
 */
export global PciMasterDataParityError := 5

/**
 * @type {Integer (UInt16)}
 */
export global PciAddressParityError := 6

/**
 * @type {Integer (UInt16)}
 */
export global PciCommandParityError := 7

/**
 * @type {Guid}
 */
export global ERROR_PCI_COMPONENT_GUID := Guid("{e429faf6-3cb7-11d4-bca7-0080c73c8881}")

/**
 * @type {Guid}
 */
export global ERROR_SYSTEM_EVENT_LOG_GUID := Guid("{e429faf3-3cb7-11d4-bca7-0080c73c8881}")

/**
 * @type {Guid}
 */
export global ERROR_SMBIOS_GUID := Guid("{e429faf5-3cb7-11d4-bca7-0080c73c8881}")

/**
 * @type {Guid}
 */
export global ERROR_PLATFORM_SPECIFIC_GUID := Guid("{e429faf7-3cb7-11d4-bca7-0080c73c8881}")

/**
 * @type {Guid}
 */
export global ERROR_PLATFORM_BUS_GUID := Guid("{e429faf9-3cb7-11d4-bca7-0080c73c8881}")

/**
 * @type {Guid}
 */
export global ERROR_PLATFORM_HOST_CONTROLLER_GUID := Guid("{e429faf8-3cb7-11d4-bca7-0080c73c8881}")

/**
 * @type {Integer (UInt32)}
 */
export global KERNEL_STACK_SIZE := 12288

/**
 * @type {Integer (UInt32)}
 */
export global KERNEL_LARGE_STACK_SIZE := 61440

/**
 * @type {Integer (UInt32)}
 */
export global KERNEL_LARGE_STACK_COMMIT := 12288

/**
 * @type {Integer (UInt32)}
 */
export global KERNEL_MCA_EXCEPTION_STACK_SIZE := 8192

/**
 * @type {Integer (Int32)}
 */
export global SE_UNSOLICITED_INPUT_PRIVILEGE := 6

/**
 * @type {Integer (UInt32)}
 */
export global RTL_HASH_ALLOCATED_HEADER := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTL_HASH_RESERVED_SIGNATURE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RTL_STACK_WALKING_MODE_FRAMES_TO_SKIP_SHIFT := 8

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CHARACTERISTICS_EXPECT_ORDERLY_REMOVAL_EX := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CHARACTERISTICS_EXPECT_SURPRISE_REMOVAL_EX := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CHARACTERISTICS_EXPECT_ORDERLY_REMOVAL_DEPRECATED := 512

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CHARACTERISTICS_EXPECT_SURPRISE_REMOVAL_DEPRECATED := 768

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CHARACTERISTICS_REMOVAL_POLICY_MASK_DEPRECATED := 768

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CHARACTERISTICS_EXPECT_ORDERLY_REMOVAL := 512

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CHARACTERISTICS_EXPECT_SURPRISE_REMOVAL := 768

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CHARACTERISTICS_REMOVAL_POLICY_MASK := 768

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CHARACTERISTICS_REMOVAL_POLICY_MASK_EX := 768

/**
 * @type {Integer (UInt32)}
 */
export global SSINFO_FLAGS_ALIGNED_DEVICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SSINFO_FLAGS_PARTITION_ALIGNED_ON_DEVICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SSINFO_FLAGS_NO_SEEK_PENALTY := 4

/**
 * @type {Integer (UInt32)}
 */
export global SSINFO_FLAGS_TRIM_ENABLED := 8

/**
 * @type {Integer (UInt32)}
 */
export global SSINFO_FLAGS_BYTE_ADDRESSABLE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SSINFO_OFFSET_UNKNOWN := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global THREAD_CSWITCH_PMU_DISABLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global THREAD_CSWITCH_PMU_ENABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROCESS_LUID_DOSDEVICES_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROCESS_HANDLE_EXCEPTIONS_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROCESS_HANDLE_RAISE_UM_EXCEPTION_ON_INVALID_HANDLE_CLOSE_DISABLED := 0

/**
 * @type {Integer (UInt32)}
 */
export global PROCESS_HANDLE_RAISE_UM_EXCEPTION_ON_INVALID_HANDLE_CLOSE_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROCESS_HANDLE_TRACING_MAX_STACKS := 16

/**
 * @type {Integer (UInt32)}
 */
export global PROCESS_EXCEPTION_PORT_ALL_STATE_BITS := 3

/**
 * @type {Integer (UInt32)}
 */
export global POWER_THROTTLING_PROCESS_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global POWER_THROTTLING_PROCESS_EXECUTION_SPEED := 1

/**
 * @type {Integer (UInt32)}
 */
export global POWER_THROTTLING_PROCESS_DELAYTIMERS := 2

/**
 * @type {Integer (UInt32)}
 */
export global POWER_THROTTLING_PROCESS_IGNORE_TIMER_RESOLUTION := 4

/**
 * @type {Integer (UInt32)}
 */
export global POWER_THROTTLING_THREAD_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global POWER_THROTTLING_THREAD_EXECUTION_SPEED := 1

/**
 * @type {Integer (UInt32)}
 */
export global POWER_THROTTLING_THREAD_VALID_FLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCR_MINOR_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCR_MAJOR_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PDI_SHIFT := 21

/**
 * @type {Integer (UInt32)}
 */
export global PPI_SHIFT := 30

/**
 * @type {Integer (UInt32)}
 */
export global PTI_SHIFT := 12

/**
 * @type {Integer (UInt32)}
 */
export global PTE_PER_PAGE := 512

/**
 * @type {Integer (UInt32)}
 */
export global PDE_PER_PAGE := 512

/**
 * @type {Integer (UInt32)}
 */
export global MM_SYSTEM_SPACE_END := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global KUMS_UCH_VOLATILE_BIT := 0

/**
 * @type {Integer (UInt32)}
 */
export global RESULT_ZERO := 0

/**
 * @type {Integer (UInt32)}
 */
export global RESULT_NEGATIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RESULT_POSITIVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global NT_PAGING_LEVELS := 2

/**
 * @type {Integer (UInt32)}
 */
export global PDE_BASE := 3224371200

/**
 * @type {Integer (UInt32)}
 */
export global PTE_BASE := 3221225472

/**
 * @type {Integer (UInt32)}
 */
export global PTE_TOP := 3225419775

/**
 * @type {Integer (UInt32)}
 */
export global PDE_TOP := 3224375295

/**
 * @type {Integer (UInt32)}
 */
export global CP15_PCR_RESERVED_MASK := 4095

/**
 * @type {Integer (UInt32)}
 */
export global PCR_BTI_MITIGATION_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCR_BTI_MITIGATION_VBAR_MASK := 15

/**
 * @type {Integer (UInt32)}
 */
export global PCR_BTI_MITIGATION_CSWAP_HVC := 16

/**
 * @type {Integer (UInt32)}
 */
export global PCR_BTI_MITIGATION_CSWAP_SMC := 32

/**
 * @type {Integer (UInt32)}
 */
export global ARM64_PCR_RESERVED_MASK := 4095

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_VERIFIER_SPECIAL_POOLING := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_VERIFIER_FORCE_IRQL_CHECKING := 2

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_VERIFIER_INJECT_ALLOCATION_FAILURES := 4

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_VERIFIER_TRACK_POOL_ALLOCATIONS := 8

/**
 * @type {Integer (UInt32)}
 */
export global DRIVER_VERIFIER_IO_CHECKING := 16

/**
 * @type {Integer (UInt32)}
 */
export global NX_SUPPORT_POLICY_ALWAYSOFF := 0

/**
 * @type {Integer (UInt32)}
 */
export global NX_SUPPORT_POLICY_ALWAYSON := 1

/**
 * @type {Integer (UInt32)}
 */
export global NX_SUPPORT_POLICY_OPTIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global NX_SUPPORT_POLICY_OPTOUT := 3

/**
 * @type {Integer (UInt32)}
 */
export global SEH_VALIDATION_POLICY_ON := 0

/**
 * @type {Integer (UInt32)}
 */
export global SEH_VALIDATION_POLICY_OFF := 1

/**
 * @type {Integer (UInt32)}
 */
export global SEH_VALIDATION_POLICY_TELEMETRY := 2

/**
 * @type {Integer (UInt32)}
 */
export global SEH_VALIDATION_POLICY_DEFER := 3

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_ERROR_PORT_V := 0

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_ELEVATION_ENABLED_V := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_VIRT_ENABLED_V := 2

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_INSTALLER_DETECT_ENABLED_V := 3

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_LKG_ENABLED_V := 4

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_DYNAMIC_PROC_ENABLED_V := 5

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_CONSOLE_BROKER_ENABLED_V := 6

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_SECURE_BOOT_ENABLED_V := 7

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_MULTI_SESSION_SKU_V := 8

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_MULTIUSERS_IN_SESSION_SKU_V := 9

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_STATE_SEPARATION_ENABLED_V := 10

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_SET_GLOBAL_DATA_FLAG := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_CLEAR_GLOBAL_DATA_FLAG := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SYSTEM_CALL_SYSCALL := 0

/**
 * @type {Integer (UInt32)}
 */
export global SYSTEM_CALL_INT_2E := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_QPC_BYPASS_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_QPC_BYPASS_USE_HV_PAGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_QPC_BYPASS_DISABLE_32BIT := 4

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_QPC_BYPASS_USE_MFENCE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_QPC_BYPASS_USE_LFENCE := 32

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_QPC_BYPASS_A73_ERRATA := 64

/**
 * @type {Integer (UInt32)}
 */
export global SHARED_GLOBAL_FLAGS_QPC_BYPASS_USE_RDTSCP := 128

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypeMaximum := 8

/**
 * @type {Integer (UInt32)}
 */
export global PCCARD_MAP_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCCARD_DEVICE_PCI := 16

/**
 * @type {Integer (UInt32)}
 */
export global PCCARD_SCAN_DISABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCCARD_MAP_ZERO := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCCARD_NO_TIMER := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCCARD_NO_PIC := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCCARD_NO_LEGACY_BASE := 5

/**
 * @type {Integer (UInt32)}
 */
export global PCCARD_DUP_LEGACY_BASE := 6

/**
 * @type {Integer (UInt32)}
 */
export global PCCARD_NO_CONTROLLERS := 7

/**
 * @type {Integer (UInt32)}
 */
export global SINGLE_GROUP_LEGACY_API := 1

/**
 * @type {Integer (UInt32)}
 */
export global CP_GET_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global CP_GET_NODATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global CP_GET_ERROR := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROTECTED_POOL := 0

/**
 * @type {Integer (UInt32)}
 */
export global IO_KEYBOARD_INCREMENT := 6

/**
 * @type {Integer (UInt32)}
 */
export global IO_MOUSE_INCREMENT := 6

/**
 * @type {Integer (UInt32)}
 */
export global IO_PARALLEL_INCREMENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_SERIAL_INCREMENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global IO_SOUND_INCREMENT := 8

/**
 * @type {Integer (UInt32)}
 */
export global IO_VIDEO_INCREMENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_ADD_PHYSICAL_MEMORY_ALREADY_ZEROED := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_ADD_PHYSICAL_MEMORY_LARGE_PAGES_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global MM_ADD_PHYSICAL_MEMORY_HUGE_PAGES_ONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global MM_REMOVE_PHYSICAL_MEMORY_BAD_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_GET_PHYSICAL_MEMORY_RANGES_INCLUDE_FILE_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_GET_PHYSICAL_MEMORY_RANGES_INCLUDE_ALL_PARTITIONS := 2

/**
 * @type {Integer (UInt32)}
 */
export global MM_COPY_MEMORY_PHYSICAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_COPY_MEMORY_VIRTUAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global MM_GET_CACHE_ATTRIBUTE_IO_SPACE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_ANY_NODE_OK := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global MM_ALLOCATE_CONTIGUOUS_MEMORY_FAST_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_SECURE_EXCLUSIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_SECURE_NO_CHANGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MM_SECURE_USER_MODE_ONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global MM_SECURE_NO_INHERIT := 8

/**
 * @type {Integer (UInt32)}
 */
export global MM_SYSTEM_VIEW_EXCEPTIONS_FOR_INPAGE_ERRORS := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMAGE_ADDRESSING_MODE_32BIT := 3

/**
 * @type {Integer (UInt32)}
 */
export global PS_IMAGE_NOTIFY_CONFLICTING_ARCHITECTURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SILO_MONITOR_REGISTRATION_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PS_INVALID_SILO_CONTEXT_SLOT := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_DIRECTORY := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_NOTIFY_CHANGE_DIRECTORY := 2

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_NOTIFY_CHANGE_DIRECTORY_EX := 3

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_USER_FS_REQUEST := 0

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_MOUNT_VOLUME := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_VERIFY_VOLUME := 2

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_LOAD_FILE_SYSTEM := 3

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_TRACK_LINK := 4

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_KERNEL_CALL := 4

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_LOCK := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_UNLOCK_SINGLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_UNLOCK_ALL := 3

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_UNLOCK_ALL_BY_KEY := 4

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_FLUSH_AND_PURGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_FLUSH_DATA_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_FLUSH_NO_SYNC := 3

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_FLUSH_DATA_SYNC_ONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_DPC := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_MDL := 2

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_COMPLETE := 4

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_COMPRESSED := 8

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_LEGACY_BUS_INFORMATION := 24

/**
 * @type {Integer (UInt32)}
 */
export global IO_CHECK_CREATE_PARAMETERS := 512

/**
 * @type {Integer (UInt32)}
 */
export global IO_ATTACH_DEVICE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IO_IGNORE_SHARE_ACCESS_CHECK := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DRVO_REINIT_REGISTERED := 8

/**
 * @type {Integer (UInt32)}
 */
export global DRVO_INITIALIZED := 16

/**
 * @type {Integer (UInt32)}
 */
export global DRVO_BOOTREINIT_REGISTERED := 32

/**
 * @type {Integer (UInt32)}
 */
export global DRVO_LEGACY_RESOURCES := 64

/**
 * @type {Integer (UInt32)}
 */
export global TXF_MINIVERSION_DEFAULT_VIEW := 65534

/**
 * @type {Guid}
 */
export global GUID_ECP_CREATE_USER_PROCESS := Guid("{e0e429ff-6ddc-4e65-aab6-45d05a038a08}")

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_KEY_VERSION_WIN7 := 1

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_KEY_VERSION_WIN8 := 2

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_KEY_FLAG_PARENT_KEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global OPLOCK_KEY_FLAG_TARGET_KEY := 2

/**
 * @type {Integer (UInt32)}
 */
export global ARBITER_FLAG_BOOT_CONFIG := 1

/**
 * @type {Integer (UInt32)}
 */
export global ARBITER_FLAG_ROOT_ENUM := 2

/**
 * @type {Integer (UInt32)}
 */
export global ARBITER_FLAG_OTHER_ENUM := 4

/**
 * @type {Integer (UInt32)}
 */
export global ARBITER_PARTIAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAXIMUM_DEBUG_BARS := 6

/**
 * @type {Integer (UInt32)}
 */
export global DBG_DEVICE_FLAG_HAL_SCRATCH_ALLOCATED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBG_DEVICE_FLAG_BARS_MAPPED := 2

/**
 * @type {Integer (UInt32)}
 */
export global DBG_DEVICE_FLAG_SCRATCH_ALLOCATED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBG_DEVICE_FLAG_UNCACHED_MEMORY := 8

/**
 * @type {Integer (UInt32)}
 */
export global DBG_DEVICE_FLAG_SYNTHETIC := 16

/**
 * @type {Integer (UInt32)}
 */
export global DBG_DEVICE_FLAG_HOST_VISIBLE_ALLOCATED := 32

/**
 * @type {Integer (UInt32)}
 */
export global HAL_DISPATCH_VERSION := 5

/**
 * @type {Integer (Int32)}
 */
export global HAL_PLATFORM_DISABLE_WRITE_COMBINING := 1

/**
 * @type {Integer (Int32)}
 */
export global HAL_PLATFORM_DISABLE_PTCG := 4

/**
 * @type {Integer (Int32)}
 */
export global HAL_PLATFORM_DISABLE_UC_MAIN_MEMORY := 8

/**
 * @type {Integer (Int32)}
 */
export global HAL_PLATFORM_ENABLE_WRITE_COMBINING_MMIO := 16

/**
 * @type {Integer (Int32)}
 */
export global HAL_PLATFORM_ACPI_TABLES_CACHED := 32

/**
 * @type {Integer (UInt32)}
 */
export global PCI_AGP_RATE_1X := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_AGP_RATE_2X := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_AGP_RATE_4X := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCIX_MODE_CONVENTIONAL_PCI := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCIX_MODE1_66MHZ := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCIX_MODE1_100MHZ := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCIX_MODE1_133MHZ := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCIX_MODE2_266_66MHZ := 9

/**
 * @type {Integer (UInt32)}
 */
export global PCIX_MODE2_266_100MHZ := 10

/**
 * @type {Integer (UInt32)}
 */
export global PCIX_MODE2_266_133MHZ := 11

/**
 * @type {Integer (UInt32)}
 */
export global PCIX_MODE2_533_66MHZ := 13

/**
 * @type {Integer (UInt32)}
 */
export global PCIX_MODE2_533_100MHZ := 14

/**
 * @type {Integer (UInt32)}
 */
export global PCIX_MODE2_533_133MHZ := 15

/**
 * @type {Integer (UInt32)}
 */
export global PCIX_VERSION_MODE1_ONLY := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCIX_VERSION_MODE2_ECC := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCIX_VERSION_DUAL_MODE_ECC := 2

/**
 * @type {Integer (UInt32)}
 */
export global OSC_FIRMWARE_FAILURE := 2

/**
 * @type {Integer (UInt32)}
 */
export global OSC_UNRECOGNIZED_UUID := 4

/**
 * @type {Integer (UInt32)}
 */
export global OSC_UNRECOGNIZED_REVISION := 8

/**
 * @type {Integer (UInt32)}
 */
export global OSC_CAPABILITIES_MASKED := 16

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ROOT_BUS_OSC_METHOD_CAPABILITY_REVISION := 1

/**
 * @type {Integer (UInt32)}
 */
export global FPB_VECTOR_SIZE_SUPPORTED_256BITS := 0

/**
 * @type {Integer (UInt32)}
 */
export global FPB_VECTOR_SIZE_SUPPORTED_512BITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global FPB_VECTOR_SIZE_SUPPORTED_1KBITS := 2

/**
 * @type {Integer (UInt32)}
 */
export global FPB_VECTOR_SIZE_SUPPORTED_2KBITS := 3

/**
 * @type {Integer (UInt32)}
 */
export global FPB_VECTOR_SIZE_SUPPORTED_4KBITS := 4

/**
 * @type {Integer (UInt32)}
 */
export global FPB_VECTOR_SIZE_SUPPORTED_8KBITS := 5

/**
 * @type {Integer (UInt32)}
 */
export global FPB_RID_VECTOR_GRANULARITY_8RIDS := 0

/**
 * @type {Integer (UInt32)}
 */
export global FPB_RID_VECTOR_GRANULARITY_64RIDS := 3

/**
 * @type {Integer (UInt32)}
 */
export global FPB_RID_VECTOR_GRANULARITY_256RIDS := 5

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_LOW_VECTOR_GRANULARITY_1MB := 0

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_LOW_VECTOR_GRANULARITY_2MB := 1

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_LOW_VECTOR_GRANULARITY_4MB := 2

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_LOW_VECTOR_GRANULARITY_8MB := 3

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_LOW_VECTOR_GRANULARITY_16MB := 4

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_HIGH_VECTOR_GRANULARITY_256MB := 0

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_HIGH_VECTOR_GRANULARITY_512MB := 1

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_HIGH_VECTOR_GRANULARITY_1GB := 2

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_HIGH_VECTOR_GRANULARITY_2GB := 3

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_HIGH_VECTOR_GRANULARITY_4GB := 4

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_HIGH_VECTOR_GRANULARITY_8GB := 5

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_HIGH_VECTOR_GRANULARITY_16GB := 6

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_HIGH_VECTOR_GRANULARITY_32GB := 7

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_VECTOR_GRANULARITY_1B := 8

/**
 * @type {Integer (UInt32)}
 */
export global FPB_MEM_HIGH_VECTOR_GRANULARITY_1MB := 9

/**
 * @type {Integer (UInt32)}
 */
export global FPB_VECTOR_SELECT_RID := 0

/**
 * @type {Integer (UInt32)}
 */
export global FPB_VECTOR_SELECT_MEM_LOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global FPB_VECTOR_SELECT_MEM_HIGH := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_DATA_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_TPH_ST_LOCATION_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_TPH_ST_LOCATION_TPH_CAPABILITY := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_TPH_ST_LOCATION_MSIX_TABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_TPH_ST_LOCATION_RESERVED := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCI_INVALID_ALTERNATE_FUNCTION_NUMBER := 255

/**
 * @type {Integer (UInt32)}
 */
export global PCI_BUS_INTERFACE_STANDARD_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_INTERNAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_BUS := 16

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_MEM := 4

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_TLB := 5

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_CACHE := 6

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_FUNCTION := 7

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_SELFTEST := 8

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_FLOW := 9

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_MAP := 17

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_IMPROPER := 18

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_UNIMPL := 19

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_LOSSOFLOCKSTEP := 20

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_RESPONSE := 21

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_PARITY := 22

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_PROTOCOL := 23

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_PATHERROR := 24

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_TIMEOUT := 25

/**
 * @type {Integer (UInt32)}
 */
export global ERRTYP_POISONED := 26

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_RECORD_VALID_PLATFORMID := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_RECORD_VALID_TIMESTAMP := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_RECORD_VALID_PARTITIONID := 4

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_RECORD_FLAGS_RECOVERED := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_RECORD_FLAGS_PREVIOUSERROR := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_RECORD_FLAGS_SIMULATED := 4

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_RECORD_FLAGS_DEVICE_DRIVER := 8

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_RECORD_REVISION := 528

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_RECORD_SIGNATURE_END := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_SECTION_DESCRIPTOR_FLAGS_PRIMARY := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_SECTION_DESCRIPTOR_FLAGS_CONTAINMENTWRN := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_SECTION_DESCRIPTOR_FLAGS_RESET := 4

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_SECTION_DESCRIPTOR_FLAGS_THRESHOLDEXCEEDED := 8

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_SECTION_DESCRIPTOR_FLAGS_RESOURCENA := 16

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_SECTION_DESCRIPTOR_FLAGS_LATENTERROR := 32

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_SECTION_DESCRIPTOR_FLAGS_PROPAGATED := 64

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_SECTION_DESCRIPTOR_FLAGS_FRU_TEXT_BY_PLUGIN := 128

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_RECORD_SECTION_DESCRIPTOR_REVISION := 768

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_SECTION_DESCRIPTOR_REVISION := 768

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_PROCTYPE_XPF := 0

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_PROCTYPE_IPF := 1

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_PROCTYPE_ARM := 2

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_PROCISA_X86 := 0

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_PROCISA_IPF := 1

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_PROCISA_X64 := 2

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_PROCISA_ARM32 := 4

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_PROCISA_ARM64 := 8

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_PROCERRTYPE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_PROCERRTYPE_CACHE := 1

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_PROCERRTYPE_TLB := 2

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_PROCERRTYPE_BUS := 4

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_PROCERRTYPE_MAE := 8

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_OP_GENERIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_OP_DATAREAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_OP_DATAWRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_OP_INSTRUCTIONEXE := 3

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_FLAGS_RESTARTABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_FLAGS_PRECISEIP := 2

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_FLAGS_OVERFLOW := 4

/**
 * @type {Integer (UInt32)}
 */
export global GENPROC_FLAGS_CORRECTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CACHE_CHECK_TRANSACTIONTYPE_INSTRUCTION := 0

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CACHE_CHECK_TRANSACTIONTYPE_DATAACCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CACHE_CHECK_TRANSACTIONTYPE_GENERIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CACHE_CHECK_OPERATION_GENERIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CACHE_CHECK_OPERATION_GENREAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CACHE_CHECK_OPERATION_GENWRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CACHE_CHECK_OPERATION_DATAREAD := 3

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CACHE_CHECK_OPERATION_DATAWRITE := 4

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CACHE_CHECK_OPERATION_INSTRUCTIONFETCH := 5

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CACHE_CHECK_OPERATION_PREFETCH := 6

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CACHE_CHECK_OPERATION_EVICTION := 7

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CACHE_CHECK_OPERATION_SNOOP := 8

/**
 * @type {Integer (UInt32)}
 */
export global XPF_TLB_CHECK_TRANSACTIONTYPE_INSTRUCTION := 0

/**
 * @type {Integer (UInt32)}
 */
export global XPF_TLB_CHECK_TRANSACTIONTYPE_DATAACCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global XPF_TLB_CHECK_TRANSACTIONTYPE_GENERIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global XPF_TLB_CHECK_OPERATION_GENERIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global XPF_TLB_CHECK_OPERATION_GENREAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global XPF_TLB_CHECK_OPERATION_GENWRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global XPF_TLB_CHECK_OPERATION_DATAREAD := 3

/**
 * @type {Integer (UInt32)}
 */
export global XPF_TLB_CHECK_OPERATION_DATAWRITE := 4

/**
 * @type {Integer (UInt32)}
 */
export global XPF_TLB_CHECK_OPERATION_INSTRUCTIONFETCH := 5

/**
 * @type {Integer (UInt32)}
 */
export global XPF_TLB_CHECK_OPERATION_PREFETCH := 6

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_TRANSACTIONTYPE_INSTRUCTION := 0

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_TRANSACTIONTYPE_DATAACCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_TRANSACTIONTYPE_GENERIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_OPERATION_GENERIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_OPERATION_GENREAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_OPERATION_GENWRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_OPERATION_DATAREAD := 3

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_OPERATION_DATAWRITE := 4

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_OPERATION_INSTRUCTIONFETCH := 5

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_OPERATION_PREFETCH := 6

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_PARTICIPATION_PROCORIGINATED := 0

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_PARTICIPATION_PROCRESPONDED := 1

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_PARTICIPATION_PROCOBSERVED := 2

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_PARTICIPATION_GENERIC := 3

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_ADDRESS_MEMORY := 0

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_ADDRESS_RESERVED := 1

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_ADDRESS_IO := 2

/**
 * @type {Integer (UInt32)}
 */
export global XPF_BUS_CHECK_ADDRESS_OTHER := 3

/**
 * @type {Integer (UInt32)}
 */
export global XPF_MS_CHECK_ERRORTYPE_NOERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global XPF_MS_CHECK_ERRORTYPE_UNCLASSIFIED := 1

/**
 * @type {Integer (UInt32)}
 */
export global XPF_MS_CHECK_ERRORTYPE_MCROMPARITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global XPF_MS_CHECK_ERRORTYPE_EXTERNAL := 3

/**
 * @type {Integer (UInt32)}
 */
export global XPF_MS_CHECK_ERRORTYPE_FRC := 4

/**
 * @type {Integer (UInt32)}
 */
export global XPF_MS_CHECK_ERRORTYPE_INTERNALUNCLASSIFIED := 5

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CONTEXT_INFO_UNCLASSIFIEDDATA := 0

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CONTEXT_INFO_MSRREGISTERS := 1

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CONTEXT_INFO_32BITCONTEXT := 2

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CONTEXT_INFO_64BITCONTEXT := 3

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CONTEXT_INFO_FXSAVE := 4

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CONTEXT_INFO_32BITDEBUGREGS := 5

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CONTEXT_INFO_64BITDEBUGREGS := 6

/**
 * @type {Integer (UInt32)}
 */
export global XPF_CONTEXT_INFO_MMREGISTERS := 7

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEMERRTYPE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEMERRTYPE_NOERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEMERRTYPE_SINGLEBITECC := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEMERRTYPE_MULTIBITECC := 3

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEMERRTYPE_SINGLESYMCHIPKILL := 4

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEMERRTYPE_MULTISYMCHIPKILL := 5

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEMERRTYPE_MASTERABORT := 6

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEMERRTYPE_TARGETABORT := 7

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEMERRTYPE_PARITYERROR := 8

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEMERRTYPE_WATCHDOGTIMEOUT := 9

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEMERRTYPE_INVALIDADDRESS := 10

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEMERRTYPE_MIRRORBROKEN := 11

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEMERRTYPE_MEMORYSPARING := 12

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_PMEM_ERROR_SECTION_LOCATION_INFO_SIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_PMEM_ERROR_SECTION_MAX_PAGES := 50

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_PCIE_CORRECTABLE_ERROR_SECTION_COUNT_SIZE := 32

/**
 * @type {Integer (UInt32)}
 */
export global PCIXBUS_ERRTYPE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCIXBUS_ERRTYPE_DATAPARITY := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCIXBUS_ERRTYPE_SYSTEM := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCIXBUS_ERRTYPE_MASTERABORT := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCIXBUS_ERRTYPE_BUSTIMEOUT := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCIXBUS_ERRTYPE_MASTERDATAPARITY := 5

/**
 * @type {Integer (UInt32)}
 */
export global PCIXBUS_ERRTYPE_ADDRESSPARITY := 6

/**
 * @type {Integer (UInt32)}
 */
export global PCIXBUS_ERRTYPE_COMMANDPARITY := 7

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_FIRMWARE_RECORD_TYPE_IPFSAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_XPF_MCA_EXTREG_MAX_COUNT := 24

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_XPF_MCA_SECTION_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_XPF_MCA_SECTION_VERSION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_XPF_MCA_SECTION_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_AMD_EXT_REG_NUM := 10

/**
 * @type {Guid}
 */
export global CMC_NOTIFY_TYPE_GUID := Guid("{2dce8bb1-bdd7-450e-b9ad-9cf4ebd4f890}")

/**
 * @type {Guid}
 */
export global CPE_NOTIFY_TYPE_GUID := Guid("{4e292f96-d843-4a55-a8c2-d481f27ebeee}")

/**
 * @type {Guid}
 */
export global MCE_NOTIFY_TYPE_GUID := Guid("{e8f56ffe-919c-4cc5-ba88-65abe14913bb}")

/**
 * @type {Guid}
 */
export global PCIe_NOTIFY_TYPE_GUID := Guid("{cf93c01f-1a16-4dfc-b8bc-9c4daf67c104}")

/**
 * @type {Guid}
 */
export global INIT_NOTIFY_TYPE_GUID := Guid("{cc5263e8-9308-454a-89d0-340bd39bc98e}")

/**
 * @type {Guid}
 */
export global NMI_NOTIFY_TYPE_GUID := Guid("{5bad89ff-b7e6-42c9-814a-cf2485d6e98a}")

/**
 * @type {Guid}
 */
export global BOOT_NOTIFY_TYPE_GUID := Guid("{3d61a466-ab40-409a-a698-f362d464b38f}")

/**
 * @type {Guid}
 */
export global SEA_NOTIFY_TYPE_GUID := Guid("{9a78788a-bbe8-11e4-809e-67611e5d46b0}")

/**
 * @type {Guid}
 */
export global SEI_NOTIFY_TYPE_GUID := Guid("{5c284c81-b0ae-4e87-a322-b04c85624323}")

/**
 * @type {Guid}
 */
export global PEI_NOTIFY_TYPE_GUID := Guid("{09a9d5ac-5204-4214-96e5-94992e752bcd}")

/**
 * @type {Guid}
 */
export global BMC_NOTIFY_TYPE_GUID := Guid("{487565ba-6494-4367-95ca-4eff893522f6}")

/**
 * @type {Guid}
 */
export global SCI_NOTIFY_TYPE_GUID := Guid("{e9d59197-94ee-4a4f-8ad8-9b7d8bd93d2e}")

/**
 * @type {Guid}
 */
export global EXTINT_NOTIFY_TYPE_GUID := Guid("{fe84086e-b557-43cf-ac1b-17982e078470}")

/**
 * @type {Guid}
 */
export global DEVICE_DRIVER_NOTIFY_TYPE_GUID := Guid("{0033f803-2e70-4e88-992c-6f26daf3db7a}")

/**
 * @type {Guid}
 */
export global CMCI_NOTIFY_TYPE_GUID := Guid("{919448b2-3739-4b7f-a8f1-e0062805c2a3}")

/**
 * @type {Guid}
 */
export global WHEA_DEVICE_ERROR_SUMMARY_GUID := Guid("{990b31e9-541a-4db0-a42f-837d344f6923}")

/**
 * @type {Guid}
 */
export global PROCESSOR_GENERIC_ERROR_SECTION_GUID := Guid("{9876ccad-47b4-4bdb-b65e-16f193c4f3db}")

/**
 * @type {Guid}
 */
export global XPF_PROCESSOR_ERROR_SECTION_GUID := Guid("{dc3ea0b0-a144-4797-b95b-53fa242b6e1d}")

/**
 * @type {Guid}
 */
export global ARM_PROCESSOR_ERROR_SECTION_GUID := Guid("{e19e3d16-bc11-11e4-9caa-c2051d5d46b0}")

/**
 * @type {Guid}
 */
export global MEMORY_ERROR_SECTION_GUID := Guid("{a5bc1114-6f64-4ede-b863-3e83ed7c83b1}")

/**
 * @type {Guid}
 */
export global PCIEXPRESS_ERROR_SECTION_GUID := Guid("{d995e954-bbc1-430f-ad91-b44dcb3c6f35}")

/**
 * @type {Guid}
 */
export global PCIXBUS_ERROR_SECTION_GUID := Guid("{c5753963-3b84-4095-bf78-eddad3f9c9dd}")

/**
 * @type {Guid}
 */
export global PCIXDEVICE_ERROR_SECTION_GUID := Guid("{eb5e4685-ca66-4769-b6a2-26068b001326}")

/**
 * @type {Guid}
 */
export global FIRMWARE_ERROR_RECORD_REFERENCE_GUID := Guid("{81212a96-09ed-4996-9471-8d729c8e69ed}")

/**
 * @type {Guid}
 */
export global PMEM_ERROR_SECTION_GUID := Guid("{81687003-dbfd-4728-9ffd-f0904f97597d}")

/**
 * @type {Guid}
 */
export global MU_TELEMETRY_SECTION_GUID := Guid("{85183a8b-9c41-429c-939c-5c3c087ca280}")

/**
 * @type {Guid}
 */
export global RECOVERY_INFO_SECTION_GUID := Guid("{c34832a1-02c3-4c52-a9f1-9f1d5d7723fc}")

/**
 * @type {Guid}
 */
export global WHEA_CACHECHECK_GUID := Guid("{a55701f5-e3ef-43de-ac72-249b573fad2c}")

/**
 * @type {Guid}
 */
export global WHEA_TLBCHECK_GUID := Guid("{fc06b535-5e1f-4562-9f25-0a3b9adb63c3}")

/**
 * @type {Guid}
 */
export global WHEA_BUSCHECK_GUID := Guid("{1cf3f8b3-c5b1-49a2-aa59-5eef92ffa63c}")

/**
 * @type {Guid}
 */
export global WHEA_MSCHECK_GUID := Guid("{48ab7f57-dc34-4f6c-a7d3-b0b5b0a74314}")

/**
 * @type {Guid}
 */
export global CPER_EMPTY_GUID := Guid("{00000000-0000-0000-0000-000000000000}")

/**
 * @type {Guid}
 */
export global WHEA_RECORD_CREATOR_GUID := Guid("{cf07c4bd-b789-4e18-b3c4-1f732cb57131}")

/**
 * @type {Guid}
 */
export global DEFAULT_DEVICE_DRIVER_CREATOR_GUID := Guid("{57217c8d-5e66-44fb-8033-9b74cacedf5b}")

/**
 * @type {Guid}
 */
export global GENERIC_NOTIFY_TYPE_GUID := Guid("{3e62a467-ab40-409a-a698-f362d464b38f}")

/**
 * @type {Guid}
 */
export global IPF_SAL_RECORD_SECTION_GUID := Guid("{6f3380d1-6eb0-497f-a578-4d4c65a71617}")

/**
 * @type {Guid}
 */
export global XPF_MCA_SECTION_GUID := Guid("{8a1e1d01-42f9-4557-9c33-565e5cc3f7e8}")

/**
 * @type {Guid}
 */
export global NMI_SECTION_GUID := Guid("{e71254e7-c1b9-4940-ab76-909703a4320f}")

/**
 * @type {Guid}
 */
export global GENERIC_SECTION_GUID := Guid("{e71254e8-c1b9-4940-ab76-909703a4320f}")

/**
 * @type {Guid}
 */
export global IPMI_MSR_DUMP_SECTION_GUID := Guid("{1c15b445-9b06-4667-ac25-33c056b88803}")

/**
 * @type {Guid}
 */
export global WHEA_ERROR_PACKET_SECTION_GUID := Guid("{e71254e9-c1b9-4940-ab76-909703a4320f}")

/**
 * @type {Guid}
 */
export global WHEA_DPC_CAPABILITY_SECTION_GUID := Guid("{ec49534b-30e7-4358-972f-eca6958fae3b}")

/**
 * @type {Guid}
 */
export global PCIE_CORRECTABLE_ERROR_SUMMARY_SECTION_GUID := Guid("{e96eca99-53e2-4f52-9be7-d2dbe9508ed0}")

/**
 * @type {Guid}
 */
export global MEMORY_CORRECTABLE_ERROR_SUMMARY_SECTION_GUID := Guid("{0e36c93e-ca15-4a83-ba8a-cbe80f7f0017}")

/**
 * @type {Guid}
 */
export global SEA_SECTION_GUID := Guid("{f5fe48a6-84ce-4c1e-aa64-20c9a53099f1}")

/**
 * @type {Guid}
 */
export global SEI_SECTION_GUID := Guid("{f2a4a152-9c6d-4020-aecf-7695b389251b}")

/**
 * @type {Guid}
 */
export global PCI_RECOVERY_SECTION_GUID := Guid("{dd060800-f6e1-4204-ac27-c4bca9568402}")

/**
 * @type {Integer (UInt32)}
 */
export global ANY_SIZE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_PACKET_V1_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_PACKET_V2_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_PACKET_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_PKT_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_LOG_ENTRY_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_TEXT_LEN := 32

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_SEL_BUGCHECK_RECOVERY_STATUS_PHASE1_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WCS_RAS_REGISTER_NAME_MAX_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_GENERIC_ENTRY_TEXT_LEN := 20

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_GENERIC_ENTRY_V2_VERSION := 768

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_GENERIC_ENTRY_VERSION := 768

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MAX_LOG_DATA_LEN := 36

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_INVALID_ERR_SRC_ID := 0

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERR_SRC_OVERRIDE_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global INJECT_ERRTYPE_PROCESSOR_CORRECTABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global INJECT_ERRTYPE_PROCESSOR_UNCORRECTABLENONFATAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global INJECT_ERRTYPE_PROCESSOR_UNCORRECTABLEFATAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global INJECT_ERRTYPE_MEMORY_CORRECTABLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global INJECT_ERRTYPE_MEMORY_UNCORRECTABLENONFATAL := 16

/**
 * @type {Integer (UInt32)}
 */
export global INJECT_ERRTYPE_MEMORY_UNCORRECTABLEFATAL := 32

/**
 * @type {Integer (UInt32)}
 */
export global INJECT_ERRTYPE_PCIEXPRESS_CORRECTABLE := 64

/**
 * @type {Integer (UInt32)}
 */
export global INJECT_ERRTYPE_PCIEXPRESS_UNCORRECTABLENONFATAL := 128

/**
 * @type {Integer (UInt32)}
 */
export global INJECT_ERRTYPE_PCIEXPRESS_UNCORRECTABLEFATAL := 256

/**
 * @type {Integer (UInt32)}
 */
export global INJECT_ERRTYPE_PLATFORM_CORRECTABLE := 512

/**
 * @type {Integer (UInt32)}
 */
export global INJECT_ERRTYPE_PLATFORM_UNCORRECTABLENONFATAL := 1024

/**
 * @type {Integer (UInt32)}
 */
export global INJECT_ERRTYPE_PLATFORM_UNCORRECTABLEFATAL := 2048

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_IN_USE_PAGE_NOTIFY_FLAG_PLATFORMDIRECTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_IN_USE_PAGE_NOTIFY_FLAG_NOTIFYALL := 64

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_IN_USE_PAGE_NOTIFY_FLAG_PAGEOFFLINED := 128

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_PLUGIN_REGISTRATION_PACKET_V1 := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_PLUGIN_REGISTRATION_PACKET_V2 := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_PLUGIN_REGISTRATION_PACKET_VERSION := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PshedFADiscovery := 1

/**
 * @type {Integer (UInt32)}
 */
export global PshedFAErrorSourceControl := 2

/**
 * @type {Integer (UInt32)}
 */
export global PshedFAErrorRecordPersistence := 4

/**
 * @type {Integer (UInt32)}
 */
export global PshedFAErrorInfoRetrieval := 8

/**
 * @type {Integer (UInt32)}
 */
export global PshedFAErrorRecovery := 16

/**
 * @type {Integer (UInt32)}
 */
export global PshedFAErrorInjection := 32

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_WRITE_FLAG_DUMMY := 1

/**
 * @type {Integer (UInt32)}
 */
export global _STRSAFE_USE_SECURE_CRT := 0

/**
 * @type {Integer (UInt32)}
 */
export global KADDRESS_BASE := 0

/**
 * @type {Integer (UInt32)}
 */
export global UADDRESS_BASE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PASSIVE_LEVEL := 0

/**
 * @type {Integer (UInt32)}
 */
export global LOW_LEVEL := 0

/**
 * @type {Integer (UInt32)}
 */
export global APC_LEVEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global DISPATCH_LEVEL := 2

/**
 * @type {Integer (UInt32)}
 */
export global CMCI_LEVEL := 5

/**
 * @type {Integer (UInt32)}
 */
export global PROFILE_LEVEL := 27

/**
 * @type {Integer (UInt32)}
 */
export global CLOCK1_LEVEL := 28

/**
 * @type {Integer (UInt32)}
 */
export global CLOCK2_LEVEL := 28

/**
 * @type {Integer (UInt32)}
 */
export global IPI_LEVEL := 29

/**
 * @type {Integer (UInt32)}
 */
export global POWER_LEVEL := 30

/**
 * @type {Integer (UInt32)}
 */
export global HIGH_LEVEL := 31

/**
 * @type {Integer (UInt32)}
 */
export global CLOCK_LEVEL := 28

/**
 * @type {Integer (UInt32)}
 */
export global DRS_LEVEL := 14

/**
 * @type {Integer (UInt32)}
 */
export global LOW_PRIORITY := 0

/**
 * @type {Integer (UInt32)}
 */
export global LOW_REALTIME_PRIORITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global HIGH_PRIORITY := 31

/**
 * @type {Integer (UInt32)}
 */
export global MAXIMUM_PRIORITY := 32

/**
 * @type {Integer (UInt32)}
 */
export global LOCK_QUEUE_WAIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOCK_QUEUE_WAIT_BIT := 0

/**
 * @type {Integer (UInt32)}
 */
export global LOCK_QUEUE_OWNER := 2

/**
 * @type {Integer (UInt32)}
 */
export global LOCK_QUEUE_OWNER_BIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOCK_QUEUE_HALTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global LOCK_QUEUE_HALTED_BIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global DPC_WATCHDOG_GLOBAL_TRIAGE_BLOCK_SIGNATURE := 2931740382

/**
 * @type {Integer (UInt32)}
 */
export global DPC_WATCHDOG_GLOBAL_TRIAGE_BLOCK_REVISION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global KI_USER_SHARED_DATA := 4292804608

/**
 * @type {Integer (UInt32)}
 */
export global SharedInterruptTime := 4292804616

/**
 * @type {Integer (UInt32)}
 */
export global SharedSystemTime := 4292804628

/**
 * @type {Integer (UInt32)}
 */
export global SharedTickCount := 4292805408

/**
 * @type {Integer (UInt32)}
 */
export global PRIVILEGE_SET_ALL_NECESSARY := 1

/**
 * @type {Integer (Int32)}
 */
export global SE_MIN_WELL_KNOWN_PRIVILEGE := 2

/**
 * @type {Integer (Int32)}
 */
export global SE_CREATE_TOKEN_PRIVILEGE := 2

/**
 * @type {Integer (Int32)}
 */
export global SE_ASSIGNPRIMARYTOKEN_PRIVILEGE := 3

/**
 * @type {Integer (Int32)}
 */
export global SE_LOCK_MEMORY_PRIVILEGE := 4

/**
 * @type {Integer (Int32)}
 */
export global SE_INCREASE_QUOTA_PRIVILEGE := 5

/**
 * @type {Integer (Int32)}
 */
export global SE_MACHINE_ACCOUNT_PRIVILEGE := 6

/**
 * @type {Integer (Int32)}
 */
export global SE_TCB_PRIVILEGE := 7

/**
 * @type {Integer (Int32)}
 */
export global SE_SECURITY_PRIVILEGE := 8

/**
 * @type {Integer (Int32)}
 */
export global SE_TAKE_OWNERSHIP_PRIVILEGE := 9

/**
 * @type {Integer (Int32)}
 */
export global SE_LOAD_DRIVER_PRIVILEGE := 10

/**
 * @type {Integer (Int32)}
 */
export global SE_SYSTEM_PROFILE_PRIVILEGE := 11

/**
 * @type {Integer (Int32)}
 */
export global SE_SYSTEMTIME_PRIVILEGE := 12

/**
 * @type {Integer (Int32)}
 */
export global SE_PROF_SINGLE_PROCESS_PRIVILEGE := 13

/**
 * @type {Integer (Int32)}
 */
export global SE_INC_BASE_PRIORITY_PRIVILEGE := 14

/**
 * @type {Integer (Int32)}
 */
export global SE_CREATE_PAGEFILE_PRIVILEGE := 15

/**
 * @type {Integer (Int32)}
 */
export global SE_CREATE_PERMANENT_PRIVILEGE := 16

/**
 * @type {Integer (Int32)}
 */
export global SE_BACKUP_PRIVILEGE := 17

/**
 * @type {Integer (Int32)}
 */
export global SE_RESTORE_PRIVILEGE := 18

/**
 * @type {Integer (Int32)}
 */
export global SE_SHUTDOWN_PRIVILEGE := 19

/**
 * @type {Integer (Int32)}
 */
export global SE_DEBUG_PRIVILEGE := 20

/**
 * @type {Integer (Int32)}
 */
export global SE_AUDIT_PRIVILEGE := 21

/**
 * @type {Integer (Int32)}
 */
export global SE_SYSTEM_ENVIRONMENT_PRIVILEGE := 22

/**
 * @type {Integer (Int32)}
 */
export global SE_CHANGE_NOTIFY_PRIVILEGE := 23

/**
 * @type {Integer (Int32)}
 */
export global SE_REMOTE_SHUTDOWN_PRIVILEGE := 24

/**
 * @type {Integer (Int32)}
 */
export global SE_UNDOCK_PRIVILEGE := 25

/**
 * @type {Integer (Int32)}
 */
export global SE_SYNC_AGENT_PRIVILEGE := 26

/**
 * @type {Integer (Int32)}
 */
export global SE_ENABLE_DELEGATION_PRIVILEGE := 27

/**
 * @type {Integer (Int32)}
 */
export global SE_MANAGE_VOLUME_PRIVILEGE := 28

/**
 * @type {Integer (Int32)}
 */
export global SE_IMPERSONATE_PRIVILEGE := 29

/**
 * @type {Integer (Int32)}
 */
export global SE_CREATE_GLOBAL_PRIVILEGE := 30

/**
 * @type {Integer (Int32)}
 */
export global SE_TRUSTED_CREDMAN_ACCESS_PRIVILEGE := 31

/**
 * @type {Integer (Int32)}
 */
export global SE_RELABEL_PRIVILEGE := 32

/**
 * @type {Integer (Int32)}
 */
export global SE_INC_WORKING_SET_PRIVILEGE := 33

/**
 * @type {Integer (Int32)}
 */
export global SE_TIME_ZONE_PRIVILEGE := 34

/**
 * @type {Integer (Int32)}
 */
export global SE_CREATE_SYMBOLIC_LINK_PRIVILEGE := 35

/**
 * @type {Integer (Int32)}
 */
export global SE_DELEGATE_SESSION_USER_IMPERSONATE_PRIVILEGE := 36

/**
 * @type {Integer (Int32)}
 */
export global SE_MAX_WELL_KNOWN_PRIVILEGE := 36

/**
 * @type {Integer (UInt32)}
 */
export global FILE_SHARE_VALID_FLAGS := 7

/**
 * @type {Integer (UInt32)}
 */
export global FILE_ATTRIBUTE_VALID_FLAGS := 32695

/**
 * @type {Integer (UInt32)}
 */
export global FILE_ATTRIBUTE_VALID_SET_FLAGS := 12711

/**
 * @type {Integer (UInt32)}
 */
export global FILE_ATTRIBUTE_VALID_KERNEL_SET_FLAGS := 5910951

/**
 * @type {Integer (UInt32)}
 */
export global TREE_CONNECT_NO_CLIENT_BUFFERING := 8

/**
 * @type {Integer (UInt32)}
 */
export global TREE_CONNECT_WRITE_THROUGH := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VALID_EXTENDED_OPTION_FLAGS := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global EX_CREATE_FLAG_FILE_SOURCE_OPEN_FOR_COPY := 1

/**
 * @type {Integer (UInt32)}
 */
export global EX_CREATE_FLAG_FILE_DEST_OPEN_FOR_COPY := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_QUERY_RESTART_SCAN := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_QUERY_RETURN_SINGLE_ENTRY := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_QUERY_INDEX_SPECIFIED := 4

/**
 * @type {Integer (UInt32)}
 */
export global FILE_QUERY_RETURN_ON_DISK_ENTRIES_ONLY := 8

/**
 * @type {Integer (UInt32)}
 */
export global FILE_QUERY_NO_CURSOR_UPDATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global FILE_WRITE_TO_END_OF_FILE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global FILE_USE_FILE_POINTER_POSITION := 4294967294

/**
 * @type {Integer (UInt32)}
 */
export global FILE_BYTE_ALIGNMENT := 0

/**
 * @type {Integer (UInt32)}
 */
export global FILE_WORD_ALIGNMENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_LONG_ALIGNMENT := 3

/**
 * @type {Integer (UInt32)}
 */
export global FILE_QUAD_ALIGNMENT := 7

/**
 * @type {Integer (UInt32)}
 */
export global FILE_OCTA_ALIGNMENT := 15

/**
 * @type {Integer (UInt32)}
 */
export global FILE_32_BYTE_ALIGNMENT := 31

/**
 * @type {Integer (UInt32)}
 */
export global FILE_64_BYTE_ALIGNMENT := 63

/**
 * @type {Integer (UInt32)}
 */
export global FILE_128_BYTE_ALIGNMENT := 127

/**
 * @type {Integer (UInt32)}
 */
export global FILE_256_BYTE_ALIGNMENT := 255

/**
 * @type {Integer (UInt32)}
 */
export global FILE_512_BYTE_ALIGNMENT := 511

/**
 * @type {Integer (UInt32)}
 */
export global MAXIMUM_FILENAME_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global FILE_REMOVABLE_MEDIA := 1

/**
 * @type {Integer (UInt32)}
 */
export global FILE_READ_ONLY_DEVICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FILE_FLOPPY_DISKETTE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FILE_WRITE_ONCE_MEDIA := 8

/**
 * @type {Integer (UInt32)}
 */
export global FILE_REMOTE_DEVICE := 16

/**
 * @type {Integer (UInt32)}
 */
export global FILE_DEVICE_IS_MOUNTED := 32

/**
 * @type {Integer (UInt32)}
 */
export global FILE_VIRTUAL_VOLUME := 64

/**
 * @type {Integer (UInt32)}
 */
export global FILE_AUTOGENERATED_DEVICE_NAME := 128

/**
 * @type {Integer (UInt32)}
 */
export global FILE_DEVICE_SECURE_OPEN := 256

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CHARACTERISTIC_PNP_DEVICE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CHARACTERISTIC_TS_DEVICE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CHARACTERISTIC_WEBDAV_DEVICE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global FILE_CHARACTERISTIC_CSV := 65536

/**
 * @type {Integer (UInt32)}
 */
export global FILE_DEVICE_ALLOW_APPCONTAINER_TRAVERSAL := 131072

/**
 * @type {Integer (UInt32)}
 */
export global FILE_PORTABLE_DEVICE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global FILE_REMOTE_DEVICE_VSMB := 524288

/**
 * @type {Integer (UInt32)}
 */
export global FILE_DEVICE_REQUIRE_SECURITY_CHECK := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global IO_SESSION_STATE_ALL_EVENTS := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global IO_SESSION_STATE_CREATION_EVENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_SESSION_STATE_TERMINATION_EVENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global IO_SESSION_STATE_CONNECT_EVENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global IO_SESSION_STATE_DISCONNECT_EVENT := 8

/**
 * @type {Integer (UInt32)}
 */
export global IO_SESSION_STATE_LOGON_EVENT := 16

/**
 * @type {Integer (UInt32)}
 */
export global IO_SESSION_STATE_LOGOFF_EVENT := 32

/**
 * @type {Integer (UInt32)}
 */
export global IO_SESSION_STATE_VALID_EVENT_MASK := 63

/**
 * @type {Integer (Int32)}
 */
export global IO_SESSION_MAX_PAYLOAD_SIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global FILE_SKIP_SET_USER_EVENT_ON_FAST_IO := 4

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_LOG_LIMIT_SIZE := 240

/**
 * @type {Integer (UInt32)}
 */
export global PORT_MAXIMUM_MESSAGE_LENGTH := 512

/**
 * @type {Integer (UInt32)}
 */
export global OBJECT_TYPE_CREATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DIRECTORY_QUERY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DIRECTORY_TRAVERSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DIRECTORY_CREATE_OBJECT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DIRECTORY_CREATE_SUBDIRECTORY := 8

/**
 * @type {Integer (UInt32)}
 */
export global SYMBOLIC_LINK_QUERY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYMBOLIC_LINK_SET := 2

/**
 * @type {Integer (UInt32)}
 */
export global DUPLICATE_SAME_ATTRIBUTES := 4

/**
 * @type {Integer (UInt32)}
 */
export global SECTION_QUERY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECTION_MAP_WRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECTION_MAP_READ := 4

/**
 * @type {Integer (UInt32)}
 */
export global SECTION_MAP_EXECUTE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SECTION_MAP_EXECUTE_EXPLICIT := 32

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_NOACCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_READONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_READWRITE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_WRITECOPY := 8

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_EXECUTE := 16

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_EXECUTE_READ := 32

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_EXECUTE_READWRITE := 64

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_EXECUTE_WRITECOPY := 128

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_GUARD := 256

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_NOCACHE := 512

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_WRITECOMBINE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_GRAPHICS_NOACCESS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_GRAPHICS_READONLY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_GRAPHICS_READWRITE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_GRAPHICS_EXECUTE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_GRAPHICS_EXECUTE_READ := 32768

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_GRAPHICS_EXECUTE_READWRITE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_GRAPHICS_COHERENT := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_GRAPHICS_NOCACHE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_ENCLAVE_THREAD_CONTROL := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_REVERT_TO_FILE_MAP := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_TARGETS_NO_UPDATE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_TARGETS_INVALID := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_ENCLAVE_UNVALIDATED := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_ENCLAVE_NO_CHANGE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global MEM_COMMIT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global MEM_RESERVE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global MEM_RESET := 524288

/**
 * @type {Integer (UInt32)}
 */
export global MEM_TOP_DOWN := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global MEM_RESET_UNDO := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global MEM_LARGE_PAGES := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global MEM_DECOMMIT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global MEM_RELEASE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global MEM_EXTENDED_PARAMETER_EC_CODE := 64

/**
 * @type {Integer (UInt32)}
 */
export global MEM_EXTENDED_PARAMETER_TYPE_BITS := 8

/**
 * @type {Integer (UInt32)}
 */
export global SEC_LARGE_PAGES := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global MEM_PRIVATE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global MEM_MAPPED := 262144

/**
 * @type {Integer (UInt32)}
 */
export global THREAD_ALERT := 4

/**
 * @type {Integer (UInt32)}
 */
export global THREAD_GET_CONTEXT := 8

/**
 * @type {Integer (UInt32)}
 */
export global PARKING_TOPOLOGY_POLICY_DISABLED := 0

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_QUERY_DEVICE_POWER_STATE := 2703360

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SET_DEVICE_WAKE := 2719748

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_CANCEL_DEVICE_WAKE := 2719752

/**
 * @type {Integer (UInt32)}
 */
export global POWER_SETTING_VALUE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global POWER_PLATFORM_ROLE_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global POWER_PLATFORM_ROLE_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global POWER_PLATFORM_ROLE_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_SERVICE_MEASURED_BOOT_LOAD := 32

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypeNull := 0

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypePort := 1

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypeInterrupt := 2

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypeMemory := 3

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypeDma := 4

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypeDeviceSpecific := 5

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypeBusNumber := 6

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypeMemoryLarge := 7

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypeNonArbitrated := 128

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypeConfigData := 128

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypeDevicePrivate := 129

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypePcCardConfig := 130

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypeMfCardConfig := 131

/**
 * @type {Integer (UInt32)}
 */
export global CmResourceTypeConnection := 132

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_INTERRUPT_LEVEL_SENSITIVE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_INTERRUPT_LATCHED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_INTERRUPT_MESSAGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_INTERRUPT_POLICY_INCLUDED := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_INTERRUPT_SECONDARY_INTERRUPT := 16

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_INTERRUPT_WAKE_HINT := 32

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_INTERRUPT_LEVEL_LATCHED_BITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_READ_WRITE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_READ_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_WRITE_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_WRITEABILITY_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_PREFETCHABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_COMBINEDWRITE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_24 := 16

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_CACHEABLE := 32

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_WINDOW_DECODE := 64

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_BAR := 128

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_COMPAT_FOR_INACCESSIBLE_RANGE := 256

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_LARGE := 3584

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_LARGE_40 := 512

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_LARGE_48 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_MEMORY_LARGE_64 := 2048

/**
 * @type {Integer (UInt64)}
 */
export global CM_RESOURCE_MEMORY_LARGE_40_MAXLEN := 1099511627520

/**
 * @type {Integer (UInt64)}
 */
export global CM_RESOURCE_MEMORY_LARGE_48_MAXLEN := 281474976645120

/**
 * @type {Integer (UInt64)}
 */
export global CM_RESOURCE_MEMORY_LARGE_64_MAXLEN := 18446744069414584320

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_PORT_MEMORY := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_PORT_IO := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_PORT_10_BIT_DECODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_PORT_12_BIT_DECODE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_PORT_16_BIT_DECODE := 16

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_PORT_POSITIVE_DECODE := 32

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_PORT_PASSIVE_DECODE := 64

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_PORT_WINDOW_DECODE := 128

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_PORT_BAR := 256

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_DMA_8 := 0

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_DMA_16 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_DMA_32 := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_DMA_8_AND_16 := 4

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_DMA_BUS_MASTER := 8

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_DMA_TYPE_A := 16

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_DMA_TYPE_B := 32

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_DMA_TYPE_F := 64

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_DMA_V3 := 128

/**
 * @type {Integer (UInt32)}
 */
export global DMAV3_TRANFER_WIDTH_8 := 0

/**
 * @type {Integer (UInt32)}
 */
export global DMAV3_TRANFER_WIDTH_16 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMAV3_TRANFER_WIDTH_32 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMAV3_TRANFER_WIDTH_64 := 3

/**
 * @type {Integer (UInt32)}
 */
export global DMAV3_TRANFER_WIDTH_128 := 4

/**
 * @type {Integer (UInt32)}
 */
export global DMAV3_TRANFER_WIDTH_256 := 5

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_CONNECTION_CLASS_GPIO := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_CONNECTION_CLASS_SERIAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_CONNECTION_CLASS_FUNCTION_CONFIG := 3

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_CONNECTION_TYPE_GPIO_IO := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_CONNECTION_TYPE_SERIAL_I2C := 1

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_CONNECTION_TYPE_SERIAL_SPI := 2

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_CONNECTION_TYPE_SERIAL_UART := 3

/**
 * @type {Integer (UInt32)}
 */
export global CM_RESOURCE_CONNECTION_TYPE_FUNCTION_CONFIG := 1

/**
 * @type {Integer (UInt32)}
 */
export global EISA_FUNCTION_ENABLED := 128

/**
 * @type {Integer (UInt32)}
 */
export global EISA_FREE_FORM_DATA := 64

/**
 * @type {Integer (UInt32)}
 */
export global EISA_HAS_PORT_INIT_ENTRY := 32

/**
 * @type {Integer (UInt32)}
 */
export global EISA_HAS_PORT_RANGE := 16

/**
 * @type {Integer (UInt32)}
 */
export global EISA_HAS_DMA_ENTRY := 8

/**
 * @type {Integer (UInt32)}
 */
export global EISA_HAS_IRQ_ENTRY := 4

/**
 * @type {Integer (UInt32)}
 */
export global EISA_HAS_MEMORY_ENTRY := 2

/**
 * @type {Integer (UInt32)}
 */
export global EISA_HAS_TYPE_ENTRY := 1

/**
 * @type {Integer (UInt32)}
 */
export global EISA_MORE_ENTRIES := 128

/**
 * @type {Integer (UInt32)}
 */
export global EISA_SYSTEM_MEMORY := 0

/**
 * @type {Integer (UInt32)}
 */
export global EISA_MEMORY_TYPE_RAM := 1

/**
 * @type {Integer (UInt32)}
 */
export global EISA_INVALID_SLOT := 128

/**
 * @type {Integer (UInt32)}
 */
export global EISA_INVALID_FUNCTION := 129

/**
 * @type {Integer (UInt32)}
 */
export global EISA_INVALID_CONFIGURATION := 130

/**
 * @type {Integer (UInt32)}
 */
export global EISA_EMPTY_SLOT := 131

/**
 * @type {Integer (UInt32)}
 */
export global EISA_INVALID_BIOS_CALL := 134

/**
 * @type {Integer (UInt32)}
 */
export global IO_RESOURCE_PREFERRED := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_RESOURCE_DEFAULT := 2

/**
 * @type {Integer (UInt32)}
 */
export global IO_RESOURCE_ALTERNATIVE := 8

/**
 * @type {Integer (UInt32)}
 */
export global RTL_QUERY_REGISTRY_SUBKEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTL_QUERY_REGISTRY_TOPKEY := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTL_QUERY_REGISTRY_REQUIRED := 4

/**
 * @type {Integer (UInt32)}
 */
export global RTL_QUERY_REGISTRY_NOVALUE := 8

/**
 * @type {Integer (UInt32)}
 */
export global RTL_QUERY_REGISTRY_NOEXPAND := 16

/**
 * @type {Integer (UInt32)}
 */
export global RTL_QUERY_REGISTRY_DIRECT := 32

/**
 * @type {Integer (UInt32)}
 */
export global RTL_QUERY_REGISTRY_DELETE := 64

/**
 * @type {Integer (UInt32)}
 */
export global RTL_QUERY_REGISTRY_NOSTRING := 128

/**
 * @type {Integer (UInt32)}
 */
export global RTL_QUERY_REGISTRY_TYPECHECK := 256

/**
 * @type {Integer (UInt32)}
 */
export global RTL_QUERY_REGISTRY_TYPECHECK_SHIFT := 24

/**
 * @type {Integer (UInt32)}
 */
export global RTL_REGISTRY_ABSOLUTE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RTL_REGISTRY_SERVICES := 1

/**
 * @type {Integer (UInt32)}
 */
export global RTL_REGISTRY_CONTROL := 2

/**
 * @type {Integer (UInt32)}
 */
export global RTL_REGISTRY_WINDOWS_NT := 3

/**
 * @type {Integer (UInt32)}
 */
export global RTL_REGISTRY_DEVICEMAP := 4

/**
 * @type {Integer (UInt32)}
 */
export global RTL_REGISTRY_USER := 5

/**
 * @type {Integer (UInt32)}
 */
export global RTL_REGISTRY_MAXIMUM := 6

/**
 * @type {Integer (UInt32)}
 */
export global RTL_REGISTRY_HANDLE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global RTL_REGISTRY_OPTIONAL := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global HASH_STRING_ALGORITHM_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global HASH_STRING_ALGORITHM_X65599 := 1

/**
 * @type {Integer (UInt32)}
 */
export global HASH_STRING_ALGORITHM_INVALID := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global RTL_GUID_STRING_SIZE := 38

/**
 * @type {Integer (UInt32)}
 */
export global DBG_STATUS_CONTROL_C := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBG_STATUS_SYSRQ := 2

/**
 * @type {Integer (UInt32)}
 */
export global DBG_STATUS_BUGCHECK_FIRST := 3

/**
 * @type {Integer (UInt32)}
 */
export global DBG_STATUS_BUGCHECK_SECOND := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBG_STATUS_FATAL := 5

/**
 * @type {Integer (UInt32)}
 */
export global DBG_STATUS_DEBUG_CONTROL := 6

/**
 * @type {Integer (UInt32)}
 */
export global DBG_STATUS_WORKER := 7

/**
 * @type {Integer (UInt32)}
 */
export global LOWBYTE_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global SHORT_LEAST_SIGNIFICANT_BIT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SHORT_MOST_SIGNIFICANT_BIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global LONG_LEAST_SIGNIFICANT_BIT := 0

/**
 * @type {Integer (UInt32)}
 */
export global LONG_3RD_MOST_SIGNIFICANT_BIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global LONG_2ND_MOST_SIGNIFICANT_BIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global LONG_MOST_SIGNIFICANT_BIT := 3

/**
 * @type {Integer (UInt32)}
 */
export global POOL_TAGGING := 1

/**
 * @type {Integer (UInt32)}
 */
export global DPC_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global DPC_THREADED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PAGE_SIZE := 4096

/**
 * @type {Integer (Int32)}
 */
export global PAGE_SHIFT := 12

/**
 * @type {Integer (UInt32)}
 */
export global MDL_ALLOCATED_FIXED_SIZE := 8

/**
 * @type {Integer (UInt32)}
 */
export global MDL_LOCKED_PAGE_TABLES := 256

/**
 * @type {Integer (UInt32)}
 */
export global MDL_FREE_EXTRA_PTES := 512

/**
 * @type {Integer (UInt32)}
 */
export global MDL_DESCRIBES_AWE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MDL_PAGE_CONTENTS_INVARIANT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global MDL_INTERNAL := 32768

/**
 * @type {Integer (UInt32)}
 */
export global KENCODED_TIMER_PROCESSOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global TIMER_TOLERABLE_DELAY_BITS := 6

/**
 * @type {Integer (UInt32)}
 */
export global TIMER_EXPIRED_INDEX_BITS := 6

/**
 * @type {Integer (UInt32)}
 */
export global TIMER_PROCESSOR_INDEX_BITS := 5

/**
 * @type {Integer (UInt32)}
 */
export global FLUSH_MULTIPLE_MAXIMUM := 32

/**
 * @type {Integer (UInt32)}
 */
export global ALLOC_PRAGMA := 1

/**
 * @type {Integer (UInt32)}
 */
export global ALLOC_DATA_PRAGMA := 1

/**
 * @type {Integer (UInt32)}
 */
export global EFLAG_SIGN := 32768

/**
 * @type {Integer (UInt32)}
 */
export global EFLAG_ZERO := 16384

/**
 * @type {Integer (UInt32)}
 */
export global MAX_EVENT_COUNTERS := 31

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_QUERY_STATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SEMAPHORE_QUERY_STATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROCESSOR_FEATURE_MAX := 64

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_SOFTWARE_ORIGINATE := 128

/**
 * @type {Integer (UInt32)}
 */
export global THREAD_WAIT_OBJECTS := 3

/**
 * @type {Integer (UInt32)}
 */
export global KB_SECONDARY_DATA_FLAG_ADDITIONAL_DATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global KB_SECONDARY_DATA_FLAG_NO_DEVICE_ACCESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global KB_ADD_PAGES_FLAG_VIRTUAL_ADDRESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global KB_ADD_PAGES_FLAG_PHYSICAL_ADDRESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global KB_ADD_PAGES_FLAG_ADDITIONAL_RANGES_EXIST := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global KB_REMOVE_PAGES_FLAG_VIRTUAL_ADDRESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global KB_REMOVE_PAGES_FLAG_PHYSICAL_ADDRESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global KB_REMOVE_PAGES_FLAG_ADDITIONAL_RANGES_EXIST := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global KE_MAX_TRIAGE_DUMP_DATA_MEMORY_SIZE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global KB_TRIAGE_DUMP_DATA_FLAG_BUGCHECK_ACTIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_DIVIDED_BY_ZERO := 0

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_DEBUG := 1

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_NMI := 2

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_INT3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_BOUND_CHECK := 5

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_INVALID_OPCODE := 6

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_NPX_NOT_AVAILABLE := 7

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_DOUBLE_FAULT := 8

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_NPX_OVERRUN := 9

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_INVALID_TSS := 10

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_SEGMENT_NOT_PRESENT := 11

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_STACK_FAULT := 12

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_GP_FAULT := 13

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_RESERVED_TRAP := 15

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_NPX_ERROR := 16

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_ALIGNMENT_CHECK := 17

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_CP_FAULT := 21

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_SE_FAULT := 23

/**
 * @type {Integer (UInt32)}
 */
export global EXCEPTION_VIRTUALIZATION_FAULT := 32

/**
 * @type {Integer (UInt32)}
 */
export global KE_PROCESSOR_CHANGE_ADD_EXISTING := 1

/**
 * @type {Integer (UInt32)}
 */
export global POOL_COLD_ALLOCATION := 256

/**
 * @type {Integer (UInt32)}
 */
export global POOL_NX_ALLOCATION := 512

/**
 * @type {Integer (UInt32)}
 */
export global POOL_ZERO_ALLOCATION := 1024

/**
 * @type {Integer (UInt32)}
 */
export global POOL_NX_OPTIN_AUTO := 1

/**
 * @type {Integer (UInt32)}
 */
export global POOL_QUOTA_FAIL_INSTEAD_OF_RAISE := 8

/**
 * @type {Integer (UInt32)}
 */
export global POOL_RAISE_IF_ALLOCATION_FAILURE := 16

/**
 * @type {Integer (UInt32)}
 */
export global POOL_EXTENDED_PARAMETER_TYPE_BITS := 8

/**
 * @type {Integer (UInt32)}
 */
export global POOL_EXTENDED_PARAMETER_REQUIRED_FIELD_BITS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECURE_POOL_FLAGS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SECURE_POOL_FLAGS_FREEABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECURE_POOL_FLAGS_MODIFIABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global POOL_CREATE_FLG_SECURE_POOL := 1

/**
 * @type {Integer (UInt32)}
 */
export global POOL_CREATE_FLG_USE_GLOBAL_POOL := 2

/**
 * @type {Integer (UInt32)}
 */
export global POOL_CREATE_PARAMS_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global FM_LOCK_BIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FM_LOCK_BIT_V := 0

/**
 * @type {Integer (UInt32)}
 */
export global EX_LOOKASIDE_LIST_EX_FLAGS_RAISE_ON_FAIL := 1

/**
 * @type {Integer (UInt32)}
 */
export global EX_LOOKASIDE_LIST_EX_FLAGS_FAIL_NO_RAISE := 2

/**
 * @type {Integer (UInt32)}
 */
export global EX_MAXIMUM_LOOKASIDE_DEPTH_BASE := 256

/**
 * @type {Integer (UInt32)}
 */
export global EX_MAXIMUM_LOOKASIDE_DEPTH_LIMIT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global ResourceNeverExclusive := 16

/**
 * @type {Integer (UInt32)}
 */
export global ResourceReleaseByOtherThread := 32

/**
 * @type {Integer (UInt32)}
 */
export global ResourceOwnedExclusive := 128

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCE_HASH_TABLE_SIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_OWNER_POINTER_IS_THREAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global EX_RUNDOWN_ACTIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global EX_RUNDOWN_COUNT_SHIFT := 1

/**
 * @type {Integer (UInt32)}
 */
export global EX_TIMER_HIGH_RESOLUTION := 4

/**
 * @type {Integer (UInt32)}
 */
export global EX_TIMER_NO_WAKE := 8

/**
 * @type {Integer (UInt32)}
 */
export global EX_CARR_ALLOCATE_PAGED_POOL := 0

/**
 * @type {Integer (UInt32)}
 */
export global EX_CARR_ALLOCATE_NONPAGED_POOL := 1

/**
 * @type {Integer (UInt32)}
 */
export global EX_CARR_DISABLE_EXPANSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global EX_DEFAULT_PUSH_LOCK_FLAGS := 0

/**
 * @type {Integer (UInt32)}
 */
export global ATS_DEVICE_SVM_OPTOUT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_MAXIMUM_DISK_IO_SIZE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global MM_PERMANENT_ADDRESS_IS_IO_SPACE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_DUMP_MAP_CACHED := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_DUMP_MAP_INVALIDATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MdlMappingNoWrite := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global MdlMappingNoExecute := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global MdlMappingWithGuardPtes := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global MM_MAPPING_ADDRESS_DIVISIBLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_DONT_ZERO_ALLOCATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_ALLOCATE_FROM_LOCAL_NODE_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global MM_ALLOCATE_FULLY_REQUIRED := 4

/**
 * @type {Integer (UInt32)}
 */
export global MM_ALLOCATE_NO_WAIT := 8

/**
 * @type {Integer (UInt32)}
 */
export global MM_ALLOCATE_PREFER_CONTIGUOUS := 16

/**
 * @type {Integer (UInt32)}
 */
export global MM_ALLOCATE_REQUIRE_CONTIGUOUS_CHUNKS := 32

/**
 * @type {Integer (UInt32)}
 */
export global MM_ALLOCATE_FAST_LARGE_PAGES := 64

/**
 * @type {Integer (UInt32)}
 */
export global MM_ALLOCATE_TRIM_IF_NECESSARY := 128

/**
 * @type {Integer (UInt32)}
 */
export global MM_ALLOCATE_AND_HOT_REMOVE := 256

/**
 * @type {Integer (UInt32)}
 */
export global MM_FREE_MDL_PAGES_ZERO := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_PROTECT_DRIVER_SECTION_ALLOW_UNLOAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global MM_PROTECT_DRIVER_SECTION_VALID_FLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global INITIAL_PRIVILEGE_COUNT := 3

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_ADAPTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_CONTROLLER := 2

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_DEVICE := 3

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_DRIVER := 4

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_FILE := 5

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_IRP := 6

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_MASTER_ADAPTER := 7

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_OPEN_PACKET := 8

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_TIMER := 9

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_VPB := 10

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_ERROR_LOG := 11

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_ERROR_MESSAGE := 12

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_DEVICE_OBJECT_EXTENSION := 13

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_IORING := 14

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_CREATE := 0

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_CREATE_NAMED_PIPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_CLOSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_READ := 3

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_WRITE := 4

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_QUERY_INFORMATION := 5

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_SET_INFORMATION := 6

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_QUERY_EA := 7

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_SET_EA := 8

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_FLUSH_BUFFERS := 9

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_QUERY_VOLUME_INFORMATION := 10

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_SET_VOLUME_INFORMATION := 11

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_DIRECTORY_CONTROL := 12

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_FILE_SYSTEM_CONTROL := 13

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_DEVICE_CONTROL := 14

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_INTERNAL_DEVICE_CONTROL := 15

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_SHUTDOWN := 16

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_LOCK_CONTROL := 17

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_CLEANUP := 18

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_CREATE_MAILSLOT := 19

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_QUERY_SECURITY := 20

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_SET_SECURITY := 21

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_POWER := 22

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_SYSTEM_CONTROL := 23

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_DEVICE_CHANGE := 24

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_QUERY_QUOTA := 25

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_SET_QUOTA := 26

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_PNP := 27

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_PNP_POWER := 27

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_MAXIMUM_FUNCTION := 27

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MJ_SCSI := 15

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_SCSI_CLASS := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_START_DEVICE := 0

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_REMOVE_DEVICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_REMOVE_DEVICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_CANCEL_REMOVE_DEVICE := 3

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_STOP_DEVICE := 4

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_STOP_DEVICE := 5

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_CANCEL_STOP_DEVICE := 6

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_DEVICE_RELATIONS := 7

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_INTERFACE := 8

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_CAPABILITIES := 9

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_RESOURCES := 10

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_RESOURCE_REQUIREMENTS := 11

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_DEVICE_TEXT := 12

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_FILTER_RESOURCE_REQUIREMENTS := 13

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_READ_CONFIG := 15

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_WRITE_CONFIG := 16

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_EJECT := 17

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_SET_LOCK := 18

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_ID := 19

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_PNP_DEVICE_STATE := 20

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_BUS_INFORMATION := 21

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_DEVICE_USAGE_NOTIFICATION := 22

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_SURPRISE_REMOVAL := 23

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_DEVICE_ENUMERATED := 25

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_WAIT_WAKE := 0

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_POWER_SEQUENCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_SET_POWER := 2

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_POWER := 3

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_ALL_DATA := 0

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_QUERY_SINGLE_INSTANCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_CHANGE_SINGLE_INSTANCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_CHANGE_SINGLE_ITEM := 3

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_ENABLE_EVENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_DISABLE_EVENTS := 5

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_ENABLE_COLLECTION := 6

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_DISABLE_COLLECTION := 7

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_REGINFO := 8

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_EXECUTE_METHOD := 9

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MN_REGINFO_EX := 11

/**
 * @type {Integer (UInt32)}
 */
export global IO_FORCE_ACCESS_CHECK := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_NO_PARAMETER_CHECKING := 256

/**
 * @type {Integer (UInt32)}
 */
export global IO_REPARSE := 0

/**
 * @type {Integer (UInt32)}
 */
export global IO_REMOUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_REPARSE_GLOBAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global VPB_MOUNTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global VPB_LOCKED := 2

/**
 * @type {Integer (UInt32)}
 */
export global VPB_PERSISTENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global VPB_REMOVE_PENDING := 8

/**
 * @type {Integer (UInt32)}
 */
export global VPB_RAW_MOUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global VPB_DIRECT_WRITES_ALLOWED := 32

/**
 * @type {Integer (UInt32)}
 */
export global VPB_FLAGS_BYPASSIO_BLOCKED := 64

/**
 * @type {Integer (UInt32)}
 */
export global VPB_DISMOUNTING := 128

/**
 * @type {Integer (UInt32)}
 */
export global DRVO_UNLOAD_INVOKED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRVO_LEGACY_DRIVER := 2

/**
 * @type {Integer (UInt32)}
 */
export global DRVO_BUILTIN_DRIVER := 4

/**
 * @type {Integer (UInt32)}
 */
export global FO_FILE_OPEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global FO_SYNCHRONOUS_IO := 2

/**
 * @type {Integer (UInt32)}
 */
export global FO_ALERTABLE_IO := 4

/**
 * @type {Integer (UInt32)}
 */
export global FO_NO_INTERMEDIATE_BUFFERING := 8

/**
 * @type {Integer (UInt32)}
 */
export global FO_WRITE_THROUGH := 16

/**
 * @type {Integer (UInt32)}
 */
export global FO_SEQUENTIAL_ONLY := 32

/**
 * @type {Integer (UInt32)}
 */
export global FO_CACHE_SUPPORTED := 64

/**
 * @type {Integer (UInt32)}
 */
export global FO_NAMED_PIPE := 128

/**
 * @type {Integer (UInt32)}
 */
export global FO_STREAM_FILE := 256

/**
 * @type {Integer (UInt32)}
 */
export global FO_MAILSLOT := 512

/**
 * @type {Integer (UInt32)}
 */
export global FO_GENERATE_AUDIT_ON_CLOSE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global FO_QUEUE_IRP_TO_THREAD := 1024

/**
 * @type {Integer (UInt32)}
 */
export global FO_DIRECT_DEVICE_OPEN := 2048

/**
 * @type {Integer (UInt32)}
 */
export global FO_FILE_MODIFIED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FO_FILE_SIZE_CHANGED := 8192

/**
 * @type {Integer (UInt32)}
 */
export global FO_CLEANUP_COMPLETE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global FO_TEMPORARY_FILE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global FO_DELETE_ON_CLOSE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global FO_OPENED_CASE_SENSITIVE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global FO_HANDLE_CREATED := 262144

/**
 * @type {Integer (UInt32)}
 */
export global FO_FILE_FAST_IO_READ := 524288

/**
 * @type {Integer (UInt32)}
 */
export global FO_RANDOM_ACCESS := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global FO_FILE_OPEN_CANCELLED := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global FO_VOLUME_OPEN := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global FO_BYPASS_IO_ENABLED := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global FO_REMOTE_ORIGIN := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global FO_DISALLOW_EXCLUSIVE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global FO_SKIP_COMPLETION_PORT := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global FO_SKIP_SET_EVENT := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global FO_SKIP_SET_FAST_IO := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global FO_INDIRECT_WAIT_OBJECT := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global FO_SECTION_MINSTORE_TREATMENT := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global FO_FLAGS_VALID_ONLY_DURING_CREATE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global IRP_NOCACHE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRP_PAGING_IO := 2

/**
 * @type {Integer (UInt32)}
 */
export global IRP_MOUNT_COMPLETION := 2

/**
 * @type {Integer (UInt32)}
 */
export global IRP_SYNCHRONOUS_API := 4

/**
 * @type {Integer (UInt32)}
 */
export global IRP_ASSOCIATED_IRP := 8

/**
 * @type {Integer (UInt32)}
 */
export global IRP_BUFFERED_IO := 16

/**
 * @type {Integer (UInt32)}
 */
export global IRP_DEALLOCATE_BUFFER := 32

/**
 * @type {Integer (UInt32)}
 */
export global IRP_INPUT_OPERATION := 64

/**
 * @type {Integer (UInt32)}
 */
export global IRP_SYNCHRONOUS_PAGING_IO := 64

/**
 * @type {Integer (UInt32)}
 */
export global IRP_CREATE_OPERATION := 128

/**
 * @type {Integer (UInt32)}
 */
export global IRP_READ_OPERATION := 256

/**
 * @type {Integer (UInt32)}
 */
export global IRP_WRITE_OPERATION := 512

/**
 * @type {Integer (UInt32)}
 */
export global IRP_CLOSE_OPERATION := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IRP_DEFER_IO_COMPLETION := 2048

/**
 * @type {Integer (UInt32)}
 */
export global IRP_OB_QUERY_NAME := 4096

/**
 * @type {Integer (UInt32)}
 */
export global IRP_HOLD_DEVICE_QUEUE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global IRP_UM_DRIVER_INITIATED_IO := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global IRP_QUOTA_CHARGED := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRP_ALLOCATED_MUST_SUCCEED := 2

/**
 * @type {Integer (UInt32)}
 */
export global IRP_ALLOCATED_FIXED_SIZE := 4

/**
 * @type {Integer (UInt32)}
 */
export global IRP_LOOKASIDE_ALLOCATION := 8

/**
 * @type {Integer (UInt32)}
 */
export global SL_PENDING_RETURNED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SL_ERROR_RETURNED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SL_INVOKE_ON_CANCEL := 32

/**
 * @type {Integer (UInt32)}
 */
export global SL_INVOKE_ON_SUCCESS := 64

/**
 * @type {Integer (UInt32)}
 */
export global SL_INVOKE_ON_ERROR := 128

/**
 * @type {Integer (UInt32)}
 */
export global SL_FORCE_ACCESS_CHECK := 1

/**
 * @type {Integer (UInt32)}
 */
export global SL_OPEN_PAGING_FILE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SL_OPEN_TARGET_DIRECTORY := 4

/**
 * @type {Integer (UInt32)}
 */
export global SL_STOP_ON_SYMLINK := 8

/**
 * @type {Integer (UInt32)}
 */
export global SL_IGNORE_READONLY_ATTRIBUTE := 64

/**
 * @type {Integer (UInt32)}
 */
export global SL_CASE_SENSITIVE := 128

/**
 * @type {Integer (UInt32)}
 */
export global SL_KEY_SPECIFIED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SL_OVERRIDE_VERIFY_VOLUME := 2

/**
 * @type {Integer (UInt32)}
 */
export global SL_WRITE_THROUGH := 4

/**
 * @type {Integer (UInt32)}
 */
export global SL_FT_SEQUENTIAL_WRITE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SL_FORCE_DIRECT_WRITE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SL_REALTIME_STREAM := 32

/**
 * @type {Integer (UInt32)}
 */
export global SL_PERSISTENT_MEMORY_FIXED_MAPPING := 32

/**
 * @type {Integer (UInt32)}
 */
export global SL_BYPASS_IO := 64

/**
 * @type {Integer (UInt32)}
 */
export global SL_FORCE_ASYNCHRONOUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SL_READ_ACCESS_GRANTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SL_WRITE_ACCESS_GRANTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global SL_FAIL_IMMEDIATELY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SL_EXCLUSIVE_LOCK := 2

/**
 * @type {Integer (UInt32)}
 */
export global SL_RESTART_SCAN := 1

/**
 * @type {Integer (UInt32)}
 */
export global SL_RETURN_SINGLE_ENTRY := 2

/**
 * @type {Integer (UInt32)}
 */
export global SL_INDEX_SPECIFIED := 4

/**
 * @type {Integer (UInt32)}
 */
export global SL_RETURN_ON_DISK_ENTRIES_ONLY := 8

/**
 * @type {Integer (UInt32)}
 */
export global SL_NO_CURSOR_UPDATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SL_QUERY_DIRECTORY_MASK := 27

/**
 * @type {Integer (UInt32)}
 */
export global SL_WATCH_TREE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SL_ALLOW_RAW_MOUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SL_BYPASS_ACCESS_CHECK := 1

/**
 * @type {Integer (UInt32)}
 */
export global SL_INFO_FORCE_ACCESS_CHECK := 1

/**
 * @type {Integer (UInt32)}
 */
export global SL_INFO_IGNORE_READONLY_ATTRIBUTE := 64

/**
 * @type {Integer (UInt32)}
 */
export global PNP_DEVICE_DISABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PNP_DEVICE_DONT_DISPLAY_IN_UI := 2

/**
 * @type {Integer (UInt32)}
 */
export global PNP_DEVICE_FAILED := 4

/**
 * @type {Integer (UInt32)}
 */
export global PNP_DEVICE_REMOVED := 8

/**
 * @type {Integer (UInt32)}
 */
export global PNP_DEVICE_RESOURCE_REQUIREMENTS_CHANGED := 16

/**
 * @type {Integer (UInt32)}
 */
export global PNP_DEVICE_NOT_DISABLEABLE := 32

/**
 * @type {Integer (UInt32)}
 */
export global PNP_DEVICE_DISCONNECTED := 64

/**
 * @type {Integer (UInt32)}
 */
export global PNP_DEVICE_RESOURCE_UPDATED := 128

/**
 * @type {Integer (UInt32)}
 */
export global PNP_DEVICE_ASSIGNED_TO_GUEST := 256

/**
 * @type {Integer (UInt32)}
 */
export global IO_SHARE_ACCESS_NO_WRITE_PERMISSION := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global IO_SHARE_ACCESS_NON_PRIMARY_STREAM := 128

/**
 * @type {Integer (UInt32)}
 */
export global IO_CHECK_SHARE_ACCESS_UPDATE_SHARE_ACCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_CHECK_SHARE_ACCESS_DONT_UPDATE_FILE_OBJECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global IO_CHECK_SHARE_ACCESS_DONT_CHECK_READ := 4

/**
 * @type {Integer (UInt32)}
 */
export global IO_CHECK_SHARE_ACCESS_DONT_CHECK_WRITE := 8

/**
 * @type {Integer (UInt32)}
 */
export global IO_CHECK_SHARE_ACCESS_DONT_CHECK_DELETE := 16

/**
 * @type {Integer (UInt32)}
 */
export global IO_CHECK_SHARE_ACCESS_FORCE_CHECK := 32

/**
 * @type {Integer (UInt32)}
 */
export global IO_CHECK_SHARE_ACCESS_FORCE_USING_SCB := 64

/**
 * @type {Integer (UInt32)}
 */
export global CONNECT_FULLY_SPECIFIED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CONNECT_LINE_BASED := 2

/**
 * @type {Integer (UInt32)}
 */
export global CONNECT_MESSAGE_BASED := 3

/**
 * @type {Integer (UInt32)}
 */
export global CONNECT_FULLY_SPECIFIED_GROUP := 4

/**
 * @type {Integer (UInt32)}
 */
export global CONNECT_MESSAGE_BASED_PASSIVE := 5

/**
 * @type {Integer (UInt32)}
 */
export global CONNECT_CURRENT_VERSION := 5

/**
 * @type {Integer (UInt32)}
 */
export global WDM_MAJORVERSION := 6

/**
 * @type {Integer (UInt32)}
 */
export global WDM_MINORVERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_ACTION_REGISTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_ACTION_DEREGISTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_ACTION_REREGISTER := 3

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_ACTION_UPDATE_GUIDS := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_ACTION_BLOCK_IRPS := 5

/**
 * @type {Integer (UInt32)}
 */
export global WMIREGISTER := 0

/**
 * @type {Integer (UInt32)}
 */
export global WMIUPDATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_CSQ_IRP_CONTEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_CSQ := 2

/**
 * @type {Integer (UInt32)}
 */
export global IO_TYPE_CSQ_EX := 3

/**
 * @type {Integer (UInt32)}
 */
export global IO_ATTRIBUTION_INFO_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_SET_IRP_IO_ATTRIBUTION_FROM_THREAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global IO_SET_IRP_IO_ATTRIBUTION_FROM_PROCESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global IO_SET_IRP_IO_ATTRIBUTION_FLAGS_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global __string_type := 4096

/**
 * @type {Integer (UInt32)}
 */
export global __guid_type := 8192

/**
 * @type {Integer (UInt32)}
 */
export global __multiString_type := 16384

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SECURITY_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SECURITY_INTERFACE_VERSION2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SECURITY_FULLY_SUPPORTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SECURITY_ENHANCED := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SECURITY_GUEST_ASSIGNED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SECURITY_DIRECT_TRANSLATED_P2P := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SECURITY_SRIOV_DIRECT_TRANSLATED_P2P := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ATS_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PNP_EXTENDED_ADDRESS_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3COLD_SUPPORT_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_PTM_TIME_SOURCE_AUX := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global NPEM_CONTROL_INTERFACE_VERSION1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global NPEM_CONTROL_INTERFACE_VERSION2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global NPEM_CONTROL_INTERFACE_CURRENT_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global PLUGPLAY_REGKEY_DEVICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PLUGPLAY_REGKEY_DRIVER := 2

/**
 * @type {Integer (UInt32)}
 */
export global PLUGPLAY_REGKEY_CURRENT_HWPROFILE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_INTERFACE_INCLUDE_NONACTIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PNPNOTIFY_DEVICE_INTERFACE_INCLUDE_EXISTING_INTERFACES := 1

/**
 * @type {Integer (UInt32)}
 */
export global KERNEL_SOFT_RESTART_NOTIFICATION_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PLUGPLAY_PROPERTY_PERSISTENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PNP_REPLACE_PARAMETERS_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global PNP_REPLACE_DRIVER_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PNP_REPLACE_MEMORY_SUPPORTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PNP_REPLACE_PROCESSOR_SUPPORTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global PNP_REPLACE_HARDWARE_MEMORY_MIRRORING := 4

/**
 * @type {Integer (UInt32)}
 */
export global PNP_REPLACE_HARDWARE_PAGE_COPY := 8

/**
 * @type {Integer (UInt32)}
 */
export global PNP_REPLACE_HARDWARE_QUIESCE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_RESET_INTERFACE_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_RESET_INTERFACE_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_RESET_INTERFACE_VERSION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_RESET_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECURE_DRIVER_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SDEV_IDENTIFIER_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_DESCRIPTION_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_DESCRIPTION_VERSION1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_DESCRIPTION_VERSION2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DEVICE_DESCRIPTION_VERSION3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global DMA_ADAPTER_INFO_VERSION1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global ADAPTER_INFO_SYNCHRONOUS_CALLBACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global ADAPTER_INFO_API_BYPASS := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMA_TRANSFER_INFO_VERSION1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMA_TRANSFER_INFO_VERSION2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMA_TRANSFER_CONTEXT_VERSION1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMA_TRANSFER_CONTEXT_SIZE_V1 := 128

/**
 * @type {Integer (UInt32)}
 */
export global DMA_SYNCHRONOUS_CALLBACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMA_ZERO_BUFFERS := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMA_FAIL_ON_BOUNCE := 4

/**
 * @type {Integer (UInt32)}
 */
export global HAL_MASK_UNMASK_FLAGS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global HAL_MASK_UNMASK_FLAGS_SERVICING_DEFERRED := 1

/**
 * @type {Integer (UInt32)}
 */
export global HAL_MASK_UNMASK_FLAGS_SERVICING_COMPLETE := 2

/**
 * @type {Integer (UInt32)}
 */
export global HAL_DMA_ADAPTER_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DOMAIN_COMMON_BUFFER_LARGE_PAGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IOMMU_ACCESS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global IOMMU_ACCESS_READ := 1

/**
 * @type {Integer (UInt32)}
 */
export global IOMMU_ACCESS_WRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMA_IOMMU_INTERFACE_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMA_IOMMU_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMA_IOMMU_INTERFACE_EX_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMA_IOMMU_INTERFACE_EX_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMA_IOMMU_INTERFACE_EX_VERSION_MIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global DMA_IOMMU_INTERFACE_EX_VERSION_MAX := 2

/**
 * @type {Integer (UInt32)}
 */
export global DMA_IOMMU_INTERFACE_EX_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PO_MEM_PRESERVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PO_MEM_CLONE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PO_MEM_CL_OR_NCHK := 4

/**
 * @type {Integer (UInt32)}
 */
export global PO_MEM_DISCARD := 32768

/**
 * @type {Integer (UInt32)}
 */
export global PO_MEM_PAGE_ADDRESS := 16384

/**
 * @type {Integer (UInt32)}
 */
export global PO_MEM_BOOT_PHASE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PO_FX_VERSION_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global PO_FX_VERSION_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global PO_FX_VERSION_V3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global PO_FX_VERSION := 1

/**
 * @type {Integer (UInt64)}
 */
export global PO_FX_COMPONENT_FLAG_F0_ON_DX := 1

/**
 * @type {Integer (UInt64)}
 */
export global PO_FX_COMPONENT_FLAG_NO_DEBOUNCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PO_FX_DIRECTED_FX_DEFAULT_IDLE_TIMEOUT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PO_FX_UNKNOWN_POWER := 4294967295

/**
 * @type {Integer (UInt64)}
 */
export global PO_FX_UNKNOWN_TIME := 18446744073709551615

/**
 * @type {Integer (UInt32)}
 */
export global PO_FX_FLAG_BLOCKING := 1

/**
 * @type {Integer (UInt32)}
 */
export global PO_FX_FLAG_ASYNC_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global PO_FX_FLAG_PERF_PEP_OPTIONAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global PO_FX_FLAG_PERF_QUERY_ON_F0 := 2

/**
 * @type {Integer (UInt32)}
 */
export global PO_FX_FLAG_PERF_QUERY_ON_ALL_IDLE_STATES := 4

/**
 * @type {Integer (UInt32)}
 */
export global OB_FLT_REGISTRATION_VERSION_0100 := 256

/**
 * @type {Integer (UInt32)}
 */
export global OB_FLT_REGISTRATION_VERSION := 256

/**
 * @type {Integer (UInt32)}
 */
export global OB_OPERATION_HANDLE_CREATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global OB_OPERATION_HANDLE_DUPLICATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_TYPE0_ADDRESSES := 6

/**
 * @type {Integer (UInt32)}
 */
export global PCI_TYPE1_ADDRESSES := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_TYPE2_ADDRESSES := 5

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXTENDED_CONFIG_LENGTH := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PCI_MAX_DEVICES := 32

/**
 * @type {Integer (UInt32)}
 */
export global PCI_MAX_FUNCTION := 8

/**
 * @type {Integer (UInt32)}
 */
export global PCI_MAX_BRIDGE_NUMBER := 255

/**
 * @type {Integer (UInt32)}
 */
export global PCI_MAX_SEGMENT_NUMBER := 65535

/**
 * @type {Integer (UInt32)}
 */
export global PCI_INVALID_VENDORID := 65535

/**
 * @type {Integer (UInt32)}
 */
export global PCI_MULTIFUNCTION := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_DEVICE_TYPE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_BRIDGE_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CARDBUS_BRIDGE_TYPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ENABLE_IO_SPACE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ENABLE_MEMORY_SPACE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ENABLE_BUS_MASTER := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ENABLE_SPECIAL_CYCLES := 8

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ENABLE_WRITE_AND_INVALIDATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ENABLE_VGA_COMPATIBLE_PALETTE := 32

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ENABLE_PARITY := 64

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ENABLE_WAIT_CYCLE := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ENABLE_SERR := 256

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ENABLE_FAST_BACK_TO_BACK := 512

/**
 * @type {Integer (UInt32)}
 */
export global PCI_DISABLE_LEVEL_INTERRUPT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PCI_STATUS_IMMEDIATE_READINESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_STATUS_INTERRUPT_PENDING := 8

/**
 * @type {Integer (UInt32)}
 */
export global PCI_STATUS_CAPABILITIES_LIST := 16

/**
 * @type {Integer (UInt32)}
 */
export global PCI_STATUS_66MHZ_CAPABLE := 32

/**
 * @type {Integer (UInt32)}
 */
export global PCI_STATUS_UDF_SUPPORTED := 64

/**
 * @type {Integer (UInt32)}
 */
export global PCI_STATUS_FAST_BACK_TO_BACK := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_STATUS_DATA_PARITY_DETECTED := 256

/**
 * @type {Integer (UInt32)}
 */
export global PCI_STATUS_DEVSEL := 1536

/**
 * @type {Integer (UInt32)}
 */
export global PCI_STATUS_SIGNALED_TARGET_ABORT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PCI_STATUS_RECEIVED_TARGET_ABORT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PCI_STATUS_RECEIVED_MASTER_ABORT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PCI_STATUS_SIGNALED_SYSTEM_ERROR := 16384

/**
 * @type {Integer (UInt32)}
 */
export global PCI_STATUS_DETECTED_PARITY_ERROR := 32768

/**
 * @type {Integer (UInt32)}
 */
export global PCI_WHICHSPACE_CONFIG := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_WHICHSPACE_ROM := 1382638416

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_POWER_MANAGEMENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_AGP := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_VPD := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_SLOT_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_MSI := 5

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_CPCI_HOTSWAP := 6

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_PCIX := 7

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_HYPERTRANSPORT := 8

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_VENDOR_SPECIFIC := 9

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_DEBUG_PORT := 10

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_CPCI_RES_CTRL := 11

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_SHPC := 12

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_P2P_SSID := 13

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_AGP_TARGET := 14

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_SECURE := 15

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_PCI_EXPRESS := 16

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_MSIX := 17

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_SATA_CONFIG := 18

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_ADVANCED_FEATURES := 19

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CAPABILITY_ID_FPB := 21

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_ADVANCED_ERROR_REPORTING_CAP_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_VIRTUAL_CHANNEL_CAP_ID := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_DEVICE_SERIAL_NUMBER_CAP_ID := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_POWER_BUDGETING_CAP_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_RC_LINK_DECLARATION_CAP_ID := 5

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_RC_INTERNAL_LINK_CONTROL_CAP_ID := 6

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_RC_EVENT_COLLECTOR_ENDPOINT_ASSOCIATION_CAP_ID := 7

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_MFVC_CAP_ID := 8

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_VC_AND_MFVC_CAP_ID := 9

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_RCRB_HEADER_CAP_ID := 10

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_VENDOR_SPECIFIC_CAP_ID := 11

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_CONFIGURATION_ACCESS_CORRELATION_CAP_ID := 12

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_ACCESS_CONTROL_SERVICES_CAP_ID := 13

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_ARI_CAP_ID := 14

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_ATS_CAP_ID := 15

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_SINGLE_ROOT_IO_VIRTUALIZATION_CAP_ID := 16

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_MULTI_ROOT_IO_VIRTUALIZATION_CAP_ID := 17

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_MULTICAST_CAP_ID := 18

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_PAGE_REQUEST_CAP_ID := 19

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_RESERVED_FOR_AMD_CAP_ID := 20

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_RESIZABLE_BAR_CAP_ID := 21

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_DPA_CAP_ID := 22

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_TPH_REQUESTER_CAP_ID := 23

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_LTR_CAP_ID := 24

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_SECONDARY_PCI_EXPRESS_CAP_ID := 25

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_PMUX_CAP_ID := 26

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_PASID_CAP_ID := 27

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_LN_REQUESTER_CAP_ID := 28

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_DPC_CAP_ID := 29

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_L1_PM_SS_CAP_ID := 30

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_PTM_CAP_ID := 31

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_MPCIE_CAP_ID := 32

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_FRS_QUEUEING_CAP_ID := 33

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_READINESS_TIME_REPORTING_CAP_ID := 34

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_DESIGNATED_VENDOR_SPECIFIC_CAP_ID := 35

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_NPEM_CAP_ID := 41

/**
 * @type {Integer (UInt32)}
 */
export global ROOT_CMD_ENABLE_CORRECTABLE_ERROR_REPORTING := 1

/**
 * @type {Integer (UInt32)}
 */
export global ROOT_CMD_ENABLE_NONFATAL_ERROR_REPORTING := 2

/**
 * @type {Integer (UInt32)}
 */
export global ROOT_CMD_ENABLE_FATAL_ERROR_REPORTING := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ACS_ALLOWED := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ACS_BLOCKED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ACS_REDIRECTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_PRE_20 := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_MASS_STORAGE_CTLR := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_NETWORK_CTLR := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_DISPLAY_CTLR := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_MULTIMEDIA_DEV := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_MEMORY_CTLR := 5

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_BRIDGE_DEV := 6

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_SIMPLE_COMMS_CTLR := 7

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_BASE_SYSTEM_DEV := 8

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_INPUT_DEV := 9

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_DOCKING_STATION := 10

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_PROCESSOR := 11

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_SERIAL_BUS_CTLR := 12

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_WIRELESS_CTLR := 13

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_INTELLIGENT_IO_CTLR := 14

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_SATELLITE_COMMS_CTLR := 15

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_ENCRYPTION_DECRYPTION := 16

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_DATA_ACQ_SIGNAL_PROC := 17

/**
 * @type {Integer (UInt32)}
 */
export global PCI_CLASS_NOT_DEFINED := 255

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_PRE_20_NON_VGA := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_PRE_20_VGA := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MSC_SCSI_BUS_CTLR := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MSC_IDE_CTLR := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MSC_FLOPPY_CTLR := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MSC_IPI_CTLR := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MSC_RAID_CTLR := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MSC_AHCI_CTLR := 6

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MSC_NVM_CTLR := 8

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MSC_OTHER := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_PROGRAMMING_INTERFACE_MSC_NVM_EXPRESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_NET_ETHERNET_CTLR := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_NET_TOKEN_RING_CTLR := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_NET_FDDI_CTLR := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_NET_ATM_CTLR := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_NET_ISDN_CTLR := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_NET_OTHER := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_VID_VGA_CTLR := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_VID_XGA_CTLR := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBLCASS_VID_3D_CTLR := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_VID_OTHER := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MM_VIDEO_DEV := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MM_AUDIO_DEV := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MM_TELEPHONY_DEV := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MM_OTHER := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MEM_RAM := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MEM_FLASH := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_MEM_OTHER := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_BR_HOST := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_BR_ISA := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_BR_EISA := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_BR_MCA := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_BR_PCI_TO_PCI := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_BR_PCMCIA := 5

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_BR_NUBUS := 6

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_BR_CARDBUS := 7

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_BR_RACEWAY := 8

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_BR_OTHER := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_COM_SERIAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_COM_PARALLEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_COM_MULTIPORT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_COM_MODEM := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_COM_OTHER := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SYS_INTERRUPT_CTLR := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SYS_DMA_CTLR := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SYS_SYSTEM_TIMER := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SYS_REAL_TIME_CLOCK := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SYS_GEN_HOTPLUG_CTLR := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SYS_SDIO_CTRL := 5

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SYS_RCEC := 7

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SYS_OTHER := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_INP_KEYBOARD := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_INP_DIGITIZER := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_INP_MOUSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_INP_SCANNER := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_INP_GAMEPORT := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_INP_OTHER := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_DOC_GENERIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_DOC_OTHER := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_PROC_386 := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_PROC_486 := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_PROC_PENTIUM := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_PROC_ALPHA := 16

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_PROC_POWERPC := 32

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_PROC_COPROCESSOR := 64

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SB_IEEE1394 := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SB_ACCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SB_SSA := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SB_USB := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SB_FIBRE_CHANNEL := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SB_SMBUS := 5

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SB_THUNDERBOLT := 10

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_WIRELESS_IRDA := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_WIRELESS_CON_IR := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_WIRELESS_RF := 16

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_WIRELESS_OTHER := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_INTIO_I2O := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SAT_TV := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SAT_AUDIO := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SAT_VOICE := 3

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_SAT_DATA := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_CRYPTO_NET_COMP := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_CRYPTO_ENTERTAINMENT := 16

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_CRYPTO_OTHER := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_DASP_DPIO := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_SUBCLASS_DASP_OTHER := 128

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ADDRESS_IO_SPACE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ADDRESS_MEMORY_TYPE_MASK := 6

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ADDRESS_MEMORY_PREFETCHABLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ADDRESS_IO_ADDRESS_MASK := 4294967292

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ADDRESS_MEMORY_ADDRESS_MASK := 4294967280

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ADDRESS_ROM_ADDRESS_MASK := 4294965248

/**
 * @type {Integer (UInt32)}
 */
export global PCI_TYPE_32BIT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PCI_TYPE_20BIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_TYPE_64BIT := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_ROMADDRESS_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_DEVICE_PRESENT_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_USE_SUBSYSTEM_IDS := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_USE_REVISION := 2

/**
 * @type {Integer (UInt32)}
 */
export global PCI_USE_VENDEV_IDS := 4

/**
 * @type {Integer (UInt32)}
 */
export global PCI_USE_CLASS_SUBCLASS := 8

/**
 * @type {Integer (UInt32)}
 */
export global PCI_USE_PROGIF := 16

/**
 * @type {Integer (UInt32)}
 */
export global PCI_USE_LOCAL_BUS := 32

/**
 * @type {Integer (UInt32)}
 */
export global PCI_USE_LOCAL_DEVICE := 64

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_LINK_QUIESCENT_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_EXPRESS_ROOT_PORT_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCI_MSIX_TABLE_CONFIG_INTERFACE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PCW_VERSION_1 := 256

/**
 * @type {Integer (UInt32)}
 */
export global PCW_VERSION_2 := 512

/**
 * @type {Integer (UInt32)}
 */
export global PCW_CURRENT_VERSION := 512

/**
 * @type {Integer (UInt32)}
 */
export global SECURE_SECTION_ALLOW_PARTIAL_MDL := 1

/**
 * @type {Integer (UInt32)}
 */
export global POOL_ZEROING_INFORMATION := 227

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
