#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class BUGCHECK_ERROR{

    /**
     * @type {Integer (UInt32)}
     */
    static HARDWARE_PROFILE_UNDOCKED_STRING => 1073807361

    /**
     * @type {Integer (UInt32)}
     */
    static HARDWARE_PROFILE_DOCKED_STRING => 1073807362

    /**
     * @type {Integer (UInt32)}
     */
    static HARDWARE_PROFILE_UNKNOWN_STRING => 1073807363

    /**
     * @type {Integer (UInt32)}
     */
    static WINDOWS_NT_BANNER => 1073741950

    /**
     * @type {Integer (UInt32)}
     */
    static WINDOWS_NT_CSD_STRING => 1073741959

    /**
     * @type {Integer (UInt32)}
     */
    static WINDOWS_NT_INFO_STRING => 1073741960

    /**
     * @type {Integer (UInt32)}
     */
    static WINDOWS_NT_MP_STRING => 1073741961

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_TERMINATE_HELD_MUTEX => 1073741962

    /**
     * @type {Integer (UInt32)}
     */
    static WINDOWS_NT_INFO_STRING_PLURAL => 1073741981

    /**
     * @type {Integer (UInt32)}
     */
    static WINDOWS_NT_RC_STRING => 1073741982

    /**
     * @type {Integer (UInt32)}
     */
    static APC_INDEX_MISMATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_QUEUE_NOT_BUSY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_AFFINITY_SET => 3

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_DATA_ACCESS_TRAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_PROCESS_ATTACH_ATTEMPT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_PROCESS_DETACH_ATTEMPT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_SOFTWARE_INTERRUPT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IRQL_NOT_DISPATCH_LEVEL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IRQL_NOT_GREATER_OR_EQUAL => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IRQL_NOT_LESS_OR_EQUAL => 10

    /**
     * @type {Integer (UInt32)}
     */
    static NO_EXCEPTION_HANDLING_SUPPORT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_WAIT_OBJECTS_EXCEEDED => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MUTEX_LEVEL_NUMBER_VIOLATION => 13

    /**
     * @type {Integer (UInt32)}
     */
    static NO_USER_MODE_CONTEXT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SPIN_LOCK_ALREADY_OWNED => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SPIN_LOCK_NOT_OWNED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_NOT_MUTEX_OWNER => 17

    /**
     * @type {Integer (UInt32)}
     */
    static TRAP_CAUSE_UNKNOWN => 18

    /**
     * @type {Integer (UInt32)}
     */
    static EMPTY_THREAD_REAPER_LIST => 19

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_DELETE_LOCK_NOT_LOCKED => 20

    /**
     * @type {Integer (UInt32)}
     */
    static LAST_CHANCE_CALLED_FROM_KMODE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static CID_HANDLE_CREATION => 22

    /**
     * @type {Integer (UInt32)}
     */
    static CID_HANDLE_DELETION => 23

    /**
     * @type {Integer (UInt32)}
     */
    static REFERENCE_BY_POINTER => 24

    /**
     * @type {Integer (UInt32)}
     */
    static BAD_POOL_HEADER => 25

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_MANAGEMENT => 26

    /**
     * @type {Integer (UInt32)}
     */
    static PFN_SHARE_COUNT => 27

    /**
     * @type {Integer (UInt32)}
     */
    static PFN_REFERENCE_COUNT => 28

    /**
     * @type {Integer (UInt32)}
     */
    static NO_SPIN_LOCK_AVAILABLE => 29

    /**
     * @type {Integer (UInt32)}
     */
    static KMODE_EXCEPTION_NOT_HANDLED => 30

    /**
     * @type {Integer (UInt32)}
     */
    static SHARED_RESOURCE_CONV_ERROR => 31

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_APC_PENDING_DURING_EXIT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static QUOTA_UNDERFLOW => 33

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SYSTEM => 34

    /**
     * @type {Integer (UInt32)}
     */
    static FAT_FILE_SYSTEM => 35

    /**
     * @type {Integer (UInt32)}
     */
    static NTFS_FILE_SYSTEM => 36

    /**
     * @type {Integer (UInt32)}
     */
    static NPFS_FILE_SYSTEM => 37

    /**
     * @type {Integer (UInt32)}
     */
    static CDFS_FILE_SYSTEM => 38

    /**
     * @type {Integer (UInt32)}
     */
    static RDR_FILE_SYSTEM => 39

    /**
     * @type {Integer (UInt32)}
     */
    static CORRUPT_ACCESS_TOKEN => 40

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_SYSTEM => 41

    /**
     * @type {Integer (UInt32)}
     */
    static INCONSISTENT_IRP => 42

    /**
     * @type {Integer (UInt32)}
     */
    static PANIC_STACK_SWITCH => 43

    /**
     * @type {Integer (UInt32)}
     */
    static PORT_DRIVER_INTERNAL => 44

    /**
     * @type {Integer (UInt32)}
     */
    static SCSI_DISK_DRIVER_INTERNAL => 45

    /**
     * @type {Integer (UInt32)}
     */
    static DATA_BUS_ERROR => 46

    /**
     * @type {Integer (UInt32)}
     */
    static INSTRUCTION_BUS_ERROR => 47

    /**
     * @type {Integer (UInt32)}
     */
    static SET_OF_INVALID_CONTEXT => 48

    /**
     * @type {Integer (UInt32)}
     */
    static PHASE0_INITIALIZATION_FAILED => 49

    /**
     * @type {Integer (UInt32)}
     */
    static PHASE1_INITIALIZATION_FAILED => 50

    /**
     * @type {Integer (UInt32)}
     */
    static UNEXPECTED_INITIALIZATION_CALL => 51

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_MANAGER => 52

    /**
     * @type {Integer (UInt32)}
     */
    static NO_MORE_IRP_STACK_LOCATIONS => 53

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_REFERENCE_COUNT_NOT_ZERO => 54

    /**
     * @type {Integer (UInt32)}
     */
    static FLOPPY_INTERNAL_ERROR => 55

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_DRIVER_INTERNAL => 56

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_EXIT_OWNED_MUTEX => 57

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_UNWIND_PREVIOUS_USER => 58

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_SERVICE_EXCEPTION => 59

    /**
     * @type {Integer (UInt32)}
     */
    static INTERRUPT_UNWIND_ATTEMPTED => 60

    /**
     * @type {Integer (UInt32)}
     */
    static INTERRUPT_EXCEPTION_NOT_HANDLED => 61

    /**
     * @type {Integer (UInt32)}
     */
    static MULTIPROCESSOR_CONFIGURATION_NOT_SUPPORTED => 62

    /**
     * @type {Integer (UInt32)}
     */
    static NO_MORE_SYSTEM_PTES => 63

    /**
     * @type {Integer (UInt32)}
     */
    static TARGET_MDL_TOO_SMALL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MUST_SUCCEED_POOL_EMPTY => 65

    /**
     * @type {Integer (UInt32)}
     */
    static ATDISK_DRIVER_INTERNAL => 66

    /**
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_PARTITION => 67

    /**
     * @type {Integer (UInt32)}
     */
    static MULTIPLE_IRP_COMPLETE_REQUESTS => 68

    /**
     * @type {Integer (UInt32)}
     */
    static INSUFFICIENT_SYSTEM_MAP_REGS => 69

    /**
     * @type {Integer (UInt32)}
     */
    static DEREF_UNKNOWN_LOGON_SESSION => 70

    /**
     * @type {Integer (UInt32)}
     */
    static REF_UNKNOWN_LOGON_SESSION => 71

    /**
     * @type {Integer (UInt32)}
     */
    static CANCEL_STATE_IN_COMPLETED_IRP => 72

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_FAULT_WITH_INTERRUPTS_OFF => 73

    /**
     * @type {Integer (UInt32)}
     */
    static IRQL_GT_ZERO_AT_SYSTEM_SERVICE => 74

    /**
     * @type {Integer (UInt32)}
     */
    static STREAMS_INTERNAL_ERROR => 75

    /**
     * @type {Integer (UInt32)}
     */
    static FATAL_UNHANDLED_HARD_ERROR => 76

    /**
     * @type {Integer (UInt32)}
     */
    static NO_PAGES_AVAILABLE => 77

    /**
     * @type {Integer (UInt32)}
     */
    static PFN_LIST_CORRUPT => 78

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_INTERNAL_ERROR => 79

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_FAULT_IN_NONPAGED_AREA => 80

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_FAULT_IN_NONPAGED_AREA_M => 268435536

    /**
     * @type {Integer (UInt32)}
     */
    static REGISTRY_ERROR => 81

    /**
     * @type {Integer (UInt32)}
     */
    static MAILSLOT_FILE_SYSTEM => 82

    /**
     * @type {Integer (UInt32)}
     */
    static NO_BOOT_DEVICE => 83

    /**
     * @type {Integer (UInt32)}
     */
    static LM_SERVER_INTERNAL_ERROR => 84

    /**
     * @type {Integer (UInt32)}
     */
    static DATA_COHERENCY_EXCEPTION => 85

    /**
     * @type {Integer (UInt32)}
     */
    static INSTRUCTION_COHERENCY_EXCEPTION => 86

    /**
     * @type {Integer (UInt32)}
     */
    static XNS_INTERNAL_ERROR => 87

    /**
     * @type {Integer (UInt32)}
     */
    static VOLMGRX_INTERNAL_ERROR => 88

    /**
     * @type {Integer (UInt32)}
     */
    static PINBALL_FILE_SYSTEM => 89

    /**
     * @type {Integer (UInt32)}
     */
    static CRITICAL_SERVICE_FAILED => 90

    /**
     * @type {Integer (UInt32)}
     */
    static SET_ENV_VAR_FAILED => 91

    /**
     * @type {Integer (UInt32)}
     */
    static HAL_INITIALIZATION_FAILED => 92

    /**
     * @type {Integer (UInt32)}
     */
    static UNSUPPORTED_PROCESSOR => 93

    /**
     * @type {Integer (UInt32)}
     */
    static OBJECT_INITIALIZATION_FAILED => 94

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_INITIALIZATION_FAILED => 95

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_INITIALIZATION_FAILED => 96

    /**
     * @type {Integer (UInt32)}
     */
    static HAL1_INITIALIZATION_FAILED => 97

    /**
     * @type {Integer (UInt32)}
     */
    static OBJECT1_INITIALIZATION_FAILED => 98

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY1_INITIALIZATION_FAILED => 99

    /**
     * @type {Integer (UInt32)}
     */
    static SYMBOLIC_INITIALIZATION_FAILED => 100

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY1_INITIALIZATION_FAILED => 101

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_INITIALIZATION_FAILED => 102

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIG_INITIALIZATION_FAILED => 103

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_INITIALIZATION_FAILED => 104

    /**
     * @type {Integer (UInt32)}
     */
    static IO1_INITIALIZATION_FAILED => 105

    /**
     * @type {Integer (UInt32)}
     */
    static LPC_INITIALIZATION_FAILED => 106

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS1_INITIALIZATION_FAILED => 107

    /**
     * @type {Integer (UInt32)}
     */
    static REFMON_INITIALIZATION_FAILED => 108

    /**
     * @type {Integer (UInt32)}
     */
    static SESSION1_INITIALIZATION_FAILED => 109

    /**
     * @type {Integer (UInt32)}
     */
    static BOOTPROC_INITIALIZATION_FAILED => 110

    /**
     * @type {Integer (UInt32)}
     */
    static VSL_INITIALIZATION_FAILED => 111

    /**
     * @type {Integer (UInt32)}
     */
    static SOFT_RESTART_FATAL_ERROR => 112

    /**
     * @type {Integer (UInt32)}
     */
    static ASSIGN_DRIVE_LETTERS_FAILED => 114

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIG_LIST_FAILED => 115

    /**
     * @type {Integer (UInt32)}
     */
    static BAD_SYSTEM_CONFIG_INFO => 116

    /**
     * @type {Integer (UInt32)}
     */
    static CANNOT_WRITE_CONFIGURATION => 117

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_HAS_LOCKED_PAGES => 118

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_STACK_INPAGE_ERROR => 119

    /**
     * @type {Integer (UInt32)}
     */
    static PHASE0_EXCEPTION => 120

    /**
     * @type {Integer (UInt32)}
     */
    static MISMATCHED_HAL => 121

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_DATA_INPAGE_ERROR => 122

    /**
     * @type {Integer (UInt32)}
     */
    static INACCESSIBLE_BOOT_DEVICE => 123

    /**
     * @type {Integer (UInt32)}
     */
    static BUGCODE_NDIS_DRIVER => 124

    /**
     * @type {Integer (UInt32)}
     */
    static INSTALL_MORE_MEMORY => 125

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_THREAD_EXCEPTION_NOT_HANDLED => 126

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_THREAD_EXCEPTION_NOT_HANDLED_M => 268435582

    /**
     * @type {Integer (UInt32)}
     */
    static UNEXPECTED_KERNEL_MODE_TRAP => 127

    /**
     * @type {Integer (UInt32)}
     */
    static UNEXPECTED_KERNEL_MODE_TRAP_M => 268435583

    /**
     * @type {Integer (UInt32)}
     */
    static NMI_HARDWARE_FAILURE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SPIN_LOCK_INIT_FAILURE => 129

    /**
     * @type {Integer (UInt32)}
     */
    static DFS_FILE_SYSTEM => 130

    /**
     * @type {Integer (UInt32)}
     */
    static OFS_FILE_SYSTEM => 131

    /**
     * @type {Integer (UInt32)}
     */
    static RECOM_DRIVER => 132

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_FAILURE => 133

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIT_FAILURE => 134

    /**
     * @type {Integer (UInt32)}
     */
    static MBR_CHECKSUM_MISMATCH => 139

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_MODE_EXCEPTION_NOT_HANDLED => 142

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_MODE_EXCEPTION_NOT_HANDLED_M => 268435598

    /**
     * @type {Integer (UInt32)}
     */
    static PP0_INITIALIZATION_FAILED => 143

    /**
     * @type {Integer (UInt32)}
     */
    static PP1_INITIALIZATION_FAILED => 144

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32K_INIT_OR_RIT_FAILURE => 145

    /**
     * @type {Integer (UInt32)}
     */
    static UP_DRIVER_ON_MP_SYSTEM => 146

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_KERNEL_HANDLE => 147

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_STACK_LOCKED_AT_EXIT => 148

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_INTERNAL_ERROR => 149

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_WORK_QUEUE_ITEM => 150

    /**
     * @type {Integer (UInt32)}
     */
    static BOUND_IMAGE_UNSUPPORTED => 151

    /**
     * @type {Integer (UInt32)}
     */
    static END_OF_NT_EVALUATION_PERIOD => 152

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_REGION_OR_SEGMENT => 153

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_LICENSE_VIOLATION => 154

    /**
     * @type {Integer (UInt32)}
     */
    static UDFS_FILE_SYSTEM => 155

    /**
     * @type {Integer (UInt32)}
     */
    static MACHINE_CHECK_EXCEPTION => 156

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MODE_HEALTH_MONITOR => 158

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_POWER_STATE_FAILURE => 159

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNAL_POWER_ERROR => 160

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_BUS_DRIVER_INTERNAL => 161

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_IMAGE_CORRUPT => 162

    /**
     * @type {Integer (UInt32)}
     */
    static ACPI_DRIVER_INTERNAL => 163

    /**
     * @type {Integer (UInt32)}
     */
    static CNSS_FILE_SYSTEM_FILTER => 164

    /**
     * @type {Integer (UInt32)}
     */
    static ACPI_BIOS_ERROR => 165

    /**
     * @type {Integer (UInt32)}
     */
    static FP_EMULATION_ERROR => 166

    /**
     * @type {Integer (UInt32)}
     */
    static BAD_EXHANDLE => 167

    /**
     * @type {Integer (UInt32)}
     */
    static BOOTING_IN_SAFEMODE_MINIMAL => 168

    /**
     * @type {Integer (UInt32)}
     */
    static BOOTING_IN_SAFEMODE_NETWORK => 169

    /**
     * @type {Integer (UInt32)}
     */
    static BOOTING_IN_SAFEMODE_DSREPAIR => 170

    /**
     * @type {Integer (UInt32)}
     */
    static SESSION_HAS_VALID_POOL_ON_EXIT => 171

    /**
     * @type {Integer (UInt32)}
     */
    static HAL_MEMORY_ALLOCATION => 172

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_DRIVER_DEBUG_REPORT_REQUEST => 1073741997

    /**
     * @type {Integer (UInt32)}
     */
    static BGI_DETECTED_VIOLATION => 177

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_DRIVER_INIT_FAILURE => 180

    /**
     * @type {Integer (UInt32)}
     */
    static BOOTLOG_LOADED => 181

    /**
     * @type {Integer (UInt32)}
     */
    static BOOTLOG_NOT_LOADED => 182

    /**
     * @type {Integer (UInt32)}
     */
    static BOOTLOG_ENABLED => 183

    /**
     * @type {Integer (UInt32)}
     */
    static ATTEMPTED_SWITCH_FROM_DPC => 184

    /**
     * @type {Integer (UInt32)}
     */
    static CHIPSET_DETECTED_ERROR => 185

    /**
     * @type {Integer (UInt32)}
     */
    static SESSION_HAS_VALID_VIEWS_ON_EXIT => 186

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORK_BOOT_INITIALIZATION_FAILED => 187

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORK_BOOT_DUPLICATE_ADDRESS => 188

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_HIBERNATED_STATE => 189

    /**
     * @type {Integer (UInt32)}
     */
    static ATTEMPTED_WRITE_TO_READONLY_MEMORY => 190

    /**
     * @type {Integer (UInt32)}
     */
    static MUTEX_ALREADY_OWNED => 191

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_CONFIG_SPACE_ACCESS_FAILURE => 192

    /**
     * @type {Integer (UInt32)}
     */
    static SPECIAL_POOL_DETECTED_MEMORY_CORRUPTION => 193

    /**
     * @type {Integer (UInt32)}
     */
    static BAD_POOL_CALLER => 194

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_IMAGE_BAD_SIGNATURE => 195

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_VERIFIER_DETECTED_VIOLATION => 196

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_CORRUPTED_EXPOOL => 197

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_CAUGHT_MODIFYING_FREED_POOL => 198

    /**
     * @type {Integer (UInt32)}
     */
    static TIMER_OR_DPC_INVALID => 199

    /**
     * @type {Integer (UInt32)}
     */
    static IRQL_UNEXPECTED_VALUE => 200

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_VERIFIER_IOMANAGER_VIOLATION => 201

    /**
     * @type {Integer (UInt32)}
     */
    static PNP_DETECTED_FATAL_ERROR => 202

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_LEFT_LOCKED_PAGES_IN_PROCESS => 203

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_FAULT_IN_FREED_SPECIAL_POOL => 204

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_FAULT_BEYOND_END_OF_ALLOCATION => 205

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_UNLOADED_WITHOUT_CANCELLING_PENDING_OPERATIONS => 206

    /**
     * @type {Integer (UInt32)}
     */
    static TERMINAL_SERVER_DRIVER_MADE_INCORRECT_MEMORY_REFERENCE => 207

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_CORRUPTED_MMPOOL => 208

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_IRQL_NOT_LESS_OR_EQUAL => 209

    /**
     * @type {Integer (UInt32)}
     */
    static BUGCODE_ID_DRIVER => 210

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_PORTION_MUST_BE_NONPAGED => 211

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_SCAN_AT_RAISED_IRQL_CAUGHT_IMPROPER_DRIVER_UNLOAD => 212

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_PAGE_FAULT_IN_FREED_SPECIAL_POOL => 213

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_PAGE_FAULT_BEYOND_END_OF_ALLOCATION => 214

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_PAGE_FAULT_BEYOND_END_OF_ALLOCATION_M => 268435670

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_UNMAPPING_INVALID_VIEW => 215

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_USED_EXCESSIVE_PTES => 216

    /**
     * @type {Integer (UInt32)}
     */
    static LOCKED_PAGES_TRACKER_CORRUPTION => 217

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_PTE_MISUSE => 218

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_CORRUPTED_SYSPTES => 219

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_INVALID_STACK_ACCESS => 220

    /**
     * @type {Integer (UInt32)}
     */
    static POOL_CORRUPTION_IN_FILE_AREA => 222

    /**
     * @type {Integer (UInt32)}
     */
    static IMPERSONATING_WORKER_THREAD => 223

    /**
     * @type {Integer (UInt32)}
     */
    static ACPI_BIOS_FATAL_ERROR => 224

    /**
     * @type {Integer (UInt32)}
     */
    static WORKER_THREAD_RETURNED_AT_BAD_IRQL => 225

    /**
     * @type {Integer (UInt32)}
     */
    static MANUALLY_INITIATED_CRASH => 226

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_NOT_OWNED => 227

    /**
     * @type {Integer (UInt32)}
     */
    static WORKER_INVALID => 228

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_FAILURE_SIMULATE => 229

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_VERIFIER_DMA_VIOLATION => 230

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_FLOATING_POINT_STATE => 231

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_CANCEL_OF_FILE_OPEN => 232

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVE_EX_WORKER_THREAD_TERMINATION => 233

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_UNSPECIFIED => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_BLANKSCREEN => 61442

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_INPUT => 61443

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_WATCHDOG => 61444

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_STARTNOTVISIBLE => 61445

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_NAVIGATIONMODEL => 61446

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_OUTOFMEMORY => 61447

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_GRAPHICS => 61448

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_NAVSERVERTIMEOUT => 61449

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_CHROMEPROCESSCRASH => 61450

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_NOTIFICATIONDISMISSAL => 61451

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_SPEECHDISMISSAL => 61452

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_CALLDISMISSAL => 61453

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_APPBARDISMISSAL => 61454

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_RILADAPTATIONCRASH => 61455

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_APPLISTUNREACHABLE => 61456

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_REPORTNOTIFICATIONFAILURE => 61457

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_UNEXPECTEDSHUTDOWN => 61458

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_RPCFAILURE => 61459

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_AUXILIARYFULLDUMP => 61460

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_ACCOUNTPROVSVCINITFAILURE => 61461

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_MTBFCOMMANDTIMEOUT => 789

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_MTBFCOMMANDHANG => 61697

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_MTBFPASSBUGCHECK => 61698

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_MTBFIOERROR => 61699

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_RENDERTHREADHANG => 61952

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_RENDERMOBILEUIOOM => 61953

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_DEVICEUPDATEUNSPECIFIED => 62208

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_AUDIODRIVERHANG => 62464

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_BATTERYPULLOUT => 62720

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_MEDIACORETESTHANG => 62976

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_RESOURCEMANAGEMENT => 63232

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_CAPTURESERVICE => 63488

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_WAITFORSHELLREADY => 63744

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_NONRESPONSIVEPROCESS => 404

    /**
     * @type {Integer (UInt32)}
     */
    static SAVER_SICKAPPLICATION => 34918

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_STUCK_IN_DEVICE_DRIVER => 234

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_STUCK_IN_DEVICE_DRIVER_M => 268435690

    /**
     * @type {Integer (UInt32)}
     */
    static DIRTY_MAPPED_PAGES_CONGESTION => 235

    /**
     * @type {Integer (UInt32)}
     */
    static SESSION_HAS_VALID_SPECIAL_POOL_ON_EXIT => 236

    /**
     * @type {Integer (UInt32)}
     */
    static UNMOUNTABLE_BOOT_VOLUME => 237

    /**
     * @type {Integer (UInt32)}
     */
    static CRITICAL_PROCESS_DIED => 239

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_MINIPORT_ERROR => 240

    /**
     * @type {Integer (UInt32)}
     */
    static SCSI_VERIFIER_DETECTED_VIOLATION => 241

    /**
     * @type {Integer (UInt32)}
     */
    static HARDWARE_INTERRUPT_STORM => 242

    /**
     * @type {Integer (UInt32)}
     */
    static DISORDERLY_SHUTDOWN => 243

    /**
     * @type {Integer (UInt32)}
     */
    static CRITICAL_OBJECT_TERMINATION => 244

    /**
     * @type {Integer (UInt32)}
     */
    static FLTMGR_FILE_SYSTEM => 245

    /**
     * @type {Integer (UInt32)}
     */
    static PCI_VERIFIER_DETECTED_VIOLATION => 246

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_OVERRAN_STACK_BUFFER => 247

    /**
     * @type {Integer (UInt32)}
     */
    static RAMDISK_BOOT_INITIALIZATION_FAILED => 248

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_RETURNED_STATUS_REPARSE_FOR_VOLUME_OPEN => 249

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_DRIVER_CORRUPTED => 250

    /**
     * @type {Integer (UInt32)}
     */
    static RECURSIVE_MACHINE_CHECK => 251

    /**
     * @type {Integer (UInt32)}
     */
    static ATTEMPTED_EXECUTE_OF_NOEXECUTE_MEMORY => 252

    /**
     * @type {Integer (UInt32)}
     */
    static DIRTY_NOWRITE_PAGES_CONGESTION => 253

    /**
     * @type {Integer (UInt32)}
     */
    static BUGCODE_USB_DRIVER => 254

    /**
     * @type {Integer (UInt32)}
     */
    static BC_BLUETOOTH_VERIFIER_FAULT => 3070

    /**
     * @type {Integer (UInt32)}
     */
    static BC_BTHMINI_VERIFIER_FAULT => 3071

    /**
     * @type {Integer (UInt32)}
     */
    static RESERVE_QUEUE_OVERFLOW => 255

    /**
     * @type {Integer (UInt32)}
     */
    static LOADER_BLOCK_MISMATCH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CLOCK_WATCHDOG_TIMEOUT => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DPC_WATCHDOG_TIMEOUT => 258

    /**
     * @type {Integer (UInt32)}
     */
    static MUP_FILE_SYSTEM => 259

    /**
     * @type {Integer (UInt32)}
     */
    static AGP_INVALID_ACCESS => 260

    /**
     * @type {Integer (UInt32)}
     */
    static AGP_GART_CORRUPTION => 261

    /**
     * @type {Integer (UInt32)}
     */
    static AGP_ILLEGALLY_REPROGRAMMED => 262

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_EXPAND_STACK_ACTIVE => 263

    /**
     * @type {Integer (UInt32)}
     */
    static THIRD_PARTY_FILE_SYSTEM_FAILURE => 264

    /**
     * @type {Integer (UInt32)}
     */
    static CRITICAL_STRUCTURE_CORRUPTION => 265

    /**
     * @type {Integer (UInt32)}
     */
    static APP_TAGGING_INITIALIZATION_FAILED => 266

    /**
     * @type {Integer (UInt32)}
     */
    static DFSC_FILE_SYSTEM => 267

    /**
     * @type {Integer (UInt32)}
     */
    static FSRTL_EXTRA_CREATE_PARAMETER_VIOLATION => 268

    /**
     * @type {Integer (UInt32)}
     */
    static WDF_VIOLATION => 269

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_MEMORY_MANAGEMENT_INTERNAL => 270

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_INVALID_CRUNTIME_PARAMETER => 272

    /**
     * @type {Integer (UInt32)}
     */
    static RECURSIVE_NMI => 273

    /**
     * @type {Integer (UInt32)}
     */
    static MSRPC_STATE_VIOLATION => 274

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_DXGKRNL_FATAL_ERROR => 275

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_SHADOW_DRIVER_FATAL_ERROR => 276

    /**
     * @type {Integer (UInt32)}
     */
    static AGP_INTERNAL => 277

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_TDR_FAILURE => 278

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_TDR_TIMEOUT_DETECTED => 279

    /**
     * @type {Integer (UInt32)}
     */
    static NTHV_GUEST_ERROR => 280

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_SCHEDULER_INTERNAL_ERROR => 281

    /**
     * @type {Integer (UInt32)}
     */
    static EM_INITIALIZATION_ERROR => 282

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_RETURNED_HOLDING_CANCEL_LOCK => 283

    /**
     * @type {Integer (UInt32)}
     */
    static ATTEMPTED_WRITE_TO_CM_PROTECTED_STORAGE => 284

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACING_FATAL_ERROR => 285

    /**
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_RECURSIVE_FAULTS => 286

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_DRIVER_HANDLE => 287

    /**
     * @type {Integer (UInt32)}
     */
    static BITLOCKER_FATAL_ERROR => 288

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_VIOLATION => 289

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_INTERNAL_ERROR => 290

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTO_SELF_TEST_FAILURE => 291

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_UNCORRECTABLE_ERROR => 292

    /**
     * @type {Integer (UInt32)}
     */
    static NMR_INVALID_STATE => 293

    /**
     * @type {Integer (UInt32)}
     */
    static NETIO_INVALID_POOL_CALLER => 294

    /**
     * @type {Integer (UInt32)}
     */
    static PAGE_NOT_ZERO => 295

    /**
     * @type {Integer (UInt32)}
     */
    static WORKER_THREAD_RETURNED_WITH_BAD_IO_PRIORITY => 296

    /**
     * @type {Integer (UInt32)}
     */
    static WORKER_THREAD_RETURNED_WITH_BAD_PAGING_IO_PRIORITY => 297

    /**
     * @type {Integer (UInt32)}
     */
    static MUI_NO_VALID_SYSTEM_LANGUAGE => 298

    /**
     * @type {Integer (UInt32)}
     */
    static FAULTY_HARDWARE_CORRUPTED_PAGE => 299

    /**
     * @type {Integer (UInt32)}
     */
    static EXFAT_FILE_SYSTEM => 300

    /**
     * @type {Integer (UInt32)}
     */
    static VOLSNAP_OVERLAPPED_TABLE_ACCESS => 301

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_MDL_RANGE => 302

    /**
     * @type {Integer (UInt32)}
     */
    static VHD_BOOT_INITIALIZATION_FAILED => 303

    /**
     * @type {Integer (UInt32)}
     */
    static DYNAMIC_ADD_PROCESSOR_MISMATCH => 304

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_EXTENDED_PROCESSOR_STATE => 305

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_OWNER_POINTER_INVALID => 306

    /**
     * @type {Integer (UInt32)}
     */
    static DPC_WATCHDOG_VIOLATION => 307

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVE_EXTENDER => 308

    /**
     * @type {Integer (UInt32)}
     */
    static REGISTRY_FILTER_DRIVER_EXCEPTION => 309

    /**
     * @type {Integer (UInt32)}
     */
    static VHD_BOOT_HOST_VOLUME_NOT_ENOUGH_SPACE => 310

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32K_HANDLE_MANAGER => 311

    /**
     * @type {Integer (UInt32)}
     */
    static GPIO_CONTROLLER_DRIVER_ERROR => 312

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_SECURITY_CHECK_FAILURE => 313

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_MODE_HEAP_CORRUPTION => 314

    /**
     * @type {Integer (UInt32)}
     */
    static PASSIVE_INTERRUPT_ERROR => 315

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_IO_BOOST_STATE => 316

    /**
     * @type {Integer (UInt32)}
     */
    static CRITICAL_INITIALIZATION_FAILURE => 317

    /**
     * @type {Integer (UInt32)}
     */
    static ERRATA_WORKAROUND_UNSUCCESSFUL => 318

    /**
     * @type {Integer (UInt32)}
     */
    static REGISTRY_CALLBACK_DRIVER_EXCEPTION => 319

    /**
     * @type {Integer (UInt32)}
     */
    static STORAGE_DEVICE_ABNORMALITY_DETECTED => 320

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_ENGINE_TIMEOUT_DETECTED => 321

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_TDR_APPLICATION_BLOCKED => 322

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_DRIVER_INTERNAL => 323

    /**
     * @type {Integer (UInt32)}
     */
    static BUGCODE_USB3_DRIVER => 324

    /**
     * @type {Integer (UInt32)}
     */
    static SECURE_BOOT_VIOLATION => 325

    /**
     * @type {Integer (UInt32)}
     */
    static NDIS_NET_BUFFER_LIST_INFO_ILLEGALLY_TRANSFERRED => 326

    /**
     * @type {Integer (UInt32)}
     */
    static ABNORMAL_RESET_DETECTED => 327

    /**
     * @type {Integer (UInt32)}
     */
    static IO_OBJECT_INVALID => 328

    /**
     * @type {Integer (UInt32)}
     */
    static REFS_FILE_SYSTEM => 329

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_WMI_INTERNAL => 330

    /**
     * @type {Integer (UInt32)}
     */
    static SOC_SUBSYSTEM_FAILURE => 331

    /**
     * @type {Integer (UInt32)}
     */
    static FATAL_ABNORMAL_RESET_ERROR => 332

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_SCOPE_INVALID => 333

    /**
     * @type {Integer (UInt32)}
     */
    static SOC_CRITICAL_DEVICE_REMOVED => 334

    /**
     * @type {Integer (UInt32)}
     */
    static PDC_WATCHDOG_TIMEOUT => 335

    /**
     * @type {Integer (UInt32)}
     */
    static TCPIP_AOAC_NIC_ACTIVE_REFERENCE_LEAK => 336

    /**
     * @type {Integer (UInt32)}
     */
    static UNSUPPORTED_INSTRUCTION_MODE => 337

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_PUSH_LOCK_FLAGS => 338

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_LOCK_ENTRY_LEAKED_ON_THREAD_TERMINATION => 339

    /**
     * @type {Integer (UInt32)}
     */
    static UNEXPECTED_STORE_EXCEPTION => 340

    /**
     * @type {Integer (UInt32)}
     */
    static OS_DATA_TAMPERING => 341

    /**
     * @type {Integer (UInt32)}
     */
    static WINSOCK_DETECTED_HUNG_CLOSESOCKET_LIVEDUMP => 342

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_THREAD_PRIORITY_FLOOR_VIOLATION => 343

    /**
     * @type {Integer (UInt32)}
     */
    static ILLEGAL_IOMMU_PAGE_FAULT => 344

    /**
     * @type {Integer (UInt32)}
     */
    static HAL_ILLEGAL_IOMMU_PAGE_FAULT => 345

    /**
     * @type {Integer (UInt32)}
     */
    static SDBUS_INTERNAL_ERROR => 346

    /**
     * @type {Integer (UInt32)}
     */
    static WORKER_THREAD_RETURNED_WITH_SYSTEM_PAGE_PRIORITY_ACTIVE => 347

    /**
     * @type {Integer (UInt32)}
     */
    static PDC_WATCHDOG_TIMEOUT_LIVEDUMP => 348

    /**
     * @type {Integer (UInt32)}
     */
    static SOC_SUBSYSTEM_FAILURE_LIVEDUMP => 349

    /**
     * @type {Integer (UInt32)}
     */
    static BUGCODE_NDIS_DRIVER_LIVE_DUMP => 350

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECTED_STANDBY_WATCHDOG_TIMEOUT_LIVEDUMP => 351

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32K_ATOMIC_CHECK_FAILURE => 352

    /**
     * @type {Integer (UInt32)}
     */
    static LIVE_SYSTEM_DUMP => 353

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_AUTO_BOOST_INVALID_LOCK_RELEASE => 354

    /**
     * @type {Integer (UInt32)}
     */
    static WORKER_THREAD_TEST_CONDITION => 355

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32K_CRITICAL_FAILURE => 356

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CSV_STATUS_IO_TIMEOUT_LIVEDUMP => 357

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_CALL_TIMEOUT_LIVEDUMP => 358

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CSV_SNAPSHOT_DEVICE_INFO_TIMEOUT_LIVEDUMP => 359

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CSV_STATE_TRANSITION_TIMEOUT_LIVEDUMP => 360

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CSV_VOLUME_ARRIVAL_LIVEDUMP => 361

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CSV_VOLUME_REMOVAL_LIVEDUMP => 362

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CSV_CLUSTER_WATCHDOG_LIVEDUMP => 363

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_RUNDOWN_PROTECTION_FLAGS => 364

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_SLOT_ALLOCATOR_FLAGS => 365

    /**
     * @type {Integer (UInt32)}
     */
    static ERESOURCE_INVALID_RELEASE => 366

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CSV_STATE_TRANSITION_INTERVAL_TIMEOUT_LIVEDUMP => 367

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CSV_CLUSSVC_DISCONNECT_WATCHDOG => 368

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTO_LIBRARY_INTERNAL_ERROR => 369

    /**
     * @type {Integer (UInt32)}
     */
    static COREMSGCALL_INTERNAL_ERROR => 371

    /**
     * @type {Integer (UInt32)}
     */
    static COREMSG_INTERNAL_ERROR => 372

    /**
     * @type {Integer (UInt32)}
     */
    static PREVIOUS_FATAL_ABNORMAL_RESET_ERROR => 373

    /**
     * @type {Integer (UInt32)}
     */
    static ELAM_DRIVER_DETECTED_FATAL_ERROR => 376

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CLUSPORT_STATUS_IO_TIMEOUT_LIVEDUMP => 377

    /**
     * @type {Integer (UInt32)}
     */
    static PROFILER_CONFIGURATION_ILLEGAL => 379

    /**
     * @type {Integer (UInt32)}
     */
    static PDC_LOCK_WATCHDOG_LIVEDUMP => 380

    /**
     * @type {Integer (UInt32)}
     */
    static PDC_UNEXPECTED_REVOCATION_LIVEDUMP => 381

    /**
     * @type {Integer (UInt32)}
     */
    static MICROCODE_REVISION_MISMATCH => 382

    /**
     * @type {Integer (UInt32)}
     */
    static HYPERGUARD_INITIALIZATION_FAILURE => 383

    /**
     * @type {Integer (UInt32)}
     */
    static WVR_LIVEDUMP_REPLICATION_IOCONTEXT_TIMEOUT => 384

    /**
     * @type {Integer (UInt32)}
     */
    static WVR_LIVEDUMP_STATE_TRANSITION_TIMEOUT => 385

    /**
     * @type {Integer (UInt32)}
     */
    static WVR_LIVEDUMP_RECOVERY_IOCONTEXT_TIMEOUT => 386

    /**
     * @type {Integer (UInt32)}
     */
    static WVR_LIVEDUMP_APP_IO_TIMEOUT => 387

    /**
     * @type {Integer (UInt32)}
     */
    static WVR_LIVEDUMP_MANUALLY_INITIATED => 388

    /**
     * @type {Integer (UInt32)}
     */
    static WVR_LIVEDUMP_STATE_FAILURE => 389

    /**
     * @type {Integer (UInt32)}
     */
    static WVR_LIVEDUMP_CRITICAL_ERROR => 390

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_DWMINIT_TIMEOUT_FALLBACK_BDD => 391

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CSVFS_LIVEDUMP => 392

    /**
     * @type {Integer (UInt32)}
     */
    static BAD_OBJECT_HEADER => 393

    /**
     * @type {Integer (UInt32)}
     */
    static SILO_CORRUPT => 394

    /**
     * @type {Integer (UInt32)}
     */
    static SECURE_KERNEL_ERROR => 395

    /**
     * @type {Integer (UInt32)}
     */
    static HYPERGUARD_VIOLATION => 396

    /**
     * @type {Integer (UInt32)}
     */
    static SECURE_FAULT_UNHANDLED => 397

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_PARTITION_REFERENCE_VIOLATION => 398

    /**
     * @type {Integer (UInt32)}
     */
    static SYNTHETIC_EXCEPTION_UNHANDLED => 399

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32K_CRITICAL_FAILURE_LIVEDUMP => 400

    /**
     * @type {Integer (UInt32)}
     */
    static PF_DETECTED_CORRUPTION => 401

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_AUTO_BOOST_LOCK_ACQUISITION_WITH_RAISED_IRQL => 402

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_DXGKRNL_LIVEDUMP => 403

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_STORAGE_SLOT_IN_USE => 409

    /**
     * @type {Integer (UInt32)}
     */
    static SMB_SERVER_LIVEDUMP => 405

    /**
     * @type {Integer (UInt32)}
     */
    static LOADER_ROLLBACK_DETECTED => 406

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32K_SECURITY_FAILURE => 407

    /**
     * @type {Integer (UInt32)}
     */
    static UFX_LIVEDUMP => 408

    /**
     * @type {Integer (UInt32)}
     */
    static WORKER_THREAD_RETURNED_WHILE_ATTACHED_TO_SILO => 410

    /**
     * @type {Integer (UInt32)}
     */
    static TTM_FATAL_ERROR => 411

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32K_POWER_WATCHDOG_TIMEOUT => 412

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_SVHDX_LIVEDUMP => 413

    /**
     * @type {Integer (UInt32)}
     */
    static BUGCODE_NETADAPTER_DRIVER => 414

    /**
     * @type {Integer (UInt32)}
     */
    static PDC_PRIVILEGE_CHECK_LIVEDUMP => 415

    /**
     * @type {Integer (UInt32)}
     */
    static TTM_WATCHDOG_TIMEOUT => 416

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32K_CALLOUT_WATCHDOG_LIVEDUMP => 417

    /**
     * @type {Integer (UInt32)}
     */
    static WIN32K_CALLOUT_WATCHDOG_BUGCHECK => 418

    /**
     * @type {Integer (UInt32)}
     */
    static CALL_HAS_NOT_RETURNED_WATCHDOG_TIMEOUT_LIVEDUMP => 419

    /**
     * @type {Integer (UInt32)}
     */
    static DRIPS_SW_HW_DIVERGENCE_LIVEDUMP => 420

    /**
     * @type {Integer (UInt32)}
     */
    static USB_DRIPS_BLOCKER_SURPRISE_REMOVAL_LIVEDUMP => 421

    /**
     * @type {Integer (UInt32)}
     */
    static BLUETOOTH_ERROR_RECOVERY_LIVEDUMP => 422

    /**
     * @type {Integer (UInt32)}
     */
    static SMB_REDIRECTOR_LIVEDUMP => 423

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_DXGKRNL_BLACK_SCREEN_LIVEDUMP => 424

    /**
     * @type {Integer (UInt32)}
     */
    static DIRECTED_FX_TRANSITION_LIVEDUMP => 425

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_ON_INVALID_STACK => 426

    /**
     * @type {Integer (UInt32)}
     */
    static UNWIND_ON_INVALID_STACK => 427

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_MINIPORT_FAILED_LIVEDUMP => 432

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_MINIPORT_BLACK_SCREEN_LIVEDUMP => 440

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_VERIFIER_DETECTED_VIOLATION_LIVEDUMP => 452

    /**
     * @type {Integer (UInt32)}
     */
    static IO_THREADPOOL_DEADLOCK_LIVEDUMP => 453

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_ERESOURCE_PRECONDITION_VIOLATION => 454

    /**
     * @type {Integer (UInt32)}
     */
    static STORE_DATA_STRUCTURE_CORRUPTION => 455

    /**
     * @type {Integer (UInt32)}
     */
    static MANUALLY_INITIATED_POWER_BUTTON_HOLD => 456

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MODE_HEALTH_MONITOR_LIVEDUMP => 457

    /**
     * @type {Integer (UInt32)}
     */
    static SYNTHETIC_WATCHDOG_TIMEOUT => 458

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_SILO_DETACH => 459

    /**
     * @type {Integer (UInt32)}
     */
    static EXRESOURCE_TIMEOUT_LIVEDUMP => 460

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_CALLBACK_STACK_ADDRESS => 461

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_KERNEL_STACK_ADDRESS => 462

    /**
     * @type {Integer (UInt32)}
     */
    static HARDWARE_WATCHDOG_TIMEOUT => 463

    /**
     * @type {Integer (UInt32)}
     */
    static ACPI_FIRMWARE_WATCHDOG_TIMEOUT => 464

    /**
     * @type {Integer (UInt32)}
     */
    static TELEMETRY_ASSERTS_LIVEDUMP => 465

    /**
     * @type {Integer (UInt32)}
     */
    static WORKER_THREAD_INVALID_STATE => 466

    /**
     * @type {Integer (UInt32)}
     */
    static WFP_INVALID_OPERATION => 467

    /**
     * @type {Integer (UInt32)}
     */
    static UCMUCSI_LIVEDUMP => 468

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_PNP_WATCHDOG => 469

    /**
     * @type {Integer (UInt32)}
     */
    static WORKER_THREAD_RETURNED_WITH_NON_DEFAULT_WORKLOAD_CLASS => 470

    /**
     * @type {Integer (UInt32)}
     */
    static EFS_FATAL_ERROR => 471

    /**
     * @type {Integer (UInt32)}
     */
    static UCMUCSI_FAILURE => 472

    /**
     * @type {Integer (UInt32)}
     */
    static HAL_IOMMU_INTERNAL_ERROR => 473

    /**
     * @type {Integer (UInt32)}
     */
    static HAL_BLOCKED_PROCESSOR_INTERNAL_ERROR => 474

    /**
     * @type {Integer (UInt32)}
     */
    static IPI_WATCHDOG_TIMEOUT => 475

    /**
     * @type {Integer (UInt32)}
     */
    static DMA_COMMON_BUFFER_VECTOR_ERROR => 476

    /**
     * @type {Integer (UInt32)}
     */
    static BUGCODE_MBBADAPTER_DRIVER => 477

    /**
     * @type {Integer (UInt32)}
     */
    static BUGCODE_WIFIADAPTER_DRIVER => 478

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_START_TIMEOUT => 479

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_ALTERNATE_SYSTEM_CALL_HANDLER_REGISTRATION => 480

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DIAGNOSTIC_LOG_LIVEDUMP => 481

    /**
     * @type {Integer (UInt32)}
     */
    static AZURE_DEVICE_FW_DUMP => 482

    /**
     * @type {Integer (UInt32)}
     */
    static BREAKAWAY_CABLE_TRANSITION => 483

    /**
     * @type {Integer (UInt32)}
     */
    static VIDEO_DXGKRNL_SYSMM_FATAL_ERROR => 484

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVER_VERIFIER_TRACKING_LIVE_DUMP => 485

    /**
     * @type {Integer (UInt32)}
     */
    static CRASHDUMP_WATCHDOG_TIMEOUT => 486

    /**
     * @type {Integer (UInt32)}
     */
    static REGISTRY_LIVE_DUMP => 487

    /**
     * @type {Integer (UInt32)}
     */
    static INVALID_THREAD_AFFINITY_STATE => 488

    /**
     * @type {Integer (UInt32)}
     */
    static ILLEGAL_ATS_INITIALIZATION => 489

    /**
     * @type {Integer (UInt32)}
     */
    static SECURE_PCI_CONFIG_SPACE_ACCESS_VIOLATION => 490

    /**
     * @type {Integer (UInt32)}
     */
    static DAM_WATCHDOG_TIMEOUT => 491

    /**
     * @type {Integer (UInt32)}
     */
    static HANDLE_LIVE_DUMP => 492

    /**
     * @type {Integer (UInt32)}
     */
    static HANDLE_ERROR_ON_CRITICAL_THREAD => 493

    /**
     * @type {Integer (UInt32)}
     */
    static MPSDRV_QUERY_USER => 1073742318

    /**
     * @type {Integer (UInt32)}
     */
    static VMBUS_LIVEDUMP => 1073742319

    /**
     * @type {Integer (UInt32)}
     */
    static USB4_HARDWARE_VIOLATION => 496

    /**
     * @type {Integer (UInt32)}
     */
    static KASAN_ENLIGHTENMENT_VIOLATION => 497

    /**
     * @type {Integer (UInt32)}
     */
    static KASAN_ILLEGAL_ACCESS => 498

    /**
     * @type {Integer (UInt32)}
     */
    static IORING => 499

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_CACHE => 500

    /**
     * @type {Integer (UInt32)}
     */
    static MISALIGNED_POINTER_PARAMETER => 502

    /**
     * @type {Integer (UInt32)}
     */
    static MSSECCORE_ASSERTION_FAILURE => 503

    /**
     * @type {Integer (UInt32)}
     */
    static XBOX_VMCTRL_CS_TIMEOUT => 854

    /**
     * @type {Integer (UInt32)}
     */
    static XBOX_CORRUPTED_IMAGE => 855

    /**
     * @type {Integer (UInt32)}
     */
    static XBOX_INVERTED_FUNCTION_TABLE_OVERFLOW => 856

    /**
     * @type {Integer (UInt32)}
     */
    static XBOX_CORRUPTED_IMAGE_BASE => 857

    /**
     * @type {Integer (UInt32)}
     */
    static XBOX_XDS_WATCHDOG_TIMEOUT => 858

    /**
     * @type {Integer (UInt32)}
     */
    static XBOX_SHUTDOWN_WATCHDOG_TIMEOUT => 859

    /**
     * @type {Integer (UInt32)}
     */
    static XBOX_360_SYSTEM_CRASH => 864

    /**
     * @type {Integer (UInt32)}
     */
    static XBOX_360_SYSTEM_CRASH_RESERVED => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static XBOX_SECURITY_FAILUE => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static KERNEL_CFG_INIT_FAILURE => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static MANUALLY_INITIATED_POWER_BUTTON_HOLD_LIVE_DUMP => 4552

    /**
     * @type {Integer (UInt32)}
     */
    static HYPERVISOR_ERROR => 131073

    /**
     * @type {Integer (UInt32)}
     */
    static XBOX_MANUALLY_INITIATED_CRASH => 196614

    /**
     * @type {Integer (UInt32)}
     */
    static MANUALLY_INITIATED_BLACKSCREEN_HOTKEY_LIVE_DUMP => 8648

    /**
     * @type {Integer (UInt32)}
     */
    static WINLOGON_FATAL_ERROR => 3221226010

    /**
     * @type {Integer (UInt32)}
     */
    static MANUALLY_INITIATED_CRASH1 => 3735936685

    /**
     * @type {Integer (UInt32)}
     */
    static BUGCHECK_CONTEXT_MODIFIER => 2147483648
}
