#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Handle.ahk
#Include .\BSTR.ahk
#Include .\HGLOBAL.ahk
#Include .\HLOCAL.ahk
#Include .\Apis.ahk
#Include .\HANDLE.ahk

/**
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class Foundation {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static TRUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static FALSE => 0

    /**
     * @type {Integer (Int16)}
     */
    static VARIANT_TRUE => -1

    /**
     * @type {Integer (Int16)}
     */
    static VARIANT_FALSE => 0

    /**
     * @type {HANDLE}
     */
    static INVALID_HANDLE_VALUE => HANDLE({Value: -1}, false)

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_NOTINITIALIZED => -2147221008

    /**
     * @type {Integer (Int32)}
     */
    static STILL_ACTIVE => 259

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_ACCESS_VIOLATION => -1073741819

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_DATATYPE_MISALIGNMENT => -2147483646

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_BREAKPOINT => -2147483645

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_SINGLE_STEP => -2147483644

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_ARRAY_BOUNDS_EXCEEDED => -1073741684

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_FLT_DENORMAL_OPERAND => -1073741683

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_FLT_DIVIDE_BY_ZERO => -1073741682

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_FLT_INEXACT_RESULT => -1073741681

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_FLT_INVALID_OPERATION => -1073741680

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_FLT_OVERFLOW => -1073741679

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_FLT_STACK_CHECK => -1073741678

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_FLT_UNDERFLOW => -1073741677

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_INT_DIVIDE_BY_ZERO => -1073741676

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_INT_OVERFLOW => -1073741675

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_PRIV_INSTRUCTION => -1073741674

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_IN_PAGE_ERROR => -1073741818

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_ILLEGAL_INSTRUCTION => -1073741795

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_NONCONTINUABLE_EXCEPTION => -1073741787

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_STACK_OVERFLOW => -1073741571

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_INVALID_DISPOSITION => -1073741786

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_GUARD_PAGE => -2147483647

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_INVALID_HANDLE => -1073741816

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_POSSIBLE_DEADLOCK => -1073741420

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_SPAPI_UNRECOVERABLE_STACK_OVERFLOW => -536870144

    /**
     * @type {Integer (Int32)}
     */
    static CONTROL_C_EXIT => -1073741510

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACCESS_DENIED => -1073741790

    /**
     * @type {Integer (Int32)}
     */
    static E_NOTIMPL => -2147467263

    /**
     * @type {Integer (Int32)}
     */
    static E_OUTOFMEMORY => -2147024882

    /**
     * @type {Integer (Int32)}
     */
    static E_INVALIDARG => -2147024809

    /**
     * @type {Integer (Int32)}
     */
    static E_FAIL => -2147467259

    /**
     * @type {Integer (UInt32)}
     */
    static STRICT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PATH => 260

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_INSUFFICIENT_RESOURCES => -1073479678

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_DRIVER_ERROR => -1073479676

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_SEEK_ERROR => -1073479674

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_BAD_BLOCK => -1073479673

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_TIMEOUT => -1073479671

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_CONTROLLER_ERROR => -1073479669

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_NOT_READY => -1073479665

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_INVALID_REQUEST => -1073479664

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_RESET => -1073479661

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_BAD_FIRMWARE => -1073479655

    /**
     * @type {Integer (Int32)}
     */
    static IO_WRN_BAD_FIRMWARE => -2147221478

    /**
     * @type {Integer (Int32)}
     */
    static IO_WRITE_CACHE_ENABLED => -2147221472

    /**
     * @type {Integer (Int32)}
     */
    static IO_RECOVERED_VIA_ECC => -2147221471

    /**
     * @type {Integer (Int32)}
     */
    static IO_WRITE_CACHE_DISABLED => -2147221470

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_PAGING_FAILURE => -2147221453

    /**
     * @type {Integer (Int32)}
     */
    static IO_WRN_FAILURE_PREDICTED => -2147221452

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_ALLOCATION_FAILED => -2147221448

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_DUPLICATE_SIGNATURE => -2147221446

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_DUPLICATE_PATH => -2147221445

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_WRITE_FUA_PROBLEM => -2147221372

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_VOLUME_LOST_DISK_EXTENT => -2147221362

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_DEVICE_HAS_INTERNAL_DUMP => -2147221361

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_SOFT_THRESHOLD_REACHED => -2147221360

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_SOFT_THRESHOLD_REACHED_EX => -2147221359

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_SOFT_THRESHOLD_REACHED_EX_LUN_LUN => -2147221358

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_SOFT_THRESHOLD_REACHED_EX_LUN_POOL => -2147221357

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_SOFT_THRESHOLD_REACHED_EX_POOL_LUN => -2147221356

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_SOFT_THRESHOLD_REACHED_EX_POOL_POOL => -2147221355

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERROR_DISK_RESOURCES_EXHAUSTED => -1073479530

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_DISK_CAPACITY_CHANGED => -2147221353

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_DISK_PROVISIONING_TYPE_CHANGED => -2147221352

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_IO_OPERATION_RETRIED => -2147221351

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERROR_IO_HARDWARE_ERROR => -1073479526

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_COMPLETION_TIME => -2147221349

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_DISK_SURPRISE_REMOVED => -2147221347

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_REPEATED_DISK_GUID => -2147221346

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_DISK_FIRMWARE_UPDATED => 1074004127

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_RETRY_SUCCEEDED => 262145

    /**
     * @type {Integer (Int32)}
     */
    static IO_DUMP_CREATION_SUCCESS => 262306

    /**
     * @type {Integer (Int32)}
     */
    static IO_FILE_QUOTA_THRESHOLD => 1074004004

    /**
     * @type {Integer (Int32)}
     */
    static IO_FILE_QUOTA_LIMIT => 1074004005

    /**
     * @type {Integer (Int32)}
     */
    static IO_FILE_QUOTA_STARTED => 1074004006

    /**
     * @type {Integer (Int32)}
     */
    static IO_FILE_QUOTA_SUCCEEDED => 1074004007

    /**
     * @type {Integer (Int32)}
     */
    static IO_INFO_THROTTLE_COMPLETE => 1074004087

    /**
     * @type {Integer (Int32)}
     */
    static IO_CDROM_EXCLUSIVE_LOCK => 1074004101

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_ADAPTER_FIRMWARE_UPDATED => 1074004128

    /**
     * @type {Integer (Int32)}
     */
    static IO_FILE_QUOTA_FAILED => -2147221464

    /**
     * @type {Integer (Int32)}
     */
    static IO_LOST_DELAYED_WRITE => -2147221454

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_INTERRUPT_STILL_PENDING => -2147221451

    /**
     * @type {Integer (Int32)}
     */
    static IO_DRIVER_CANCEL_TIMEOUT => -2147221450

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_LOG_FLUSH_FAILED => -2147221447

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_BUS_RESET => -2147221386

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_RESET => -2147221375

    /**
     * @type {Integer (Int32)}
     */
    static IO_LOST_DELAYED_WRITE_NETWORK_DISCONNECTED => -2147221365

    /**
     * @type {Integer (Int32)}
     */
    static IO_LOST_DELAYED_WRITE_NETWORK_SERVER_ERROR => -2147221364

    /**
     * @type {Integer (Int32)}
     */
    static IO_LOST_DELAYED_WRITE_NETWORK_LOCAL_DISK_ERROR => -2147221363

    /**
     * @type {Integer (Int32)}
     */
    static IO_WARNING_DUMP_DISABLED_DEVICE_GONE => -2147221348

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_CONFIGURATION_ERROR => -1073479677

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_PARITY => -1073479675

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_OVERRUN_ERROR => -1073479672

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_SEQUENCE => -1073479670

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_INTERNAL_ERROR => -1073479668

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_INCORRECT_IRQL => -1073479667

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_INVALID_IOBASE => -1073479666

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_VERSION => -1073479663

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_LAYERED_FAILURE => -1073479662

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_PROTOCOL => -1073479660

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_MEMORY_CONFLICT_DETECTED => -1073479659

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_PORT_CONFLICT_DETECTED => -1073479658

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_DMA_CONFLICT_DETECTED => -1073479657

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_IRQ_CONFLICT_DETECTED => -1073479656

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_DMA_RESOURCE_CONFLICT => -1073479653

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_INTERRUPT_RESOURCE_CONFLICT => -1073479652

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_MEMORY_RESOURCE_CONFLICT => -1073479651

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_PORT_RESOURCE_CONFLICT => -1073479650

    /**
     * @type {Integer (Int32)}
     */
    static IO_BAD_BLOCK_WITH_NAME => -1073479649

    /**
     * @type {Integer (Int32)}
     */
    static IO_FILE_SYSTEM_CORRUPT => -1073479639

    /**
     * @type {Integer (Int32)}
     */
    static IO_FILE_QUOTA_CORRUPT => -1073479638

    /**
     * @type {Integer (Int32)}
     */
    static IO_SYSTEM_SLEEP_FAILED => -1073479637

    /**
     * @type {Integer (Int32)}
     */
    static IO_DUMP_POINTER_FAILURE => -1073479636

    /**
     * @type {Integer (Int32)}
     */
    static IO_DUMP_DRIVER_LOAD_FAILURE => -1073479635

    /**
     * @type {Integer (Int32)}
     */
    static IO_DUMP_INITIALIZATION_FAILURE => -1073479634

    /**
     * @type {Integer (Int32)}
     */
    static IO_DUMP_DUMPFILE_CONFLICT => -1073479633

    /**
     * @type {Integer (Int32)}
     */
    static IO_DUMP_DIRECT_CONFIG_FAILED => -1073479632

    /**
     * @type {Integer (Int32)}
     */
    static IO_DUMP_PAGE_CONFIG_FAILED => -1073479631

    /**
     * @type {Integer (Int32)}
     */
    static IO_FILE_SYSTEM_CORRUPT_WITH_NAME => -1073479625

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_THREAD_STUCK_IN_DEVICE_DRIVER => -1073479572

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERR_PORT_TIMEOUT => -1073479563

    /**
     * @type {Integer (Int32)}
     */
    static IO_ERROR_DUMP_CREATION_ERROR => -1073479519

    /**
     * @type {Integer (Int32)}
     */
    static IO_DUMP_CALLBACK_EXCEPTION => -1073479517

    /**
     * @type {Integer (Int32)}
     */
    static IO_DUMP_INIT_DEDICATED_DUMP_FAILURE => -1073479516

    /**
     * @type {Integer (Int32)}
     */
    static MCA_INFO_CPU_THERMAL_THROTTLING_REMOVED => 1074069616

    /**
     * @type {Integer (Int32)}
     */
    static MCA_INFO_NO_MORE_CORRECTED_ERROR_LOGS => 1074069619

    /**
     * @type {Integer (Int32)}
     */
    static MCA_INFO_MEMORY_PAGE_MARKED_BAD => 1074069620

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_CACHE => -2147155908

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_TLB => -2147155906

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_CPU_BUS => -2147155904

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_REGISTER_FILE => -2147155902

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_MAS => -2147155900

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_MEM_UNKNOWN => -2147155898

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_MEM_1_2 => -2147155896

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_MEM_1_2_5 => -2147155894

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_MEM_1_2_5_4 => -2147155892

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_SYSTEM_EVENT => -2147155890

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_PCI_BUS_PARITY => -2147155888

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_PCI_BUS_PARITY_NO_INFO => -2147155886

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_PCI_BUS_SERR => -2147155884

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_PCI_BUS_SERR_NO_INFO => -2147155882

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_PCI_BUS_MASTER_ABORT => -2147155880

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_PCI_BUS_MASTER_ABORT_NO_INFO => -2147155878

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_PCI_BUS_TIMEOUT => -2147155876

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_PCI_BUS_TIMEOUT_NO_INFO => -2147155874

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_PCI_BUS_UNKNOWN => -2147155872

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_PCI_DEVICE => -2147155870

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_SMBIOS => -2147155868

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_PLATFORM_SPECIFIC => -2147155866

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_UNKNOWN => -2147155864

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_UNKNOWN_NO_CPU => -2147155862

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_CMC_THRESHOLD_EXCEEDED => -2147155859

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_CPE_THRESHOLD_EXCEEDED => -2147155858

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_CPU_THERMAL_THROTTLED => -2147155857

    /**
     * @type {Integer (Int32)}
     */
    static MCA_WARNING_CPU => -2147155855

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_CACHE => -1073414083

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_TLB => -1073414081

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_CPU_BUS => -1073414079

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_REGISTER_FILE => -1073414077

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_MAS => -1073414075

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_MEM_UNKNOWN => -1073414073

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_MEM_1_2 => -1073414071

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_MEM_1_2_5 => -1073414069

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_MEM_1_2_5_4 => -1073414067

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_SYSTEM_EVENT => -1073414065

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_PCI_BUS_PARITY => -1073414063

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_PCI_BUS_PARITY_NO_INFO => -1073414061

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_PCI_BUS_SERR => -1073414059

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_PCI_BUS_SERR_NO_INFO => -1073414057

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_PCI_BUS_MASTER_ABORT => -1073414055

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_PCI_BUS_MASTER_ABORT_NO_INFO => -1073414053

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_PCI_BUS_TIMEOUT => -1073414051

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_PCI_BUS_TIMEOUT_NO_INFO => -1073414049

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_PCI_BUS_UNKNOWN => -1073414047

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_PCI_DEVICE => -1073414045

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_SMBIOS => -1073414043

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_PLATFORM_SPECIFIC => -1073414041

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_UNKNOWN => -1073414039

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_UNKNOWN_NO_CPU => -1073414037

    /**
     * @type {Integer (Int32)}
     */
    static MCA_ERROR_CPU => -1073414030

    /**
     * @type {Integer (Int32)}
     */
    static MCA_MEMORYHIERARCHY_ERROR => -1073414024

    /**
     * @type {Integer (Int32)}
     */
    static MCA_TLB_ERROR => -1073414023

    /**
     * @type {Integer (Int32)}
     */
    static MCA_BUS_ERROR => -1073414022

    /**
     * @type {Integer (Int32)}
     */
    static MCA_BUS_TIMEOUT_ERROR => -1073414021

    /**
     * @type {Integer (Int32)}
     */
    static MCA_INTERNALTIMER_ERROR => -1073414020

    /**
     * @type {Integer (Int32)}
     */
    static MCA_MICROCODE_ROM_PARITY_ERROR => -1073414018

    /**
     * @type {Integer (Int32)}
     */
    static MCA_EXTERNAL_ERROR => -1073414017

    /**
     * @type {Integer (Int32)}
     */
    static MCA_FRC_ERROR => -1073414016

    /**
     * @type {Integer (Int32)}
     */
    static VOLMGR_KSR_ERROR => -2143813631

    /**
     * @type {Integer (Int32)}
     */
    static VOLMGR_KSR_READ_ERROR => -2143813630

    /**
     * @type {Integer (Int32)}
     */
    static VOLMGR_KSR_BYPASS => -2143813629

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WAIT_0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FACILTIY_MUI_ERROR_CODE => 11

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SUCCESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WAIT_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WAIT_2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WAIT_3 => 3

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WAIT_63 => 63

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ABANDONED => 128

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ABANDONED_WAIT_0 => 128

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ABANDONED_WAIT_63 => 191

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_USER_APC => 192

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ALREADY_COMPLETE => 255

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_KERNEL_APC => 256

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ALERTED => 257

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TIMEOUT => 258

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PENDING => 259

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REPARSE => 260

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MORE_ENTRIES => 261

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_ALL_ASSIGNED => 262

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SOME_NOT_MAPPED => 263

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OPLOCK_BREAK_IN_PROGRESS => 264

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLUME_MOUNTED => 265

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RXACT_COMMITTED => 266

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOTIFY_CLEANUP => 267

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOTIFY_ENUM_DIR => 268

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_QUOTAS_FOR_ACCOUNT => 269

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRIMARY_TRANSPORT_CONNECT_FAILED => 270

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PAGE_FAULT_TRANSITION => 272

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PAGE_FAULT_DEMAND_ZERO => 273

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PAGE_FAULT_COPY_ON_WRITE => 274

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PAGE_FAULT_GUARD_PAGE => 275

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PAGE_FAULT_PAGING_FILE => 276

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CACHE_PAGE_LOCKED => 277

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CRASH_DUMP => 278

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BUFFER_ALL_ZEROS => 279

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REPARSE_OBJECT => 280

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RESOURCE_REQUIREMENTS_CHANGED => 281

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSLATION_COMPLETE => 288

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_MEMBERSHIP_EVALUATED_LOCALLY => 289

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOTHING_TO_TERMINATE => 290

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PROCESS_NOT_IN_JOB => 291

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PROCESS_IN_JOB => 292

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLSNAP_HIBERNATE_READY => 293

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FSFILTER_OP_COMPLETED_SUCCESSFULLY => 294

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INTERRUPT_VECTOR_ALREADY_CONNECTED => 295

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INTERRUPT_STILL_CONNECTED => 296

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PROCESS_CLONED => 297

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_LOCKED_WITH_ONLY_READERS => 298

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_LOCKED_WITH_WRITERS => 299

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VALID_IMAGE_HASH => 300

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VALID_CATALOG_HASH => 301

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VALID_STRONG_CODE_HASH => 302

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GHOSTED => 303

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DATA_OVERWRITTEN => 304

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RESOURCEMANAGER_READ_ONLY => 514

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RING_PREVIOUSLY_EMPTY => 528

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RING_PREVIOUSLY_FULL => 529

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RING_PREVIOUSLY_ABOVE_QUOTA => 530

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RING_NEWLY_EMPTY => 531

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RING_SIGNAL_OPPOSITE_ENDPOINT => 532

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OPLOCK_SWITCHED_TO_NEW_HANDLE => 533

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OPLOCK_HANDLE_CLOSED => 534

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WAIT_FOR_OPLOCK => 871

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REPARSE_GLOBAL => 872

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PAGE_FAULT_RETRY => 873

    /**
     * @type {Integer (Int32)}
     */
    static DBG_EXCEPTION_HANDLED => 65537

    /**
     * @type {Integer (Int32)}
     */
    static DBG_CONTINUE => 65538

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_IO_COMPLETE => 1835009

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OBJECT_NAME_EXISTS => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_THREAD_WAS_SUSPENDED => 1073741825

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WORKING_SET_LIMIT_RANGE => 1073741826

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IMAGE_NOT_AT_BASE => 1073741827

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RXACT_STATE_CREATED => 1073741828

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SEGMENT_NOTIFICATION => 1073741829

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOCAL_USER_SESSION_KEY => 1073741830

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_CURRENT_DIRECTORY => 1073741831

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SERIAL_MORE_WRITES => 1073741832

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REGISTRY_RECOVERED => 1073741833

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FT_READ_RECOVERY_FROM_BACKUP => 1073741834

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FT_WRITE_RECOVERY => 1073741835

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SERIAL_COUNTER_TIMEOUT => 1073741836

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NULL_LM_PASSWORD => 1073741837

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IMAGE_MACHINE_TYPE_MISMATCH => 1073741838

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RECEIVE_PARTIAL => 1073741839

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RECEIVE_EXPEDITED => 1073741840

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RECEIVE_PARTIAL_EXPEDITED => 1073741841

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EVENT_DONE => 1073741842

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EVENT_PENDING => 1073741843

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CHECKING_FILE_SYSTEM => 1073741844

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FATAL_APP_EXIT => 1073741845

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PREDEFINED_HANDLE => 1073741846

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WAS_UNLOCKED => 1073741847

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SERVICE_NOTIFICATION => 1073741848

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WAS_LOCKED => 1073741849

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_HARD_ERROR => 1073741850

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ALREADY_WIN32 => 1073741851

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WX86_UNSIMULATE => 1073741852

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WX86_CONTINUE => 1073741853

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WX86_SINGLE_STEP => 1073741854

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WX86_BREAKPOINT => 1073741855

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WX86_EXCEPTION_CONTINUE => 1073741856

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WX86_EXCEPTION_LASTCHANCE => 1073741857

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WX86_EXCEPTION_CHAIN => 1073741858

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IMAGE_MACHINE_TYPE_MISMATCH_EXE => 1073741859

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_YIELD_PERFORMED => 1073741860

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TIMER_RESUME_IGNORED => 1073741861

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ARBITRATION_UNHANDLED => 1073741862

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CARDBUS_NOT_SUPPORTED => 1073741863

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WX86_CREATEWX86TIB => 1073741864

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MP_PROCESSOR_MISMATCH => 1073741865

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HIBERNATED => 1073741866

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RESUME_HIBERNATION => 1073741867

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FIRMWARE_UPDATED => 1073741868

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DRIVERS_LEAKING_LOCKED_PAGES => 1073741869

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MESSAGE_RETRIEVED => 1073741870

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_POWERSTATE_TRANSITION => 1073741871

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ALPC_CHECK_COMPLETION_LIST => 1073741872

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_POWERSTATE_COMPLEX_TRANSITION => 1073741873

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACCESS_AUDIT_BY_POLICY => 1073741874

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ABANDON_HIBERFILE => 1073741875

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BIZRULES_NOT_ENABLED => 1073741876

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FT_READ_FROM_COPY => 1073741877

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IMAGE_AT_DIFFERENT_BASE => 1073741878

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PATCH_DEFERRED => 1073741879

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EMULATION_BREAKPOINT => 1073741880

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EMULATION_SYSCALL => 1073741881

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EMULATION_FLOAT_EXCEPTION => 1073741882

    /**
     * @type {Integer (Int32)}
     */
    static DBG_REPLY_LATER => 1073807361

    /**
     * @type {Integer (Int32)}
     */
    static DBG_UNABLE_TO_PROVIDE_HANDLE => 1073807362

    /**
     * @type {Integer (Int32)}
     */
    static DBG_TERMINATE_THREAD => 1073807363

    /**
     * @type {Integer (Int32)}
     */
    static DBG_TERMINATE_PROCESS => 1073807364

    /**
     * @type {Integer (Int32)}
     */
    static DBG_CONTROL_C => 1073807365

    /**
     * @type {Integer (Int32)}
     */
    static DBG_PRINTEXCEPTION_C => 1073807366

    /**
     * @type {Integer (Int32)}
     */
    static DBG_RIPEXCEPTION => 1073807367

    /**
     * @type {Integer (Int32)}
     */
    static DBG_CONTROL_BREAK => 1073807368

    /**
     * @type {Integer (Int32)}
     */
    static DBG_COMMAND_EXCEPTION => 1073807369

    /**
     * @type {Integer (Int32)}
     */
    static DBG_PRINTEXCEPTION_WIDE_C => 1073807370

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HEURISTIC_DAMAGE_POSSIBLE => 1075380225

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GUARD_PAGE_VIOLATION => -2147483647

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DATATYPE_MISALIGNMENT => -2147483646

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BREAKPOINT => -2147483645

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SINGLE_STEP => -2147483644

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BUFFER_OVERFLOW => -2147483643

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_MORE_FILES => -2147483642

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WAKE_SYSTEM_DEBUGGER => -2147483641

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HANDLES_CLOSED => -2147483638

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_INHERITANCE => -2147483637

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GUID_SUBSTITUTION_MADE => -2147483636

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PARTIAL_COPY => -2147483635

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_PAPER_EMPTY => -2147483634

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_POWERED_OFF => -2147483633

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_OFF_LINE => -2147483632

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_BUSY => -2147483631

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_MORE_EAS => -2147483630

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_EA_NAME => -2147483629

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EA_LIST_INCONSISTENT => -2147483628

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_EA_FLAG => -2147483627

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VERIFY_REQUIRED => -2147483626

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EXTRANEOUS_INFORMATION => -2147483625

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RXACT_COMMIT_NECESSARY => -2147483624

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_MORE_ENTRIES => -2147483622

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILEMARK_DETECTED => -2147483621

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MEDIA_CHANGED => -2147483620

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BUS_RESET => -2147483619

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_END_OF_MEDIA => -2147483618

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BEGINNING_OF_MEDIA => -2147483617

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MEDIA_CHECK => -2147483616

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SETMARK_DETECTED => -2147483615

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_DATA_DETECTED => -2147483614

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REDIRECTOR_HAS_OPEN_HANDLES => -2147483613

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SERVER_HAS_OPEN_HANDLES => -2147483612

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ALREADY_DISCONNECTED => -2147483611

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LONGJUMP => -2147483610

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLEANER_CARTRIDGE_INSTALLED => -2147483609

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PLUGPLAY_QUERY_VETOED => -2147483608

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNWIND_CONSOLIDATE => -2147483607

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REGISTRY_HIVE_RECOVERED => -2147483606

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DLL_MIGHT_BE_INSECURE => -2147483605

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DLL_MIGHT_BE_INCOMPATIBLE => -2147483604

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STOPPED_ON_SYMLINK => -2147483603

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANNOT_GRANT_REQUESTED_OPLOCK => -2147483602

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_ACE_CONDITION => -2147483601

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_SUPPORT_IN_PROGRESS => -2147483600

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_POWER_CYCLE_REQUIRED => -2147483599

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_WORK_DONE => -2147483598

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RETURN_ADDRESS_HIJACK_ATTEMPT => -2147483597

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RECOVERABLE_BUGCHECK => -2147483596

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PTE_CHANGE_NOT_COMPLETED => -2147483595

    /**
     * @type {Integer (Int32)}
     */
    static DBG_EXCEPTION_NOT_HANDLED => -2147418111

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NODE_ALREADY_UP => -2146238463

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NODE_ALREADY_DOWN => -2146238462

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NETWORK_ALREADY_ONLINE => -2146238461

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NETWORK_ALREADY_OFFLINE => -2146238460

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NODE_ALREADY_MEMBER => -2146238459

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_BUFFER_TOO_SMALL => -2145648639

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_LINK_CONFIGURATION_IN_PROGRESS => -2145517568

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_PARTIAL_METADATA => -2145320959

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_TRANSIENT_STATE => -2145320958

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_PROPERTY_BLOB_CHECKSUM_MISMATCH => -2147430656

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNSUCCESSFUL => -1073741823

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_IMPLEMENTED => -1073741822

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_INFO_CLASS => -1073741821

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INFO_LENGTH_MISMATCH => -1073741820

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACCESS_VIOLATION => -1073741819

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IN_PAGE_ERROR => -1073741818

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PAGEFILE_QUOTA => -1073741817

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_HANDLE => -1073741816

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_INITIAL_STACK => -1073741815

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_INITIAL_PC => -1073741814

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_CID => -1073741813

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TIMER_NOT_CANCELED => -1073741812

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PARAMETER => -1073741811

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SUCH_DEVICE => -1073741810

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SUCH_FILE => -1073741809

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_DEVICE_REQUEST => -1073741808

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_END_OF_FILE => -1073741807

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WRONG_VOLUME => -1073741806

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_MEDIA_IN_DEVICE => -1073741805

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNRECOGNIZED_MEDIA => -1073741804

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NONEXISTENT_SECTOR => -1073741803

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MORE_PROCESSING_REQUIRED => -1073741802

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_MEMORY => -1073741801

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONFLICTING_ADDRESSES => -1073741800

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_MAPPED_VIEW => -1073741799

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNABLE_TO_FREE_VM => -1073741798

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNABLE_TO_DELETE_SECTION => -1073741797

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_SYSTEM_SERVICE => -1073741796

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ILLEGAL_INSTRUCTION => -1073741795

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_LOCK_SEQUENCE => -1073741794

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_VIEW_SIZE => -1073741793

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_FILE_FOR_SECTION => -1073741792

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ALREADY_COMMITTED => -1073741791

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BUFFER_TOO_SMALL => -1073741789

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OBJECT_TYPE_MISMATCH => -1073741788

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NONCONTINUABLE_EXCEPTION => -1073741787

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_DISPOSITION => -1073741786

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNWIND => -1073741785

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_STACK => -1073741784

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_UNWIND_TARGET => -1073741783

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_LOCKED => -1073741782

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PARITY_ERROR => -1073741781

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNABLE_TO_DECOMMIT_VM => -1073741780

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_COMMITTED => -1073741779

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PORT_ATTRIBUTES => -1073741778

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PORT_MESSAGE_TOO_LONG => -1073741777

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PARAMETER_MIX => -1073741776

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_QUOTA_LOWER => -1073741775

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DISK_CORRUPT_ERROR => -1073741774

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OBJECT_NAME_INVALID => -1073741773

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OBJECT_NAME_NOT_FOUND => -1073741772

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OBJECT_NAME_COLLISION => -1073741771

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PORT_DO_NOT_DISTURB => -1073741770

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PORT_DISCONNECTED => -1073741769

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_ALREADY_ATTACHED => -1073741768

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OBJECT_PATH_INVALID => -1073741767

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OBJECT_PATH_NOT_FOUND => -1073741766

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OBJECT_PATH_SYNTAX_BAD => -1073741765

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DATA_OVERRUN => -1073741764

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DATA_LATE_ERROR => -1073741763

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DATA_ERROR => -1073741762

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CRC_ERROR => -1073741761

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECTION_TOO_BIG => -1073741760

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PORT_CONNECTION_REFUSED => -1073741759

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PORT_HANDLE => -1073741758

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SHARING_VIOLATION => -1073741757

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUOTA_EXCEEDED => -1073741756

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PAGE_PROTECTION => -1073741755

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MUTANT_NOT_OWNED => -1073741754

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SEMAPHORE_LIMIT_EXCEEDED => -1073741753

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PORT_ALREADY_SET => -1073741752

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECTION_NOT_IMAGE => -1073741751

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SUSPEND_COUNT_EXCEEDED => -1073741750

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_THREAD_IS_TERMINATING => -1073741749

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_WORKING_SET_LIMIT => -1073741748

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INCOMPATIBLE_FILE_MAP => -1073741747

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECTION_PROTECTION => -1073741746

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EAS_NOT_SUPPORTED => -1073741745

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EA_TOO_LARGE => -1073741744

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NONEXISTENT_EA_ENTRY => -1073741743

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_EAS_ON_FILE => -1073741742

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EA_CORRUPT_ERROR => -1073741741

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_LOCK_CONFLICT => -1073741740

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOCK_NOT_GRANTED => -1073741739

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DELETE_PENDING => -1073741738

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTL_FILE_NOT_SUPPORTED => -1073741737

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNKNOWN_REVISION => -1073741736

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REVISION_MISMATCH => -1073741735

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_OWNER => -1073741734

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PRIMARY_GROUP => -1073741733

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_IMPERSONATION_TOKEN => -1073741732

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANT_DISABLE_MANDATORY => -1073741731

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_LOGON_SERVERS => -1073741730

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SUCH_PRIVILEGE => -1073741728

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRIVILEGE_NOT_HELD => -1073741727

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_ACCOUNT_NAME => -1073741726

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_USER_EXISTS => -1073741725

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GROUP_EXISTS => -1073741723

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SUCH_GROUP => -1073741722

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MEMBER_IN_GROUP => -1073741721

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MEMBER_NOT_IN_GROUP => -1073741720

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LAST_ADMIN => -1073741719

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ILL_FORMED_PASSWORD => -1073741717

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PASSWORD_RESTRICTION => -1073741716

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_LOGON_HOURS => -1073741713

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_WORKSTATION => -1073741712

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NONE_MAPPED => -1073741709

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_LUIDS_REQUESTED => -1073741708

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LUIDS_EXHAUSTED => -1073741707

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_SUB_AUTHORITY => -1073741706

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_ACL => -1073741705

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_SID => -1073741704

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_SECURITY_DESCR => -1073741703

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PROCEDURE_NOT_FOUND => -1073741702

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_IMAGE_FORMAT => -1073741701

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_TOKEN => -1073741700

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_INHERITANCE_ACL => -1073741699

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RANGE_NOT_LOCKED => -1073741698

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DISK_FULL => -1073741697

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SERVER_DISABLED => -1073741696

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SERVER_NOT_DISABLED => -1073741695

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_GUIDS_REQUESTED => -1073741694

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GUIDS_EXHAUSTED => -1073741693

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_ID_AUTHORITY => -1073741692

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AGENTS_EXHAUSTED => -1073741691

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_VOLUME_LABEL => -1073741690

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECTION_NOT_EXTENDED => -1073741689

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_MAPPED_DATA => -1073741688

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RESOURCE_DATA_NOT_FOUND => -1073741687

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RESOURCE_TYPE_NOT_FOUND => -1073741686

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RESOURCE_NAME_NOT_FOUND => -1073741685

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ARRAY_BOUNDS_EXCEEDED => -1073741684

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOAT_DENORMAL_OPERAND => -1073741683

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOAT_DIVIDE_BY_ZERO => -1073741682

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOAT_INEXACT_RESULT => -1073741681

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOAT_INVALID_OPERATION => -1073741680

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOAT_OVERFLOW => -1073741679

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOAT_STACK_CHECK => -1073741678

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOAT_UNDERFLOW => -1073741677

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INTEGER_DIVIDE_BY_ZERO => -1073741676

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INTEGER_OVERFLOW => -1073741675

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRIVILEGED_INSTRUCTION => -1073741674

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_PAGING_FILES => -1073741673

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_INVALID => -1073741672

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ALLOTTED_SPACE_EXCEEDED => -1073741671

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INSUFFICIENT_RESOURCES => -1073741670

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DFS_EXIT_PATH_FOUND => -1073741669

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_DATA_ERROR => -1073741668

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_NOT_CONNECTED => -1073741667

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_POWER_FAILURE => -1073741666

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FREE_VM_NOT_AT_BASE => -1073741665

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MEMORY_NOT_ALLOCATED => -1073741664

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WORKING_SET_QUOTA => -1073741663

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MEDIA_WRITE_PROTECTED => -1073741662

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_NOT_READY => -1073741661

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_GROUP_ATTRIBUTES => -1073741660

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_IMPERSONATION_LEVEL => -1073741659

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANT_OPEN_ANONYMOUS => -1073741658

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_VALIDATION_CLASS => -1073741657

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_TOKEN_TYPE => -1073741656

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_MASTER_BOOT_RECORD => -1073741655

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INSTRUCTION_MISALIGNMENT => -1073741654

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INSTANCE_NOT_AVAILABLE => -1073741653

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PIPE_NOT_AVAILABLE => -1073741652

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PIPE_STATE => -1073741651

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PIPE_BUSY => -1073741650

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ILLEGAL_FUNCTION => -1073741649

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PIPE_DISCONNECTED => -1073741648

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PIPE_CLOSING => -1073741647

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PIPE_CONNECTED => -1073741646

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PIPE_LISTENING => -1073741645

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_READ_MODE => -1073741644

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IO_TIMEOUT => -1073741643

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_FORCED_CLOSED => -1073741642

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PROFILING_NOT_STARTED => -1073741641

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PROFILING_NOT_STOPPED => -1073741640

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_COULD_NOT_INTERPRET => -1073741639

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_IS_A_DIRECTORY => -1073741638

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED => -1073741637

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REMOTE_NOT_LISTENING => -1073741636

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DUPLICATE_NAME => -1073741635

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_NETWORK_PATH => -1073741634

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NETWORK_BUSY => -1073741633

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_DOES_NOT_EXIST => -1073741632

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_COMMANDS => -1073741631

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ADAPTER_HARDWARE_ERROR => -1073741630

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_NETWORK_RESPONSE => -1073741629

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNEXPECTED_NETWORK_ERROR => -1073741628

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_REMOTE_ADAPTER => -1073741627

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRINT_QUEUE_FULL => -1073741626

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SPOOL_SPACE => -1073741625

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRINT_CANCELLED => -1073741624

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NETWORK_NAME_DELETED => -1073741623

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NETWORK_ACCESS_DENIED => -1073741622

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_DEVICE_TYPE => -1073741621

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_NETWORK_NAME => -1073741620

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_NAMES => -1073741619

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_SESSIONS => -1073741618

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SHARING_PAUSED => -1073741617

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REQUEST_NOT_ACCEPTED => -1073741616

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REDIRECTOR_PAUSED => -1073741615

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NET_WRITE_FAULT => -1073741614

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PROFILING_AT_LIMIT => -1073741613

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SAME_DEVICE => -1073741612

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_RENAMED => -1073741611

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VIRTUAL_CIRCUIT_CLOSED => -1073741610

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SECURITY_ON_OBJECT => -1073741609

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANT_WAIT => -1073741608

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PIPE_EMPTY => -1073741607

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANT_ACCESS_DOMAIN_INFO => -1073741606

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANT_TERMINATE_SELF => -1073741605

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_SERVER_STATE => -1073741604

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_DOMAIN_STATE => -1073741603

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_DOMAIN_ROLE => -1073741602

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SUCH_DOMAIN => -1073741601

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DOMAIN_EXISTS => -1073741600

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DOMAIN_LIMIT_EXCEEDED => -1073741599

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OPLOCK_NOT_GRANTED => -1073741598

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_OPLOCK_PROTOCOL => -1073741597

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INTERNAL_DB_CORRUPTION => -1073741596

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INTERNAL_ERROR => -1073741595

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GENERIC_NOT_MAPPED => -1073741594

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_DESCRIPTOR_FORMAT => -1073741593

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_USER_BUFFER => -1073741592

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNEXPECTED_IO_ERROR => -1073741591

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNEXPECTED_MM_CREATE_ERR => -1073741590

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNEXPECTED_MM_MAP_ERROR => -1073741589

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNEXPECTED_MM_EXTEND_ERR => -1073741588

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_LOGON_PROCESS => -1073741587

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOGON_SESSION_EXISTS => -1073741586

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PARAMETER_1 => -1073741585

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PARAMETER_2 => -1073741584

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PARAMETER_3 => -1073741583

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PARAMETER_4 => -1073741582

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PARAMETER_5 => -1073741581

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PARAMETER_6 => -1073741580

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PARAMETER_7 => -1073741579

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PARAMETER_8 => -1073741578

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PARAMETER_9 => -1073741577

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PARAMETER_10 => -1073741576

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PARAMETER_11 => -1073741575

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PARAMETER_12 => -1073741574

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REDIRECTOR_NOT_STARTED => -1073741573

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REDIRECTOR_STARTED => -1073741572

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STACK_OVERFLOW => -1073741571

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SUCH_PACKAGE => -1073741570

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_FUNCTION_TABLE => -1073741569

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VARIABLE_NOT_FOUND => -1073741568

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIRECTORY_NOT_EMPTY => -1073741567

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_CORRUPT_ERROR => -1073741566

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_A_DIRECTORY => -1073741565

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_LOGON_SESSION_STATE => -1073741564

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOGON_SESSION_COLLISION => -1073741563

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NAME_TOO_LONG => -1073741562

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILES_OPEN => -1073741561

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONNECTION_IN_USE => -1073741560

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MESSAGE_NOT_FOUND => -1073741559

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PROCESS_IS_TERMINATING => -1073741558

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_LOGON_TYPE => -1073741557

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_GUID_TRANSLATION => -1073741556

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANNOT_IMPERSONATE => -1073741555

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IMAGE_ALREADY_LOADED => -1073741554

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ABIOS_NOT_PRESENT => -1073741553

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ABIOS_LID_NOT_EXIST => -1073741552

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ABIOS_LID_ALREADY_OWNED => -1073741551

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ABIOS_NOT_LID_OWNER => -1073741550

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ABIOS_INVALID_COMMAND => -1073741549

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ABIOS_INVALID_LID => -1073741548

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ABIOS_SELECTOR_NOT_AVAILABLE => -1073741547

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ABIOS_INVALID_SELECTOR => -1073741546

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_LDT => -1073741545

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_LDT_SIZE => -1073741544

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_LDT_OFFSET => -1073741543

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_LDT_DESCRIPTOR => -1073741542

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_IMAGE_NE_FORMAT => -1073741541

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RXACT_INVALID_STATE => -1073741540

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RXACT_COMMIT_FAILURE => -1073741539

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MAPPED_FILE_SIZE_ZERO => -1073741538

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_OPENED_FILES => -1073741537

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANCELLED => -1073741536

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANNOT_DELETE => -1073741535

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_COMPUTER_NAME => -1073741534

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_DELETED => -1073741533

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPECIAL_ACCOUNT => -1073741532

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPECIAL_GROUP => -1073741531

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPECIAL_USER => -1073741530

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MEMBERS_PRIMARY_GROUP => -1073741529

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_CLOSED => -1073741528

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_THREADS => -1073741527

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_THREAD_NOT_IN_PROCESS => -1073741526

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOKEN_ALREADY_IN_USE => -1073741525

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PAGEFILE_QUOTA_EXCEEDED => -1073741524

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_COMMITMENT_LIMIT => -1073741523

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_IMAGE_LE_FORMAT => -1073741522

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_IMAGE_NOT_MZ => -1073741521

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_IMAGE_PROTECT => -1073741520

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_IMAGE_WIN_16 => -1073741519

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOGON_SERVER_CONFLICT => -1073741518

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TIME_DIFFERENCE_AT_DC => -1073741517

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYNCHRONIZATION_REQUIRED => -1073741516

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DLL_NOT_FOUND => -1073741515

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OPEN_FAILED => -1073741514

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IO_PRIVILEGE_FAILED => -1073741513

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ORDINAL_NOT_FOUND => -1073741512

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENTRYPOINT_NOT_FOUND => -1073741511

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONTROL_C_EXIT => -1073741510

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOCAL_DISCONNECT => -1073741509

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REMOTE_DISCONNECT => -1073741508

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REMOTE_RESOURCES => -1073741507

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LINK_FAILED => -1073741506

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LINK_TIMEOUT => -1073741505

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_CONNECTION => -1073741504

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_ADDRESS => -1073741503

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DLL_INIT_FAILED => -1073741502

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MISSING_SYSTEMFILE => -1073741501

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNHANDLED_EXCEPTION => -1073741500

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APP_INIT_FAILURE => -1073741499

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PAGEFILE_CREATE_FAILED => -1073741498

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_PAGEFILE => -1073741497

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_LEVEL => -1073741496

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WRONG_PASSWORD_CORE => -1073741495

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ILLEGAL_FLOAT_CONTEXT => -1073741494

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PIPE_BROKEN => -1073741493

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REGISTRY_CORRUPT => -1073741492

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REGISTRY_IO_FAILED => -1073741491

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_EVENT_PAIR => -1073741490

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNRECOGNIZED_VOLUME => -1073741489

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SERIAL_NO_DEVICE_INITED => -1073741488

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SUCH_ALIAS => -1073741487

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MEMBER_NOT_IN_ALIAS => -1073741486

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MEMBER_IN_ALIAS => -1073741485

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ALIAS_EXISTS => -1073741484

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOGON_NOT_GRANTED => -1073741483

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_SECRETS => -1073741482

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECRET_TOO_LONG => -1073741481

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INTERNAL_DB_ERROR => -1073741480

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FULLSCREEN_MODE => -1073741479

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_CONTEXT_IDS => -1073741478

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_REGISTRY_FILE => -1073741476

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NT_CROSS_ENCRYPTION_REQUIRED => -1073741475

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DOMAIN_CTRLR_CONFIG_ERROR => -1073741474

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FT_MISSING_MEMBER => -1073741473

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ILL_FORMED_SERVICE_ENTRY => -1073741472

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ILLEGAL_CHARACTER => -1073741471

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNMAPPABLE_CHARACTER => -1073741470

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNDEFINED_CHARACTER => -1073741469

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOPPY_VOLUME => -1073741468

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOPPY_ID_MARK_NOT_FOUND => -1073741467

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOPPY_WRONG_CYLINDER => -1073741466

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOPPY_UNKNOWN_ERROR => -1073741465

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOPPY_BAD_REGISTERS => -1073741464

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DISK_RECALIBRATE_FAILED => -1073741463

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DISK_OPERATION_FAILED => -1073741462

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DISK_RESET_FAILED => -1073741461

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SHARED_IRQ_BUSY => -1073741460

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FT_ORPHANING => -1073741459

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BIOS_FAILED_TO_CONNECT_INTERRUPT => -1073741458

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PARTITION_FAILURE => -1073741454

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_BLOCK_LENGTH => -1073741453

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_NOT_PARTITIONED => -1073741452

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNABLE_TO_LOCK_MEDIA => -1073741451

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNABLE_TO_UNLOAD_MEDIA => -1073741450

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EOM_OVERFLOW => -1073741449

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_MEDIA => -1073741448

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SUCH_MEMBER => -1073741446

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_MEMBER => -1073741445

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_KEY_DELETED => -1073741444

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_LOG_SPACE => -1073741443

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_SIDS => -1073741442

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LM_CROSS_ENCRYPTION_REQUIRED => -1073741441

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_KEY_HAS_CHILDREN => -1073741440

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CHILD_MUST_BE_VOLATILE => -1073741439

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_CONFIGURATION_ERROR => -1073741438

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DRIVER_INTERNAL_ERROR => -1073741437

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_DEVICE_STATE => -1073741436

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IO_DEVICE_ERROR => -1073741435

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_PROTOCOL_ERROR => -1073741434

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BACKUP_CONTROLLER => -1073741433

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_FILE_FULL => -1073741432

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_LATE => -1073741431

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_TRUST_LSA_SECRET => -1073741430

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_TRUST_SAM_ACCOUNT => -1073741429

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRUSTED_DOMAIN_FAILURE => -1073741428

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRUSTED_RELATIONSHIP_FAILURE => -1073741427

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EVENTLOG_FILE_CORRUPT => -1073741426

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EVENTLOG_CANT_START => -1073741425

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRUST_FAILURE => -1073741424

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MUTANT_LIMIT_EXCEEDED => -1073741423

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NETLOGON_NOT_STARTED => -1073741422

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_POSSIBLE_DEADLOCK => -1073741420

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NETWORK_CREDENTIAL_CONFLICT => -1073741419

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REMOTE_SESSION_LIMIT => -1073741418

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EVENTLOG_FILE_CHANGED => -1073741417

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT => -1073741416

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOLOGON_WORKSTATION_TRUST_ACCOUNT => -1073741415

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOLOGON_SERVER_TRUST_ACCOUNT => -1073741414

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DOMAIN_TRUST_INCONSISTENT => -1073741413

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FS_DRIVER_REQUIRED => -1073741412

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IMAGE_ALREADY_LOADED_AS_DLL => -1073741411

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INCOMPATIBLE_WITH_GLOBAL_SHORT_NAME_REGISTRY_SETTING => -1073741410

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SHORT_NAMES_NOT_ENABLED_ON_VOLUME => -1073741409

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECURITY_STREAM_IS_INCONSISTENT => -1073741408

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_LOCK_RANGE => -1073741407

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_ACE_CONDITION => -1073741406

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IMAGE_SUBSYSTEM_NOT_PRESENT => -1073741405

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOTIFICATION_GUID_ALREADY_DEFINED => -1073741404

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_EXCEPTION_HANDLER => -1073741403

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DUPLICATE_PRIVILEGES => -1073741402

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_ALLOWED_ON_SYSTEM_FILE => -1073741401

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REPAIR_NEEDED => -1073741400

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUOTA_NOT_ENABLED => -1073741399

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_APPLICATION_PACKAGE => -1073741398

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_METADATA_OPTIMIZATION_IN_PROGRESS => -1073741397

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SAME_OBJECT => -1073741396

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FATAL_MEMORY_EXHAUSTION => -1073741395

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ERROR_PROCESS_NOT_IN_JOB => -1073741394

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CPU_SET_INVALID => -1073741393

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IO_DEVICE_INVALID_DATA => -1073741392

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IO_UNALIGNED_WRITE => -1073741391

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONTROL_STACK_VIOLATION => -1073741390

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WEAK_WHFBKEY_BLOCKED => -1073741389

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SERVER_TRANSPORT_CONFLICT => -1073741388

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CERTIFICATE_VALIDATION_PREFERENCE_CONFLICT => -1073741387

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_RESET_REQUIRED => -2147483210

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NETWORK_OPEN_RESTRICTION => -1073741311

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_USER_SESSION_KEY => -1073741310

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_USER_SESSION_DELETED => -1073741309

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RESOURCE_LANG_NOT_FOUND => -1073741308

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INSUFF_SERVER_RESOURCES => -1073741307

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_BUFFER_SIZE => -1073741306

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_ADDRESS_COMPONENT => -1073741305

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_ADDRESS_WILDCARD => -1073741304

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_ADDRESSES => -1073741303

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ADDRESS_ALREADY_EXISTS => -1073741302

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ADDRESS_CLOSED => -1073741301

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONNECTION_DISCONNECTED => -1073741300

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONNECTION_RESET => -1073741299

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_NODES => -1073741298

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_ABORTED => -1073741297

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_TIMED_OUT => -1073741296

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_NO_RELEASE => -1073741295

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_NO_MATCH => -1073741294

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_RESPONDED => -1073741293

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_INVALID_ID => -1073741292

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_INVALID_TYPE => -1073741291

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SERVER_SESSION => -1073741290

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_CLIENT_SESSION => -1073741289

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANNOT_LOAD_REGISTRY_FILE => -1073741288

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEBUG_ATTACH_FAILED => -1073741287

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_PROCESS_TERMINATED => -1073741286

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DATA_NOT_ACCEPTED => -1073741285

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_BROWSER_SERVERS_FOUND => -1073741284

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VDM_HARD_ERROR => -1073741283

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DRIVER_CANCEL_TIMEOUT => -1073741282

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REPLY_MESSAGE_MISMATCH => -1073741281

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MAPPED_ALIGNMENT => -1073741280

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IMAGE_CHECKSUM_MISMATCH => -1073741279

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOST_WRITEBEHIND_DATA => -1073741278

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLIENT_SERVER_PARAMETERS_INVALID => -1073741277

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_FOUND => -1073741275

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_TINY_STREAM => -1073741274

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RECOVERY_FAILURE => -1073741273

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STACK_OVERFLOW_READ => -1073741272

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FAIL_CHECK => -1073741271

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DUPLICATE_OBJECTID => -1073741270

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OBJECTID_EXISTS => -1073741269

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONVERT_TO_LARGE => -1073741268

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RETRY => -1073741267

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FOUND_OUT_OF_SCOPE => -1073741266

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ALLOCATE_BUCKET => -1073741265

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PROPSET_NOT_FOUND => -1073741264

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MARSHALL_OVERFLOW => -1073741263

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_VARIANT => -1073741262

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DOMAIN_CONTROLLER_NOT_FOUND => -1073741261

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HANDLE_NOT_CLOSABLE => -1073741259

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONNECTION_REFUSED => -1073741258

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRACEFUL_DISCONNECT => -1073741257

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ADDRESS_ALREADY_ASSOCIATED => -1073741256

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ADDRESS_NOT_ASSOCIATED => -1073741255

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONNECTION_INVALID => -1073741254

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONNECTION_ACTIVE => -1073741253

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NETWORK_UNREACHABLE => -1073741252

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HOST_UNREACHABLE => -1073741251

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PROTOCOL_UNREACHABLE => -1073741250

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PORT_UNREACHABLE => -1073741249

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REQUEST_ABORTED => -1073741248

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONNECTION_ABORTED => -1073741247

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_COMPRESSION_BUFFER => -1073741246

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_USER_MAPPED_FILE => -1073741245

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AUDIT_FAILED => -1073741244

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TIMER_RESOLUTION_NOT_SET => -1073741243

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONNECTION_COUNT_LIMIT => -1073741242

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOGIN_TIME_RESTRICTION => -1073741241

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOGIN_WKSTA_RESTRICTION => -1073741240

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IMAGE_MP_UP_MISMATCH => -1073741239

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INSUFFICIENT_LOGON_INFO => -1073741232

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_DLL_ENTRYPOINT => -1073741231

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_SERVICE_ENTRYPOINT => -1073741230

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LPC_REPLY_LOST => -1073741229

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IP_ADDRESS_CONFLICT1 => -1073741228

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IP_ADDRESS_CONFLICT2 => -1073741227

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REGISTRY_QUOTA_LIMIT => -1073741226

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PATH_NOT_COVERED => -1073741225

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_CALLBACK_ACTIVE => -1073741224

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LICENSE_QUOTA_EXCEEDED => -1073741223

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PWD_TOO_SHORT => -1073741222

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PWD_TOO_RECENT => -1073741221

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PWD_HISTORY_CONFLICT => -1073741220

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PLUGPLAY_NO_DEVICE => -1073741218

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNSUPPORTED_COMPRESSION => -1073741217

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_HW_PROFILE => -1073741216

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PLUGPLAY_DEVICE_PATH => -1073741215

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DRIVER_ORDINAL_NOT_FOUND => -1073741214

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DRIVER_ENTRYPOINT_NOT_FOUND => -1073741213

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RESOURCE_NOT_OWNED => -1073741212

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_LINKS => -1073741211

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUOTA_LIST_INCONSISTENT => -1073741210

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_IS_OFFLINE => -1073741209

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EVALUATION_EXPIRATION => -1073741208

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ILLEGAL_DLL_RELOCATION => -1073741207

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LICENSE_VIOLATION => -1073741206

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DLL_INIT_FAILED_LOGOFF => -1073741205

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DRIVER_UNABLE_TO_LOAD => -1073741204

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DFS_UNAVAILABLE => -1073741203

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLUME_DISMOUNTED => -1073741202

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WX86_INTERNAL_ERROR => -1073741201

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WX86_FLOAT_STACK_CHECK => -1073741200

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VALIDATE_CONTINUE => -1073741199

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_MATCH => -1073741198

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_MORE_MATCHES => -1073741197

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_A_REPARSE_POINT => -1073741195

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IO_REPARSE_TAG_INVALID => -1073741194

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IO_REPARSE_TAG_MISMATCH => -1073741193

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IO_REPARSE_DATA_INVALID => -1073741192

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IO_REPARSE_TAG_NOT_HANDLED => -1073741191

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PWD_TOO_LONG => -1073741190

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STOWED_EXCEPTION => -1073741189

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONTEXT_STOWED_EXCEPTION => -1073741188

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REPARSE_POINT_NOT_RESOLVED => -1073741184

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIRECTORY_IS_A_REPARSE_POINT => -1073741183

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RANGE_LIST_CONFLICT => -1073741182

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SOURCE_ELEMENT_EMPTY => -1073741181

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DESTINATION_ELEMENT_FULL => -1073741180

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ILLEGAL_ELEMENT_ADDRESS => -1073741179

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MAGAZINE_NOT_PRESENT => -1073741178

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REINITIALIZATION_NEEDED => -1073741177

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_REQUIRES_CLEANING => -2147483000

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_DOOR_OPEN => -2147482999

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENCRYPTION_FAILED => -1073741174

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DECRYPTION_FAILED => -1073741173

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RANGE_NOT_FOUND => -1073741172

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_RECOVERY_POLICY => -1073741171

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_EFS => -1073741170

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WRONG_EFS => -1073741169

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_USER_KEYS => -1073741168

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_NOT_ENCRYPTED => -1073741167

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_EXPORT_FORMAT => -1073741166

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_ENCRYPTED => -1073741165

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WAKE_SYSTEM => 1073742484

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WMI_GUID_NOT_FOUND => -1073741163

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WMI_INSTANCE_NOT_FOUND => -1073741162

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WMI_ITEMID_NOT_FOUND => -1073741161

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WMI_TRY_AGAIN => -1073741160

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SHARED_POLICY => -1073741159

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_POLICY_OBJECT_NOT_FOUND => -1073741158

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_POLICY_ONLY_IN_DS => -1073741157

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLUME_NOT_UPGRADED => -1073741156

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REMOTE_STORAGE_NOT_ACTIVE => -1073741155

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REMOTE_STORAGE_MEDIA_ERROR => -1073741154

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_TRACKING_SERVICE => -1073741153

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SERVER_SID_MISMATCH => -1073741152

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_NO_ATTRIBUTE_OR_VALUE => -1073741151

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_INVALID_ATTRIBUTE_SYNTAX => -1073741150

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_ATTRIBUTE_TYPE_UNDEFINED => -1073741149

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_ATTRIBUTE_OR_VALUE_EXISTS => -1073741148

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_BUSY => -1073741147

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_UNAVAILABLE => -1073741146

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_NO_RIDS_ALLOCATED => -1073741145

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_NO_MORE_RIDS => -1073741144

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_INCORRECT_ROLE_OWNER => -1073741143

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_RIDMGR_INIT_ERROR => -1073741142

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_OBJ_CLASS_VIOLATION => -1073741141

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_CANT_ON_NON_LEAF => -1073741140

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_CANT_ON_RDN => -1073741139

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_CANT_MOD_OBJ_CLASS => -1073741138

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_CROSS_DOM_MOVE_FAILED => -1073741137

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_GC_NOT_AVAILABLE => -1073741136

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIRECTORY_SERVICE_REQUIRED => -1073741135

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REPARSE_ATTRIBUTE_CONFLICT => -1073741134

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANT_ENABLE_DENY_ONLY => -1073741133

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOAT_MULTIPLE_FAULTS => -1073741132

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOAT_MULTIPLE_TRAPS => -1073741131

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_REMOVED => -1073741130

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_JOURNAL_DELETE_IN_PROGRESS => -1073741129

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_JOURNAL_NOT_ACTIVE => -1073741128

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOINTERFACE => -1073741127

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_RIDMGR_DISABLED => -1073741126

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_ADMIN_LIMIT_EXCEEDED => -1073741119

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DRIVER_FAILED_SLEEP => -1073741118

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MUTUAL_AUTHENTICATION_FAILED => -1073741117

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CORRUPT_SYSTEM_FILE => -1073741116

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DATATYPE_MISALIGNMENT_ERROR => -1073741115

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WMI_READ_ONLY => -1073741114

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WMI_SET_FAILURE => -1073741113

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_COMMITMENT_MINIMUM => -1073741112

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REG_NAT_CONSUMPTION => -1073741111

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSPORT_FULL => -1073741110

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_SAM_INIT_FAILURE => -1073741109

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ONLY_IF_CONNECTED => -1073741108

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_SENSITIVE_GROUP_VIOLATION => -1073741107

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PNP_RESTART_ENUMERATION => -1073741106

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_JOURNAL_ENTRY_DELETED => -1073741105

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_CANT_MOD_PRIMARYGROUPID => -1073741104

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_IMAGE_BAD_SIGNATURE => -1073741103

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PNP_REBOOT_REQUIRED => -1073741102

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_POWER_STATE_INVALID => -1073741101

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_INVALID_GROUP_TYPE => -1073741100

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN => -1073741099

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN => -1073741098

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER => -1073741097

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER => -1073741096

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER => -1073741095

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER => -1073741094

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER => -1073741093

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_HAVE_PRIMARY_MEMBERS => -1073741092

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WMI_NOT_SUPPORTED => -1073741091

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INSUFFICIENT_POWER => -1073741090

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SAM_NEED_BOOTKEY_PASSWORD => -1073741089

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SAM_NEED_BOOTKEY_FLOPPY => -1073741088

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_CANT_START => -1073741087

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_INIT_FAILURE => -1073741086

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SAM_INIT_FAILURE => -1073741085

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_GC_REQUIRED => -1073741084

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_LOCAL_MEMBER_OF_LOCAL_ONLY => -1073741083

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_NO_FPO_IN_UNIVERSAL_GROUPS => -1073741082

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED => -1073741081

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MULTIPLE_FAULT_VIOLATION => -1073741080

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CURRENT_DOMAIN_NOT_ALLOWED => -1073741079

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANNOT_MAKE => -1073741078

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_SHUTDOWN => -1073741077

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_INIT_FAILURE_CONSOLE => -1073741076

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_SAM_INIT_FAILURE_CONSOLE => -1073741075

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNFINISHED_CONTEXT_DELETED => -1073741074

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_TGT_REPLY => -1073741073

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OBJECTID_NOT_FOUND => -1073741072

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_IP_ADDRESSES => -1073741071

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WRONG_CREDENTIAL_HANDLE => -1073741070

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CRYPTO_SYSTEM_INVALID => -1073741069

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MAX_REFERRALS_EXCEEDED => -1073741068

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MUST_BE_KDC => -1073741067

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STRONG_CRYPTO_NOT_SUPPORTED => -1073741066

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_PRINCIPALS => -1073741065

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_PA_DATA => -1073741064

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PKINIT_NAME_MISMATCH => -1073741063

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMARTCARD_LOGON_REQUIRED => -1073741062

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_KDC_INVALID_REQUEST => -1073741061

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_KDC_UNABLE_TO_REFER => -1073741060

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_KDC_UNKNOWN_ETYPE => -1073741059

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SHUTDOWN_IN_PROGRESS => -1073741058

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SERVER_SHUTDOWN_IN_PROGRESS => -1073741057

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED_ON_SBS => -1073741056

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WMI_GUID_DISCONNECTED => -1073741055

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WMI_ALREADY_DISABLED => -1073741054

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WMI_ALREADY_ENABLED => -1073741053

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MFT_TOO_FRAGMENTED => -1073741052

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_COPY_PROTECTION_FAILURE => -1073741051

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CSS_AUTHENTICATION_FAILURE => -1073741050

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CSS_KEY_NOT_PRESENT => -1073741049

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CSS_KEY_NOT_ESTABLISHED => -1073741048

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CSS_SCRAMBLED_SECTOR => -1073741047

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CSS_REGION_MISMATCH => -1073741046

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CSS_RESETS_EXHAUSTED => -1073741045

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PASSWORD_CHANGE_REQUIRED => -1073741044

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOST_MODE_LOGON_RESTRICTION => -1073741043

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PKINIT_FAILURE => -1073741024

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMARTCARD_SUBSYSTEM_FAILURE => -1073741023

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_KERB_KEY => -1073741022

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HOST_DOWN => -1073740976

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNSUPPORTED_PREAUTH => -1073740975

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EFS_ALG_BLOB_TOO_BIG => -1073740974

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PORT_NOT_SET => -1073740973

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEBUGGER_INACTIVE => -1073740972

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_VERSION_CHECK_FAILURE => -1073740971

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AUDITING_DISABLED => -1073740970

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRENT4_MACHINE_ACCOUNT => -1073740969

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_AG_CANT_HAVE_UNIVERSAL_MEMBER => -1073740968

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_IMAGE_WIN_32 => -1073740967

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_IMAGE_WIN_64 => -1073740966

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_BINDINGS => -1073740965

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NETWORK_SESSION_EXPIRED => -1073740964

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPHELP_BLOCK => -1073740963

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ALL_SIDS_FILTERED => -1073740962

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SAFE_MODE_DRIVER => -1073740961

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACCESS_DISABLED_BY_POLICY_DEFAULT => -1073740959

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACCESS_DISABLED_BY_POLICY_PATH => -1073740958

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACCESS_DISABLED_BY_POLICY_PUBLISHER => -1073740957

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACCESS_DISABLED_BY_POLICY_OTHER => -1073740956

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FAILED_DRIVER_ENTRY => -1073740955

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_ENUMERATION_ERROR => -1073740954

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MOUNT_POINT_NOT_RESOLVED => -1073740952

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_DEVICE_OBJECT_PARAMETER => -1073740951

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MCA_OCCURED => -1073740950

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DRIVER_BLOCKED_CRITICAL => -1073740949

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DRIVER_BLOCKED => -1073740948

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DRIVER_DATABASE_ERROR => -1073740947

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_HIVE_TOO_LARGE => -1073740946

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_IMPORT_OF_NON_DLL => -1073740945

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_SHUTTING_DOWN => 1073742704

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SECRETS => -1073740943

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACCESS_DISABLED_NO_SAFER_UI_BY_POLICY => -1073740942

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FAILED_STACK_SWITCH => -1073740941

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HEAP_CORRUPTION => -1073740940

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMARTCARD_WRONG_PIN => -1073740928

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMARTCARD_CARD_BLOCKED => -1073740927

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMARTCARD_CARD_NOT_AUTHENTICATED => -1073740926

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMARTCARD_NO_CARD => -1073740925

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMARTCARD_NO_KEY_CONTAINER => -1073740924

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMARTCARD_NO_CERTIFICATE => -1073740923

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMARTCARD_NO_KEYSET => -1073740922

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMARTCARD_IO_ERROR => -1073740921

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMARTCARD_CERT_REVOKED => -1073740919

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ISSUING_CA_UNTRUSTED => -1073740918

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REVOCATION_OFFLINE_C => -1073740917

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PKINIT_CLIENT_FAILURE => -1073740916

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMARTCARD_CERT_EXPIRED => -1073740915

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DRIVER_FAILED_PRIOR_UNLOAD => -1073740914

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMARTCARD_SILENT_CONTEXT => -1073740913

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PER_USER_TRUST_QUOTA_EXCEEDED => -1073740799

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ALL_USER_TRUST_QUOTA_EXCEEDED => -1073740798

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_USER_DELETE_TRUST_QUOTA_EXCEEDED => -1073740797

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_NAME_NOT_UNIQUE => -1073740796

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_DUPLICATE_ID_FOUND => -1073740795

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_GROUP_CONVERSION_ERROR => -1073740794

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLSNAP_PREPARE_HIBERNATE => -1073740793

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_USER2USER_REQUIRED => -1073740792

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STACK_BUFFER_OVERRUN => -1073740791

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_S4U_PROT_SUPPORT => -1073740790

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CROSSREALM_DELEGATION_FAILURE => -1073740789

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REVOCATION_OFFLINE_KDC => -1073740788

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ISSUING_CA_UNTRUSTED_KDC => -1073740787

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_KDC_CERT_EXPIRED => -1073740786

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_KDC_CERT_REVOKED => -1073740785

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PARAMETER_QUOTA_EXCEEDED => -1073740784

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HIBERNATION_FAILURE => -1073740783

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DELAY_LOAD_FAILED => -1073740782

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VDM_DISALLOWED => -1073740780

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HUNG_DISPLAY_DRIVER_THREAD => -1073740779

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INSUFFICIENT_RESOURCE_FOR_SPECIFIED_SHARED_SECTION_SIZE => -1073740778

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_CRUNTIME_PARAMETER => -1073740777

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NTLM_BLOCKED => -1073740776

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_SRC_SID_EXISTS_IN_FOREST => -1073740775

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_DOMAIN_NAME_EXISTS_IN_FOREST => -1073740774

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_FLAT_NAME_EXISTS_IN_FOREST => -1073740773

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_USER_PRINCIPAL_NAME => -1073740772

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FATAL_USER_CALLBACK_EXCEPTION => -1073740771

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ASSERTION_FAILURE => -1073740768

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VERIFIER_STOP => -1073740767

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CALLBACK_POP_STACK => -1073740765

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INCOMPATIBLE_DRIVER_BLOCKED => -1073740764

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HIVE_UNLOADED => -1073740763

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_COMPRESSION_DISABLED => -1073740762

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_SYSTEM_LIMITATION => -1073740761

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_IMAGE_HASH => -1073740760

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_CAPABLE => -1073740759

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REQUEST_OUT_OF_SEQUENCE => -1073740758

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IMPLEMENTATION_LIMIT => -1073740757

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ELEVATION_REQUIRED => -1073740756

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SECURITY_CONTEXT => -1073740755

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PKU2U_CERT_FAILURE => -1073740753

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BEYOND_VDL => -1073740750

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENCOUNTERED_WRITE_IN_PROGRESS => -1073740749

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PTE_CHANGED => -1073740748

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PURGE_FAILED => -1073740747

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CRED_REQUIRES_CONFIRMATION => -1073740736

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CS_ENCRYPTION_INVALID_SERVER_RESPONSE => -1073740735

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CS_ENCRYPTION_UNSUPPORTED_SERVER => -1073740734

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CS_ENCRYPTION_EXISTING_ENCRYPTED_FILE => -1073740733

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CS_ENCRYPTION_NEW_ENCRYPTED_FILE => -1073740732

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CS_ENCRYPTION_FILE_NOT_CSE => -1073740731

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_LABEL => -1073740730

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DRIVER_PROCESS_TERMINATED => -1073740720

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AMBIGUOUS_SYSTEM_DEVICE => -1073740719

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_DEVICE_NOT_FOUND => -1073740718

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RESTART_BOOT_APPLICATION => -1073740717

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INSUFFICIENT_NVRAM_RESOURCES => -1073740716

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_SESSION => -1073740715

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_THREAD_ALREADY_IN_SESSION => -1073740714

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_THREAD_NOT_IN_SESSION => -1073740713

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_WEIGHT => -1073740712

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REQUEST_PAUSED => -1073740711

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_RANGES_PROCESSED => -1073740704

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DISK_RESOURCES_EXHAUSTED => -1073740703

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NEEDS_REMEDIATION => -1073740702

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_FEATURE_NOT_SUPPORTED => -1073740701

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_UNREACHABLE => -1073740700

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_TOKEN => -1073740699

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SERVER_UNAVAILABLE => -1073740698

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_NOT_AVAILABLE => -1073740697

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_INSUFFICIENT_RESOURCES => -1073740696

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PACKAGE_UPDATING => -1073740695

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_READ_FROM_COPY => -1073740694

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FT_WRITE_FAILURE => -1073740693

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FT_DI_SCAN_REQUIRED => -1073740692

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OBJECT_NOT_EXTERNALLY_BACKED => -1073740691

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EXTERNAL_BACKING_PROVIDER_UNKNOWN => -1073740690

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_COMPRESSION_NOT_BENEFICIAL => -1073740689

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DATA_CHECKSUM_ERROR => -1073740688

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INTERMIXED_KERNEL_EA_OPERATION => -1073740687

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRIM_READ_ZERO_NOT_SUPPORTED => -1073740686

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TOO_MANY_SEGMENT_DESCRIPTORS => -1073740685

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_OFFSET_ALIGNMENT => -1073740684

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_FIELD_IN_PARAMETER_LIST => -1073740683

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OPERATION_IN_PROGRESS => -1073740682

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_INITIATOR_TARGET_PATH => -1073740681

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SCRUB_DATA_DISABLED => -1073740680

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_REDUNDANT_STORAGE => -1073740679

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RESIDENT_FILE_NOT_SUPPORTED => -1073740678

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_COMPRESSED_FILE_NOT_SUPPORTED => -1073740677

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIRECTORY_NOT_SUPPORTED => -1073740676

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IO_OPERATION_TIMEOUT => -1073740675

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_NEEDS_REMEDIATION => -1073740674

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPX_INTEGRITY_FAILURE_CLR_NGEN => -1073740673

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SHARE_UNAVAILABLE => -1073740672

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APISET_NOT_HOSTED => -1073740671

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APISET_NOT_PRESENT => -1073740670

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_HARDWARE_ERROR => -1073740669

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FIRMWARE_SLOT_INVALID => -1073740668

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FIRMWARE_IMAGE_INVALID => -1073740667

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STORAGE_TOPOLOGY_ID_MISMATCH => -1073740666

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WIM_NOT_BOOTABLE => -1073740665

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BLOCKED_BY_PARENTAL_CONTROLS => -1073740664

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NEEDS_REGISTRATION => -1073740663

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUOTA_ACTIVITY => -1073740662

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CALLBACK_INVOKE_INLINE => -1073740661

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BLOCK_TOO_MANY_REFERENCES => -1073740660

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MARKED_TO_DISALLOW_WRITES => -1073740659

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NETWORK_ACCESS_DENIED_EDP => -1073740658

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENCLAVE_FAILURE => -1073740657

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PNP_NO_COMPAT_DRIVERS => -1073740656

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PNP_DRIVER_PACKAGE_NOT_FOUND => -1073740655

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PNP_DRIVER_CONFIGURATION_NOT_FOUND => -1073740654

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PNP_DRIVER_CONFIGURATION_INCOMPLETE => -1073740653

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PNP_FUNCTION_DRIVER_REQUIRED => -1073740652

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PNP_DEVICE_CONFIGURATION_PENDING => -1073740651

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_HINT_NAME_BUFFER_TOO_SMALL => -1073740650

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PACKAGE_NOT_AVAILABLE => -1073740649

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_IN_MAINTENANCE => -1073740647

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED_ON_DAX => -1073740646

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FREE_SPACE_TOO_FRAGMENTED => -1073740645

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DAX_MAPPING_EXISTS => -1073740644

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CHILD_PROCESS_BLOCKED => -1073740643

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STORAGE_LOST_DATA_PERSISTENCE => -1073740642

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PARTITION_TERMINATING => -1073740640

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EXTERNAL_SYSKEY_NOT_SUPPORTED => -1073740639

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENCLAVE_VIOLATION => -1073740638

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_PROTECTED_UNDER_DPL => -1073740637

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLUME_NOT_CLUSTER_ALIGNED => -1073740636

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_PHYSICALLY_ALIGNED_FREE_SPACE_FOUND => -1073740635

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPX_FILE_NOT_ENCRYPTED => -1073740634

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RWRAW_ENCRYPTED_FILE_NOT_ENCRYPTED => -1073740633

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILEOFFSET => -1073740632

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILERANGE => -1073740631

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RWRAW_ENCRYPTED_INVALID_EDATAINFO_PARAMETER => -1073740630

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FT_READ_FAILURE => -1073740629

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PATCH_CONFLICT => -1073740628

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STORAGE_RESERVE_ID_INVALID => -1073740627

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STORAGE_RESERVE_DOES_NOT_EXIST => -1073740626

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STORAGE_RESERVE_ALREADY_EXISTS => -1073740625

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STORAGE_RESERVE_NOT_EMPTY => -1073740624

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_A_DAX_VOLUME => -1073740623

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_DAX_MAPPABLE => -1073740622

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CASE_DIFFERING_NAMES_IN_DIR => -1073740621

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_NOT_SUPPORTED => -1073740620

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED_WITH_BTT => -1073740619

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENCRYPTION_DISABLED => -1073740618

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENCRYPTING_METADATA_DISALLOWED => -1073740617

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANT_CLEAR_ENCRYPTION_FLAG => -1073740616

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNSATISFIED_DEPENDENCIES => -1073740615

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CASE_SENSITIVE_PATH => -1073740614

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNSUPPORTED_PAGING_MODE => -1073740613

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNTRUSTED_MOUNT_POINT => -1073740612

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HAS_SYSTEM_CRITICAL_FILES => -1073740611

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OBJECT_IS_IMMUTABLE => -1073740610

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FT_READ_FROM_COPY_FAILURE => -1073740609

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IMAGE_LOADED_AS_PATCH_IMAGE => -1073740608

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STORAGE_STACK_ACCESS_DENIED => -1073740607

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INSUFFICIENT_VIRTUAL_ADDR_RESOURCES => -1073740606

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENCRYPTED_FILE_NOT_SUPPORTED => -1073740605

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPARSE_FILE_NOT_SUPPORTED => -1073740604

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PAGEFILE_NOT_SUPPORTED => -1073740603

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLUME_NOT_SUPPORTED => -1073740602

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED_WITH_BYPASSIO => -1073740601

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_BYPASSIO_DRIVER_SUPPORT => -1073740600

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED_WITH_ENCRYPTION => -1073740599

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED_WITH_COMPRESSION => -1073740598

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED_WITH_REPLICATION => -1073740597

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED_WITH_DEDUPLICATION => -1073740596

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED_WITH_AUDITING => -1073740595

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED_WITH_MONITORING => -1073740594

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED_WITH_SNAPSHOT => -1073740593

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED_WITH_VIRTUALIZATION => -1073740592

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INDEX_OUT_OF_BOUNDS => -1073740591

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BYPASSIO_FLT_NOT_SUPPORTED => -1073740590

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLUME_WRITE_ACCESS_DENIED => -1073740589

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PATCH_NOT_REGISTERED => -1073740588

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED_WITH_CACHED_HANDLE => -1073740587

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PDE_ENCRYPTION_UNAVAILABLE_FAILURE => -1073740586

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PDE_DECRYPTION_UNAVAILABLE_FAILURE => -1073740585

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PDE_DECRYPTION_UNAVAILABLE => -1073740584

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLUME_UPGRADE_NOT_NEEDED => 1073743065

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLUME_UPGRADE_PENDING => 1073743066

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLUME_UPGRADE_DISABLED => -1073740581

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLUME_UPGRADE_DISABLED_TILL_OS_DOWNGRADE_EXPIRED => -1073740580

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_A_DEV_VOLUME => -1073740579

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FS_GUID_MISMATCH => -1073740578

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANT_ATTACH_TO_DEV_VOLUME => -1073740577

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MEMORY_DECOMPRESSION_FAILURE => -1073740576

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_CONFIG_VALUE => -1073740575

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MEMORY_DECOMPRESSION_HW_ERROR => -1073740574

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLUME_ROLLBACK_DETECTED => -1073740573

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_TASK_NAME => -1073740544

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_TASK_INDEX => -1073740543

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_THREAD_ALREADY_IN_TASK => -1073740542

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CALLBACK_BYPASS => -1073740541

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNDEFINED_SCOPE => -1073740540

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_CAP => -1073740539

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_GUI_PROCESS => -1073740538

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_HUNG => -1073740537

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONTAINER_ASSIGNED => -1073740536

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_JOB_NO_CONTAINER => -1073740535

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DEVICE_UNRESPONSIVE => -1073740534

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REPARSE_POINT_ENCOUNTERED => -1073740533

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ATTRIBUTE_NOT_PRESENT => -1073740532

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_A_TIERED_VOLUME => -1073740531

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ALREADY_HAS_STREAM_ID => -1073740530

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_JOB_NOT_EMPTY => -1073740529

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ALREADY_INITIALIZED => -1073740528

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENCLAVE_NOT_TERMINATED => -1073740527

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENCLAVE_IS_TERMINATING => -1073740526

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMB1_NOT_AVAILABLE => -1073740525

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMR_GARBAGE_COLLECTION_REQUIRED => -1073740524

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INTERRUPTED => -1073740523

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_THREAD_NOT_RUNNING => -1073740522

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SESSION_KEY_TOO_SHORT => -1073740521

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FS_METADATA_INCONSISTENT => -1073740520

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FAIL_FAST_EXCEPTION => -1073740286

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IMAGE_CERT_REVOKED => -1073740285

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DYNAMIC_CODE_BLOCKED => -1073740284

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IMAGE_CERT_EXPIRED => -1073740283

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STRICT_CFG_VIOLATION => -1073740282

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SET_CONTEXT_DENIED => -1073740278

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CROSS_PARTITION_VIOLATION => -1073740277

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PORT_CLOSED => -1073740032

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MESSAGE_LOST => -1073740031

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_MESSAGE => -1073740030

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REQUEST_CANCELED => -1073740029

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RECURSIVE_DISPATCH => -1073740028

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LPC_RECEIVE_BUFFER_EXPECTED => -1073740027

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LPC_INVALID_CONNECTION_USAGE => -1073740026

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LPC_REQUESTS_NOT_ALLOWED => -1073740025

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RESOURCE_IN_USE => -1073740024

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HARDWARE_MEMORY_ERROR => -1073740023

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_THREADPOOL_HANDLE_EXCEPTION => -1073740022

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_THREADPOOL_SET_EVENT_ON_COMPLETION_FAILED => -1073740021

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_THREADPOOL_RELEASE_SEMAPHORE_ON_COMPLETION_FAILED => -1073740020

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_THREADPOOL_RELEASE_MUTEX_ON_COMPLETION_FAILED => -1073740019

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_THREADPOOL_FREE_LIBRARY_ON_COMPLETION_FAILED => -1073740018

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_THREADPOOL_RELEASED_DURING_OPERATION => -1073740017

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CALLBACK_RETURNED_WHILE_IMPERSONATING => -1073740016

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APC_RETURNED_WHILE_IMPERSONATING => -1073740015

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PROCESS_IS_PROTECTED => -1073740014

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MCA_EXCEPTION => -1073740013

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CERTIFICATE_MAPPING_NOT_UNIQUE => -1073740012

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYMLINK_CLASS_DISABLED => -1073740011

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_IDN_NORMALIZATION => -1073740010

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_UNICODE_TRANSLATION => -1073740009

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ALREADY_REGISTERED => -1073740008

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONTEXT_MISMATCH => -1073740007

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PORT_ALREADY_HAS_COMPLETION_LIST => -1073740006

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CALLBACK_RETURNED_THREAD_PRIORITY => -1073740005

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_THREAD => -1073740004

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CALLBACK_RETURNED_TRANSACTION => -1073740003

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CALLBACK_RETURNED_LDR_LOCK => -1073740002

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CALLBACK_RETURNED_LANG => -1073740001

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CALLBACK_RETURNED_PRI_BACK => -1073740000

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CALLBACK_RETURNED_THREAD_AFFINITY => -1073739999

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LPC_HANDLE_COUNT_EXCEEDED => -1073739998

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EXECUTABLE_MEMORY_WRITE => -1073739997

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_KERNEL_EXECUTABLE_MEMORY_WRITE => -1073739996

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ATTACHED_EXECUTABLE_MEMORY_WRITE => -1073739995

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRIGGERED_EXECUTABLE_MEMORY_WRITE => -1073739994

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DISK_REPAIR_DISABLED => -1073739776

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_DOMAIN_RENAME_IN_PROGRESS => -1073739775

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DISK_QUOTA_EXCEEDED => -1073739774

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DATA_LOST_REPAIR => -2147481597

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CONTENT_BLOCKED => -1073739772

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_CLUSTERS => -1073739771

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLUME_DIRTY => -1073739770

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DISK_REPAIR_REDIRECTED => 1073743879

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DISK_REPAIR_UNSUCCESSFUL => -1073739768

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CORRUPT_LOG_OVERFULL => -1073739767

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CORRUPT_LOG_CORRUPTED => -1073739766

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CORRUPT_LOG_UNAVAILABLE => -1073739765

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CORRUPT_LOG_DELETED_FULL => -1073739764

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CORRUPT_LOG_CLEARED => -1073739763

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ORPHAN_NAME_EXHAUSTED => -1073739762

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PROACTIVE_SCAN_IN_PROGRESS => -1073739761

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENCRYPTED_IO_NOT_POSSIBLE => -1073739760

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CORRUPT_LOG_UPLEVEL_RECORDS => -1073739759

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_CHECKED_OUT => -1073739519

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CHECKOUT_REQUIRED => -1073739518

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_FILE_TYPE => -1073739517

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_TOO_LARGE => -1073739516

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FORMS_AUTH_REQUIRED => -1073739515

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VIRUS_INFECTED => -1073739514

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VIRUS_DELETED => -1073739513

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_MCFG_TABLE => -1073739512

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANNOT_BREAK_OPLOCK => -1073739511

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_KEY => -1073739510

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BAD_DATA => -1073739509

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_KEY => -1073739508

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_HANDLE_REVOKED => -1073739504

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECTION_DIRECT_MAP_ONLY => -1073739503

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BLOCK_WEAK_REFERENCE_INVALID => -1073739502

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BLOCK_SOURCE_WEAK_REFERENCE_INVALID => -1073739501

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BLOCK_TARGET_WEAK_REFERENCE_INVALID => -1073739500

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BLOCK_SHARED => -1073739499

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VRF_VOLATILE_CFG_AND_IO_ENABLED => -1073738744

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VRF_VOLATILE_NOT_STOPPABLE => -1073738743

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VRF_VOLATILE_SAFE_MODE => -1073738742

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VRF_VOLATILE_NOT_RUNNABLE_SYSTEM => -1073738741

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VRF_VOLATILE_NOT_SUPPORTED_RULECLASS => -1073738740

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VRF_VOLATILE_PROTECTED_DRIVER => -1073738739

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VRF_VOLATILE_NMI_REGISTERED => -1073738738

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VRF_VOLATILE_SETTINGS_CONFLICT => -1073738737

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CAR_LKD_IN_PROGRESS => -1073738736

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIF_ZERO_SIZE_INFORMATION => -1073738637

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIF_DRIVER_PLUGIN_MISMATCH => -1073738636

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIF_DRIVER_THUNKS_NOT_ALLOWED => -1073738635

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIF_IOCALLBACK_NOT_REPLACED => -1073738634

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIF_LIVEDUMP_LIMIT_EXCEEDED => -1073738633

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIF_VOLATILE_SECTION_NOT_LOCKED => -1073738632

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIF_VOLATILE_DRIVER_HOTPATCHED => -1073738631

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIF_VOLATILE_INVALID_INFO => -1073738630

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIF_VOLATILE_DRIVER_IS_NOT_RUNNING => -1073738629

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIF_VOLATILE_PLUGIN_IS_NOT_RUNNING => -1073738628

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIF_VOLATILE_PLUGIN_CHANGE_NOT_ALLOWED => -1073738627

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIF_VOLATILE_NOT_ALLOWED => -1073738626

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIF_BINDING_API_NOT_FOUND => -1073738625

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WOW_ASSERTION => -1073702760

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_SIGNATURE => -1073700864

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HMAC_NOT_SUPPORTED => -1073700863

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AUTH_TAG_MISMATCH => -1073700862

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_STATE_TRANSITION => -1073700861

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_KERNEL_INFO_VERSION => -1073700860

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PEP_INFO_VERSION => -1073700859

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HANDLE_REVOKED => -1073700858

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EOF_ON_GHOSTED_RANGE => -1073700857

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CC_NEEDS_CALLBACK_SECTION_DRAIN => -1073700856

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_QUEUE_OVERFLOW => -1073700848

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ND_QUEUE_OVERFLOW => -1073700847

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HOPLIMIT_EXCEEDED => -1073700846

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PROTOCOL_NOT_SUPPORTED => -1073700845

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FASTPATH_REJECTED => -1073700844

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOST_WRITEBEHIND_DATA_NETWORK_DISCONNECTED => -1073700736

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOST_WRITEBEHIND_DATA_NETWORK_SERVER_ERROR => -1073700735

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOST_WRITEBEHIND_DATA_LOCAL_DISK_ERROR => -1073700734

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_XML_PARSE_ERROR => -1073700733

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_XMLDSIG_ERROR => -1073700732

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WRONG_COMPARTMENT => -1073700731

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AUTHIP_FAILURE => -1073700730

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_OID_MAPPED_GROUP_CANT_HAVE_MEMBERS => -1073700729

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_OID_NOT_FOUND => -1073700728

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INCORRECT_ACCOUNT_TYPE => -1073700727

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOCAL_POLICY_MODIFICATION_NOT_SUPPORTED => -1073700726

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_POLICY_CONTROLLED_ACCOUNT => -1073700725

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LAPS_LEGACY_SCHEMA_MISSING => -1073700724

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LAPS_SCHEMA_MISSING => -1073700723

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LAPS_ENCRYPTION_REQUIRES_2016_DFL => -1073700722

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LAPS_PROCESS_TERMINATED => -2147442545

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_JET_RECORD_TOO_BIG => -1073700720

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DS_REPLICA_PAGE_SIZE_MISMATCH => -1073700719

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HASH_NOT_SUPPORTED => -1073700608

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HASH_NOT_PRESENT => -1073700607

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECONDARY_IC_PROVIDER_NOT_REGISTERED => -1073700575

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GPIO_CLIENT_INFORMATION_INVALID => -1073700574

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GPIO_VERSION_NOT_SUPPORTED => -1073700573

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GPIO_INVALID_REGISTRATION_PACKET => -1073700572

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GPIO_OPERATION_DENIED => -1073700571

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GPIO_INCOMPATIBLE_CONNECT_MODE => -1073700570

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GPIO_INTERRUPT_ALREADY_UNMASKED => -2147442393

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANNOT_SWITCH_RUNLEVEL => -1073700543

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_RUNLEVEL_SETTING => -1073700542

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RUNLEVEL_SWITCH_TIMEOUT => -1073700541

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SERVICES_FAILED_AUTOSTART => 1073783108

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RUNLEVEL_SWITCH_AGENT_TIMEOUT => -1073700539

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RUNLEVEL_SWITCH_IN_PROGRESS => -1073700538

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APISET_COMPOSE_FAILURE => -1073700511

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_APPCONTAINER => -1073700352

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SUPPORTED_IN_APPCONTAINER => -1073700351

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_PACKAGE_SID_LENGTH => -1073700350

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LPAC_ACCESS_DENIED => -1073700349

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ADMINLESS_ACCESS_DENIED => -1073700348

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APP_DATA_NOT_FOUND => -1073700223

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APP_DATA_EXPIRED => -1073700222

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APP_DATA_CORRUPT => -1073700221

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APP_DATA_LIMIT_EXCEEDED => -1073700220

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APP_DATA_REBOOT_REQUIRED => -1073700219

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OFFLOAD_READ_FLT_NOT_SUPPORTED => -1073700191

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OFFLOAD_WRITE_FLT_NOT_SUPPORTED => -1073700190

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OFFLOAD_READ_FILE_NOT_SUPPORTED => -1073700189

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OFFLOAD_WRITE_FILE_NOT_SUPPORTED => -1073700188

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WOF_WIM_HEADER_CORRUPT => -1073700187

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WOF_WIM_RESOURCE_TABLE_CORRUPT => -1073700186

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_WOF_FILE_RESOURCE_TABLE_CORRUPT => -1073700185

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CIMFS_IMAGE_CORRUPT => -1073692671

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CIMFS_IMAGE_VERSION_NOT_SUPPORTED => -1073692670

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_SYSTEM_VIRTUALIZATION_UNAVAILABLE => -1073689087

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_SYSTEM_VIRTUALIZATION_METADATA_CORRUPT => -1073689086

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_SYSTEM_VIRTUALIZATION_BUSY => -1073689085

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_SYSTEM_VIRTUALIZATION_PROVIDER_UNKNOWN => -1073689084

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_SYSTEM_VIRTUALIZATION_INVALID_OPERATION => -1073689083

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_SYNC_ROOT_METADATA_CORRUPT => -1073688832

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_PROVIDER_NOT_RUNNING => -1073688831

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_METADATA_CORRUPT => -1073688830

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_METADATA_TOO_LARGE => -1073688829

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_PROPERTY_BLOB_TOO_LARGE => -2147430652

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_TOO_MANY_PROPERTY_BLOBS => -2147430651

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_PROPERTY_VERSION_NOT_SUPPORTED => -1073688826

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_A_CLOUD_FILE => -1073688825

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_NOT_IN_SYNC => -1073688824

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_ALREADY_CONNECTED => -1073688823

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_NOT_SUPPORTED => -1073688822

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_INVALID_REQUEST => -1073688821

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_READ_ONLY_VOLUME => -1073688820

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_CONNECTED_PROVIDER_ONLY => -1073688819

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_VALIDATION_FAILED => -1073688818

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_AUTHENTICATION_FAILED => -1073688817

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_INSUFFICIENT_RESOURCES => -1073688816

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_NETWORK_UNAVAILABLE => -1073688815

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_UNSUCCESSFUL => -1073688814

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_NOT_UNDER_SYNC_ROOT => -1073688813

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_IN_USE => -1073688812

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_PINNED => -1073688811

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_REQUEST_ABORTED => -1073688810

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_PROPERTY_CORRUPT => -1073688809

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_ACCESS_DENIED => -1073688808

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_INCOMPATIBLE_HARDLINKS => -1073688807

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_PROPERTY_LOCK_CONFLICT => -1073688806

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_REQUEST_CANCELED => -1073688805

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_PROVIDER_TERMINATED => -1073688803

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_A_CLOUD_SYNC_ROOT => -1073688802

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_REQUEST_TIMEOUT => -1073688801

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_DEHYDRATION_DISALLOWED => -1073688800

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_US_MESSAGE_TIMEOUT => -1073688799

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLOUD_FILE_HYDRATION_NOT_AVAILABLE => -1073688798

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_SNAP_IN_PROGRESS => -1073679104

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_SNAP_USER_SECTION_NOT_SUPPORTED => -1073679103

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_SNAP_MODIFY_NOT_SUPPORTED => -1073679102

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_SNAP_IO_NOT_COORDINATED => -1073679101

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_SNAP_UNEXPECTED_ERROR => -1073679100

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_SNAP_INVALID_PARAMETER => -1073679099

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNIONFS_CANNOT_CROSS_UNION => -1058209791

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNIONFS_CANNOT_EXIT_UNION => -1058209790

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNIONFS_CANNOT_PRESERVE_LINK => -1058209789

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNIONFS_INVALID_TOMBSTONE_STATE => -1058209788

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNIONFS_LAYERS_PRESENT => -1058209787

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNIONFS_NESTED_LAYER => -1058209786

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNIONFS_UNION_DUPLICATE_ID => -1058209785

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNIONFS_INACTIVE_UNION => -1058209784

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNIONFS_TOO_MANY_LAYERS => -1058209783

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNIONFS_TOO_LATE => -1058209782

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNIONFS_NESTED_UNION => -1058209781

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNIONFS_NESTED_UNION_NOT_ALLOWED => -1058209780

    /**
     * @type {Integer (Int32)}
     */
    static DBG_NO_STATE_CHANGE => -1073676287

    /**
     * @type {Integer (Int32)}
     */
    static DBG_APP_NOT_IDLE => -1073676286

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_STRING_BINDING => -1073610751

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_WRONG_KIND_OF_BINDING => -1073610750

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_BINDING => -1073610749

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_PROTSEQ_NOT_SUPPORTED => -1073610748

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_RPC_PROTSEQ => -1073610747

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_STRING_UUID => -1073610746

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_ENDPOINT_FORMAT => -1073610745

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_NET_ADDR => -1073610744

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NO_ENDPOINT_FOUND => -1073610743

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_TIMEOUT => -1073610742

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_OBJECT_NOT_FOUND => -1073610741

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_ALREADY_REGISTERED => -1073610740

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_TYPE_ALREADY_REGISTERED => -1073610739

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_ALREADY_LISTENING => -1073610738

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NO_PROTSEQS_REGISTERED => -1073610737

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NOT_LISTENING => -1073610736

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_UNKNOWN_MGR_TYPE => -1073610735

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_UNKNOWN_IF => -1073610734

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NO_BINDINGS => -1073610733

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NO_PROTSEQS => -1073610732

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_CANT_CREATE_ENDPOINT => -1073610731

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_OUT_OF_RESOURCES => -1073610730

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_SERVER_UNAVAILABLE => -1073610729

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_SERVER_TOO_BUSY => -1073610728

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_NETWORK_OPTIONS => -1073610727

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NO_CALL_ACTIVE => -1073610726

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_CALL_FAILED => -1073610725

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_CALL_FAILED_DNE => -1073610724

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_PROTOCOL_ERROR => -1073610723

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_UNSUPPORTED_TRANS_SYN => -1073610721

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_UNSUPPORTED_TYPE => -1073610719

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_TAG => -1073610718

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_BOUND => -1073610717

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NO_ENTRY_NAME => -1073610716

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_NAME_SYNTAX => -1073610715

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_UNSUPPORTED_NAME_SYNTAX => -1073610714

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_UUID_NO_ADDRESS => -1073610712

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_DUPLICATE_ENDPOINT => -1073610711

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_UNKNOWN_AUTHN_TYPE => -1073610710

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_MAX_CALLS_TOO_SMALL => -1073610709

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_STRING_TOO_LONG => -1073610708

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_PROTSEQ_NOT_FOUND => -1073610707

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_PROCNUM_OUT_OF_RANGE => -1073610706

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_BINDING_HAS_NO_AUTH => -1073610705

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_UNKNOWN_AUTHN_SERVICE => -1073610704

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_UNKNOWN_AUTHN_LEVEL => -1073610703

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_AUTH_IDENTITY => -1073610702

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_UNKNOWN_AUTHZ_SERVICE => -1073610701

    /**
     * @type {Integer (Int32)}
     */
    static EPT_NT_INVALID_ENTRY => -1073610700

    /**
     * @type {Integer (Int32)}
     */
    static EPT_NT_CANT_PERFORM_OP => -1073610699

    /**
     * @type {Integer (Int32)}
     */
    static EPT_NT_NOT_REGISTERED => -1073610698

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NOTHING_TO_EXPORT => -1073610697

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INCOMPLETE_NAME => -1073610696

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_VERS_OPTION => -1073610695

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NO_MORE_MEMBERS => -1073610694

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NOT_ALL_OBJS_UNEXPORTED => -1073610693

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INTERFACE_NOT_FOUND => -1073610692

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_ENTRY_ALREADY_EXISTS => -1073610691

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_ENTRY_NOT_FOUND => -1073610690

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NAME_SERVICE_UNAVAILABLE => -1073610689

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_NAF_ID => -1073610688

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_CANNOT_SUPPORT => -1073610687

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NO_CONTEXT_AVAILABLE => -1073610686

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INTERNAL_ERROR => -1073610685

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_ZERO_DIVIDE => -1073610684

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_ADDRESS_ERROR => -1073610683

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_FP_DIV_ZERO => -1073610682

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_FP_UNDERFLOW => -1073610681

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_FP_OVERFLOW => -1073610680

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NO_MORE_ENTRIES => -1073545215

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_SS_CHAR_TRANS_OPEN_FAIL => -1073545214

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_SS_CHAR_TRANS_SHORT_FILE => -1073545213

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_SS_IN_NULL_CONTEXT => -1073545212

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_SS_CONTEXT_MISMATCH => -1073545211

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_SS_CONTEXT_DAMAGED => -1073545210

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_SS_HANDLES_MISMATCH => -1073545209

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_SS_CANNOT_GET_CALL_HANDLE => -1073545208

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NULL_REF_POINTER => -1073545207

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_ENUM_VALUE_OUT_OF_RANGE => -1073545206

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_BYTE_COUNT_TOO_SMALL => -1073545205

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_BAD_STUB_DATA => -1073545204

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_CALL_IN_PROGRESS => -1073610679

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NO_MORE_BINDINGS => -1073610678

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_GROUP_MEMBER_NOT_FOUND => -1073610677

    /**
     * @type {Integer (Int32)}
     */
    static EPT_NT_CANT_CREATE => -1073610676

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_OBJECT => -1073610675

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NO_INTERFACES => -1073610673

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_CALL_CANCELLED => -1073610672

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_BINDING_INCOMPLETE => -1073610671

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_COMM_FAILURE => -1073610670

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_UNSUPPORTED_AUTHN_LEVEL => -1073610669

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NO_PRINC_NAME => -1073610668

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NOT_RPC_ERROR => -1073610667

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_UUID_LOCAL_ONLY => 1073872982

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_SEC_PKG_ERROR => -1073610665

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_NOT_CANCELLED => -1073610664

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_ES_ACTION => -1073545127

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_WRONG_ES_VERSION => -1073545126

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_WRONG_STUB_VERSION => -1073545125

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_PIPE_OBJECT => -1073545124

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_PIPE_OPERATION => -1073545123

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_WRONG_PIPE_VERSION => -1073545122

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_PIPE_CLOSED => -1073545121

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_PIPE_DISCIPLINE_ERROR => -1073545120

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_PIPE_EMPTY => -1073545119

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_ASYNC_HANDLE => -1073610654

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_INVALID_ASYNC_CALL => -1073610653

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_PROXY_ACCESS_DENIED => -1073610652

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_COOKIE_AUTH_FAILED => -1073610651

    /**
     * @type {Integer (Int32)}
     */
    static RPC_NT_SEND_INCOMPLETE => 1073873071

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_INVALID_OPCODE => -1072431103

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_STACK_OVERFLOW => -1072431102

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_ASSERT_FAILED => -1072431101

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_INVALID_INDEX => -1072431100

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_INVALID_ARGUMENT => -1072431099

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_FATAL => -1072431098

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_INVALID_SUPERNAME => -1072431097

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_INVALID_ARGTYPE => -1072431096

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_INVALID_OBJTYPE => -1072431095

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_INVALID_TARGETTYPE => -1072431094

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_INCORRECT_ARGUMENT_COUNT => -1072431093

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_ADDRESS_NOT_MAPPED => -1072431092

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_INVALID_EVENTTYPE => -1072431091

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_HANDLER_COLLISION => -1072431090

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_INVALID_DATA => -1072431089

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_INVALID_REGION => -1072431088

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_INVALID_ACCESS_SIZE => -1072431087

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_ACQUIRE_GLOBAL_LOCK => -1072431086

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_ALREADY_INITIALIZED => -1072431085

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_NOT_INITIALIZED => -1072431084

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_INVALID_MUTEX_LEVEL => -1072431083

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_MUTEX_NOT_OWNED => -1072431082

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_MUTEX_NOT_OWNER => -1072431081

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_RS_ACCESS => -1072431080

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_INVALID_TABLE => -1072431079

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_REG_HANDLER_FAILED => -1072431072

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACPI_POWER_REQUEST_FAILED => -1072431071

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_WINSTATION_NAME_INVALID => -1073086463

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_INVALID_PD => -1073086462

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_PD_NOT_FOUND => -1073086461

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_CDM_CONNECT => 1074397188

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_CDM_DISCONNECT => 1074397189

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_CLOSE_PENDING => -1073086458

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_NO_OUTBUF => -1073086457

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_MODEM_INF_NOT_FOUND => -1073086456

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_INVALID_MODEMNAME => -1073086455

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_RESPONSE_ERROR => -1073086454

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_MODEM_RESPONSE_TIMEOUT => -1073086453

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_MODEM_RESPONSE_NO_CARRIER => -1073086452

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_MODEM_RESPONSE_NO_DIALTONE => -1073086451

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_MODEM_RESPONSE_BUSY => -1073086450

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_MODEM_RESPONSE_VOICE => -1073086449

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_TD_ERROR => -1073086448

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_LICENSE_CLIENT_INVALID => -1073086446

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_LICENSE_NOT_AVAILABLE => -1073086445

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_LICENSE_EXPIRED => -1073086444

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_WINSTATION_NOT_FOUND => -1073086443

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_WINSTATION_NAME_COLLISION => -1073086442

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_WINSTATION_BUSY => -1073086441

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_BAD_VIDEO_MODE => -1073086440

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_GRAPHICS_INVALID => -1073086430

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_NOT_CONSOLE => -1073086428

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_CLIENT_QUERY_TIMEOUT => -1073086426

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_CONSOLE_DISCONNECT => -1073086425

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_CONSOLE_CONNECT => -1073086424

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_SHADOW_DENIED => -1073086422

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_WINSTATION_ACCESS_DENIED => -1073086421

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_INVALID_WD => -1073086418

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_WD_NOT_FOUND => -1073086417

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_SHADOW_INVALID => -1073086416

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_SHADOW_DISABLED => -1073086415

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RDP_PROTOCOL_ERROR => -1073086414

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_CLIENT_LICENSE_NOT_SET => -1073086413

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_CLIENT_LICENSE_IN_USE => -1073086412

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_SHADOW_ENDED_BY_MODE_CHANGE => -1073086411

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_SHADOW_NOT_RUNNING => -1073086410

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_LOGON_DISABLED => -1073086409

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTX_SECURITY_LAYER_ERROR => -1073086408

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TS_INCOMPATIBLE_SESSIONS => -1073086407

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TS_VIDEO_SUBSYSTEM_ERROR => -1073086406

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PNP_BAD_MPS_TABLE => -1073479627

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PNP_TRANSLATION_FAILED => -1073479626

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PNP_IRQ_TRANSLATION_FAILED => -1073479625

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PNP_INVALID_ID => -1073479624

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IO_REISSUE_AS_CACHED => -1073479623

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MUI_FILE_NOT_FOUND => -1073020927

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MUI_INVALID_FILE => -1073020926

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MUI_INVALID_RC_CONFIG => -1073020925

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MUI_INVALID_LOCALE_NAME => -1073020924

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MUI_INVALID_ULTIMATEFALLBACK_NAME => -1073020923

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MUI_FILE_NOT_LOADED => -1073020922

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RESOURCE_ENUM_USER_STOP => -1073020921

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_NO_HANDLER_DEFINED => -1071906815

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_CONTEXT_ALREADY_DEFINED => -1071906814

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_INVALID_ASYNCHRONOUS_REQUEST => -1071906813

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_DISALLOW_FAST_IO => -1071906812

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_DISALLOW_FSFILTER_IO => -1071906812

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_INVALID_NAME_REQUEST => -1071906811

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_NOT_SAFE_TO_POST_OPERATION => -1071906810

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_NOT_INITIALIZED => -1071906809

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_FILTER_NOT_READY => -1071906808

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_POST_OPERATION_CLEANUP => -1071906807

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_INTERNAL_ERROR => -1071906806

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_DELETING_OBJECT => -1071906805

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_MUST_BE_NONPAGED_POOL => -1071906804

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_DUPLICATE_ENTRY => -1071906803

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_CBDQ_DISABLED => -1071906802

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_DO_NOT_ATTACH => -1071906801

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_DO_NOT_DETACH => -1071906800

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_INSTANCE_ALTITUDE_COLLISION => -1071906799

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_INSTANCE_NAME_COLLISION => -1071906798

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_FILTER_NOT_FOUND => -1071906797

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_VOLUME_NOT_FOUND => -1071906796

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_INSTANCE_NOT_FOUND => -1071906795

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_CONTEXT_ALLOCATION_NOT_FOUND => -1071906794

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_INVALID_CONTEXT_REGISTRATION => -1071906793

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_NAME_CACHE_MISS => -1071906792

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_NO_DEVICE_OBJECT => -1071906791

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_VOLUME_ALREADY_MOUNTED => -1071906790

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_ALREADY_ENLISTED => -1071906789

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_CONTEXT_ALREADY_LINKED => -1071906788

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_NO_WAITER_FOR_REPLY => -1071906784

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_REGISTRATION_BUSY => -1071906781

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLT_WCOS_NOT_SUPPORTED => -1071906780

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_SECTION_NOT_FOUND => -1072365567

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_CANT_GEN_ACTCTX => -1072365566

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_INVALID_ACTCTXDATA_FORMAT => -1072365565

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_ASSEMBLY_NOT_FOUND => -1072365564

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_MANIFEST_FORMAT_ERROR => -1072365563

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_MANIFEST_PARSE_ERROR => -1072365562

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_ACTIVATION_CONTEXT_DISABLED => -1072365561

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_KEY_NOT_FOUND => -1072365560

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_VERSION_CONFLICT => -1072365559

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_WRONG_SECTION_TYPE => -1072365558

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_THREAD_QUERIES_DISABLED => -1072365557

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_ASSEMBLY_MISSING => -1072365556

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_RELEASE_ACTIVATION_CONTEXT => 1075118093

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_PROCESS_DEFAULT_ALREADY_SET => -1072365554

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_EARLY_DEACTIVATION => -1072365553

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_INVALID_DEACTIVATION => -1072365552

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_MULTIPLE_DEACTIVATION => -1072365551

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY => -1072365550

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_PROCESS_TERMINATION_REQUESTED => -1072365549

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_CORRUPT_ACTIVATION_STACK => -1072365548

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_CORRUPTION => -1072365547

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE => -1072365546

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_INVALID_IDENTITY_ATTRIBUTE_NAME => -1072365545

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_IDENTITY_DUPLICATE_ATTRIBUTE => -1072365544

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_IDENTITY_PARSE_ERROR => -1072365543

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_COMPONENT_STORE_CORRUPT => -1072365542

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_FILE_HASH_MISMATCH => -1072365541

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT => -1072365540

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_IDENTITIES_DIFFERENT => -1072365539

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT => -1072365538

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_FILE_NOT_PART_OF_ASSEMBLY => -1072365537

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ADVANCED_INSTALLER_FAILED => -1072365536

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_XML_ENCODING_MISMATCH => -1072365535

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_MANIFEST_TOO_BIG => -1072365534

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_SETTING_NOT_REGISTERED => -1072365533

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_TRANSACTION_CLOSURE_INCOMPLETE => -1072365532

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMI_PRIMITIVE_INSTALLER_FAILED => -1072365531

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GENERIC_COMMAND_FAILED => -1072365530

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SXS_FILE_HASH_MISSING => -1072365529

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_INVALID_NODE => -1072496639

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NODE_EXISTS => -1072496638

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_JOIN_IN_PROGRESS => -1072496637

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NODE_NOT_FOUND => -1072496636

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_LOCAL_NODE_NOT_FOUND => -1072496635

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NETWORK_EXISTS => -1072496634

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NETWORK_NOT_FOUND => -1072496633

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NETINTERFACE_EXISTS => -1072496632

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NETINTERFACE_NOT_FOUND => -1072496631

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_INVALID_REQUEST => -1072496630

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_INVALID_NETWORK_PROVIDER => -1072496629

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NODE_DOWN => -1072496628

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NODE_UNREACHABLE => -1072496627

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NODE_NOT_MEMBER => -1072496626

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_JOIN_NOT_IN_PROGRESS => -1072496625

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_INVALID_NETWORK => -1072496624

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NO_NET_ADAPTERS => -1072496623

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NODE_UP => -1072496622

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NODE_PAUSED => -1072496621

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NODE_NOT_PAUSED => -1072496620

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NO_SECURITY_CONTEXT => -1072496619

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NETWORK_NOT_INTERNAL => -1072496618

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_POISONED => -1072496617

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_NON_CSV_PATH => -1072496616

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_CSV_VOLUME_NOT_LOCAL => -1072496615

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_CSV_READ_OPLOCK_BREAK_IN_PROGRESS => -1072496608

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_CSV_AUTO_PAUSE_ERROR => -1072496607

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_CSV_REDIRECTED => -1072496606

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_CSV_NOT_REDIRECTED => -1072496605

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_CSV_VOLUME_DRAINING => -1072496604

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_CSV_SNAPSHOT_CREATION_IN_PROGRESS => -1072496603

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_CSV_VOLUME_DRAINING_SUCCEEDED_DOWNLEVEL => -1072496602

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_CSV_NO_SNAPSHOTS => -1072496601

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CSV_IO_PAUSE_TIMEOUT => -1072496600

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_CSV_INVALID_HANDLE => -1072496599

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_CSV_SUPPORTED_ONLY_ON_COORDINATOR => -1072496592

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLUSTER_CAM_TICKET_REPLAY_DETECTED => -1072496591

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTIONAL_CONFLICT => -1072103423

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INVALID_TRANSACTION => -1072103422

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_NOT_ACTIVE => -1072103421

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TM_INITIALIZATION_FAILED => -1072103420

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RM_NOT_ACTIVE => -1072103419

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RM_METADATA_CORRUPT => -1072103418

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_NOT_JOINED => -1072103417

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DIRECTORY_NOT_RM => -1072103416

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_COULD_NOT_RESIZE_LOG => -2145845239

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTIONS_UNSUPPORTED_REMOTE => -1072103414

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_RESIZE_INVALID_SIZE => -1072103413

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REMOTE_FILE_VERSION_MISMATCH => -1072103412

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CRM_PROTOCOL_ALREADY_EXISTS => -1072103409

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_PROPAGATION_FAILED => -1072103408

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CRM_PROTOCOL_NOT_FOUND => -1072103407

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_SUPERIOR_EXISTS => -1072103406

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_REQUEST_NOT_VALID => -1072103405

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_NOT_REQUESTED => -1072103404

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_ALREADY_ABORTED => -1072103403

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_ALREADY_COMMITTED => -1072103402

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_INVALID_MARSHALL_BUFFER => -1072103401

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CURRENT_TRANSACTION_NOT_VALID => -1072103400

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_GROWTH_FAILED => -1072103399

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OBJECT_NO_LONGER_EXISTS => -1072103391

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STREAM_MINIVERSION_NOT_FOUND => -1072103390

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_STREAM_MINIVERSION_NOT_VALID => -1072103389

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MINIVERSION_INACCESSIBLE_FROM_SPECIFIED_TRANSACTION => -1072103388

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANT_OPEN_MINIVERSION_WITH_MODIFY_INTENT => -1072103387

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANT_CREATE_MORE_STREAM_MINIVERSIONS => -1072103386

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HANDLE_NO_LONGER_VALID => -1072103384

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_TXF_METADATA => -2145845207

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_CORRUPTION_DETECTED => -1072103376

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANT_RECOVER_WITH_HANDLE_OPEN => -2145845199

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RM_DISCONNECTED => -1072103374

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENLISTMENT_NOT_SUPERIOR => -1072103373

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RECOVERY_NOT_NEEDED => 1075380276

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RM_ALREADY_STARTED => 1075380277

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FILE_IDENTITY_NOT_PERSISTENT => -1072103370

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANT_BREAK_TRANSACTIONAL_DEPENDENCY => -1072103369

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANT_CROSS_RM_BOUNDARY => -1072103368

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TXF_DIR_NOT_EMPTY => -1072103367

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_INDOUBT_TRANSACTIONS_EXIST => -1072103366

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TM_VOLATILE => -1072103365

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ROLLBACK_TIMER_EXPIRED => -1072103364

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TXF_ATTRIBUTE_CORRUPT => -1072103363

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EFS_NOT_ALLOWED_IN_TRANSACTION => -1072103362

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTIONAL_OPEN_NOT_ALLOWED => -1072103361

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTED_MAPPING_UNSUPPORTED_REMOTE => -1072103360

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TXF_METADATA_ALREADY_PRESENT => -2145845183

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_SCOPE_CALLBACKS_NOT_SET => -2145845182

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_REQUIRED_PROMOTION => -1072103357

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANNOT_EXECUTE_FILE_IN_TRANSACTION => -1072103356

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTIONS_NOT_FROZEN => -1072103355

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_FREEZE_IN_PROGRESS => -1072103354

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOT_SNAPSHOT_VOLUME => -1072103353

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_SAVEPOINT_WITH_OPEN_FILES => -1072103352

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPARSE_NOT_ALLOWED_IN_TRANSACTION => -1072103351

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TM_IDENTITY_MISMATCH => -1072103350

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FLOATED_SECTION => -1072103349

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANNOT_ACCEPT_TRANSACTED_WORK => -1072103348

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CANNOT_ABORT_TRANSACTIONS => -1072103347

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_NOT_FOUND => -1072103346

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RESOURCEMANAGER_NOT_FOUND => -1072103345

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENLISTMENT_NOT_FOUND => -1072103344

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTIONMANAGER_NOT_FOUND => -1072103343

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTIONMANAGER_NOT_ONLINE => -1072103342

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTIONMANAGER_RECOVERY_NAME_COLLISION => -1072103341

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_NOT_ROOT => -1072103340

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_OBJECT_EXPIRED => -1072103339

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_COMPRESSION_NOT_ALLOWED_IN_TRANSACTION => -1072103338

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_RESPONSE_NOT_ENLISTED => -1072103337

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_RECORD_TOO_LONG => -1072103336

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_LINK_TRACKING_IN_TRANSACTION => -1072103335

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_OPERATION_NOT_SUPPORTED_IN_TRANSACTION => -1072103334

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_INTEGRITY_VIOLATED => -1072103333

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTIONMANAGER_IDENTITY_MISMATCH => -1072103332

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RM_CANNOT_BE_FROZEN_FOR_SNAPSHOT => -1072103331

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_MUST_WRITETHROUGH => -1072103330

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_NO_SUPERIOR => -1072103329

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_EXPIRED_HANDLE => -1072103328

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TRANSACTION_NOT_ENLISTED => -1072103327

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENLISTMENT_NOT_INITIALIZED => -1072103326

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_SECTOR_INVALID => -1072037887

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_SECTOR_PARITY_INVALID => -1072037886

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_SECTOR_REMAPPED => -1072037885

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_BLOCK_INCOMPLETE => -1072037884

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_INVALID_RANGE => -1072037883

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_BLOCKS_EXHAUSTED => -1072037882

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_READ_CONTEXT_INVALID => -1072037881

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_RESTART_INVALID => -1072037880

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_BLOCK_VERSION => -1072037879

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_BLOCK_INVALID => -1072037878

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_READ_MODE_INVALID => -1072037877

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_NO_RESTART => 1075445772

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_METADATA_CORRUPT => -1072037875

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_METADATA_INVALID => -1072037874

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_METADATA_INCONSISTENT => -1072037873

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_RESERVATION_INVALID => -1072037872

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_CANT_DELETE => -1072037871

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_CONTAINER_LIMIT_EXCEEDED => -1072037870

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_START_OF_LOG => -1072037869

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_POLICY_ALREADY_INSTALLED => -1072037868

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_POLICY_NOT_INSTALLED => -1072037867

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_POLICY_INVALID => -1072037866

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_POLICY_CONFLICT => -1072037865

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_PINNED_ARCHIVE_TAIL => -1072037864

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_RECORD_NONEXISTENT => -1072037863

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_RECORDS_RESERVED_INVALID => -1072037862

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_SPACE_RESERVED_INVALID => -1072037861

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_TAIL_INVALID => -1072037860

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_FULL => -1072037859

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_MULTIPLEXED => -1072037858

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_DEDICATED => -1072037857

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_ARCHIVE_NOT_IN_PROGRESS => -1072037856

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_ARCHIVE_IN_PROGRESS => -1072037855

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_EPHEMERAL => -1072037854

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_NOT_ENOUGH_CONTAINERS => -1072037853

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_CLIENT_ALREADY_REGISTERED => -1072037852

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_CLIENT_NOT_REGISTERED => -1072037851

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_FULL_HANDLER_IN_PROGRESS => -1072037850

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_CONTAINER_READ_FAILED => -1072037849

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_CONTAINER_WRITE_FAILED => -1072037848

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_CONTAINER_OPEN_FAILED => -1072037847

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_CONTAINER_STATE_INVALID => -1072037846

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_STATE_INVALID => -1072037845

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_PINNED => -1072037844

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_METADATA_FLUSH_FAILED => -1072037843

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_INCONSISTENT_SECURITY => -1072037842

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_APPENDED_FLUSH_FAILED => -1072037841

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_LOG_PINNED_RESERVATION => -1072037840

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VIDEO_HUNG_DISPLAY_DRIVER_THREAD => -1071972118

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VIDEO_HUNG_DISPLAY_DRIVER_THREAD_RECOVERED => -2145713941

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VIDEO_DRIVER_DEBUG_REPORT_REQUEST => 1075511532

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MONITOR_NO_DESCRIPTOR => -1071841279

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MONITOR_UNKNOWN_DESCRIPTOR_FORMAT => -1071841278

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MONITOR_INVALID_DESCRIPTOR_CHECKSUM => -1071841277

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MONITOR_INVALID_STANDARD_TIMING_BLOCK => -1071841276

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MONITOR_WMI_DATABLOCK_REGISTRATION_FAILED => -1071841275

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MONITOR_INVALID_SERIAL_NUMBER_MONDSC_BLOCK => -1071841274

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MONITOR_INVALID_USER_FRIENDLY_MONDSC_BLOCK => -1071841273

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MONITOR_NO_MORE_DESCRIPTOR_DATA => -1071841272

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MONITOR_INVALID_DETAILED_TIMING_BLOCK => -1071841271

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_MONITOR_INVALID_MANUFACTURE_DATE => -1071841270

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NOT_EXCLUSIVE_MODE_OWNER => -1071775744

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INSUFFICIENT_DMA_BUFFER => -1071775743

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_DISPLAY_ADAPTER => -1071775742

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_ADAPTER_WAS_RESET => -1071775741

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_DRIVER_MODEL => -1071775740

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PRESENT_MODE_CHANGED => -1071775739

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PRESENT_OCCLUDED => -1071775738

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PRESENT_DENIED => -1071775737

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_CANNOTCOLORCONVERT => -1071775736

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_DRIVER_MISMATCH => -1071775735

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PARTIAL_DATA_POPULATED => 1075707914

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PRESENT_REDIRECTION_DISABLED => -1071775733

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PRESENT_UNOCCLUDED => -1071775732

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_WINDOWDC_NOT_AVAILABLE => -1071775731

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_WINDOWLESS_PRESENT_DISABLED => -1071775730

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PRESENT_INVALID_WINDOW => -1071775729

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PRESENT_BUFFER_NOT_BOUND => -1071775728

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_VAIL_STATE_CHANGED => -1071775727

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INDIRECT_DISPLAY_ABANDON_SWAPCHAIN => -1071775726

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INDIRECT_DISPLAY_DEVICE_STOPPED => -1071775725

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MPO_ALLOCATION_UNPINNED => -1071775720

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_SETDISPLAYMODE_REQUIRED => -1071775719

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NO_VIDEO_MEMORY => -1071775488

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_CANT_LOCK_MEMORY => -1071775487

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_ALLOCATION_BUSY => -1071775486

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_TOO_MANY_REFERENCES => -1071775485

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_TRY_AGAIN_LATER => -1071775484

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_TRY_AGAIN_NOW => -1071775483

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_ALLOCATION_INVALID => -1071775482

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_UNSWIZZLING_APERTURE_UNAVAILABLE => -1071775481

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_UNSWIZZLING_APERTURE_UNSUPPORTED => -1071775480

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_CANT_EVICT_PINNED_ALLOCATION => -1071775479

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_ALLOCATION_USAGE => -1071775472

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_CANT_RENDER_LOCKED_ALLOCATION => -1071775471

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_ALLOCATION_CLOSED => -1071775470

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_ALLOCATION_INSTANCE => -1071775469

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_ALLOCATION_HANDLE => -1071775468

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_WRONG_ALLOCATION_DEVICE => -1071775467

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_ALLOCATION_CONTENT_LOST => -1071775466

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_GPU_EXCEPTION_ON_DEVICE => -1071775232

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_SKIP_ALLOCATION_PREPARATION => 1075708417

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_VIDPN_TOPOLOGY => -1071774976

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_VIDPN_TOPOLOGY_NOT_SUPPORTED => -1071774975

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_VIDPN_TOPOLOGY_CURRENTLY_NOT_SUPPORTED => -1071774974

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_VIDPN => -1071774973

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE => -1071774972

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET => -1071774971

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_VIDPN_MODALITY_NOT_SUPPORTED => -1071774970

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MODE_NOT_PINNED => 1075708679

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_VIDPN_SOURCEMODESET => -1071774968

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_VIDPN_TARGETMODESET => -1071774967

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_FREQUENCY => -1071774966

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_ACTIVE_REGION => -1071774965

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_TOTAL_REGION => -1071774964

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE_MODE => -1071774960

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET_MODE => -1071774959

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PINNED_MODE_MUST_REMAIN_IN_SET => -1071774958

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PATH_ALREADY_IN_TOPOLOGY => -1071774957

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MODE_ALREADY_IN_MODESET => -1071774956

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_VIDEOPRESENTSOURCESET => -1071774955

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_VIDEOPRESENTTARGETSET => -1071774954

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_SOURCE_ALREADY_IN_SET => -1071774953

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_TARGET_ALREADY_IN_SET => -1071774952

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_VIDPN_PRESENT_PATH => -1071774951

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NO_RECOMMENDED_VIDPN_TOPOLOGY => -1071774950

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGESET => -1071774949

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGE => -1071774948

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_FREQUENCYRANGE_NOT_IN_SET => -1071774947

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NO_PREFERRED_MODE => 1075708702

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_FREQUENCYRANGE_ALREADY_IN_SET => -1071774945

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_STALE_MODESET => -1071774944

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_MONITOR_SOURCEMODESET => -1071774943

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_MONITOR_SOURCE_MODE => -1071774942

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NO_RECOMMENDED_FUNCTIONAL_VIDPN => -1071774941

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MODE_ID_MUST_BE_UNIQUE => -1071774940

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_EMPTY_ADAPTER_MONITOR_MODE_SUPPORT_INTERSECTION => -1071774939

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_VIDEO_PRESENT_TARGETS_LESS_THAN_SOURCES => -1071774938

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PATH_NOT_IN_TOPOLOGY => -1071774937

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_ADAPTER_MUST_HAVE_AT_LEAST_ONE_SOURCE => -1071774936

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_ADAPTER_MUST_HAVE_AT_LEAST_ONE_TARGET => -1071774935

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_MONITORDESCRIPTORSET => -1071774934

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_MONITORDESCRIPTOR => -1071774933

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MONITORDESCRIPTOR_NOT_IN_SET => -1071774932

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MONITORDESCRIPTOR_ALREADY_IN_SET => -1071774931

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MONITORDESCRIPTOR_ID_MUST_BE_UNIQUE => -1071774930

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_VIDPN_TARGET_SUBSET_TYPE => -1071774929

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_RESOURCES_NOT_RELATED => -1071774928

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_SOURCE_ID_MUST_BE_UNIQUE => -1071774927

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_TARGET_ID_MUST_BE_UNIQUE => -1071774926

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NO_AVAILABLE_VIDPN_TARGET => -1071774925

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MONITOR_COULD_NOT_BE_ASSOCIATED_WITH_ADAPTER => -1071774924

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NO_VIDPNMGR => -1071774923

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NO_ACTIVE_VIDPN => -1071774922

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_STALE_VIDPN_TOPOLOGY => -1071774921

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MONITOR_NOT_CONNECTED => -1071774920

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_SOURCE_NOT_IN_TOPOLOGY => -1071774919

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_PRIMARYSURFACE_SIZE => -1071774918

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_VISIBLEREGION_SIZE => -1071774917

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_STRIDE => -1071774916

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_PIXELFORMAT => -1071774915

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_COLORBASIS => -1071774914

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_PIXELVALUEACCESSMODE => -1071774913

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_TARGET_NOT_IN_TOPOLOGY => -1071774912

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NO_DISPLAY_MODE_MANAGEMENT_SUPPORT => -1071774911

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_VIDPN_SOURCE_IN_USE => -1071774910

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_CANT_ACCESS_ACTIVE_VIDPN => -1071774909

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_PATH_IMPORTANCE_ORDINAL => -1071774908

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_PATH_CONTENT_GEOMETRY_TRANSFORMATION => -1071774907

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PATH_CONTENT_GEOMETRY_TRANSFORMATION_NOT_SUPPORTED => -1071774906

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_GAMMA_RAMP => -1071774905

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_GAMMA_RAMP_NOT_SUPPORTED => -1071774904

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MULTISAMPLING_NOT_SUPPORTED => -1071774903

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MODE_NOT_IN_MODESET => -1071774902

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_DATASET_IS_EMPTY => 1075708747

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NO_MORE_ELEMENTS_IN_DATASET => 1075708748

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_VIDPN_TOPOLOGY_RECOMMENDATION_REASON => -1071774899

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_PATH_CONTENT_TYPE => -1071774898

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_COPYPROTECTION_TYPE => -1071774897

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_UNASSIGNED_MODESET_ALREADY_EXISTS => -1071774896

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PATH_CONTENT_GEOMETRY_TRANSFORMATION_NOT_PINNED => 1075708753

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_SCANLINE_ORDERING => -1071774894

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_TOPOLOGY_CHANGES_NOT_ALLOWED => -1071774893

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NO_AVAILABLE_IMPORTANCE_ORDINALS => -1071774892

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INCOMPATIBLE_PRIVATE_FORMAT => -1071774891

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_MODE_PRUNING_ALGORITHM => -1071774890

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_MONITOR_CAPABILITY_ORIGIN => -1071774889

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGE_CONSTRAINT => -1071774888

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MAX_NUM_PATHS_REACHED => -1071774887

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_CANCEL_VIDPN_TOPOLOGY_AUGMENTATION => -1071774886

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_CLIENT_TYPE => -1071774885

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_CLIENTVIDPN_NOT_SET => -1071774884

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_SPECIFIED_CHILD_ALREADY_CONNECTED => -1071774720

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_CHILD_DESCRIPTOR_NOT_SUPPORTED => -1071774719

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_UNKNOWN_CHILD_STATUS => 1075708975

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NOT_A_LINKED_ADAPTER => -1071774672

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_LEADLINK_NOT_ENUMERATED => -1071774671

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_CHAINLINKS_NOT_ENUMERATED => -1071774670

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_ADAPTER_CHAIN_NOT_READY => -1071774669

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_CHAINLINKS_NOT_STARTED => -1071774668

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_CHAINLINKS_NOT_POWERED_ON => -1071774667

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INCONSISTENT_DEVICE_LINK_STATE => -1071774666

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_LEADLINK_START_DEFERRED => 1075708983

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NOT_POST_DEVICE_DRIVER => -1071774664

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_POLLING_TOO_FREQUENTLY => 1075708985

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_START_DEFERRED => 1075708986

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_ADAPTER_ACCESS_NOT_EXCLUDED => -1071774661

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_DEPENDABLE_CHILD_STATUS => 1075708988

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_NOT_SUPPORTED => -1071774464

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_COPP_NOT_SUPPORTED => -1071774463

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_UAB_NOT_SUPPORTED => -1071774462

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_INVALID_ENCRYPTED_PARAMETERS => -1071774461

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_NO_PROTECTED_OUTPUTS_EXIST => -1071774459

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_INTERNAL_ERROR => -1071774453

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_INVALID_HANDLE => -1071774452

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PVP_INVALID_CERTIFICATE_LENGTH => -1071774450

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_SPANNING_MODE_ENABLED => -1071774449

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_THEATER_MODE_ENABLED => -1071774448

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PVP_HFS_FAILED => -1071774447

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_INVALID_SRM => -1071774446

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_HDCP => -1071774445

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_ACP => -1071774444

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_CGMSA => -1071774443

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_HDCP_SRM_NEVER_SET => -1071774442

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_RESOLUTION_TOO_HIGH => -1071774441

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_ALL_HDCP_HARDWARE_ALREADY_IN_USE => -1071774440

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_PROTECTED_OUTPUT_NO_LONGER_EXISTS => -1071774438

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_PROTECTED_OUTPUT_DOES_NOT_HAVE_COPP_SEMANTICS => -1071774436

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_INVALID_INFORMATION_REQUEST => -1071774435

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_DRIVER_INTERNAL_ERROR => -1071774434

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_PROTECTED_OUTPUT_DOES_NOT_HAVE_OPM_SEMANTICS => -1071774433

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_SIGNALING_NOT_SUPPORTED => -1071774432

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_OPM_INVALID_CONFIGURATION_REQUEST => -1071774431

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_I2C_NOT_SUPPORTED => -1071774336

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_I2C_DEVICE_DOES_NOT_EXIST => -1071774335

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_I2C_ERROR_TRANSMITTING_DATA => -1071774334

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_I2C_ERROR_RECEIVING_DATA => -1071774333

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_DDCCI_VCP_NOT_SUPPORTED => -1071774332

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_DDCCI_INVALID_DATA => -1071774331

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_DDCCI_MONITOR_RETURNED_INVALID_TIMING_STATUS_BYTE => -1071774330

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_DDCCI_INVALID_CAPABILITIES_STRING => -1071774329

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MCA_INTERNAL_ERROR => -1071774328

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_DDCCI_INVALID_MESSAGE_COMMAND => -1071774327

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_DDCCI_INVALID_MESSAGE_LENGTH => -1071774326

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_DDCCI_INVALID_MESSAGE_CHECKSUM => -1071774325

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_PHYSICAL_MONITOR_HANDLE => -1071774324

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MONITOR_NO_LONGER_EXISTS => -1071774323

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_ONLY_CONSOLE_SESSION_SUPPORTED => -1071774240

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NO_DISPLAY_DEVICE_CORRESPONDS_TO_NAME => -1071774239

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_DISPLAY_DEVICE_NOT_ATTACHED_TO_DESKTOP => -1071774238

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_MIRRORING_DEVICES_NOT_SUPPORTED => -1071774237

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INVALID_POINTER => -1071774236

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_NO_MONITORS_CORRESPOND_TO_DISPLAY_DEVICE => -1071774235

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_PARAMETER_ARRAY_TOO_SMALL => -1071774234

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_INTERNAL_ERROR => -1071774233

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_SESSION_TYPE_CHANGE_IN_PROGRESS => -1071774232

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_UNKNOWN_BIOS_FRAME_BUFFER_NOT_FOUND => -1071774208

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GRAPHICS_UEFI_FRAME_BUFFER_NOT_FOUND => -1071774207

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CAMERA_INVALID_CONFIGURATION => -1071710208

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CAMERA_INSUFFICIENT_BANDWIDTH => -1071710207

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_LOCKED_VOLUME => -1071579136

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_NOT_ENCRYPTED => -1071579135

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_BAD_INFORMATION => -1071579134

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_TOO_SMALL => -1071579133

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_FAILED_WRONG_FS => -1071579132

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_BAD_PARTITION_SIZE => -1071579131

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_FS_NOT_EXTENDED => -1071579130

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_FS_MOUNTED => -1071579129

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_NO_LICENSE => -1071579128

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_ACTION_NOT_ALLOWED => -1071579127

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_BAD_DATA => -1071579126

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_VOLUME_NOT_BOUND => -1071579125

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_NOT_DATA_VOLUME => -1071579124

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_CONV_READ_ERROR => -1071579123

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_CONV_WRITE_ERROR => -1071579122

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_OVERLAPPED_UPDATE => -1071579121

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_FAILED_SECTOR_SIZE => -1071579120

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_FAILED_AUTHENTICATION => -1071579119

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_NOT_OS_VOLUME => -1071579118

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_KEYFILE_NOT_FOUND => -1071579117

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_KEYFILE_INVALID => -1071579116

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_KEYFILE_NO_VMK => -1071579115

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_TPM_DISABLED => -1071579114

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_TPM_SRK_AUTH_NOT_ZERO => -1071579113

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_TPM_INVALID_PCR => -1071579112

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_TPM_NO_VMK => -1071579111

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_PIN_INVALID => -1071579110

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_AUTH_INVALID_APPLICATION => -1071579109

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_AUTH_INVALID_CONFIG => -1071579108

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_DEBUGGER_ENABLED => -1071579107

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_DRY_RUN_FAILED => -1071579106

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_BAD_METADATA_POINTER => -1071579105

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_OLD_METADATA_COPY => -1071579104

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_REBOOT_REQUIRED => -1071579103

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_RAW_ACCESS => -1071579102

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_RAW_BLOCKED => -1071579101

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_NO_AUTOUNLOCK_MASTER_KEY => -1071579100

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_MOR_FAILED => -1071579099

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_NO_FEATURE_LICENSE => -1071579098

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_POLICY_USER_DISABLE_RDV_NOT_ALLOWED => -1071579097

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_CONV_RECOVERY_FAILED => -1071579096

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_VIRTUALIZED_SPACE_TOO_BIG => -1071579095

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_INVALID_DATUM_TYPE => -1071579094

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_VOLUME_TOO_SMALL => -1071579088

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_ENH_PIN_INVALID => -1071579087

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_FULL_ENCRYPTION_NOT_ALLOWED_ON_TP_STORAGE => -1071579086

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_WIPE_NOT_ALLOWED_ON_TP_STORAGE => -1071579085

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_NOT_ALLOWED_ON_CSV_STACK => -1071579084

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_NOT_ALLOWED_ON_CLUSTER => -1071579083

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_NOT_ALLOWED_TO_UPGRADE_WHILE_CONVERTING => -1071579082

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_WIPE_CANCEL_NOT_APPLICABLE => -1071579081

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_EDRIVE_DRY_RUN_FAILED => -1071579080

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_SECUREBOOT_DISABLED => -1071579079

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_SECUREBOOT_CONFIG_CHANGE => -1071579078

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_DEVICE_LOCKEDOUT => -1071579077

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_VOLUME_EXTEND_PREVENTS_EOW_DECRYPT => -1071579076

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_NOT_DE_VOLUME => -1071579075

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_PROTECTION_DISABLED => -1071579074

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_PROTECTION_CANNOT_BE_DISABLED => -1071579073

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_OSV_KSR_NOT_ALLOWED => -1071579072

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_EDRIVE_BAND_ENUMERATION_FAILED => -1071579071

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_POLICY_ON_RDV_EXCLUSION_LIST => -1071579070

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_DATASET_FULL => -1071579069

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_METADATA_FULL => -1071579068

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_SUSPEND_PROTECTION_NOT_ALLOWED => -1071579067

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_DATUM_PARTIALLY_INVALID => -1071579066

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_DATASET_TPM_DATUMS_INCONSISTENT => -1071579065

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_SECURE_BOOT_BINDINGS_OUT_OF_SYNC => -1071579064

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_SECURE_BOOT_BINDING_DATA_OUT_OF_SYNC => -1071579063

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_ORPHANED_TPM_BINDING_DATUM => -1071579062

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_BAD_TPM_DATUM_ASSOCIATION => -1071579061

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_FINAL_TPM_PCR_VALUES_MATCH => -1071579060

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_MATCHING_PCRS_TPM_FAILURE => -1071579059

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_GENERAL_TPM_FAILURE => -1071579058

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_TPM_NONEXISTENT => -1071579057

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_NO_PCR_BOOT_LOCK_BOUNDARY => -1071579056

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_PCR_BOOT_LOCK_BOUNDARY => -1071579055

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_FW_UPDATE_TPM_BINDINGS_NOT_REFRESHED => -1071579054

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_INVALID_TPM_BINDING_CONFIGURATION => -1071579053

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_TOO_MANY_TPM_BINDINGS => -1071579052

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_TPM_BINDING_ASSOCIATION_FAILURE => -1071579051

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_ORPHANED_PCR_DIGEST_DATUM => -1071579050

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_HW_ACCELERATED_ENCRYPTION_NOT_ALLOWED => -1071579049

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_NO_MATCHING_TPM_BINDINGS => -1071579048

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_TPMPV2_USED_FAILURE => -1071579047

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_NO_TPM_BINDINGS => -1071579046

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_FW_UPDATE_PCRS_BLOCK => -1071579044

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_FW_UPDATE_PCRS_NOT_EXCLUDED => -1071579043

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_FAILED_TO_UNWRAP_HW_WRAPPED_KEY => -1071579042

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_HARDWARE_CRYPTO_ACCELERATOR_NOT_FIPS_COMPLIANT => -1071579041

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FVE_HARDWARE_CRYPTO_KEY_MANAGER_NOT_FIPS_COMPLIANT => -1071579040

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_CALLOUT_NOT_FOUND => -1071513599

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_CONDITION_NOT_FOUND => -1071513598

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_FILTER_NOT_FOUND => -1071513597

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_LAYER_NOT_FOUND => -1071513596

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_PROVIDER_NOT_FOUND => -1071513595

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_PROVIDER_CONTEXT_NOT_FOUND => -1071513594

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_SUBLAYER_NOT_FOUND => -1071513593

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_NOT_FOUND => -1071513592

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_ALREADY_EXISTS => -1071513591

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_IN_USE => -1071513590

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_DYNAMIC_SESSION_IN_PROGRESS => -1071513589

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_WRONG_SESSION => -1071513588

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_NO_TXN_IN_PROGRESS => -1071513587

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_TXN_IN_PROGRESS => -1071513586

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_TXN_ABORTED => -1071513585

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_SESSION_ABORTED => -1071513584

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INCOMPATIBLE_TXN => -1071513583

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_TIMEOUT => -1071513582

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_NET_EVENTS_DISABLED => -1071513581

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INCOMPATIBLE_LAYER => -1071513580

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_KM_CLIENTS_ONLY => -1071513579

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_LIFETIME_MISMATCH => -1071513578

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_BUILTIN_OBJECT => -1071513577

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_TOO_MANY_CALLOUTS => -1071513576

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_NOTIFICATION_DROPPED => -1071513575

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_TRAFFIC_MISMATCH => -1071513574

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INCOMPATIBLE_SA_STATE => -1071513573

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_NULL_POINTER => -1071513572

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INVALID_ENUMERATOR => -1071513571

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INVALID_FLAGS => -1071513570

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INVALID_NET_MASK => -1071513569

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INVALID_RANGE => -1071513568

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INVALID_INTERVAL => -1071513567

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_ZERO_LENGTH_ARRAY => -1071513566

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_NULL_DISPLAY_NAME => -1071513565

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INVALID_ACTION_TYPE => -1071513564

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INVALID_WEIGHT => -1071513563

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_MATCH_TYPE_MISMATCH => -1071513562

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_TYPE_MISMATCH => -1071513561

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_OUT_OF_BOUNDS => -1071513560

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_RESERVED => -1071513559

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_DUPLICATE_CONDITION => -1071513558

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_DUPLICATE_KEYMOD => -1071513557

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_ACTION_INCOMPATIBLE_WITH_LAYER => -1071513556

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_ACTION_INCOMPATIBLE_WITH_SUBLAYER => -1071513555

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_CONTEXT_INCOMPATIBLE_WITH_LAYER => -1071513554

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_CONTEXT_INCOMPATIBLE_WITH_CALLOUT => -1071513553

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INCOMPATIBLE_AUTH_METHOD => -1071513552

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INCOMPATIBLE_DH_GROUP => -1071513551

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_EM_NOT_SUPPORTED => -1071513550

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_NEVER_MATCH => -1071513549

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_PROVIDER_CONTEXT_MISMATCH => -1071513548

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INVALID_PARAMETER => -1071513547

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_TOO_MANY_SUBLAYERS => -1071513546

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_CALLOUT_NOTIFICATION_FAILED => -1071513545

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INVALID_AUTH_TRANSFORM => -1071513544

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INVALID_CIPHER_TRANSFORM => -1071513543

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INCOMPATIBLE_CIPHER_TRANSFORM => -1071513542

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INVALID_TRANSFORM_COMBINATION => -1071513541

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_DUPLICATE_AUTH_METHOD => -1071513540

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INVALID_TUNNEL_ENDPOINT => -1071513539

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_L2_DRIVER_NOT_READY => -1071513538

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_KEY_DICTATOR_ALREADY_REGISTERED => -1071513537

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_KEY_DICTATION_INVALID_KEYING_MATERIAL => -1071513536

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_CONNECTIONS_DISABLED => -1071513535

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INVALID_DNS_NAME => -1071513534

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_STILL_ON => -1071513533

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_IKEEXT_NOT_RUNNING => -1071513532

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_TCPIP_NOT_READY => -1071513344

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INJECT_HANDLE_CLOSING => -1071513343

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_INJECT_HANDLE_STALE => -1071513342

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_CANNOT_PEND => -1071513341

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_FWP_DROP_NOICMP => -1071513340

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_CLOSING => -1071448062

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_BAD_VERSION => -1071448060

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_BAD_CHARACTERISTICS => -1071448059

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_ADAPTER_NOT_FOUND => -1071448058

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_OPEN_FAILED => -1071448057

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_DEVICE_FAILED => -1071448056

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_MULTICAST_FULL => -1071448055

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_MULTICAST_EXISTS => -1071448054

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_MULTICAST_NOT_FOUND => -1071448053

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_REQUEST_ABORTED => -1071448052

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_RESET_IN_PROGRESS => -1071448051

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_NOT_SUPPORTED => -1071447877

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_INVALID_PACKET => -1071448049

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_ADAPTER_NOT_READY => -1071448047

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_INVALID_LENGTH => -1071448044

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_INVALID_DATA => -1071448043

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_BUFFER_TOO_SHORT => -1071448042

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_INVALID_OID => -1071448041

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_ADAPTER_REMOVED => -1071448040

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_UNSUPPORTED_MEDIA => -1071448039

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_GROUP_ADDRESS_IN_USE => -1071448038

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_FILE_NOT_FOUND => -1071448037

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_ERROR_READING_FILE => -1071448036

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_ALREADY_MAPPED => -1071448035

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_RESOURCE_CONFLICT => -1071448034

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_MEDIA_DISCONNECTED => -1071448033

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_INVALID_ADDRESS => -1071448030

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_INVALID_DEVICE_REQUEST => -1071448048

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_PAUSED => -1071448022

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_INTERFACE_NOT_FOUND => -1071448021

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_UNSUPPORTED_REVISION => -1071448020

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_INVALID_PORT => -1071448019

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_INVALID_PORT_STATE => -1071448018

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_LOW_POWER_STATE => -1071448017

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_REINIT_REQUIRED => -1071448016

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_NO_QUEUES => -1071448015

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_DOT11_AUTO_CONFIG_ENABLED => -1071439872

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_DOT11_MEDIA_IN_USE => -1071439871

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_DOT11_POWER_STATE_INVALID => -1071439870

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_PM_WOL_PATTERN_LIST_FULL => -1071439869

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_PM_PROTOCOL_OFFLOAD_LIST_FULL => -1071439868

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_DOT11_AP_CHANNEL_CURRENTLY_NOT_AVAILABLE => -1071439867

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_DOT11_AP_BAND_CURRENTLY_NOT_AVAILABLE => -1071439866

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_DOT11_AP_CHANNEL_NOT_ALLOWED => -1071439865

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_DOT11_AP_BAND_NOT_ALLOWED => -1071439864

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_DOT11_AP_RADIO_RESTRICTION => -1071439863

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_INDICATION_REQUIRED => 1076035585

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_OFFLOAD_POLICY => -1071443953

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_OFFLOAD_CONNECTION_REJECTED => -1071443950

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NDIS_OFFLOAD_PATH_REJECTED => -1071443949

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_ERROR_MASK => -1071054848

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_AUTHFAIL => -1071054847

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BADINDEX => -1071054846

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_PARAMETER => -1071054845

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_AUDITFAILURE => -1071054844

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_CLEAR_DISABLED => -1071054843

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DEACTIVATED => -1071054842

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DISABLED => -1071054841

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DISABLED_CMD => -1071054840

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_FAIL => -1071054839

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_ORDINAL => -1071054838

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_INSTALL_DISABLED => -1071054837

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_INVALID_KEYHANDLE => -1071054836

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_KEYNOTFOUND => -1071054835

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_INAPPROPRIATE_ENC => -1071054834

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_MIGRATEFAIL => -1071054833

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_INVALID_PCR_INFO => -1071054832

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_NOSPACE => -1071054831

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_NOSRK => -1071054830

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_NOTSEALED_BLOB => -1071054829

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_OWNER_SET => -1071054828

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_RESOURCES => -1071054827

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_SHORTRANDOM => -1071054826

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_SIZE => -1071054825

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_WRONGPCRVAL => -1071054824

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_PARAM_SIZE => -1071054823

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_SHA_THREAD => -1071054822

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_SHA_ERROR => -1071054821

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_FAILEDSELFTEST => -1071054820

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_AUTH2FAIL => -1071054819

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BADTAG => -1071054818

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_IOERROR => -1071054817

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_ENCRYPT_ERROR => -1071054816

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DECRYPT_ERROR => -1071054815

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_INVALID_AUTHHANDLE => -1071054814

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_NO_ENDORSEMENT => -1071054813

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_INVALID_KEYUSAGE => -1071054812

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_WRONG_ENTITYTYPE => -1071054811

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_INVALID_POSTINIT => -1071054810

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_INAPPROPRIATE_SIG => -1071054809

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_KEY_PROPERTY => -1071054808

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_MIGRATION => -1071054807

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_SCHEME => -1071054806

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_DATASIZE => -1071054805

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_MODE => -1071054804

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_PRESENCE => -1071054803

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_VERSION => -1071054802

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_NO_WRAP_TRANSPORT => -1071054801

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_AUDITFAIL_UNSUCCESSFUL => -1071054800

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_AUDITFAIL_SUCCESSFUL => -1071054799

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_NOTRESETABLE => -1071054798

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_NOTLOCAL => -1071054797

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_TYPE => -1071054796

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_INVALID_RESOURCE => -1071054795

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_NOTFIPS => -1071054794

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_INVALID_FAMILY => -1071054793

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_NO_NV_PERMISSION => -1071054792

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_REQUIRES_SIGN => -1071054791

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_KEY_NOTSUPPORTED => -1071054790

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_AUTH_CONFLICT => -1071054789

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_AREA_LOCKED => -1071054788

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_LOCALITY => -1071054787

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_READ_ONLY => -1071054786

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_PER_NOWRITE => -1071054785

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_FAMILYCOUNT => -1071054784

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_WRITE_LOCKED => -1071054783

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_ATTRIBUTES => -1071054782

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_INVALID_STRUCTURE => -1071054781

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_KEY_OWNER_CONTROL => -1071054780

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_COUNTER => -1071054779

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_NOT_FULLWRITE => -1071054778

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_CONTEXT_GAP => -1071054777

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_MAXNVWRITES => -1071054776

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_NOOPERATOR => -1071054775

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_RESOURCEMISSING => -1071054774

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DELEGATE_LOCK => -1071054773

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DELEGATE_FAMILY => -1071054772

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DELEGATE_ADMIN => -1071054771

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_TRANSPORT_NOTEXCLUSIVE => -1071054770

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_OWNER_CONTROL => -1071054769

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DAA_RESOURCES => -1071054768

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DAA_INPUT_DATA0 => -1071054767

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DAA_INPUT_DATA1 => -1071054766

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DAA_ISSUER_SETTINGS => -1071054765

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DAA_TPM_SETTINGS => -1071054764

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DAA_STAGE => -1071054763

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DAA_ISSUER_VALIDITY => -1071054762

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DAA_WRONG_W => -1071054761

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_HANDLE => -1071054760

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_DELEGATE => -1071054759

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BADCONTEXT => -1071054758

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_TOOMANYCONTEXTS => -1071054757

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_MA_TICKET_SIGNATURE => -1071054756

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_MA_DESTINATION => -1071054755

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_MA_SOURCE => -1071054754

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_MA_AUTHORITY => -1071054753

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_PERMANENTEK => -1071054751

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_BAD_SIGNATURE => -1071054750

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_NOCONTEXTSPACE => -1071054749

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_ASYMMETRIC => -1071054719

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_ATTRIBUTES => -1071054718

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_HASH => -1071054717

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_VALUE => -1071054716

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_HIERARCHY => -1071054715

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_KEY_SIZE => -1071054713

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_MGF => -1071054712

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_MODE => -1071054711

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_TYPE => -1071054710

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_HANDLE => -1071054709

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_KDF => -1071054708

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_RANGE => -1071054707

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_AUTH_FAIL => -1071054706

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_NONCE => -1071054705

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_PP => -1071054704

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_SCHEME => -1071054702

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_SIZE => -1071054699

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_SYMMETRIC => -1071054698

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_TAG => -1071054697

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_SELECTOR => -1071054696

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_INSUFFICIENT => -1071054694

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_SIGNATURE => -1071054693

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_KEY => -1071054692

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_POLICY_FAIL => -1071054691

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_INTEGRITY => -1071054689

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_TICKET => -1071054688

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_RESERVED_BITS => -1071054687

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_BAD_AUTH => -1071054686

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_EXPIRED => -1071054685

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_POLICY_CC => -1071054684

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_BINDING => -1071054683

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_CURVE => -1071054682

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_ECC_POINT => -1071054681

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_INITIALIZE => -1071054592

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_FAILURE => -1071054591

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_SEQUENCE => -1071054589

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_PRIVATE => -1071054581

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_HMAC => -1071054567

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_DISABLED => -1071054560

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_EXCLUSIVE => -1071054559

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_ECC_CURVE => -1071054557

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_AUTH_TYPE => -1071054556

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_AUTH_MISSING => -1071054555

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_POLICY => -1071054554

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_PCR => -1071054553

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_PCR_CHANGED => -1071054552

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_UPGRADE => -1071054547

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_TOO_MANY_CONTEXTS => -1071054546

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_AUTH_UNAVAILABLE => -1071054545

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_REBOOT => -1071054544

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_UNBALANCED => -1071054543

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_COMMAND_SIZE => -1071054526

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_COMMAND_CODE => -1071054525

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_AUTHSIZE => -1071054524

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_AUTH_CONTEXT => -1071054523

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_NV_RANGE => -1071054522

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_NV_SIZE => -1071054521

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_NV_LOCKED => -1071054520

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_NV_AUTHORIZATION => -1071054519

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_NV_UNINITIALIZED => -1071054518

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_NV_SPACE => -1071054517

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_NV_DEFINED => -1071054516

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_BAD_CONTEXT => -1071054512

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_CPHASH => -1071054511

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_PARENT => -1071054510

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_NEEDS_TEST => -1071054509

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_NO_RESULT => -1071054508

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_20_E_SENSITIVE => -1071054507

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_COMMAND_BLOCKED => -1071053824

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_INVALID_HANDLE => -1071053823

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DUPLICATE_VHANDLE => -1071053822

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_EMBEDDED_COMMAND_BLOCKED => -1071053821

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_EMBEDDED_COMMAND_UNSUPPORTED => -1071053820

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_RETRY => -1071052800

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_NEEDS_SELFTEST => -1071052799

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DOING_SELFTEST => -1071052798

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_DEFEND_LOCK_RUNNING => -1071052797

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_COMMAND_CANCELED => -1071050751

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_TOO_MANY_CONTEXTS => -1071050750

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_NOT_FOUND => -1071050749

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_ACCESS_DENIED => -1071050748

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_INSUFFICIENT_BUFFER => -1071050747

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_PPI_FUNCTION_UNSUPPORTED => -1071050746

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_IN_EXCLUSIVE_MODE => -1071050745

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_REBOOT_REQUIRED => -1071050744

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_ERROR_MASK => -1071046656

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_DEVICE_NOT_READY => -1071046655

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_INVALID_HANDLE => -1071046654

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_INVALID_PARAMETER => -1071046653

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_FLAG_NOT_SUPPORTED => -1071046652

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_NOT_SUPPORTED => -1071046651

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_BUFFER_TOO_SMALL => -1071046650

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_INTERNAL_ERROR => -1071046649

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_AUTHENTICATION_FAILED => -1071046648

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_AUTHENTICATION_IGNORED => -1071046647

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_POLICY_NOT_FOUND => -1071046646

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_PROFILE_NOT_FOUND => -1071046645

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_VALIDATION_FAILED => -1071046644

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_DEVICE_NOT_FOUND => -1071046643

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_WRONG_PARENT => -1071046642

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_KEY_NOT_LOADED => -1071046641

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_NO_KEY_CERTIFICATION => -1071046640

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_KEY_NOT_FINALIZED => -1071046639

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_ATTESTATION_CHALLENGE_NOT_SET => -1071046638

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_NOT_PCR_BOUND => -1071046637

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_KEY_ALREADY_FINALIZED => -1071046636

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_KEY_USAGE_POLICY_NOT_SUPPORTED => -1071046635

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_KEY_USAGE_POLICY_INVALID => -1071046634

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_SOFT_KEY_ERROR => -1071046633

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_KEY_NOT_AUTHENTICATED => -1071046632

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_KEY_NOT_AIK => -1071046631

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_KEY_NOT_SIGNING_KEY => -1071046630

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_LOCKED_OUT => -1071046629

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_CLAIM_TYPE_NOT_SUPPORTED => -1071046628

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_TPM_VERSION_NOT_SUPPORTED => -1071046627

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_BUFFER_LENGTH_MISMATCH => -1071046626

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_IFX_RSA_KEY_CREATION_BLOCKED => -1071046625

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_TICKET_MISSING => -1071046624

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_RAW_POLICY_NOT_SUPPORTED => -1071046623

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_KEY_HANDLE_INVALIDATED => -1071046622

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PCP_UNSUPPORTED_PSS_SALT => 1076437027

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RTPM_CONTEXT_CONTINUE => 2699264

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RTPM_CONTEXT_COMPLETE => 2699265

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RTPM_NO_RESULT => -1071042558

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RTPM_PCR_READ_INCOMPLETE => -1071042557

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RTPM_INVALID_CONTEXT => -1071042556

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RTPM_UNSUPPORTED_CMD => -1071042555

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_TPM_ZERO_EXHAUST_ENABLED => -1071038464

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DRTM_ENVIRONMENT_UNSAFE => -1071034368

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DRTM_NO_DIRECT_AUTH_FOR_CURRENT_MLE => -1071034367

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_HYPERCALL_CODE => -1070268414

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_HYPERCALL_INPUT => -1070268413

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_ALIGNMENT => -1070268412

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_PARAMETER => -1070268411

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_ACCESS_DENIED => -1070268410

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_PARTITION_STATE => -1070268409

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_OPERATION_DENIED => -1070268408

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_UNKNOWN_PROPERTY => -1070268407

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_PROPERTY_VALUE_OUT_OF_RANGE => -1070268406

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INSUFFICIENT_MEMORY => -1070268405

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_PARTITION_TOO_DEEP => -1070268404

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_PARTITION_ID => -1070268403

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_VP_INDEX => -1070268402

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_PORT_ID => -1070268399

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_CONNECTION_ID => -1070268398

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INSUFFICIENT_BUFFERS => -1070268397

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_NOT_ACKNOWLEDGED => -1070268396

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_VP_STATE => -1070268395

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_ACKNOWLEDGED => -1070268394

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_SAVE_RESTORE_STATE => -1070268393

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_SYNIC_STATE => -1070268392

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_OBJECT_IN_USE => -1070268391

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_PROXIMITY_DOMAIN_INFO => -1070268390

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_NO_DATA => -1070268389

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INACTIVE => -1070268388

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_NO_RESOURCES => -1070268387

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_FEATURE_UNAVAILABLE => -1070268386

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INSUFFICIENT_BUFFER => -1070268365

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INSUFFICIENT_DEVICE_DOMAINS => -1070268360

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_CPUID_FEATURE_VALIDATION_ERROR => -1070268356

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_CPUID_XSAVE_FEATURE_VALIDATION_ERROR => -1070268355

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_PROCESSOR_STARTUP_TIMEOUT => -1070268354

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_SMX_ENABLED => -1070268353

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_LP_INDEX => -1070268351

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_REGISTER_VALUE => -1070268336

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_VTL_STATE => -1070268335

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_NX_NOT_DETECTED => -1070268331

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_DEVICE_ID => -1070268329

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_DEVICE_STATE => -1070268328

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_PENDING_PAGE_REQUESTS => 3473497

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_PAGE_REQUEST_INVALID => -1070268320

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_CPU_GROUP_ID => -1070268305

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INVALID_CPU_GROUP_STATE => -1070268304

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_OPERATION_FAILED => -1070268303

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_NOT_ALLOWED_WITH_NESTED_VIRT_ACTIVE => -1070268302

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INSUFFICIENT_ROOT_MEMORY => -1070268301

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_EVENT_BUFFER_ALREADY_FREED => -1070268300

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INSUFFICIENT_CONTIGUOUS_MEMORY => -1070268299

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_DEVICE_NOT_IN_DOMAIN => -1070268298

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_NESTED_VM_EXIT => -1070268297

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_CALL_PENDING => -1070268295

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_MSR_ACCESS_FAILED => -1070268288

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INSUFFICIENT_MEMORY_MIRRORING => -1070268287

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INSUFFICIENT_CONTIGUOUS_MEMORY_MIRRORING => -1070268286

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INSUFFICIENT_CONTIGUOUS_ROOT_MEMORY => -1070268285

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INSUFFICIENT_ROOT_MEMORY_MIRRORING => -1070268284

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_INSUFFICIENT_CONTIGUOUS_ROOT_MEMORY_MIRRORING => -1070268283

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_VTL_ALREADY_ENABLED => -1070268282

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_SPDM_REQUEST => -1070268280

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HV_NOT_PRESENT => -1070264320

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_DUPLICATE_HANDLER => -1070137343

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_TOO_MANY_HANDLERS => -1070137342

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_QUEUE_FULL => -1070137341

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_HANDLER_NOT_PRESENT => -1070137340

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_INVALID_OBJECT_NAME => -1070137339

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_PARTITION_NAME_TOO_LONG => -1070137338

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_MESSAGE_QUEUE_NAME_TOO_LONG => -1070137337

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_PARTITION_ALREADY_EXISTS => -1070137336

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_PARTITION_DOES_NOT_EXIST => -1070137335

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_PARTITION_NAME_NOT_FOUND => -1070137334

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_MESSAGE_QUEUE_ALREADY_EXISTS => -1070137333

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_EXCEEDED_MBP_ENTRY_MAP_LIMIT => -1070137332

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_MB_STILL_REFERENCED => -1070137331

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_CHILD_GPA_PAGE_SET_CORRUPTED => -1070137330

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_INVALID_NUMA_SETTINGS => -1070137329

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_INVALID_NUMA_NODE_INDEX => -1070137328

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_NOTIFICATION_QUEUE_ALREADY_ASSOCIATED => -1070137327

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_INVALID_MEMORY_BLOCK_HANDLE => -1070137326

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_PAGE_RANGE_OVERFLOW => -1070137325

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_INVALID_MESSAGE_QUEUE_HANDLE => -1070137324

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_INVALID_GPA_RANGE_HANDLE => -1070137323

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_NO_MEMORY_BLOCK_NOTIFICATION_QUEUE => -1070137322

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_MEMORY_BLOCK_LOCK_COUNT_EXCEEDED => -1070137321

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_INVALID_PPM_HANDLE => -1070137320

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_MBPS_ARE_LOCKED => -1070137319

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_MESSAGE_QUEUE_CLOSED => -1070137318

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_VIRTUAL_PROCESSOR_LIMIT_EXCEEDED => -1070137317

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_STOP_PENDING => -1070137316

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_INVALID_PROCESSOR_STATE => -1070137315

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_EXCEEDED_KM_CONTEXT_COUNT_LIMIT => -1070137314

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_KM_INTERFACE_ALREADY_INITIALIZED => -1070137313

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_MB_PROPERTY_ALREADY_SET_RESET => -1070137312

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_MMIO_RANGE_DESTROYED => -1070137311

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_INVALID_CHILD_GPA_PAGE_SET => -1070137310

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_RESERVE_PAGE_SET_IS_BEING_USED => -1070137309

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_RESERVE_PAGE_SET_TOO_SMALL => -1070137308

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_MBP_ALREADY_LOCKED_USING_RESERVED_PAGE => -1070137307

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_MBP_COUNT_EXCEEDED_LIMIT => -1070137306

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_SAVED_STATE_CORRUPT => -1070137305

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_SAVED_STATE_UNRECOGNIZED_ITEM => -1070137304

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_SAVED_STATE_INCOMPATIBLE => -1070137303

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_VTL_ACCESS_DENIED => -1070137302

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_INSUFFICIENT_RESOURCES_RESERVE => -1070137301

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_INSUFFICIENT_RESOURCES_PHYSICAL_BUFFER => -1070137300

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_INSUFFICIENT_RESOURCES_HV_DEPOSIT => -1070137299

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_MEMORY_TYPE_NOT_SUPPORTED => -1070137298

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_INSUFFICIENT_RESOURCES_WITHDRAW => -1070137297

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_PROCESS_ALREADY_SET => -1070137296

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DM_OPERATION_LIMIT_EXCEEDED => -1070135808

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VID_REMOTE_NODE_PARENT_GPA_PAGES_USED => -2143879167

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_BAD_SPI => -1070202879

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_SA_LIFETIME_EXPIRED => -1070202878

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_WRONG_SA => -1070202877

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_REPLAY_CHECK_FAILED => -1070202876

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_INVALID_PACKET => -1070202875

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_INTEGRITY_CHECK_FAILED => -1070202874

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_CLEAR_TEXT_DROP => -1070202873

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_AUTH_FIREWALL_DROP => -1070202872

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_THROTTLE_DROP => -1070202871

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_DOSP_BLOCK => -1070170112

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_DOSP_RECEIVED_MULTICAST => -1070170111

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_DOSP_INVALID_PACKET => -1070170110

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_DOSP_STATE_LOOKUP_FAILED => -1070170109

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_DOSP_MAX_ENTRIES => -1070170108

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_DOSP_KEYMOD_NOT_ALLOWED => -1070170107

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IPSEC_DOSP_MAX_PER_IP_RATELIMIT_QUEUES => -1070170106

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_INCOMPLETE_REGENERATION => -2143813631

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_INCOMPLETE_DISK_MIGRATION => -2143813630

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DATABASE_FULL => -1070071807

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_CONFIGURATION_CORRUPTED => -1070071806

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_CONFIGURATION_NOT_IN_SYNC => -1070071805

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PACK_CONFIG_UPDATE_FAILED => -1070071804

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_CONTAINS_NON_SIMPLE_VOLUME => -1070071803

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_DUPLICATE => -1070071802

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_DYNAMIC => -1070071801

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_ID_INVALID => -1070071800

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_INVALID => -1070071799

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_LAST_VOTER => -1070071798

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_LAYOUT_INVALID => -1070071797

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_LAYOUT_NON_BASIC_BETWEEN_BASIC_PARTITIONS => -1070071796

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_LAYOUT_NOT_CYLINDER_ALIGNED => -1070071795

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_LAYOUT_PARTITIONS_TOO_SMALL => -1070071794

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_LAYOUT_PRIMARY_BETWEEN_LOGICAL_PARTITIONS => -1070071793

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_LAYOUT_TOO_MANY_PARTITIONS => -1070071792

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_MISSING => -1070071791

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_NOT_EMPTY => -1070071790

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_NOT_ENOUGH_SPACE => -1070071789

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_REVECTORING_FAILED => -1070071788

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_SECTOR_SIZE_INVALID => -1070071787

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_SET_NOT_CONTAINED => -1070071786

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_USED_BY_MULTIPLE_MEMBERS => -1070071785

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DISK_USED_BY_MULTIPLE_PLEXES => -1070071784

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DYNAMIC_DISK_NOT_SUPPORTED => -1070071783

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_EXTENT_ALREADY_USED => -1070071782

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_EXTENT_NOT_CONTIGUOUS => -1070071781

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_EXTENT_NOT_IN_PUBLIC_REGION => -1070071780

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_EXTENT_NOT_SECTOR_ALIGNED => -1070071779

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_EXTENT_OVERLAPS_EBR_PARTITION => -1070071778

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_EXTENT_VOLUME_LENGTHS_DO_NOT_MATCH => -1070071777

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_FAULT_TOLERANT_NOT_SUPPORTED => -1070071776

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_INTERLEAVE_LENGTH_INVALID => -1070071775

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_MAXIMUM_REGISTERED_USERS => -1070071774

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_MEMBER_IN_SYNC => -1070071773

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_MEMBER_INDEX_DUPLICATE => -1070071772

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_MEMBER_INDEX_INVALID => -1070071771

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_MEMBER_MISSING => -1070071770

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_MEMBER_NOT_DETACHED => -1070071769

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_MEMBER_REGENERATING => -1070071768

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_ALL_DISKS_FAILED => -1070071767

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_NO_REGISTERED_USERS => -1070071766

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_NO_SUCH_USER => -1070071765

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_NOTIFICATION_RESET => -1070071764

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_NUMBER_OF_MEMBERS_INVALID => -1070071763

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_NUMBER_OF_PLEXES_INVALID => -1070071762

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PACK_DUPLICATE => -1070071761

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PACK_ID_INVALID => -1070071760

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PACK_INVALID => -1070071759

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PACK_NAME_INVALID => -1070071758

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PACK_OFFLINE => -1070071757

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PACK_HAS_QUORUM => -1070071756

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PACK_WITHOUT_QUORUM => -1070071755

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PARTITION_STYLE_INVALID => -1070071754

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PARTITION_UPDATE_FAILED => -1070071753

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PLEX_IN_SYNC => -1070071752

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PLEX_INDEX_DUPLICATE => -1070071751

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PLEX_INDEX_INVALID => -1070071750

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PLEX_LAST_ACTIVE => -1070071749

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PLEX_MISSING => -1070071748

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PLEX_REGENERATING => -1070071747

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PLEX_TYPE_INVALID => -1070071746

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PLEX_NOT_RAID5 => -1070071745

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PLEX_NOT_SIMPLE => -1070071744

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_STRUCTURE_SIZE_INVALID => -1070071743

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_TOO_MANY_NOTIFICATION_REQUESTS => -1070071742

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_TRANSACTION_IN_PROGRESS => -1070071741

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_UNEXPECTED_DISK_LAYOUT_CHANGE => -1070071740

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_VOLUME_CONTAINS_MISSING_DISK => -1070071739

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_VOLUME_ID_INVALID => -1070071738

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_VOLUME_LENGTH_INVALID => -1070071737

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_VOLUME_LENGTH_NOT_SECTOR_SIZE_MULTIPLE => -1070071736

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_VOLUME_NOT_MIRRORED => -1070071735

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_VOLUME_NOT_RETAINED => -1070071734

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_VOLUME_OFFLINE => -1070071733

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_VOLUME_RETAINED => -1070071732

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_NUMBER_OF_EXTENTS_INVALID => -1070071731

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_DIFFERENT_SECTOR_SIZE => -1070071730

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_BAD_BOOT_DISK => -1070071729

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PACK_CONFIG_OFFLINE => -1070071728

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PACK_CONFIG_ONLINE => -1070071727

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_NOT_PRIMARY_PACK => -1070071726

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PACK_LOG_UPDATE_FAILED => -1070071725

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_NUMBER_OF_DISKS_IN_PLEX_INVALID => -1070071724

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_NUMBER_OF_DISKS_IN_MEMBER_INVALID => -1070071723

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_VOLUME_MIRRORED => -1070071722

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PLEX_NOT_SIMPLE_SPANNED => -1070071721

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_NO_VALID_LOG_COPIES => -1070071720

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_PRIMARY_PACK_PRESENT => -1070071719

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_NUMBER_OF_DISKS_INVALID => -1070071718

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_MIRROR_NOT_SUPPORTED => -1070071717

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLMGR_RAID5_NOT_SUPPORTED => -1070071716

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BCD_NOT_ALL_ENTRIES_IMPORTED => -2143748095

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BCD_TOO_MANY_ELEMENTS => -1070006270

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BCD_NOT_ALL_ENTRIES_SYNCHRONIZED => -2143748093

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_DRIVE_FOOTER_MISSING => -1069940735

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_DRIVE_FOOTER_CHECKSUM_MISMATCH => -1069940734

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_DRIVE_FOOTER_CORRUPT => -1069940733

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_FORMAT_UNKNOWN => -1069940732

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_FORMAT_UNSUPPORTED_VERSION => -1069940731

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_SPARSE_HEADER_CHECKSUM_MISMATCH => -1069940730

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_SPARSE_HEADER_UNSUPPORTED_VERSION => -1069940729

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_SPARSE_HEADER_CORRUPT => -1069940728

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_BLOCK_ALLOCATION_FAILURE => -1069940727

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_BLOCK_ALLOCATION_TABLE_CORRUPT => -1069940726

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_INVALID_BLOCK_SIZE => -1069940725

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_BITMAP_MISMATCH => -1069940724

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_PARENT_VHD_NOT_FOUND => -1069940723

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_CHILD_PARENT_ID_MISMATCH => -1069940722

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_CHILD_PARENT_TIMESTAMP_MISMATCH => -1069940721

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_METADATA_READ_FAILURE => -1069940720

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_METADATA_WRITE_FAILURE => -1069940719

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_INVALID_SIZE => -1069940718

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_INVALID_FILE_SIZE => -1069940717

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VIRTDISK_PROVIDER_NOT_FOUND => -1069940716

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VIRTDISK_NOT_VIRTUAL_DISK => -1069940715

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_PARENT_VHD_ACCESS_DENIED => -1069940714

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_CHILD_PARENT_SIZE_MISMATCH => -1069940713

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_DIFFERENCING_CHAIN_CYCLE_DETECTED => -1069940712

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_DIFFERENCING_CHAIN_ERROR_IN_PARENT => -1069940711

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VIRTUAL_DISK_LIMITATION => -1069940710

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_INVALID_TYPE => -1069940709

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_INVALID_STATE => -1069940708

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VIRTDISK_UNSUPPORTED_DISK_SECTOR_SIZE => -1069940707

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VIRTDISK_DISK_ALREADY_OWNED => -1069940706

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VIRTDISK_DISK_ONLINE_AND_WRITABLE => -1069940705

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTLOG_TRACKING_NOT_INITIALIZED => -1069940704

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTLOG_LOGFILE_SIZE_EXCEEDED_MAXSIZE => -1069940703

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTLOG_VHD_CHANGED_OFFLINE => -1069940702

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTLOG_INVALID_TRACKING_STATE => -1069940701

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CTLOG_INCONSISTENT_TRACKING_FILE => -1069940700

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_METADATA_FULL => -1069940696

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_INVALID_CHANGE_TRACKING_ID => -1069940695

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_CHANGE_TRACKING_DISABLED => -1069940694

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_MISSING_CHANGE_TRACKING_INFORMATION => -1069940688

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_RESIZE_WOULD_TRUNCATE_DATA => -1069940687

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_COULD_NOT_COMPUTE_MINIMUM_VIRTUAL_SIZE => -1069940686

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_ALREADY_AT_OR_BELOW_MINIMUM_VIRTUAL_SIZE => -1069940685

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_UNEXPECTED_ID => -1069940684

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUERY_STORAGE_ERROR => -2143682559

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_GDI_HANDLE_LEAK => -2143354879

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RKF_KEY_NOT_FOUND => -1069547519

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RKF_DUPLICATE_KEY => -1069547518

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RKF_BLOB_FULL => -1069547517

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RKF_STORE_FULL => -1069547516

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RKF_FILE_BLOCKED => -1069547515

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RKF_ACTIVE_KEY => -1069547514

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RDBSS_RESTART_OPERATION => -1069481983

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RDBSS_CONTINUE_OPERATION => -1069481982

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RDBSS_POST_OPERATION => -1069481981

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_RDBSS_RETRY_LOOKUP => -1069481980

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_INVALID_HANDLE => -1069416447

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_READ_NOT_PERMITTED => -1069416446

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_WRITE_NOT_PERMITTED => -1069416445

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_INVALID_PDU => -1069416444

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_INSUFFICIENT_AUTHENTICATION => -1069416443

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_REQUEST_NOT_SUPPORTED => -1069416442

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_INVALID_OFFSET => -1069416441

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_INSUFFICIENT_AUTHORIZATION => -1069416440

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_PREPARE_QUEUE_FULL => -1069416439

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_ATTRIBUTE_NOT_FOUND => -1069416438

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_ATTRIBUTE_NOT_LONG => -1069416437

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_INSUFFICIENT_ENCRYPTION_KEY_SIZE => -1069416436

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_INVALID_ATTRIBUTE_VALUE_LENGTH => -1069416435

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_UNLIKELY => -1069416434

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_INSUFFICIENT_ENCRYPTION => -1069416433

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_UNSUPPORTED_GROUP_TYPE => -1069416432

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_INSUFFICIENT_RESOURCES => -1069416431

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_BTH_ATT_UNKNOWN_ERROR => -1069412352

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_ROLLBACK_DETECTED => -1069350911

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_POLICY_VIOLATION => -1069350910

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_INVALID_POLICY => -1069350909

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_POLICY_PUBLISHER_NOT_FOUND => -1069350908

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_POLICY_NOT_SIGNED => -1069350907

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_NOT_ENABLED => -2143092730

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_FILE_REPLACED => -1069350905

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_POLICY_NOT_AUTHORIZED => -1069350904

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_POLICY_UNKNOWN => -1069350903

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_POLICY_MISSING_ANTIROLLBACKVERSION => -1069350902

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_PLATFORM_ID_MISMATCH => -1069350901

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_POLICY_ROLLBACK_DETECTED => -1069350900

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_POLICY_UPGRADE_MISMATCH => -1069350899

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_REQUIRED_POLICY_FILE_MISSING => -1069350898

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_NOT_BASE_POLICY => -1069350897

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECUREBOOT_NOT_SUPPLEMENTAL_POLICY => -1069350896

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PLATFORM_MANIFEST_NOT_AUTHORIZED => -1058340863

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PLATFORM_MANIFEST_INVALID => -1058340862

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PLATFORM_MANIFEST_FILE_NOT_AUTHORIZED => -1058340861

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PLATFORM_MANIFEST_CATALOG_NOT_AUTHORIZED => -1058340860

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PLATFORM_MANIFEST_BINARY_ID_NOT_FOUND => -1058340859

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PLATFORM_MANIFEST_NOT_ACTIVE => -1058340858

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PLATFORM_MANIFEST_NOT_SIGNED => -1058340857

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_INTEGRITY_ROLLBACK_DETECTED => -1058471935

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_INTEGRITY_POLICY_VIOLATION => -1058471934

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_INTEGRITY_INVALID_POLICY => -1058471933

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_INTEGRITY_POLICY_NOT_SIGNED => -1058471932

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_INTEGRITY_TOO_MANY_POLICIES => -1058471931

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_INTEGRITY_SUPPLEMENTAL_POLICY_NOT_AUTHORIZED => -1058471930

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_INTEGRITY_REPUTATION_MALICIOUS => -1058471929

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_INTEGRITY_REPUTATION_PUA => -1058471928

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_INTEGRITY_REPUTATION_DANGEROUS_EXT => -1058471927

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_INTEGRITY_REPUTATION_OFFLINE => -1058471926

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_INTEGRITY_REPUTATION_UNFRIENDLY_FILE => -1058471925

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_INTEGRITY_REPUTATION_UNATTAINABLE => -1058471924

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_INTEGRITY_REPUTATION_EXPLICIT_DENY_FILE => -1058471923

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SYSTEM_INTEGRITY_WHQL_NOT_SATISFIED => -1058471922

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_APPLICABLE_APP_LICENSES_FOUND => -1058406399

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLIP_LICENSE_NOT_FOUND => -1058406398

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLIP_DEVICE_LICENSE_MISSING => -1058406397

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLIP_LICENSE_INVALID_SIGNATURE => -1058406396

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLIP_KEYHOLDER_LICENSE_MISSING_OR_INVALID => -1058406395

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLIP_LICENSE_EXPIRED => -1058406394

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLIP_LICENSE_SIGNED_BY_UNKNOWN_SOURCE => -1058406393

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLIP_LICENSE_NOT_SIGNED => -1058406392

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLIP_LICENSE_HARDWARE_ID_OUT_OF_TOLERANCE => -1058406391

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_CLIP_LICENSE_DEVICE_ID_MISMATCH => -1058406390

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AUDIO_ENGINE_NODE_NOT_FOUND => -1069285375

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HDAUDIO_EMPTY_CONNECTION_LIST => -1069285374

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HDAUDIO_CONNECTION_LIST_NOT_SUPPORTED => -1069285373

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HDAUDIO_NO_LOGICAL_DEVICES_CREATED => -1069285372

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_HDAUDIO_NULL_LINKED_LIST_ENTRY => -1069285371

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SOUNDWIRE_COMMAND_ABORTED => -1069285370

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SOUNDWIRE_COMMAND_IGNORED => -1069285369

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SOUNDWIRE_COMMAND_FAILED => -1069285368

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_REPAIRED => 15138816

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_PAUSE => 15138817

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_COMPLETE => 15138818

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_REDIRECT => 15138819

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_FAULT_DOMAIN_TYPE_INVALID => -1058603007

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_RESILIENCY_TYPE_INVALID => -1058603005

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_DRIVE_SECTOR_SIZE_INVALID => -1058603004

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_DRIVE_REDUNDANCY_INVALID => -1058603002

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_NUMBER_OF_DATA_COPIES_INVALID => -1058603001

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_INTERLEAVE_LENGTH_INVALID => -1058602999

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_NUMBER_OF_COLUMNS_INVALID => -1058602998

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_NOT_ENOUGH_DRIVES => -1058602997

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_EXTENDED_ERROR => -1058602996

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_PROVISIONING_TYPE_INVALID => -1058602995

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_ALLOCATION_SIZE_INVALID => -1058602994

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_ENCLOSURE_AWARE_INVALID => -1058602993

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_WRITE_CACHE_SIZE_INVALID => -1058602992

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_NUMBER_OF_GROUPS_INVALID => -1058602991

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_DRIVE_OPERATIONAL_STATE_INVALID => -1058602990

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_UPDATE_COLUMN_STATE => -1058602989

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_MAP_REQUIRED => -1058602988

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_UNSUPPORTED_VERSION => -1058602987

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_CORRUPT_METADATA => -1058602986

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_DRT_FULL => -1058602985

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_INCONSISTENCY => -1058602984

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_LOG_NOT_READY => -1058602983

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_NO_REDUNDANCY => -1058602982

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_DRIVE_NOT_READY => -1058602981

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_DRIVE_SPLIT => -1058602980

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_DRIVE_LOST_DATA => -1058602979

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_ENTRY_INCOMPLETE => -1058602978

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_ENTRY_INVALID => -1058602977

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_MARK_DIRTY => -1058602976

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_PD_NOT_FOUND => -1058602975

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_PD_LENGTH_MISMATCH => -1058602974

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_PD_UNSUPPORTED_VERSION => -1058602973

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_PD_INVALID_DATA => -1058602972

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_FLUSH_METADATA => -1058602971

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_CACHE_FULL => -1058602970

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SPACES_REPAIR_IN_PROGRESS => -1058602969

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLSNAP_BOOTFILE_NOT_VALID => -1068498941

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLSNAP_ACTIVATION_TIMEOUT => -1068498940

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VOLSNAP_NO_BYPASSIO_WITH_SNAPSHOT => -1068498939

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IO_PREEMPTED => -1068433407

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SVHDX_ERROR_STORED => -1067712512

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SVHDX_ERROR_NOT_AVAILABLE => -1067647232

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SVHDX_UNIT_ATTENTION_AVAILABLE => -1067647231

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SVHDX_UNIT_ATTENTION_CAPACITY_DATA_CHANGED => -1067647230

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SVHDX_UNIT_ATTENTION_RESERVATIONS_PREEMPTED => -1067647229

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SVHDX_UNIT_ATTENTION_RESERVATIONS_RELEASED => -1067647228

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SVHDX_UNIT_ATTENTION_REGISTRATIONS_PREEMPTED => -1067647227

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SVHDX_UNIT_ATTENTION_OPERATING_DEFINITION_CHANGED => -1067647226

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SVHDX_RESERVATION_CONFLICT => -1067647225

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SVHDX_WRONG_FILE_TYPE => -1067647224

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SVHDX_VERSION_MISMATCH => -1067647223

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHD_SHARED => -1067647222

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SVHDX_NO_INITIATOR => -1067647221

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VHDSET_BACKING_STORAGE_NOT_FOUND => -1067647220

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMB_NO_PREAUTH_INTEGRITY_HASH_OVERLAP => -1067646976

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMB_BAD_CLUSTER_DIALECT => -1067646975

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMB_GUEST_LOGON_BLOCKED => -1067646974

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMB_NO_SIGNING_ALGORITHM_OVERLAP => -1067646973

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NETWORK_AUTHENTICATION_PROMPT_CANCELED => -1067646972

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_REMOTE_MAILSLOTS_DEPRECATED => -1067646971

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMB_GUEST_LOGON_BLOCKED_SIGNING_REQUIRED => -1067646970

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMB_GUEST_ENCRYPTION_NOT_SUPPORTED => -1067646969

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMB_ENCRYPTION_NOT_SUPPORTED_BY_PEER => -1067646968

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SMB_TLS_ACCESS_DENIED => -1067646967

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_SECCORE_INVALID_COMMAND => -1058537472

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VSM_NOT_INITIALIZED => -1069219840

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VSM_DMA_PROTECTION_NOT_IN_USE => -1069219839

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VSM_KEY_CI_POLICY_ROLLBACK_DETECTED => -1069219838

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VSMIDK_KEYGEN_FAILURE => -1069219837

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VSMIDK_EXPORT_FAILURE => -1069219836

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_VSMIDK_MODULUS_MISMATCH => -1069219835

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPEXEC_CONDITION_NOT_SATISFIED => -1058275328

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPEXEC_HANDLE_INVALIDATED => -1058275327

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPEXEC_INVALID_HOST_GENERATION => -1058275326

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPEXEC_UNEXPECTED_PROCESS_REGISTRATION => -1058275325

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPEXEC_INVALID_HOST_STATE => -1058275324

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPEXEC_NO_DONOR => -1058275323

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPEXEC_HOST_ID_MISMATCH => -1058275322

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPEXEC_UNKNOWN_USER => -1058275321

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPEXEC_APP_COMPAT_BLOCK => -1058275320

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPEXEC_CALLER_WAIT_TIMEOUT => -1058275319

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPEXEC_CALLER_WAIT_TIMEOUT_TERMINATION => -1058275318

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPEXEC_CALLER_WAIT_TIMEOUT_LICENSING => -1058275317

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_APPEXEC_CALLER_WAIT_TIMEOUT_RESOURCES => -1058275316

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_HANDSHAKE_FAILURE => -1071382528

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_VER_NEG_FAILURE => -1071382527

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_USER_CANCELED => -1071382526

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_INTERNAL_ERROR => -1071382525

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_PROTOCOL_VIOLATION => -1071382524

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_CONNECTION_IDLE => -1071382523

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_CONNECTION_TIMEOUT => -1071382522

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_ALPN_NEG_FAILURE => -1071382521

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_STREAM_LIMIT_REACHED => -1071382520

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_ALPN_IN_USE => -1071382519

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_TLS_UNEXPECTED_MESSAGE => -1071382262

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_TLS_BAD_CERTIFICATE => -1071382230

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_TLS_UNSUPPORTED_CERTIFICATE => -1071382229

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_TLS_CERTIFICATE_REVOKED => -1071382228

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_TLS_CERTIFICATE_EXPIRED => -1071382227

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_TLS_CERTIFICATE_UNKNOWN => -1071382226

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_TLS_ILLEGAL_PARAMETER => -1071382225

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_TLS_UNKNOWN_CA => -1071382224

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_TLS_ACCESS_DENIED => -1071382223

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_TLS_INSUFFICIENT_SECURITY => -1071382201

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_TLS_INTERNAL_ERROR => -1071382192

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_TLS_USER_CANCELED => -1071382182

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_QUIC_TLS_CERTIFICATE_REQUIRED => -1071382156

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IORING_REQUIRED_FLAG_NOT_SUPPORTED => -1069154303

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IORING_SUBMISSION_QUEUE_FULL => -1069154302

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IORING_VERSION_NOT_SUPPORTED => -1069154301

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IORING_SUBMISSION_QUEUE_TOO_BIG => -1069154300

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IORING_COMPLETION_QUEUE_TOO_BIG => -1069154299

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IORING_SUBMIT_IN_PROGRESS => -1069154298

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IORING_CORRUPT => -1069154297

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_IORING_COMPLETION_QUEUE_TOO_FULL => -1069154296

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRM_HANDLER_NOT_FOUND => -1058143744

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRM_CONCURRENT_OPERATION => -1058143742

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRM_MODULE_UPDATE_PENDING => -1058143741

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRM_MODULE_LOCKED => -1058143740

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRM_UPDATE_INCOMPATIBLE_VERSION => -1058143739

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRM_UPDATE_MODULE_MISMATCH => -1058143738

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRM_UPDATE_MODULE_NOT_FOUND => -1058143737

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRM_UPDATE_MISSING_EXPORT => -1058143736

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRM_UPDATE_MODULE_LOCKED => -1058143735

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRM_UPDATE_BAD_SIGNATURE => -1058143734

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRM_UPDATE_VERSION_MISMATCH => -1058143733

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRM_MODULE_UNLOCKED => -1058143732

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_PRM_INTERFACE_INACCESSIBLE => -1058143731

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ACCELERATOR_SUBMISSION_QUEUE_FULL => -1058078719

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AAD_CLOUDAP_E_APNONCE_INVALID => -1073445552

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AAD_CLOUDAP_E_BAD_DEVICE_ACCESS_TOKEN_FORMAT => -1073445551

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AAD_CLOUDAP_E_ASSERTION_MALFORMED => -1073445550

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AAD_CLOUDAP_E_INVALID_TENANT => -1073445549

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AAD_CLOUDAP_E_INVALID_DEVICE => -1073445548

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AAD_CLOUDAP_E_INVALID_ACCESS_TOKEN => -1073445546

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AAD_CLOUDAP_E_INVALID_BINDING_KEY_ID => -1073445545

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AAD_CLOUDAP_E_CANT_FIND_ROOT_CERT => -1073445543

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AAD_CLOUDAP_E_ASSERTION_INVALID => -1073445542

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_AAD_CLOUDAP_E_CALLER_MISMATCH => -1073445541

    /**
     * @type {Integer (UInt32)}
     */
    static WINVER => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static APP_LOCAL_DEVICE_ID_SIZE => 32

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_NO_MORE_ENTRIES => 1772

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_SS_CHAR_TRANS_OPEN_FAIL => 1773

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_SS_CHAR_TRANS_SHORT_FILE => 1774

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_SS_IN_NULL_CONTEXT => 1775

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_SS_CONTEXT_DAMAGED => 1777

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_SS_HANDLES_MISMATCH => 1778

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_SS_CANNOT_GET_CALL_HANDLE => 1779

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_NULL_REF_POINTER => 1780

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_ENUM_VALUE_OUT_OF_RANGE => 1781

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_BYTE_COUNT_TOO_SMALL => 1782

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_BAD_STUB_DATA => 1783

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_INVALID_ES_ACTION => 1827

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_WRONG_ES_VERSION => 1828

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_WRONG_STUB_VERSION => 1829

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_INVALID_PIPE_OBJECT => 1830

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_WRONG_PIPE_ORDER => 1831

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_WRONG_PIPE_VERSION => 1832

    /**
     * @type {Integer (Int32)}
     */
    static OR_INVALID_OXID => 1910

    /**
     * @type {Integer (Int32)}
     */
    static OR_INVALID_OID => 1911

    /**
     * @type {Integer (Int32)}
     */
    static OR_INVALID_SET => 1912

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_PIPE_CLOSED => 1916

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_PIPE_DISCIPLINE_ERROR => 1917

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_PIPE_EMPTY => 1918

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_CONTENTINFO_VERSION_UNSUPPORTED => 4050

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_CANNOT_PARSE_CONTENTINFO => 4051

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_MISSING_DATA => 4052

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_NO_MORE => 4053

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_NOT_INITIALIZED => 4054

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_ALREADY_INITIALIZED => 4055

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_SHUTDOWN_IN_PROGRESS => 4056

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_INVALIDATED => 4057

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_ALREADY_EXISTS => 4058

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_OPERATION_NOTFOUND => 4059

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_ALREADY_COMPLETED => 4060

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_OUT_OF_BOUNDS => 4061

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_VERSION_UNSUPPORTED => 4062

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_INVALID_CONFIGURATION => 4063

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_NOT_LICENSED => 4064

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_SERVICE_UNAVAILABLE => 4065

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_ERROR_TRUST_FAILURE => 4066

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_SERVICE_NOT_LOCALSYSTEM => 6200

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_INVALID_API_SEQUENCE => 8001

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_STARTING_SERVICE => 8002

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_STOPPING_SERVICE => 8003

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_INTERNAL_API => 8004

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_INTERNAL => 8005

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_SERVICE_COMM => 8006

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_INSUFFICIENT_PRIV => 8007

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_AUTHENTICATION => 8008

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_PARENT_INSUFFICIENT_PRIV => 8009

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_PARENT_AUTHENTICATION => 8010

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_CHILD_TO_PARENT_COMM => 8011

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_PARENT_TO_CHILD_COMM => 8012

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_SYSVOL_POPULATE => 8013

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_SYSVOL_POPULATE_TIMEOUT => 8014

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_SYSVOL_IS_BUSY => 8015

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_SYSVOL_DEMOTE => 8016

    /**
     * @type {Integer (Int32)}
     */
    static FRS_ERR_INVALID_SERVICE_PARAMETER => 8017

    /**
     * @type {Integer (Int32)}
     */
    static DNS_INFO_NO_RECORDS => 9501

    /**
     * @type {Integer (Int32)}
     */
    static DNS_REQUEST_PENDING => 9506

    /**
     * @type {Integer (Int32)}
     */
    static DNS_STATUS_FQDN => 9557

    /**
     * @type {Integer (Int32)}
     */
    static DNS_STATUS_DOTTED_NAME => 9558

    /**
     * @type {Integer (Int32)}
     */
    static DNS_STATUS_SINGLE_PART_NAME => 9559

    /**
     * @type {Integer (Int32)}
     */
    static DNS_WARNING_PTR_CREATE_FAILED => 9715

    /**
     * @type {Integer (Int32)}
     */
    static DNS_WARNING_DOMAIN_UNDELETED => 9716

    /**
     * @type {Integer (Int32)}
     */
    static DNS_INFO_AXFR_COMPLETE => 9751

    /**
     * @type {Integer (Int32)}
     */
    static DNS_INFO_ADDED_LOCAL_WINS => 9753

    /**
     * @type {Integer (Int32)}
     */
    static DNS_STATUS_CONTINUE_NEEDED => 9801

    /**
     * @type {Integer (Int32)}
     */
    static WARNING_IPSEC_MM_POLICY_PRUNED => 13024

    /**
     * @type {Integer (Int32)}
     */
    static WARNING_IPSEC_QM_POLICY_PRUNED => 13025

    /**
     * @type {Integer (Int32)}
     */
    static STORE_ERROR_UNLICENSED => 15861

    /**
     * @type {Integer (Int32)}
     */
    static STORE_ERROR_UNLICENSED_USER => 15862

    /**
     * @type {Integer (Int32)}
     */
    static STORE_ERROR_PENDING_COM_TRANSACTION => 15863

    /**
     * @type {Integer (Int32)}
     */
    static STORE_ERROR_LICENSE_REVOKED => 15864

    /**
     * @type {Integer (UInt32)}
     */
    static SEVERITY_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SEVERITY_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NOERROR => 0

    /**
     * @type {Integer (Int32)}
     */
    static E_UNEXPECTED => -2147418113

    /**
     * @type {Integer (Int32)}
     */
    static E_NOINTERFACE => -2147467262

    /**
     * @type {Integer (Int32)}
     */
    static E_POINTER => -2147467261

    /**
     * @type {Integer (Int32)}
     */
    static E_HANDLE => -2147024890

    /**
     * @type {Integer (Int32)}
     */
    static E_ABORT => -2147467260

    /**
     * @type {Integer (Int32)}
     */
    static E_ACCESSDENIED => -2147024891

    /**
     * @type {Integer (Int32)}
     */
    static E_BOUNDS => -2147483637

    /**
     * @type {Integer (Int32)}
     */
    static E_CHANGED_STATE => -2147483636

    /**
     * @type {Integer (Int32)}
     */
    static E_ILLEGAL_STATE_CHANGE => -2147483635

    /**
     * @type {Integer (Int32)}
     */
    static E_ILLEGAL_METHOD_CALL => -2147483634

    /**
     * @type {Integer (Int32)}
     */
    static RO_E_METADATA_NAME_NOT_FOUND => -2147483633

    /**
     * @type {Integer (Int32)}
     */
    static RO_E_METADATA_NAME_IS_NAMESPACE => -2147483632

    /**
     * @type {Integer (Int32)}
     */
    static RO_E_METADATA_INVALID_TYPE_FORMAT => -2147483631

    /**
     * @type {Integer (Int32)}
     */
    static RO_E_INVALID_METADATA_FILE => -2147483630

    /**
     * @type {Integer (Int32)}
     */
    static RO_E_CLOSED => -2147483629

    /**
     * @type {Integer (Int32)}
     */
    static RO_E_EXCLUSIVE_WRITE => -2147483628

    /**
     * @type {Integer (Int32)}
     */
    static RO_E_CHANGE_NOTIFICATION_IN_PROGRESS => -2147483627

    /**
     * @type {Integer (Int32)}
     */
    static RO_E_ERROR_STRING_NOT_FOUND => -2147483626

    /**
     * @type {Integer (Int32)}
     */
    static E_STRING_NOT_NULL_TERMINATED => -2147483625

    /**
     * @type {Integer (Int32)}
     */
    static E_ILLEGAL_DELEGATE_ASSIGNMENT => -2147483624

    /**
     * @type {Integer (Int32)}
     */
    static E_ASYNC_OPERATION_NOT_STARTED => -2147483623

    /**
     * @type {Integer (Int32)}
     */
    static E_APPLICATION_EXITING => -2147483622

    /**
     * @type {Integer (Int32)}
     */
    static E_APPLICATION_VIEW_EXITING => -2147483621

    /**
     * @type {Integer (Int32)}
     */
    static RO_E_MUST_BE_AGILE => -2147483620

    /**
     * @type {Integer (Int32)}
     */
    static RO_E_UNSUPPORTED_FROM_MTA => -2147483619

    /**
     * @type {Integer (Int32)}
     */
    static RO_E_COMMITTED => -2147483618

    /**
     * @type {Integer (Int32)}
     */
    static RO_E_BLOCKED_CROSS_ASTA_CALL => -2147483617

    /**
     * @type {Integer (Int32)}
     */
    static RO_E_CANNOT_ACTIVATE_FULL_TRUST_SERVER => -2147483616

    /**
     * @type {Integer (Int32)}
     */
    static RO_E_CANNOT_ACTIVATE_UNIVERSAL_APPLICATION_SERVER => -2147483615

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INIT_TLS => -2147467258

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INIT_SHARED_ALLOCATOR => -2147467257

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INIT_MEMORY_ALLOCATOR => -2147467256

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INIT_CLASS_CACHE => -2147467255

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INIT_RPC_CHANNEL => -2147467254

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INIT_TLS_SET_CHANNEL_CONTROL => -2147467253

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INIT_TLS_CHANNEL_CONTROL => -2147467252

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INIT_UNACCEPTED_USER_ALLOCATOR => -2147467251

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INIT_SCM_MUTEX_EXISTS => -2147467250

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INIT_SCM_FILE_MAPPING_EXISTS => -2147467249

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INIT_SCM_MAP_VIEW_OF_FILE => -2147467248

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INIT_SCM_EXEC_FAILURE => -2147467247

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INIT_ONLY_SINGLE_THREADED => -2147467246

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_CANT_REMOTE => -2147467245

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_BAD_SERVER_NAME => -2147467244

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_WRONG_SERVER_IDENTITY => -2147467243

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_OLE1DDE_DISABLED => -2147467242

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_RUNAS_SYNTAX => -2147467241

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_CREATEPROCESS_FAILURE => -2147467240

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_RUNAS_CREATEPROCESS_FAILURE => -2147467239

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_RUNAS_LOGON_FAILURE => -2147467238

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_LAUNCH_PERMSSION_DENIED => -2147467237

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_START_SERVICE_FAILURE => -2147467236

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_REMOTE_COMMUNICATION_FAILURE => -2147467235

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_SERVER_START_TIMEOUT => -2147467234

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_CLSREG_INCONSISTENT => -2147467233

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_IIDREG_INCONSISTENT => -2147467232

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_NOT_SUPPORTED => -2147467231

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_RELOAD_DLL => -2147467230

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_MSI_ERROR => -2147467229

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_ATTEMPT_TO_CREATE_OUTSIDE_CLIENT_CONTEXT => -2147467228

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_SERVER_PAUSED => -2147467227

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_SERVER_NOT_PAUSED => -2147467226

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_CLASS_DISABLED => -2147467225

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_CLRNOTAVAILABLE => -2147467224

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_ASYNC_WORK_REJECTED => -2147467223

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_SERVER_INIT_TIMEOUT => -2147467222

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_NO_SECCTX_IN_ACTIVATE => -2147467221

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_TRACKER_CONFIG => -2147467216

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_THREADPOOL_CONFIG => -2147467215

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_SXS_CONFIG => -2147467214

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_MALFORMED_SPN => -2147467213

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_UNREVOKED_REGISTRATION_ON_APARTMENT_SHUTDOWN => -2147467212

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_PREMATURE_STUB_RUNDOWN => -2147467211

    /**
     * @type {Integer (Int32)}
     */
    static S_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static S_FALSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_FIRST => -2147221504

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_LAST => -2147221249

    /**
     * @type {Integer (Int32)}
     */
    static OLE_S_FIRST => 262144

    /**
     * @type {Integer (Int32)}
     */
    static OLE_S_LAST => 262399

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_OLEVERB => -2147221504

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_ADVF => -2147221503

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_ENUM_NOMORE => -2147221502

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_ADVISENOTSUPPORTED => -2147221501

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_NOCONNECTION => -2147221500

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_NOTRUNNING => -2147221499

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_NOCACHE => -2147221498

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_BLANK => -2147221497

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_CLASSDIFF => -2147221496

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_CANT_GETMONIKER => -2147221495

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_CANT_BINDTOSOURCE => -2147221494

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_STATIC => -2147221493

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_PROMPTSAVECANCELLED => -2147221492

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_INVALIDRECT => -2147221491

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_WRONGCOMPOBJ => -2147221490

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_INVALIDHWND => -2147221489

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_NOT_INPLACEACTIVE => -2147221488

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_CANTCONVERT => -2147221487

    /**
     * @type {Integer (Int32)}
     */
    static OLE_E_NOSTORAGE => -2147221486

    /**
     * @type {Integer (Int32)}
     */
    static DV_E_FORMATETC => -2147221404

    /**
     * @type {Integer (Int32)}
     */
    static DV_E_DVTARGETDEVICE => -2147221403

    /**
     * @type {Integer (Int32)}
     */
    static DV_E_STGMEDIUM => -2147221402

    /**
     * @type {Integer (Int32)}
     */
    static DV_E_STATDATA => -2147221401

    /**
     * @type {Integer (Int32)}
     */
    static DV_E_LINDEX => -2147221400

    /**
     * @type {Integer (Int32)}
     */
    static DV_E_TYMED => -2147221399

    /**
     * @type {Integer (Int32)}
     */
    static DV_E_CLIPFORMAT => -2147221398

    /**
     * @type {Integer (Int32)}
     */
    static DV_E_DVASPECT => -2147221397

    /**
     * @type {Integer (Int32)}
     */
    static DV_E_DVTARGETDEVICE_SIZE => -2147221396

    /**
     * @type {Integer (Int32)}
     */
    static DV_E_NOIVIEWOBJECT => -2147221395

    /**
     * @type {Integer (Int32)}
     */
    static DRAGDROP_E_FIRST => -2147221248

    /**
     * @type {Integer (Int32)}
     */
    static DRAGDROP_E_LAST => -2147221233

    /**
     * @type {Integer (Int32)}
     */
    static DRAGDROP_S_FIRST => 262400

    /**
     * @type {Integer (Int32)}
     */
    static DRAGDROP_S_LAST => 262415

    /**
     * @type {Integer (Int32)}
     */
    static DRAGDROP_E_NOTREGISTERED => -2147221248

    /**
     * @type {Integer (Int32)}
     */
    static DRAGDROP_E_ALREADYREGISTERED => -2147221247

    /**
     * @type {Integer (Int32)}
     */
    static DRAGDROP_E_INVALIDHWND => -2147221246

    /**
     * @type {Integer (Int32)}
     */
    static DRAGDROP_E_CONCURRENT_DRAG_ATTEMPTED => -2147221245

    /**
     * @type {Integer (Int32)}
     */
    static CLASSFACTORY_E_FIRST => -2147221232

    /**
     * @type {Integer (Int32)}
     */
    static CLASSFACTORY_E_LAST => -2147221217

    /**
     * @type {Integer (Int32)}
     */
    static CLASSFACTORY_S_FIRST => 262416

    /**
     * @type {Integer (Int32)}
     */
    static CLASSFACTORY_S_LAST => 262431

    /**
     * @type {Integer (Int32)}
     */
    static CLASS_E_NOAGGREGATION => -2147221232

    /**
     * @type {Integer (Int32)}
     */
    static CLASS_E_CLASSNOTAVAILABLE => -2147221231

    /**
     * @type {Integer (Int32)}
     */
    static CLASS_E_NOTLICENSED => -2147221230

    /**
     * @type {Integer (Int32)}
     */
    static MARSHAL_E_FIRST => -2147221216

    /**
     * @type {Integer (Int32)}
     */
    static MARSHAL_E_LAST => -2147221201

    /**
     * @type {Integer (Int32)}
     */
    static MARSHAL_S_FIRST => 262432

    /**
     * @type {Integer (Int32)}
     */
    static MARSHAL_S_LAST => 262447

    /**
     * @type {Integer (Int32)}
     */
    static DATA_E_FIRST => -2147221200

    /**
     * @type {Integer (Int32)}
     */
    static DATA_E_LAST => -2147221185

    /**
     * @type {Integer (Int32)}
     */
    static DATA_S_FIRST => 262448

    /**
     * @type {Integer (Int32)}
     */
    static DATA_S_LAST => 262463

    /**
     * @type {Integer (Int32)}
     */
    static VIEW_E_FIRST => -2147221184

    /**
     * @type {Integer (Int32)}
     */
    static VIEW_E_LAST => -2147221169

    /**
     * @type {Integer (Int32)}
     */
    static VIEW_S_FIRST => 262464

    /**
     * @type {Integer (Int32)}
     */
    static VIEW_S_LAST => 262479

    /**
     * @type {Integer (Int32)}
     */
    static VIEW_E_DRAW => -2147221184

    /**
     * @type {Integer (Int32)}
     */
    static REGDB_E_FIRST => -2147221168

    /**
     * @type {Integer (Int32)}
     */
    static REGDB_E_LAST => -2147221153

    /**
     * @type {Integer (Int32)}
     */
    static REGDB_S_FIRST => 262480

    /**
     * @type {Integer (Int32)}
     */
    static REGDB_S_LAST => 262495

    /**
     * @type {Integer (Int32)}
     */
    static REGDB_E_READREGDB => -2147221168

    /**
     * @type {Integer (Int32)}
     */
    static REGDB_E_WRITEREGDB => -2147221167

    /**
     * @type {Integer (Int32)}
     */
    static REGDB_E_KEYMISSING => -2147221166

    /**
     * @type {Integer (Int32)}
     */
    static REGDB_E_INVALIDVALUE => -2147221165

    /**
     * @type {Integer (Int32)}
     */
    static REGDB_E_CLASSNOTREG => -2147221164

    /**
     * @type {Integer (Int32)}
     */
    static REGDB_E_IIDNOTREG => -2147221163

    /**
     * @type {Integer (Int32)}
     */
    static REGDB_E_BADTHREADINGMODEL => -2147221162

    /**
     * @type {Integer (Int32)}
     */
    static REGDB_E_PACKAGEPOLICYVIOLATION => -2147221161

    /**
     * @type {Integer (Int32)}
     */
    static CAT_E_FIRST => -2147221152

    /**
     * @type {Integer (Int32)}
     */
    static CAT_E_LAST => -2147221151

    /**
     * @type {Integer (Int32)}
     */
    static CAT_E_CATIDNOEXIST => -2147221152

    /**
     * @type {Integer (Int32)}
     */
    static CAT_E_NODESCRIPTION => -2147221151

    /**
     * @type {Integer (Int32)}
     */
    static CS_E_FIRST => -2147221148

    /**
     * @type {Integer (Int32)}
     */
    static CS_E_LAST => -2147221137

    /**
     * @type {Integer (Int32)}
     */
    static CS_E_PACKAGE_NOTFOUND => -2147221148

    /**
     * @type {Integer (Int32)}
     */
    static CS_E_NOT_DELETABLE => -2147221147

    /**
     * @type {Integer (Int32)}
     */
    static CS_E_CLASS_NOTFOUND => -2147221146

    /**
     * @type {Integer (Int32)}
     */
    static CS_E_INVALID_VERSION => -2147221145

    /**
     * @type {Integer (Int32)}
     */
    static CS_E_NO_CLASSSTORE => -2147221144

    /**
     * @type {Integer (Int32)}
     */
    static CS_E_OBJECT_NOTFOUND => -2147221143

    /**
     * @type {Integer (Int32)}
     */
    static CS_E_OBJECT_ALREADY_EXISTS => -2147221142

    /**
     * @type {Integer (Int32)}
     */
    static CS_E_INVALID_PATH => -2147221141

    /**
     * @type {Integer (Int32)}
     */
    static CS_E_NETWORK_ERROR => -2147221140

    /**
     * @type {Integer (Int32)}
     */
    static CS_E_ADMIN_LIMIT_EXCEEDED => -2147221139

    /**
     * @type {Integer (Int32)}
     */
    static CS_E_SCHEMA_MISMATCH => -2147221138

    /**
     * @type {Integer (Int32)}
     */
    static CS_E_INTERNAL_ERROR => -2147221137

    /**
     * @type {Integer (Int32)}
     */
    static CACHE_E_FIRST => -2147221136

    /**
     * @type {Integer (Int32)}
     */
    static CACHE_E_LAST => -2147221121

    /**
     * @type {Integer (Int32)}
     */
    static CACHE_S_FIRST => 262512

    /**
     * @type {Integer (Int32)}
     */
    static CACHE_S_LAST => 262527

    /**
     * @type {Integer (Int32)}
     */
    static CACHE_E_NOCACHE_UPDATED => -2147221136

    /**
     * @type {Integer (Int32)}
     */
    static OLEOBJ_E_FIRST => -2147221120

    /**
     * @type {Integer (Int32)}
     */
    static OLEOBJ_E_LAST => -2147221105

    /**
     * @type {Integer (Int32)}
     */
    static OLEOBJ_S_FIRST => 262528

    /**
     * @type {Integer (Int32)}
     */
    static OLEOBJ_S_LAST => 262543

    /**
     * @type {Integer (Int32)}
     */
    static OLEOBJ_E_NOVERBS => -2147221120

    /**
     * @type {Integer (Int32)}
     */
    static OLEOBJ_E_INVALIDVERB => -2147221119

    /**
     * @type {Integer (Int32)}
     */
    static CLIENTSITE_E_FIRST => -2147221104

    /**
     * @type {Integer (Int32)}
     */
    static CLIENTSITE_E_LAST => -2147221089

    /**
     * @type {Integer (Int32)}
     */
    static CLIENTSITE_S_FIRST => 262544

    /**
     * @type {Integer (Int32)}
     */
    static CLIENTSITE_S_LAST => 262559

    /**
     * @type {Integer (Int32)}
     */
    static INPLACE_E_NOTUNDOABLE => -2147221088

    /**
     * @type {Integer (Int32)}
     */
    static INPLACE_E_NOTOOLSPACE => -2147221087

    /**
     * @type {Integer (Int32)}
     */
    static INPLACE_E_FIRST => -2147221088

    /**
     * @type {Integer (Int32)}
     */
    static INPLACE_E_LAST => -2147221073

    /**
     * @type {Integer (Int32)}
     */
    static INPLACE_S_FIRST => 262560

    /**
     * @type {Integer (Int32)}
     */
    static INPLACE_S_LAST => 262575

    /**
     * @type {Integer (Int32)}
     */
    static ENUM_E_FIRST => -2147221072

    /**
     * @type {Integer (Int32)}
     */
    static ENUM_E_LAST => -2147221057

    /**
     * @type {Integer (Int32)}
     */
    static ENUM_S_FIRST => 262576

    /**
     * @type {Integer (Int32)}
     */
    static ENUM_S_LAST => 262591

    /**
     * @type {Integer (Int32)}
     */
    static CONVERT10_E_FIRST => -2147221056

    /**
     * @type {Integer (Int32)}
     */
    static CONVERT10_E_LAST => -2147221041

    /**
     * @type {Integer (Int32)}
     */
    static CONVERT10_S_FIRST => 262592

    /**
     * @type {Integer (Int32)}
     */
    static CONVERT10_S_LAST => 262607

    /**
     * @type {Integer (Int32)}
     */
    static CONVERT10_E_OLESTREAM_GET => -2147221056

    /**
     * @type {Integer (Int32)}
     */
    static CONVERT10_E_OLESTREAM_PUT => -2147221055

    /**
     * @type {Integer (Int32)}
     */
    static CONVERT10_E_OLESTREAM_FMT => -2147221054

    /**
     * @type {Integer (Int32)}
     */
    static CONVERT10_E_OLESTREAM_BITMAP_TO_DIB => -2147221053

    /**
     * @type {Integer (Int32)}
     */
    static CONVERT10_E_STG_FMT => -2147221052

    /**
     * @type {Integer (Int32)}
     */
    static CONVERT10_E_STG_NO_STD_STREAM => -2147221051

    /**
     * @type {Integer (Int32)}
     */
    static CONVERT10_E_STG_DIB_TO_BITMAP => -2147221050

    /**
     * @type {Integer (Int32)}
     */
    static CONVERT10_E_OLELINK_DISABLED => -2147221049

    /**
     * @type {Integer (Int32)}
     */
    static CLIPBRD_E_FIRST => -2147221040

    /**
     * @type {Integer (Int32)}
     */
    static CLIPBRD_E_LAST => -2147221025

    /**
     * @type {Integer (Int32)}
     */
    static CLIPBRD_S_FIRST => 262608

    /**
     * @type {Integer (Int32)}
     */
    static CLIPBRD_S_LAST => 262623

    /**
     * @type {Integer (Int32)}
     */
    static CLIPBRD_E_CANT_OPEN => -2147221040

    /**
     * @type {Integer (Int32)}
     */
    static CLIPBRD_E_CANT_EMPTY => -2147221039

    /**
     * @type {Integer (Int32)}
     */
    static CLIPBRD_E_CANT_SET => -2147221038

    /**
     * @type {Integer (Int32)}
     */
    static CLIPBRD_E_BAD_DATA => -2147221037

    /**
     * @type {Integer (Int32)}
     */
    static CLIPBRD_E_CANT_CLOSE => -2147221036

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_FIRST => -2147221024

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_LAST => -2147221009

    /**
     * @type {Integer (Int32)}
     */
    static MK_S_FIRST => 262624

    /**
     * @type {Integer (Int32)}
     */
    static MK_S_LAST => 262639

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_CONNECTMANUALLY => -2147221024

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_EXCEEDEDDEADLINE => -2147221023

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_NEEDGENERIC => -2147221022

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_UNAVAILABLE => -2147221021

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_SYNTAX => -2147221020

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_NOOBJECT => -2147221019

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_INVALIDEXTENSION => -2147221018

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_INTERMEDIATEINTERFACENOTSUPPORTED => -2147221017

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_NOTBINDABLE => -2147221016

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_NOTBOUND => -2147221015

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_CANTOPENFILE => -2147221014

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_MUSTBOTHERUSER => -2147221013

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_NOINVERSE => -2147221012

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_NOSTORAGE => -2147221011

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_NOPREFIX => -2147221010

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_ENUMERATION_FAILED => -2147221009

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_FIRST => -2147221008

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_LAST => -2147220993

    /**
     * @type {Integer (Int32)}
     */
    static CO_S_FIRST => 262640

    /**
     * @type {Integer (Int32)}
     */
    static CO_S_LAST => 262655

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_ALREADYINITIALIZED => -2147221007

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_CANTDETERMINECLASS => -2147221006

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_CLASSSTRING => -2147221005

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_IIDSTRING => -2147221004

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_APPNOTFOUND => -2147221003

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_APPSINGLEUSE => -2147221002

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_ERRORINAPP => -2147221001

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_DLLNOTFOUND => -2147221000

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_ERRORINDLL => -2147220999

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_WRONGOSFORAPP => -2147220998

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_OBJNOTREG => -2147220997

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_OBJISREG => -2147220996

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_OBJNOTCONNECTED => -2147220995

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_APPDIDNTREG => -2147220994

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_RELEASED => -2147220993

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_FIRST => -2147220992

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_LAST => -2147220961

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_S_FIRST => 262656

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_S_LAST => 262687

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_S_SOME_SUBSCRIBERS_FAILED => 262656

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_ALL_SUBSCRIBERS_FAILED => -2147220991

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_S_NOSUBSCRIBERS => 262658

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_QUERYSYNTAX => -2147220989

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_QUERYFIELD => -2147220988

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_INTERNALEXCEPTION => -2147220987

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_INTERNALERROR => -2147220986

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_INVALID_PER_USER_SID => -2147220985

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_USER_EXCEPTION => -2147220984

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_TOO_MANY_METHODS => -2147220983

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_MISSING_EVENTCLASS => -2147220982

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_NOT_ALL_REMOVED => -2147220981

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_COMPLUS_NOT_INSTALLED => -2147220980

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_CANT_MODIFY_OR_DELETE_UNCONFIGURED_OBJECT => -2147220979

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_CANT_MODIFY_OR_DELETE_CONFIGURED_OBJECT => -2147220978

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_INVALID_EVENT_CLASS_PARTITION => -2147220977

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_E_PER_USER_SID_NOT_LOGGED_ON => -2147220976

    /**
     * @type {Integer (Int32)}
     */
    static TPC_E_INVALID_PROPERTY => -2147220927

    /**
     * @type {Integer (Int32)}
     */
    static TPC_E_NO_DEFAULT_TABLET => -2147220974

    /**
     * @type {Integer (Int32)}
     */
    static TPC_E_UNKNOWN_PROPERTY => -2147220965

    /**
     * @type {Integer (Int32)}
     */
    static TPC_E_INVALID_INPUT_RECT => -2147220967

    /**
     * @type {Integer (Int32)}
     */
    static TPC_E_INVALID_STROKE => -2147220958

    /**
     * @type {Integer (Int32)}
     */
    static TPC_E_INITIALIZE_FAIL => -2147220957

    /**
     * @type {Integer (Int32)}
     */
    static TPC_E_NOT_RELEVANT => -2147220942

    /**
     * @type {Integer (Int32)}
     */
    static TPC_E_INVALID_PACKET_DESCRIPTION => -2147220941

    /**
     * @type {Integer (Int32)}
     */
    static TPC_E_RECOGNIZER_NOT_REGISTERED => -2147220939

    /**
     * @type {Integer (Int32)}
     */
    static TPC_E_INVALID_RIGHTS => -2147220938

    /**
     * @type {Integer (Int32)}
     */
    static TPC_E_OUT_OF_ORDER_CALL => -2147220937

    /**
     * @type {Integer (Int32)}
     */
    static TPC_E_QUEUE_FULL => -2147220936

    /**
     * @type {Integer (Int32)}
     */
    static TPC_E_INVALID_CONFIGURATION => -2147220935

    /**
     * @type {Integer (Int32)}
     */
    static TPC_E_INVALID_DATA_FROM_RECOGNIZER => -2147220934

    /**
     * @type {Integer (Int32)}
     */
    static TPC_S_TRUNCATED => 262738

    /**
     * @type {Integer (Int32)}
     */
    static TPC_S_INTERRUPTED => 262739

    /**
     * @type {Integer (Int32)}
     */
    static TPC_S_NO_DATA_TO_PROCESS => 262740

    /**
     * @type {Integer (UInt32)}
     */
    static XACT_E_FIRST => 2147799040

    /**
     * @type {Integer (UInt32)}
     */
    static XACT_E_LAST => 2147799083

    /**
     * @type {Integer (UInt32)}
     */
    static XACT_S_FIRST => 315392

    /**
     * @type {Integer (UInt32)}
     */
    static XACT_S_LAST => 315408

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_ALREADYOTHERSINGLEPHASE => -2147168256

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_CANTRETAIN => -2147168255

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_COMMITFAILED => -2147168254

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_COMMITPREVENTED => -2147168253

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_HEURISTICABORT => -2147168252

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_HEURISTICCOMMIT => -2147168251

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_HEURISTICDAMAGE => -2147168250

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_HEURISTICDANGER => -2147168249

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_ISOLATIONLEVEL => -2147168248

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_NOASYNC => -2147168247

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_NOENLIST => -2147168246

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_NOISORETAIN => -2147168245

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_NORESOURCE => -2147168244

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_NOTCURRENT => -2147168243

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_NOTRANSACTION => -2147168242

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_NOTSUPPORTED => -2147168241

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_UNKNOWNRMGRID => -2147168240

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_WRONGSTATE => -2147168239

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_WRONGUOW => -2147168238

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_XTIONEXISTS => -2147168237

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_NOIMPORTOBJECT => -2147168236

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_INVALIDCOOKIE => -2147168235

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_INDOUBT => -2147168234

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_NOTIMEOUT => -2147168233

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_ALREADYINPROGRESS => -2147168232

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_ABORTED => -2147168231

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_LOGFULL => -2147168230

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_TMNOTAVAILABLE => -2147168229

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_CONNECTION_DOWN => -2147168228

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_CONNECTION_DENIED => -2147168227

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_REENLISTTIMEOUT => -2147168226

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_TIP_CONNECT_FAILED => -2147168225

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_TIP_PROTOCOL_ERROR => -2147168224

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_TIP_PULL_FAILED => -2147168223

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_DEST_TMNOTAVAILABLE => -2147168222

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_TIP_DISABLED => -2147168221

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_NETWORK_TX_DISABLED => -2147168220

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_PARTNER_NETWORK_TX_DISABLED => -2147168219

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_XA_TX_DISABLED => -2147168218

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_UNABLE_TO_READ_DTC_CONFIG => -2147168217

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_UNABLE_TO_LOAD_DTC_PROXY => -2147168216

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_ABORTING => -2147168215

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_PUSH_COMM_FAILURE => -2147168214

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_PULL_COMM_FAILURE => -2147168213

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_LU_TX_DISABLED => -2147168212

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_CLERKNOTFOUND => -2147168128

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_CLERKEXISTS => -2147168127

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_RECOVERYINPROGRESS => -2147168126

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_TRANSACTIONCLOSED => -2147168125

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_INVALIDLSN => -2147168124

    /**
     * @type {Integer (Int32)}
     */
    static XACT_E_REPLAYREQUEST => -2147168123

    /**
     * @type {Integer (Int32)}
     */
    static XACT_S_ASYNC => 315392

    /**
     * @type {Integer (Int32)}
     */
    static XACT_S_DEFECT => 315393

    /**
     * @type {Integer (Int32)}
     */
    static XACT_S_READONLY => 315394

    /**
     * @type {Integer (Int32)}
     */
    static XACT_S_SOMENORETAIN => 315395

    /**
     * @type {Integer (Int32)}
     */
    static XACT_S_OKINFORM => 315396

    /**
     * @type {Integer (Int32)}
     */
    static XACT_S_MADECHANGESCONTENT => 315397

    /**
     * @type {Integer (Int32)}
     */
    static XACT_S_MADECHANGESINFORM => 315398

    /**
     * @type {Integer (Int32)}
     */
    static XACT_S_ALLNORETAIN => 315399

    /**
     * @type {Integer (Int32)}
     */
    static XACT_S_ABORTING => 315400

    /**
     * @type {Integer (Int32)}
     */
    static XACT_S_SINGLEPHASE => 315401

    /**
     * @type {Integer (Int32)}
     */
    static XACT_S_LOCALLY_OK => 315402

    /**
     * @type {Integer (Int32)}
     */
    static XACT_S_LASTRESOURCEMANAGER => 315408

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_E_FIRST => -2147164160

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_E_LAST => -2147164113

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_S_FIRST => 319488

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_S_LAST => 319535

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_E_ABORTED => -2147164158

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_E_ABORTING => -2147164157

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_E_NOCONTEXT => -2147164156

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_E_WOULD_DEADLOCK => -2147164155

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_E_SYNCH_TIMEOUT => -2147164154

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_E_OLDREF => -2147164153

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_E_ROLENOTFOUND => -2147164148

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_E_TMNOTAVAILABLE => -2147164145

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_ACTIVATIONFAILED => -2147164127

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_ACTIVATIONFAILED_EVENTLOGGED => -2147164126

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_ACTIVATIONFAILED_CATALOGERROR => -2147164125

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_ACTIVATIONFAILED_TIMEOUT => -2147164124

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INITIALIZATIONFAILED => -2147164123

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_E_NOJIT => -2147164122

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_E_NOTRANSACTION => -2147164121

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_THREADINGMODEL_CHANGED => -2147164120

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_NOIISINTRINSICS => -2147164119

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_NOCOOKIES => -2147164118

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_DBERROR => -2147164117

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_NOTPOOLED => -2147164116

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_NOTCONSTRUCTED => -2147164115

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_NOSYNCHRONIZATION => -2147164114

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_ISOLEVELMISMATCH => -2147164113

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_CALL_OUT_OF_TX_SCOPE_NOT_ALLOWED => -2147164112

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_EXIT_TRANSACTION_SCOPE_NOT_CALLED => -2147164111

    /**
     * @type {Integer (Int32)}
     */
    static OLE_S_USEREG => 262144

    /**
     * @type {Integer (Int32)}
     */
    static OLE_S_STATIC => 262145

    /**
     * @type {Integer (Int32)}
     */
    static OLE_S_MAC_CLIPFORMAT => 262146

    /**
     * @type {Integer (Int32)}
     */
    static DRAGDROP_S_DROP => 262400

    /**
     * @type {Integer (Int32)}
     */
    static DRAGDROP_S_CANCEL => 262401

    /**
     * @type {Integer (Int32)}
     */
    static DRAGDROP_S_USEDEFAULTCURSORS => 262402

    /**
     * @type {Integer (Int32)}
     */
    static DATA_S_SAMEFORMATETC => 262448

    /**
     * @type {Integer (Int32)}
     */
    static VIEW_S_ALREADY_FROZEN => 262464

    /**
     * @type {Integer (Int32)}
     */
    static CACHE_S_FORMATETC_NOTSUPPORTED => 262512

    /**
     * @type {Integer (Int32)}
     */
    static CACHE_S_SAMECACHE => 262513

    /**
     * @type {Integer (Int32)}
     */
    static CACHE_S_SOMECACHES_NOTUPDATED => 262514

    /**
     * @type {Integer (Int32)}
     */
    static OLEOBJ_S_INVALIDVERB => 262528

    /**
     * @type {Integer (Int32)}
     */
    static OLEOBJ_S_CANNOT_DOVERB_NOW => 262529

    /**
     * @type {Integer (Int32)}
     */
    static OLEOBJ_S_INVALIDHWND => 262530

    /**
     * @type {Integer (Int32)}
     */
    static INPLACE_S_TRUNCATED => 262560

    /**
     * @type {Integer (Int32)}
     */
    static CONVERT10_S_NO_PRESENTATION => 262592

    /**
     * @type {Integer (Int32)}
     */
    static MK_S_REDUCED_TO_SELF => 262626

    /**
     * @type {Integer (Int32)}
     */
    static MK_S_ME => 262628

    /**
     * @type {Integer (Int32)}
     */
    static MK_S_HIM => 262629

    /**
     * @type {Integer (Int32)}
     */
    static MK_S_US => 262630

    /**
     * @type {Integer (Int32)}
     */
    static MK_S_MONIKERALREADYREGISTERED => 262631

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_S_TASK_READY => 267008

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_S_TASK_RUNNING => 267009

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_S_TASK_DISABLED => 267010

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_S_TASK_HAS_NOT_RUN => 267011

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_S_TASK_NO_MORE_RUNS => 267012

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_S_TASK_NOT_SCHEDULED => 267013

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_S_TASK_TERMINATED => 267014

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_S_TASK_NO_VALID_TRIGGERS => 267015

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_S_EVENT_TRIGGER => 267016

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_TRIGGER_NOT_FOUND => -2147216631

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_TASK_NOT_READY => -2147216630

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_TASK_NOT_RUNNING => -2147216629

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_SERVICE_NOT_INSTALLED => -2147216628

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_CANNOT_OPEN_TASK => -2147216627

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_INVALID_TASK => -2147216626

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_ACCOUNT_INFORMATION_NOT_SET => -2147216625

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_ACCOUNT_NAME_NOT_FOUND => -2147216624

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_ACCOUNT_DBASE_CORRUPT => -2147216623

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_NO_SECURITY_SERVICES => -2147216622

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_UNKNOWN_OBJECT_VERSION => -2147216621

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_UNSUPPORTED_ACCOUNT_OPTION => -2147216620

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_SERVICE_NOT_RUNNING => -2147216619

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_UNEXPECTEDNODE => -2147216618

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_NAMESPACE => -2147216617

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_INVALIDVALUE => -2147216616

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_MISSINGNODE => -2147216615

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_MALFORMEDXML => -2147216614

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_S_SOME_TRIGGERS_FAILED => 267035

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_S_BATCH_LOGON_PROBLEM => 267036

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_TOO_MANY_NODES => -2147216611

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_PAST_END_BOUNDARY => -2147216610

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_ALREADY_RUNNING => -2147216609

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_USER_NOT_LOGGED_ON => -2147216608

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_INVALID_TASK_HASH => -2147216607

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_SERVICE_NOT_AVAILABLE => -2147216606

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_SERVICE_TOO_BUSY => -2147216605

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_TASK_ATTEMPTED => -2147216604

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_S_TASK_QUEUED => 267045

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_TASK_DISABLED => -2147216602

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_TASK_NOT_V1_COMPAT => -2147216601

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_START_ON_DEMAND => -2147216600

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_TASK_NOT_UBPM_COMPAT => -2147216599

    /**
     * @type {Integer (Int32)}
     */
    static SCHED_E_DEPRECATED_FEATURE_USED => -2147216592

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_CLASS_CREATE_FAILED => -2146959359

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_SCM_ERROR => -2146959358

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_SCM_RPC_FAILURE => -2146959357

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_BAD_PATH => -2146959356

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_SERVER_EXEC_FAILURE => -2146959355

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_OBJSRV_RPC_FAILURE => -2146959354

    /**
     * @type {Integer (Int32)}
     */
    static MK_E_NO_NORMALIZED => -2146959353

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_SERVER_STOPPING => -2146959352

    /**
     * @type {Integer (Int32)}
     */
    static MEM_E_INVALID_ROOT => -2146959351

    /**
     * @type {Integer (Int32)}
     */
    static MEM_E_INVALID_LINK => -2146959344

    /**
     * @type {Integer (Int32)}
     */
    static MEM_E_INVALID_SIZE => -2146959343

    /**
     * @type {Integer (Int32)}
     */
    static CO_S_NOTALLINTERFACES => 524306

    /**
     * @type {Integer (Int32)}
     */
    static CO_S_MACHINENAMENOTFOUND => 524307

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_MISSING_DISPLAYNAME => -2146959339

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_RUNAS_VALUE_MUST_BE_AAA => -2146959338

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_ELEVATION_DISABLED => -2146959337

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_PACKAGING_INTERNAL => -2146958848

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_INTERLEAVING_NOT_ALLOWED => -2146958847

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_RELATIONSHIPS_NOT_ALLOWED => -2146958846

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_MISSING_REQUIRED_FILE => -2146958845

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_INVALID_MANIFEST => -2146958844

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_INVALID_BLOCKMAP => -2146958843

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_CORRUPT_CONTENT => -2146958842

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_BLOCK_HASH_INVALID => -2146958841

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_REQUESTED_RANGE_TOO_LARGE => -2146958840

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_INVALID_SIP_CLIENT_DATA => -2146958839

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_INVALID_KEY_INFO => -2146958838

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_INVALID_CONTENTGROUPMAP => -2146958837

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_INVALID_APPINSTALLER => -2146958836

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_DELTA_BASELINE_VERSION_MISMATCH => -2146958835

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_DELTA_PACKAGE_MISSING_FILE => -2146958834

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_INVALID_DELTA_PACKAGE => -2146958833

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_DELTA_APPENDED_PACKAGE_NOT_ALLOWED => -2146958832

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_INVALID_PACKAGING_LAYOUT => -2146958831

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_INVALID_PACKAGESIGNCONFIG => -2146958830

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_RESOURCESPRI_NOT_ALLOWED => -2146958829

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_FILE_COMPRESSION_MISMATCH => -2146958828

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_INVALID_PAYLOAD_PACKAGE_EXTENSION => -2146958827

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_INVALID_ENCRYPTION_EXCLUSION_FILE_LIST => -2146958826

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_INVALID_PACKAGE_FOLDER_ACLS => -2146958825

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_INVALID_PUBLISHER_BRIDGING => -2146958824

    /**
     * @type {Integer (Int32)}
     */
    static APPX_E_DIGEST_MISMATCH => -2146958823

    /**
     * @type {Integer (Int32)}
     */
    static BT_E_SPURIOUS_ACTIVATION => -2146958592

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_UNKNOWNINTERFACE => -2147352575

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_MEMBERNOTFOUND => -2147352573

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_PARAMNOTFOUND => -2147352572

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_TYPEMISMATCH => -2147352571

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_UNKNOWNNAME => -2147352570

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_NONAMEDARGS => -2147352569

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_BADVARTYPE => -2147352568

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_EXCEPTION => -2147352567

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_OVERFLOW => -2147352566

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_BADINDEX => -2147352565

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_UNKNOWNLCID => -2147352564

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_ARRAYISLOCKED => -2147352563

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_BADPARAMCOUNT => -2147352562

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_PARAMNOTOPTIONAL => -2147352561

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_BADCALLEE => -2147352560

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_NOTACOLLECTION => -2147352559

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_DIVBYZERO => -2147352558

    /**
     * @type {Integer (Int32)}
     */
    static DISP_E_BUFFERTOOSMALL => -2147352557

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_BUFFERTOOSMALL => -2147319786

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_FIELDNOTFOUND => -2147319785

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_INVDATAREAD => -2147319784

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_UNSUPFORMAT => -2147319783

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_REGISTRYACCESS => -2147319780

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_LIBNOTREGISTERED => -2147319779

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_UNDEFINEDTYPE => -2147319769

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_QUALIFIEDNAMEDISALLOWED => -2147319768

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_INVALIDSTATE => -2147319767

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_WRONGTYPEKIND => -2147319766

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_ELEMENTNOTFOUND => -2147319765

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_AMBIGUOUSNAME => -2147319764

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_NAMECONFLICT => -2147319763

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_UNKNOWNLCID => -2147319762

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_DLLFUNCTIONNOTFOUND => -2147319761

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_BADMODULEKIND => -2147317571

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_SIZETOOBIG => -2147317563

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_DUPLICATEID => -2147317562

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_INVALIDID => -2147317553

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_TYPEMISMATCH => -2147316576

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_OUTOFBOUNDS => -2147316575

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_IOERROR => -2147316574

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_CANTCREATETMPFILE => -2147316573

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_CANTLOADLIBRARY => -2147312566

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_INCONSISTENTPROPFUNCS => -2147312509

    /**
     * @type {Integer (Int32)}
     */
    static TYPE_E_CIRCULARTYPE => -2147312508

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_INVALIDFUNCTION => -2147287039

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_FILENOTFOUND => -2147287038

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_PATHNOTFOUND => -2147287037

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_TOOMANYOPENFILES => -2147287036

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_ACCESSDENIED => -2147287035

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_INVALIDHANDLE => -2147287034

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_INSUFFICIENTMEMORY => -2147287032

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_INVALIDPOINTER => -2147287031

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_NOMOREFILES => -2147287022

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_DISKISWRITEPROTECTED => -2147287021

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_SEEKERROR => -2147287015

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_WRITEFAULT => -2147287011

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_READFAULT => -2147287010

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_SHAREVIOLATION => -2147287008

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_LOCKVIOLATION => -2147287007

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_FILEALREADYEXISTS => -2147286960

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_INVALIDPARAMETER => -2147286953

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_MEDIUMFULL => -2147286928

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_PROPSETMISMATCHED => -2147286800

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_ABNORMALAPIEXIT => -2147286790

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_INVALIDHEADER => -2147286789

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_INVALIDNAME => -2147286788

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_UNKNOWN => -2147286787

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_UNIMPLEMENTEDFUNCTION => -2147286786

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_INVALIDFLAG => -2147286785

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_INUSE => -2147286784

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_NOTCURRENT => -2147286783

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_REVERTED => -2147286782

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_CANTSAVE => -2147286781

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_OLDFORMAT => -2147286780

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_OLDDLL => -2147286779

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_SHAREREQUIRED => -2147286778

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_NOTFILEBASEDSTORAGE => -2147286777

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_EXTANTMARSHALLINGS => -2147286776

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_DOCFILECORRUPT => -2147286775

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_BADBASEADDRESS => -2147286768

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_DOCFILETOOLARGE => -2147286767

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_NOTSIMPLEFORMAT => -2147286766

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_INCOMPLETE => -2147286527

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_TERMINATED => -2147286526

    /**
     * @type {Integer (Int32)}
     */
    static STG_S_CONVERTED => 197120

    /**
     * @type {Integer (Int32)}
     */
    static STG_S_BLOCK => 197121

    /**
     * @type {Integer (Int32)}
     */
    static STG_S_RETRYNOW => 197122

    /**
     * @type {Integer (Int32)}
     */
    static STG_S_MONITORING => 197123

    /**
     * @type {Integer (Int32)}
     */
    static STG_S_MULTIPLEOPENS => 197124

    /**
     * @type {Integer (Int32)}
     */
    static STG_S_CONSOLIDATIONFAILED => 197125

    /**
     * @type {Integer (Int32)}
     */
    static STG_S_CANNOTCONSOLIDATE => 197126

    /**
     * @type {Integer (Int32)}
     */
    static STG_S_POWER_CYCLE_REQUIRED => 197127

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_FIRMWARE_SLOT_INVALID => -2147286520

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_FIRMWARE_IMAGE_INVALID => -2147286519

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_DEVICE_UNRESPONSIVE => -2147286518

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_STATUS_COPY_PROTECTION_FAILURE => -2147286267

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_CSS_AUTHENTICATION_FAILURE => -2147286266

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_CSS_KEY_NOT_PRESENT => -2147286265

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_CSS_KEY_NOT_ESTABLISHED => -2147286264

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_CSS_SCRAMBLED_SECTOR => -2147286263

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_CSS_REGION_MISMATCH => -2147286262

    /**
     * @type {Integer (Int32)}
     */
    static STG_E_RESETS_EXHAUSTED => -2147286261

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_CALL_REJECTED => -2147418111

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_CALL_CANCELED => -2147418110

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_CANTPOST_INSENDCALL => -2147418109

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_CANTCALLOUT_INASYNCCALL => -2147418108

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_CANTCALLOUT_INEXTERNALCALL => -2147418107

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_CONNECTION_TERMINATED => -2147418106

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_SERVER_DIED => -2147418105

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_CLIENT_DIED => -2147418104

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_INVALID_DATAPACKET => -2147418103

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_CANTTRANSMIT_CALL => -2147418102

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_CLIENT_CANTMARSHAL_DATA => -2147418101

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_CLIENT_CANTUNMARSHAL_DATA => -2147418100

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_SERVER_CANTMARSHAL_DATA => -2147418099

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_SERVER_CANTUNMARSHAL_DATA => -2147418098

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_INVALID_DATA => -2147418097

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_INVALID_PARAMETER => -2147418096

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_CANTCALLOUT_AGAIN => -2147418095

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_SERVER_DIED_DNE => -2147418094

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_SYS_CALL_FAILED => -2147417856

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_OUT_OF_RESOURCES => -2147417855

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_ATTEMPTED_MULTITHREAD => -2147417854

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_NOT_REGISTERED => -2147417853

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_FAULT => -2147417852

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_SERVERFAULT => -2147417851

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_CHANGED_MODE => -2147417850

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_INVALIDMETHOD => -2147417849

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_DISCONNECTED => -2147417848

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_RETRY => -2147417847

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_SERVERCALL_RETRYLATER => -2147417846

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_SERVERCALL_REJECTED => -2147417845

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_INVALID_CALLDATA => -2147417844

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_CANTCALLOUT_ININPUTSYNCCALL => -2147417843

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_WRONG_THREAD => -2147417842

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_THREAD_NOT_INIT => -2147417841

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_VERSION_MISMATCH => -2147417840

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_INVALID_HEADER => -2147417839

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_INVALID_EXTENSION => -2147417838

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_INVALID_IPID => -2147417837

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_INVALID_OBJECT => -2147417836

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_CALLPENDING => -2147417835

    /**
     * @type {Integer (Int32)}
     */
    static RPC_S_WAITONTIMER => -2147417834

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_CALL_COMPLETE => -2147417833

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_UNSECURE_CALL => -2147417832

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_TOO_LATE => -2147417831

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_NO_GOOD_SECURITY_PACKAGES => -2147417830

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_ACCESS_DENIED => -2147417829

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_REMOTE_DISABLED => -2147417828

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_INVALID_OBJREF => -2147417827

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_NO_CONTEXT => -2147417826

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_TIMEOUT => -2147417825

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_NO_SYNC => -2147417824

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_FULLSIC_REQUIRED => -2147417823

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_INVALID_STD_NAME => -2147417822

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_FAILEDTOIMPERSONATE => -2147417821

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_FAILEDTOGETSECCTX => -2147417820

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_FAILEDTOOPENTHREADTOKEN => -2147417819

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_FAILEDTOGETTOKENINFO => -2147417818

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_TRUSTEEDOESNTMATCHCLIENT => -2147417817

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_FAILEDTOQUERYCLIENTBLANKET => -2147417816

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_FAILEDTOSETDACL => -2147417815

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_ACCESSCHECKFAILED => -2147417814

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_NETACCESSAPIFAILED => -2147417813

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_WRONGTRUSTEENAMESYNTAX => -2147417812

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INVALIDSID => -2147417811

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_CONVERSIONFAILED => -2147417810

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_NOMATCHINGSIDFOUND => -2147417809

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_LOOKUPACCSIDFAILED => -2147417808

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_NOMATCHINGNAMEFOUND => -2147417807

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_LOOKUPACCNAMEFAILED => -2147417806

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_SETSERLHNDLFAILED => -2147417805

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_FAILEDTOGETWINDIR => -2147417804

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_PATHTOOLONG => -2147417803

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_FAILEDTOGENUUID => -2147417802

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_FAILEDTOCREATEFILE => -2147417801

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_FAILEDTOCLOSEHANDLE => -2147417800

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_EXCEEDSYSACLLIMIT => -2147417799

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_ACESINWRONGORDER => -2147417798

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_INCOMPATIBLESTREAMVERSION => -2147417797

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_FAILEDTOOPENPROCESSTOKEN => -2147417796

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_DECODEFAILED => -2147417795

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_ACNOTINITIALIZED => -2147417793

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_CANCEL_DISABLED => -2147417792

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_SERVER_CANNOT_BE_EQUAL_OR_GREATER_PRIVILEGE => -2147417791

    /**
     * @type {Integer (Int32)}
     */
    static CO_E_CANNOT_ACTIVATE_CROSS_PACKAGE_IN_SESSION_0 => -2147417790

    /**
     * @type {Integer (Int32)}
     */
    static RPC_E_UNEXPECTED => -2147352577

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_AUDITING_DISABLED => -1073151999

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_ALL_SIDS_FILTERED => -1073151998

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_BIZRULES_NOT_ENABLED => -1073151997

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_UID => -2146893823

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_HASH => -2146893822

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_KEY => -2146893821

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_LEN => -2146893820

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_DATA => -2146893819

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_SIGNATURE => -2146893818

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_VER => -2146893817

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_ALGID => -2146893816

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_FLAGS => -2146893815

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_TYPE => -2146893814

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_KEY_STATE => -2146893813

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_HASH_STATE => -2146893812

    /**
     * @type {Integer (Int32)}
     */
    static NTE_NO_KEY => -2146893811

    /**
     * @type {Integer (Int32)}
     */
    static NTE_NO_MEMORY => -2146893810

    /**
     * @type {Integer (Int32)}
     */
    static NTE_EXISTS => -2146893809

    /**
     * @type {Integer (Int32)}
     */
    static NTE_PERM => -2146893808

    /**
     * @type {Integer (Int32)}
     */
    static NTE_NOT_FOUND => -2146893807

    /**
     * @type {Integer (Int32)}
     */
    static NTE_DOUBLE_ENCRYPT => -2146893806

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_PROVIDER => -2146893805

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_PROV_TYPE => -2146893804

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_PUBLIC_KEY => -2146893803

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_KEYSET => -2146893802

    /**
     * @type {Integer (Int32)}
     */
    static NTE_PROV_TYPE_NOT_DEF => -2146893801

    /**
     * @type {Integer (Int32)}
     */
    static NTE_PROV_TYPE_ENTRY_BAD => -2146893800

    /**
     * @type {Integer (Int32)}
     */
    static NTE_KEYSET_NOT_DEF => -2146893799

    /**
     * @type {Integer (Int32)}
     */
    static NTE_KEYSET_ENTRY_BAD => -2146893798

    /**
     * @type {Integer (Int32)}
     */
    static NTE_PROV_TYPE_NO_MATCH => -2146893797

    /**
     * @type {Integer (Int32)}
     */
    static NTE_SIGNATURE_FILE_BAD => -2146893796

    /**
     * @type {Integer (Int32)}
     */
    static NTE_PROVIDER_DLL_FAIL => -2146893795

    /**
     * @type {Integer (Int32)}
     */
    static NTE_PROV_DLL_NOT_FOUND => -2146893794

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BAD_KEYSET_PARAM => -2146893793

    /**
     * @type {Integer (Int32)}
     */
    static NTE_FAIL => -2146893792

    /**
     * @type {Integer (Int32)}
     */
    static NTE_SYS_ERR => -2146893791

    /**
     * @type {Integer (Int32)}
     */
    static NTE_SILENT_CONTEXT => -2146893790

    /**
     * @type {Integer (Int32)}
     */
    static NTE_TOKEN_KEYSET_STORAGE_FULL => -2146893789

    /**
     * @type {Integer (Int32)}
     */
    static NTE_TEMPORARY_PROFILE => -2146893788

    /**
     * @type {Integer (Int32)}
     */
    static NTE_FIXEDPARAMETER => -2146893787

    /**
     * @type {Integer (Int32)}
     */
    static NTE_INVALID_HANDLE => -2146893786

    /**
     * @type {Integer (Int32)}
     */
    static NTE_INVALID_PARAMETER => -2146893785

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BUFFER_TOO_SMALL => -2146893784

    /**
     * @type {Integer (Int32)}
     */
    static NTE_NOT_SUPPORTED => -2146893783

    /**
     * @type {Integer (Int32)}
     */
    static NTE_NO_MORE_ITEMS => -2146893782

    /**
     * @type {Integer (Int32)}
     */
    static NTE_BUFFERS_OVERLAP => -2146893781

    /**
     * @type {Integer (Int32)}
     */
    static NTE_DECRYPTION_FAILURE => -2146893780

    /**
     * @type {Integer (Int32)}
     */
    static NTE_INTERNAL_ERROR => -2146893779

    /**
     * @type {Integer (Int32)}
     */
    static NTE_UI_REQUIRED => -2146893778

    /**
     * @type {Integer (Int32)}
     */
    static NTE_HMAC_NOT_SUPPORTED => -2146893777

    /**
     * @type {Integer (Int32)}
     */
    static NTE_DEVICE_NOT_READY => -2146893776

    /**
     * @type {Integer (Int32)}
     */
    static NTE_AUTHENTICATION_IGNORED => -2146893775

    /**
     * @type {Integer (Int32)}
     */
    static NTE_VALIDATION_FAILED => -2146893774

    /**
     * @type {Integer (Int32)}
     */
    static NTE_INCORRECT_PASSWORD => -2146893773

    /**
     * @type {Integer (Int32)}
     */
    static NTE_ENCRYPTION_FAILURE => -2146893772

    /**
     * @type {Integer (Int32)}
     */
    static NTE_DEVICE_NOT_FOUND => -2146893771

    /**
     * @type {Integer (Int32)}
     */
    static NTE_USER_CANCELLED => -2146893770

    /**
     * @type {Integer (Int32)}
     */
    static NTE_PASSWORD_CHANGE_REQUIRED => -2146893769

    /**
     * @type {Integer (Int32)}
     */
    static NTE_NOT_ACTIVE_CONSOLE => -2146893768

    /**
     * @type {Integer (Int32)}
     */
    static NTE_VBS_UNAVAILABLE => -2146893767

    /**
     * @type {Integer (Int32)}
     */
    static NTE_VBS_CANNOT_DECRYPT_KEY => -2146893766

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INSUFFICIENT_MEMORY => -2146893056

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INVALID_HANDLE => -2146893055

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_UNSUPPORTED_FUNCTION => -2146893054

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_TARGET_UNKNOWN => -2146893053

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INTERNAL_ERROR => -2146893052

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_SECPKG_NOT_FOUND => -2146893051

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NOT_OWNER => -2146893050

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_CANNOT_INSTALL => -2146893049

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INVALID_TOKEN => -2146893048

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_CANNOT_PACK => -2146893047

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_QOP_NOT_SUPPORTED => -2146893046

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NO_IMPERSONATION => -2146893045

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_LOGON_DENIED => -2146893044

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_UNKNOWN_CREDENTIALS => -2146893043

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NO_CREDENTIALS => -2146893042

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_MESSAGE_ALTERED => -2146893041

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_OUT_OF_SEQUENCE => -2146893040

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NO_AUTHENTICATING_AUTHORITY => -2146893039

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_CONTINUE_NEEDED => 590610

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_COMPLETE_NEEDED => 590611

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_COMPLETE_AND_CONTINUE => 590612

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_LOCAL_LOGON => 590613

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_GENERIC_EXTENSION_RECEIVED => 590614

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_BAD_PKGID => -2146893034

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_CONTEXT_EXPIRED => -2146893033

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_CONTEXT_EXPIRED => 590615

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INCOMPLETE_MESSAGE => -2146893032

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INCOMPLETE_CREDENTIALS => -2146893024

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_BUFFER_TOO_SMALL => -2146893023

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_INCOMPLETE_CREDENTIALS => 590624

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_RENEGOTIATE => 590625

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_WRONG_PRINCIPAL => -2146893022

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_NO_LSA_CONTEXT => 590627

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_TIME_SKEW => -2146893020

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_UNTRUSTED_ROOT => -2146893019

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_ILLEGAL_MESSAGE => -2146893018

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_CERT_UNKNOWN => -2146893017

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_CERT_EXPIRED => -2146893016

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_ENCRYPT_FAILURE => -2146893015

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_DECRYPT_FAILURE => -2146893008

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_ALGORITHM_MISMATCH => -2146893007

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_SECURITY_QOS_FAILED => -2146893006

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_UNFINISHED_CONTEXT_DELETED => -2146893005

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NO_TGT_REPLY => -2146893004

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NO_IP_ADDRESSES => -2146893003

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_WRONG_CREDENTIAL_HANDLE => -2146893002

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_CRYPTO_SYSTEM_INVALID => -2146893001

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_MAX_REFERRALS_EXCEEDED => -2146893000

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_MUST_BE_KDC => -2146892999

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_STRONG_CRYPTO_NOT_SUPPORTED => -2146892998

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_TOO_MANY_PRINCIPALS => -2146892997

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NO_PA_DATA => -2146892996

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_PKINIT_NAME_MISMATCH => -2146892995

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_SMARTCARD_LOGON_REQUIRED => -2146892994

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_SHUTDOWN_IN_PROGRESS => -2146892993

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_KDC_INVALID_REQUEST => -2146892992

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_KDC_UNABLE_TO_REFER => -2146892991

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_KDC_UNKNOWN_ETYPE => -2146892990

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_UNSUPPORTED_PREAUTH => -2146892989

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_DELEGATION_REQUIRED => -2146892987

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_BAD_BINDINGS => -2146892986

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_MULTIPLE_ACCOUNTS => -2146892985

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NO_KERB_KEY => -2146892984

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_CERT_WRONG_USAGE => -2146892983

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_DOWNGRADE_DETECTED => -2146892976

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_SMARTCARD_CERT_REVOKED => -2146892975

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_ISSUING_CA_UNTRUSTED => -2146892974

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_REVOCATION_OFFLINE_C => -2146892973

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_PKINIT_CLIENT_FAILURE => -2146892972

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_SMARTCARD_CERT_EXPIRED => -2146892971

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NO_S4U_PROT_SUPPORT => -2146892970

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_CROSSREALM_DELEGATION_FAILURE => -2146892969

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_REVOCATION_OFFLINE_KDC => -2146892968

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_ISSUING_CA_UNTRUSTED_KDC => -2146892967

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_KDC_CERT_EXPIRED => -2146892966

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_KDC_CERT_REVOKED => -2146892965

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_SIGNATURE_NEEDED => 590684

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INVALID_PARAMETER => -2146892963

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_DELEGATION_POLICY => -2146892962

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_POLICY_NLTM_ONLY => -2146892961

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_NO_RENEGOTIATION => 590688

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NO_CONTEXT => -2146892959

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_PKU2U_CERT_FAILURE => -2146892958

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_MUTUAL_AUTH_FAILED => -2146892957

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_MESSAGE_FRAGMENT => 590692

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_ONLY_HTTPS_ALLOWED => -2146892955

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_CONTINUE_NEEDED_MESSAGE_OK => 590694

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_APPLICATION_PROTOCOL_MISMATCH => -2146892953

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_ASYNC_CALL_PENDING => 590696

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INVALID_UPN_NAME => -2146892951

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_EXT_BUFFER_TOO_SMALL => -2146892950

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_INSUFFICIENT_BUFFERS => -2146892949

    /**
     * @type {Integer (Int32)}
     */
    static SEC_I_INVALID_SESSION_STATE => -2146892948

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NO_SPM => -2146893052

    /**
     * @type {Integer (Int32)}
     */
    static SEC_E_NOT_SUPPORTED => -2146893054

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_MSG_ERROR => -2146889727

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_UNKNOWN_ALGO => -2146889726

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_OID_FORMAT => -2146889725

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_INVALID_MSG_TYPE => -2146889724

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_UNEXPECTED_ENCODING => -2146889723

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_AUTH_ATTR_MISSING => -2146889722

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_HASH_VALUE => -2146889721

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_INVALID_INDEX => -2146889720

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ALREADY_DECRYPTED => -2146889719

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NOT_DECRYPTED => -2146889718

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_RECIPIENT_NOT_FOUND => -2146889717

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_CONTROL_TYPE => -2146889716

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ISSUER_SERIALNUMBER => -2146889715

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_SIGNER_NOT_FOUND => -2146889714

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ATTRIBUTES_MISSING => -2146889713

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_STREAM_MSG_NOT_READY => -2146889712

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_STREAM_INSUFFICIENT_DATA => -2146889711

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_I_NEW_PROTECTION_REQUIRED => 593938

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_BAD_LEN => -2146885631

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_BAD_ENCODE => -2146885630

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_FILE_ERROR => -2146885629

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NOT_FOUND => -2146885628

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_EXISTS => -2146885627

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NO_PROVIDER => -2146885626

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_SELF_SIGNED => -2146885625

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_DELETED_PREV => -2146885624

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NO_MATCH => -2146885623

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_UNEXPECTED_MSG_TYPE => -2146885622

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NO_KEY_PROPERTY => -2146885621

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NO_DECRYPT_CERT => -2146885620

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_BAD_MSG => -2146885619

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NO_SIGNER => -2146885618

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_PENDING_CLOSE => -2146885617

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_REVOKED => -2146885616

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NO_REVOCATION_DLL => -2146885615

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NO_REVOCATION_CHECK => -2146885614

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_REVOCATION_OFFLINE => -2146885613

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NOT_IN_REVOCATION_DATABASE => -2146885612

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_INVALID_NUMERIC_STRING => -2146885600

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_INVALID_PRINTABLE_STRING => -2146885599

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_INVALID_IA5_STRING => -2146885598

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_INVALID_X500_STRING => -2146885597

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NOT_CHAR_STRING => -2146885596

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_FILERESIZED => -2146885595

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_SECURITY_SETTINGS => -2146885594

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NO_VERIFY_USAGE_DLL => -2146885593

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NO_VERIFY_USAGE_CHECK => -2146885592

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_VERIFY_USAGE_OFFLINE => -2146885591

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NOT_IN_CTL => -2146885590

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_NO_TRUSTED_SIGNER => -2146885589

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_MISSING_PUBKEY_PARA => -2146885588

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_OBJECT_LOCATOR_OBJECT_NOT_FOUND => -2146885587

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_OSS_ERROR => -2146881536

    /**
     * @type {Integer (Int32)}
     */
    static OSS_MORE_BUF => -2146881535

    /**
     * @type {Integer (Int32)}
     */
    static OSS_NEGATIVE_UINTEGER => -2146881534

    /**
     * @type {Integer (Int32)}
     */
    static OSS_PDU_RANGE => -2146881533

    /**
     * @type {Integer (Int32)}
     */
    static OSS_MORE_INPUT => -2146881532

    /**
     * @type {Integer (Int32)}
     */
    static OSS_DATA_ERROR => -2146881531

    /**
     * @type {Integer (Int32)}
     */
    static OSS_BAD_ARG => -2146881530

    /**
     * @type {Integer (Int32)}
     */
    static OSS_BAD_VERSION => -2146881529

    /**
     * @type {Integer (Int32)}
     */
    static OSS_OUT_MEMORY => -2146881528

    /**
     * @type {Integer (Int32)}
     */
    static OSS_PDU_MISMATCH => -2146881527

    /**
     * @type {Integer (Int32)}
     */
    static OSS_LIMITED => -2146881526

    /**
     * @type {Integer (Int32)}
     */
    static OSS_BAD_PTR => -2146881525

    /**
     * @type {Integer (Int32)}
     */
    static OSS_BAD_TIME => -2146881524

    /**
     * @type {Integer (Int32)}
     */
    static OSS_INDEFINITE_NOT_SUPPORTED => -2146881523

    /**
     * @type {Integer (Int32)}
     */
    static OSS_MEM_ERROR => -2146881522

    /**
     * @type {Integer (Int32)}
     */
    static OSS_BAD_TABLE => -2146881521

    /**
     * @type {Integer (Int32)}
     */
    static OSS_TOO_LONG => -2146881520

    /**
     * @type {Integer (Int32)}
     */
    static OSS_CONSTRAINT_VIOLATED => -2146881519

    /**
     * @type {Integer (Int32)}
     */
    static OSS_FATAL_ERROR => -2146881518

    /**
     * @type {Integer (Int32)}
     */
    static OSS_ACCESS_SERIALIZATION_ERROR => -2146881517

    /**
     * @type {Integer (Int32)}
     */
    static OSS_NULL_TBL => -2146881516

    /**
     * @type {Integer (Int32)}
     */
    static OSS_NULL_FCN => -2146881515

    /**
     * @type {Integer (Int32)}
     */
    static OSS_BAD_ENCRULES => -2146881514

    /**
     * @type {Integer (Int32)}
     */
    static OSS_UNAVAIL_ENCRULES => -2146881513

    /**
     * @type {Integer (Int32)}
     */
    static OSS_CANT_OPEN_TRACE_WINDOW => -2146881512

    /**
     * @type {Integer (Int32)}
     */
    static OSS_UNIMPLEMENTED => -2146881511

    /**
     * @type {Integer (Int32)}
     */
    static OSS_OID_DLL_NOT_LINKED => -2146881510

    /**
     * @type {Integer (Int32)}
     */
    static OSS_CANT_OPEN_TRACE_FILE => -2146881509

    /**
     * @type {Integer (Int32)}
     */
    static OSS_TRACE_FILE_ALREADY_OPEN => -2146881508

    /**
     * @type {Integer (Int32)}
     */
    static OSS_TABLE_MISMATCH => -2146881507

    /**
     * @type {Integer (Int32)}
     */
    static OSS_TYPE_NOT_SUPPORTED => -2146881506

    /**
     * @type {Integer (Int32)}
     */
    static OSS_REAL_DLL_NOT_LINKED => -2146881505

    /**
     * @type {Integer (Int32)}
     */
    static OSS_REAL_CODE_NOT_LINKED => -2146881504

    /**
     * @type {Integer (Int32)}
     */
    static OSS_OUT_OF_RANGE => -2146881503

    /**
     * @type {Integer (Int32)}
     */
    static OSS_COPIER_DLL_NOT_LINKED => -2146881502

    /**
     * @type {Integer (Int32)}
     */
    static OSS_CONSTRAINT_DLL_NOT_LINKED => -2146881501

    /**
     * @type {Integer (Int32)}
     */
    static OSS_COMPARATOR_DLL_NOT_LINKED => -2146881500

    /**
     * @type {Integer (Int32)}
     */
    static OSS_COMPARATOR_CODE_NOT_LINKED => -2146881499

    /**
     * @type {Integer (Int32)}
     */
    static OSS_MEM_MGR_DLL_NOT_LINKED => -2146881498

    /**
     * @type {Integer (Int32)}
     */
    static OSS_PDV_DLL_NOT_LINKED => -2146881497

    /**
     * @type {Integer (Int32)}
     */
    static OSS_PDV_CODE_NOT_LINKED => -2146881496

    /**
     * @type {Integer (Int32)}
     */
    static OSS_API_DLL_NOT_LINKED => -2146881495

    /**
     * @type {Integer (Int32)}
     */
    static OSS_BERDER_DLL_NOT_LINKED => -2146881494

    /**
     * @type {Integer (Int32)}
     */
    static OSS_PER_DLL_NOT_LINKED => -2146881493

    /**
     * @type {Integer (Int32)}
     */
    static OSS_OPEN_TYPE_ERROR => -2146881492

    /**
     * @type {Integer (Int32)}
     */
    static OSS_MUTEX_NOT_CREATED => -2146881491

    /**
     * @type {Integer (Int32)}
     */
    static OSS_CANT_CLOSE_TRACE_FILE => -2146881490

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_ERROR => -2146881280

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_INTERNAL => -2146881279

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_EOD => -2146881278

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_CORRUPT => -2146881277

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_LARGE => -2146881276

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_CONSTRAINT => -2146881275

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_MEMORY => -2146881274

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_OVERFLOW => -2146881273

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_BADPDU => -2146881272

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_BADARGS => -2146881271

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_BADREAL => -2146881270

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_BADTAG => -2146881269

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_CHOICE => -2146881268

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_RULE => -2146881267

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_UTF8 => -2146881266

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_PDU_TYPE => -2146881229

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_NYI => -2146881228

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_EXTENDED => -2146881023

    /**
     * @type {Integer (Int32)}
     */
    static CRYPT_E_ASN1_NOEOD => -2146881022

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_BAD_REQUESTSUBJECT => -2146877439

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_NO_REQUEST => -2146877438

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_BAD_REQUESTSTATUS => -2146877437

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_PROPERTY_EMPTY => -2146877436

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_INVALID_CA_CERTIFICATE => -2146877435

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_SERVER_SUSPENDED => -2146877434

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_ENCODING_LENGTH => -2146877433

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_ROLECONFLICT => -2146877432

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_RESTRICTEDOFFICER => -2146877431

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_KEY_ARCHIVAL_NOT_CONFIGURED => -2146877430

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_NO_VALID_KRA => -2146877429

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_BAD_REQUEST_KEY_ARCHIVAL => -2146877428

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_NO_CAADMIN_DEFINED => -2146877427

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_BAD_RENEWAL_CERT_ATTRIBUTE => -2146877426

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_NO_DB_SESSIONS => -2146877425

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_ALIGNMENT_FAULT => -2146877424

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_ENROLL_DENIED => -2146877423

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_TEMPLATE_DENIED => -2146877422

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_DOWNLEVEL_DC_SSL_OR_UPGRADE => -2146877421

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_ADMIN_DENIED_REQUEST => -2146877420

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_NO_POLICY_SERVER => -2146877419

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_WEAK_SIGNATURE_OR_KEY => -2146877418

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_KEY_ATTESTATION_NOT_SUPPORTED => -2146877417

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_ENCRYPTION_CERT_REQUIRED => -2146877416

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_UNSUPPORTED_CERT_TYPE => -2146875392

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_NO_CERT_TYPE => -2146875391

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_TEMPLATE_CONFLICT => -2146875390

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_SUBJECT_ALT_NAME_REQUIRED => -2146875389

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_ARCHIVED_KEY_REQUIRED => -2146875388

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_SMIME_REQUIRED => -2146875387

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_BAD_RENEWAL_SUBJECT => -2146875386

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_BAD_TEMPLATE_VERSION => -2146875385

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_TEMPLATE_POLICY_REQUIRED => -2146875384

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_SIGNATURE_POLICY_REQUIRED => -2146875383

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_SIGNATURE_COUNT => -2146875382

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_SIGNATURE_REJECTED => -2146875381

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_ISSUANCE_POLICY_REQUIRED => -2146875380

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_SUBJECT_UPN_REQUIRED => -2146875379

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_SUBJECT_DIRECTORY_GUID_REQUIRED => -2146875378

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_SUBJECT_DNS_REQUIRED => -2146875377

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_ARCHIVED_KEY_UNEXPECTED => -2146875376

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_KEY_LENGTH => -2146875375

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_SUBJECT_EMAIL_REQUIRED => -2146875374

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_UNKNOWN_CERT_TYPE => -2146875373

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_CERT_TYPE_OVERLAP => -2146875372

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_TOO_MANY_SIGNATURES => -2146875371

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_RENEWAL_BAD_PUBLIC_KEY => -2146875370

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_INVALID_EK => -2146875369

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_INVALID_IDBINDING => -2146875368

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_INVALID_ATTESTATION => -2146875367

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_KEY_ATTESTATION => -2146875366

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_CORRUPT_KEY_ATTESTATION => -2146875365

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_EXPIRED_CHALLENGE => -2146875364

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_INVALID_RESPONSE => -2146875363

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_INVALID_REQUESTID => -2146875362

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_REQUEST_PRECERTIFICATE_MISMATCH => -2146875361

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_PENDING_CLIENT_RESPONSE => -2146875360

    /**
     * @type {Integer (Int32)}
     */
    static CERTSRV_E_SEC_EXT_DIRECTORY_SID_REQUIRED => -2146875359

    /**
     * @type {Integer (Int32)}
     */
    static XENROLL_E_KEY_NOT_EXPORTABLE => -2146873344

    /**
     * @type {Integer (Int32)}
     */
    static XENROLL_E_CANNOT_ADD_ROOT_CERT => -2146873343

    /**
     * @type {Integer (Int32)}
     */
    static XENROLL_E_RESPONSE_KA_HASH_NOT_FOUND => -2146873342

    /**
     * @type {Integer (Int32)}
     */
    static XENROLL_E_RESPONSE_UNEXPECTED_KA_HASH => -2146873341

    /**
     * @type {Integer (Int32)}
     */
    static XENROLL_E_RESPONSE_KA_HASH_MISMATCH => -2146873340

    /**
     * @type {Integer (Int32)}
     */
    static XENROLL_E_KEYSPEC_SMIME_MISMATCH => -2146873339

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_SYSTEM_ERROR => -2146869247

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_NO_SIGNER_CERT => -2146869246

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_COUNTER_SIGNER => -2146869245

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_CERT_SIGNATURE => -2146869244

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_TIME_STAMP => -2146869243

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_BAD_DIGEST => -2146869232

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_MALFORMED_SIGNATURE => -2146869231

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_BASIC_CONSTRAINTS => -2146869223

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_FINANCIAL_CRITERIA => -2146869218

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_OUTOFMEMRANGE => -2146865151

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_CANTGETOBJECT => -2146865150

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_NOHEADTABLE => -2146865149

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_BAD_MAGICNUMBER => -2146865148

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_BAD_OFFSET_TABLE => -2146865147

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_TABLE_TAGORDER => -2146865146

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_TABLE_LONGWORD => -2146865145

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_BAD_FIRST_TABLE_PLACEMENT => -2146865144

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_TABLES_OVERLAP => -2146865143

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_TABLE_PADBYTES => -2146865142

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_FILETOOSMALL => -2146865141

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_TABLE_CHECKSUM => -2146865140

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_FILE_CHECKSUM => -2146865139

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_FAILED_POLICY => -2146865136

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_FAILED_HINTS_CHECK => -2146865135

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_NOT_OPENTYPE => -2146865134

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_FILE => -2146865133

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_CRYPT => -2146865132

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_BADVERSION => -2146865131

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_DSIG_STRUCTURE => -2146865130

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_PCONST_CHECK => -2146865129

    /**
     * @type {Integer (Int32)}
     */
    static MSSIPOTF_E_STRUCTURE => -2146865128

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_CRED_REQUIRES_CONFIRMATION => -2146865127

    /**
     * @type {Integer (UInt32)}
     */
    static NTE_OP_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_PROVIDER_UNKNOWN => -2146762751

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_ACTION_UNKNOWN => -2146762750

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_SUBJECT_FORM_UNKNOWN => -2146762749

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_SUBJECT_NOT_TRUSTED => -2146762748

    /**
     * @type {Integer (Int32)}
     */
    static DIGSIG_E_ENCODE => -2146762747

    /**
     * @type {Integer (Int32)}
     */
    static DIGSIG_E_DECODE => -2146762746

    /**
     * @type {Integer (Int32)}
     */
    static DIGSIG_E_EXTENSIBILITY => -2146762745

    /**
     * @type {Integer (Int32)}
     */
    static DIGSIG_E_CRYPTO => -2146762744

    /**
     * @type {Integer (Int32)}
     */
    static PERSIST_E_SIZEDEFINITE => -2146762743

    /**
     * @type {Integer (Int32)}
     */
    static PERSIST_E_SIZEINDEFINITE => -2146762742

    /**
     * @type {Integer (Int32)}
     */
    static PERSIST_E_NOTSELFSIZING => -2146762741

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_NOSIGNATURE => -2146762496

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_EXPIRED => -2146762495

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_VALIDITYPERIODNESTING => -2146762494

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_ROLE => -2146762493

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_PATHLENCONST => -2146762492

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_CRITICAL => -2146762491

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_PURPOSE => -2146762490

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_ISSUERCHAINING => -2146762489

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_MALFORMED => -2146762488

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_UNTRUSTEDROOT => -2146762487

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_CHAINING => -2146762486

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_FAIL => -2146762485

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_REVOKED => -2146762484

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_UNTRUSTEDTESTROOT => -2146762483

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_REVOCATION_FAILURE => -2146762482

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_CN_NO_MATCH => -2146762481

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_WRONG_USAGE => -2146762480

    /**
     * @type {Integer (Int32)}
     */
    static TRUST_E_EXPLICIT_DISTRUST => -2146762479

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_UNTRUSTEDCA => -2146762478

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_INVALID_POLICY => -2146762477

    /**
     * @type {Integer (Int32)}
     */
    static CERT_E_INVALID_NAME => -2146762476

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_EXPECTED_SECTION_NAME => -2146500608

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_BAD_SECTION_NAME_LINE => -2146500607

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_SECTION_NAME_TOO_LONG => -2146500606

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_GENERAL_SYNTAX => -2146500605

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_WRONG_INF_STYLE => -2146500352

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_SECTION_NOT_FOUND => -2146500351

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_LINE_NOT_FOUND => -2146500350

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_BACKUP => -2146500349

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_ASSOCIATED_CLASS => -2146500096

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_CLASS_MISMATCH => -2146500095

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DUPLICATE_FOUND => -2146500094

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_DRIVER_SELECTED => -2146500093

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_KEY_DOES_NOT_EXIST => -2146500092

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_INVALID_DEVINST_NAME => -2146500091

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_INVALID_CLASS => -2146500090

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DEVINST_ALREADY_EXISTS => -2146500089

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DEVINFO_NOT_REGISTERED => -2146500088

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_INVALID_REG_PROPERTY => -2146500087

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_INF => -2146500086

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_SUCH_DEVINST => -2146500085

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_CANT_LOAD_CLASS_ICON => -2146500084

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_INVALID_CLASS_INSTALLER => -2146500083

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DI_DO_DEFAULT => -2146500082

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DI_NOFILECOPY => -2146500081

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_INVALID_HWPROFILE => -2146500080

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_DEVICE_SELECTED => -2146500079

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DEVINFO_LIST_LOCKED => -2146500078

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DEVINFO_DATA_LOCKED => -2146500077

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DI_BAD_PATH => -2146500076

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_CLASSINSTALL_PARAMS => -2146500075

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_FILEQUEUE_LOCKED => -2146500074

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_BAD_SERVICE_INSTALLSECT => -2146500073

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_CLASS_DRIVER_LIST => -2146500072

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_ASSOCIATED_SERVICE => -2146500071

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_DEFAULT_DEVICE_INTERFACE => -2146500070

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DEVICE_INTERFACE_ACTIVE => -2146500069

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DEVICE_INTERFACE_REMOVED => -2146500068

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_BAD_INTERFACE_INSTALLSECT => -2146500067

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_SUCH_INTERFACE_CLASS => -2146500066

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_INVALID_REFERENCE_STRING => -2146500065

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_INVALID_MACHINENAME => -2146500064

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_REMOTE_COMM_FAILURE => -2146500063

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_MACHINE_UNAVAILABLE => -2146500062

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_CONFIGMGR_SERVICES => -2146500061

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_INVALID_PROPPAGE_PROVIDER => -2146500060

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_SUCH_DEVICE_INTERFACE => -2146500059

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DI_POSTPROCESSING_REQUIRED => -2146500058

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_INVALID_COINSTALLER => -2146500057

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_COMPAT_DRIVERS => -2146500056

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_DEVICE_ICON => -2146500055

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_INVALID_INF_LOGCONFIG => -2146500054

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DI_DONT_INSTALL => -2146500053

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_INVALID_FILTER_DRIVER => -2146500052

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NON_WINDOWS_NT_DRIVER => -2146500051

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NON_WINDOWS_DRIVER => -2146500050

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_CATALOG_FOR_OEM_INF => -2146500049

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DEVINSTALL_QUEUE_NONNATIVE => -2146500048

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NOT_DISABLEABLE => -2146500047

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_CANT_REMOVE_DEVINST => -2146500046

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_INVALID_TARGET => -2146500045

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DRIVER_NONNATIVE => -2146500044

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_IN_WOW64 => -2146500043

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_SET_SYSTEM_RESTORE_POINT => -2146500042

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_INCORRECTLY_COPIED_INF => -2146500041

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_SCE_DISABLED => -2146500040

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_UNKNOWN_EXCEPTION => -2146500039

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_PNP_REGISTRY_ERROR => -2146500038

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_REMOTE_REQUEST_UNSUPPORTED => -2146500037

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NOT_AN_INSTALLED_OEM_INF => -2146500036

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_INF_IN_USE_BY_DEVICES => -2146500035

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DI_FUNCTION_OBSOLETE => -2146500034

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_NO_AUTHENTICODE_CATALOG => -2146500033

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_AUTHENTICODE_DISALLOWED => -2146500032

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_AUTHENTICODE_TRUSTED_PUBLISHER => -2146500031

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_AUTHENTICODE_TRUST_NOT_ESTABLISHED => -2146500030

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_AUTHENTICODE_PUBLISHER_NOT_TRUSTED => -2146500029

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_SIGNATURE_OSATTRIBUTE_MISMATCH => -2146500028

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_ONLY_VALIDATE_VIA_AUTHENTICODE => -2146500027

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DEVICE_INSTALLER_NOT_READY => -2146500026

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DRIVER_STORE_ADD_FAILED => -2146500025

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DEVICE_INSTALL_BLOCKED => -2146500024

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DRIVER_INSTALL_BLOCKED => -2146500023

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_WRONG_INF_TYPE => -2146500022

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_FILE_HASH_NOT_IN_CATALOG => -2146500021

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_DRIVER_STORE_DELETE_FAILED => -2146500020

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_UNRECOVERABLE_STACK_OVERFLOW => -2146499840

    /**
     * @type {Integer (Int32)}
     */
    static SPAPI_E_ERROR_NOT_INSTALLED => -2146496512

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_F_INTERNAL_ERROR => -2146435071

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_CANCELLED => -2146435070

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_INVALID_HANDLE => -2146435069

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_INVALID_PARAMETER => -2146435068

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_INVALID_TARGET => -2146435067

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_NO_MEMORY => -2146435066

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_F_WAITED_TOO_LONG => -2146435065

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_INSUFFICIENT_BUFFER => -2146435064

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_UNKNOWN_READER => -2146435063

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_TIMEOUT => -2146435062

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_SHARING_VIOLATION => -2146435061

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_NO_SMARTCARD => -2146435060

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_UNKNOWN_CARD => -2146435059

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_CANT_DISPOSE => -2146435058

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_PROTO_MISMATCH => -2146435057

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_NOT_READY => -2146435056

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_INVALID_VALUE => -2146435055

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_SYSTEM_CANCELLED => -2146435054

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_F_COMM_ERROR => -2146435053

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_F_UNKNOWN_ERROR => -2146435052

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_INVALID_ATR => -2146435051

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_NOT_TRANSACTED => -2146435050

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_READER_UNAVAILABLE => -2146435049

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_P_SHUTDOWN => -2146435048

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_PCI_TOO_SMALL => -2146435047

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_READER_UNSUPPORTED => -2146435046

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_DUPLICATE_READER => -2146435045

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_CARD_UNSUPPORTED => -2146435044

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_NO_SERVICE => -2146435043

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_SERVICE_STOPPED => -2146435042

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_UNEXPECTED => -2146435041

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_ICC_INSTALLATION => -2146435040

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_ICC_CREATEORDER => -2146435039

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_UNSUPPORTED_FEATURE => -2146435038

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_DIR_NOT_FOUND => -2146435037

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_FILE_NOT_FOUND => -2146435036

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_NO_DIR => -2146435035

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_NO_FILE => -2146435034

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_NO_ACCESS => -2146435033

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_WRITE_TOO_MANY => -2146435032

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_BAD_SEEK => -2146435031

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_INVALID_CHV => -2146435030

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_UNKNOWN_RES_MNG => -2146435029

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_NO_SUCH_CERTIFICATE => -2146435028

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_CERTIFICATE_UNAVAILABLE => -2146435027

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_NO_READERS_AVAILABLE => -2146435026

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_COMM_DATA_LOST => -2146435025

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_NO_KEY_CONTAINER => -2146435024

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_SERVER_TOO_BUSY => -2146435023

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_PIN_CACHE_EXPIRED => -2146435022

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_NO_PIN_CACHE => -2146435021

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_E_READ_ONLY_CARD => -2146435020

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_W_UNSUPPORTED_CARD => -2146434971

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_W_UNRESPONSIVE_CARD => -2146434970

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_W_UNPOWERED_CARD => -2146434969

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_W_RESET_CARD => -2146434968

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_W_REMOVED_CARD => -2146434967

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_W_SECURITY_VIOLATION => -2146434966

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_W_WRONG_CHV => -2146434965

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_W_CHV_BLOCKED => -2146434964

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_W_EOF => -2146434963

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_W_CANCELLED_BY_USER => -2146434962

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_W_CARD_NOT_AUTHENTICATED => -2146434961

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_W_CACHE_ITEM_NOT_FOUND => -2146434960

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_W_CACHE_ITEM_STALE => -2146434959

    /**
     * @type {Integer (Int32)}
     */
    static SCARD_W_CACHE_ITEM_TOO_BIG => -2146434958

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_OBJECTERRORS => -2146368511

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_OBJECTINVALID => -2146368510

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_KEYMISSING => -2146368509

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_ALREADYINSTALLED => -2146368508

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_APP_FILE_WRITEFAIL => -2146368505

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_APP_FILE_READFAIL => -2146368504

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_APP_FILE_VERSION => -2146368503

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_BADPATH => -2146368502

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_APPLICATIONEXISTS => -2146368501

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_ROLEEXISTS => -2146368500

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CANTCOPYFILE => -2146368499

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_NOUSER => -2146368497

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_INVALIDUSERIDS => -2146368496

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_NOREGISTRYCLSID => -2146368495

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_BADREGISTRYPROGID => -2146368494

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_AUTHENTICATIONLEVEL => -2146368493

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_USERPASSWDNOTVALID => -2146368492

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CLSIDORIIDMISMATCH => -2146368488

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_REMOTEINTERFACE => -2146368487

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_DLLREGISTERSERVER => -2146368486

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_NOSERVERSHARE => -2146368485

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_DLLLOADFAILED => -2146368483

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_BADREGISTRYLIBID => -2146368482

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_APPDIRNOTFOUND => -2146368481

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_REGISTRARFAILED => -2146368477

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_COMPFILE_DOESNOTEXIST => -2146368476

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_COMPFILE_LOADDLLFAIL => -2146368475

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_COMPFILE_GETCLASSOBJ => -2146368474

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_COMPFILE_CLASSNOTAVAIL => -2146368473

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_COMPFILE_BADTLB => -2146368472

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_COMPFILE_NOTINSTALLABLE => -2146368471

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_NOTCHANGEABLE => -2146368470

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_NOTDELETEABLE => -2146368469

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_SESSION => -2146368468

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_COMP_MOVE_LOCKED => -2146368467

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_COMP_MOVE_BAD_DEST => -2146368466

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_REGISTERTLB => -2146368464

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_SYSTEMAPP => -2146368461

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_COMPFILE_NOREGISTRAR => -2146368460

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_COREQCOMPINSTALLED => -2146368459

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_SERVICENOTINSTALLED => -2146368458

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_PROPERTYSAVEFAILED => -2146368457

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_OBJECTEXISTS => -2146368456

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_COMPONENTEXISTS => -2146368455

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_REGFILE_CORRUPT => -2146368453

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_PROPERTY_OVERFLOW => -2146368452

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_NOTINREGISTRY => -2146368450

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_OBJECTNOTPOOLABLE => -2146368449

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_APPLID_MATCHES_CLSID => -2146368442

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_ROLE_DOES_NOT_EXIST => -2146368441

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_START_APP_NEEDS_COMPONENTS => -2146368440

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_REQUIRES_DIFFERENT_PLATFORM => -2146368439

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CAN_NOT_EXPORT_APP_PROXY => -2146368438

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CAN_NOT_START_APP => -2146368437

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CAN_NOT_EXPORT_SYS_APP => -2146368436

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CANT_SUBSCRIBE_TO_COMPONENT => -2146368435

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_EVENTCLASS_CANT_BE_SUBSCRIBER => -2146368434

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_LIB_APP_PROXY_INCOMPATIBLE => -2146368433

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_BASE_PARTITION_ONLY => -2146368432

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_START_APP_DISABLED => -2146368431

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CAT_DUPLICATE_PARTITION_NAME => -2146368425

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CAT_INVALID_PARTITION_NAME => -2146368424

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CAT_PARTITION_IN_USE => -2146368423

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_FILE_PARTITION_DUPLICATE_FILES => -2146368422

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CAT_IMPORTED_COMPONENTS_NOT_ALLOWED => -2146368421

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_AMBIGUOUS_APPLICATION_NAME => -2146368420

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_AMBIGUOUS_PARTITION_NAME => -2146368419

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_REGDB_NOTINITIALIZED => -2146368398

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_REGDB_NOTOPEN => -2146368397

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_REGDB_SYSTEMERR => -2146368396

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_REGDB_ALREADYRUNNING => -2146368395

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_MIG_VERSIONNOTSUPPORTED => -2146368384

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_MIG_SCHEMANOTFOUND => -2146368383

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CAT_BITNESSMISMATCH => -2146368382

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CAT_UNACCEPTABLEBITNESS => -2146368381

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CAT_WRONGAPPBITNESS => -2146368380

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CAT_PAUSE_RESUME_NOT_SUPPORTED => -2146368379

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CAT_SERVERFAULT => -2146368378

    /**
     * @type {Integer (Int32)}
     */
    static COMQC_E_APPLICATION_NOT_QUEUED => -2146368000

    /**
     * @type {Integer (Int32)}
     */
    static COMQC_E_NO_QUEUEABLE_INTERFACES => -2146367999

    /**
     * @type {Integer (Int32)}
     */
    static COMQC_E_QUEUING_SERVICE_NOT_AVAILABLE => -2146367998

    /**
     * @type {Integer (Int32)}
     */
    static COMQC_E_NO_IPERSISTSTREAM => -2146367997

    /**
     * @type {Integer (Int32)}
     */
    static COMQC_E_BAD_MESSAGE => -2146367996

    /**
     * @type {Integer (Int32)}
     */
    static COMQC_E_UNAUTHENTICATED => -2146367995

    /**
     * @type {Integer (Int32)}
     */
    static COMQC_E_UNTRUSTED_ENQUEUER => -2146367994

    /**
     * @type {Integer (Int32)}
     */
    static MSDTC_E_DUPLICATE_RESOURCE => -2146367743

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_OBJECT_PARENT_MISSING => -2146367480

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_OBJECT_DOES_NOT_EXIST => -2146367479

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_APP_NOT_RUNNING => -2146367478

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_INVALID_PARTITION => -2146367477

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_SVCAPP_NOT_POOLABLE_OR_RECYCLABLE => -2146367475

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_USER_IN_SET => -2146367474

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CANTRECYCLELIBRARYAPPS => -2146367473

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CANTRECYCLESERVICEAPPS => -2146367471

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_PROCESSALREADYRECYCLED => -2146367470

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_PAUSEDPROCESSMAYNOTBERECYCLED => -2146367469

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CANTMAKEINPROCSERVICE => -2146367468

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_PROGIDINUSEBYCLSID => -2146367467

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_DEFAULT_PARTITION_NOT_IN_SET => -2146367466

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_RECYCLEDPROCESSMAYNOTBEPAUSED => -2146367465

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_PARTITION_ACCESSDENIED => -2146367464

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_PARTITION_MSI_ONLY => -2146367463

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_LEGACYCOMPS_NOT_ALLOWED_IN_1_0_FORMAT => -2146367462

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_LEGACYCOMPS_NOT_ALLOWED_IN_NONBASE_PARTITIONS => -2146367461

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_COMP_MOVE_SOURCE => -2146367460

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_COMP_MOVE_DEST => -2146367459

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_COMP_MOVE_PRIVATE => -2146367458

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_BASEPARTITION_REQUIRED_IN_SET => -2146367457

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_CANNOT_ALIAS_EVENTCLASS => -2146367456

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_PRIVATE_ACCESSDENIED => -2146367455

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_SAFERINVALID => -2146367454

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_REGISTRY_ACCESSDENIED => -2146367453

    /**
     * @type {Integer (Int32)}
     */
    static COMADMIN_E_PARTITIONS_DISABLED => -2146367452

    /**
     * @type {Integer (Int32)}
     */
    static MENROLL_S_ENROLLMENT_SUSPENDED => 1572881

    /**
     * @type {Integer (Int32)}
     */
    static WER_S_REPORT_DEBUG => 1769472

    /**
     * @type {Integer (Int32)}
     */
    static WER_S_REPORT_UPLOADED => 1769473

    /**
     * @type {Integer (Int32)}
     */
    static WER_S_REPORT_QUEUED => 1769474

    /**
     * @type {Integer (Int32)}
     */
    static WER_S_DISABLED => 1769475

    /**
     * @type {Integer (Int32)}
     */
    static WER_S_SUSPENDED_UPLOAD => 1769476

    /**
     * @type {Integer (Int32)}
     */
    static WER_S_DISABLED_QUEUE => 1769477

    /**
     * @type {Integer (Int32)}
     */
    static WER_S_DISABLED_ARCHIVE => 1769478

    /**
     * @type {Integer (Int32)}
     */
    static WER_S_REPORT_ASYNC => 1769479

    /**
     * @type {Integer (Int32)}
     */
    static WER_S_IGNORE_ASSERT_INSTANCE => 1769480

    /**
     * @type {Integer (Int32)}
     */
    static WER_S_IGNORE_ALL_ASSERTS => 1769481

    /**
     * @type {Integer (Int32)}
     */
    static WER_S_ASSERT_CONTINUE => 1769482

    /**
     * @type {Integer (Int32)}
     */
    static WER_S_THROTTLED => 1769483

    /**
     * @type {Integer (Int32)}
     */
    static WER_S_REPORT_UPLOADED_CAB => 1769484

    /**
     * @type {Integer (Int32)}
     */
    static WER_E_CRASH_FAILURE => -2145681408

    /**
     * @type {Integer (Int32)}
     */
    static WER_E_CANCELED => -2145681407

    /**
     * @type {Integer (Int32)}
     */
    static WER_E_NETWORK_FAILURE => -2145681406

    /**
     * @type {Integer (Int32)}
     */
    static WER_E_NOT_INITIALIZED => -2145681405

    /**
     * @type {Integer (Int32)}
     */
    static WER_E_ALREADY_REPORTING => -2145681404

    /**
     * @type {Integer (Int32)}
     */
    static WER_E_DUMP_THROTTLED => -2145681403

    /**
     * @type {Integer (Int32)}
     */
    static WER_E_INSUFFICIENT_CONSENT => -2145681402

    /**
     * @type {Integer (Int32)}
     */
    static WER_E_TOO_HEAVY => -2145681401

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_IO_COMPLETE => 2031617

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_NO_HANDLER_DEFINED => -2145452031

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_CONTEXT_ALREADY_DEFINED => -2145452030

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_INVALID_ASYNCHRONOUS_REQUEST => -2145452029

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_DISALLOW_FAST_IO => -2145452028

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_INVALID_NAME_REQUEST => -2145452027

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_NOT_SAFE_TO_POST_OPERATION => -2145452026

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_NOT_INITIALIZED => -2145452025

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_FILTER_NOT_READY => -2145452024

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_POST_OPERATION_CLEANUP => -2145452023

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_INTERNAL_ERROR => -2145452022

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_DELETING_OBJECT => -2145452021

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_MUST_BE_NONPAGED_POOL => -2145452020

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_DUPLICATE_ENTRY => -2145452019

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_CBDQ_DISABLED => -2145452018

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_DO_NOT_ATTACH => -2145452017

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_DO_NOT_DETACH => -2145452016

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_INSTANCE_ALTITUDE_COLLISION => -2145452015

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_INSTANCE_NAME_COLLISION => -2145452014

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_FILTER_NOT_FOUND => -2145452013

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_VOLUME_NOT_FOUND => -2145452012

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_INSTANCE_NOT_FOUND => -2145452011

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_CONTEXT_ALLOCATION_NOT_FOUND => -2145452010

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_INVALID_CONTEXT_REGISTRATION => -2145452009

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_NAME_CACHE_MISS => -2145452008

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_NO_DEVICE_OBJECT => -2145452007

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_VOLUME_ALREADY_MOUNTED => -2145452006

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_ALREADY_ENLISTED => -2145452005

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_CONTEXT_ALREADY_LINKED => -2145452004

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_NO_WAITER_FOR_REPLY => -2145452000

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_REGISTRATION_BUSY => -2145451997

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_FLT_WCOS_NOT_SUPPORTED => -2145451996

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_HUNG_DISPLAY_DRIVER_THREAD => -2144993279

    /**
     * @type {Integer (Int32)}
     */
    static DWM_E_COMPOSITIONDISABLED => -2144980991

    /**
     * @type {Integer (Int32)}
     */
    static DWM_E_REMOTING_NOT_SUPPORTED => -2144980990

    /**
     * @type {Integer (Int32)}
     */
    static DWM_E_NO_REDIRECTION_SURFACE_AVAILABLE => -2144980989

    /**
     * @type {Integer (Int32)}
     */
    static DWM_E_NOT_QUEUING_PRESENTS => -2144980988

    /**
     * @type {Integer (Int32)}
     */
    static DWM_E_ADAPTER_NOT_FOUND => -2144980987

    /**
     * @type {Integer (Int32)}
     */
    static DWM_S_GDI_REDIRECTION_SURFACE => 2502661

    /**
     * @type {Integer (Int32)}
     */
    static DWM_E_TEXTURE_TOO_LARGE => -2144980985

    /**
     * @type {Integer (Int32)}
     */
    static DWM_S_GDI_REDIRECTION_SURFACE_BLT_VIA_GDI => 2502664

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_MONITOR_NO_DESCRIPTOR => 2494465

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_MONITOR_UNKNOWN_DESCRIPTOR_FORMAT => 2494466

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_MONITOR_INVALID_DESCRIPTOR_CHECKSUM => -1071247357

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_MONITOR_INVALID_STANDARD_TIMING_BLOCK => -1071247356

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_MONITOR_WMI_DATABLOCK_REGISTRATION_FAILED => -1071247355

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_MONITOR_INVALID_SERIAL_NUMBER_MONDSC_BLOCK => -1071247354

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_MONITOR_INVALID_USER_FRIENDLY_MONDSC_BLOCK => -1071247353

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_MONITOR_NO_MORE_DESCRIPTOR_DATA => -1071247352

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_MONITOR_INVALID_DETAILED_TIMING_BLOCK => -1071247351

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_MONITOR_INVALID_MANUFACTURE_DATE => -1071247350

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NOT_EXCLUSIVE_MODE_OWNER => -1071243264

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INSUFFICIENT_DMA_BUFFER => -1071243263

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_DISPLAY_ADAPTER => -1071243262

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_ADAPTER_WAS_RESET => -1071243261

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_DRIVER_MODEL => -1071243260

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PRESENT_MODE_CHANGED => -1071243259

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PRESENT_OCCLUDED => -1071243258

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PRESENT_DENIED => -1071243257

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_CANNOTCOLORCONVERT => -1071243256

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_DRIVER_MISMATCH => -1071243255

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PARTIAL_DATA_POPULATED => 1076240394

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PRESENT_REDIRECTION_DISABLED => -1071243253

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PRESENT_UNOCCLUDED => -1071243252

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_WINDOWDC_NOT_AVAILABLE => -1071243251

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_WINDOWLESS_PRESENT_DISABLED => -1071243250

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PRESENT_INVALID_WINDOW => -1071243249

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PRESENT_BUFFER_NOT_BOUND => -1071243248

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_VAIL_STATE_CHANGED => -1071243247

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INDIRECT_DISPLAY_ABANDON_SWAPCHAIN => -1071243246

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INDIRECT_DISPLAY_DEVICE_STOPPED => -1071243245

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_VAIL_FAILED_TO_SEND_CREATE_SUPERWETINK_MESSAGE => -1071243244

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_VAIL_FAILED_TO_SEND_DESTROY_SUPERWETINK_MESSAGE => -1071243243

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_VAIL_FAILED_TO_SEND_COMPOSITION_WINDOW_DPI_MESSAGE => -1071243242

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_LINK_CONFIGURATION_IN_PROGRESS => -1071243241

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MPO_ALLOCATION_UNPINNED => -1071243240

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_SETDISPLAYMODE_REQUIRED => -1071243239

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NO_VIDEO_MEMORY => -1071243008

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_CANT_LOCK_MEMORY => -1071243007

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_ALLOCATION_BUSY => -1071243006

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_TOO_MANY_REFERENCES => -1071243005

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_TRY_AGAIN_LATER => -1071243004

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_TRY_AGAIN_NOW => -1071243003

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_ALLOCATION_INVALID => -1071243002

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_UNSWIZZLING_APERTURE_UNAVAILABLE => -1071243001

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_UNSWIZZLING_APERTURE_UNSUPPORTED => -1071243000

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_CANT_EVICT_PINNED_ALLOCATION => -1071242999

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_ALLOCATION_USAGE => -1071242992

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_CANT_RENDER_LOCKED_ALLOCATION => -1071242991

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_ALLOCATION_CLOSED => -1071242990

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_ALLOCATION_INSTANCE => -1071242989

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_ALLOCATION_HANDLE => -1071242988

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_WRONG_ALLOCATION_DEVICE => -1071242987

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_ALLOCATION_CONTENT_LOST => -1071242986

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_GPU_EXCEPTION_ON_DEVICE => -1071242752

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_SKIP_ALLOCATION_PREPARATION => 1076240897

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_VIDPN_TOPOLOGY => -1071242496

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_VIDPN_TOPOLOGY_NOT_SUPPORTED => -1071242495

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_VIDPN_TOPOLOGY_CURRENTLY_NOT_SUPPORTED => -1071242494

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_VIDPN => -1071242493

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE => -1071242492

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET => -1071242491

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_VIDPN_MODALITY_NOT_SUPPORTED => -1071242490

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MODE_NOT_PINNED => 2499335

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_VIDPN_SOURCEMODESET => -1071242488

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_VIDPN_TARGETMODESET => -1071242487

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_FREQUENCY => -1071242486

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_ACTIVE_REGION => -1071242485

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_TOTAL_REGION => -1071242484

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE_MODE => -1071242480

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET_MODE => -1071242479

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PINNED_MODE_MUST_REMAIN_IN_SET => -1071242478

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PATH_ALREADY_IN_TOPOLOGY => -1071242477

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MODE_ALREADY_IN_MODESET => -1071242476

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_VIDEOPRESENTSOURCESET => -1071242475

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_VIDEOPRESENTTARGETSET => -1071242474

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_SOURCE_ALREADY_IN_SET => -1071242473

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_TARGET_ALREADY_IN_SET => -1071242472

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_VIDPN_PRESENT_PATH => -1071242471

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NO_RECOMMENDED_VIDPN_TOPOLOGY => -1071242470

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGESET => -1071242469

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGE => -1071242468

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_FREQUENCYRANGE_NOT_IN_SET => -1071242467

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NO_PREFERRED_MODE => 2499358

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_FREQUENCYRANGE_ALREADY_IN_SET => -1071242465

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_STALE_MODESET => -1071242464

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_MONITOR_SOURCEMODESET => -1071242463

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_MONITOR_SOURCE_MODE => -1071242462

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NO_RECOMMENDED_FUNCTIONAL_VIDPN => -1071242461

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MODE_ID_MUST_BE_UNIQUE => -1071242460

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_EMPTY_ADAPTER_MONITOR_MODE_SUPPORT_INTERSECTION => -1071242459

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_VIDEO_PRESENT_TARGETS_LESS_THAN_SOURCES => -1071242458

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PATH_NOT_IN_TOPOLOGY => -1071242457

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_ADAPTER_MUST_HAVE_AT_LEAST_ONE_SOURCE => -1071242456

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_ADAPTER_MUST_HAVE_AT_LEAST_ONE_TARGET => -1071242455

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_MONITORDESCRIPTORSET => -1071242454

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_MONITORDESCRIPTOR => -1071242453

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MONITORDESCRIPTOR_NOT_IN_SET => -1071242452

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MONITORDESCRIPTOR_ALREADY_IN_SET => -1071242451

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MONITORDESCRIPTOR_ID_MUST_BE_UNIQUE => -1071242450

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_VIDPN_TARGET_SUBSET_TYPE => -1071242449

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_RESOURCES_NOT_RELATED => -1071242448

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_SOURCE_ID_MUST_BE_UNIQUE => -1071242447

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_TARGET_ID_MUST_BE_UNIQUE => -1071242446

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NO_AVAILABLE_VIDPN_TARGET => -1071242445

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MONITOR_COULD_NOT_BE_ASSOCIATED_WITH_ADAPTER => -1071242444

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NO_VIDPNMGR => -1071242443

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NO_ACTIVE_VIDPN => -1071242442

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_STALE_VIDPN_TOPOLOGY => -1071242441

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MONITOR_NOT_CONNECTED => -1071242440

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_SOURCE_NOT_IN_TOPOLOGY => -1071242439

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_PRIMARYSURFACE_SIZE => -1071242438

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_VISIBLEREGION_SIZE => -1071242437

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_STRIDE => -1071242436

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_PIXELFORMAT => -1071242435

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_COLORBASIS => -1071242434

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_PIXELVALUEACCESSMODE => -1071242433

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_TARGET_NOT_IN_TOPOLOGY => -1071242432

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NO_DISPLAY_MODE_MANAGEMENT_SUPPORT => -1071242431

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_VIDPN_SOURCE_IN_USE => -1071242430

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_CANT_ACCESS_ACTIVE_VIDPN => -1071242429

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_PATH_IMPORTANCE_ORDINAL => -1071242428

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_PATH_CONTENT_GEOMETRY_TRANSFORMATION => -1071242427

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PATH_CONTENT_GEOMETRY_TRANSFORMATION_NOT_SUPPORTED => -1071242426

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_GAMMA_RAMP => -1071242425

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_GAMMA_RAMP_NOT_SUPPORTED => -1071242424

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MULTISAMPLING_NOT_SUPPORTED => -1071242423

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MODE_NOT_IN_MODESET => -1071242422

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_DATASET_IS_EMPTY => 2499403

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NO_MORE_ELEMENTS_IN_DATASET => 2499404

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_VIDPN_TOPOLOGY_RECOMMENDATION_REASON => -1071242419

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_PATH_CONTENT_TYPE => -1071242418

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_COPYPROTECTION_TYPE => -1071242417

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_UNASSIGNED_MODESET_ALREADY_EXISTS => -1071242416

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PATH_CONTENT_GEOMETRY_TRANSFORMATION_NOT_PINNED => 2499409

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_SCANLINE_ORDERING => -1071242414

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_TOPOLOGY_CHANGES_NOT_ALLOWED => -1071242413

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NO_AVAILABLE_IMPORTANCE_ORDINALS => -1071242412

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INCOMPATIBLE_PRIVATE_FORMAT => -1071242411

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_MODE_PRUNING_ALGORITHM => -1071242410

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_MONITOR_CAPABILITY_ORIGIN => -1071242409

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGE_CONSTRAINT => -1071242408

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MAX_NUM_PATHS_REACHED => -1071242407

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_CANCEL_VIDPN_TOPOLOGY_AUGMENTATION => -1071242406

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_CLIENT_TYPE => -1071242405

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_CLIENTVIDPN_NOT_SET => -1071242404

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_SPECIFIED_CHILD_ALREADY_CONNECTED => -1071242240

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_CHILD_DESCRIPTOR_NOT_SUPPORTED => -1071242239

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_UNKNOWN_CHILD_STATUS => 1076241455

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NOT_A_LINKED_ADAPTER => -1071242192

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_LEADLINK_NOT_ENUMERATED => -1071242191

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_CHAINLINKS_NOT_ENUMERATED => -1071242190

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_ADAPTER_CHAIN_NOT_READY => -1071242189

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_CHAINLINKS_NOT_STARTED => -1071242188

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_CHAINLINKS_NOT_POWERED_ON => -1071242187

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INCONSISTENT_DEVICE_LINK_STATE => -1071242186

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_LEADLINK_START_DEFERRED => 1076241463

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NOT_POST_DEVICE_DRIVER => -1071242184

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_POLLING_TOO_FREQUENTLY => 1076241465

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_START_DEFERRED => 1076241466

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_ADAPTER_ACCESS_NOT_EXCLUDED => -1071242181

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_DEPENDABLE_CHILD_STATUS => 1076241468

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_NOT_SUPPORTED => -1071241984

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_COPP_NOT_SUPPORTED => -1071241983

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_UAB_NOT_SUPPORTED => -1071241982

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_INVALID_ENCRYPTED_PARAMETERS => -1071241981

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_NO_VIDEO_OUTPUTS_EXIST => -1071241979

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_INTERNAL_ERROR => -1071241973

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_INVALID_HANDLE => -1071241972

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PVP_INVALID_CERTIFICATE_LENGTH => -1071241970

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_SPANNING_MODE_ENABLED => -1071241969

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_THEATER_MODE_ENABLED => -1071241968

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PVP_HFS_FAILED => -1071241967

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_INVALID_SRM => -1071241966

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_HDCP => -1071241965

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_ACP => -1071241964

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_CGMSA => -1071241963

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_HDCP_SRM_NEVER_SET => -1071241962

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_RESOLUTION_TOO_HIGH => -1071241961

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_ALL_HDCP_HARDWARE_ALREADY_IN_USE => -1071241960

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_VIDEO_OUTPUT_NO_LONGER_EXISTS => -1071241958

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_SESSION_TYPE_CHANGE_IN_PROGRESS => -1071241957

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_VIDEO_OUTPUT_DOES_NOT_HAVE_COPP_SEMANTICS => -1071241956

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_INVALID_INFORMATION_REQUEST => -1071241955

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_DRIVER_INTERNAL_ERROR => -1071241954

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_VIDEO_OUTPUT_DOES_NOT_HAVE_OPM_SEMANTICS => -1071241953

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_SIGNALING_NOT_SUPPORTED => -1071241952

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_OPM_INVALID_CONFIGURATION_REQUEST => -1071241951

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_I2C_NOT_SUPPORTED => -1071241856

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_I2C_DEVICE_DOES_NOT_EXIST => -1071241855

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_I2C_ERROR_TRANSMITTING_DATA => -1071241854

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_I2C_ERROR_RECEIVING_DATA => -1071241853

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_DDCCI_VCP_NOT_SUPPORTED => -1071241852

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_DDCCI_INVALID_DATA => -1071241851

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_DDCCI_MONITOR_RETURNED_INVALID_TIMING_STATUS_BYTE => -1071241850

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MCA_INVALID_CAPABILITIES_STRING => -1071241849

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MCA_INTERNAL_ERROR => -1071241848

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_DDCCI_INVALID_MESSAGE_COMMAND => -1071241847

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_DDCCI_INVALID_MESSAGE_LENGTH => -1071241846

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_DDCCI_INVALID_MESSAGE_CHECKSUM => -1071241845

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_PHYSICAL_MONITOR_HANDLE => -1071241844

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MONITOR_NO_LONGER_EXISTS => -1071241843

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_DDCCI_CURRENT_CURRENT_VALUE_GREATER_THAN_MAXIMUM_VALUE => -1071241768

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MCA_INVALID_VCP_VERSION => -1071241767

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MCA_MONITOR_VIOLATES_MCCS_SPECIFICATION => -1071241766

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MCA_MCCS_VERSION_MISMATCH => -1071241765

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MCA_UNSUPPORTED_MCCS_VERSION => -1071241764

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MCA_INVALID_TECHNOLOGY_TYPE_RETURNED => -1071241762

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MCA_UNSUPPORTED_COLOR_TEMPERATURE => -1071241761

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_ONLY_CONSOLE_SESSION_SUPPORTED => -1071241760

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NO_DISPLAY_DEVICE_CORRESPONDS_TO_NAME => -1071241759

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_DISPLAY_DEVICE_NOT_ATTACHED_TO_DESKTOP => -1071241758

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_MIRRORING_DEVICES_NOT_SUPPORTED => -1071241757

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INVALID_POINTER => -1071241756

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_NO_MONITORS_CORRESPOND_TO_DISPLAY_DEVICE => -1071241755

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_PARAMETER_ARRAY_TOO_SMALL => -1071241754

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_INTERNAL_ERROR => -1071241753

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_SESSION_TYPE_CHANGE_IN_PROGRESS => -1071249944

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_UNKNOWN_BIOS_FRAME_BUFFER_NOT_FOUND => -1071241728

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_GRAPHICS_UEFI_FRAME_BUFFER_NOT_FOUND => -1071241727

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_INVALID_PACKET => -2144927743

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_MISSING_SOH => -2144927742

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_CONFLICTING_ID => -2144927741

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_NO_CACHED_SOH => -2144927740

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_STILL_BOUND => -2144927739

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_NOT_REGISTERED => -2144927738

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_NOT_INITIALIZED => -2144927737

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_MISMATCHED_ID => -2144927736

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_NOT_PENDING => -2144927735

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_ID_NOT_FOUND => -2144927734

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_MAXSIZE_TOO_SMALL => -2144927733

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_SERVICE_NOT_RUNNING => -2144927732

    /**
     * @type {Integer (Int32)}
     */
    static NAP_S_CERT_ALREADY_PRESENT => 2555917

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_ENTITY_DISABLED => -2144927730

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_NETSH_GROUPPOLICY_ERROR => -2144927729

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_TOO_MANY_CALLS => -2144927728

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_SHV_CONFIG_EXISTED => -2144927727

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_SHV_CONFIG_NOT_FOUND => -2144927726

    /**
     * @type {Integer (Int32)}
     */
    static NAP_E_SHV_TIMEOUT => -2144927725

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_ERROR_MASK => -2144862208

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_AUTHFAIL => -2144862207

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BADINDEX => -2144862206

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_PARAMETER => -2144862205

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_AUDITFAILURE => -2144862204

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_CLEAR_DISABLED => -2144862203

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DEACTIVATED => -2144862202

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DISABLED => -2144862201

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DISABLED_CMD => -2144862200

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_FAIL => -2144862199

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_ORDINAL => -2144862198

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_INSTALL_DISABLED => -2144862197

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_INVALID_KEYHANDLE => -2144862196

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_KEYNOTFOUND => -2144862195

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_INAPPROPRIATE_ENC => -2144862194

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_MIGRATEFAIL => -2144862193

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_INVALID_PCR_INFO => -2144862192

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NOSPACE => -2144862191

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NOSRK => -2144862190

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NOTSEALED_BLOB => -2144862189

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_OWNER_SET => -2144862188

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_RESOURCES => -2144862187

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_SHORTRANDOM => -2144862186

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_SIZE => -2144862185

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_WRONGPCRVAL => -2144862184

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_PARAM_SIZE => -2144862183

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_SHA_THREAD => -2144862182

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_SHA_ERROR => -2144862181

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_FAILEDSELFTEST => -2144862180

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_AUTH2FAIL => -2144862179

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BADTAG => -2144862178

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_IOERROR => -2144862177

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_ENCRYPT_ERROR => -2144862176

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DECRYPT_ERROR => -2144862175

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_INVALID_AUTHHANDLE => -2144862174

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NO_ENDORSEMENT => -2144862173

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_INVALID_KEYUSAGE => -2144862172

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_WRONG_ENTITYTYPE => -2144862171

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_INVALID_POSTINIT => -2144862170

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_INAPPROPRIATE_SIG => -2144862169

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_KEY_PROPERTY => -2144862168

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_MIGRATION => -2144862167

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_SCHEME => -2144862166

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_DATASIZE => -2144862165

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_MODE => -2144862164

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_PRESENCE => -2144862163

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_VERSION => -2144862162

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NO_WRAP_TRANSPORT => -2144862161

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_AUDITFAIL_UNSUCCESSFUL => -2144862160

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_AUDITFAIL_SUCCESSFUL => -2144862159

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NOTRESETABLE => -2144862158

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NOTLOCAL => -2144862157

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_TYPE => -2144862156

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_INVALID_RESOURCE => -2144862155

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NOTFIPS => -2144862154

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_INVALID_FAMILY => -2144862153

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NO_NV_PERMISSION => -2144862152

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_REQUIRES_SIGN => -2144862151

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_KEY_NOTSUPPORTED => -2144862150

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_AUTH_CONFLICT => -2144862149

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_AREA_LOCKED => -2144862148

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_LOCALITY => -2144862147

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_READ_ONLY => -2144862146

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PER_NOWRITE => -2144862145

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_FAMILYCOUNT => -2144862144

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_WRITE_LOCKED => -2144862143

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_ATTRIBUTES => -2144862142

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_INVALID_STRUCTURE => -2144862141

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_KEY_OWNER_CONTROL => -2144862140

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_COUNTER => -2144862139

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NOT_FULLWRITE => -2144862138

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_CONTEXT_GAP => -2144862137

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_MAXNVWRITES => -2144862136

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NOOPERATOR => -2144862135

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_RESOURCEMISSING => -2144862134

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DELEGATE_LOCK => -2144862133

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DELEGATE_FAMILY => -2144862132

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DELEGATE_ADMIN => -2144862131

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_TRANSPORT_NOTEXCLUSIVE => -2144862130

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_OWNER_CONTROL => -2144862129

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DAA_RESOURCES => -2144862128

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DAA_INPUT_DATA0 => -2144862127

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DAA_INPUT_DATA1 => -2144862126

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DAA_ISSUER_SETTINGS => -2144862125

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DAA_TPM_SETTINGS => -2144862124

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DAA_STAGE => -2144862123

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DAA_ISSUER_VALIDITY => -2144862122

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DAA_WRONG_W => -2144862121

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_HANDLE => -2144862120

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_DELEGATE => -2144862119

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BADCONTEXT => -2144862118

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_TOOMANYCONTEXTS => -2144862117

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_MA_TICKET_SIGNATURE => -2144862116

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_MA_DESTINATION => -2144862115

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_MA_SOURCE => -2144862114

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_MA_AUTHORITY => -2144862113

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PERMANENTEK => -2144862111

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BAD_SIGNATURE => -2144862110

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NOCONTEXTSPACE => -2144862109

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_ASYMMETRIC => -2144862079

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_ATTRIBUTES => -2144862078

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_HASH => -2144862077

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_VALUE => -2144862076

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_HIERARCHY => -2144862075

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_KEY_SIZE => -2144862073

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_MGF => -2144862072

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_MODE => -2144862071

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_TYPE => -2144862070

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_HANDLE => -2144862069

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_KDF => -2144862068

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_RANGE => -2144862067

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_AUTH_FAIL => -2144862066

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_NONCE => -2144862065

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_PP => -2144862064

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_SCHEME => -2144862062

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_SIZE => -2144862059

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_SYMMETRIC => -2144862058

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_TAG => -2144862057

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_SELECTOR => -2144862056

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_INSUFFICIENT => -2144862054

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_SIGNATURE => -2144862053

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_KEY => -2144862052

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_POLICY_FAIL => -2144862051

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_INTEGRITY => -2144862049

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_TICKET => -2144862048

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_RESERVED_BITS => -2144862047

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_BAD_AUTH => -2144862046

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_EXPIRED => -2144862045

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_POLICY_CC => -2144862044

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_BINDING => -2144862043

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_CURVE => -2144862042

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_ECC_POINT => -2144862041

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_INITIALIZE => -2144861952

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_FAILURE => -2144861951

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_SEQUENCE => -2144861949

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_PRIVATE => -2144861941

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_HMAC => -2144861927

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_DISABLED => -2144861920

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_EXCLUSIVE => -2144861919

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_ECC_CURVE => -2144861917

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_AUTH_TYPE => -2144861916

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_AUTH_MISSING => -2144861915

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_POLICY => -2144861914

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_PCR => -2144861913

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_PCR_CHANGED => -2144861912

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_UPGRADE => -2144861907

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_TOO_MANY_CONTEXTS => -2144861906

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_AUTH_UNAVAILABLE => -2144861905

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_REBOOT => -2144861904

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_UNBALANCED => -2144861903

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_COMMAND_SIZE => -2144861886

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_COMMAND_CODE => -2144861885

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_AUTHSIZE => -2144861884

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_AUTH_CONTEXT => -2144861883

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_NV_RANGE => -2144861882

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_NV_SIZE => -2144861881

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_NV_LOCKED => -2144861880

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_NV_AUTHORIZATION => -2144861879

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_NV_UNINITIALIZED => -2144861878

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_NV_SPACE => -2144861877

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_NV_DEFINED => -2144861876

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_BAD_CONTEXT => -2144861872

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_CPHASH => -2144861871

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_PARENT => -2144861870

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_NEEDS_TEST => -2144861869

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_NO_RESULT => -2144861868

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_SENSITIVE => -2144861867

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_COMMAND_BLOCKED => -2144861184

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_INVALID_HANDLE => -2144861183

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DUPLICATE_VHANDLE => -2144861182

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_EMBEDDED_COMMAND_BLOCKED => -2144861181

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_EMBEDDED_COMMAND_UNSUPPORTED => -2144861180

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_RETRY => -2144860160

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NEEDS_SELFTEST => -2144860159

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DOING_SELFTEST => -2144860158

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_DEFEND_LOCK_RUNNING => -2144860157

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_CONTEXT_GAP => -2144859903

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_OBJECT_MEMORY => -2144859902

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_SESSION_MEMORY => -2144859901

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_MEMORY => -2144859900

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_SESSION_HANDLES => -2144859899

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_OBJECT_HANDLES => -2144859898

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_LOCALITY => -2144859897

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_YIELDED => -2144859896

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_CANCELED => -2144859895

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_TESTING => -2144859894

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_NV_RATE => -2144859872

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_LOCKOUT => -2144859871

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_RETRY => -2144859870

    /**
     * @type {Integer (Int32)}
     */
    static TPM_20_E_NV_UNAVAILABLE => -2144859869

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_INTERNAL_ERROR => -2144845823

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_BAD_PARAMETER => -2144845822

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_INVALID_OUTPUT_POINTER => -2144845821

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_INVALID_CONTEXT => -2144845820

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_INSUFFICIENT_BUFFER => -2144845819

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_IOERROR => -2144845818

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_INVALID_CONTEXT_PARAM => -2144845817

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_SERVICE_NOT_RUNNING => -2144845816

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_TOO_MANY_TBS_CONTEXTS => -2144845815

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_TOO_MANY_RESOURCES => -2144845814

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_SERVICE_START_PENDING => -2144845813

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_PPI_NOT_SUPPORTED => -2144845812

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_COMMAND_CANCELED => -2144845811

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_BUFFER_TOO_LARGE => -2144845810

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_TPM_NOT_FOUND => -2144845809

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_SERVICE_DISABLED => -2144845808

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_NO_EVENT_LOG => -2144845807

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_ACCESS_DENIED => -2144845806

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_PROVISIONING_NOT_ALLOWED => -2144845805

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_PPI_FUNCTION_UNSUPPORTED => -2144845804

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_OWNERAUTH_NOT_FOUND => -2144845803

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_PROVISIONING_INCOMPLETE => -2144845802

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_TPM_IN_EXCLUSIVE_MODE => -2144845801

    /**
     * @type {Integer (Int32)}
     */
    static TBS_E_TPM_REBOOT_REQUIRED => -2144845800

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_STATE => -2144796416

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_NOT_ENOUGH_DATA => -2144796415

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_TOO_MUCH_DATA => -2144796414

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_OUTPUT_POINTER => -2144796413

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_PARAMETER => -2144796412

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_OUT_OF_MEMORY => -2144796411

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_BUFFER_TOO_SMALL => -2144796410

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INTERNAL_ERROR => -2144796409

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_ACCESS_DENIED => -2144796408

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_AUTHORIZATION_FAILED => -2144796407

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_CONTEXT_HANDLE => -2144796406

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_TBS_COMMUNICATION_ERROR => -2144796405

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_TPM_COMMAND_ERROR => -2144796404

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_MESSAGE_TOO_LARGE => -2144796403

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_ENCODING => -2144796402

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_KEY_SIZE => -2144796401

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_ENCRYPTION_FAILED => -2144796400

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_KEY_PARAMS => -2144796399

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_MIGRATION_AUTHORIZATION_BLOB => -2144796398

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_PCR_INDEX => -2144796397

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_DELEGATE_BLOB => -2144796396

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_CONTEXT_PARAMS => -2144796395

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_KEY_BLOB => -2144796394

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_PCR_DATA => -2144796393

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_OWNER_AUTH => -2144796392

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_FIPS_RNG_CHECK_FAILED => -2144796391

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_EMPTY_TCG_LOG => -2144796390

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_TCG_LOG_ENTRY => -2144796389

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_TCG_SEPARATOR_ABSENT => -2144796388

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_TCG_INVALID_DIGEST_ENTRY => -2144796387

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_POLICY_DENIES_OPERATION => -2144796386

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_NV_BITS_NOT_DEFINED => -2144796385

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_NV_BITS_NOT_READY => -2144796384

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_SEALING_KEY_NOT_AVAILABLE => -2144796383

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_NO_AUTHORIZATION_CHAIN_FOUND => -2144796382

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_SVN_COUNTER_NOT_AVAILABLE => -2144796381

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_OWNER_AUTH_NOT_NULL => -2144796380

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_ENDORSEMENT_AUTH_NOT_NULL => -2144796379

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_AUTHORIZATION_REVOKED => -2144796378

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_MALFORMED_AUTHORIZATION_KEY => -2144796377

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_AUTHORIZING_KEY_NOT_SUPPORTED => -2144796376

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_AUTHORIZATION_SIGNATURE => -2144796375

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_MALFORMED_AUTHORIZATION_POLICY => -2144796374

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_MALFORMED_AUTHORIZATION_OTHER => -2144796373

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_SEALING_KEY_CHANGED => -2144796372

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_TPM_VERSION => -2144796371

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_POLICYAUTH_BLOB_TYPE => -2144796370

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_TAG => -2144796368

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_STRUCT_SIZE => -2144796367

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_AUTH_CHAIN_ERROR => -2144796366

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_COUNTER_CORRUPTED => -2144796365

    /**
     * @type {Integer (Int32)}
     */
    static TPMAPI_E_INVALID_ALGORITHM => -2144796364

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_BUFFER_TOO_SMALL => -2144796160

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_CLEANUP_FAILED => -2144796159

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_INVALID_CONTEXT_HANDLE => -2144796158

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_INVALID_CONTEXT_PARAM => -2144796157

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_TPM_ERROR => -2144796156

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_HASH_BAD_KEY => -2144796155

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_DUPLICATE_VHANDLE => -2144796154

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_INVALID_OUTPUT_POINTER => -2144796153

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_INVALID_PARAMETER => -2144796152

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_RPC_INIT_FAILED => -2144796151

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_SCHEDULER_NOT_RUNNING => -2144796150

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_COMMAND_CANCELED => -2144796149

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_OUT_OF_MEMORY => -2144796148

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_LIST_NO_MORE_ITEMS => -2144796147

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_LIST_NOT_FOUND => -2144796146

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_NOT_ENOUGH_SPACE => -2144796145

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_NOT_ENOUGH_TPM_CONTEXTS => -2144796144

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_COMMAND_FAILED => -2144796143

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_UNKNOWN_ORDINAL => -2144796142

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_RESOURCE_EXPIRED => -2144796141

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_INVALID_RESOURCE => -2144796140

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_NOTHING_TO_UNLOAD => -2144796139

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_HASH_TABLE_FULL => -2144796138

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_TOO_MANY_TBS_CONTEXTS => -2144796137

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_TOO_MANY_RESOURCES => -2144796136

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_PPI_NOT_SUPPORTED => -2144796135

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_TPM_INCOMPATIBLE => -2144796134

    /**
     * @type {Integer (Int32)}
     */
    static TBSIMP_E_NO_EVENT_LOG => -2144796133

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PPI_ACPI_FAILURE => -2144795904

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PPI_USER_ABORT => -2144795903

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PPI_BIOS_FAILURE => -2144795902

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PPI_NOT_SUPPORTED => -2144795901

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PPI_BLOCKED_IN_BIOS => -2144795900

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_ERROR_MASK => -2144795648

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_DEVICE_NOT_READY => -2144795647

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_INVALID_HANDLE => -2144795646

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_INVALID_PARAMETER => -2144795645

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_FLAG_NOT_SUPPORTED => -2144795644

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_NOT_SUPPORTED => -2144795643

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_BUFFER_TOO_SMALL => -2144795642

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_INTERNAL_ERROR => -2144795641

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_AUTHENTICATION_FAILED => -2144795640

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_AUTHENTICATION_IGNORED => -2144795639

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_POLICY_NOT_FOUND => -2144795638

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_PROFILE_NOT_FOUND => -2144795637

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_VALIDATION_FAILED => -2144795636

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_WRONG_PARENT => -2144795634

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_KEY_NOT_LOADED => -2144795633

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NO_KEY_CERTIFICATION => -2144795632

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_KEY_NOT_FINALIZED => -2144795631

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_ATTESTATION_CHALLENGE_NOT_SET => -2144795630

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_NOT_PCR_BOUND => -2144795629

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_KEY_ALREADY_FINALIZED => -2144795628

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_KEY_USAGE_POLICY_NOT_SUPPORTED => -2144795627

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_KEY_USAGE_POLICY_INVALID => -2144795626

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_SOFT_KEY_ERROR => -2144795625

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_KEY_NOT_AUTHENTICATED => -2144795624

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_KEY_NOT_AIK => -2144795623

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_KEY_NOT_SIGNING_KEY => -2144795622

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_LOCKED_OUT => -2144795621

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_CLAIM_TYPE_NOT_SUPPORTED => -2144795620

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_VERSION_NOT_SUPPORTED => -2144795619

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_BUFFER_LENGTH_MISMATCH => -2144795618

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_IFX_RSA_KEY_CREATION_BLOCKED => -2144795617

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_TICKET_MISSING => -2144795616

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_RAW_POLICY_NOT_SUPPORTED => -2144795615

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_KEY_HANDLE_INVALIDATED => -2144795614

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_UNSUPPORTED_PSS_SALT => 1076429859

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_PLATFORM_CLAIM_MAY_BE_OUTDATED => 1076429860

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_PLATFORM_CLAIM_OUTDATED => 1076429861

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PCP_PLATFORM_CLAIM_REBOOT => 1076429862

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_ZERO_EXHAUST_ENABLED => -2144795392

    /**
     * @type {Integer (Int32)}
     */
    static DRTM_E_ENVIRONMENT_UNSAFE => -2144795391

    /**
     * @type {Integer (Int32)}
     */
    static DRTM_E_NO_DIRECT_AUTH_FOR_CURRENT_MLE => -2144795390

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_PROVISIONING_INCOMPLETE => -2144795136

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_INVALID_OWNER_AUTH => -2144795135

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_TOO_MUCH_DATA => -2144795134

    /**
     * @type {Integer (Int32)}
     */
    static TPM_E_TPM_GENERATED_EPS => -2144795133

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_DCS_NOT_FOUND => -2144337918

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_DCS_IN_USE => -2144337750

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_TOO_MANY_FOLDERS => -2144337851

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_NO_MIN_DISK => -2144337808

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_DCS_ALREADY_EXISTS => -2144337737

    /**
     * @type {Integer (Int32)}
     */
    static PLA_S_PROPERTY_IGNORED => 3145984

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_PROPERTY_CONFLICT => -2144337663

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_DCS_SINGLETON_REQUIRED => -2144337662

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_CREDENTIALS_REQUIRED => -2144337661

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_DCS_NOT_RUNNING => -2144337660

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_CONFLICT_INCL_EXCL_API => -2144337659

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_NETWORK_EXE_NOT_VALID => -2144337658

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_EXE_ALREADY_CONFIGURED => -2144337657

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_EXE_PATH_NOT_VALID => -2144337656

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_DC_ALREADY_EXISTS => -2144337655

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_DCS_START_WAIT_TIMEOUT => -2144337654

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_DC_START_WAIT_TIMEOUT => -2144337653

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_REPORT_WAIT_TIMEOUT => -2144337652

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_NO_DUPLICATES => -2144337651

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_EXE_FULL_PATH_REQUIRED => -2144337650

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_INVALID_SESSION_NAME => -2144337649

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_PLA_CHANNEL_NOT_ENABLED => -2144337648

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_TASKSCHED_CHANNEL_NOT_ENABLED => -2144337647

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_RULES_MANAGER_FAILED => -2144337646

    /**
     * @type {Integer (Int32)}
     */
    static PLA_E_CABAPI_FAILURE => -2144337645

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_LOCKED_VOLUME => -2144272384

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NOT_ENCRYPTED => -2144272383

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_TPM_BIOS => -2144272382

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_MBR_METRIC => -2144272381

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_BOOTSECTOR_METRIC => -2144272380

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_BOOTMGR_METRIC => -2144272379

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_WRONG_BOOTMGR => -2144272378

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_SECURE_KEY_REQUIRED => -2144272377

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NOT_ACTIVATED => -2144272376

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_ACTION_NOT_ALLOWED => -2144272375

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AD_SCHEMA_NOT_INSTALLED => -2144272374

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AD_INVALID_DATATYPE => -2144272373

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AD_INVALID_DATASIZE => -2144272372

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AD_NO_VALUES => -2144272371

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AD_ATTR_NOT_SET => -2144272370

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AD_GUID_NOT_FOUND => -2144272369

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_BAD_INFORMATION => -2144272368

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_TOO_SMALL => -2144272367

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_SYSTEM_VOLUME => -2144272366

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FAILED_WRONG_FS => -2144272365

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_BAD_PARTITION_SIZE => -2144272364

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NOT_SUPPORTED => -2144272363

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_BAD_DATA => -2144272362

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_VOLUME_NOT_BOUND => -2144272361

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_TPM_NOT_OWNED => -2144272360

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NOT_DATA_VOLUME => -2144272359

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AD_INSUFFICIENT_BUFFER => -2144272358

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_CONV_READ => -2144272357

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_CONV_WRITE => -2144272356

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_KEY_REQUIRED => -2144272355

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_CLUSTERING_NOT_SUPPORTED => -2144272354

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_VOLUME_BOUND_ALREADY => -2144272353

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_OS_NOT_PROTECTED => -2144272352

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PROTECTION_DISABLED => -2144272351

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_RECOVERY_KEY_REQUIRED => -2144272350

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FOREIGN_VOLUME => -2144272349

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_OVERLAPPED_UPDATE => -2144272348

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_TPM_SRK_AUTH_NOT_ZERO => -2144272347

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FAILED_SECTOR_SIZE => -2144272346

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FAILED_AUTHENTICATION => -2144272345

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NOT_OS_VOLUME => -2144272344

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AUTOUNLOCK_ENABLED => -2144272343

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_WRONG_BOOTSECTOR => -2144272342

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_WRONG_SYSTEM_FS => -2144272341

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_PASSWORD_REQUIRED => -2144272340

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_CANNOT_SET_FVEK_ENCRYPTED => -2144272339

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_CANNOT_ENCRYPT_NO_KEY => -2144272338

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_BOOTABLE_CDDVD => -2144272336

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PROTECTOR_EXISTS => -2144272335

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_RELATIVE_PATH => -2144272334

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PROTECTOR_NOT_FOUND => -2144272333

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_INVALID_KEY_FORMAT => -2144272332

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_INVALID_PASSWORD_FORMAT => -2144272331

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FIPS_RNG_CHECK_FAILED => -2144272330

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FIPS_PREVENTS_RECOVERY_PASSWORD => -2144272329

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FIPS_PREVENTS_EXTERNAL_KEY_EXPORT => -2144272328

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NOT_DECRYPTED => -2144272327

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_INVALID_PROTECTOR_TYPE => -2144272326

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_PROTECTORS_TO_TEST => -2144272325

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_KEYFILE_NOT_FOUND => -2144272324

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_KEYFILE_INVALID => -2144272323

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_KEYFILE_NO_VMK => -2144272322

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_TPM_DISABLED => -2144272321

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NOT_ALLOWED_IN_SAFE_MODE => -2144272320

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_TPM_INVALID_PCR => -2144272319

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_TPM_NO_VMK => -2144272318

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PIN_INVALID => -2144272317

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AUTH_INVALID_APPLICATION => -2144272316

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AUTH_INVALID_CONFIG => -2144272315

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FIPS_DISABLE_PROTECTION_NOT_ALLOWED => -2144272314

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FS_NOT_EXTENDED => -2144272313

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FIRMWARE_TYPE_NOT_SUPPORTED => -2144272312

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_LICENSE => -2144272311

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NOT_ON_STACK => -2144272310

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FS_MOUNTED => -2144272309

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_TOKEN_NOT_IMPERSONATED => -2144272308

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DRY_RUN_FAILED => -2144272307

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_REBOOT_REQUIRED => -2144272306

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DEBUGGER_ENABLED => -2144272305

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_RAW_ACCESS => -2144272304

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_RAW_BLOCKED => -2144272303

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_BCD_APPLICATIONS_PATH_INCORRECT => -2144272302

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NOT_ALLOWED_IN_VERSION => -2144272301

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_AUTOUNLOCK_MASTER_KEY => -2144272300

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_MOR_FAILED => -2144272299

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_HIDDEN_VOLUME => -2144272298

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_TRANSIENT_STATE => -2144272297

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PUBKEY_NOT_ALLOWED => -2144272296

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_VOLUME_HANDLE_OPEN => -2144272295

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_FEATURE_LICENSE => -2144272294

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_INVALID_STARTUP_OPTIONS => -2144272293

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_RECOVERY_PASSWORD_NOT_ALLOWED => -2144272292

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_RECOVERY_PASSWORD_REQUIRED => -2144272291

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_RECOVERY_KEY_NOT_ALLOWED => -2144272290

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_RECOVERY_KEY_REQUIRED => -2144272289

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_STARTUP_PIN_NOT_ALLOWED => -2144272288

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_STARTUP_PIN_REQUIRED => -2144272287

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_STARTUP_KEY_NOT_ALLOWED => -2144272286

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_STARTUP_KEY_REQUIRED => -2144272285

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_STARTUP_PIN_KEY_NOT_ALLOWED => -2144272284

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_STARTUP_PIN_KEY_REQUIRED => -2144272283

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_STARTUP_TPM_NOT_ALLOWED => -2144272282

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_STARTUP_TPM_REQUIRED => -2144272281

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_INVALID_PIN_LENGTH => -2144272280

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_KEY_PROTECTOR_NOT_SUPPORTED => -2144272279

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_PASSPHRASE_NOT_ALLOWED => -2144272278

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_PASSPHRASE_REQUIRED => -2144272277

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FIPS_PREVENTS_PASSPHRASE => -2144272276

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_OS_VOLUME_PASSPHRASE_NOT_ALLOWED => -2144272275

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_INVALID_BITLOCKER_OID => -2144272274

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_VOLUME_TOO_SMALL => -2144272273

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DV_NOT_SUPPORTED_ON_FS => -2144272272

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DV_NOT_ALLOWED_BY_GP => -2144272271

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_USER_CERTIFICATE_NOT_ALLOWED => -2144272270

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_USER_CERTIFICATE_REQUIRED => -2144272269

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_USER_CERT_MUST_BE_HW => -2144272268

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_USER_CONFIGURE_FDV_AUTOUNLOCK_NOT_ALLOWED => -2144272267

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_USER_CONFIGURE_RDV_AUTOUNLOCK_NOT_ALLOWED => -2144272266

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_USER_CONFIGURE_RDV_NOT_ALLOWED => -2144272265

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_USER_ENABLE_RDV_NOT_ALLOWED => -2144272264

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_USER_DISABLE_RDV_NOT_ALLOWED => -2144272263

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_INVALID_PASSPHRASE_LENGTH => -2144272256

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_PASSPHRASE_TOO_SIMPLE => -2144272255

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_RECOVERY_PARTITION => -2144272254

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_CONFLICT_FDV_RK_OFF_AUK_ON => -2144272253

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_CONFLICT_RDV_RK_OFF_AUK_ON => -2144272252

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NON_BITLOCKER_OID => -2144272251

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_PROHIBITS_SELFSIGNED => -2144272250

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_CONFLICT_RO_AND_STARTUP_KEY_REQUIRED => -2144272249

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_CONV_RECOVERY_FAILED => -2144272248

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_VIRTUALIZED_SPACE_TOO_BIG => -2144272247

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_CONFLICT_OSV_RP_OFF_ADB_ON => -2144272240

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_CONFLICT_FDV_RP_OFF_ADB_ON => -2144272239

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_CONFLICT_RDV_RP_OFF_ADB_ON => -2144272238

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NON_BITLOCKER_KU => -2144272237

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PRIVATEKEY_AUTH_FAILED => -2144272236

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_REMOVAL_OF_DRA_FAILED => -2144272235

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_OPERATION_NOT_SUPPORTED_ON_VISTA_VOLUME => -2144272234

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_CANT_LOCK_AUTOUNLOCK_ENABLED_VOLUME => -2144272233

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FIPS_HASH_KDF_NOT_ALLOWED => -2144272232

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_ENH_PIN_INVALID => -2144272231

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_INVALID_PIN_CHARS => -2144272230

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_INVALID_DATUM_TYPE => -2144272229

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_EFI_ONLY => -2144272228

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_MULTIPLE_NKP_CERTS => -2144272227

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_REMOVAL_OF_NKP_FAILED => -2144272226

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_INVALID_NKP_CERT => -2144272225

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_EXISTING_PIN => -2144272224

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PROTECTOR_CHANGE_PIN_MISMATCH => -2144272223

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PIN_PROTECTOR_CHANGE_BY_STD_USER_DISALLOWED => -2144272222

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PROTECTOR_CHANGE_MAX_PIN_CHANGE_ATTEMPTS_REACHED => -2144272221

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_PASSPHRASE_REQUIRES_ASCII => -2144272220

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FULL_ENCRYPTION_NOT_ALLOWED_ON_TP_STORAGE => -2144272219

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_WIPE_NOT_ALLOWED_ON_TP_STORAGE => -2144272218

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_KEY_LENGTH_NOT_SUPPORTED_BY_EDRIVE => -2144272217

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_EXISTING_PASSPHRASE => -2144272216

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PROTECTOR_CHANGE_PASSPHRASE_MISMATCH => -2144272215

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PASSPHRASE_TOO_LONG => -2144272214

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_PASSPHRASE_WITH_TPM => -2144272213

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_TPM_WITH_PASSPHRASE => -2144272212

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NOT_ALLOWED_ON_CSV_STACK => -2144272211

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NOT_ALLOWED_ON_CLUSTER => -2144272210

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_EDRIVE_NO_FAILOVER_TO_SW => -2144272209

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_EDRIVE_BAND_IN_USE => -2144272208

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_EDRIVE_DISALLOWED_BY_GP => -2144272207

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_EDRIVE_INCOMPATIBLE_VOLUME => -2144272206

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NOT_ALLOWED_TO_UPGRADE_WHILE_CONVERTING => -2144272205

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_EDRIVE_DV_NOT_SUPPORTED => -2144272204

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_PREBOOT_KEYBOARD_DETECTED => -2144272203

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_PREBOOT_KEYBOARD_OR_WINRE_DETECTED => -2144272202

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_REQUIRES_STARTUP_PIN_ON_TOUCH_DEVICE => -2144272201

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_REQUIRES_RECOVERY_PASSWORD_ON_TOUCH_DEVICE => -2144272200

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_WIPE_CANCEL_NOT_APPLICABLE => -2144272199

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_SECUREBOOT_DISABLED => -2144272198

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_SECUREBOOT_CONFIGURATION_INVALID => -2144272197

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_EDRIVE_DRY_RUN_FAILED => -2144272196

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_SHADOW_COPY_PRESENT => -2144272195

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_INVALID_ENHANCED_BCD_SETTINGS => -2144272194

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_EDRIVE_INCOMPATIBLE_FIRMWARE => -2144272193

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PROTECTOR_CHANGE_MAX_PASSPHRASE_CHANGE_ATTEMPTS_REACHED => -2144272192

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PASSPHRASE_PROTECTOR_CHANGE_BY_STD_USER_DISALLOWED => -2144272191

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_LIVEID_ACCOUNT_SUSPENDED => -2144272190

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_LIVEID_ACCOUNT_BLOCKED => -2144272189

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NOT_PROVISIONED_ON_ALL_VOLUMES => -2144272188

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DE_FIXED_DATA_NOT_SUPPORTED => -2144272187

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DE_HARDWARE_NOT_COMPLIANT => -2144272186

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DE_WINRE_NOT_CONFIGURED => -2144272185

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DE_PROTECTION_SUSPENDED => -2144272184

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DE_OS_VOLUME_NOT_PROTECTED => -2144272183

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DE_DEVICE_LOCKEDOUT => -2144272182

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DE_PROTECTION_NOT_YET_ENABLED => -2144272181

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_INVALID_PIN_CHARS_DETAILED => -2144272180

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DEVICE_LOCKOUT_COUNTER_UNAVAILABLE => -2144272179

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DEVICELOCKOUT_COUNTER_MISMATCH => -2144272178

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_BUFFER_TOO_LARGE => -2144272177

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_SUCH_CAPABILITY_ON_TARGET => -2144272176

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DE_PREVENTED_FOR_OS => -2144272175

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DE_VOLUME_OPTED_OUT => -2144272174

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DE_VOLUME_NOT_SUPPORTED => -2144272173

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_EOW_NOT_SUPPORTED_IN_VERSION => -2144272172

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_ADBACKUP_NOT_ENABLED => -2144272171

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_VOLUME_EXTEND_PREVENTS_EOW_DECRYPT => -2144272170

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NOT_DE_VOLUME => -2144272169

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PROTECTION_CANNOT_BE_DISABLED => -2144272168

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_OSV_KSR_NOT_ALLOWED => -2144272167

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AD_BACKUP_REQUIRED_POLICY_NOT_SET_OS_DRIVE => -2144272166

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AD_BACKUP_REQUIRED_POLICY_NOT_SET_FIXED_DRIVE => -2144272165

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AD_BACKUP_REQUIRED_POLICY_NOT_SET_REMOVABLE_DRIVE => -2144272164

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_KEY_ROTATION_NOT_SUPPORTED => -2144272163

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_EXECUTE_REQUEST_SENT_TOO_SOON => -2144272162

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_KEY_ROTATION_NOT_ENABLED => -2144272161

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DEVICE_NOT_JOINED_AAD => -2144272160

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AAD_ENDPOINT_BUSY => -2144272159

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_INVALID_NBP_CERT => -2144272158

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_EDRIVE_BAND_ENUMERATION_FAILED => -2144272157

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_POLICY_ON_RDV_EXCLUSION_LIST => -2144272156

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PREDICTED_TPM_PROTECTOR_NOT_SUPPORTED => -2144272155

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_SETUP_TPM_CALLBACK_NOT_SUPPORTED => -2144272154

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_TPM_CONTEXT_SETUP_NOT_SUPPORTED => -2144272153

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_UPDATE_INVALID_CONFIG => -2144272152

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AAD_SERVER_FAIL_RETRY_AFTER_AAD => -2144272151

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AAD_SERVER_FAIL_BACKOFF_AAD => -2144272150

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DATASET_FULL => -2144272149

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_METADATA_FULL => -2144272148

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DISCOVERY_VOLUME_NOT_SUPPORTED => -2144272147

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_EXCEED_LIMIT_RP => -2144272146

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_BACKUP_ACCOUNT => -2144272145

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_SUSPEND_PROTECTION_NOT_ALLOWED => -2144272144

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_CANNOT_PREDICT_PCR7 => -2144272143

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_ENTRY_ALREADY_EXISTS => -2144272142

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_ENTRY_NOT_FOUND => -2144272141

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DATUM_PARTIALLY_INVALID => -2144272140

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DATASET_TPM_DATUMS_INCONSISTENT => -2144272139

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_SECURE_BOOT_BINDINGS_OUT_OF_SYNC => -2144272138

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_SECURE_BOOT_BINDING_DATA_OUT_OF_SYNC => -2144272137

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_ORPHANED_TPM_BINDING_DATUM => -2144272136

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_BAD_TPM_DATUM_ASSOCIATION => -2144272135

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FINAL_TPM_PCR_VALUES_MATCH => -2144272134

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_MATCHING_PCRS_TPM_FAILURE => -2144272133

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_BACKUP_CACHE_NOT_ALLOCATED => -2144272132

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_MSA_BACKUP_CACHE_NOT_ALLOCATED => -2144272131

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AD_BACKUP_CACHE_NOT_ALLOCATED => -2144272130

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_GENERAL_TPM_FAILURE => -2144272129

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_TPM_NONEXISTENT => -2144272128

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_PCR_BOOT_LOCK_BOUNDARY => -1070530303

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_PCR_BOOT_LOCK_BOUNDARY => -1070530302

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FW_UPDATE_TPM_BINDINGS_NOT_REFRESHED => -1070530301

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_EXCEED_MAX_LIMIT_RP_IN_MEID => -1070530300

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_INVALID_TPM_BINDING_CONFIGURATION => -1070530299

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_TOO_MANY_TPM_BINDINGS => -1070530298

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_TPM_BINDING_ASSOCIATION_FAILURE => -1070530297

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_ORPHANED_PCR_DIGEST_DATUM => -1070530296

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_HW_ACCELERATED_ENCRYPTION_NOT_ALLOWED => -1070530295

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_MATCHING_TPM_BINDINGS => -1070530294

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_TPMPV2_USED_FAILURE => -1070530293

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_NO_TPM_BINDINGS => -1070530292

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FW_UPDATE_PCRS_BLOCK => -1070530290

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FW_UPDATE_PCRS_NOT_EXCLUDED => -1070530289

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_DEVICE_NOT_JOINED => -2144272112

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AAD_SERVER_FAIL_RETRY_AFTER => -2144272111

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_AAD_SERVER_FAIL_BACKOFF => -2144272110

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_FAILED_TO_UNWRAP_HW_WRAPPED_KEY => -1070530285

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_HARDWARE_CRYPTO_ACCELERATOR_NOT_FIPS_COMPLIANT => -1070530284

    /**
     * @type {Integer (Int32)}
     */
    static FVE_E_HARDWARE_CRYPTO_KEY_MANAGER_NOT_FIPS_COMPLIANT => -1070530283

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_CALLOUT_NOT_FOUND => -2144206847

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_CONDITION_NOT_FOUND => -2144206846

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_FILTER_NOT_FOUND => -2144206845

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_LAYER_NOT_FOUND => -2144206844

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_PROVIDER_NOT_FOUND => -2144206843

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_PROVIDER_CONTEXT_NOT_FOUND => -2144206842

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_SUBLAYER_NOT_FOUND => -2144206841

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_NOT_FOUND => -2144206840

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_ALREADY_EXISTS => -2144206839

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_IN_USE => -2144206838

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_DYNAMIC_SESSION_IN_PROGRESS => -2144206837

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_WRONG_SESSION => -2144206836

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_NO_TXN_IN_PROGRESS => -2144206835

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_TXN_IN_PROGRESS => -2144206834

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_TXN_ABORTED => -2144206833

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_SESSION_ABORTED => -2144206832

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INCOMPATIBLE_TXN => -2144206831

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_TIMEOUT => -2144206830

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_NET_EVENTS_DISABLED => -2144206829

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INCOMPATIBLE_LAYER => -2144206828

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_KM_CLIENTS_ONLY => -2144206827

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_LIFETIME_MISMATCH => -2144206826

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_BUILTIN_OBJECT => -2144206825

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_TOO_MANY_CALLOUTS => -2144206824

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_NOTIFICATION_DROPPED => -2144206823

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_TRAFFIC_MISMATCH => -2144206822

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INCOMPATIBLE_SA_STATE => -2144206821

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_NULL_POINTER => -2144206820

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INVALID_ENUMERATOR => -2144206819

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INVALID_FLAGS => -2144206818

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INVALID_NET_MASK => -2144206817

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INVALID_RANGE => -2144206816

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INVALID_INTERVAL => -2144206815

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_ZERO_LENGTH_ARRAY => -2144206814

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_NULL_DISPLAY_NAME => -2144206813

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INVALID_ACTION_TYPE => -2144206812

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INVALID_WEIGHT => -2144206811

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_MATCH_TYPE_MISMATCH => -2144206810

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_TYPE_MISMATCH => -2144206809

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_OUT_OF_BOUNDS => -2144206808

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_RESERVED => -2144206807

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_DUPLICATE_CONDITION => -2144206806

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_DUPLICATE_KEYMOD => -2144206805

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_ACTION_INCOMPATIBLE_WITH_LAYER => -2144206804

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_ACTION_INCOMPATIBLE_WITH_SUBLAYER => -2144206803

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_CONTEXT_INCOMPATIBLE_WITH_LAYER => -2144206802

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_CONTEXT_INCOMPATIBLE_WITH_CALLOUT => -2144206801

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INCOMPATIBLE_AUTH_METHOD => -2144206800

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INCOMPATIBLE_DH_GROUP => -2144206799

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_EM_NOT_SUPPORTED => -2144206798

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_NEVER_MATCH => -2144206797

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_PROVIDER_CONTEXT_MISMATCH => -2144206796

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INVALID_PARAMETER => -2144206795

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_TOO_MANY_SUBLAYERS => -2144206794

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_CALLOUT_NOTIFICATION_FAILED => -2144206793

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INVALID_AUTH_TRANSFORM => -2144206792

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INVALID_CIPHER_TRANSFORM => -2144206791

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INCOMPATIBLE_CIPHER_TRANSFORM => -2144206790

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INVALID_TRANSFORM_COMBINATION => -2144206789

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_DUPLICATE_AUTH_METHOD => -2144206788

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INVALID_TUNNEL_ENDPOINT => -2144206787

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_L2_DRIVER_NOT_READY => -2144206786

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_KEY_DICTATOR_ALREADY_REGISTERED => -2144206785

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_KEY_DICTATION_INVALID_KEYING_MATERIAL => -2144206784

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_CONNECTIONS_DISABLED => -2144206783

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_INVALID_DNS_NAME => -2144206782

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_STILL_ON => -2144206781

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_IKEEXT_NOT_RUNNING => -2144206780

    /**
     * @type {Integer (Int32)}
     */
    static FWP_E_DROP_NOICMP => -2144206588

    /**
     * @type {Integer (Int32)}
     */
    static WS_S_ASYNC => 3997696

    /**
     * @type {Integer (Int32)}
     */
    static WS_S_END => 3997697

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_INVALID_FORMAT => -2143485952

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_OBJECT_FAULTED => -2143485951

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_NUMERIC_OVERFLOW => -2143485950

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_INVALID_OPERATION => -2143485949

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_OPERATION_ABORTED => -2143485948

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_ENDPOINT_ACCESS_DENIED => -2143485947

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_OPERATION_TIMED_OUT => -2143485946

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_OPERATION_ABANDONED => -2143485945

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_QUOTA_EXCEEDED => -2143485944

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_NO_TRANSLATION_AVAILABLE => -2143485943

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_SECURITY_VERIFICATION_FAILURE => -2143485942

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_ADDRESS_IN_USE => -2143485941

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_ADDRESS_NOT_AVAILABLE => -2143485940

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_ENDPOINT_NOT_FOUND => -2143485939

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_ENDPOINT_NOT_AVAILABLE => -2143485938

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_ENDPOINT_FAILURE => -2143485937

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_ENDPOINT_UNREACHABLE => -2143485936

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_ENDPOINT_ACTION_NOT_SUPPORTED => -2143485935

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_ENDPOINT_TOO_BUSY => -2143485934

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_ENDPOINT_FAULT_RECEIVED => -2143485933

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_ENDPOINT_DISCONNECTED => -2143485932

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_PROXY_FAILURE => -2143485931

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_PROXY_ACCESS_DENIED => -2143485930

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_NOT_SUPPORTED => -2143485929

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_PROXY_REQUIRES_BASIC_AUTH => -2143485928

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_PROXY_REQUIRES_DIGEST_AUTH => -2143485927

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_PROXY_REQUIRES_NTLM_AUTH => -2143485926

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_PROXY_REQUIRES_NEGOTIATE_AUTH => -2143485925

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_SERVER_REQUIRES_BASIC_AUTH => -2143485924

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_SERVER_REQUIRES_DIGEST_AUTH => -2143485923

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_SERVER_REQUIRES_NTLM_AUTH => -2143485922

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_SERVER_REQUIRES_NEGOTIATE_AUTH => -2143485921

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_INVALID_ENDPOINT_URL => -2143485920

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_OTHER => -2143485919

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_SECURITY_TOKEN_EXPIRED => -2143485918

    /**
     * @type {Integer (Int32)}
     */
    static WS_E_SECURITY_SYSTEM_FAILURE => -2143485917

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_TERMINATED_DURING_START => -2143878912

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_IMAGE_MISMATCH => -2143878911

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_HYPERV_NOT_INSTALLED => -2143878910

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_INVALID_STATE => -2143878907

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_UNEXPECTED_EXIT => -2143878906

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_TERMINATED => -2143878905

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_CONNECT_FAILED => -2143878904

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_CONNECTION_TIMEOUT => -2143878903

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_CONNECTION_CLOSED => -2143878902

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_UNKNOWN_MESSAGE => -2143878901

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_UNSUPPORTED_PROTOCOL_VERSION => -2143878900

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_INVALID_JSON => -2143878899

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_SYSTEM_NOT_FOUND => -2143878898

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_SYSTEM_ALREADY_EXISTS => -2143878897

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_SYSTEM_ALREADY_STOPPED => -2143878896

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_PROTOCOL_ERROR => -2143878895

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_INVALID_LAYER => -2143878894

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_WINDOWS_INSIDER_REQUIRED => -2143878893

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_SERVICE_NOT_AVAILABLE => -2143878892

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_OPERATION_NOT_STARTED => -2143878891

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_OPERATION_ALREADY_STARTED => -2143878890

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_OPERATION_PENDING => -2143878889

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_OPERATION_TIMEOUT => -2143878888

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_OPERATION_SYSTEM_CALLBACK_ALREADY_SET => -2143878887

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_OPERATION_RESULT_ALLOCATION_FAILED => -2143878886

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_ACCESS_DENIED => -2143878885

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_GUEST_CRITICAL_ERROR => -2143878884

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_PROCESS_INFO_NOT_AVAILABLE => -2143878883

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_SERVICE_DISCONNECT => -2143878882

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_PROCESS_ALREADY_STOPPED => -2143878881

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_SYSTEM_NOT_CONFIGURED_FOR_OPERATION => -2143878880

    /**
     * @type {Integer (Int32)}
     */
    static HCS_E_OPERATION_ALREADY_CANCELLED => -2143878879

    /**
     * @type {Integer (Int32)}
     */
    static WHV_E_UNKNOWN_CAPABILITY => -2143878400

    /**
     * @type {Integer (Int32)}
     */
    static WHV_E_INSUFFICIENT_BUFFER => -2143878399

    /**
     * @type {Integer (Int32)}
     */
    static WHV_E_UNKNOWN_PROPERTY => -2143878398

    /**
     * @type {Integer (Int32)}
     */
    static WHV_E_UNSUPPORTED_HYPERVISOR_CONFIG => -2143878397

    /**
     * @type {Integer (Int32)}
     */
    static WHV_E_INVALID_PARTITION_CONFIG => -2143878396

    /**
     * @type {Integer (Int32)}
     */
    static WHV_E_GPA_RANGE_NOT_FOUND => -2143878395

    /**
     * @type {Integer (Int32)}
     */
    static WHV_E_VP_ALREADY_EXISTS => -2143878394

    /**
     * @type {Integer (Int32)}
     */
    static WHV_E_VP_DOES_NOT_EXIST => -2143878393

    /**
     * @type {Integer (Int32)}
     */
    static WHV_E_INVALID_VP_STATE => -2143878392

    /**
     * @type {Integer (Int32)}
     */
    static WHV_E_INVALID_VP_REGISTER_NAME => -2143878391

    /**
     * @type {Integer (Int32)}
     */
    static WHV_E_UNSUPPORTED_PROCESSOR_CONFIG => -2143878384

    /**
     * @type {Integer (Int32)}
     */
    static VM_SAVED_STATE_DUMP_E_PARTITION_STATE_NOT_FOUND => -1070136064

    /**
     * @type {Integer (Int32)}
     */
    static VM_SAVED_STATE_DUMP_E_GUEST_MEMORY_NOT_FOUND => -1070136063

    /**
     * @type {Integer (Int32)}
     */
    static VM_SAVED_STATE_DUMP_E_NO_VP_FOUND_IN_PARTITION_STATE => -1070136062

    /**
     * @type {Integer (Int32)}
     */
    static VM_SAVED_STATE_DUMP_E_NESTED_VIRTUALIZATION_NOT_SUPPORTED => -1070136061

    /**
     * @type {Integer (Int32)}
     */
    static VM_SAVED_STATE_DUMP_E_WINDOWS_KERNEL_IMAGE_NOT_FOUND => -1070136060

    /**
     * @type {Integer (Int32)}
     */
    static VM_SAVED_STATE_DUMP_E_VA_NOT_MAPPED => -1070136059

    /**
     * @type {Integer (Int32)}
     */
    static VM_SAVED_STATE_DUMP_E_INVALID_VP_STATE => -1070136058

    /**
     * @type {Integer (Int32)}
     */
    static VM_SAVED_STATE_DUMP_E_VP_VTL_NOT_ENABLED => -1070136055

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_DM_OPERATION_LIMIT_EXCEEDED => -1070135808

    /**
     * @type {Integer (Int32)}
     */
    static VM_E_CLIENT_NAME_REQUIRED => -1070135552

    /**
     * @type {Integer (Int32)}
     */
    static VM_E_MODIFY_VTL2_SETTINGS_CONFLICT => -1070135551

    /**
     * @type {Integer (Int32)}
     */
    static VM_E_VTL2_NOT_AVAILABLE => -1070135550

    /**
     * @type {Integer (Int32)}
     */
    static VM_E_MANAGEMENT_VTL_RELOAD_IN_PROGRESS => -1070135296

    /**
     * @type {Integer (Int32)}
     */
    static VM_E_MANAGEMENT_VTL_RELOAD_INVALID_PROTOCOL_RESPONSE => -1070135295

    /**
     * @type {Integer (Int32)}
     */
    static VM_E_MANAGEMENT_VTL_RELOAD_SAVE_FAILURE => -1070135294

    /**
     * @type {Integer (Int32)}
     */
    static VM_E_MANAGEMENT_VTL_RELOAD_RESTORE_FAILURE => -1070135293

    /**
     * @type {Integer (Int32)}
     */
    static VM_E_MANAGEMENT_VTL_RELOAD_NO_SAVED_STATE => -1070135292

    /**
     * @type {Integer (Int32)}
     */
    static VM_E_MANAGEMENT_VTL_RELOAD_INVALID_SAVE_NOTIFICATION_RECEIVED => -1070135291

    /**
     * @type {Integer (Int32)}
     */
    static VM_E_MANAGEMENT_VTL_RELOAD_INVALID_RESTORE_REQUEST_RECEIVED => -1070135290

    /**
     * @type {Integer (Int32)}
     */
    static VM_E_MANAGEMENT_VTL_RELOAD_INVALID_RESTORE_NOTIFICATION_RECEIVED => -1070135289

    /**
     * @type {Integer (Int32)}
     */
    static VM_E_MANAGEMENT_VTL_RELOAD_NO_IGVM_FILE => -1070135288

    /**
     * @type {Integer (Int32)}
     */
    static VM_E_MANAGEMENT_VTL_RELOAD_UNSUPPORTED => -1070135287

    /**
     * @type {Integer (Int32)}
     */
    static VM_E_MANAGEMENT_VTL_PROTOCOL_ESTABLISHMENT_TIMEOUT => -1070135286

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_NETWORK_NOT_FOUND => -2143617023

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_ENDPOINT_NOT_FOUND => -2143617022

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_LAYER_NOT_FOUND => -2143617021

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_SWITCH_NOT_FOUND => -2143617020

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_SUBNET_NOT_FOUND => -2143617019

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_ADAPTER_NOT_FOUND => -2143617018

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_PORT_NOT_FOUND => -2143617017

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_POLICY_NOT_FOUND => -2143617016

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_VFP_PORTSETTING_NOT_FOUND => -2143617015

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_INVALID_NETWORK => -2143617014

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_INVALID_NETWORK_TYPE => -2143617013

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_INVALID_ENDPOINT => -2143617012

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_INVALID_POLICY => -2143617011

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_INVALID_POLICY_TYPE => -2143617010

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_INVALID_REMOTE_ENDPOINT_OPERATION => -2143617009

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_NETWORK_ALREADY_EXISTS => -2143617008

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_LAYER_ALREADY_EXISTS => -2143617007

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_POLICY_ALREADY_EXISTS => -2143617006

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_PORT_ALREADY_EXISTS => -2143617005

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_ENDPOINT_ALREADY_ATTACHED => -2143617004

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_REQUEST_UNSUPPORTED => -2143617003

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_MAPPING_NOT_SUPPORTED => -2143617002

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_DEGRADED_OPERATION => -2143617001

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_SHARED_SWITCH_MODIFICATION => -2143617000

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_GUID_CONVERSION_FAILURE => -2143616999

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_REGKEY_FAILURE => -2143616998

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_INVALID_JSON => -2143616997

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_INVALID_JSON_REFERENCE => -2143616996

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_ENDPOINT_SHARING_DISABLED => -2143616995

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_INVALID_IP => -2143616994

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_SWITCH_EXTENSION_NOT_FOUND => -2143616993

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_MANAGER_STOPPED => -2143616992

    /**
     * @type {Integer (Int32)}
     */
    static GCN_E_MODULE_NOT_FOUND => -2143616991

    /**
     * @type {Integer (Int32)}
     */
    static GCN_E_NO_REQUEST_HANDLERS => -2143616990

    /**
     * @type {Integer (Int32)}
     */
    static GCN_E_REQUEST_UNSUPPORTED => -2143616989

    /**
     * @type {Integer (Int32)}
     */
    static GCN_E_RUNTIMEKEYS_FAILED => -2143616988

    /**
     * @type {Integer (Int32)}
     */
    static GCN_E_NETADAPTER_TIMEOUT => -2143616987

    /**
     * @type {Integer (Int32)}
     */
    static GCN_E_NETADAPTER_NOT_FOUND => -2143616986

    /**
     * @type {Integer (Int32)}
     */
    static GCN_E_NETCOMPARTMENT_NOT_FOUND => -2143616985

    /**
     * @type {Integer (Int32)}
     */
    static GCN_E_NETINTERFACE_NOT_FOUND => -2143616984

    /**
     * @type {Integer (Int32)}
     */
    static GCN_E_DEFAULTNAMESPACE_EXISTS => -2143616983

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_ICS_DISABLED => -2143616982

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_ENDPOINT_NAMESPACE_ALREADY_EXISTS => -2143616981

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_ENTITY_HAS_REFERENCES => -2143616980

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_INVALID_INTERNAL_PORT => -2143616979

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_NAMESPACE_ATTACH_FAILED => -2143616978

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_ADDR_INVALID_OR_RESERVED => -2143616977

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_INVALID_PREFIX => -2143616976

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_OBJECT_USED_AFTER_UNLOAD => -2143616975

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_INVALID_SUBNET => -2143616974

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_INVALID_IP_SUBNET => -2143616973

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_ENDPOINT_NOT_ATTACHED => -2143616972

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_ENDPOINT_NOT_LOCAL => -2143616971

    /**
     * @type {Integer (Int32)}
     */
    static HCN_INTERFACEPARAMETERS_ALREADY_APPLIED => -2143616970

    /**
     * @type {Integer (Int32)}
     */
    static HCN_E_VFP_NOT_ALLOWED => -2143616969

    /**
     * @type {Integer (Int32)}
     */
    static SDIAG_E_CANCELLED => -2143551232

    /**
     * @type {Integer (Int32)}
     */
    static SDIAG_E_SCRIPT => -2143551231

    /**
     * @type {Integer (Int32)}
     */
    static SDIAG_E_POWERSHELL => -2143551230

    /**
     * @type {Integer (Int32)}
     */
    static SDIAG_E_MANAGEDHOST => -2143551229

    /**
     * @type {Integer (Int32)}
     */
    static SDIAG_E_NOVERIFIER => -2143551228

    /**
     * @type {Integer (Int32)}
     */
    static SDIAG_S_CANNOTRUN => 3932421

    /**
     * @type {Integer (Int32)}
     */
    static SDIAG_E_DISABLED => -2143551226

    /**
     * @type {Integer (Int32)}
     */
    static SDIAG_E_TRUST => -2143551225

    /**
     * @type {Integer (Int32)}
     */
    static SDIAG_E_CANNOTRUN => -2143551224

    /**
     * @type {Integer (Int32)}
     */
    static SDIAG_E_VERSION => -2143551223

    /**
     * @type {Integer (Int32)}
     */
    static SDIAG_E_RESOURCE => -2143551222

    /**
     * @type {Integer (Int32)}
     */
    static SDIAG_E_ROOTCAUSE => -2143551221

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_CHANNEL_CLOSED => -2143420160

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_CHANNEL_REQUEST_NOT_COMPLETE => -2143420159

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_INVALID_APP => -2143420158

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_OUTSTANDING_CHANNEL_REQUEST => -2143420157

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_DUPLICATE_CHANNEL => -2143420156

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_PLATFORM_UNAVAILABLE => -2143420155

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_NOTIFICATION_POSTED => -2143420154

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_NOTIFICATION_HIDDEN => -2143420153

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_NOTIFICATION_NOT_POSTED => -2143420152

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_CLOUD_DISABLED => -2143420151

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_CLOUD_INCAPABLE => -2143420144

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_CLOUD_AUTH_UNAVAILABLE => -2143420134

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_CLOUD_SERVICE_UNAVAILABLE => -2143420133

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_FAILED_LOCK_SCREEN_UPDATE_INTIALIZATION => -2143420132

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_NOTIFICATION_DISABLED => -2143420143

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_NOTIFICATION_INCAPABLE => -2143420142

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_INTERNET_INCAPABLE => -2143420141

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_NOTIFICATION_TYPE_DISABLED => -2143420140

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_NOTIFICATION_SIZE => -2143420139

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_TAG_SIZE => -2143420138

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_ACCESS_DENIED => -2143420137

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_DUPLICATE_REGISTRATION => -2143420136

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_PUSH_NOTIFICATION_INCAPABLE => -2143420135

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_DEV_ID_SIZE => -2143420128

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_TAG_ALPHANUMERIC => -2143420118

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_INVALID_HTTP_STATUS_CODE => -2143420117

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_OUT_OF_SESSION => -2143419904

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_POWER_SAVE => -2143419903

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_IMAGE_NOT_FOUND_IN_CACHE => -2143419902

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_ALL_URL_NOT_COMPLETED => -2143419901

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_INVALID_CLOUD_IMAGE => -2143419900

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_NOTIFICATION_ID_MATCHED => -2143419899

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_CALLBACK_ALREADY_REGISTERED => -2143419898

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_TOAST_NOTIFICATION_DROPPED => -2143419897

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_STORAGE_LOCKED => -2143419896

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_GROUP_SIZE => -2143419895

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_GROUP_ALPHANUMERIC => -2143419894

    /**
     * @type {Integer (Int32)}
     */
    static WPN_E_CLOUD_DISABLED_FOR_APP => -2143419893

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_CONTEXT_NOT_ACTIVATED => -2141945343

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_BAD_SIM => -2141945342

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_DATA_CLASS_NOT_AVAILABLE => -2141945341

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_INVALID_ACCESS_STRING => -2141945340

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_MAX_ACTIVATED_CONTEXTS => -2141945339

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_PACKET_SVC_DETACHED => -2141945338

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_PROVIDER_NOT_VISIBLE => -2141945337

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_RADIO_POWER_OFF => -2141945336

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_SERVICE_NOT_ACTIVATED => -2141945335

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_SIM_NOT_INSERTED => -2141945334

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_VOICE_CALL_IN_PROGRESS => -2141945333

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_INVALID_CACHE => -2141945332

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_NOT_REGISTERED => -2141945331

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_PROVIDERS_NOT_FOUND => -2141945330

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_PIN_NOT_SUPPORTED => -2141945329

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_PIN_REQUIRED => -2141945328

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_PIN_DISABLED => -2141945327

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_FAILURE => -2141945326

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_INVALID_PROFILE => -2141945320

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_DEFAULT_PROFILE_EXIST => -2141945319

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_SMS_ENCODING_NOT_SUPPORTED => -2141945312

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_SMS_FILTER_NOT_SUPPORTED => -2141945311

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_SMS_INVALID_MEMORY_INDEX => -2141945310

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_SMS_LANG_NOT_SUPPORTED => -2141945309

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_SMS_MEMORY_FAILURE => -2141945308

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_SMS_NETWORK_TIMEOUT => -2141945307

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_SMS_UNKNOWN_SMSC_ADDRESS => -2141945306

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_SMS_FORMAT_NOT_SUPPORTED => -2141945305

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_SMS_OPERATION_NOT_ALLOWED => -2141945304

    /**
     * @type {Integer (Int32)}
     */
    static E_MBN_SMS_MEMORY_FULL => -2141945303

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_IPV6_NOT_INSTALLED => -2140995583

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_NOT_INITIALIZED => -2140995582

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CANNOT_START_SERVICE => -2140995581

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_NOT_LICENSED => -2140995580

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_GRAPH => -2140995568

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_DBNAME_CHANGED => -2140995567

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_DUPLICATE_GRAPH => -2140995566

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_GRAPH_NOT_READY => -2140995565

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_GRAPH_SHUTTING_DOWN => -2140995564

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_GRAPH_IN_USE => -2140995563

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_DATABASE => -2140995562

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_TOO_MANY_ATTRIBUTES => -2140995561

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CONNECTION_NOT_FOUND => -2140995325

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CONNECT_SELF => -2140995322

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_ALREADY_LISTENING => -2140995321

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_NODE_NOT_FOUND => -2140995320

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CONNECTION_FAILED => -2140995319

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CONNECTION_NOT_AUTHENTICATED => -2140995318

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CONNECTION_REFUSED => -2140995317

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CLASSIFIER_TOO_LONG => -2140995071

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_TOO_MANY_IDENTITIES => -2140995070

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_NO_KEY_ACCESS => -2140995069

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_GROUPS_EXIST => -2140995068

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_RECORD_NOT_FOUND => -2140994815

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_DATABASE_ACCESSDENIED => -2140994814

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_DBINITIALIZATION_FAILED => -2140994813

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_MAX_RECORD_SIZE_EXCEEDED => -2140994812

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_DATABASE_ALREADY_PRESENT => -2140994811

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_DATABASE_NOT_PRESENT => -2140994810

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_IDENTITY_NOT_FOUND => -2140994559

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_EVENT_HANDLE_NOT_FOUND => -2140994303

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_SEARCH => -2140994047

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_ATTRIBUTES => -2140994046

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVITATION_NOT_TRUSTED => -2140993791

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CHAIN_TOO_LONG => -2140993789

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_TIME_PERIOD => -2140993787

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CIRCULAR_CHAIN_DETECTED => -2140993786

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CERT_STORE_CORRUPTED => -2140993535

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_NO_CLOUD => -2140991487

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CLOUD_NAME_AMBIGUOUS => -2140991483

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_RECORD => -2140987376

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_NOT_AUTHORIZED => -2140987360

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_PASSWORD_DOES_NOT_MEET_POLICY => -2140987359

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_DEFERRED_VALIDATION => -2140987344

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_GROUP_PROPERTIES => -2140987328

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_PEER_NAME => -2140987312

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_CLASSIFIER => -2140987296

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_FRIENDLY_NAME => -2140987280

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_ROLE_PROPERTY => -2140987279

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_CLASSIFIER_PROPERTY => -2140987278

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_RECORD_EXPIRATION => -2140987264

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_CREDENTIAL_INFO => -2140987263

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_CREDENTIAL => -2140987262

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_RECORD_SIZE => -2140987261

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_UNSUPPORTED_VERSION => -2140987248

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_GROUP_NOT_READY => -2140987247

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_GROUP_IN_USE => -2140987246

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_GROUP => -2140987245

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_NO_MEMBERS_FOUND => -2140987244

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_NO_MEMBER_CONNECTIONS => -2140987243

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_UNABLE_TO_LISTEN => -2140987242

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_IDENTITY_DELETED => -2140987232

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_SERVICE_NOT_AVAILABLE => -2140987231

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CONTACT_NOT_FOUND => -2140971007

    /**
     * @type {Integer (Int32)}
     */
    static PEER_S_GRAPH_DATA_CREATED => 6488065

    /**
     * @type {Integer (Int32)}
     */
    static PEER_S_NO_EVENT_DATA => 6488066

    /**
     * @type {Integer (Int32)}
     */
    static PEER_S_ALREADY_CONNECTED => 6496256

    /**
     * @type {Integer (Int32)}
     */
    static PEER_S_SUBSCRIPTION_EXISTS => 6512640

    /**
     * @type {Integer (Int32)}
     */
    static PEER_S_NO_CONNECTIVITY => 6488069

    /**
     * @type {Integer (Int32)}
     */
    static PEER_S_ALREADY_A_MEMBER => 6488070

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CANNOT_CONVERT_PEER_NAME => -2140979199

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_PEER_HOST_NAME => -2140979198

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_NO_MORE => -2140979197

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_PNRP_DUPLICATE_PEER_NAME => -2140979195

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVITE_CANCELLED => -2140966912

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVITE_RESPONSE_NOT_AVAILABLE => -2140966911

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_NOT_SIGNED_IN => -2140966909

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_PRIVACY_DECLINED => -2140966908

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_TIMEOUT => -2140966907

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_ADDRESS => -2140966905

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_FW_EXCEPTION_DISABLED => -2140966904

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_FW_BLOCKED_BY_POLICY => -2140966903

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_FW_BLOCKED_BY_SHIELDS_UP => -2140966902

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_FW_DECLINED => -2140966901

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_CREATE_FAILED => -2144731135

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_SHUTDOWN_CALLED => -2144731134

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_ILLEGAL_REENTRANCY => -2144731133

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_OBJECT_SEALED => -2144731132

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_VALUE_NOT_SET => -2144731131

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_VALUE_NOT_DETERMINED => -2144731130

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_INVALID_OUTPUT => -2144731129

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_BOOLEAN_EXPECTED => -2144731128

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_DIFFERENT_OWNER => -2144731127

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_AMBIGUOUS_MATCH => -2144731126

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_FP_OVERFLOW => -2144731125

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_WRONG_THREAD => -2144731124

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_STORYBOARD_ACTIVE => -2144730879

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_STORYBOARD_NOT_PLAYING => -2144730878

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_START_KEYFRAME_AFTER_END => -2144730877

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_END_KEYFRAME_NOT_DETERMINED => -2144730876

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_LOOPS_OVERLAP => -2144730875

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_TRANSITION_ALREADY_USED => -2144730874

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_TRANSITION_NOT_IN_STORYBOARD => -2144730873

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_TRANSITION_ECLIPSED => -2144730872

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_TIME_BEFORE_LAST_UPDATE => -2144730871

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_TIMER_CLIENT_ALREADY_CONNECTED => -2144730870

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_INVALID_DIMENSION => -2144730869

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_PRIMITIVE_OUT_OF_BOUNDS => -2144730868

    /**
     * @type {Integer (Int32)}
     */
    static UI_E_WINDOW_CLOSED => -2144730623

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_INVALID_HANDLE => -2140864511

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_READ_NOT_PERMITTED => -2140864510

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_WRITE_NOT_PERMITTED => -2140864509

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_INVALID_PDU => -2140864508

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_INSUFFICIENT_AUTHENTICATION => -2140864507

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_REQUEST_NOT_SUPPORTED => -2140864506

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_INVALID_OFFSET => -2140864505

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_INSUFFICIENT_AUTHORIZATION => -2140864504

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_PREPARE_QUEUE_FULL => -2140864503

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_ATTRIBUTE_NOT_FOUND => -2140864502

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_ATTRIBUTE_NOT_LONG => -2140864501

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION_KEY_SIZE => -2140864500

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_INVALID_ATTRIBUTE_VALUE_LENGTH => -2140864499

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_UNLIKELY => -2140864498

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION => -2140864497

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_UNSUPPORTED_GROUP_TYPE => -2140864496

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_INSUFFICIENT_RESOURCES => -2140864495

    /**
     * @type {Integer (Int32)}
     */
    static E_BLUETOOTH_ATT_UNKNOWN_ERROR => -2140860416

    /**
     * @type {Integer (Int32)}
     */
    static E_AUDIO_ENGINE_NODE_NOT_FOUND => -2140798975

    /**
     * @type {Integer (Int32)}
     */
    static E_HDAUDIO_EMPTY_CONNECTION_LIST => -2140798974

    /**
     * @type {Integer (Int32)}
     */
    static E_HDAUDIO_CONNECTION_LIST_NOT_SUPPORTED => -2140798973

    /**
     * @type {Integer (Int32)}
     */
    static E_HDAUDIO_NO_LOGICAL_DEVICES_CREATED => -2140798972

    /**
     * @type {Integer (Int32)}
     */
    static E_HDAUDIO_NULL_LINKED_LIST_ENTRY => -2140798971

    /**
     * @type {Integer (Int32)}
     */
    static E_SOUNDWIRE_COMMAND_ABORTED => -2140798970

    /**
     * @type {Integer (Int32)}
     */
    static E_SOUNDWIRE_COMMAND_IGNORED => -2140798969

    /**
     * @type {Integer (Int32)}
     */
    static E_SOUNDWIRE_COMMAND_FAILED => -2140798968

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_CONCURRENCY_LOCKING_FAILURE => -2140733439

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_STATEMENT_INPROGRESS => -2140733438

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_CONFIGURATION_INVALID => -2140733437

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_UNKNOWN_SCHEMA_VERSION => -2140733436

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_ERROR_DICTIONARY_CORRUPTED => -2140733435

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_BLOCKED => -2140733434

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_BUSY_RETRY => -2140733433

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_BUSY_RECOVERY_RETRY => -2140733432

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_LOCKED_RETRY => -2140733431

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_LOCKED_SHAREDCACHE_RETRY => -2140733430

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_TRANSACTION_REQUIRED => -2140733429

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_BUSY_TIMEOUT_EXCEEDED => -2140733428

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_BUSY_RECOVERY_TIMEOUT_EXCEEDED => -2140733427

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_LOCKED_TIMEOUT_EXCEEDED => -2140733426

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_LOCKED_SHAREDCACHE_TIMEOUT_EXCEEDED => -2140733425

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_SERVICE_STOP_IN_PROGRESS => -2140733424

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSTORY_E_NESTED_TRANSACTION_NOT_SUPPORTED => -2140733423

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_ERROR_CACHE_CORRUPTED => -2140733422

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_TRANSACTION_CALLER_ID_CHANGED => 6750227

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_TRANSACTION_IN_PROGRESS => -2140733420

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_CACHE_NOT_INIITALIZED => -2140733419

    /**
     * @type {Integer (Int32)}
     */
    static STATEREPOSITORY_E_DEPENDENCY_NOT_RESOLVED => -2140733418

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_POOL_WAS_DELETED => 15138817

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_FAULT_DOMAIN_TYPE_INVALID => -2132344831

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_INTERNAL_ERROR => -2132344830

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_RESILIENCY_TYPE_INVALID => -2132344829

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_DRIVE_SECTOR_SIZE_INVALID => -2132344828

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_DRIVE_REDUNDANCY_INVALID => -2132344826

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_NUMBER_OF_DATA_COPIES_INVALID => -2132344825

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_PARITY_LAYOUT_INVALID => -2132344824

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_INTERLEAVE_LENGTH_INVALID => -2132344823

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_NUMBER_OF_COLUMNS_INVALID => -2132344822

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_NOT_ENOUGH_DRIVES => -2132344821

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_EXTENDED_ERROR => -2132344820

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_PROVISIONING_TYPE_INVALID => -2132344819

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_ALLOCATION_SIZE_INVALID => -2132344818

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_ENCLOSURE_AWARE_INVALID => -2132344817

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_WRITE_CACHE_SIZE_INVALID => -2132344816

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_NUMBER_OF_GROUPS_INVALID => -2132344815

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_DRIVE_OPERATIONAL_STATE_INVALID => -2132344814

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_ENTRY_INCOMPLETE => -2132344813

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_ENTRY_INVALID => -2132344812

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_UPDATE_COLUMN_STATE => -2132344811

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_MAP_REQUIRED => -2132344810

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_UNSUPPORTED_VERSION => -2132344809

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_CORRUPT_METADATA => -2132344808

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_DRT_FULL => -2132344807

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_INCONSISTENCY => -2132344806

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_LOG_NOT_READY => -2132344805

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_NO_REDUNDANCY => -2132344804

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_DRIVE_NOT_READY => -2132344803

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_DRIVE_SPLIT => -2132344802

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_DRIVE_LOST_DATA => -2132344801

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_MARK_DIRTY => -2132344800

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_FLUSH_METADATA => -2132344795

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_CACHE_FULL => -2132344794

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SPACES_REPAIR_IN_PROGRESS => -2132344793

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_VOLSNAP_BOOTFILE_NOT_VALID => -2138963967

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_VOLSNAP_ACTIVATION_TIMEOUT => -2138963966

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_VOLSNAP_NO_BYPASSIO_WITH_SNAPSHOT => -2138963965

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_TIERING_NOT_SUPPORTED_ON_VOLUME => -2138898431

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_TIERING_VOLUME_DISMOUNT_IN_PROGRESS => -2138898430

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_TIERING_STORAGE_TIER_NOT_FOUND => -2138898429

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_TIERING_INVALID_FILE_ID => -2138898428

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_TIERING_WRONG_CLUSTER_NODE => -2138898427

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_TIERING_ALREADY_PROCESSING => -2138898426

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_TIERING_CANNOT_PIN_OBJECT => -2138898425

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_TIERING_FILE_IS_NOT_PINNED => -2138898424

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_NOT_A_TIERED_VOLUME => -2138898423

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_ATTRIBUTE_NOT_PRESENT => -2138898422

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SECCORE_INVALID_COMMAND => -1058537472

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_NO_APPLICABLE_APP_LICENSES_FOUND => -1058406399

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_CLIP_LICENSE_NOT_FOUND => -1058406398

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_CLIP_DEVICE_LICENSE_MISSING => -1058406397

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_CLIP_LICENSE_INVALID_SIGNATURE => -1058406396

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_CLIP_KEYHOLDER_LICENSE_MISSING_OR_INVALID => -1058406395

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_CLIP_LICENSE_EXPIRED => -1058406394

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_CLIP_LICENSE_SIGNED_BY_UNKNOWN_SOURCE => -1058406393

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_CLIP_LICENSE_NOT_SIGNED => -1058406392

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_CLIP_LICENSE_HARDWARE_ID_OUT_OF_TOLERANCE => -1058406391

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_CLIP_LICENSE_DEVICE_ID_MISMATCH => -1058406390

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_STATUS_OCCLUDED => 142213121

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_STATUS_CLIPPED => 142213122

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_STATUS_NO_REDIRECTION => 142213124

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_STATUS_NO_DESKTOP_ACCESS => 142213125

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_STATUS_GRAPHICS_VIDPN_SOURCE_IN_USE => 142213126

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_STATUS_MODE_CHANGED => 142213127

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_STATUS_MODE_CHANGE_IN_PROGRESS => 142213128

    /**
     * @type {Integer (Int32)}
     */
    static DXCORE_ERROR_EVENT_NOT_UNREGISTERED => -2004877311

    /**
     * @type {Integer (Int32)}
     */
    static PRESENTATION_ERROR_LOST => -2004811775

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_STATUS_UNOCCLUDED => 142213129

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_STATUS_DDA_WAS_STILL_DRAWING => 142213130

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_STATUS_PRESENT_REQUIRED => 142213167

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_DDI_ERR_WASSTILLDRAWING => -2005204991

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_DDI_ERR_UNSUPPORTED => -2005204990

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_DDI_ERR_NONEXCLUSIVE => -2005204989

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_ERROR_TOO_MANY_UNIQUE_STATE_OBJECTS => -2005336063

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_ERROR_FILE_NOT_FOUND => -2005336062

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_ERROR_TOO_MANY_UNIQUE_STATE_OBJECTS => -2005139455

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_ERROR_FILE_NOT_FOUND => -2005139454

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_ERROR_TOO_MANY_UNIQUE_VIEW_OBJECTS => -2005139453

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_ERROR_DEFERRED_CONTEXT_MAP_WITHOUT_INITIAL_DISCARD => -2005139452

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_ERROR_ADAPTER_NOT_FOUND => -2005008383

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_ERROR_DRIVER_VERSION_MISMATCH => -2005008382

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_ERROR_INVALID_REDIST => -2005008381

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_WRONG_STATE => -2003238911

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_NOT_INITIALIZED => -2003238910

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_UNSUPPORTED_OPERATION => -2003238909

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_SCANNER_FAILED => -2003238908

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_SCREEN_ACCESS_DENIED => -2003238907

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_DISPLAY_STATE_INVALID => -2003238906

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_ZERO_VECTOR => -2003238905

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_INTERNAL_ERROR => -2003238904

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_DISPLAY_FORMAT_NOT_SUPPORTED => -2003238903

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_INVALID_CALL => -2003238902

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_NO_HARDWARE_DEVICE => -2003238901

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_RECREATE_TARGET => -2003238900

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_TOO_MANY_SHADER_ELEMENTS => -2003238899

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_SHADER_COMPILE_FAILED => -2003238898

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_MAX_TEXTURE_SIZE_EXCEEDED => -2003238897

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_UNSUPPORTED_VERSION => -2003238896

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_BAD_NUMBER => -2003238895

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_WRONG_FACTORY => -2003238894

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_LAYER_ALREADY_IN_USE => -2003238893

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_POP_CALL_DID_NOT_MATCH_PUSH => -2003238892

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_WRONG_RESOURCE_DOMAIN => -2003238891

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_PUSH_POP_UNBALANCED => -2003238890

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_RENDER_TARGET_HAS_LAYER_OR_CLIPRECT => -2003238889

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_INCOMPATIBLE_BRUSH_TYPES => -2003238888

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_WIN32_ERROR => -2003238887

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_TARGET_NOT_GDI_COMPATIBLE => -2003238886

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_TEXT_EFFECT_IS_WRONG_TYPE => -2003238885

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_TEXT_RENDERER_NOT_RELEASED => -2003238884

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_EXCEEDS_MAX_BITMAP_SIZE => -2003238883

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_INVALID_GRAPH_CONFIGURATION => -2003238882

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_INVALID_INTERNAL_GRAPH_CONFIGURATION => -2003238881

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_CYCLIC_GRAPH => -2003238880

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_BITMAP_CANNOT_DRAW => -2003238879

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_OUTSTANDING_BITMAP_REFERENCES => -2003238878

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_ORIGINAL_TARGET_NOT_BOUND => -2003238877

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_INVALID_TARGET => -2003238876

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_BITMAP_BOUND_AS_TARGET => -2003238875

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_INSUFFICIENT_DEVICE_CAPABILITIES => -2003238874

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_INTERMEDIATE_TOO_LARGE => -2003238873

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_EFFECT_IS_NOT_REGISTERED => -2003238872

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_INVALID_PROPERTY => -2003238871

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_NO_SUBPROPERTIES => -2003238870

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_PRINT_JOB_CLOSED => -2003238869

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_PRINT_FORMAT_NOT_SUPPORTED => -2003238868

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_TOO_MANY_TRANSFORM_INPUTS => -2003238867

    /**
     * @type {Integer (Int32)}
     */
    static D2DERR_INVALID_GLYPH_IMAGE => -2003238866

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_FILEFORMAT => -2003283968

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_UNEXPECTED => -2003283967

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_NOFONT => -2003283966

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_FILENOTFOUND => -2003283965

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_FILEACCESS => -2003283964

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_FONTCOLLECTIONOBSOLETE => -2003283963

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_ALREADYREGISTERED => -2003283962

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_CACHEFORMAT => -2003283961

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_CACHEVERSION => -2003283960

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_UNSUPPORTEDOPERATION => -2003283959

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_TEXTRENDERERINCOMPATIBLE => -2003283958

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_FLOWDIRECTIONCONFLICTS => -2003283957

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_NOCOLOR => -2003283956

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_WRONGSTATE => -2003292412

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_VALUEOUTOFRANGE => -2003292411

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_UNKNOWNIMAGEFORMAT => -2003292409

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_UNSUPPORTEDVERSION => -2003292405

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_NOTINITIALIZED => -2003292404

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_ALREADYLOCKED => -2003292403

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_PROPERTYNOTFOUND => -2003292352

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_PROPERTYNOTSUPPORTED => -2003292351

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_PROPERTYSIZE => -2003292350

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_CODECPRESENT => -2003292349

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_CODECNOTHUMBNAIL => -2003292348

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_PALETTEUNAVAILABLE => -2003292347

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_CODECTOOMANYSCANLINES => -2003292346

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_INTERNALERROR => -2003292344

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_SOURCERECTDOESNOTMATCHDIMENSIONS => -2003292343

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_COMPONENTNOTFOUND => -2003292336

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_IMAGESIZEOUTOFRANGE => -2003292335

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_TOOMUCHMETADATA => -2003292334

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_BADIMAGE => -2003292320

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_BADHEADER => -2003292319

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_FRAMEMISSING => -2003292318

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_BADMETADATAHEADER => -2003292317

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_BADSTREAMDATA => -2003292304

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_STREAMWRITE => -2003292303

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_STREAMREAD => -2003292302

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_STREAMNOTAVAILABLE => -2003292301

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_UNSUPPORTEDPIXELFORMAT => -2003292288

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_UNSUPPORTEDOPERATION => -2003292287

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_INVALIDREGISTRATION => -2003292278

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_COMPONENTINITIALIZEFAILURE => -2003292277

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_INSUFFICIENTBUFFER => -2003292276

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_DUPLICATEMETADATAPRESENT => -2003292275

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_PROPERTYUNEXPECTEDTYPE => -2003292274

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_UNEXPECTEDSIZE => -2003292273

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_INVALIDQUERYREQUEST => -2003292272

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_UNEXPECTEDMETADATATYPE => -2003292271

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_REQUESTONLYVALIDATMETADATAROOT => -2003292270

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_INVALIDQUERYCHARACTER => -2003292269

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_WIN32ERROR => -2003292268

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_INVALIDPROGRESSIVELEVEL => -2003292267

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_INVALIDJPEGSCANINDEX => -2003292266

    /**
     * @type {Integer (Int32)}
     */
    static WINCODEC_ERR_UNSUPPORTEDTONEMAPPING => -2003292265

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_OBJECTBUSY => -2003304447

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_INSUFFICIENTBUFFER => -2003304446

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_WIN32ERROR => -2003304445

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_SCANNER_FAILED => -2003304444

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_SCREENACCESSDENIED => -2003304443

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_DISPLAYSTATEINVALID => -2003304442

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_NONINVERTIBLEMATRIX => -2003304441

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_ZEROVECTOR => -2003304440

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_TERMINATED => -2003304439

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_BADNUMBER => -2003304438

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_INTERNALERROR => -2003304320

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_DISPLAYFORMATNOTSUPPORTED => -2003304316

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_INVALIDCALL => -2003304315

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_ALREADYLOCKED => -2003304314

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_NOTLOCKED => -2003304313

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_DEVICECANNOTRENDERTEXT => -2003304312

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_GLYPHBITMAPMISSED => -2003304311

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_MALFORMEDGLYPHCACHE => -2003304310

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_GENERIC_IGNORE => -2003304309

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_MALFORMED_GUIDELINE_DATA => -2003304308

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_NO_HARDWARE_DEVICE => -2003304307

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_NEED_RECREATE_AND_PRESENT => -2003304306

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_ALREADY_INITIALIZED => -2003304305

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_MISMATCHED_SIZE => -2003304304

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_NO_REDIRECTION_SURFACE_AVAILABLE => -2003304303

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_REMOTING_NOT_SUPPORTED => -2003304302

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_QUEUED_PRESENT_NOT_SUPPORTED => -2003304301

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_NOT_QUEUING_PRESENTS => -2003304300

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_NO_REDIRECTION_SURFACE_RETRY_LATER => -2003304299

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_TOOMANYSHADERELEMNTS => -2003304298

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_MROW_READLOCK_FAILED => -2003304297

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_MROW_UPDATE_FAILED => -2003304296

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_SHADER_COMPILE_FAILED => -2003304295

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_MAX_TEXTURE_SIZE_EXCEEDED => -2003304294

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_QPC_TIME_WENT_BACKWARD => -2003304293

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_DXGI_ENUMERATION_OUT_OF_SYNC => -2003304291

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_ADAPTER_NOT_FOUND => -2003304290

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_COLORSPACE_NOT_SUPPORTED => -2003304289

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_PREFILTER_NOT_SUPPORTED => -2003304288

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_DISPLAYID_ACCESS_DENIED => -2003304287

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_DEVICE_CREATION_FAILURE => -2003304272

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_INTEL_DEVICE_CREATION_FAILURE => -2003304271

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_AMD_DEVICE_CREATION_FAILURE => -2003304270

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_NVIDIA_DEVICE_CREATION_FAILURE => -2003304269

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_QC_DEVICE_CREATION_FAILURE => -2003304268

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_SWAPCHAIN_CREATION_FAILURE => -2003304256

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_INTEL_SWAPCHAIN_CREATION_FAILURE => -2003304255

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_AMD_SWAPCHAIN_CREATION_FAILURE => -2003304254

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_NVIDIA_SWAPCHAIN_CREATION_FAILURE => -2003304253

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_QC_SWAPCHAIN_CREATION_FAILURE => -2003304252

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_IDD_SWAPCHAIN_CREATION_FAILURE => -2003304251

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_PRESENT_FAILURE => -2003304240

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_INTEL_PRESENT_FAILURE => -2003304239

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_AMD_PRESENT_FAILURE => -2003304238

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_NVIDIA_PRESENT_FAILURE => -2003304237

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_QC_PRESENT_FAILURE => -2003304236

    /**
     * @type {Integer (Int32)}
     */
    static MILERR_IDD_PRESENT_FAILURE => -2003304235

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_INVALIDPACKETHEADER => -2003303424

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_UNKNOWNPACKET => -2003303423

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_ILLEGALPACKET => -2003303422

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_MALFORMEDPACKET => -2003303421

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_ILLEGALHANDLE => -2003303420

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_HANDLELOOKUPFAILED => -2003303419

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_RENDERTHREADFAILURE => -2003303418

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_CTXSTACKFRSTTARGETNULL => -2003303417

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_CONNECTIONIDLOOKUPFAILED => -2003303416

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_BLOCKSFULL => -2003303415

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_MEMORYFAILURE => -2003303414

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_PACKETRECORDOUTOFRANGE => -2003303413

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_ILLEGALRECORDTYPE => -2003303412

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_OUTOFHANDLES => -2003303411

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_UNCHANGABLE_UPDATE_ATTEMPTED => -2003303410

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_NO_MULTIPLE_WORKER_THREADS => -2003303409

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_REMOTINGNOTSUPPORTED => -2003303408

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_MISSINGENDCOMMAND => -2003303407

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_MISSINGBEGINCOMMAND => -2003303406

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_CHANNELSYNCTIMEDOUT => -2003303405

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_CHANNELSYNCABANDONED => -2003303404

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_UNSUPPORTEDTRANSPORTVERSION => -2003303403

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_TRANSPORTUNAVAILABLE => -2003303402

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_FEEDBACK_UNSUPPORTED => -2003303401

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_COMMANDTRANSPORTDENIED => -2003303400

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_GRAPHICSSTREAMUNAVAILABLE => -2003303399

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_GRAPHICSSTREAMALREADYOPEN => -2003303392

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_TRANSPORTDISCONNECTED => -2003303391

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_TRANSPORTOVERLOADED => -2003303390

    /**
     * @type {Integer (Int32)}
     */
    static UCEERR_PARTITION_ZOMBIED => -2003303389

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_NOCLOCK => -2003303168

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_NOMEDIATYPE => -2003303167

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_NOVIDEOMIXER => -2003303166

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_NOVIDEOPRESENTER => -2003303165

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_NOREADYFRAMES => -2003303164

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_MODULENOTLOADED => -2003303163

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_WMPFACTORYNOTREGISTERED => -2003303162

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_INVALIDWMPVERSION => -2003303161

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_INSUFFICIENTVIDEORESOURCES => -2003303160

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_VIDEOACCELERATIONNOTAVAILABLE => -2003303159

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_REQUESTEDTEXTURETOOBIG => -2003303158

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_SEEKFAILED => -2003303157

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_UNEXPECTEDWMPFAILURE => -2003303156

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_MEDIAPLAYERCLOSED => -2003303155

    /**
     * @type {Integer (Int32)}
     */
    static MILAVERR_UNKNOWNHARDWAREERROR => -2003303154

    /**
     * @type {Integer (Int32)}
     */
    static MILEFFECTSERR_UNKNOWNPROPERTY => -2003302898

    /**
     * @type {Integer (Int32)}
     */
    static MILEFFECTSERR_EFFECTNOTPARTOFGROUP => -2003302897

    /**
     * @type {Integer (Int32)}
     */
    static MILEFFECTSERR_NOINPUTSOURCEATTACHED => -2003302896

    /**
     * @type {Integer (Int32)}
     */
    static MILEFFECTSERR_CONNECTORNOTCONNECTED => -2003302895

    /**
     * @type {Integer (Int32)}
     */
    static MILEFFECTSERR_CONNECTORNOTASSOCIATEDWITHEFFECT => -2003302894

    /**
     * @type {Integer (Int32)}
     */
    static MILEFFECTSERR_RESERVED => -2003302893

    /**
     * @type {Integer (Int32)}
     */
    static MILEFFECTSERR_CYCLEDETECTED => -2003302892

    /**
     * @type {Integer (Int32)}
     */
    static MILEFFECTSERR_EFFECTINMORETHANONEGRAPH => -2003302891

    /**
     * @type {Integer (Int32)}
     */
    static MILEFFECTSERR_EFFECTALREADYINAGRAPH => -2003302890

    /**
     * @type {Integer (Int32)}
     */
    static MILEFFECTSERR_EFFECTHASNOCHILDREN => -2003302889

    /**
     * @type {Integer (Int32)}
     */
    static MILEFFECTSERR_ALREADYATTACHEDTOLISTENER => -2003302888

    /**
     * @type {Integer (Int32)}
     */
    static MILEFFECTSERR_NOTAFFINETRANSFORM => -2003302887

    /**
     * @type {Integer (Int32)}
     */
    static MILEFFECTSERR_EMPTYBOUNDS => -2003302886

    /**
     * @type {Integer (Int32)}
     */
    static MILEFFECTSERR_OUTPUTSIZETOOLARGE => -2003302885

    /**
     * @type {Integer (Int32)}
     */
    static DWMERR_STATE_TRANSITION_FAILED => -2003302656

    /**
     * @type {Integer (Int32)}
     */
    static DWMERR_THEME_FAILED => -2003302655

    /**
     * @type {Integer (Int32)}
     */
    static DWMERR_CATASTROPHIC_FAILURE => -2003302654

    /**
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_ERROR_WINDOW_ALREADY_COMPOSED => -2003302400

    /**
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_ERROR_SURFACE_BEING_RENDERED => -2003302399

    /**
     * @type {Integer (Int32)}
     */
    static DCOMPOSITION_ERROR_SURFACE_NOT_BEING_RENDERED => -2003302398

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_INVALID_AUTHENTICATION_TARGET => -2138701823

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_ACCESS_DENIED_BY_TOU => -2138701822

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_INVALID_APPLICATION => -2138701821

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_PASSWORD_UPDATE_REQUIRED => -2138701820

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_ACCOUNT_UPDATE_REQUIRED => -2138701819

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_FORCESIGNIN => -2138701818

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_ACCOUNT_LOCKED => -2138701817

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_PARENTAL_CONSENT_REQUIRED => -2138701816

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_EMAIL_VERIFICATION_REQUIRED => -2138701815

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_ACCOUNT_SUSPENDED_COMPROIMISE => -2138701814

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_ACCOUNT_SUSPENDED_ABUSE => -2138701813

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_ACTION_REQUIRED => -2138701812

    /**
     * @type {Integer (Int32)}
     */
    static ONL_CONNECTION_COUNT_LIMIT => -2138701811

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_CONNECTED_ACCOUNT_CAN_NOT_SIGNOUT => -2138701810

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_USER_AUTHENTICATION_REQUIRED => -2138701809

    /**
     * @type {Integer (Int32)}
     */
    static ONL_E_REQUEST_THROTTLED => -2138701808

    /**
     * @type {Integer (Int32)}
     */
    static FA_E_MAX_PERSISTED_ITEMS_REACHED => -2144927200

    /**
     * @type {Integer (Int32)}
     */
    static FA_E_HOMEGROUP_NOT_AVAILABLE => -2144927198

    /**
     * @type {Integer (Int32)}
     */
    static E_MONITOR_RESOLUTION_TOO_LOW => -2144927152

    /**
     * @type {Integer (Int32)}
     */
    static E_ELEVATED_ACTIVATION_NOT_SUPPORTED => -2144927151

    /**
     * @type {Integer (Int32)}
     */
    static E_UAC_DISABLED => -2144927150

    /**
     * @type {Integer (Int32)}
     */
    static E_FULL_ADMIN_NOT_SUPPORTED => -2144927149

    /**
     * @type {Integer (Int32)}
     */
    static E_APPLICATION_NOT_REGISTERED => -2144927148

    /**
     * @type {Integer (Int32)}
     */
    static E_MULTIPLE_EXTENSIONS_FOR_APPLICATION => -2144927147

    /**
     * @type {Integer (Int32)}
     */
    static E_MULTIPLE_PACKAGES_FOR_FAMILY => -2144927146

    /**
     * @type {Integer (Int32)}
     */
    static E_APPLICATION_MANAGER_NOT_RUNNING => -2144927145

    /**
     * @type {Integer (Int32)}
     */
    static S_STORE_LAUNCHED_FOR_REMEDIATION => 2556504

    /**
     * @type {Integer (Int32)}
     */
    static S_APPLICATION_ACTIVATION_ERROR_HANDLED_BY_DIALOG => 2556505

    /**
     * @type {Integer (Int32)}
     */
    static E_APPLICATION_ACTIVATION_TIMED_OUT => -2144927142

    /**
     * @type {Integer (Int32)}
     */
    static E_APPLICATION_ACTIVATION_EXEC_FAILURE => -2144927141

    /**
     * @type {Integer (Int32)}
     */
    static E_APPLICATION_TEMPORARY_LICENSE_ERROR => -2144927140

    /**
     * @type {Integer (Int32)}
     */
    static E_APPLICATION_TRIAL_LICENSE_EXPIRED => -2144927139

    /**
     * @type {Integer (Int32)}
     */
    static E_SKYDRIVE_ROOT_TARGET_FILE_SYSTEM_NOT_SUPPORTED => -2144927136

    /**
     * @type {Integer (Int32)}
     */
    static E_SKYDRIVE_ROOT_TARGET_OVERLAP => -2144927135

    /**
     * @type {Integer (Int32)}
     */
    static E_SKYDRIVE_ROOT_TARGET_CANNOT_INDEX => -2144927134

    /**
     * @type {Integer (Int32)}
     */
    static E_SKYDRIVE_FILE_NOT_UPLOADED => -2144927133

    /**
     * @type {Integer (Int32)}
     */
    static E_SKYDRIVE_UPDATE_AVAILABILITY_FAIL => -2144927132

    /**
     * @type {Integer (Int32)}
     */
    static E_SKYDRIVE_ROOT_TARGET_VOLUME_ROOT_NOT_SUPPORTED => -2144927131

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_FILE_SIZE_OVER_LIMIT => -2013089791

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_FILE_SIZE_EXCEEDS_REMAINING_QUOTA => -2013089790

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_UNSUPPORTED_FILE_NAME => -2013089789

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_FOLDER_ITEM_COUNT_LIMIT_EXCEEDED => -2013089788

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_FILE_SYNC_PARTNER_ERROR => -2013089787

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_SYNC_PAUSED_BY_SERVICE => -2013089786

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_FILE_IDENTIFIER_UNKNOWN => -2013085694

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_SERVICE_AUTHENTICATION_FAILED => -2013085693

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_UNKNOWN_SERVICE_ERROR => -2013085692

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_SERVICE_RETURNED_UNEXPECTED_SIZE => -2013085691

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_REQUEST_BLOCKED_BY_SERVICE => -2013085690

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_REQUEST_BLOCKED_DUE_TO_CLIENT_ERROR => -2013085689

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_FOLDER_INACCESSIBLE => -2013081599

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_UNSUPPORTED_FOLDER_NAME => -2013081598

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_UNSUPPORTED_MARKET => -2013081597

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_PATH_LENGTH_LIMIT_EXCEEDED => -2013081596

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_REMOTE_PATH_LENGTH_LIMIT_EXCEEDED => -2013081595

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_CLIENT_UPDATE_NEEDED => -2013081594

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_PROXY_AUTHENTICATION_REQUIRED => -2013081593

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_STORAGE_SERVICE_PROVISIONING_FAILED => -2013081592

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_UNSUPPORTED_REPARSE_POINT => -2013081591

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_STORAGE_SERVICE_BLOCKED => -2013081590

    /**
     * @type {Integer (Int32)}
     */
    static E_SYNCENGINE_FOLDER_IN_REDIRECTION => -2013081589

    /**
     * @type {Integer (Int32)}
     */
    static EAS_E_POLICY_NOT_MANAGED_BY_OS => -2141913087

    /**
     * @type {Integer (Int32)}
     */
    static EAS_E_POLICY_COMPLIANT_WITH_ACTIONS => -2141913086

    /**
     * @type {Integer (Int32)}
     */
    static EAS_E_REQUESTED_POLICY_NOT_ENFORCEABLE => -2141913085

    /**
     * @type {Integer (Int32)}
     */
    static EAS_E_CURRENT_USER_HAS_BLANK_PASSWORD => -2141913084

    /**
     * @type {Integer (Int32)}
     */
    static EAS_E_REQUESTED_POLICY_PASSWORD_EXPIRATION_INCOMPATIBLE => -2141913083

    /**
     * @type {Integer (Int32)}
     */
    static EAS_E_USER_CANNOT_CHANGE_PASSWORD => -2141913082

    /**
     * @type {Integer (Int32)}
     */
    static EAS_E_ADMINS_HAVE_BLANK_PASSWORD => -2141913081

    /**
     * @type {Integer (Int32)}
     */
    static EAS_E_ADMINS_CANNOT_CHANGE_PASSWORD => -2141913080

    /**
     * @type {Integer (Int32)}
     */
    static EAS_E_LOCAL_CONTROLLED_USERS_CANNOT_CHANGE_PASSWORD => -2141913079

    /**
     * @type {Integer (Int32)}
     */
    static EAS_E_PASSWORD_POLICY_NOT_ENFORCEABLE_FOR_CONNECTED_ADMINS => -2141913078

    /**
     * @type {Integer (Int32)}
     */
    static EAS_E_CONNECTED_ADMINS_NEED_TO_CHANGE_PASSWORD => -2141913077

    /**
     * @type {Integer (Int32)}
     */
    static EAS_E_PASSWORD_POLICY_NOT_ENFORCEABLE_FOR_CURRENT_CONNECTED_USER => -2141913076

    /**
     * @type {Integer (Int32)}
     */
    static EAS_E_CURRENT_CONNECTED_USER_NEED_TO_CHANGE_PASSWORD => -2141913075

    /**
     * @type {Integer (Int32)}
     */
    static WEB_E_UNSUPPORTED_FORMAT => -2089484287

    /**
     * @type {Integer (Int32)}
     */
    static WEB_E_INVALID_XML => -2089484286

    /**
     * @type {Integer (Int32)}
     */
    static WEB_E_MISSING_REQUIRED_ELEMENT => -2089484285

    /**
     * @type {Integer (Int32)}
     */
    static WEB_E_MISSING_REQUIRED_ATTRIBUTE => -2089484284

    /**
     * @type {Integer (Int32)}
     */
    static WEB_E_UNEXPECTED_CONTENT => -2089484283

    /**
     * @type {Integer (Int32)}
     */
    static WEB_E_RESOURCE_TOO_LARGE => -2089484282

    /**
     * @type {Integer (Int32)}
     */
    static WEB_E_INVALID_JSON_STRING => -2089484281

    /**
     * @type {Integer (Int32)}
     */
    static WEB_E_INVALID_JSON_NUMBER => -2089484280

    /**
     * @type {Integer (Int32)}
     */
    static WEB_E_JSON_VALUE_NOT_FOUND => -2089484279

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_UNEXPECTED => -2145845247

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_UNEXPECTED_REDIRECTION => -2145845245

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_UNEXPECTED_CLIENT_ERROR => -2145845244

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_UNEXPECTED_SERVER_ERROR => -2145845243

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_AMBIGUOUS => -2145844948

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_MOVED => -2145844947

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_REDIRECT => -2145844946

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_REDIRECT_METHOD => -2145844945

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_NOT_MODIFIED => -2145844944

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_USE_PROXY => -2145844943

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_REDIRECT_KEEP_VERB => -2145844941

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_BAD_REQUEST => -2145844848

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_DENIED => -2145844847

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_PAYMENT_REQ => -2145844846

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_FORBIDDEN => -2145844845

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_NOT_FOUND => -2145844844

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_BAD_METHOD => -2145844843

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_NONE_ACCEPTABLE => -2145844842

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_PROXY_AUTH_REQ => -2145844841

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_REQUEST_TIMEOUT => -2145844840

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_CONFLICT => -2145844839

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_GONE => -2145844838

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_LENGTH_REQUIRED => -2145844837

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_PRECOND_FAILED => -2145844836

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_REQUEST_TOO_LARGE => -2145844835

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_URI_TOO_LONG => -2145844834

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_UNSUPPORTED_MEDIA => -2145844833

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_RANGE_NOT_SATISFIABLE => -2145844832

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_EXPECTATION_FAILED => -2145844831

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_SERVER_ERROR => -2145844748

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_NOT_SUPPORTED => -2145844747

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_BAD_GATEWAY => -2145844746

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_SERVICE_UNAVAIL => -2145844745

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_GATEWAY_TIMEOUT => -2145844744

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_E_STATUS_VERSION_NOT_SUP => -2145844743

    /**
     * @type {Integer (Int32)}
     */
    static E_INVALID_PROTOCOL_OPERATION => -2089418751

    /**
     * @type {Integer (Int32)}
     */
    static E_INVALID_PROTOCOL_FORMAT => -2089418750

    /**
     * @type {Integer (Int32)}
     */
    static E_PROTOCOL_EXTENSIONS_NOT_SUPPORTED => -2089418749

    /**
     * @type {Integer (Int32)}
     */
    static E_SUBPROTOCOL_NOT_SUPPORTED => -2089418748

    /**
     * @type {Integer (Int32)}
     */
    static E_PROTOCOL_VERSION_NOT_SUPPORTED => -2089418747

    /**
     * @type {Integer (Int32)}
     */
    static INPUT_E_OUT_OF_ORDER => -2143289344

    /**
     * @type {Integer (Int32)}
     */
    static INPUT_E_REENTRANCY => -2143289343

    /**
     * @type {Integer (Int32)}
     */
    static INPUT_E_MULTIMODAL => -2143289342

    /**
     * @type {Integer (Int32)}
     */
    static INPUT_E_PACKET => -2143289341

    /**
     * @type {Integer (Int32)}
     */
    static INPUT_E_FRAME => -2143289340

    /**
     * @type {Integer (Int32)}
     */
    static INPUT_E_HISTORY => -2143289339

    /**
     * @type {Integer (Int32)}
     */
    static INPUT_E_DEVICE_INFO => -2143289338

    /**
     * @type {Integer (Int32)}
     */
    static INPUT_E_TRANSFORM => -2143289337

    /**
     * @type {Integer (Int32)}
     */
    static INPUT_E_DEVICE_PROPERTY => -2143289336

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_DBG_CREATE_PROCESS_FAILURE_LOCKDOWN => -2135949311

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_DBG_ATTACH_PROCESS_FAILURE_LOCKDOWN => -2135949310

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_DBG_CONNECT_SERVER_FAILURE_LOCKDOWN => -2135949309

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_DBG_START_SERVER_FAILURE_LOCKDOWN => -2135949308

    /**
     * @type {Integer (Int32)}
     */
    static HSP_E_ERROR_MASK => -2128084992

    /**
     * @type {Integer (Int32)}
     */
    static HSP_E_INTERNAL_ERROR => -2128080897

    /**
     * @type {Integer (Int32)}
     */
    static HSP_BS_ERROR_MASK => -2128080896

    /**
     * @type {Integer (Int32)}
     */
    static HSP_BS_INTERNAL_ERROR => -2128080641

    /**
     * @type {Integer (Int32)}
     */
    static HSP_DRV_ERROR_MASK => -2128019456

    /**
     * @type {Integer (Int32)}
     */
    static HSP_DRV_INTERNAL_ERROR => -2128019201

    /**
     * @type {Integer (Int32)}
     */
    static HSP_BASE_ERROR_MASK => -2128019200

    /**
     * @type {Integer (Int32)}
     */
    static HSP_BASE_INTERNAL_ERROR => -2128018945

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_ERROR_MASK => -2128018944

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_DEVICE_NOT_READY => -2128018943

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_INVALID_PROVIDER_HANDLE => -2128018942

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_INVALID_KEY_HANDLE => -2128018941

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_INVALID_PARAMETER => -2128018940

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_BUFFER_TOO_SMALL => -2128018939

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_NOT_SUPPORTED => -2128018938

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_INVALID_DATA => -2128018937

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_INVALID_FLAGS => -2128018936

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_ALGORITHM_NOT_SUPPORTED => -2128018935

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_KEY_ALREADY_FINALIZED => -2128018934

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_KEY_NOT_FINALIZED => -2128018933

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_INVALID_KEY_TYPE => -2128018932

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_NO_MEMORY => -2128018928

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_PARAMETER_NOT_SET => -2128018927

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_KEY_EXISTS => -2128018923

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_KEY_MISSING => -2128018922

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_KEY_LOAD_FAIL => -2128018921

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_NO_MORE_ITEMS => -2128018920

    /**
     * @type {Integer (Int32)}
     */
    static HSP_KSP_INTERNAL_ERROR => -2128018689

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_IO_PREEMPTED => -1996423167

    /**
     * @type {Integer (Int32)}
     */
    static JSCRIPT_E_CANTEXECUTE => -1996357631

    /**
     * @type {Integer (Int32)}
     */
    static WEP_E_NOT_PROVISIONED_ON_ALL_VOLUMES => -2013200383

    /**
     * @type {Integer (Int32)}
     */
    static WEP_E_FIXED_DATA_NOT_SUPPORTED => -2013200382

    /**
     * @type {Integer (Int32)}
     */
    static WEP_E_HARDWARE_NOT_COMPLIANT => -2013200381

    /**
     * @type {Integer (Int32)}
     */
    static WEP_E_LOCK_NOT_CONFIGURED => -2013200380

    /**
     * @type {Integer (Int32)}
     */
    static WEP_E_PROTECTION_SUSPENDED => -2013200379

    /**
     * @type {Integer (Int32)}
     */
    static WEP_E_NO_LICENSE => -2013200378

    /**
     * @type {Integer (Int32)}
     */
    static WEP_E_OS_NOT_PROTECTED => -2013200377

    /**
     * @type {Integer (Int32)}
     */
    static WEP_E_UNEXPECTED_FAIL => -2013200376

    /**
     * @type {Integer (Int32)}
     */
    static WEP_E_BUFFER_TOO_LARGE => -2013200375

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SVHDX_ERROR_STORED => -1067712512

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SVHDX_ERROR_NOT_AVAILABLE => -1067647232

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SVHDX_UNIT_ATTENTION_AVAILABLE => -1067647231

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SVHDX_UNIT_ATTENTION_CAPACITY_DATA_CHANGED => -1067647230

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SVHDX_UNIT_ATTENTION_RESERVATIONS_PREEMPTED => -1067647229

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SVHDX_UNIT_ATTENTION_RESERVATIONS_RELEASED => -1067647228

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SVHDX_UNIT_ATTENTION_REGISTRATIONS_PREEMPTED => -1067647227

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SVHDX_UNIT_ATTENTION_OPERATING_DEFINITION_CHANGED => -1067647226

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SVHDX_RESERVATION_CONFLICT => -1067647225

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SVHDX_WRONG_FILE_TYPE => -1067647224

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SVHDX_VERSION_MISMATCH => -1067647223

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_VHD_SHARED => -1067647222

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SVHDX_NO_INITIATOR => -1067647221

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_VHDSET_BACKING_STORAGE_NOT_FOUND => -1067647220

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SMB_NO_PREAUTH_INTEGRITY_HASH_OVERLAP => -1067646976

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SMB_BAD_CLUSTER_DIALECT => -1067646975

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SMB_NO_SIGNING_ALGORITHM_OVERLAP => -1067646974

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SMB_GUEST_LOGON_BLOCKED_SIGNING_REQUIRED => -1067646973

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SMB_GUEST_ENCRYPTION_NOT_SUPPORTED => -1067646972

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SMB_ENCRYPTION_NOT_SUPPORTED_BY_PEER => -1067646971

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SMB_CERT_NO_PRIVATE_KEY => -1067646970

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_SMB_TLS_ACCESS_DENIED => -1067646969

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_OUT_OF_HANDLES => -2147012895

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_TIMEOUT => -2147012894

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_EXTENDED_ERROR => -2147012893

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_INTERNAL_ERROR => -2147012892

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_INVALID_URL => -2147012891

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_UNRECOGNIZED_SCHEME => -2147012890

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_NAME_NOT_RESOLVED => -2147012889

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_PROTOCOL_NOT_FOUND => -2147012888

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_INVALID_OPTION => -2147012887

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_BAD_OPTION_LENGTH => -2147012886

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_OPTION_NOT_SETTABLE => -2147012885

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_SHUTDOWN => -2147012884

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_INCORRECT_USER_NAME => -2147012883

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_INCORRECT_PASSWORD => -2147012882

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_LOGIN_FAILURE => -2147012881

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_INVALID_OPERATION => -2147012880

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_OPERATION_CANCELLED => -2147012879

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_INCORRECT_HANDLE_TYPE => -2147012878

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_INCORRECT_HANDLE_STATE => -2147012877

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_NOT_PROXY_REQUEST => -2147012876

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_REGISTRY_VALUE_NOT_FOUND => -2147012875

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_BAD_REGISTRY_PARAMETER => -2147012874

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_NO_DIRECT_ACCESS => -2147012873

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_NO_CONTEXT => -2147012872

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_NO_CALLBACK => -2147012871

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_REQUEST_PENDING => -2147012870

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_INCORRECT_FORMAT => -2147012869

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_ITEM_NOT_FOUND => -2147012868

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_CANNOT_CONNECT => -2147012867

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_CONNECTION_ABORTED => -2147012866

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_CONNECTION_RESET => -2147012865

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_FORCE_RETRY => -2147012864

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_INVALID_PROXY_REQUEST => -2147012863

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_NEED_UI => -2147012862

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_HANDLE_EXISTS => -2147012860

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_SEC_CERT_DATE_INVALID => -2147012859

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_SEC_CERT_CN_INVALID => -2147012858

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_HTTP_TO_HTTPS_ON_REDIR => -2147012857

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_HTTPS_TO_HTTP_ON_REDIR => -2147012856

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_MIXED_SECURITY => -2147012855

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_CHG_POST_IS_NON_SECURE => -2147012854

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_POST_IS_NON_SECURE => -2147012853

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_CLIENT_AUTH_CERT_NEEDED => -2147012852

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_INVALID_CA => -2147012851

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_CLIENT_AUTH_NOT_SETUP => -2147012850

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_ASYNC_THREAD_FAILED => -2147012849

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_REDIRECT_SCHEME_CHANGE => -2147012848

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_DIALOG_PENDING => -2147012847

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_RETRY_DIALOG => -2147012846

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_NO_NEW_CONTAINERS => -2147012845

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_HTTPS_HTTP_SUBMIT_REDIR => -2147012844

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_SEC_CERT_ERRORS => -2147012841

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_SEC_CERT_REV_FAILED => -2147012839

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_HEADER_NOT_FOUND => -2147012746

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_DOWNLEVEL_SERVER => -2147012745

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_INVALID_SERVER_RESPONSE => -2147012744

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_INVALID_HEADER => -2147012743

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_INVALID_QUERY_REQUEST => -2147012742

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_HEADER_ALREADY_EXISTS => -2147012741

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_REDIRECT_FAILED => -2147012740

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_SECURITY_CHANNEL_ERROR => -2147012739

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_UNABLE_TO_CACHE_FILE => -2147012738

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_TCPIP_NOT_INSTALLED => -2147012737

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_DISCONNECTED => -2147012733

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_SERVER_UNREACHABLE => -2147012732

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_PROXY_SERVER_UNREACHABLE => -2147012731

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_BAD_AUTO_PROXY_SCRIPT => -2147012730

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_UNABLE_TO_DOWNLOAD_SCRIPT => -2147012729

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_SEC_INVALID_CERT => -2147012727

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_SEC_CERT_REVOKED => -2147012726

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_FAILED_DUETOSECURITYCHECK => -2147012725

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_NOT_INITIALIZED => -2147012724

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_LOGIN_FAILURE_DISPLAY_ENTITY_BODY => -2147012722

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_DECODING_FAILED => -2147012721

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_NOT_REDIRECTED => -2147012736

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_COOKIE_NEEDS_CONFIRMATION => -2147012735

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_COOKIE_DECLINED => -2147012734

    /**
     * @type {Integer (Int32)}
     */
    static WININET_E_REDIRECT_NEEDS_CONFIRMATION => -2147012728

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_ERROR => -2018574335

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_INTERNAL => -2018574334

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_PERM => -2018574333

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_ABORT => -2018574332

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_BUSY => -2018574331

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_LOCKED => -2018574330

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_NOMEM => -2018574329

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_READONLY => -2018574328

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_INTERRUPT => -2018574327

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR => -2018574326

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CORRUPT => -2018574325

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_NOTFOUND => -2018574324

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_FULL => -2018574323

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CANTOPEN => -2018574322

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_PROTOCOL => -2018574321

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_EMPTY => -2018574320

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_SCHEMA => -2018574319

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_TOOBIG => -2018574318

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CONSTRAINT => -2018574317

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_MISMATCH => -2018574316

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_MISUSE => -2018574315

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_NOLFS => -2018574314

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_AUTH => -2018574313

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_FORMAT => -2018574312

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_RANGE => -2018574311

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_NOTADB => -2018574310

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_NOTICE => -2018574309

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_WARNING => -2018574308

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_ROW => -2018574236

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_DONE => -2018574235

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_READ => -2018574070

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_SHORT_READ => -2018573814

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_WRITE => -2018573558

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_FSYNC => -2018573302

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_DIR_FSYNC => -2018573046

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_TRUNCATE => -2018572790

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_FSTAT => -2018572534

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_UNLOCK => -2018572278

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_RDLOCK => -2018572022

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_DELETE => -2018571766

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_BLOCKED => -2018571510

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_NOMEM => -2018571254

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_ACCESS => -2018570998

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_CHECKRESERVEDLOCK => -2018570742

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_LOCK => -2018570486

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_CLOSE => -2018570230

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_DIR_CLOSE => -2018569974

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_SHMOPEN => -2018569718

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_SHMSIZE => -2018569462

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_SHMLOCK => -2018569206

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_SHMMAP => -2018568950

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_SEEK => -2018568694

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_DELETE_NOENT => -2018568438

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_MMAP => -2018568182

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_GETTEMPPATH => -2018567926

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_CONVPATH => -2018567670

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_VNODE => -2018567414

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_AUTH => -2018567158

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_BEGIN_ATOMIC => -2018566902

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_COMMIT_ATOMIC => -2018566646

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_ROLLBACK_ATOMIC => -2018566390

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_DATA => -2018566134

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_CORRUPTFS => -2018565878

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_IOERR_IN_PAGE => -2018565622

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_LOCKED_SHAREDCACHE => -2018574074

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_LOCKED_VTAB => -2018573818

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_BUSY_RECOVERY => -2018574075

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_BUSY_SNAPSHOT => -2018573819

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_BUSY_TIMEOUT => -2018573563

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CANTOPEN_NOTEMPDIR => -2018574066

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CANTOPEN_ISDIR => -2018573810

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CANTOPEN_FULLPATH => -2018573554

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CANTOPEN_CONVPATH => -2018573298

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CANTOPEN_DIRTYWAL => -2018573042

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CANTOPEN_SYMLINK => -2018572786

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CORRUPT_VTAB => -2018574069

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CORRUPT_SEQUENCE => -2018573813

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CORRUPT_INDEX => -2018573557

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_READONLY_RECOVERY => -2018574072

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_READONLY_CANTLOCK => -2018573816

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_READONLY_ROLLBACK => -2018573560

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_READONLY_DBMOVED => -2018573304

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_READONLY_CANTINIT => -2018573048

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_READONLY_DIRECTORY => -2018572792

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_ABORT_ROLLBACK => -2018573820

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CONSTRAINT_CHECK => -2018574061

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CONSTRAINT_COMMITHOOK => -2018573805

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CONSTRAINT_FOREIGNKEY => -2018573549

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CONSTRAINT_FUNCTION => -2018573293

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CONSTRAINT_NOTNULL => -2018573037

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CONSTRAINT_PRIMARYKEY => -2018572781

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CONSTRAINT_TRIGGER => -2018572525

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CONSTRAINT_UNIQUE => -2018572269

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CONSTRAINT_VTAB => -2018572013

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CONSTRAINT_ROWID => -2018571757

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CONSTRAINT_PINNED => -2018571501

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_CONSTRAINT_DATATYPE => -2018571245

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_NOTICE_RECOVER_WAL => -2018574053

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_NOTICE_RECOVER_ROLLBACK => -2018573797

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_NOTICE_RECOVER_RBU => -2018573541

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_WARNING_AUTOINDEX => -2018574052

    /**
     * @type {Integer (Int32)}
     */
    static SQLITE_E_AUTH_USER => -2018574057

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TOGGLE_TRACE_STARTED => -2017128447

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_ALTERNATIVE_TRACE_CANNOT_PREEMPT => -2017128446

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_AOT_NOT_RUNNING => -2017128445

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_SCRIPT_TYPE_INVALID => -2017128444

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_SCENARIODEF_NOT_FOUND => -2017128443

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TRACEPROFILE_NOT_FOUND => -2017128442

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FORWARDER_ALREADY_ENABLED => -2017128441

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FORWARDER_ALREADY_DISABLED => -2017128440

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_EVENTLOG_ENTRY_MALFORMED => -2017128439

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_DIAGRULES_SCHEMAVERSION_MISMATCH => -2017128438

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_SCRIPT_TERMINATED => -2017128437

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_INVALID_CUSTOM_FILTER => -2017128436

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TRACE_NOT_RUNNING => -2017128435

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_REESCALATED_TOO_QUICKLY => -2017128434

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_ESCALATION_ALREADY_RUNNING => -2017128433

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_PERFTRACK_ALREADY_TRACING => -2017128432

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_REACHED_MAX_ESCALATIONS => -2017128431

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FORWARDER_PRODUCER_MISMATCH => -2017128430

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_INTENTIONAL_SCRIPT_FAILURE => -2017128429

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_SQM_INIT_FAILED => -2017128428

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_NO_WER_LOGGER_SUPPORTED => -2017128427

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TRACERS_DONT_EXIST => -2017128426

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_WINRT_INIT_FAILED => -2017128425

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_SCENARIODEF_SCHEMAVERSION_MISMATCH => -2017128424

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_INVALID_FILTER => -2017128423

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_EXE_TERMINATED => -2017128422

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_ESCALATION_NOT_AUTHORIZED => -2017128421

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_SETUP_NOT_AUTHORIZED => -2017128420

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_CHILD_PROCESS_FAILED => -2017128419

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_COMMAND_LINE_NOT_AUTHORIZED => -2017128418

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_CANNOT_LOAD_SCENARIO_EDITOR_XML => -2017128417

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_ESCALATION_TIMED_OUT => -2017128416

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_SETUP_TIMED_OUT => -2017128415

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TRIGGER_MISMATCH => -2017128414

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TRIGGER_NOT_FOUND => -2017128413

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_SIF_NOT_SUPPORTED => -2017128412

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_DELAY_TERMINATED => -2017128411

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_DEVICE_TICKET_ERROR => -2017128410

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TRACE_BUFFER_LIMIT_EXCEEDED => -2017128409

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_API_RESULT_UNAVAILABLE => -2017128408

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_RPC_TIMEOUT => -2017128407

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_RPC_WAIT_FAILED => -2017128406

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_API_BUSY => -2017128405

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TRACE_MIN_DURATION_REQUIREMENT_NOT_MET => -2017128404

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_EXCLUSIVITY_NOT_AVAILABLE => -2017128403

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_GETFILE_FILE_PATH_NOT_APPROVED => -2017128402

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_ESCALATION_DIRECTORY_ALREADY_EXISTS => -2017128401

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TIME_TRIGGER_ON_START_INVALID => -2017128400

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TIME_TRIGGER_ONLY_VALID_ON_SINGLE_TRANSITION => -2017128399

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TIME_TRIGGER_INVALID_TIME_RANGE => -2017128398

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_MULTIPLE_TIME_TRIGGER_ON_SINGLE_STATE => -2017128397

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_BINARY_MISSING => -2017128396

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FAILED_TO_RESOLVE_CONTAINER_ID => -2017128394

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_UNABLE_TO_RESOLVE_SESSION => -2017128393

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_THROTTLED => -2017128392

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_UNAPPROVED_SCRIPT => -2017128391

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_SCRIPT_MISSING => -2017128390

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_SCENARIO_THROTTLED => -2017128389

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_API_NOT_SUPPORTED => -2017128388

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_GETFILE_EXTERNAL_PATH_NOT_APPROVED => -2017128387

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TRY_GET_SCENARIO_TIMEOUT_EXCEEDED => -2017128386

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_CERT_REV_FAILED => -2017128385

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FAILED_TO_START_NDISCAP => -2017128384

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_KERNELDUMP_LIMIT_REACHED => -2017128383

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_MISSING_AGGREGATE_EVENT_TAG => -2017128382

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_INVALID_AGGREGATION_STRUCT => -2017128381

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_ACTION_NOT_SUPPORTED_IN_DESTINATION => -2017128380

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FILTER_MISSING_ATTRIBUTE => -2017128379

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FILTER_INVALID_TYPE => -2017128378

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FILTER_VARIABLE_NOT_FOUND => -2017128377

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FILTER_FUNCTION_RESTRICTED => -2017128376

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FILTER_VERSION_MISMATCH => -2017128375

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FILTER_INVALID_FUNCTION => -2017128368

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FILTER_INVALID_FUNCTION_PARAMS => -2017128367

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FILTER_INVALID_COMMAND => -2017128366

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FILTER_ILLEGAL_EVAL => -2017128365

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TTTRACER_RETURNED_ERROR => -2017128364

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_AGENT_DIAGNOSTICS_TOO_LARGE => -2017128363

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_FAILED_TO_RECEIVE_AGENT_DIAGNOSTICS => -2017128362

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_SCENARIO_HAS_NO_ACTIONS => -2017128361

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TTTRACER_STORAGE_FULL => -2017128360

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_INSUFFICIENT_SPACE_TO_START_TRACE => -2017128359

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_ESCALATION_CANCELLED_AT_SHUTDOWN => -2017128358

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_GETFILEINFOACTION_FILE_NOT_APPROVED => -2017128357

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_SETREGKEYACTION_TYPE_NOT_APPROVED => -2017128356

    /**
     * @type {Integer (Int32)}
     */
    static UTC_E_TRACE_THROTTLED => -2017128355

    /**
     * @type {Integer (Int32)}
     */
    static WINML_ERR_INVALID_DEVICE => -2003828735

    /**
     * @type {Integer (Int32)}
     */
    static WINML_ERR_INVALID_BINDING => -2003828734

    /**
     * @type {Integer (Int32)}
     */
    static WINML_ERR_VALUE_NOTFOUND => -2003828733

    /**
     * @type {Integer (Int32)}
     */
    static WINML_ERR_SIZE_MISMATCH => -2003828732

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_HANDSHAKE_FAILURE => -2143223808

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_VER_NEG_FAILURE => -2143223807

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_USER_CANCELED => -2143223806

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_INTERNAL_ERROR => -2143223805

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_PROTOCOL_VIOLATION => -2143223804

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_CONNECTION_IDLE => -2143223803

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_CONNECTION_TIMEOUT => -2143223802

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_ALPN_NEG_FAILURE => -2143223801

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_STREAM_LIMIT_REACHED => -2143223800

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_ALPN_IN_USE => -2143223799

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_TLS_UNEXPECTED_MESSAGE => -2143223542

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_TLS_BAD_CERTIFICATE => -2143223510

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_TLS_UNSUPPORTED_CERTIFICATE => -2143223509

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_TLS_CERTIFICATE_REVOKED => -2143223508

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_TLS_CERTIFICATE_EXPIRED => -2143223507

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_TLS_CERTIFICATE_UNKNOWN => -2143223506

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_TLS_ILLEGAL_PARAMETER => -2143223505

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_TLS_UNKNOWN_CA => -2143223504

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_TLS_ACCESS_DENIED => -2143223503

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_TLS_INSUFFICIENT_SECURITY => -2143223481

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_TLS_INTERNAL_ERROR => -2143223472

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_TLS_USER_CANCELED => -2143223462

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_QUIC_TLS_CERTIFICATE_REQUIRED => -2143223436

    /**
     * @type {Integer (Int32)}
     */
    static IORING_E_REQUIRED_FLAG_NOT_SUPPORTED => -2142896127

    /**
     * @type {Integer (Int32)}
     */
    static IORING_E_SUBMISSION_QUEUE_FULL => -2142896126

    /**
     * @type {Integer (Int32)}
     */
    static IORING_E_VERSION_NOT_SUPPORTED => -2142896125

    /**
     * @type {Integer (Int32)}
     */
    static IORING_E_SUBMISSION_QUEUE_TOO_BIG => -2142896124

    /**
     * @type {Integer (Int32)}
     */
    static IORING_E_COMPLETION_QUEUE_TOO_BIG => -2142896123

    /**
     * @type {Integer (Int32)}
     */
    static IORING_E_SUBMIT_IN_PROGRESS => -2142896122

    /**
     * @type {Integer (Int32)}
     */
    static IORING_E_CORRUPT => -2142896121

    /**
     * @type {Integer (Int32)}
     */
    static IORING_E_COMPLETION_QUEUE_TOO_FULL => -2142896120

    /**
     * @type {Integer (Int32)}
     */
    static UNIONFS_E_CANNOT_CROSS_UNION => -1994063871

    /**
     * @type {Integer (Int32)}
     */
    static UNIONFS_E_CANNOT_EXIT_UNION => -1994063870

    /**
     * @type {Integer (Int32)}
     */
    static UNIONFS_E_CANNOT_PRESERVE_LINK => -1994063869

    /**
     * @type {Integer (Int32)}
     */
    static UNIONFS_E_INVALID_TOMBSTONE_STATE => -1994063868

    /**
     * @type {Integer (Int32)}
     */
    static UNIONFS_E_LAYERS_PRESENT => -1994063867

    /**
     * @type {Integer (Int32)}
     */
    static UNIONFS_E_NESTED_LAYER => -1994063866

    /**
     * @type {Integer (Int32)}
     */
    static UNIONFS_E_UNION_DUPLICATE_ID => -1994063865

    /**
     * @type {Integer (Int32)}
     */
    static UNIONFS_E_INACTIVE_UNION => -1994063864

    /**
     * @type {Integer (Int32)}
     */
    static UNIONFS_E_TOO_MANY_LAYERS => -1994063863

    /**
     * @type {Integer (Int32)}
     */
    static UNIONFS_E_TOO_LATE => -1994063862

    /**
     * @type {Integer (Int32)}
     */
    static UNIONFS_E_NESTED_UNION => -1994063861

    /**
     * @type {Integer (Int32)}
     */
    static UNIONFS_E_NESTED_UNION_NOT_ALLOWED => -1994063860

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_PRM_HANDLER_NOT_FOUND => -920256000

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_PRM_CONCURRENT_OPERATION => -920255998

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_PRM_MODULE_UPDATE_PENDING => -920255997

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_PRM_MODULE_LOCKED => -920255996

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_PRM_UPDATE_INCOMPATIBLE_VERSION => -920255995

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_PRM_UPDATE_MODULE_MISMATCH => -920255994

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_PRM_UPDATE_MODULE_NOT_FOUND => -920255993

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_PRM_UPDATE_MISSING_EXPORT => -920255992

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_PRM_UPDATE_MODULE_LOCKED => -920255991

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_PRM_UPDATE_BAD_SIGNATURE => -920255990

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_PRM_UPDATE_VERSION_MISMATCH => -920255989

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_PRM_MODULE_UNLOCKED => -920255988

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_PRM_INTERFACE_INACCESSIBLE => -920255987

    /**
     * @type {Integer (Int32)}
     */
    static ERROR_ACCELERATOR_SUBMISSION_QUEUE_FULL => -920190976

    /**
     * @type {Integer (Int32)}
     */
    static PPF_E_TRANSFORM_DIGEST_ALGO_NOT_SUPPORTED => -920125440

    /**
     * @type {Integer (Int32)}
     */
    static PPF_E_TRANSFORM_CONFLICT => -920125439

    /**
     * @type {Integer (Int32)}
     */
    static PPF_E_TRANSFORM_CLEANED_UP_NA => -920125438

    /**
     * @type {Integer (Int32)}
     */
    static PPF_E_TRANSFORM_CLEANED_UP_STATE_CHANGE => -920125437

    /**
     * @type {Integer (Int32)}
     */
    static PPF_E_TRANSFORM_DIGEST_ALGO_NOT_PRESENT => -920125436

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_ENUM_VALUE_TOO_LARGE => 1781

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_INVALID_PIPE_OPERATION => 1831

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_SS_CONTEXT_MISMATCH => -1073545211

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_NO_MEMORY => -1073741801

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_INVALID_BOUND => -1073610717

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_INVALID_TAG => -1073610718

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_INVALID_BUFFER => -1073741306

    /**
     * @type {Integer (Int32)}
     */
    static RPC_X_PIPE_APP_MEMORY => -1073741801

    /**
     * @type {Integer (UInt32)}
     */
    static STATUS_SEVERITY_COERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STATUS_SEVERITY_COFAIL => 3

    /**
     * @type {Integer (Int32)}
     */
    static NOT_AN_ERROR1 => 529920

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_FAILED => -2147215872

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_INVALIDQUERY => -2147215871

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_INVALIDRESTRICTION => -2147215870

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_INVALIDSORT => -2147215869

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_INVALIDCATEGORIZE => -2147215868

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_ALLNOISE => -2147215867

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_TOOCOMPLEX => -2147215866

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_TIMEDOUT => -2147215865

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_DUPLICATE_OUTPUT_COLUMN => -2147215864

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_INVALID_OUTPUT_COLUMN => -2147215863

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_INVALID_DIRECTORY => -2147215862

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_E_DIR_ON_REMOVABLE_DRIVE => -2147215861

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_S_NO_QUERY => -2147215860

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_E_CANT_OPEN_FILE => -2147215791

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_E_READ_ERROR => -2147215790

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_E_EXPECTING_NAME => -2147215789

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_E_EXPECTING_TYPE => -2147215788

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_E_UNRECOGNIZED_TYPE => -2147215787

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_E_EXPECTING_INTEGER => -2147215786

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_E_EXPECTING_CLOSE_PAREN => -2147215785

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_E_EXPECTING_GUID => -2147215784

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_E_BAD_GUID => -2147215783

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_E_EXPECTING_PROP_SPEC => -2147215782

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_E_CANT_SET_PROPERTY => -2147215781

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_E_DUPLICATE => -2147215780

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_E_VECTORBYREF_USED_ALONE => -2147215779

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_E_BYREF_USED_WITHOUT_PTRTYPE => -2147215778

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_UNEXPECTED_NOT => -2147215776

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_EXPECTING_INTEGER => -2147215775

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_EXPECTING_REAL => -2147215774

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_EXPECTING_DATE => -2147215773

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_EXPECTING_CURRENCY => -2147215772

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_EXPECTING_GUID => -2147215771

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_EXPECTING_BRACE => -2147215770

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_EXPECTING_PAREN => -2147215769

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_EXPECTING_PROPERTY => -2147215768

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_NOT_YET_IMPLEMENTED => -2147215767

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_EXPECTING_PHRASE => -2147215766

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_UNSUPPORTED_PROPERTY_TYPE => -2147215765

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_EXPECTING_REGEX => -2147215764

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_EXPECTING_REGEX_PROPERTY => -2147215763

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_INVALID_LITERAL => -2147215762

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_NO_SUCH_PROPERTY => -2147215761

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_EXPECTING_EOS => -2147215760

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_EXPECTING_COMMA => -2147215759

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_UNEXPECTED_EOS => -2147215758

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_WEIGHT_OUT_OF_RANGE => -2147215757

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_NO_SUCH_SORT_PROPERTY => -2147215756

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_INVALID_SORT_ORDER => -2147215755

    /**
     * @type {Integer (Int32)}
     */
    static QUTIL_E_CANT_CONVERT_VROOT => -2147215754

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_INVALID_GROUPING => -2147215753

    /**
     * @type {Integer (Int32)}
     */
    static QUTIL_E_INVALID_CODEPAGE => -1073473928

    /**
     * @type {Integer (Int32)}
     */
    static QPLIST_S_DUPLICATE => 267897

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_INVALID_QUERY => -2147215750

    /**
     * @type {Integer (Int32)}
     */
    static QPARSE_E_INVALID_RANKMETHOD => -2147215749

    /**
     * @type {Integer (Int32)}
     */
    static FDAEMON_W_WORDLISTFULL => 267904

    /**
     * @type {Integer (Int32)}
     */
    static FDAEMON_E_LOWRESOURCE => -2147215743

    /**
     * @type {Integer (Int32)}
     */
    static FDAEMON_E_FATALERROR => -2147215742

    /**
     * @type {Integer (Int32)}
     */
    static FDAEMON_E_PARTITIONDELETED => -2147215741

    /**
     * @type {Integer (Int32)}
     */
    static FDAEMON_E_CHANGEUPDATEFAILED => -2147215740

    /**
     * @type {Integer (Int32)}
     */
    static FDAEMON_W_EMPTYWORDLIST => 267909

    /**
     * @type {Integer (Int32)}
     */
    static FDAEMON_E_WORDLISTCOMMITFAILED => -2147215738

    /**
     * @type {Integer (Int32)}
     */
    static FDAEMON_E_NOWORDLIST => -2147215737

    /**
     * @type {Integer (Int32)}
     */
    static FDAEMON_E_TOOMANYFILTEREDBLOCKS => -2147215736

    /**
     * @type {Integer (Int32)}
     */
    static SEARCH_S_NOMOREHITS => 267936

    /**
     * @type {Integer (Int32)}
     */
    static SEARCH_E_NOMONIKER => -2147215711

    /**
     * @type {Integer (Int32)}
     */
    static SEARCH_E_NOREGION => -2147215710

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_TOO_BIG => -2147215568

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_S_PARTIAL_CONTENTSCAN_IMMEDIATE => 268081

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_S_FULL_CONTENTSCAN_IMMEDIATE => 268082

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_S_CONTENTSCAN_DELAYED => 268083

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_CONTENTINDEXCORRUPT => -1073473740

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_S_DISK_FULL => 268085

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_ALREADY_OPEN => -2147215562

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_UNREACHABLE => -2147215561

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_IN_USE => -2147215560

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_NOT_OPEN => -2147215559

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_S_NO_PROPSETS => 268090

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_NO_SUCH_PROPERTY => -2147215557

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_S_NO_SECURITY_DESCRIPTOR => 268092

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_OFFLINE => -2147215555

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_PARTIALLY_FILTERED => -2147215554

    /**
     * @type {Integer (Int32)}
     */
    static WBREAK_E_END_OF_TEXT => -2147215488

    /**
     * @type {Integer (Int32)}
     */
    static LANGUAGE_S_LARGE_WORD => 268161

    /**
     * @type {Integer (Int32)}
     */
    static WBREAK_E_QUERY_ONLY => -2147215486

    /**
     * @type {Integer (Int32)}
     */
    static WBREAK_E_BUFFER_TOO_SMALL => -2147215485

    /**
     * @type {Integer (Int32)}
     */
    static LANGUAGE_E_DATABASE_NOT_FOUND => -2147215484

    /**
     * @type {Integer (Int32)}
     */
    static WBREAK_E_INIT_FAILED => -2147215483

    /**
     * @type {Integer (Int32)}
     */
    static PSINK_E_QUERY_ONLY => -2147215472

    /**
     * @type {Integer (Int32)}
     */
    static PSINK_E_INDEX_ONLY => -2147215471

    /**
     * @type {Integer (Int32)}
     */
    static PSINK_E_LARGE_ATTACHMENT => -2147215470

    /**
     * @type {Integer (Int32)}
     */
    static PSINK_S_LARGE_WORD => 268179

    /**
     * @type {Integer (Int32)}
     */
    static CI_CORRUPT_DATABASE => -1073473536

    /**
     * @type {Integer (Int32)}
     */
    static CI_CORRUPT_CATALOG => -1073473535

    /**
     * @type {Integer (Int32)}
     */
    static CI_INVALID_PARTITION => -1073473534

    /**
     * @type {Integer (Int32)}
     */
    static CI_INVALID_PRIORITY => -1073473533

    /**
     * @type {Integer (Int32)}
     */
    static CI_NO_STARTING_KEY => -1073473532

    /**
     * @type {Integer (Int32)}
     */
    static CI_OUT_OF_INDEX_IDS => -1073473531

    /**
     * @type {Integer (Int32)}
     */
    static CI_NO_CATALOG => -1073473530

    /**
     * @type {Integer (Int32)}
     */
    static CI_CORRUPT_FILTER_BUFFER => -1073473529

    /**
     * @type {Integer (Int32)}
     */
    static CI_INVALID_INDEX => -1073473528

    /**
     * @type {Integer (Int32)}
     */
    static CI_PROPSTORE_INCONSISTENCY => -1073473527

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_ALREADY_INITIALIZED => -2147215350

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_NOT_INITIALIZED => -2147215349

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_BUFFERTOOSMALL => -2147215348

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_PROPERTY_NOT_CACHED => -2147215347

    /**
     * @type {Integer (Int32)}
     */
    static CI_S_WORKID_DELETED => 268302

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_INVALID_STATE => -2147215345

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_FILTERING_DISABLED => -2147215344

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_DISK_FULL => -2147215343

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_SHUTDOWN => -2147215342

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_WORKID_NOTVALID => -2147215341

    /**
     * @type {Integer (Int32)}
     */
    static CI_S_END_OF_ENUMERATION => 268308

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_NOT_FOUND => -2147215339

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_USE_DEFAULT_PID => -2147215338

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_DUPLICATE_NOTIFICATION => -2147215337

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_UPDATES_DISABLED => -2147215336

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_INVALID_FLAGS_COMBINATION => -2147215335

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_OUTOFSEQ_INCREMENT_DATA => -2147215334

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_SHARING_VIOLATION => -2147215333

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_LOGON_FAILURE => -2147215332

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_NO_CATALOG => -2147215331

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_STRANGE_PAGEORSECTOR_SIZE => -2147215330

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_TIMEOUT => -2147215329

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_NOT_RUNNING => -2147215328

    /**
     * @type {Integer (Int32)}
     */
    static CI_INCORRECT_VERSION => -1073473503

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_ENUMERATION_STARTED => -1073473502

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_PROPERTY_TOOLARGE => -1073473501

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_CLIENT_FILTER_ABORT => -1073473500

    /**
     * @type {Integer (Int32)}
     */
    static CI_S_NO_DOCSTORE => 268325

    /**
     * @type {Integer (Int32)}
     */
    static CI_S_CAT_STOPPED => 268326

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_CARDINALITY_MISMATCH => -2147215321

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_CONFIG_DISK_FULL => -2147215320

    /**
     * @type {Integer (Int32)}
     */
    static CI_E_DISTRIBUTED_GROUPBY_UNSUPPORTED => -2147215319

    /**
     * @type {Integer (UInt32)}
     */
    static ROUTEBASE => 900

    /**
     * @type {Integer (UInt32)}
     */
    static SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ROUTER_STOPPED => 900

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALREADY_CONNECTED => 901

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_PROTOCOL_ID => 902

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDM_NOT_RUNNING => 903

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERFACE_ALREADY_EXISTS => 904

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_INTERFACE => 905

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERFACE_NOT_CONNECTED => 906

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROTOCOL_STOP_PENDING => 907

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERFACE_CONNECTED => 908

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_INTERFACE_CREDENTIALS_SET => 909

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALREADY_CONNECTING => 910

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UPDATE_IN_PROGRESS => 911

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERFACE_CONFIGURATION => 912

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_CLIENT_PORT => 913

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_ROUTER_PORT => 914

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLIENT_INTERFACE_ALREADY_EXISTS => 915

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERFACE_DISABLED => 916

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUTH_PROTOCOL_REJECTED => 917

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_AUTH_PROTOCOL_AVAILABLE => 918

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PEER_REFUSED_AUTH => 919

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTE_NO_DIALIN_PERMISSION => 920

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTE_PASSWD_EXPIRED => 921

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTE_ACCT_DISABLED => 922

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTE_RESTRICTED_LOGON_HOURS => 923

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTE_AUTHENTICATION_FAILURE => 924

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERFACE_HAS_NO_DEVICES => 925

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IDLE_DISCONNECTED => 926

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERFACE_UNREACHABLE => 927

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_IS_PAUSED => 928

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERFACE_DISCONNECTED => 929

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUTH_SERVER_TIMEOUT => 930

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PORT_LIMIT_REACHED => 931

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PPP_SESSION_TIMEOUT => 932

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MAX_LAN_INTERFACE_LIMIT => 933

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MAX_WAN_INTERFACE_LIMIT => 934

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MAX_CLIENT_INTERFACE_LIMIT => 935

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAP_DISCONNECTED => 936

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_USER_LIMIT => 937

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_RADIUS_SERVERS => 938

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_RADIUS_RESPONSE => 939

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIALIN_HOURS_RESTRICTION => 940

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALLOWED_PORT_TYPE_RESTRICTION => 941

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUTH_PROTOCOL_RESTRICTION => 942

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAP_REQUIRED => 943

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIALOUT_HOURS_RESTRICTION => 944

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ROUTER_CONFIG_INCOMPATIBLE => 945

    /**
     * @type {Integer (UInt32)}
     */
    static WARNING_NO_MD5_MIGRATION => 946

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROTOCOL_ALREADY_INSTALLED => 948

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SIGNATURE_LENGTH => 949

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SIGNATURE => 950

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SIGNATURE => 951

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PACKET_LENGTH_OR_ID => 952

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_ATTRIBUTE_LENGTH => 953

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PACKET => 954

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUTHENTICATOR_MISMATCH => 955

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTEACCESS_NOT_CONFIGURED => 956

    /**
     * @type {Integer (UInt32)}
     */
    static ROUTEBASEEND => 957

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_MAXVER => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINDOWS_MAXVER => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static NTDDI_MAXVER => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_IE_MAXVER => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static _WIN32_WINNT_MAXVER => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static WINVER_MAXVER => 2560
;@endregion Constants

;@region Methods
    /**
     * Allocates a new string and copies the passed string into it.
     * @param {PWSTR} psz The string to copy.
     * @returns {BSTR} If successful, returns the string. If <i>psz</i> is a zero-length string, returns a zero-length <b>BSTR</b>. If <i>psz</i> is NULL or insufficient memory exists, returns NULL.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-sysallocstring
     */
    static SysAllocString(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := DllCall("OLEAUT32.dll\SysAllocString", "ptr", psz, "ptr")
        resultHandle := BSTR({Value: result}, True)
        return resultHandle
    }

    /**
     * Reallocates a previously allocated string to be the size of a second string and copies the second string into the reallocated memory.
     * @param {Pointer<BSTR>} pbstr The previously allocated string.
     * @param {PWSTR} psz The string to copy.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string is reallocated successfully.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-sysreallocstring
     */
    static SysReAllocString(pbstr, psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := DllCall("OLEAUT32.dll\SysReAllocString", "ptr", pbstr, "ptr", psz, "int")
        return result
    }

    /**
     * Allocates a new string, copies the specified number of characters from the passed string, and appends a null-terminating character.
     * @param {PWSTR} strIn The input string.
     * @param {Integer} ui The number of characters to copy. A null character is placed afterwards, allocating a total of <i>ui</i> plus one characters.
     * @returns {BSTR} A copy of the string, or <b>NULL</b> if there is insufficient memory to complete the operation.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-sysallocstringlen
     */
    static SysAllocStringLen(strIn, ui) {
        strIn := strIn is String ? StrPtr(strIn) : strIn

        result := DllCall("OLEAUT32.dll\SysAllocStringLen", "ptr", strIn, "uint", ui, "ptr")
        resultHandle := BSTR({Value: result}, True)
        return resultHandle
    }

    /**
     * Creates a new BSTR containing a specified number of characters from an old BSTR, and frees the old BSTR.
     * @param {Pointer<BSTR>} pbstr The previously allocated string.
     * @param {PWSTR} psz The string from which to copy <i>len</i> characters, or NULL to keep the string uninitialized.
     * @param {Integer} len The number of characters to copy. A null character is placed afterward, allocating a total of <i>len</i> plus one characters.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string is reallocated successfully.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-sysreallocstringlen
     */
    static SysReAllocStringLen(pbstr, psz, len) {
        psz := psz is String ? StrPtr(psz) : psz

        result := DllCall("OLEAUT32.dll\SysReAllocStringLen", "ptr", pbstr, "ptr", psz, "uint", len, "int")
        return result
    }

    /**
     * Increases the pinning reference count for the specified string by one.
     * @param {BSTR} bstrString The string for which the pinning reference count should increase. While that count remains greater than 0, the memory for the string is prevented from being freed by calls to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-sysaddrefstring
     * @since windows5.1.2600
     */
    static SysAddRefString(bstrString) {
        bstrString := bstrString is Win32Handle ? NumGet(bstrString, "ptr") : bstrString

        result := DllCall("OLEAUT32.dll\SysAddRefString", "ptr", bstrString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Decreases the pinning reference count for the specified string by one. When that count reaches 0, the memory for that string is no longer prevented from being freed.
     * @remarks
     * 
     * A call to the <b>SysReleaseString</b> function should match every previous call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysaddrefstring">SysAddRefString</a> function.
     * 
     * 
     * @param {BSTR} bstrString The string for which the  pinning reference count should decrease.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-sysreleasestring
     * @since windows5.1.2600
     */
    static SysReleaseString(bstrString) {
        bstrString := bstrString is Win32Handle ? NumGet(bstrString, "ptr") : bstrString

        DllCall("OLEAUT32.dll\SysReleaseString", "ptr", bstrString)
    }

    /**
     * Deallocates a string allocated previously by SysAllocString, SysAllocStringByteLen, SysReAllocString, SysAllocStringLen, or SysReAllocStringLen.
     * @param {BSTR} bstrString The previously allocated string. If this parameter is <b>NULL</b>, the function simply returns.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-sysfreestring
     */
    static SysFreeString(bstrString) {
        bstrString := bstrString is Win32Handle ? NumGet(bstrString, "ptr") : bstrString

        DllCall("OLEAUT32.dll\SysFreeString", "ptr", bstrString)
    }

    /**
     * Returns the length of a BSTR.
     * @param {BSTR} pbstr A previously allocated string.
     * @returns {Integer} The number of characters in <i>bstr</i>, not including the terminating null character. If <i>bstr</i> is null the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-sysstringlen
     */
    static SysStringLen(pbstr) {
        pbstr := pbstr is Win32Handle ? NumGet(pbstr, "ptr") : pbstr

        result := DllCall("OLEAUT32.dll\SysStringLen", "ptr", pbstr, "uint")
        return result
    }

    /**
     * Returns the length (in bytes) of a BSTR.
     * @param {BSTR} bstr A previously allocated string.
     * @returns {Integer} The number of bytes in <i>bstr</i>, not including the terminating null character. If <i>bstr</i> is null the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-sysstringbytelen
     */
    static SysStringByteLen(bstr) {
        bstr := bstr is Win32Handle ? NumGet(bstr, "ptr") : bstr

        result := DllCall("OLEAUT32.dll\SysStringByteLen", "ptr", bstr, "uint")
        return result
    }

    /**
     * Takes an ANSI string as input, and returns a BSTR that contains an ANSI string. Does not perform any ANSI-to-Unicode translation.
     * @param {PSTR} psz The string to copy, or NULL to keep the string uninitialized.
     * @param {Integer} len The number of bytes to copy. A null character is placed afterwards, allocating a total of <i>len</i> plus the size of <b>OLECHAR</b> bytes.
     * @returns {BSTR} A copy of the string, or NULL if there is insufficient memory to complete the operation.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-sysallocstringbytelen
     */
    static SysAllocStringByteLen(psz, len) {
        psz := psz is String ? StrPtr(psz) : psz

        result := DllCall("OLEAUT32.dll\SysAllocStringByteLen", "ptr", psz, "uint", len, "ptr")
        resultHandle := BSTR({Value: result}, True)
        return resultHandle
    }

    /**
     * Closes an open object handle.
     * @param {HANDLE} hObject A valid handle to an open object.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the application is running under a debugger,  the function will throw an exception if it receives either a  handle value that is not valid  or a pseudo-handle value. This can happen if you close a handle twice, or if you  call 
     * <b>CloseHandle</b> on a handle returned by the 
     * <a href="/windows/desktop/api/fileapi/nf-fileapi-findfirstfilea">FindFirstFile</a> function instead of calling the <a href="/windows/desktop/api/fileapi/nf-fileapi-findclose">FindClose</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//handleapi/nf-handleapi-closehandle
     * @since windows5.0
     */
    static CloseHandle(hObject) {
        hObject := hObject is Win32Handle ? NumGet(hObject, "ptr") : hObject

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CloseHandle", "ptr", hObject, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Duplicates an object handle.
     * @param {HANDLE} hSourceProcessHandle A handle to the process with the handle to be duplicated. 
     * 
     * 
     * 
     * 
     * The handle must have the PROCESS_DUP_HANDLE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {HANDLE} hSourceHandle The handle to be duplicated. This is an open object handle that is valid in the context of the source process. For a list of objects whose handles can be duplicated, see the following Remarks section.
     * @param {HANDLE} hTargetProcessHandle A handle to the process that is to receive the duplicated handle. The handle must have the PROCESS_DUP_HANDLE access right.
     * 
     * This parameter is optional and can be specified as NULL if the **DUPLICATE_CLOSE_SOURCE** flag is set in _Options_.
     * @param {Pointer<HANDLE>} lpTargetHandle A pointer to a variable that receives the duplicate handle. This handle value is valid in the context of the target process. 
     * 
     * If <i>hSourceHandle</i> is a pseudo handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> or <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthread">GetCurrentThread</a>, <b>DuplicateHandle</b> converts it to a real handle to a process or thread, respectively.
     * 
     * If <i>lpTargetHandle</i> is <b>NULL</b>, the function duplicates the handle, but does not return the duplicate handle value to the caller. This behavior exists only for backward compatibility with previous versions of this function. You should not use this feature, as you will lose system resources until the target process terminates.
     * 
     * This parameter is ignored if _hTargetProcessHandle_ is **NULL**.
     * @param {Integer} dwDesiredAccess The access requested for the new handle. For the flags that can be specified for each object type, see the following Remarks section. 
     * 
     * This parameter is ignored if the <i>dwOptions</i> parameter specifies the DUPLICATE_SAME_ACCESS flag. Otherwise, the flags that can be specified depend on the type of object whose handle is to be duplicated.
     * 
     * This parameter is ignored if _hTargetProcessHandle_ is **NULL**.
     * @param {BOOL} bInheritHandle A variable that indicates whether the handle is inheritable. If <b>TRUE</b>, the duplicate handle can be inherited by new processes created by the target process. If <b>FALSE</b>, the new handle cannot be inherited.
     * 
     * This parameter is ignored if _hTargetProcessHandle_ is **NULL**.
     * @param {Integer} dwOptions 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//handleapi/nf-handleapi-duplicatehandle
     * @since windows5.0
     */
    static DuplicateHandle(hSourceProcessHandle, hSourceHandle, hTargetProcessHandle, lpTargetHandle, dwDesiredAccess, bInheritHandle, dwOptions) {
        hSourceProcessHandle := hSourceProcessHandle is Win32Handle ? NumGet(hSourceProcessHandle, "ptr") : hSourceProcessHandle
        hSourceHandle := hSourceHandle is Win32Handle ? NumGet(hSourceHandle, "ptr") : hSourceHandle
        hTargetProcessHandle := hTargetProcessHandle is Win32Handle ? NumGet(hTargetProcessHandle, "ptr") : hTargetProcessHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\DuplicateHandle", "ptr", hSourceProcessHandle, "ptr", hSourceHandle, "ptr", hTargetProcessHandle, "ptr", lpTargetHandle, "uint", dwDesiredAccess, "int", bInheritHandle, "uint", dwOptions, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Compares two object handles to determine if they refer to the same underlying kernel object.
     * @param {HANDLE} hFirstObjectHandle The first object handle to compare.
     * @param {HANDLE} hSecondObjectHandle The second object handle to compare.
     * @returns {BOOL} A Boolean value that indicates if the two handles refer to the same underlying kernel object. TRUE if the same, otherwise FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//handleapi/nf-handleapi-compareobjecthandles
     * @since windows10.0.10240
     */
    static CompareObjectHandles(hFirstObjectHandle, hSecondObjectHandle) {
        hFirstObjectHandle := hFirstObjectHandle is Win32Handle ? NumGet(hFirstObjectHandle, "ptr") : hFirstObjectHandle
        hSecondObjectHandle := hSecondObjectHandle is Win32Handle ? NumGet(hSecondObjectHandle, "ptr") : hSecondObjectHandle

        result := DllCall("api-ms-win-core-handle-l1-1-0.dll\CompareObjectHandles", "ptr", hFirstObjectHandle, "ptr", hSecondObjectHandle, "int")
        return result
    }

    /**
     * Retrieves certain properties of an object handle.
     * @param {HANDLE} hObject A handle to an object whose information is to be retrieved. 
     * 
     * 
     * 
     * 
     * You can specify a handle to one of the following types of objects: access token, console input buffer, console screen buffer, event, file, file mapping, job, mailslot, mutex, pipe, printer, process, registry key, semaphore, serial communication device, socket, thread, or waitable timer.
     * @param {Pointer<Integer>} lpdwFlags A pointer to a variable that receives a set of bit flags that specify properties of the object handle or 0. The following values are defined. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HANDLE_FLAG_INHERIT"></a><a id="handle_flag_inherit"></a><dl>
     * <dt><b>HANDLE_FLAG_INHERIT</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, a child process created with the <i>bInheritHandles</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> set to <b>TRUE</b> will inherit the object handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HANDLE_FLAG_PROTECT_FROM_CLOSE"></a><a id="handle_flag_protect_from_close"></a><dl>
     * <dt><b>HANDLE_FLAG_PROTECT_FROM_CLOSE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function will not close the object handle.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//handleapi/nf-handleapi-gethandleinformation
     * @since windows5.0
     */
    static GetHandleInformation(hObject, lpdwFlags) {
        hObject := hObject is Win32Handle ? NumGet(hObject, "ptr") : hObject

        lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetHandleInformation", "ptr", hObject, lpdwFlagsMarshal, lpdwFlags, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets certain properties of an object handle.
     * @param {HANDLE} hObject A handle to an object whose information is to be set. 
     * 
     * 
     * 
     * 
     * You can specify a handle to one of the following types of objects: access token, console input buffer, console screen buffer, event, file, file mapping, job, mailslot, mutex, pipe, printer, process, registry key, semaphore, serial communication device, socket, thread, or waitable timer.
     * @param {Integer} dwMask A mask that specifies the bit flags to be changed. Use the same constants shown in the description of <i>dwFlags</i>.
     * @param {Integer} dwFlags 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//handleapi/nf-handleapi-sethandleinformation
     * @since windows5.0
     */
    static SetHandleInformation(hObject, dwMask, dwFlags) {
        hObject := hObject is Win32Handle ? NumGet(hObject, "ptr") : hObject

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetHandleInformation", "ptr", hObject, "uint", dwMask, "uint", dwFlags, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Frees the loaded dynamic-link library (DLL) module and, if necessary, decrements its reference count.
     * @param {HMODULE} hLibModule A handle to the loaded library module. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>, <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>,  
     * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandleexa">GetModuleHandleEx</a> function returns this handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-freelibrary
     * @since windows5.1.2600
     */
    static FreeLibrary(hLibModule) {
        hLibModule := hLibModule is Win32Handle ? NumGet(hLibModule, "ptr") : hLibModule

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FreeLibrary", "ptr", hLibModule, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the calling thread's last-error code value.
     * @returns {Integer} The return value is the calling thread's last-error code.
     * 
     * The Return Value section of the documentation for each function that sets the last-error code notes the conditions under which the function sets the last-error code. Most functions that set the thread's last-error code set it when they fail. However, some functions also set the last-error code when they succeed. If the function is not documented to set the last-error code, the value returned by this function is simply the most recent last-error code to have been set; some functions set the last-error code to 0 on success and others do not.
     * @see https://docs.microsoft.com/windows/win32/api//errhandlingapi/nf-errhandlingapi-getlasterror
     * @since windows5.1.2600
     */
    static GetLastError() {
        result := DllCall("KERNEL32.dll\GetLastError", "uint")
        return result
    }

    /**
     * Sets the last-error code for the calling thread.
     * @remarks
     * 
     * The last-error code is kept in thread local storage so that multiple threads do not overwrite each other's values.
     * 
     * Most functions call 
     * <b>SetLastError</b> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setlasterrorex">SetLastErrorEx</a> only when they fail. However, some system functions call 
     * <b>SetLastError</b> or <b>SetLastErrorEx</b> under conditions of success; those cases are noted in each function's documentation.
     * 
     * Applications can optionally retrieve the value set by this function by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function immediately after a function fails.
     * 
     * Error codes are 32-bit values (bit 31 is the most significant bit). Bit 29 is reserved for application-defined error codes; no system error code has this bit set. If you are defining an error code for your application, set this bit to indicate that the error code has been defined by your application and to ensure that your error code does not conflict with any system-defined error codes.
     * 
     * 
     * @param {Integer} dwErrCode The last-error code for the thread.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//errhandlingapi/nf-errhandlingapi-setlasterror
     * @since windows5.1.2600
     */
    static SetLastError(dwErrCode) {
        A_LastError := 0

        DllCall("KERNEL32.dll\SetLastError", "uint", dwErrCode)
        if(A_LastError) {
            throw OSError(A_LastError)
        }

    }

    /**
     * Sets the last-error code.
     * @remarks
     * 
     * The last-error code is kept in thread local storage so that multiple threads do not overwrite each other's values.
     * 
     * Most functions call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> or <b>SetLastErrorEx</b> only when they fail. However, some system functions call 
     * <b>SetLastError</b> or <b>SetLastErrorEx</b> under conditions of success; those cases are noted in each function's documentation.
     * 
     * Applications can optionally retrieve the value set by this function by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function immediately after a function fails.
     * 
     * Error codes are 32-bit values (bit 31 is the most significant bit). Bit 29 is reserved for application-defined error codes; no system error code has this bit set. If you are defining an error code for your application, set this bit to indicate that the error code has been defined by the application and to ensure that your error code does not conflict with any system-defined error codes.
     * 
     * 
     * @param {Integer} dwErrCode The last-error code for the thread.
     * @param {Integer} dwType This parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setlasterrorex
     * @since windows5.1.2600
     */
    static SetLastErrorEx(dwErrCode, dwType) {
        A_LastError := 0

        DllCall("USER32.dll\SetLastErrorEx", "uint", dwErrCode, "uint", dwType)
        if(A_LastError) {
            throw OSError(A_LastError)
        }

    }

    /**
     * Frees the specified global memory object and invalidates its handle.
     * @param {HGLOBAL} hMem A handle to the global memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function. It is not safe to free memory allocated with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a>.
     * @returns {HGLOBAL} If the function succeeds, the return value is <b>NULL</b>.
     * 
     * If the function fails, the return value is equal to a handle to the global memory object. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globalfree
     * @since windows5.1.2600
     */
    static GlobalFree(hMem) {
        hMem := hMem is Win32Handle ? NumGet(hMem, "ptr") : hMem

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalFree", "ptr", hMem, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HGLOBAL({Value: result}, True)
        return resultHandle
    }

    /**
     * Frees the specified local memory object and invalidates its handle.
     * @param {HLOCAL} hMem A handle to the local memory object. This handle is returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localrealloc">LocalReAlloc</a> function. It is not safe to free memory allocated with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a>.
     * @returns {HLOCAL} If the function succeeds, the return value is <b>NULL</b>.
     * 
     * If the function fails, the return value is equal to a handle to the local memory object. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-localfree
     * @since windows5.1.2600
     */
    static LocalFree(hMem) {
        hMem := hMem is Win32Handle ? NumGet(hMem, "ptr") : hMem

        A_LastError := 0

        result := DllCall("KERNEL32.dll\LocalFree", "ptr", hMem, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        resultHandle := HLOCAL({Value: result}, True)
        return resultHandle
    }

    /**
     * Converts the specified NTSTATUS code to its equivalent system error code.
     * @param {NTSTATUS} Status The NTSTATUS code to be converted.
     * @returns {Integer} The function returns the corresponding <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winternl/nf-winternl-rtlntstatustodoserror
     * @since windows5.1.2600
     */
    static RtlNtStatusToDosError(Status) {
        result := DllCall("ntdll.dll\RtlNtStatusToDosError", "int", Status, "uint")
        return result
    }

;@endregion Methods
}
