#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class DEBUG_FLR_PARAM_TYPE extends Win32Enum {

    /**
     * Native name: DEBUG_FLR_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * Native name: DEBUG_FLR_RESERVED
     * @type {Integer (Int32)}
     */
    static RESERVED => 1

    /**
     * Native name: DEBUG_FLR_DRIVER_OBJECT
     * @type {Integer (Int32)}
     */
    static DRIVER_OBJECT => 2

    /**
     * Native name: DEBUG_FLR_DEVICE_OBJECT
     * @type {Integer (Int32)}
     */
    static DEVICE_OBJECT => 3

    /**
     * Native name: DEBUG_FLR_INVALID_PFN
     * @type {Integer (Int32)}
     */
    static INVALID_PFN => 4

    /**
     * Native name: DEBUG_FLR_WORKER_ROUTINE
     * @type {Integer (Int32)}
     */
    static WORKER_ROUTINE => 5

    /**
     * Native name: DEBUG_FLR_WORK_ITEM
     * @type {Integer (Int32)}
     */
    static WORK_ITEM => 6

    /**
     * Native name: DEBUG_FLR_INVALID_DPC_FOUND
     * @type {Integer (Int32)}
     */
    static INVALID_DPC_FOUND => 7

    /**
     * Native name: DEBUG_FLR_PROCESS_OBJECT
     * @type {Integer (Int32)}
     */
    static PROCESS_OBJECT => 8

    /**
     * Native name: DEBUG_FLR_FAILED_INSTRUCTION_ADDRESS
     * @type {Integer (Int32)}
     */
    static FAILED_INSTRUCTION_ADDRESS => 9

    /**
     * Native name: DEBUG_FLR_LAST_CONTROL_TRANSFER
     * @type {Integer (Int32)}
     */
    static LAST_CONTROL_TRANSFER => 10

    /**
     * Native name: DEBUG_FLR_ACPI_EXTENSION
     * @type {Integer (Int32)}
     */
    static ACPI_EXTENSION => 11

    /**
     * Native name: DEBUG_FLR_ACPI_RESCONFLICT
     * @type {Integer (Int32)}
     */
    static ACPI_RESCONFLICT => 12

    /**
     * Native name: DEBUG_FLR_ACPI_OBJECT
     * @type {Integer (Int32)}
     */
    static ACPI_OBJECT => 13

    /**
     * Native name: DEBUG_FLR_READ_ADDRESS
     * @type {Integer (Int32)}
     */
    static READ_ADDRESS => 14

    /**
     * Native name: DEBUG_FLR_WRITE_ADDRESS
     * @type {Integer (Int32)}
     */
    static WRITE_ADDRESS => 15

    /**
     * Native name: DEBUG_FLR_CRITICAL_SECTION
     * @type {Integer (Int32)}
     */
    static CRITICAL_SECTION => 16

    /**
     * Native name: DEBUG_FLR_BAD_HANDLE
     * @type {Integer (Int32)}
     */
    static BAD_HANDLE => 17

    /**
     * Native name: DEBUG_FLR_INVALID_HEAP_ADDRESS
     * @type {Integer (Int32)}
     */
    static INVALID_HEAP_ADDRESS => 18

    /**
     * Native name: DEBUG_FLR_CHKIMG_EXTENSION
     * @type {Integer (Int32)}
     */
    static CHKIMG_EXTENSION => 19

    /**
     * Native name: DEBUG_FLR_USBPORT_OCADATA
     * @type {Integer (Int32)}
     */
    static USBPORT_OCADATA => 20

    /**
     * Native name: DEBUG_FLR_WORK_QUEUE_ITEM
     * @type {Integer (Int32)}
     */
    static WORK_QUEUE_ITEM => 21

    /**
     * Native name: DEBUG_FLR_ERESOURCE_ADDRESS
     * @type {Integer (Int32)}
     */
    static ERESOURCE_ADDRESS => 22

    /**
     * Native name: DEBUG_FLR_PNP_TRIAGE_DATA_DEPRECATED
     * @type {Integer (Int32)}
     */
    static PNP_TRIAGE_DATA_DEPRECATED => 23

    /**
     * Native name: DEBUG_FLR_HANDLE_VALUE
     * @type {Integer (Int32)}
     */
    static HANDLE_VALUE => 24

    /**
     * Native name: DEBUG_FLR_WHEA_ERROR_RECORD
     * @type {Integer (Int32)}
     */
    static WHEA_ERROR_RECORD => 25

    /**
     * Native name: DEBUG_FLR_VERIFIER_FOUND_DEADLOCK
     * @type {Integer (Int32)}
     */
    static VERIFIER_FOUND_DEADLOCK => 26

    /**
     * Native name: DEBUG_FLR_PG_MISMATCH
     * @type {Integer (Int32)}
     */
    static PG_MISMATCH => 27

    /**
     * Native name: DEBUG_FLR_DEVICE_NODE
     * @type {Integer (Int32)}
     */
    static DEVICE_NODE => 28

    /**
     * Native name: DEBUG_FLR_POWERREQUEST_ADDRESS
     * @type {Integer (Int32)}
     */
    static POWERREQUEST_ADDRESS => 29

    /**
     * Native name: DEBUG_FLR_EXECUTE_ADDRESS
     * @type {Integer (Int32)}
     */
    static EXECUTE_ADDRESS => 30

    /**
     * Native name: DEBUG_FLR_IRP_ADDRESS
     * @type {Integer (Int32)}
     */
    static IRP_ADDRESS => 256

    /**
     * Native name: DEBUG_FLR_IRP_MAJOR_FN
     * @type {Integer (Int32)}
     */
    static IRP_MAJOR_FN => 257

    /**
     * Native name: DEBUG_FLR_IRP_MINOR_FN
     * @type {Integer (Int32)}
     */
    static IRP_MINOR_FN => 258

    /**
     * Native name: DEBUG_FLR_IRP_CANCEL_ROUTINE
     * @type {Integer (Int32)}
     */
    static IRP_CANCEL_ROUTINE => 259

    /**
     * Native name: DEBUG_FLR_IOSB_ADDRESS
     * @type {Integer (Int32)}
     */
    static IOSB_ADDRESS => 260

    /**
     * Native name: DEBUG_FLR_INVALID_USEREVENT
     * @type {Integer (Int32)}
     */
    static INVALID_USEREVENT => 261

    /**
     * Native name: DEBUG_FLR_VIDEO_TDR_CONTEXT
     * @type {Integer (Int32)}
     */
    static VIDEO_TDR_CONTEXT => 262

    /**
     * Native name: DEBUG_FLR_VERIFIER_DRIVER_ENTRY
     * @type {Integer (Int32)}
     */
    static VERIFIER_DRIVER_ENTRY => 263

    /**
     * Native name: DEBUG_FLR_PNP_IRP_ADDRESS_DEPRECATED
     * @type {Integer (Int32)}
     */
    static PNP_IRP_ADDRESS_DEPRECATED => 264

    /**
     * Native name: DEBUG_FLR_PREVIOUS_MODE
     * @type {Integer (Int32)}
     */
    static PREVIOUS_MODE => 265

    /**
     * Native name: DEBUG_FLR_CURRENT_IRQL
     * @type {Integer (Int32)}
     */
    static CURRENT_IRQL => 512

    /**
     * Native name: DEBUG_FLR_PREVIOUS_IRQL
     * @type {Integer (Int32)}
     */
    static PREVIOUS_IRQL => 513

    /**
     * Native name: DEBUG_FLR_REQUESTED_IRQL
     * @type {Integer (Int32)}
     */
    static REQUESTED_IRQL => 514

    /**
     * Native name: DEBUG_FLR_ASSERT_DATA
     * @type {Integer (Int32)}
     */
    static ASSERT_DATA => 768

    /**
     * Native name: DEBUG_FLR_ASSERT_FILE
     * @type {Integer (Int32)}
     */
    static ASSERT_FILE => 769

    /**
     * Native name: DEBUG_FLR_EXCEPTION_PARAMETER1
     * @type {Integer (Int32)}
     */
    static EXCEPTION_PARAMETER1 => 770

    /**
     * Native name: DEBUG_FLR_EXCEPTION_PARAMETER2
     * @type {Integer (Int32)}
     */
    static EXCEPTION_PARAMETER2 => 771

    /**
     * Native name: DEBUG_FLR_EXCEPTION_PARAMETER3
     * @type {Integer (Int32)}
     */
    static EXCEPTION_PARAMETER3 => 772

    /**
     * Native name: DEBUG_FLR_EXCEPTION_PARAMETER4
     * @type {Integer (Int32)}
     */
    static EXCEPTION_PARAMETER4 => 773

    /**
     * Native name: DEBUG_FLR_EXCEPTION_RECORD
     * @type {Integer (Int32)}
     */
    static EXCEPTION_RECORD => 774

    /**
     * Native name: DEBUG_FLR_IO_ERROR_CODE
     * @type {Integer (Int32)}
     */
    static IO_ERROR_CODE => 775

    /**
     * Native name: DEBUG_FLR_EXCEPTION_STR
     * @type {Integer (Int32)}
     */
    static EXCEPTION_STR => 776

    /**
     * Native name: DEBUG_FLR_EXCEPTION_DOESNOT_MATCH_CODE
     * @type {Integer (Int32)}
     */
    static EXCEPTION_DOESNOT_MATCH_CODE => 777

    /**
     * Native name: DEBUG_FLR_ASSERT_INSTRUCTION
     * @type {Integer (Int32)}
     */
    static ASSERT_INSTRUCTION => 778

    /**
     * Native name: DEBUG_FLR_POOL_ADDRESS
     * @type {Integer (Int32)}
     */
    static POOL_ADDRESS => 1024

    /**
     * Native name: DEBUG_FLR_SPECIAL_POOL_CORRUPTION_TYPE
     * @type {Integer (Int32)}
     */
    static SPECIAL_POOL_CORRUPTION_TYPE => 1025

    /**
     * Native name: DEBUG_FLR_CORRUPTING_POOL_ADDRESS
     * @type {Integer (Int32)}
     */
    static CORRUPTING_POOL_ADDRESS => 1026

    /**
     * Native name: DEBUG_FLR_CORRUPTING_POOL_TAG
     * @type {Integer (Int32)}
     */
    static CORRUPTING_POOL_TAG => 1027

    /**
     * Native name: DEBUG_FLR_FREED_POOL_TAG
     * @type {Integer (Int32)}
     */
    static FREED_POOL_TAG => 1028

    /**
     * Native name: DEBUG_FLR_LEAKED_SESSION_POOL_TAG
     * @type {Integer (Int32)}
     */
    static LEAKED_SESSION_POOL_TAG => 1029

    /**
     * Native name: DEBUG_FLR_INSTR_SESSION_POOL_TAG
     * @type {Integer (Int32)}
     */
    static INSTR_SESSION_POOL_TAG => 1030

    /**
     * Native name: DEBUG_FLR_CLIENT_DRIVER
     * @type {Integer (Int32)}
     */
    static CLIENT_DRIVER => 1031

    /**
     * Native name: DEBUG_FLR_FILE_ID
     * @type {Integer (Int32)}
     */
    static FILE_ID => 1280

    /**
     * Native name: DEBUG_FLR_FILE_LINE
     * @type {Integer (Int32)}
     */
    static FILE_LINE => 1281

    /**
     * Native name: DEBUG_FLR_BUGCHECK_STR
     * @type {Integer (Int32)}
     */
    static BUGCHECK_STR => 1536

    /**
     * Native name: DEBUG_FLR_BUGCHECK_SPECIFIER
     * @type {Integer (Int32)}
     */
    static BUGCHECK_SPECIFIER => 1537

    /**
     * Native name: DEBUG_FLR_BUGCHECK_DESC
     * @type {Integer (Int32)}
     */
    static BUGCHECK_DESC => 1538

    /**
     * Native name: DEBUG_FLR_MANAGED_CODE
     * @type {Integer (Int32)}
     */
    static MANAGED_CODE => 1792

    /**
     * Native name: DEBUG_FLR_MANAGED_OBJECT
     * @type {Integer (Int32)}
     */
    static MANAGED_OBJECT => 1793

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_OBJECT
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_OBJECT => 1794

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_MESSAGE_deprecated
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_MESSAGE_deprecated => 1795

    /**
     * Native name: DEBUG_FLR_MANAGED_STACK_STRING
     * @type {Integer (Int32)}
     */
    static MANAGED_STACK_STRING => 1796

    /**
     * Native name: DEBUG_FLR_MANAGED_BITNESS_MISMATCH
     * @type {Integer (Int32)}
     */
    static MANAGED_BITNESS_MISMATCH => 1797

    /**
     * Native name: DEBUG_FLR_MANAGED_OBJECT_NAME
     * @type {Integer (Int32)}
     */
    static MANAGED_OBJECT_NAME => 1798

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_CONTEXT_MESSAGE
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_CONTEXT_MESSAGE => 1799

    /**
     * Native name: DEBUG_FLR_MANAGED_STACK_COMMAND
     * @type {Integer (Int32)}
     */
    static MANAGED_STACK_COMMAND => 1800

    /**
     * Native name: DEBUG_FLR_MANAGED_KERNEL_DEBUGGER
     * @type {Integer (Int32)}
     */
    static MANAGED_KERNEL_DEBUGGER => 1801

    /**
     * Native name: DEBUG_FLR_MANAGED_HRESULT_STRING
     * @type {Integer (Int32)}
     */
    static MANAGED_HRESULT_STRING => 1802

    /**
     * Native name: DEBUG_FLR_MANAGED_ENGINE_MODULE
     * @type {Integer (Int32)}
     */
    static MANAGED_ENGINE_MODULE => 1803

    /**
     * Native name: DEBUG_FLR_MANAGED_ANALYSIS_PROVIDER
     * @type {Integer (Int32)}
     */
    static MANAGED_ANALYSIS_PROVIDER => 1804

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_ADDRESS
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_ADDRESS => 2048

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_HRESULT
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_HRESULT => 2049

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_TYPE
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_TYPE => 2050

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_MESSAGE
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_MESSAGE => 2051

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_CALLSTACK
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_CALLSTACK => 2052

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_INNER_ADDRESS
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_INNER_ADDRESS => 2064

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_INNER_HRESULT
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_INNER_HRESULT => 2065

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_INNER_TYPE
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_INNER_TYPE => 2066

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_INNER_MESSAGE
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_INNER_MESSAGE => 2067

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_INNER_CALLSTACK
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_INNER_CALLSTACK => 2068

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_NESTED_ADDRESS
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_NESTED_ADDRESS => 2080

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_NESTED_HRESULT
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_NESTED_HRESULT => 2081

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_NESTED_TYPE
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_NESTED_TYPE => 2082

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_NESTED_MESSAGE
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_NESTED_MESSAGE => 2083

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_NESTED_CALLSTACK
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_NESTED_CALLSTACK => 2084

    /**
     * Native name: DEBUG_FLR_MANAGED_EXCEPTION_CMD
     * @type {Integer (Int32)}
     */
    static MANAGED_EXCEPTION_CMD => 2288

    /**
     * Native name: DEBUG_FLR_MANAGED_THREAD_ID
     * @type {Integer (Int32)}
     */
    static MANAGED_THREAD_ID => 2304

    /**
     * Native name: DEBUG_FLR_MANAGED_THREAD_CMD_CALLSTACK
     * @type {Integer (Int32)}
     */
    static MANAGED_THREAD_CMD_CALLSTACK => 2544

    /**
     * Native name: DEBUG_FLR_MANAGED_THREAD_CMD_STACKOBJECTS
     * @type {Integer (Int32)}
     */
    static MANAGED_THREAD_CMD_STACKOBJECTS => 2545

    /**
     * Native name: DEBUG_FLR_DRIVER_VERIFIER_IO_VIOLATION_TYPE
     * @type {Integer (Int32)}
     */
    static DRIVER_VERIFIER_IO_VIOLATION_TYPE => 4096

    /**
     * Native name: DEBUG_FLR_EXCEPTION_CODE
     * @type {Integer (Int32)}
     */
    static EXCEPTION_CODE => 4097

    /**
     * Native name: DEBUG_FLR_EXCEPTION_CODE_STR
     * @type {Integer (Int32)}
     */
    static EXCEPTION_CODE_STR => 4098

    /**
     * Native name: DEBUG_FLR_IOCONTROL_CODE
     * @type {Integer (Int32)}
     */
    static IOCONTROL_CODE => 4099

    /**
     * Native name: DEBUG_FLR_MM_INTERNAL_CODE
     * @type {Integer (Int32)}
     */
    static MM_INTERNAL_CODE => 4100

    /**
     * Native name: DEBUG_FLR_DRVPOWERSTATE_SUBCODE
     * @type {Integer (Int32)}
     */
    static DRVPOWERSTATE_SUBCODE => 4101

    /**
     * Native name: DEBUG_FLR_STATUS_CODE
     * @type {Integer (Int32)}
     */
    static STATUS_CODE => 4102

    /**
     * Native name: DEBUG_FLR_SYMBOL_STACK_INDEX
     * @type {Integer (Int32)}
     */
    static SYMBOL_STACK_INDEX => 4103

    /**
     * Native name: DEBUG_FLR_SYMBOL_ON_RAW_STACK
     * @type {Integer (Int32)}
     */
    static SYMBOL_ON_RAW_STACK => 4104

    /**
     * Native name: DEBUG_FLR_SECURITY_COOKIES
     * @type {Integer (Int32)}
     */
    static SECURITY_COOKIES => 4105

    /**
     * Native name: DEBUG_FLR_THREADPOOL_WAITER
     * @type {Integer (Int32)}
     */
    static THREADPOOL_WAITER => 4106

    /**
     * Native name: DEBUG_FLR_TARGET_MODE
     * @type {Integer (Int32)}
     */
    static TARGET_MODE => 4107

    /**
     * Native name: DEBUG_FLR_BUGCHECK_CODE
     * @type {Integer (Int32)}
     */
    static BUGCHECK_CODE => 4108

    /**
     * Native name: DEBUG_FLR_BADPAGES_DETECTED
     * @type {Integer (Int32)}
     */
    static BADPAGES_DETECTED => 4109

    /**
     * Native name: DEBUG_FLR_DPC_TIMEOUT_TYPE
     * @type {Integer (Int32)}
     */
    static DPC_TIMEOUT_TYPE => 4110

    /**
     * Native name: DEBUG_FLR_DPC_RUNTIME
     * @type {Integer (Int32)}
     */
    static DPC_RUNTIME => 4111

    /**
     * Native name: DEBUG_FLR_DPC_TIMELIMIT
     * @type {Integer (Int32)}
     */
    static DPC_TIMELIMIT => 4112

    /**
     * Native name: DEBUG_FLR_DUMP_FILE_ATTRIBUTES
     * @type {Integer (Int32)}
     */
    static DUMP_FILE_ATTRIBUTES => 4113

    /**
     * Native name: DEBUG_FLR_PAGE_HASH_ERRORS
     * @type {Integer (Int32)}
     */
    static PAGE_HASH_ERRORS => 4114

    /**
     * Native name: DEBUG_FLR_BUGCHECK_P1
     * @type {Integer (Int32)}
     */
    static BUGCHECK_P1 => 4115

    /**
     * Native name: DEBUG_FLR_BUGCHECK_P2
     * @type {Integer (Int32)}
     */
    static BUGCHECK_P2 => 4116

    /**
     * Native name: DEBUG_FLR_BUGCHECK_P3
     * @type {Integer (Int32)}
     */
    static BUGCHECK_P3 => 4117

    /**
     * Native name: DEBUG_FLR_BUGCHECK_P4
     * @type {Integer (Int32)}
     */
    static BUGCHECK_P4 => 4118

    /**
     * Native name: DEBUG_FLR_CRITICAL_PROCESS
     * @type {Integer (Int32)}
     */
    static CRITICAL_PROCESS => 4119

    /**
     * Native name: DEBUG_FLR_RESOURCE_CALL_TYPE
     * @type {Integer (Int32)}
     */
    static RESOURCE_CALL_TYPE => 4352

    /**
     * Native name: DEBUG_FLR_RESOURCE_CALL_TYPE_STR
     * @type {Integer (Int32)}
     */
    static RESOURCE_CALL_TYPE_STR => 4353

    /**
     * Native name: DEBUG_FLR_CORRUPT_MODULE_LIST
     * @type {Integer (Int32)}
     */
    static CORRUPT_MODULE_LIST => 8192

    /**
     * Native name: DEBUG_FLR_BAD_STACK
     * @type {Integer (Int32)}
     */
    static BAD_STACK => 8193

    /**
     * Native name: DEBUG_FLR_ZEROED_STACK
     * @type {Integer (Int32)}
     */
    static ZEROED_STACK => 8194

    /**
     * Native name: DEBUG_FLR_WRONG_SYMBOLS
     * @type {Integer (Int32)}
     */
    static WRONG_SYMBOLS => 8195

    /**
     * Native name: DEBUG_FLR_FOLLOWUP_DRIVER_ONLY
     * @type {Integer (Int32)}
     */
    static FOLLOWUP_DRIVER_ONLY => 8196

    /**
     * Native name: DEBUG_FLR_UNUSED001
     * @type {Integer (Int32)}
     */
    static UNUSED001 => 8197

    /**
     * Native name: DEBUG_FLR_CPU_OVERCLOCKED
     * @type {Integer (Int32)}
     */
    static CPU_OVERCLOCKED => 8198

    /**
     * Native name: DEBUG_FLR_POSSIBLE_INVALID_CONTROL_TRANSFER
     * @type {Integer (Int32)}
     */
    static POSSIBLE_INVALID_CONTROL_TRANSFER => 8199

    /**
     * Native name: DEBUG_FLR_POISONED_TB
     * @type {Integer (Int32)}
     */
    static POISONED_TB => 8200

    /**
     * Native name: DEBUG_FLR_UNKNOWN_MODULE
     * @type {Integer (Int32)}
     */
    static UNKNOWN_MODULE => 8201

    /**
     * Native name: DEBUG_FLR_ANALYZABLE_POOL_CORRUPTION
     * @type {Integer (Int32)}
     */
    static ANALYZABLE_POOL_CORRUPTION => 8202

    /**
     * Native name: DEBUG_FLR_SINGLE_BIT_ERROR
     * @type {Integer (Int32)}
     */
    static SINGLE_BIT_ERROR => 8203

    /**
     * Native name: DEBUG_FLR_TWO_BIT_ERROR
     * @type {Integer (Int32)}
     */
    static TWO_BIT_ERROR => 8204

    /**
     * Native name: DEBUG_FLR_INVALID_KERNEL_CONTEXT
     * @type {Integer (Int32)}
     */
    static INVALID_KERNEL_CONTEXT => 8205

    /**
     * Native name: DEBUG_FLR_DISK_HARDWARE_ERROR
     * @type {Integer (Int32)}
     */
    static DISK_HARDWARE_ERROR => 8206

    /**
     * Native name: DEBUG_FLR_SHOW_ERRORLOG
     * @type {Integer (Int32)}
     */
    static SHOW_ERRORLOG => 8207

    /**
     * Native name: DEBUG_FLR_MANUAL_BREAKIN
     * @type {Integer (Int32)}
     */
    static MANUAL_BREAKIN => 8208

    /**
     * Native name: DEBUG_FLR_HANG
     * @type {Integer (Int32)}
     */
    static HANG => 8209

    /**
     * Native name: DEBUG_FLR_BAD_MEMORY_REFERENCE
     * @type {Integer (Int32)}
     */
    static BAD_MEMORY_REFERENCE => 8210

    /**
     * Native name: DEBUG_FLR_BAD_OBJECT_REFERENCE
     * @type {Integer (Int32)}
     */
    static BAD_OBJECT_REFERENCE => 8211

    /**
     * Native name: DEBUG_FLR_APPKILL
     * @type {Integer (Int32)}
     */
    static APPKILL => 8212

    /**
     * Native name: DEBUG_FLR_SINGLE_BIT_PFN_PAGE_ERROR
     * @type {Integer (Int32)}
     */
    static SINGLE_BIT_PFN_PAGE_ERROR => 8213

    /**
     * Native name: DEBUG_FLR_HARDWARE_ERROR
     * @type {Integer (Int32)}
     */
    static HARDWARE_ERROR => 8214

    /**
     * Native name: DEBUG_FLR_NO_IMAGE_IN_BUCKET
     * @type {Integer (Int32)}
     */
    static NO_IMAGE_IN_BUCKET => 8215

    /**
     * Native name: DEBUG_FLR_NO_BUGCHECK_IN_BUCKET
     * @type {Integer (Int32)}
     */
    static NO_BUGCHECK_IN_BUCKET => 8216

    /**
     * Native name: DEBUG_FLR_SKIP_STACK_ANALYSIS
     * @type {Integer (Int32)}
     */
    static SKIP_STACK_ANALYSIS => 8217

    /**
     * Native name: DEBUG_FLR_INVALID_OPCODE
     * @type {Integer (Int32)}
     */
    static INVALID_OPCODE => 8218

    /**
     * Native name: DEBUG_FLR_ADD_PROCESS_IN_BUCKET
     * @type {Integer (Int32)}
     */
    static ADD_PROCESS_IN_BUCKET => 8219

    /**
     * Native name: DEBUG_FLR_RAISED_IRQL_USER_FAULT
     * @type {Integer (Int32)}
     */
    static RAISED_IRQL_USER_FAULT => 8220

    /**
     * Native name: DEBUG_FLR_USE_DEFAULT_CONTEXT
     * @type {Integer (Int32)}
     */
    static USE_DEFAULT_CONTEXT => 8221

    /**
     * Native name: DEBUG_FLR_BOOST_FOLLOWUP_TO_SPECIFIC
     * @type {Integer (Int32)}
     */
    static BOOST_FOLLOWUP_TO_SPECIFIC => 8222

    /**
     * Native name: DEBUG_FLR_SWITCH_PROCESS_CONTEXT
     * @type {Integer (Int32)}
     */
    static SWITCH_PROCESS_CONTEXT => 8223

    /**
     * Native name: DEBUG_FLR_VERIFIER_STOP
     * @type {Integer (Int32)}
     */
    static VERIFIER_STOP => 8224

    /**
     * Native name: DEBUG_FLR_USERBREAK_PEB_PAGEDOUT
     * @type {Integer (Int32)}
     */
    static USERBREAK_PEB_PAGEDOUT => 8225

    /**
     * Native name: DEBUG_FLR_MOD_SPECIFIC_DATA_ONLY
     * @type {Integer (Int32)}
     */
    static MOD_SPECIFIC_DATA_ONLY => 8226

    /**
     * Native name: DEBUG_FLR_OVERLAPPED_MODULE
     * @type {Integer (Int32)}
     */
    static OVERLAPPED_MODULE => 8227

    /**
     * Native name: DEBUG_FLR_CPU_MICROCODE_ZERO_INTEL
     * @type {Integer (Int32)}
     */
    static CPU_MICROCODE_ZERO_INTEL => 8228

    /**
     * Native name: DEBUG_FLR_INTEL_CPU_BIOS_UPGRADE_NEEDED
     * @type {Integer (Int32)}
     */
    static INTEL_CPU_BIOS_UPGRADE_NEEDED => 8229

    /**
     * Native name: DEBUG_FLR_OVERLAPPED_UNLOADED_MODULE
     * @type {Integer (Int32)}
     */
    static OVERLAPPED_UNLOADED_MODULE => 8230

    /**
     * Native name: DEBUG_FLR_INVALID_USER_CONTEXT
     * @type {Integer (Int32)}
     */
    static INVALID_USER_CONTEXT => 8231

    /**
     * Native name: DEBUG_FLR_MILCORE_BREAK
     * @type {Integer (Int32)}
     */
    static MILCORE_BREAK => 8232

    /**
     * Native name: DEBUG_FLR_NO_IMAGE_TIMESTAMP_IN_BUCKET
     * @type {Integer (Int32)}
     */
    static NO_IMAGE_TIMESTAMP_IN_BUCKET => 8233

    /**
     * Native name: DEBUG_FLR_KERNEL_VERIFIER_ENABLED
     * @type {Integer (Int32)}
     */
    static KERNEL_VERIFIER_ENABLED => 8234

    /**
     * Native name: DEBUG_FLR_SKIP_CORRUPT_MODULE_DETECTION
     * @type {Integer (Int32)}
     */
    static SKIP_CORRUPT_MODULE_DETECTION => 8235

    /**
     * Native name: DEBUG_FLR_GSFAILURE_FALSE_POSITIVE
     * @type {Integer (Int32)}
     */
    static GSFAILURE_FALSE_POSITIVE => 8236

    /**
     * Native name: DEBUG_FLR_IGNORE_LARGE_MODULE_CORRUPTION
     * @type {Integer (Int32)}
     */
    static IGNORE_LARGE_MODULE_CORRUPTION => 8237

    /**
     * Native name: DEBUG_FLR_IGNORE_BUCKET_ID_OFFSET
     * @type {Integer (Int32)}
     */
    static IGNORE_BUCKET_ID_OFFSET => 8238

    /**
     * Native name: DEBUG_FLR_NO_ARCH_IN_BUCKET
     * @type {Integer (Int32)}
     */
    static NO_ARCH_IN_BUCKET => 8239

    /**
     * Native name: DEBUG_FLR_IGNORE_MODULE_HARDWARE_ID
     * @type {Integer (Int32)}
     */
    static IGNORE_MODULE_HARDWARE_ID => 8240

    /**
     * Native name: DEBUG_FLR_ARM_WRITE_AV_CAVEAT
     * @type {Integer (Int32)}
     */
    static ARM_WRITE_AV_CAVEAT => 8241

    /**
     * Native name: DEBUG_FLR_ON_DPC_STACK
     * @type {Integer (Int32)}
     */
    static ON_DPC_STACK => 8242

    /**
     * Native name: DEBUG_FLR_LIVE_KERNEL_DUMP
     * @type {Integer (Int32)}
     */
    static LIVE_KERNEL_DUMP => 8243

    /**
     * Native name: DEBUG_FLR_COVERAGE_BUILD
     * @type {Integer (Int32)}
     */
    static COVERAGE_BUILD => 8244

    /**
     * Native name: DEBUG_FLR_POSSIBLE_STACK_OVERFLOW
     * @type {Integer (Int32)}
     */
    static POSSIBLE_STACK_OVERFLOW => 8245

    /**
     * Native name: DEBUG_FLR_WRONG_SYMBOLS_TIMESTAMP
     * @type {Integer (Int32)}
     */
    static WRONG_SYMBOLS_TIMESTAMP => 8246

    /**
     * Native name: DEBUG_FLR_WRONG_SYMBOLS_SIZE
     * @type {Integer (Int32)}
     */
    static WRONG_SYMBOLS_SIZE => 8247

    /**
     * Native name: DEBUG_FLR_MISSING_IMPORTANT_SYMBOL
     * @type {Integer (Int32)}
     */
    static MISSING_IMPORTANT_SYMBOL => 8248

    /**
     * Native name: DEBUG_FLR_MISSING_CLR_SYMBOL
     * @type {Integer (Int32)}
     */
    static MISSING_CLR_SYMBOL => 8249

    /**
     * Native name: DEBUG_FLR_TARGET_TIME
     * @type {Integer (Int32)}
     */
    static TARGET_TIME => 8250

    /**
     * Native name: DEBUG_FLR_LOW_SYSTEM_COMMIT
     * @type {Integer (Int32)}
     */
    static LOW_SYSTEM_COMMIT => 8251

    /**
     * Native name: DEBUG_FLR_LEGACY_PAGE_TABLE_ACCESS
     * @type {Integer (Int32)}
     */
    static LEGACY_PAGE_TABLE_ACCESS => 8252

    /**
     * Native name: DEBUG_FLR_HIGH_PROCESS_COMMIT
     * @type {Integer (Int32)}
     */
    static HIGH_PROCESS_COMMIT => 8253

    /**
     * Native name: DEBUG_FLR_HIGH_SERVICE_COMMIT
     * @type {Integer (Int32)}
     */
    static HIGH_SERVICE_COMMIT => 8254

    /**
     * Native name: DEBUG_FLR_HIGH_NONPAGED_POOL_USAGE
     * @type {Integer (Int32)}
     */
    static HIGH_NONPAGED_POOL_USAGE => 8255

    /**
     * Native name: DEBUG_FLR_HIGH_PAGED_POOL_USAGE
     * @type {Integer (Int32)}
     */
    static HIGH_PAGED_POOL_USAGE => 8256

    /**
     * Native name: DEBUG_FLR_HIGH_SHARED_COMMIT_USAGE
     * @type {Integer (Int32)}
     */
    static HIGH_SHARED_COMMIT_USAGE => 8257

    /**
     * Native name: DEBUG_FLR_APPS_NOT_TERMINATED
     * @type {Integer (Int32)}
     */
    static APPS_NOT_TERMINATED => 8258

    /**
     * Native name: DEBUG_FLR_POOL_CORRUPTOR
     * @type {Integer (Int32)}
     */
    static POOL_CORRUPTOR => 12288

    /**
     * Native name: DEBUG_FLR_MEMORY_CORRUPTOR
     * @type {Integer (Int32)}
     */
    static MEMORY_CORRUPTOR => 12289

    /**
     * Native name: DEBUG_FLR_UNALIGNED_STACK_POINTER
     * @type {Integer (Int32)}
     */
    static UNALIGNED_STACK_POINTER => 12290

    /**
     * Native name: DEBUG_FLR_OS_VERSION_deprecated
     * @type {Integer (Int32)}
     */
    static OS_VERSION_deprecated => 12291

    /**
     * Native name: DEBUG_FLR_BUGCHECKING_DRIVER
     * @type {Integer (Int32)}
     */
    static BUGCHECKING_DRIVER => 12292

    /**
     * Native name: DEBUG_FLR_SOLUTION_ID
     * @type {Integer (Int32)}
     */
    static SOLUTION_ID => 12293

    /**
     * Native name: DEBUG_FLR_DEFAULT_SOLUTION_ID
     * @type {Integer (Int32)}
     */
    static DEFAULT_SOLUTION_ID => 12294

    /**
     * Native name: DEBUG_FLR_SOLUTION_TYPE
     * @type {Integer (Int32)}
     */
    static SOLUTION_TYPE => 12295

    /**
     * Native name: DEBUG_FLR_RECURRING_STACK
     * @type {Integer (Int32)}
     */
    static RECURRING_STACK => 12296

    /**
     * Native name: DEBUG_FLR_FAULTING_INSTR_CODE
     * @type {Integer (Int32)}
     */
    static FAULTING_INSTR_CODE => 12297

    /**
     * Native name: DEBUG_FLR_SYSTEM_LOCALE_deprecated
     * @type {Integer (Int32)}
     */
    static SYSTEM_LOCALE_deprecated => 12298

    /**
     * Native name: DEBUG_FLR_CUSTOMER_CRASH_COUNT
     * @type {Integer (Int32)}
     */
    static CUSTOMER_CRASH_COUNT => 12299

    /**
     * Native name: DEBUG_FLR_TRAP_FRAME_RECURSION
     * @type {Integer (Int32)}
     */
    static TRAP_FRAME_RECURSION => 12300

    /**
     * Native name: DEBUG_FLR_STACK_OVERFLOW
     * @type {Integer (Int32)}
     */
    static STACK_OVERFLOW => 12301

    /**
     * Native name: DEBUG_FLR_STACK_POINTER_ERROR
     * @type {Integer (Int32)}
     */
    static STACK_POINTER_ERROR => 12302

    /**
     * Native name: DEBUG_FLR_STACK_POINTER_ONEBIT_ERROR
     * @type {Integer (Int32)}
     */
    static STACK_POINTER_ONEBIT_ERROR => 12303

    /**
     * Native name: DEBUG_FLR_STACK_POINTER_MISALIGNED
     * @type {Integer (Int32)}
     */
    static STACK_POINTER_MISALIGNED => 12304

    /**
     * Native name: DEBUG_FLR_INSTR_POINTER_MISALIGNED
     * @type {Integer (Int32)}
     */
    static INSTR_POINTER_MISALIGNED => 12305

    /**
     * Native name: DEBUG_FLR_INSTR_POINTER_CLIFAULT
     * @type {Integer (Int32)}
     */
    static INSTR_POINTER_CLIFAULT => 12306

    /**
     * Native name: DEBUG_FLR_REGISTRYTXT_STRESS_ID
     * @type {Integer (Int32)}
     */
    static REGISTRYTXT_STRESS_ID => 12307

    /**
     * Native name: DEBUG_FLR_CORRUPT_SERVICE_TABLE
     * @type {Integer (Int32)}
     */
    static CORRUPT_SERVICE_TABLE => 12308

    /**
     * Native name: DEBUG_FLR_LOP_STACKHASH
     * @type {Integer (Int32)}
     */
    static LOP_STACKHASH => 12309

    /**
     * Native name: DEBUG_FLR_GSFAILURE_FUNCTION
     * @type {Integer (Int32)}
     */
    static GSFAILURE_FUNCTION => 12310

    /**
     * Native name: DEBUG_FLR_GSFAILURE_MODULE_COOKIE
     * @type {Integer (Int32)}
     */
    static GSFAILURE_MODULE_COOKIE => 12311

    /**
     * Native name: DEBUG_FLR_GSFAILURE_FRAME_COOKIE
     * @type {Integer (Int32)}
     */
    static GSFAILURE_FRAME_COOKIE => 12312

    /**
     * Native name: DEBUG_FLR_GSFAILURE_FRAME_COOKIE_COMPLEMENT
     * @type {Integer (Int32)}
     */
    static GSFAILURE_FRAME_COOKIE_COMPLEMENT => 12313

    /**
     * Native name: DEBUG_FLR_GSFAILURE_CORRUPTED_COOKIE
     * @type {Integer (Int32)}
     */
    static GSFAILURE_CORRUPTED_COOKIE => 12314

    /**
     * Native name: DEBUG_FLR_GSFAILURE_CORRUPTED_EBP
     * @type {Integer (Int32)}
     */
    static GSFAILURE_CORRUPTED_EBP => 12315

    /**
     * Native name: DEBUG_FLR_GSFAILURE_OVERRUN_LOCAL
     * @type {Integer (Int32)}
     */
    static GSFAILURE_OVERRUN_LOCAL => 12316

    /**
     * Native name: DEBUG_FLR_GSFAILURE_OVERRUN_LOCAL_NAME
     * @type {Integer (Int32)}
     */
    static GSFAILURE_OVERRUN_LOCAL_NAME => 12317

    /**
     * Native name: DEBUG_FLR_GSFAILURE_CORRUPTED_EBPESP
     * @type {Integer (Int32)}
     */
    static GSFAILURE_CORRUPTED_EBPESP => 12318

    /**
     * Native name: DEBUG_FLR_GSFAILURE_POSITIVELY_CORRUPTED_EBPESP
     * @type {Integer (Int32)}
     */
    static GSFAILURE_POSITIVELY_CORRUPTED_EBPESP => 12319

    /**
     * Native name: DEBUG_FLR_GSFAILURE_MEMORY_READ_ERROR
     * @type {Integer (Int32)}
     */
    static GSFAILURE_MEMORY_READ_ERROR => 12320

    /**
     * Native name: DEBUG_FLR_GSFAILURE_PROBABLY_NOT_USING_GS
     * @type {Integer (Int32)}
     */
    static GSFAILURE_PROBABLY_NOT_USING_GS => 12321

    /**
     * Native name: DEBUG_FLR_GSFAILURE_POSITIVE_BUFFER_OVERFLOW
     * @type {Integer (Int32)}
     */
    static GSFAILURE_POSITIVE_BUFFER_OVERFLOW => 12322

    /**
     * Native name: DEBUG_FLR_GSFAILURE_ANALYSIS_TEXT
     * @type {Integer (Int32)}
     */
    static GSFAILURE_ANALYSIS_TEXT => 12323

    /**
     * Native name: DEBUG_FLR_GSFAILURE_OFF_BY_ONE_OVERRUN
     * @type {Integer (Int32)}
     */
    static GSFAILURE_OFF_BY_ONE_OVERRUN => 12324

    /**
     * Native name: DEBUG_FLR_GSFAILURE_RA_SMASHED
     * @type {Integer (Int32)}
     */
    static GSFAILURE_RA_SMASHED => 12325

    /**
     * Native name: DEBUG_FLR_GSFAILURE_NOT_UP2DATE
     * @type {Integer (Int32)}
     */
    static GSFAILURE_NOT_UP2DATE => 12326

    /**
     * Native name: DEBUG_FLR_GSFAILURE_UP2DATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static GSFAILURE_UP2DATE_UNKNOWN => 12327

    /**
     * Native name: DEBUG_FLR_TRIAGER_OS_BUILD_NAME
     * @type {Integer (Int32)}
     */
    static TRIAGER_OS_BUILD_NAME => 12328

    /**
     * Native name: DEBUG_FLR_CPU_MICROCODE_VERSION
     * @type {Integer (Int32)}
     */
    static CPU_MICROCODE_VERSION => 12329

    /**
     * Native name: DEBUG_FLR_CPU_COUNT
     * @type {Integer (Int32)}
     */
    static CPU_COUNT => 12330

    /**
     * Native name: DEBUG_FLR_CPU_SPEED
     * @type {Integer (Int32)}
     */
    static CPU_SPEED => 12331

    /**
     * Native name: DEBUG_FLR_CPU_VENDOR
     * @type {Integer (Int32)}
     */
    static CPU_VENDOR => 12332

    /**
     * Native name: DEBUG_FLR_CPU_FAMILY
     * @type {Integer (Int32)}
     */
    static CPU_FAMILY => 12333

    /**
     * Native name: DEBUG_FLR_CPU_MODEL
     * @type {Integer (Int32)}
     */
    static CPU_MODEL => 12334

    /**
     * Native name: DEBUG_FLR_CPU_STEPPING
     * @type {Integer (Int32)}
     */
    static CPU_STEPPING => 12335

    /**
     * Native name: DEBUG_FLR_INSTR_POINTER_ON_STACK
     * @type {Integer (Int32)}
     */
    static INSTR_POINTER_ON_STACK => 12336

    /**
     * Native name: DEBUG_FLR_INSTR_POINTER_ON_HEAP
     * @type {Integer (Int32)}
     */
    static INSTR_POINTER_ON_HEAP => 12337

    /**
     * Native name: DEBUG_FLR_EVENT_CODE_DATA_MISMATCH
     * @type {Integer (Int32)}
     */
    static EVENT_CODE_DATA_MISMATCH => 12338

    /**
     * Native name: DEBUG_FLR_PROCESSOR_INFO
     * @type {Integer (Int32)}
     */
    static PROCESSOR_INFO => 12339

    /**
     * Native name: DEBUG_FLR_INSTR_POINTER_IN_UNLOADED_MODULE
     * @type {Integer (Int32)}
     */
    static INSTR_POINTER_IN_UNLOADED_MODULE => 12340

    /**
     * Native name: DEBUG_FLR_MEMDIAG_LASTRUN_STATUS
     * @type {Integer (Int32)}
     */
    static MEMDIAG_LASTRUN_STATUS => 12341

    /**
     * Native name: DEBUG_FLR_MEMDIAG_LASTRUN_TIME
     * @type {Integer (Int32)}
     */
    static MEMDIAG_LASTRUN_TIME => 12342

    /**
     * Native name: DEBUG_FLR_INSTR_POINTER_IN_FREE_BLOCK
     * @type {Integer (Int32)}
     */
    static INSTR_POINTER_IN_FREE_BLOCK => 12343

    /**
     * Native name: DEBUG_FLR_INSTR_POINTER_IN_RESERVED_BLOCK
     * @type {Integer (Int32)}
     */
    static INSTR_POINTER_IN_RESERVED_BLOCK => 12344

    /**
     * Native name: DEBUG_FLR_INSTR_POINTER_IN_VM_MAPPED_MODULE
     * @type {Integer (Int32)}
     */
    static INSTR_POINTER_IN_VM_MAPPED_MODULE => 12345

    /**
     * Native name: DEBUG_FLR_INSTR_POINTER_IN_MODULE_NOT_IN_LIST
     * @type {Integer (Int32)}
     */
    static INSTR_POINTER_IN_MODULE_NOT_IN_LIST => 12346

    /**
     * Native name: DEBUG_FLR_INSTR_POINTER_NOT_IN_STREAM
     * @type {Integer (Int32)}
     */
    static INSTR_POINTER_NOT_IN_STREAM => 12347

    /**
     * Native name: DEBUG_FLR_MEMORY_CORRUPTION_SIGNATURE
     * @type {Integer (Int32)}
     */
    static MEMORY_CORRUPTION_SIGNATURE => 12348

    /**
     * Native name: DEBUG_FLR_BUILDNAME_IN_BUCKET
     * @type {Integer (Int32)}
     */
    static BUILDNAME_IN_BUCKET => 12349

    /**
     * Native name: DEBUG_FLR_CANCELLATION_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static CANCELLATION_NOT_SUPPORTED => 12350

    /**
     * Native name: DEBUG_FLR_DETOURED_IMAGE
     * @type {Integer (Int32)}
     */
    static DETOURED_IMAGE => 12351

    /**
     * Native name: DEBUG_FLR_EXCEPTION_CONTEXT_RECURSION
     * @type {Integer (Int32)}
     */
    static EXCEPTION_CONTEXT_RECURSION => 12352

    /**
     * Native name: DEBUG_FLR_DISKIO_READ_FAILURE
     * @type {Integer (Int32)}
     */
    static DISKIO_READ_FAILURE => 12353

    /**
     * Native name: DEBUG_FLR_DISKIO_WRITE_FAILURE
     * @type {Integer (Int32)}
     */
    static DISKIO_WRITE_FAILURE => 12354

    /**
     * Native name: DEBUG_FLR_GSFAILURE_MISSING_ESTABLISHER_FRAME
     * @type {Integer (Int32)}
     */
    static GSFAILURE_MISSING_ESTABLISHER_FRAME => 12355

    /**
     * Native name: DEBUG_FLR_GSFAILURE_COOKIES_MATCH_EXH
     * @type {Integer (Int32)}
     */
    static GSFAILURE_COOKIES_MATCH_EXH => 12356

    /**
     * Native name: DEBUG_FLR_GSFAILURE_MANAGED
     * @type {Integer (Int32)}
     */
    static GSFAILURE_MANAGED => 12357

    /**
     * Native name: DEBUG_FLR_MANAGED_FRAME_CHAIN_CORRUPTION
     * @type {Integer (Int32)}
     */
    static MANAGED_FRAME_CHAIN_CORRUPTION => 12358

    /**
     * Native name: DEBUG_FLR_GSFAILURE_MANAGED_THREADID
     * @type {Integer (Int32)}
     */
    static GSFAILURE_MANAGED_THREADID => 12359

    /**
     * Native name: DEBUG_FLR_GSFAILURE_MANAGED_FRAMEID
     * @type {Integer (Int32)}
     */
    static GSFAILURE_MANAGED_FRAMEID => 12360

    /**
     * Native name: DEBUG_FLR_STACKUSAGE_IMAGE
     * @type {Integer (Int32)}
     */
    static STACKUSAGE_IMAGE => 12361

    /**
     * Native name: DEBUG_FLR_STACKUSAGE_IMAGE_SIZE
     * @type {Integer (Int32)}
     */
    static STACKUSAGE_IMAGE_SIZE => 12362

    /**
     * Native name: DEBUG_FLR_STACKUSAGE_FUNCTION
     * @type {Integer (Int32)}
     */
    static STACKUSAGE_FUNCTION => 12363

    /**
     * Native name: DEBUG_FLR_STACKUSAGE_FUNCTION_SIZE
     * @type {Integer (Int32)}
     */
    static STACKUSAGE_FUNCTION_SIZE => 12364

    /**
     * Native name: DEBUG_FLR_STACKUSAGE_RECURSION_COUNT
     * @type {Integer (Int32)}
     */
    static STACKUSAGE_RECURSION_COUNT => 12365

    /**
     * Native name: DEBUG_FLR_XBOX_SYSTEM_UPTIME
     * @type {Integer (Int32)}
     */
    static XBOX_SYSTEM_UPTIME => 12366

    /**
     * Native name: DEBUG_FLR_XBOX_SYSTEM_CRASHTIME
     * @type {Integer (Int32)}
     */
    static XBOX_SYSTEM_CRASHTIME => 12367

    /**
     * Native name: DEBUG_FLR_XBOX_LIVE_ENVIRONMENT
     * @type {Integer (Int32)}
     */
    static XBOX_LIVE_ENVIRONMENT => 12368

    /**
     * Native name: DEBUG_FLR_LARGE_TICK_INCREMENT
     * @type {Integer (Int32)}
     */
    static LARGE_TICK_INCREMENT => 12369

    /**
     * Native name: DEBUG_FLR_INSTR_POINTER_IN_PAGED_CODE
     * @type {Integer (Int32)}
     */
    static INSTR_POINTER_IN_PAGED_CODE => 12370

    /**
     * Native name: DEBUG_FLR_SERVICETABLE_MODIFIED
     * @type {Integer (Int32)}
     */
    static SERVICETABLE_MODIFIED => 12371

    /**
     * Native name: DEBUG_FLR_ALUREON
     * @type {Integer (Int32)}
     */
    static ALUREON => 12372

    /**
     * Native name: DEBUG_FLR_INTERNAL_RAID_BUG
     * @type {Integer (Int32)}
     */
    static INTERNAL_RAID_BUG => 16384

    /**
     * Native name: DEBUG_FLR_INTERNAL_BUCKET_URL
     * @type {Integer (Int32)}
     */
    static INTERNAL_BUCKET_URL => 16385

    /**
     * Native name: DEBUG_FLR_INTERNAL_SOLUTION_TEXT
     * @type {Integer (Int32)}
     */
    static INTERNAL_SOLUTION_TEXT => 16386

    /**
     * Native name: DEBUG_FLR_INTERNAL_BUCKET_HITCOUNT
     * @type {Integer (Int32)}
     */
    static INTERNAL_BUCKET_HITCOUNT => 16387

    /**
     * Native name: DEBUG_FLR_INTERNAL_RAID_BUG_DATABASE_STRING
     * @type {Integer (Int32)}
     */
    static INTERNAL_RAID_BUG_DATABASE_STRING => 16388

    /**
     * Native name: DEBUG_FLR_INTERNAL_BUCKET_CONTINUABLE
     * @type {Integer (Int32)}
     */
    static INTERNAL_BUCKET_CONTINUABLE => 16389

    /**
     * Native name: DEBUG_FLR_INTERNAL_BUCKET_STATUS_TEXT
     * @type {Integer (Int32)}
     */
    static INTERNAL_BUCKET_STATUS_TEXT => 16390

    /**
     * Native name: DEBUG_FLR_WATSON_MODULE
     * @type {Integer (Int32)}
     */
    static WATSON_MODULE => 16640

    /**
     * Native name: DEBUG_FLR_WATSON_MODULE_VERSION
     * @type {Integer (Int32)}
     */
    static WATSON_MODULE_VERSION => 16641

    /**
     * Native name: DEBUG_FLR_WATSON_MODULE_OFFSET
     * @type {Integer (Int32)}
     */
    static WATSON_MODULE_OFFSET => 16642

    /**
     * Native name: DEBUG_FLR_WATSON_PROCESS_VERSION
     * @type {Integer (Int32)}
     */
    static WATSON_PROCESS_VERSION => 16643

    /**
     * Native name: DEBUG_FLR_WATSON_IBUCKET
     * @type {Integer (Int32)}
     */
    static WATSON_IBUCKET => 16644

    /**
     * Native name: DEBUG_FLR_WATSON_MODULE_TIMESTAMP
     * @type {Integer (Int32)}
     */
    static WATSON_MODULE_TIMESTAMP => 16645

    /**
     * Native name: DEBUG_FLR_WATSON_PROCESS_TIMESTAMP
     * @type {Integer (Int32)}
     */
    static WATSON_PROCESS_TIMESTAMP => 16646

    /**
     * Native name: DEBUG_FLR_WATSON_GENERIC_EVENT_NAME
     * @type {Integer (Int32)}
     */
    static WATSON_GENERIC_EVENT_NAME => 16647

    /**
     * Native name: DEBUG_FLR_WATSON_GENERIC_BUCKETING_00
     * @type {Integer (Int32)}
     */
    static WATSON_GENERIC_BUCKETING_00 => 16648

    /**
     * Native name: DEBUG_FLR_WATSON_GENERIC_BUCKETING_01
     * @type {Integer (Int32)}
     */
    static WATSON_GENERIC_BUCKETING_01 => 16649

    /**
     * Native name: DEBUG_FLR_WATSON_GENERIC_BUCKETING_02
     * @type {Integer (Int32)}
     */
    static WATSON_GENERIC_BUCKETING_02 => 16650

    /**
     * Native name: DEBUG_FLR_WATSON_GENERIC_BUCKETING_03
     * @type {Integer (Int32)}
     */
    static WATSON_GENERIC_BUCKETING_03 => 16651

    /**
     * Native name: DEBUG_FLR_WATSON_GENERIC_BUCKETING_04
     * @type {Integer (Int32)}
     */
    static WATSON_GENERIC_BUCKETING_04 => 16652

    /**
     * Native name: DEBUG_FLR_WATSON_GENERIC_BUCKETING_05
     * @type {Integer (Int32)}
     */
    static WATSON_GENERIC_BUCKETING_05 => 16653

    /**
     * Native name: DEBUG_FLR_WATSON_GENERIC_BUCKETING_06
     * @type {Integer (Int32)}
     */
    static WATSON_GENERIC_BUCKETING_06 => 16654

    /**
     * Native name: DEBUG_FLR_WATSON_GENERIC_BUCKETING_07
     * @type {Integer (Int32)}
     */
    static WATSON_GENERIC_BUCKETING_07 => 16655

    /**
     * Native name: DEBUG_FLR_WATSON_GENERIC_BUCKETING_08
     * @type {Integer (Int32)}
     */
    static WATSON_GENERIC_BUCKETING_08 => 16656

    /**
     * Native name: DEBUG_FLR_WATSON_GENERIC_BUCKETING_09
     * @type {Integer (Int32)}
     */
    static WATSON_GENERIC_BUCKETING_09 => 16657

    /**
     * Native name: DEBUG_FLR_SYSXML_LOCALEID
     * @type {Integer (Int32)}
     */
    static SYSXML_LOCALEID => 16896

    /**
     * Native name: DEBUG_FLR_SYSXML_CHECKSUM
     * @type {Integer (Int32)}
     */
    static SYSXML_CHECKSUM => 16897

    /**
     * Native name: DEBUG_FLR_WQL_EVENT_COUNT
     * @type {Integer (Int32)}
     */
    static WQL_EVENT_COUNT => 16898

    /**
     * Native name: DEBUG_FLR_WQL_EVENTLOG_INFO
     * @type {Integer (Int32)}
     */
    static WQL_EVENTLOG_INFO => 16899

    /**
     * Native name: DEBUG_FLR_SYSINFO_SYSTEM_MANUFACTURER
     * @type {Integer (Int32)}
     */
    static SYSINFO_SYSTEM_MANUFACTURER => 17152

    /**
     * Native name: DEBUG_FLR_SYSINFO_SYSTEM_PRODUCT
     * @type {Integer (Int32)}
     */
    static SYSINFO_SYSTEM_PRODUCT => 17153

    /**
     * Native name: DEBUG_FLR_SYSINFO_SYSTEM_SKU
     * @type {Integer (Int32)}
     */
    static SYSINFO_SYSTEM_SKU => 17154

    /**
     * Native name: DEBUG_FLR_SYSINFO_SYSTEM_VERSION
     * @type {Integer (Int32)}
     */
    static SYSINFO_SYSTEM_VERSION => 17155

    /**
     * Native name: DEBUG_FLR_SYSINFO_BASEBOARD_MANUFACTURER
     * @type {Integer (Int32)}
     */
    static SYSINFO_BASEBOARD_MANUFACTURER => 17156

    /**
     * Native name: DEBUG_FLR_SYSINFO_BASEBOARD_PRODUCT
     * @type {Integer (Int32)}
     */
    static SYSINFO_BASEBOARD_PRODUCT => 17157

    /**
     * Native name: DEBUG_FLR_SYSINFO_BASEBOARD_VERSION
     * @type {Integer (Int32)}
     */
    static SYSINFO_BASEBOARD_VERSION => 17158

    /**
     * Native name: DEBUG_FLR_SYSINFO_BIOS_VENDOR
     * @type {Integer (Int32)}
     */
    static SYSINFO_BIOS_VENDOR => 17159

    /**
     * Native name: DEBUG_FLR_SYSINFO_BIOS_VERSION
     * @type {Integer (Int32)}
     */
    static SYSINFO_BIOS_VERSION => 17160

    /**
     * Native name: DEBUG_FLR_SYSINFO_BIOS_DATE
     * @type {Integer (Int32)}
     */
    static SYSINFO_BIOS_DATE => 17161

    /**
     * Native name: DEBUG_FLR_VIRTUAL_MACHINE
     * @type {Integer (Int32)}
     */
    static VIRTUAL_MACHINE => 17162

    /**
     * Native name: DEBUG_FLR_SERVICE
     * @type {Integer (Int32)}
     */
    static SERVICE => 20480

    /**
     * Native name: DEBUG_FLR_SERVICE_NAME
     * @type {Integer (Int32)}
     */
    static SERVICE_NAME => 20481

    /**
     * Native name: DEBUG_FLR_SERVICE_GROUP
     * @type {Integer (Int32)}
     */
    static SERVICE_GROUP => 20482

    /**
     * Native name: DEBUG_FLR_SERVICE_DISPLAYNAME
     * @type {Integer (Int32)}
     */
    static SERVICE_DISPLAYNAME => 20483

    /**
     * Native name: DEBUG_FLR_SERVICE_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static SERVICE_DESCRIPTION => 20484

    /**
     * Native name: DEBUG_FLR_SERVICE_DEPENDONSERVICE
     * @type {Integer (Int32)}
     */
    static SERVICE_DEPENDONSERVICE => 20485

    /**
     * Native name: DEBUG_FLR_SERVICE_DEPENDONGROUP
     * @type {Integer (Int32)}
     */
    static SERVICE_DEPENDONGROUP => 20486

    /**
     * Native name: DEBUG_FLR_SVCHOST
     * @type {Integer (Int32)}
     */
    static SVCHOST => 20736

    /**
     * Native name: DEBUG_FLR_SVCHOST_GROUP
     * @type {Integer (Int32)}
     */
    static SVCHOST_GROUP => 20737

    /**
     * Native name: DEBUG_FLR_SVCHOST_IMAGEPATH
     * @type {Integer (Int32)}
     */
    static SVCHOST_IMAGEPATH => 20738

    /**
     * Native name: DEBUG_FLR_SVCHOST_SERVICEDLL
     * @type {Integer (Int32)}
     */
    static SVCHOST_SERVICEDLL => 20739

    /**
     * Native name: DEBUG_FLR_SCM
     * @type {Integer (Int32)}
     */
    static SCM => 20992

    /**
     * Native name: DEBUG_FLR_SCM_BLACKBOX
     * @type {Integer (Int32)}
     */
    static SCM_BLACKBOX => 21232

    /**
     * Native name: DEBUG_FLR_SCM_BLACKBOX_ENTRY
     * @type {Integer (Int32)}
     */
    static SCM_BLACKBOX_ENTRY => 21233

    /**
     * Native name: DEBUG_FLR_SCM_BLACKBOX_ENTRY_CONTROLCODE
     * @type {Integer (Int32)}
     */
    static SCM_BLACKBOX_ENTRY_CONTROLCODE => 21234

    /**
     * Native name: DEBUG_FLR_SCM_BLACKBOX_ENTRY_STARTTIME
     * @type {Integer (Int32)}
     */
    static SCM_BLACKBOX_ENTRY_STARTTIME => 21235

    /**
     * Native name: DEBUG_FLR_SCM_BLACKBOX_ENTRY_SERVICENAME
     * @type {Integer (Int32)}
     */
    static SCM_BLACKBOX_ENTRY_SERVICENAME => 21236

    /**
     * Native name: DEBUG_FLR_ACPI
     * @type {Integer (Int32)}
     */
    static ACPI => 24576

    /**
     * Native name: DEBUG_FLR_ACPI_BLACKBOX
     * @type {Integer (Int32)}
     */
    static ACPI_BLACKBOX => 24832

    /**
     * Native name: DEBUG_FLR_PO_BLACKBOX
     * @type {Integer (Int32)}
     */
    static PO_BLACKBOX => 24833

    /**
     * Native name: DEBUG_FLR_BOOTSTAT
     * @type {Integer (Int32)}
     */
    static BOOTSTAT => 28672

    /**
     * Native name: DEBUG_FLR_BOOTSTAT_BLACKBOX
     * @type {Integer (Int32)}
     */
    static BOOTSTAT_BLACKBOX => 28928

    /**
     * Native name: DEBUG_FLR_STORAGE
     * @type {Integer (Int32)}
     */
    static STORAGE => 29696

    /**
     * Native name: DEBUG_FLR_STORAGE_ORGID
     * @type {Integer (Int32)}
     */
    static STORAGE_ORGID => 29697

    /**
     * Native name: DEBUG_FLR_STORAGE_MODEL
     * @type {Integer (Int32)}
     */
    static STORAGE_MODEL => 29698

    /**
     * Native name: DEBUG_FLR_STORAGE_MFGID
     * @type {Integer (Int32)}
     */
    static STORAGE_MFGID => 29699

    /**
     * Native name: DEBUG_FLR_STORAGE_ISSUEDESCSTRING
     * @type {Integer (Int32)}
     */
    static STORAGE_ISSUEDESCSTRING => 29700

    /**
     * Native name: DEBUG_FLR_STORAGE_PUBLIC_TOTSIZE
     * @type {Integer (Int32)}
     */
    static STORAGE_PUBLIC_TOTSIZE => 29701

    /**
     * Native name: DEBUG_FLR_STORAGE_PUBLIC_OFFSET
     * @type {Integer (Int32)}
     */
    static STORAGE_PUBLIC_OFFSET => 29702

    /**
     * Native name: DEBUG_FLR_STORAGE_PUBLIC_DATASIZE
     * @type {Integer (Int32)}
     */
    static STORAGE_PUBLIC_DATASIZE => 29703

    /**
     * Native name: DEBUG_FLR_STORAGE_PRIVATE_TOTSIZE
     * @type {Integer (Int32)}
     */
    static STORAGE_PRIVATE_TOTSIZE => 29704

    /**
     * Native name: DEBUG_FLR_STORAGE_PRIVATE_OFFSET
     * @type {Integer (Int32)}
     */
    static STORAGE_PRIVATE_OFFSET => 29705

    /**
     * Native name: DEBUG_FLR_STORAGE_PRIVATE_DATASIZE
     * @type {Integer (Int32)}
     */
    static STORAGE_PRIVATE_DATASIZE => 29706

    /**
     * Native name: DEBUG_FLR_STORAGE_TOTALSIZE
     * @type {Integer (Int32)}
     */
    static STORAGE_TOTALSIZE => 29707

    /**
     * Native name: DEBUG_FLR_STORAGE_REASON
     * @type {Integer (Int32)}
     */
    static STORAGE_REASON => 29708

    /**
     * Native name: DEBUG_FLR_STORAGE_BLACKBOX
     * @type {Integer (Int32)}
     */
    static STORAGE_BLACKBOX => 29936

    /**
     * Native name: DEBUG_FLR_FILESYSTEMS_NTFS
     * @type {Integer (Int32)}
     */
    static FILESYSTEMS_NTFS => 30208

    /**
     * Native name: DEBUG_FLR_FILESYSTEMS_NTFS_BLACKBOX
     * @type {Integer (Int32)}
     */
    static FILESYSTEMS_NTFS_BLACKBOX => 30448

    /**
     * Native name: DEBUG_FLR_FILESYSTEMS_REFS
     * @type {Integer (Int32)}
     */
    static FILESYSTEMS_REFS => 30720

    /**
     * Native name: DEBUG_FLR_FILESYSTEMS_REFS_BLACKBOX
     * @type {Integer (Int32)}
     */
    static FILESYSTEMS_REFS_BLACKBOX => 30960

    /**
     * Native name: DEBUG_FLR_PNP
     * @type {Integer (Int32)}
     */
    static PNP => 32768

    /**
     * Native name: DEBUG_FLR_PNP_TRIAGE_DATA
     * @type {Integer (Int32)}
     */
    static PNP_TRIAGE_DATA => 32769

    /**
     * Native name: DEBUG_FLR_PNP_IRP_ADDRESS
     * @type {Integer (Int32)}
     */
    static PNP_IRP_ADDRESS => 32770

    /**
     * Native name: DEBUG_FLR_PNP_BLACKBOX
     * @type {Integer (Int32)}
     */
    static PNP_BLACKBOX => 33024

    /**
     * Native name: DEBUG_FLR_BUCKET_ID
     * @type {Integer (Int32)}
     */
    static BUCKET_ID => 65536

    /**
     * Native name: DEBUG_FLR_IMAGE_NAME
     * @type {Integer (Int32)}
     */
    static IMAGE_NAME => 65537

    /**
     * Native name: DEBUG_FLR_SYMBOL_NAME
     * @type {Integer (Int32)}
     */
    static SYMBOL_NAME => 65538

    /**
     * Native name: DEBUG_FLR_FOLLOWUP_NAME
     * @type {Integer (Int32)}
     */
    static FOLLOWUP_NAME => 65539

    /**
     * Native name: DEBUG_FLR_STACK_COMMAND
     * @type {Integer (Int32)}
     */
    static STACK_COMMAND => 65540

    /**
     * Native name: DEBUG_FLR_STACK_TEXT
     * @type {Integer (Int32)}
     */
    static STACK_TEXT => 65541

    /**
     * Native name: DEBUG_FLR_MODULE_NAME
     * @type {Integer (Int32)}
     */
    static MODULE_NAME => 65542

    /**
     * Native name: DEBUG_FLR_FIXED_IN_OSVERSION
     * @type {Integer (Int32)}
     */
    static FIXED_IN_OSVERSION => 65543

    /**
     * Native name: DEBUG_FLR_DEFAULT_BUCKET_ID
     * @type {Integer (Int32)}
     */
    static DEFAULT_BUCKET_ID => 65544

    /**
     * Native name: DEBUG_FLR_MODULE_BUCKET_ID
     * @type {Integer (Int32)}
     */
    static MODULE_BUCKET_ID => 65545

    /**
     * Native name: DEBUG_FLR_ADDITIONAL_DEBUGTEXT
     * @type {Integer (Int32)}
     */
    static ADDITIONAL_DEBUGTEXT => 65546

    /**
     * Native name: DEBUG_FLR_PROCESS_NAME
     * @type {Integer (Int32)}
     */
    static PROCESS_NAME => 65547

    /**
     * Native name: DEBUG_FLR_USER_NAME
     * @type {Integer (Int32)}
     */
    static USER_NAME => 65548

    /**
     * Native name: DEBUG_FLR_MARKER_FILE
     * @type {Integer (Int32)}
     */
    static MARKER_FILE => 65549

    /**
     * Native name: DEBUG_FLR_INTERNAL_RESPONSE
     * @type {Integer (Int32)}
     */
    static INTERNAL_RESPONSE => 65550

    /**
     * Native name: DEBUG_FLR_CONTEXT_RESTORE_COMMAND
     * @type {Integer (Int32)}
     */
    static CONTEXT_RESTORE_COMMAND => 65551

    /**
     * Native name: DEBUG_FLR_DRIVER_HARDWAREID
     * @type {Integer (Int32)}
     */
    static DRIVER_HARDWAREID => 65552

    /**
     * Native name: DEBUG_FLR_DRIVER_HARDWARE_VENDOR_ID
     * @type {Integer (Int32)}
     */
    static DRIVER_HARDWARE_VENDOR_ID => 65553

    /**
     * Native name: DEBUG_FLR_DRIVER_HARDWARE_DEVICE_ID
     * @type {Integer (Int32)}
     */
    static DRIVER_HARDWARE_DEVICE_ID => 65554

    /**
     * Native name: DEBUG_FLR_DRIVER_HARDWARE_SUBSYS_ID
     * @type {Integer (Int32)}
     */
    static DRIVER_HARDWARE_SUBSYS_ID => 65555

    /**
     * Native name: DEBUG_FLR_DRIVER_HARDWARE_REV_ID
     * @type {Integer (Int32)}
     */
    static DRIVER_HARDWARE_REV_ID => 65556

    /**
     * Native name: DEBUG_FLR_DRIVER_HARDWARE_ID_BUS_TYPE
     * @type {Integer (Int32)}
     */
    static DRIVER_HARDWARE_ID_BUS_TYPE => 65557

    /**
     * Native name: DEBUG_FLR_MARKER_MODULE_FILE
     * @type {Integer (Int32)}
     */
    static MARKER_MODULE_FILE => 65558

    /**
     * Native name: DEBUG_FLR_BUGCHECKING_DRIVER_IDTAG
     * @type {Integer (Int32)}
     */
    static BUGCHECKING_DRIVER_IDTAG => 65559

    /**
     * Native name: DEBUG_FLR_MARKER_BUCKET
     * @type {Integer (Int32)}
     */
    static MARKER_BUCKET => 65560

    /**
     * Native name: DEBUG_FLR_FAILURE_BUCKET_ID
     * @type {Integer (Int32)}
     */
    static FAILURE_BUCKET_ID => 65561

    /**
     * Native name: DEBUG_FLR_DRIVER_XML_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static DRIVER_XML_DESCRIPTION => 65562

    /**
     * Native name: DEBUG_FLR_DRIVER_XML_PRODUCTNAME
     * @type {Integer (Int32)}
     */
    static DRIVER_XML_PRODUCTNAME => 65563

    /**
     * Native name: DEBUG_FLR_DRIVER_XML_MANUFACTURER
     * @type {Integer (Int32)}
     */
    static DRIVER_XML_MANUFACTURER => 65564

    /**
     * Native name: DEBUG_FLR_DRIVER_XML_VERSION
     * @type {Integer (Int32)}
     */
    static DRIVER_XML_VERSION => 65565

    /**
     * Native name: DEBUG_FLR_BUILD_VERSION_STRING
     * @type {Integer (Int32)}
     */
    static BUILD_VERSION_STRING => 65566

    /**
     * Native name: DEBUG_FLR_BUILD_OS_FULL_VERSION_STRING
     * @type {Integer (Int32)}
     */
    static BUILD_OS_FULL_VERSION_STRING => 65567

    /**
     * Native name: DEBUG_FLR_ORIGINAL_CAB_NAME
     * @type {Integer (Int32)}
     */
    static ORIGINAL_CAB_NAME => 65568

    /**
     * Native name: DEBUG_FLR_FAULTING_SOURCE_CODE
     * @type {Integer (Int32)}
     */
    static FAULTING_SOURCE_CODE => 65569

    /**
     * Native name: DEBUG_FLR_FAULTING_SERVICE_NAME
     * @type {Integer (Int32)}
     */
    static FAULTING_SERVICE_NAME => 65570

    /**
     * Native name: DEBUG_FLR_FILE_IN_CAB
     * @type {Integer (Int32)}
     */
    static FILE_IN_CAB => 65571

    /**
     * Native name: DEBUG_FLR_UNRESPONSIVE_UI_SYMBOL_NAME
     * @type {Integer (Int32)}
     */
    static UNRESPONSIVE_UI_SYMBOL_NAME => 65572

    /**
     * Native name: DEBUG_FLR_UNRESPONSIVE_UI_FOLLOWUP_NAME
     * @type {Integer (Int32)}
     */
    static UNRESPONSIVE_UI_FOLLOWUP_NAME => 65573

    /**
     * Native name: DEBUG_FLR_UNRESPONSIVE_UI_STACK
     * @type {Integer (Int32)}
     */
    static UNRESPONSIVE_UI_STACK => 65574

    /**
     * Native name: DEBUG_FLR_PROCESS_PRODUCTNAME
     * @type {Integer (Int32)}
     */
    static PROCESS_PRODUCTNAME => 65575

    /**
     * Native name: DEBUG_FLR_MODULE_PRODUCTNAME
     * @type {Integer (Int32)}
     */
    static MODULE_PRODUCTNAME => 65576

    /**
     * Native name: DEBUG_FLR_COLLECT_DATA_FOR_BUCKET
     * @type {Integer (Int32)}
     */
    static COLLECT_DATA_FOR_BUCKET => 65577

    /**
     * Native name: DEBUG_FLR_COMPUTER_NAME
     * @type {Integer (Int32)}
     */
    static COMPUTER_NAME => 65578

    /**
     * Native name: DEBUG_FLR_IMAGE_CLASS
     * @type {Integer (Int32)}
     */
    static IMAGE_CLASS => 65579

    /**
     * Native name: DEBUG_FLR_SYMBOL_ROUTINE_NAME
     * @type {Integer (Int32)}
     */
    static SYMBOL_ROUTINE_NAME => 65580

    /**
     * Native name: DEBUG_FLR_HARDWARE_BUCKET_TAG
     * @type {Integer (Int32)}
     */
    static HARDWARE_BUCKET_TAG => 65581

    /**
     * Native name: DEBUG_FLR_KERNEL_LOG_PROCESS_NAME
     * @type {Integer (Int32)}
     */
    static KERNEL_LOG_PROCESS_NAME => 65582

    /**
     * Native name: DEBUG_FLR_KERNEL_LOG_STATUS
     * @type {Integer (Int32)}
     */
    static KERNEL_LOG_STATUS => 65583

    /**
     * Native name: DEBUG_FLR_REGISTRYTXT_SOURCE
     * @type {Integer (Int32)}
     */
    static REGISTRYTXT_SOURCE => 65584

    /**
     * Native name: DEBUG_FLR_FAULTING_SOURCE_LINE
     * @type {Integer (Int32)}
     */
    static FAULTING_SOURCE_LINE => 65585

    /**
     * Native name: DEBUG_FLR_FAULTING_SOURCE_FILE
     * @type {Integer (Int32)}
     */
    static FAULTING_SOURCE_FILE => 65586

    /**
     * Native name: DEBUG_FLR_FAULTING_SOURCE_LINE_NUMBER
     * @type {Integer (Int32)}
     */
    static FAULTING_SOURCE_LINE_NUMBER => 65587

    /**
     * Native name: DEBUG_FLR_SKIP_MODULE_SPECIFIC_BUCKET_INFO
     * @type {Integer (Int32)}
     */
    static SKIP_MODULE_SPECIFIC_BUCKET_INFO => 65588

    /**
     * Native name: DEBUG_FLR_BUCKET_ID_FUNC_OFFSET
     * @type {Integer (Int32)}
     */
    static BUCKET_ID_FUNC_OFFSET => 65589

    /**
     * Native name: DEBUG_FLR_XHCI_FIRMWARE_VERSION
     * @type {Integer (Int32)}
     */
    static XHCI_FIRMWARE_VERSION => 65590

    /**
     * Native name: DEBUG_FLR_FAILURE_ANALYSIS_SOURCE
     * @type {Integer (Int32)}
     */
    static FAILURE_ANALYSIS_SOURCE => 65591

    /**
     * Native name: DEBUG_FLR_FAILURE_ID_HASH
     * @type {Integer (Int32)}
     */
    static FAILURE_ID_HASH => 65592

    /**
     * Native name: DEBUG_FLR_FAILURE_ID_HASH_STRING
     * @type {Integer (Int32)}
     */
    static FAILURE_ID_HASH_STRING => 65593

    /**
     * Native name: DEBUG_FLR_FAILURE_ID_REPORT_LINK
     * @type {Integer (Int32)}
     */
    static FAILURE_ID_REPORT_LINK => 65594

    /**
     * Native name: DEBUG_FLR_HOLDINFO
     * @type {Integer (Int32)}
     */
    static HOLDINFO => 65595

    /**
     * Native name: DEBUG_FLR_HOLDINFO_ACTIVE_HOLD_COUNT
     * @type {Integer (Int32)}
     */
    static HOLDINFO_ACTIVE_HOLD_COUNT => 65596

    /**
     * Native name: DEBUG_FLR_HOLDINFO_TENET_SOCRE
     * @type {Integer (Int32)}
     */
    static HOLDINFO_TENET_SOCRE => 65597

    /**
     * Native name: DEBUG_FLR_HOLDINFO_HISTORIC_HOLD_COUNT
     * @type {Integer (Int32)}
     */
    static HOLDINFO_HISTORIC_HOLD_COUNT => 65598

    /**
     * Native name: DEBUG_FLR_HOLDINFO_ALWAYS_IGNORE
     * @type {Integer (Int32)}
     */
    static HOLDINFO_ALWAYS_IGNORE => 65599

    /**
     * Native name: DEBUG_FLR_HOLDINFO_ALWAYS_HOLD
     * @type {Integer (Int32)}
     */
    static HOLDINFO_ALWAYS_HOLD => 65600

    /**
     * Native name: DEBUG_FLR_HOLDINFO_MAX_HOLD_LIMIT
     * @type {Integer (Int32)}
     */
    static HOLDINFO_MAX_HOLD_LIMIT => 65601

    /**
     * Native name: DEBUG_FLR_HOLDINFO_MANUAL_HOLD
     * @type {Integer (Int32)}
     */
    static HOLDINFO_MANUAL_HOLD => 65602

    /**
     * Native name: DEBUG_FLR_HOLDINFO_NOTIFICATION_ALIASES
     * @type {Integer (Int32)}
     */
    static HOLDINFO_NOTIFICATION_ALIASES => 65603

    /**
     * Native name: DEBUG_FLR_HOLDINFO_LAST_SEEN_HOLD_DATE
     * @type {Integer (Int32)}
     */
    static HOLDINFO_LAST_SEEN_HOLD_DATE => 65604

    /**
     * Native name: DEBUG_FLR_HOLDINFO_RECOMMEND_HOLD
     * @type {Integer (Int32)}
     */
    static HOLDINFO_RECOMMEND_HOLD => 65605

    /**
     * Native name: DEBUG_FLR_FAILURE_PROBLEM_CLASS
     * @type {Integer (Int32)}
     */
    static FAILURE_PROBLEM_CLASS => 65606

    /**
     * Native name: DEBUG_FLR_FAILURE_EXCEPTION_CODE
     * @type {Integer (Int32)}
     */
    static FAILURE_EXCEPTION_CODE => 65607

    /**
     * Native name: DEBUG_FLR_FAILURE_IMAGE_NAME
     * @type {Integer (Int32)}
     */
    static FAILURE_IMAGE_NAME => 65608

    /**
     * Native name: DEBUG_FLR_FAILURE_FUNCTION_NAME
     * @type {Integer (Int32)}
     */
    static FAILURE_FUNCTION_NAME => 65609

    /**
     * Native name: DEBUG_FLR_FAILURE_SYMBOL_NAME
     * @type {Integer (Int32)}
     */
    static FAILURE_SYMBOL_NAME => 65610

    /**
     * Native name: DEBUG_FLR_FOLLOWUP_BEFORE_RETRACER
     * @type {Integer (Int32)}
     */
    static FOLLOWUP_BEFORE_RETRACER => 65611

    /**
     * Native name: DEBUG_FLR_END_MESSAGE
     * @type {Integer (Int32)}
     */
    static END_MESSAGE => 65612

    /**
     * Native name: DEBUG_FLR_FEATURE_PATH
     * @type {Integer (Int32)}
     */
    static FEATURE_PATH => 65613

    /**
     * Native name: DEBUG_FLR_USER_MODE_BUCKET
     * @type {Integer (Int32)}
     */
    static USER_MODE_BUCKET => 65614

    /**
     * Native name: DEBUG_FLR_USER_MODE_BUCKET_INDEX
     * @type {Integer (Int32)}
     */
    static USER_MODE_BUCKET_INDEX => 65615

    /**
     * Native name: DEBUG_FLR_USER_MODE_BUCKET_EVENTTYPE
     * @type {Integer (Int32)}
     */
    static USER_MODE_BUCKET_EVENTTYPE => 65616

    /**
     * Native name: DEBUG_FLR_USER_MODE_BUCKET_REPORTGUID
     * @type {Integer (Int32)}
     */
    static USER_MODE_BUCKET_REPORTGUID => 65617

    /**
     * Native name: DEBUG_FLR_USER_MODE_BUCKET_REPORTCREATIONTIME
     * @type {Integer (Int32)}
     */
    static USER_MODE_BUCKET_REPORTCREATIONTIME => 65618

    /**
     * Native name: DEBUG_FLR_USER_MODE_BUCKET_P0
     * @type {Integer (Int32)}
     */
    static USER_MODE_BUCKET_P0 => 65619

    /**
     * Native name: DEBUG_FLR_USER_MODE_BUCKET_P1
     * @type {Integer (Int32)}
     */
    static USER_MODE_BUCKET_P1 => 65620

    /**
     * Native name: DEBUG_FLR_USER_MODE_BUCKET_P2
     * @type {Integer (Int32)}
     */
    static USER_MODE_BUCKET_P2 => 65621

    /**
     * Native name: DEBUG_FLR_USER_MODE_BUCKET_P3
     * @type {Integer (Int32)}
     */
    static USER_MODE_BUCKET_P3 => 65622

    /**
     * Native name: DEBUG_FLR_USER_MODE_BUCKET_P4
     * @type {Integer (Int32)}
     */
    static USER_MODE_BUCKET_P4 => 65623

    /**
     * Native name: DEBUG_FLR_USER_MODE_BUCKET_P5
     * @type {Integer (Int32)}
     */
    static USER_MODE_BUCKET_P5 => 65624

    /**
     * Native name: DEBUG_FLR_USER_MODE_BUCKET_P6
     * @type {Integer (Int32)}
     */
    static USER_MODE_BUCKET_P6 => 65625

    /**
     * Native name: DEBUG_FLR_USER_MODE_BUCKET_P7
     * @type {Integer (Int32)}
     */
    static USER_MODE_BUCKET_P7 => 65626

    /**
     * Native name: DEBUG_FLR_USER_MODE_BUCKET_STRING
     * @type {Integer (Int32)}
     */
    static USER_MODE_BUCKET_STRING => 65627

    /**
     * Native name: DEBUG_FLR_CRITICAL_PROCESS_REPORTGUID
     * @type {Integer (Int32)}
     */
    static CRITICAL_PROCESS_REPORTGUID => 65628

    /**
     * Native name: DEBUG_FLR_FAILURE_MODULE_NAME
     * @type {Integer (Int32)}
     */
    static FAILURE_MODULE_NAME => 65629

    /**
     * Native name: DEBUG_FLR_PLATFORM_BUCKET_STRING
     * @type {Integer (Int32)}
     */
    static PLATFORM_BUCKET_STRING => 65630

    /**
     * Native name: DEBUG_FLR_DRIVER_HARDWARE_VENDOR_NAME
     * @type {Integer (Int32)}
     */
    static DRIVER_HARDWARE_VENDOR_NAME => 65631

    /**
     * Native name: DEBUG_FLR_DRIVER_HARDWARE_SUBVENDOR_NAME
     * @type {Integer (Int32)}
     */
    static DRIVER_HARDWARE_SUBVENDOR_NAME => 65632

    /**
     * Native name: DEBUG_FLR_DRIVER_HARDWARE_DEVICE_NAME
     * @type {Integer (Int32)}
     */
    static DRIVER_HARDWARE_DEVICE_NAME => 65633

    /**
     * Native name: DEBUG_FLR_FAULTING_SOURCE_COMMIT_ID
     * @type {Integer (Int32)}
     */
    static FAULTING_SOURCE_COMMIT_ID => 65634

    /**
     * Native name: DEBUG_FLR_FAULTING_SOURCE_CONTROL_TYPE
     * @type {Integer (Int32)}
     */
    static FAULTING_SOURCE_CONTROL_TYPE => 65635

    /**
     * Native name: DEBUG_FLR_FAULTING_SOURCE_PROJECT
     * @type {Integer (Int32)}
     */
    static FAULTING_SOURCE_PROJECT => 65636

    /**
     * Native name: DEBUG_FLR_FAULTING_SOURCE_REPO_ID
     * @type {Integer (Int32)}
     */
    static FAULTING_SOURCE_REPO_ID => 65637

    /**
     * Native name: DEBUG_FLR_FAULTING_SOURCE_REPO_URL
     * @type {Integer (Int32)}
     */
    static FAULTING_SOURCE_REPO_URL => 65638

    /**
     * Native name: DEBUG_FLR_FAULTING_SOURCE_SRV_COMMAND
     * @type {Integer (Int32)}
     */
    static FAULTING_SOURCE_SRV_COMMAND => 65639

    /**
     * Native name: DEBUG_FLR_USERMODE_DATA
     * @type {Integer (Int32)}
     */
    static USERMODE_DATA => 1048576

    /**
     * Native name: DEBUG_FLR_THREAD_ATTRIBUTES
     * @type {Integer (Int32)}
     */
    static THREAD_ATTRIBUTES => 1048577

    /**
     * Native name: DEBUG_FLR_PROBLEM_CLASSES
     * @type {Integer (Int32)}
     */
    static PROBLEM_CLASSES => 1048578

    /**
     * Native name: DEBUG_FLR_PRIMARY_PROBLEM_CLASS
     * @type {Integer (Int32)}
     */
    static PRIMARY_PROBLEM_CLASS => 1048579

    /**
     * Native name: DEBUG_FLR_PRIMARY_PROBLEM_CLASS_DATA
     * @type {Integer (Int32)}
     */
    static PRIMARY_PROBLEM_CLASS_DATA => 1048580

    /**
     * Native name: DEBUG_FLR_UNRESPONSIVE_UI_PROBLEM_CLASS
     * @type {Integer (Int32)}
     */
    static UNRESPONSIVE_UI_PROBLEM_CLASS => 1048581

    /**
     * Native name: DEBUG_FLR_UNRESPONSIVE_UI_PROBLEM_CLASS_DATA
     * @type {Integer (Int32)}
     */
    static UNRESPONSIVE_UI_PROBLEM_CLASS_DATA => 1048582

    /**
     * Native name: DEBUG_FLR_DERIVED_WAIT_CHAIN
     * @type {Integer (Int32)}
     */
    static DERIVED_WAIT_CHAIN => 1048583

    /**
     * Native name: DEBUG_FLR_HANG_DATA_NEEDED
     * @type {Integer (Int32)}
     */
    static HANG_DATA_NEEDED => 1048584

    /**
     * Native name: DEBUG_FLR_PROBLEM_CODE_PATH_HASH
     * @type {Integer (Int32)}
     */
    static PROBLEM_CODE_PATH_HASH => 1048585

    /**
     * Native name: DEBUG_FLR_SUSPECT_CODE_PATH_HASH
     * @type {Integer (Int32)}
     */
    static SUSPECT_CODE_PATH_HASH => 1048586

    /**
     * Native name: DEBUG_FLR_LOADERLOCK_IN_WAIT_CHAIN
     * @type {Integer (Int32)}
     */
    static LOADERLOCK_IN_WAIT_CHAIN => 1048587

    /**
     * Native name: DEBUG_FLR_XPROC_HANG
     * @type {Integer (Int32)}
     */
    static XPROC_HANG => 1048588

    /**
     * Native name: DEBUG_FLR_DEADLOCK_INPROC
     * @type {Integer (Int32)}
     */
    static DEADLOCK_INPROC => 1048589

    /**
     * Native name: DEBUG_FLR_DEADLOCK_XPROC
     * @type {Integer (Int32)}
     */
    static DEADLOCK_XPROC => 1048590

    /**
     * Native name: DEBUG_FLR_WCT_XML_AVAILABLE
     * @type {Integer (Int32)}
     */
    static WCT_XML_AVAILABLE => 1048591

    /**
     * Native name: DEBUG_FLR_XPROC_DUMP_AVAILABLE
     * @type {Integer (Int32)}
     */
    static XPROC_DUMP_AVAILABLE => 1048592

    /**
     * Native name: DEBUG_FLR_DESKTOP_HEAP_MISSING
     * @type {Integer (Int32)}
     */
    static DESKTOP_HEAP_MISSING => 1048593

    /**
     * Native name: DEBUG_FLR_HANG_REPORT_THREAD_IS_IDLE
     * @type {Integer (Int32)}
     */
    static HANG_REPORT_THREAD_IS_IDLE => 1048594

    /**
     * Native name: DEBUG_FLR_FAULT_THREAD_SHA1_HASH_MF
     * @type {Integer (Int32)}
     */
    static FAULT_THREAD_SHA1_HASH_MF => 1048595

    /**
     * Native name: DEBUG_FLR_FAULT_THREAD_SHA1_HASH_MFO
     * @type {Integer (Int32)}
     */
    static FAULT_THREAD_SHA1_HASH_MFO => 1048596

    /**
     * Native name: DEBUG_FLR_FAULT_THREAD_SHA1_HASH_M
     * @type {Integer (Int32)}
     */
    static FAULT_THREAD_SHA1_HASH_M => 1048597

    /**
     * Native name: DEBUG_FLR_WAIT_CHAIN_COMMAND
     * @type {Integer (Int32)}
     */
    static WAIT_CHAIN_COMMAND => 1048598

    /**
     * Native name: DEBUG_FLR_NTGLOBALFLAG
     * @type {Integer (Int32)}
     */
    static NTGLOBALFLAG => 1048599

    /**
     * Native name: DEBUG_FLR_APPVERIFERFLAGS
     * @type {Integer (Int32)}
     */
    static APPVERIFERFLAGS => 1048600

    /**
     * Native name: DEBUG_FLR_MODLIST_SHA1_HASH
     * @type {Integer (Int32)}
     */
    static MODLIST_SHA1_HASH => 1048601

    /**
     * Native name: DEBUG_FLR_DUMP_TYPE
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE => 1048602

    /**
     * Native name: DEBUG_FLR_XCS_PATH
     * @type {Integer (Int32)}
     */
    static XCS_PATH => 1048603

    /**
     * Native name: DEBUG_FLR_LOADERLOCK_OWNER_API
     * @type {Integer (Int32)}
     */
    static LOADERLOCK_OWNER_API => 1048604

    /**
     * Native name: DEBUG_FLR_LOADERLOCK_BLOCKED_API
     * @type {Integer (Int32)}
     */
    static LOADERLOCK_BLOCKED_API => 1048605

    /**
     * Native name: DEBUG_FLR_MODLIST_TSCHKSUM_SHA1_HASH
     * @type {Integer (Int32)}
     */
    static MODLIST_TSCHKSUM_SHA1_HASH => 1048606

    /**
     * Native name: DEBUG_FLR_MODLIST_UNLOADED_SHA1_HASH
     * @type {Integer (Int32)}
     */
    static MODLIST_UNLOADED_SHA1_HASH => 1048607

    /**
     * Native name: DEBUG_FLR_MACHINE_INFO_SHA1_HASH
     * @type {Integer (Int32)}
     */
    static MACHINE_INFO_SHA1_HASH => 1048608

    /**
     * Native name: DEBUG_FLR_URLS_DISCOVERED
     * @type {Integer (Int32)}
     */
    static URLS_DISCOVERED => 1048609

    /**
     * Native name: DEBUG_FLR_URLS
     * @type {Integer (Int32)}
     */
    static URLS => 1048610

    /**
     * Native name: DEBUG_FLR_URL_ENTRY
     * @type {Integer (Int32)}
     */
    static URL_ENTRY => 1048611

    /**
     * Native name: DEBUG_FLR_WATSON_IBUCKET_S1_RESP
     * @type {Integer (Int32)}
     */
    static WATSON_IBUCKET_S1_RESP => 1048612

    /**
     * Native name: DEBUG_FLR_WATSON_IBUCKETTABLE_S1_RESP
     * @type {Integer (Int32)}
     */
    static WATSON_IBUCKETTABLE_S1_RESP => 1048613

    /**
     * Native name: DEBUG_FLR_SEARCH_HANG
     * @type {Integer (Int32)}
     */
    static SEARCH_HANG => 1048614

    /**
     * Native name: DEBUG_FLR_WER_DATA_COLLECTION_INFO
     * @type {Integer (Int32)}
     */
    static WER_DATA_COLLECTION_INFO => 1048615

    /**
     * Native name: DEBUG_FLR_WER_MACHINE_ID
     * @type {Integer (Int32)}
     */
    static WER_MACHINE_ID => 1048616

    /**
     * Native name: DEBUG_FLR_ULS_SCRIPT_EXCEPTION
     * @type {Integer (Int32)}
     */
    static ULS_SCRIPT_EXCEPTION => 1048617

    /**
     * Native name: DEBUG_FLR_LCIE_ISO_AVAILABLE
     * @type {Integer (Int32)}
     */
    static LCIE_ISO_AVAILABLE => 1048618

    /**
     * Native name: DEBUG_FLR_SHOW_LCIE_ISO_DATA
     * @type {Integer (Int32)}
     */
    static SHOW_LCIE_ISO_DATA => 1048619

    /**
     * Native name: DEBUG_FLR_URL_LCIE_ENTRY
     * @type {Integer (Int32)}
     */
    static URL_LCIE_ENTRY => 1048620

    /**
     * Native name: DEBUG_FLR_URL_URLMON_ENTRY
     * @type {Integer (Int32)}
     */
    static URL_URLMON_ENTRY => 1048621

    /**
     * Native name: DEBUG_FLR_URL_XMLHTTPREQ_SYNC_ENTRY
     * @type {Integer (Int32)}
     */
    static URL_XMLHTTPREQ_SYNC_ENTRY => 1048622

    /**
     * Native name: DEBUG_FLR_FAULTING_LOCAL_VARIABLE_NAME
     * @type {Integer (Int32)}
     */
    static FAULTING_LOCAL_VARIABLE_NAME => 1048623

    /**
     * Native name: DEBUG_FLR_MODULE_LIST
     * @type {Integer (Int32)}
     */
    static MODULE_LIST => 1048624

    /**
     * Native name: DEBUG_FLR_DUMP_FLAGS
     * @type {Integer (Int32)}
     */
    static DUMP_FLAGS => 1048625

    /**
     * Native name: DEBUG_FLR_APPLICATION_VERIFIER_LOADED
     * @type {Integer (Int32)}
     */
    static APPLICATION_VERIFIER_LOADED => 1048626

    /**
     * Native name: DEBUG_FLR_DUMP_CLASS
     * @type {Integer (Int32)}
     */
    static DUMP_CLASS => 1048627

    /**
     * Native name: DEBUG_FLR_DUMP_QUALIFIER
     * @type {Integer (Int32)}
     */
    static DUMP_QUALIFIER => 1048628

    /**
     * Native name: DEBUG_FLR_KM_MODULE_LIST
     * @type {Integer (Int32)}
     */
    static KM_MODULE_LIST => 1048629

    /**
     * Native name: DEBUG_FLR_EXCEPTION_CODE_STR_deprecated
     * @type {Integer (Int32)}
     */
    static EXCEPTION_CODE_STR_deprecated => 1052672

    /**
     * Native name: DEBUG_FLR_BUCKET_ID_PREFIX_STR
     * @type {Integer (Int32)}
     */
    static BUCKET_ID_PREFIX_STR => 1052673

    /**
     * Native name: DEBUG_FLR_BUCKET_ID_MODULE_STR
     * @type {Integer (Int32)}
     */
    static BUCKET_ID_MODULE_STR => 1052674

    /**
     * Native name: DEBUG_FLR_BUCKET_ID_MODVER_STR
     * @type {Integer (Int32)}
     */
    static BUCKET_ID_MODVER_STR => 1052675

    /**
     * Native name: DEBUG_FLR_BUCKET_ID_FUNCTION_STR
     * @type {Integer (Int32)}
     */
    static BUCKET_ID_FUNCTION_STR => 1052676

    /**
     * Native name: DEBUG_FLR_BUCKET_ID_OFFSET
     * @type {Integer (Int32)}
     */
    static BUCKET_ID_OFFSET => 1052677

    /**
     * Native name: DEBUG_FLR_OS_BUILD
     * @type {Integer (Int32)}
     */
    static OS_BUILD => 1052678

    /**
     * Native name: DEBUG_FLR_OS_SERVICEPACK
     * @type {Integer (Int32)}
     */
    static OS_SERVICEPACK => 1052679

    /**
     * Native name: DEBUG_FLR_OS_BRANCH
     * @type {Integer (Int32)}
     */
    static OS_BRANCH => 1052680

    /**
     * Native name: DEBUG_FLR_OS_BUILD_TIMESTAMP_LAB
     * @type {Integer (Int32)}
     */
    static OS_BUILD_TIMESTAMP_LAB => 1052681

    /**
     * Native name: DEBUG_FLR_OS_VERSION
     * @type {Integer (Int32)}
     */
    static OS_VERSION => 1052682

    /**
     * Native name: DEBUG_FLR_BUCKET_ID_TIMEDATESTAMP
     * @type {Integer (Int32)}
     */
    static BUCKET_ID_TIMEDATESTAMP => 1052683

    /**
     * Native name: DEBUG_FLR_BUCKET_ID_CHECKSUM
     * @type {Integer (Int32)}
     */
    static BUCKET_ID_CHECKSUM => 1052684

    /**
     * Native name: DEBUG_FLR_OS_FLAVOR
     * @type {Integer (Int32)}
     */
    static OS_FLAVOR => 1052685

    /**
     * Native name: DEBUG_FLR_BUCKET_ID_FLAVOR_STR
     * @type {Integer (Int32)}
     */
    static BUCKET_ID_FLAVOR_STR => 1052686

    /**
     * Native name: DEBUG_FLR_OS_SKU
     * @type {Integer (Int32)}
     */
    static OS_SKU => 1052687

    /**
     * Native name: DEBUG_FLR_OS_PRODUCT_TYPE
     * @type {Integer (Int32)}
     */
    static OS_PRODUCT_TYPE => 1052688

    /**
     * Native name: DEBUG_FLR_OS_SUITE_MASK
     * @type {Integer (Int32)}
     */
    static OS_SUITE_MASK => 1052689

    /**
     * Native name: DEBUG_FLR_USER_LCID
     * @type {Integer (Int32)}
     */
    static USER_LCID => 1052690

    /**
     * Native name: DEBUG_FLR_OS_REVISION
     * @type {Integer (Int32)}
     */
    static OS_REVISION => 1052691

    /**
     * Native name: DEBUG_FLR_OS_NAME
     * @type {Integer (Int32)}
     */
    static OS_NAME => 1052692

    /**
     * Native name: DEBUG_FLR_OS_NAME_EDITION
     * @type {Integer (Int32)}
     */
    static OS_NAME_EDITION => 1052693

    /**
     * Native name: DEBUG_FLR_OS_PLATFORM_ARCH
     * @type {Integer (Int32)}
     */
    static OS_PLATFORM_ARCH => 1052694

    /**
     * Native name: DEBUG_FLR_OS_SERVICEPACK_deprecated
     * @type {Integer (Int32)}
     */
    static OS_SERVICEPACK_deprecated => 1052695

    /**
     * Native name: DEBUG_FLR_OS_LOCALE
     * @type {Integer (Int32)}
     */
    static OS_LOCALE => 1052696

    /**
     * Native name: DEBUG_FLR_OS_BUILD_TIMESTAMP_ISO
     * @type {Integer (Int32)}
     */
    static OS_BUILD_TIMESTAMP_ISO => 1052697

    /**
     * Native name: DEBUG_FLR_USER_LCID_STR
     * @type {Integer (Int32)}
     */
    static USER_LCID_STR => 1052698

    /**
     * Native name: DEBUG_FLR_ANALYSIS_SESSION_TIME
     * @type {Integer (Int32)}
     */
    static ANALYSIS_SESSION_TIME => 1052699

    /**
     * Native name: DEBUG_FLR_ANALYSIS_SESSION_HOST
     * @type {Integer (Int32)}
     */
    static ANALYSIS_SESSION_HOST => 1052700

    /**
     * Native name: DEBUG_FLR_ANALYSIS_SESSION_ELAPSED_TIME
     * @type {Integer (Int32)}
     */
    static ANALYSIS_SESSION_ELAPSED_TIME => 1052701

    /**
     * Native name: DEBUG_FLR_ANALYSIS_VERSION
     * @type {Integer (Int32)}
     */
    static ANALYSIS_VERSION => 1052702

    /**
     * Native name: DEBUG_FLR_BUCKET_ID_IMAGE_STR
     * @type {Integer (Int32)}
     */
    static BUCKET_ID_IMAGE_STR => 1052703

    /**
     * Native name: DEBUG_FLR_BUCKET_ID_PRIVATE
     * @type {Integer (Int32)}
     */
    static BUCKET_ID_PRIVATE => 1052704

    /**
     * Native name: DEBUG_FLR_ANALYSIS_REPROCESS
     * @type {Integer (Int32)}
     */
    static ANALYSIS_REPROCESS => 1052705

    /**
     * Native name: DEBUG_FLR_OS_MAJOR
     * @type {Integer (Int32)}
     */
    static OS_MAJOR => 1052706

    /**
     * Native name: DEBUG_FLR_OS_MINOR
     * @type {Integer (Int32)}
     */
    static OS_MINOR => 1052707

    /**
     * Native name: DEBUG_FLR_OS_BUILD_STRING
     * @type {Integer (Int32)}
     */
    static OS_BUILD_STRING => 1052708

    /**
     * Native name: DEBUG_FLR_OS_LOCALE_LCID
     * @type {Integer (Int32)}
     */
    static OS_LOCALE_LCID => 1052709

    /**
     * Native name: DEBUG_FLR_OS_PLATFORM_ID
     * @type {Integer (Int32)}
     */
    static OS_PLATFORM_ID => 1052710

    /**
     * Native name: DEBUG_FLR_OS_BUILD_LAYERS_XML
     * @type {Integer (Int32)}
     */
    static OS_BUILD_LAYERS_XML => 1052711

    /**
     * Native name: DEBUG_FLR_OSBUILD_deprecated
     * @type {Integer (Int32)}
     */
    static OSBUILD_deprecated => 1052928

    /**
     * Native name: DEBUG_FLR_BUILDOSVER_STR_deprecated
     * @type {Integer (Int32)}
     */
    static BUILDOSVER_STR_deprecated => 1052929

    /**
     * Native name: DEBUG_FLR_DEBUG_ANALYSIS
     * @type {Integer (Int32)}
     */
    static DEBUG_ANALYSIS => 1118208

    /**
     * Native name: DEBUG_FLR_KEYVALUE_ANALYSIS
     * @type {Integer (Int32)}
     */
    static KEYVALUE_ANALYSIS => 1122304

    /**
     * Native name: DEBUG_FLR_KEY_VALUES_STRING
     * @type {Integer (Int32)}
     */
    static KEY_VALUES_STRING => 1122560

    /**
     * Native name: DEBUG_FLR_KEY_VALUES_VARIANT
     * @type {Integer (Int32)}
     */
    static KEY_VALUES_VARIANT => 1122816

    /**
     * Native name: DEBUG_FLR_TIMELINE_ANALYSIS
     * @type {Integer (Int32)}
     */
    static TIMELINE_ANALYSIS => 1126400

    /**
     * Native name: DEBUG_FLR_TIMELINE_TIMES
     * @type {Integer (Int32)}
     */
    static TIMELINE_TIMES => 1126401

    /**
     * Native name: DEBUG_FLR_STREAM_ANALYSIS
     * @type {Integer (Int32)}
     */
    static STREAM_ANALYSIS => 1130496

    /**
     * Native name: DEBUG_FLR_MEMORY_ANALYSIS
     * @type {Integer (Int32)}
     */
    static MEMORY_ANALYSIS => 1134592

    /**
     * Native name: DEBUG_FLR_STACKHASH_ANALYSIS
     * @type {Integer (Int32)}
     */
    static STACKHASH_ANALYSIS => 1138688

    /**
     * Native name: DEBUG_FLR_PROCESSES_ANALYSIS
     * @type {Integer (Int32)}
     */
    static PROCESSES_ANALYSIS => 1142784

    /**
     * Native name: DEBUG_FLR_SERVICE_ANALYSIS
     * @type {Integer (Int32)}
     */
    static SERVICE_ANALYSIS => 1146880

    /**
     * Native name: DEBUG_FLR_ADDITIONAL_XML
     * @type {Integer (Int32)}
     */
    static ADDITIONAL_XML => 1150976

    /**
     * Native name: DEBUG_FLR_STACK
     * @type {Integer (Int32)}
     */
    static STACK => 2097152

    /**
     * Native name: DEBUG_FLR_FOLLOWUP_CONTEXT
     * @type {Integer (Int32)}
     */
    static FOLLOWUP_CONTEXT => 2097153

    /**
     * Native name: DEBUG_FLR_XML_MODULE_LIST
     * @type {Integer (Int32)}
     */
    static XML_MODULE_LIST => 2097154

    /**
     * Native name: DEBUG_FLR_STACK_FRAME
     * @type {Integer (Int32)}
     */
    static STACK_FRAME => 2097155

    /**
     * Native name: DEBUG_FLR_STACK_FRAME_NUMBER
     * @type {Integer (Int32)}
     */
    static STACK_FRAME_NUMBER => 2097156

    /**
     * Native name: DEBUG_FLR_STACK_FRAME_INSTRUCTION
     * @type {Integer (Int32)}
     */
    static STACK_FRAME_INSTRUCTION => 2097157

    /**
     * Native name: DEBUG_FLR_STACK_FRAME_SYMBOL
     * @type {Integer (Int32)}
     */
    static STACK_FRAME_SYMBOL => 2097158

    /**
     * Native name: DEBUG_FLR_STACK_FRAME_SYMBOL_OFFSET
     * @type {Integer (Int32)}
     */
    static STACK_FRAME_SYMBOL_OFFSET => 2097159

    /**
     * Native name: DEBUG_FLR_STACK_FRAME_MODULE
     * @type {Integer (Int32)}
     */
    static STACK_FRAME_MODULE => 2097160

    /**
     * Native name: DEBUG_FLR_STACK_FRAME_IMAGE
     * @type {Integer (Int32)}
     */
    static STACK_FRAME_IMAGE => 2097161

    /**
     * Native name: DEBUG_FLR_STACK_FRAME_FUNCTION
     * @type {Integer (Int32)}
     */
    static STACK_FRAME_FUNCTION => 2097162

    /**
     * Native name: DEBUG_FLR_STACK_FRAME_FLAGS
     * @type {Integer (Int32)}
     */
    static STACK_FRAME_FLAGS => 2097163

    /**
     * Native name: DEBUG_FLR_CONTEXT_COMMAND
     * @type {Integer (Int32)}
     */
    static CONTEXT_COMMAND => 2097164

    /**
     * Native name: DEBUG_FLR_CONTEXT_FLAGS
     * @type {Integer (Int32)}
     */
    static CONTEXT_FLAGS => 2097165

    /**
     * Native name: DEBUG_FLR_CONTEXT_ORDER
     * @type {Integer (Int32)}
     */
    static CONTEXT_ORDER => 2097166

    /**
     * Native name: DEBUG_FLR_CONTEXT_SYSTEM
     * @type {Integer (Int32)}
     */
    static CONTEXT_SYSTEM => 2097167

    /**
     * Native name: DEBUG_FLR_CONTEXT_ID
     * @type {Integer (Int32)}
     */
    static CONTEXT_ID => 2097168

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO => 2097169

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_INDEX
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_INDEX => 2097170

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_NAME
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_NAME => 2097171

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_IMAGE_NAME
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_IMAGE_NAME => 2097172

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_IMAGE_PATH
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_IMAGE_PATH => 2097173

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_CHECKSUM
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_CHECKSUM => 2097174

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_TIMESTAMP
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_TIMESTAMP => 2097175

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_UNLOADED
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_UNLOADED => 2097176

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_ON_STACK
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_ON_STACK => 2097177

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_FIXED_FILE_VER
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_FIXED_FILE_VER => 2097178

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_FIXED_PROD_VER
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_FIXED_PROD_VER => 2097179

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_STRING_FILE_VER
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_STRING_FILE_VER => 2097180

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_STRING_PROD_VER
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_STRING_PROD_VER => 2097181

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_COMPANY_NAME
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_COMPANY_NAME => 2097182

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_FILE_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_FILE_DESCRIPTION => 2097183

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_INTERNAL_NAME
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_INTERNAL_NAME => 2097184

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_ORIG_FILE_NAME
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_ORIG_FILE_NAME => 2097185

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_BASE
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_BASE => 2097186

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_SIZE
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_SIZE => 2097187

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_PRODUCT_NAME
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_PRODUCT_NAME => 2097188

    /**
     * Native name: DEBUG_FLR_PROCESS_INFO
     * @type {Integer (Int32)}
     */
    static PROCESS_INFO => 2097189

    /**
     * Native name: DEBUG_FLR_EXCEPTION_MODULE_INFO
     * @type {Integer (Int32)}
     */
    static EXCEPTION_MODULE_INFO => 2097190

    /**
     * Native name: DEBUG_FLR_CONTEXT_FOLLOWUP_INDEX
     * @type {Integer (Int32)}
     */
    static CONTEXT_FOLLOWUP_INDEX => 2097191

    /**
     * Native name: DEBUG_FLR_XML_GLOBALATTRIBUTE_LIST
     * @type {Integer (Int32)}
     */
    static XML_GLOBALATTRIBUTE_LIST => 2097192

    /**
     * Native name: DEBUG_FLR_XML_ATTRIBUTE_LIST
     * @type {Integer (Int32)}
     */
    static XML_ATTRIBUTE_LIST => 2097193

    /**
     * Native name: DEBUG_FLR_XML_ATTRIBUTE
     * @type {Integer (Int32)}
     */
    static XML_ATTRIBUTE => 2097194

    /**
     * Native name: DEBUG_FLR_XML_ATTRIBUTE_NAME
     * @type {Integer (Int32)}
     */
    static XML_ATTRIBUTE_NAME => 2097195

    /**
     * Native name: DEBUG_FLR_XML_ATTRIBUTE_VALUE
     * @type {Integer (Int32)}
     */
    static XML_ATTRIBUTE_VALUE => 2097196

    /**
     * Native name: DEBUG_FLR_XML_ATTRIBUTE_D1VALUE
     * @type {Integer (Int32)}
     */
    static XML_ATTRIBUTE_D1VALUE => 2097197

    /**
     * Native name: DEBUG_FLR_XML_ATTRIBUTE_D2VALUE
     * @type {Integer (Int32)}
     */
    static XML_ATTRIBUTE_D2VALUE => 2097198

    /**
     * Native name: DEBUG_FLR_XML_ATTRIBUTE_DOVALUE
     * @type {Integer (Int32)}
     */
    static XML_ATTRIBUTE_DOVALUE => 2097199

    /**
     * Native name: DEBUG_FLR_XML_ATTRIBUTE_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static XML_ATTRIBUTE_VALUE_TYPE => 2097200

    /**
     * Native name: DEBUG_FLR_XML_ATTRIBUTE_FRAME_NUMBER
     * @type {Integer (Int32)}
     */
    static XML_ATTRIBUTE_FRAME_NUMBER => 2097201

    /**
     * Native name: DEBUG_FLR_XML_ATTRIBUTE_THREAD_INDEX
     * @type {Integer (Int32)}
     */
    static XML_ATTRIBUTE_THREAD_INDEX => 2097202

    /**
     * Native name: DEBUG_FLR_XML_PROBLEMCLASS_LIST
     * @type {Integer (Int32)}
     */
    static XML_PROBLEMCLASS_LIST => 2097203

    /**
     * Native name: DEBUG_FLR_XML_PROBLEMCLASS
     * @type {Integer (Int32)}
     */
    static XML_PROBLEMCLASS => 2097204

    /**
     * Native name: DEBUG_FLR_XML_PROBLEMCLASS_NAME
     * @type {Integer (Int32)}
     */
    static XML_PROBLEMCLASS_NAME => 2097205

    /**
     * Native name: DEBUG_FLR_XML_PROBLEMCLASS_VALUE
     * @type {Integer (Int32)}
     */
    static XML_PROBLEMCLASS_VALUE => 2097206

    /**
     * Native name: DEBUG_FLR_XML_PROBLEMCLASS_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static XML_PROBLEMCLASS_VALUE_TYPE => 2097207

    /**
     * Native name: DEBUG_FLR_XML_PROBLEMCLASS_FRAME_NUMBER
     * @type {Integer (Int32)}
     */
    static XML_PROBLEMCLASS_FRAME_NUMBER => 2097208

    /**
     * Native name: DEBUG_FLR_XML_PROBLEMCLASS_THREAD_INDEX
     * @type {Integer (Int32)}
     */
    static XML_PROBLEMCLASS_THREAD_INDEX => 2097209

    /**
     * Native name: DEBUG_FLR_XML_STACK_FRAME_TRIAGE_STATUS
     * @type {Integer (Int32)}
     */
    static XML_STACK_FRAME_TRIAGE_STATUS => 2097210

    /**
     * Native name: DEBUG_FLR_CONTEXT_METADATA
     * @type {Integer (Int32)}
     */
    static CONTEXT_METADATA => 2097211

    /**
     * Native name: DEBUG_FLR_STACK_FRAMES
     * @type {Integer (Int32)}
     */
    static STACK_FRAMES => 2097212

    /**
     * Native name: DEBUG_FLR_XML_ENCODED_OFFSETS
     * @type {Integer (Int32)}
     */
    static XML_ENCODED_OFFSETS => 2097213

    /**
     * Native name: DEBUG_FLR_FA_PERF_DATA
     * @type {Integer (Int32)}
     */
    static FA_PERF_DATA => 2097214

    /**
     * Native name: DEBUG_FLR_FA_PERF_ITEM
     * @type {Integer (Int32)}
     */
    static FA_PERF_ITEM => 2097215

    /**
     * Native name: DEBUG_FLR_FA_PERF_ITEM_NAME
     * @type {Integer (Int32)}
     */
    static FA_PERF_ITEM_NAME => 2097216

    /**
     * Native name: DEBUG_FLR_FA_PERF_ITERATIONS
     * @type {Integer (Int32)}
     */
    static FA_PERF_ITERATIONS => 2097217

    /**
     * Native name: DEBUG_FLR_FA_PERF_ELAPSED_MS
     * @type {Integer (Int32)}
     */
    static FA_PERF_ELAPSED_MS => 2097218

    /**
     * Native name: DEBUG_FLR_STACK_SHA1_HASH_MF
     * @type {Integer (Int32)}
     */
    static STACK_SHA1_HASH_MF => 2097219

    /**
     * Native name: DEBUG_FLR_STACK_SHA1_HASH_MFO
     * @type {Integer (Int32)}
     */
    static STACK_SHA1_HASH_MFO => 2097220

    /**
     * Native name: DEBUG_FLR_STACK_SHA1_HASH_M
     * @type {Integer (Int32)}
     */
    static STACK_SHA1_HASH_M => 2097221

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_SYMBOL_TYPE
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_SYMBOL_TYPE => 2097222

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_FILE_FLAGS
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_FILE_FLAGS => 2097223

    /**
     * Native name: DEBUG_FLR_STACK_FRAME_MODULE_BASE
     * @type {Integer (Int32)}
     */
    static STACK_FRAME_MODULE_BASE => 2097224

    /**
     * Native name: DEBUG_FLR_STACK_FRAME_SRC
     * @type {Integer (Int32)}
     */
    static STACK_FRAME_SRC => 2097225

    /**
     * Native name: DEBUG_FLR_XML_SYSTEMINFO
     * @type {Integer (Int32)}
     */
    static XML_SYSTEMINFO => 2097226

    /**
     * Native name: DEBUG_FLR_XML_SYSTEMINFO_SYSTEMMANUFACTURER
     * @type {Integer (Int32)}
     */
    static XML_SYSTEMINFO_SYSTEMMANUFACTURER => 2097227

    /**
     * Native name: DEBUG_FLR_XML_SYSTEMINFO_SYSTEMMODEL
     * @type {Integer (Int32)}
     */
    static XML_SYSTEMINFO_SYSTEMMODEL => 2097228

    /**
     * Native name: DEBUG_FLR_XML_SYSTEMINFO_SYSTEMMARKER
     * @type {Integer (Int32)}
     */
    static XML_SYSTEMINFO_SYSTEMMARKER => 2097229

    /**
     * Native name: DEBUG_FLR_FA_ADHOC_ANALYSIS_ITEMS
     * @type {Integer (Int32)}
     */
    static FA_ADHOC_ANALYSIS_ITEMS => 2097230

    /**
     * Native name: DEBUG_FLR_XML_APPLICATION_NAME
     * @type {Integer (Int32)}
     */
    static XML_APPLICATION_NAME => 2097231

    /**
     * Native name: DEBUG_FLR_XML_PACKAGE_MONIKER
     * @type {Integer (Int32)}
     */
    static XML_PACKAGE_MONIKER => 2097232

    /**
     * Native name: DEBUG_FLR_XML_PACKAGE_RELATIVE_APPLICATION_ID
     * @type {Integer (Int32)}
     */
    static XML_PACKAGE_RELATIVE_APPLICATION_ID => 2097233

    /**
     * Native name: DEBUG_FLR_XML_MODERN_ASYNC_REQUEST_OUTSTANDING
     * @type {Integer (Int32)}
     */
    static XML_MODERN_ASYNC_REQUEST_OUTSTANDING => 2097234

    /**
     * Native name: DEBUG_FLR_XML_EVENTTYPE
     * @type {Integer (Int32)}
     */
    static XML_EVENTTYPE => 2097235

    /**
     * Native name: DEBUG_FLR_XML_PACKAGE_NAME
     * @type {Integer (Int32)}
     */
    static XML_PACKAGE_NAME => 2097236

    /**
     * Native name: DEBUG_FLR_XML_PACKAGE_VERSION
     * @type {Integer (Int32)}
     */
    static XML_PACKAGE_VERSION => 2097237

    /**
     * Native name: DEBUG_FLR_FAILURE_LIST
     * @type {Integer (Int32)}
     */
    static FAILURE_LIST => 2097238

    /**
     * Native name: DEBUG_FLR_FAILURE_DISPLAY_NAME
     * @type {Integer (Int32)}
     */
    static FAILURE_DISPLAY_NAME => 2097239

    /**
     * Native name: DEBUG_FLR_FRAME_SOURCE_FILE_NAME
     * @type {Integer (Int32)}
     */
    static FRAME_SOURCE_FILE_NAME => 2097240

    /**
     * Native name: DEBUG_FLR_FRAME_SOURCE_FILE_PATH
     * @type {Integer (Int32)}
     */
    static FRAME_SOURCE_FILE_PATH => 2097241

    /**
     * Native name: DEBUG_FLR_FRAME_SOURCE_LINE_NUMBER
     * @type {Integer (Int32)}
     */
    static FRAME_SOURCE_LINE_NUMBER => 2097242

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_SYMSRV_IMAGE_STATUS
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_SYMSRV_IMAGE_STATUS => 2097243

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_SYMSRV_IMAGE_ERROR
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_SYMSRV_IMAGE_ERROR => 2097244

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_SYMSRV_IMAGE_DETAIL
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_SYMSRV_IMAGE_DETAIL => 2097245

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_SYMSRV_IMAGE_SEC
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_SYMSRV_IMAGE_SEC => 2097246

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_SYMSRV_PDB_STATUS
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_SYMSRV_PDB_STATUS => 2097247

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_SYMSRV_PDB_ERROR
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_SYMSRV_PDB_ERROR => 2097248

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_SYMSRV_PDB_DETAIL
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_SYMSRV_PDB_DETAIL => 2097249

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_SYMSRV_PDB_SEC
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_SYMSRV_PDB_SEC => 2097250

    /**
     * Native name: DEBUG_FLR_XML_MODULE_INFO_DRIVER_GROUP
     * @type {Integer (Int32)}
     */
    static XML_MODULE_INFO_DRIVER_GROUP => 2097251

    /**
     * Native name: DEBUG_FLR_REGISTRY_DATA
     * @type {Integer (Int32)}
     */
    static REGISTRY_DATA => 3145728

    /**
     * Native name: DEBUG_FLR_WMI_QUERY_DATA
     * @type {Integer (Int32)}
     */
    static WMI_QUERY_DATA => 3149824

    /**
     * Native name: DEBUG_FLR_USER_GLOBAL_ATTRIBUTES
     * @type {Integer (Int32)}
     */
    static USER_GLOBAL_ATTRIBUTES => 3153920

    /**
     * Native name: DEBUG_FLR_USER_THREAD_ATTRIBUTES
     * @type {Integer (Int32)}
     */
    static USER_THREAD_ATTRIBUTES => 3158016

    /**
     * Native name: DEBUG_FLR_USER_PROBLEM_CLASSES
     * @type {Integer (Int32)}
     */
    static USER_PROBLEM_CLASSES => 3162112

    /**
     * Native name: DEBUG_FLR_SM_COMPRESSION_FORMAT
     * @type {Integer (Int32)}
     */
    static SM_COMPRESSION_FORMAT => 1342177280

    /**
     * Native name: DEBUG_FLR_SM_SOURCE_PFN1
     * @type {Integer (Int32)}
     */
    static SM_SOURCE_PFN1 => 1342177281

    /**
     * Native name: DEBUG_FLR_SM_SOURCE_PFN2
     * @type {Integer (Int32)}
     */
    static SM_SOURCE_PFN2 => 1342177282

    /**
     * Native name: DEBUG_FLR_SM_SOURCE_OFFSET
     * @type {Integer (Int32)}
     */
    static SM_SOURCE_OFFSET => 1342177283

    /**
     * Native name: DEBUG_FLR_SM_SOURCE_SIZE
     * @type {Integer (Int32)}
     */
    static SM_SOURCE_SIZE => 1342177284

    /**
     * Native name: DEBUG_FLR_SM_TARGET_PFN
     * @type {Integer (Int32)}
     */
    static SM_TARGET_PFN => 1342177285

    /**
     * Native name: DEBUG_FLR_SM_BUFFER_HASH
     * @type {Integer (Int32)}
     */
    static SM_BUFFER_HASH => 1342177286

    /**
     * Native name: DEBUG_FLR_SM_ONEBIT_SOLUTION_COUNT
     * @type {Integer (Int32)}
     */
    static SM_ONEBIT_SOLUTION_COUNT => 1342177287

    /**
     * Native name: DEBUG_FLR_STORE_PRODUCT_ID
     * @type {Integer (Int32)}
     */
    static STORE_PRODUCT_ID => 1610612736

    /**
     * Native name: DEBUG_FLR_STORE_PRODUCT_DISPLAY_NAME
     * @type {Integer (Int32)}
     */
    static STORE_PRODUCT_DISPLAY_NAME => 1610612737

    /**
     * Native name: DEBUG_FLR_STORE_PRODUCT_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static STORE_PRODUCT_DESCRIPTION => 1610612738

    /**
     * Native name: DEBUG_FLR_STORE_PRODUCT_EXTENDED_NAME
     * @type {Integer (Int32)}
     */
    static STORE_PRODUCT_EXTENDED_NAME => 1610612739

    /**
     * Native name: DEBUG_FLR_STORE_PUBLISHER_ID
     * @type {Integer (Int32)}
     */
    static STORE_PUBLISHER_ID => 1610612740

    /**
     * Native name: DEBUG_FLR_STORE_PUBLISHER_NAME
     * @type {Integer (Int32)}
     */
    static STORE_PUBLISHER_NAME => 1610612741

    /**
     * Native name: DEBUG_FLR_STORE_PUBLISHER_CERTIFICATE_NAME
     * @type {Integer (Int32)}
     */
    static STORE_PUBLISHER_CERTIFICATE_NAME => 1610612742

    /**
     * Native name: DEBUG_FLR_STORE_DEVELOPER_NAME
     * @type {Integer (Int32)}
     */
    static STORE_DEVELOPER_NAME => 1610612743

    /**
     * Native name: DEBUG_FLR_STORE_PACKAGE_FAMILY_NAME
     * @type {Integer (Int32)}
     */
    static STORE_PACKAGE_FAMILY_NAME => 1610612744

    /**
     * Native name: DEBUG_FLR_STORE_PACKAGE_IDENTITY_NAME
     * @type {Integer (Int32)}
     */
    static STORE_PACKAGE_IDENTITY_NAME => 1610612745

    /**
     * Native name: DEBUG_FLR_STORE_PRIMARY_PARENT_PRODUCT_ID
     * @type {Integer (Int32)}
     */
    static STORE_PRIMARY_PARENT_PRODUCT_ID => 1610612746

    /**
     * Native name: DEBUG_FLR_STORE_LEGACY_PARENT_PRODUCT_ID
     * @type {Integer (Int32)}
     */
    static STORE_LEGACY_PARENT_PRODUCT_ID => 1610612747

    /**
     * Native name: DEBUG_FLR_STORE_LEGACY_WINDOWS_STORE_PRODUCT_ID
     * @type {Integer (Int32)}
     */
    static STORE_LEGACY_WINDOWS_STORE_PRODUCT_ID => 1610612748

    /**
     * Native name: DEBUG_FLR_STORE_LEGACY_WINDOWS_PHONE_PRODUCT_ID
     * @type {Integer (Int32)}
     */
    static STORE_LEGACY_WINDOWS_PHONE_PRODUCT_ID => 1610612749

    /**
     * Native name: DEBUG_FLR_STORE_LEGACY_XBOX_ONE_PRODUCT_ID
     * @type {Integer (Int32)}
     */
    static STORE_LEGACY_XBOX_ONE_PRODUCT_ID => 1610612750

    /**
     * Native name: DEBUG_FLR_STORE_LEGACY_XBOX_360_PRODUCT_ID
     * @type {Integer (Int32)}
     */
    static STORE_LEGACY_XBOX_360_PRODUCT_ID => 1610612751

    /**
     * Native name: DEBUG_FLR_STORE_XBOX_TITLE_ID
     * @type {Integer (Int32)}
     */
    static STORE_XBOX_TITLE_ID => 1610612752

    /**
     * Native name: DEBUG_FLR_STORE_PREFERRED_SKU_ID
     * @type {Integer (Int32)}
     */
    static STORE_PREFERRED_SKU_ID => 1610612753

    /**
     * Native name: DEBUG_FLR_STORE_IS_MICROSOFT_PRODUCT
     * @type {Integer (Int32)}
     */
    static STORE_IS_MICROSOFT_PRODUCT => 1610612754

    /**
     * Native name: DEBUG_FLR_STORE_URL_APP
     * @type {Integer (Int32)}
     */
    static STORE_URL_APP => 1610612755

    /**
     * Native name: DEBUG_FLR_STORE_URL_APPHEALTH
     * @type {Integer (Int32)}
     */
    static STORE_URL_APPHEALTH => 1610612756

    /**
     * Native name: DEBUG_FLR_PHONE_VERSIONMAJOR
     * @type {Integer (Int32)}
     */
    static PHONE_VERSIONMAJOR => 1879048192

    /**
     * Native name: DEBUG_FLR_PHONE_VERSIONMINOR
     * @type {Integer (Int32)}
     */
    static PHONE_VERSIONMINOR => 1879048193

    /**
     * Native name: DEBUG_FLR_PHONE_BUILDNUMBER
     * @type {Integer (Int32)}
     */
    static PHONE_BUILDNUMBER => 1879048194

    /**
     * Native name: DEBUG_FLR_PHONE_BUILDTIMESTAMP
     * @type {Integer (Int32)}
     */
    static PHONE_BUILDTIMESTAMP => 1879048195

    /**
     * Native name: DEBUG_FLR_PHONE_BUILDBRANCH
     * @type {Integer (Int32)}
     */
    static PHONE_BUILDBRANCH => 1879048196

    /**
     * Native name: DEBUG_FLR_PHONE_BUILDER
     * @type {Integer (Int32)}
     */
    static PHONE_BUILDER => 1879048197

    /**
     * Native name: DEBUG_FLR_PHONE_LCID
     * @type {Integer (Int32)}
     */
    static PHONE_LCID => 1879048198

    /**
     * Native name: DEBUG_FLR_PHONE_QFE
     * @type {Integer (Int32)}
     */
    static PHONE_QFE => 1879048199

    /**
     * Native name: DEBUG_FLR_PHONE_OPERATOR
     * @type {Integer (Int32)}
     */
    static PHONE_OPERATOR => 1879048200

    /**
     * Native name: DEBUG_FLR_PHONE_MCCMNC
     * @type {Integer (Int32)}
     */
    static PHONE_MCCMNC => 1879048201

    /**
     * Native name: DEBUG_FLR_PHONE_FIRMWAREREVISION
     * @type {Integer (Int32)}
     */
    static PHONE_FIRMWAREREVISION => 1879048202

    /**
     * Native name: DEBUG_FLR_PHONE_RAM
     * @type {Integer (Int32)}
     */
    static PHONE_RAM => 1879048203

    /**
     * Native name: DEBUG_FLR_PHONE_ROMVERSION
     * @type {Integer (Int32)}
     */
    static PHONE_ROMVERSION => 1879048204

    /**
     * Native name: DEBUG_FLR_PHONE_SOCVERSION
     * @type {Integer (Int32)}
     */
    static PHONE_SOCVERSION => 1879048205

    /**
     * Native name: DEBUG_FLR_PHONE_HARDWAREREVISION
     * @type {Integer (Int32)}
     */
    static PHONE_HARDWAREREVISION => 1879048206

    /**
     * Native name: DEBUG_FLR_PHONE_RADIOHARDWAREREVISION
     * @type {Integer (Int32)}
     */
    static PHONE_RADIOHARDWAREREVISION => 1879048207

    /**
     * Native name: DEBUG_FLR_PHONE_RADIOSOFTWAREREVISION
     * @type {Integer (Int32)}
     */
    static PHONE_RADIOSOFTWAREREVISION => 1879048208

    /**
     * Native name: DEBUG_FLR_PHONE_BOOTLOADERVERSION
     * @type {Integer (Int32)}
     */
    static PHONE_BOOTLOADERVERSION => 1879048209

    /**
     * Native name: DEBUG_FLR_PHONE_REPORTGUID
     * @type {Integer (Int32)}
     */
    static PHONE_REPORTGUID => 1879048210

    /**
     * Native name: DEBUG_FLR_PHONE_SOURCE
     * @type {Integer (Int32)}
     */
    static PHONE_SOURCE => 1879048211

    /**
     * Native name: DEBUG_FLR_PHONE_SOURCEEXTERNAL
     * @type {Integer (Int32)}
     */
    static PHONE_SOURCEEXTERNAL => 1879048212

    /**
     * Native name: DEBUG_FLR_PHONE_USERALIAS
     * @type {Integer (Int32)}
     */
    static PHONE_USERALIAS => 1879048213

    /**
     * Native name: DEBUG_FLR_PHONE_REPORTTIMESTAMP
     * @type {Integer (Int32)}
     */
    static PHONE_REPORTTIMESTAMP => 1879048214

    /**
     * Native name: DEBUG_FLR_PHONE_APPID
     * @type {Integer (Int32)}
     */
    static PHONE_APPID => 1879048215

    /**
     * Native name: DEBUG_FLR_PHONE_SKUID
     * @type {Integer (Int32)}
     */
    static PHONE_SKUID => 1879048216

    /**
     * Native name: DEBUG_FLR_PHONE_APPVERSION
     * @type {Integer (Int32)}
     */
    static PHONE_APPVERSION => 1879048217

    /**
     * Native name: DEBUG_FLR_PHONE_UIF_COMMENT
     * @type {Integer (Int32)}
     */
    static PHONE_UIF_COMMENT => 1879048218

    /**
     * Native name: DEBUG_FLR_PHONE_UIF_APPNAME
     * @type {Integer (Int32)}
     */
    static PHONE_UIF_APPNAME => 1879048219

    /**
     * Native name: DEBUG_FLR_PHONE_UIF_APPID
     * @type {Integer (Int32)}
     */
    static PHONE_UIF_APPID => 1879048220

    /**
     * Native name: DEBUG_FLR_PHONE_UIF_CATEGORY
     * @type {Integer (Int32)}
     */
    static PHONE_UIF_CATEGORY => 1879048221

    /**
     * Native name: DEBUG_FLR_PHONE_UIF_ORIGIN
     * @type {Integer (Int32)}
     */
    static PHONE_UIF_ORIGIN => 1879048222

    /**
     * Native name: DEBUG_FLR_SIMULTANEOUS_TELSVC_INSTANCES
     * @type {Integer (Int32)}
     */
    static SIMULTANEOUS_TELSVC_INSTANCES => 1879048223

    /**
     * Native name: DEBUG_FLR_SIMULTANEOUS_TELWP_INSTANCES
     * @type {Integer (Int32)}
     */
    static SIMULTANEOUS_TELWP_INSTANCES => 1879048224

    /**
     * Native name: DEBUG_FLR_MINUTES_SINCE_LAST_EVENT
     * @type {Integer (Int32)}
     */
    static MINUTES_SINCE_LAST_EVENT => 1879048225

    /**
     * Native name: DEBUG_FLR_MINUTES_SINCE_LAST_EVENT_OF_THIS_TYPE
     * @type {Integer (Int32)}
     */
    static MINUTES_SINCE_LAST_EVENT_OF_THIS_TYPE => 1879048226

    /**
     * Native name: DEBUG_FLR_REPORT_INFO_GUID
     * @type {Integer (Int32)}
     */
    static REPORT_INFO_GUID => 1879048227

    /**
     * Native name: DEBUG_FLR_REPORT_INFO_SOURCE
     * @type {Integer (Int32)}
     */
    static REPORT_INFO_SOURCE => 1879048228

    /**
     * Native name: DEBUG_FLR_REPORT_INFO_CREATION_TIME
     * @type {Integer (Int32)}
     */
    static REPORT_INFO_CREATION_TIME => 1879048229

    /**
     * Native name: DEBUG_FLR_FAULTING_IP
     * @type {Integer (Int32)}
     */
    static FAULTING_IP => -2147483648

    /**
     * Native name: DEBUG_FLR_FAULTING_MODULE
     * @type {Integer (Int32)}
     */
    static FAULTING_MODULE => -2147483647

    /**
     * Native name: DEBUG_FLR_IMAGE_TIMESTAMP
     * @type {Integer (Int32)}
     */
    static IMAGE_TIMESTAMP => -2147483646

    /**
     * Native name: DEBUG_FLR_FOLLOWUP_IP
     * @type {Integer (Int32)}
     */
    static FOLLOWUP_IP => -2147483645

    /**
     * Native name: DEBUG_FLR_FRAME_ONE_INVALID
     * @type {Integer (Int32)}
     */
    static FRAME_ONE_INVALID => -2147483644

    /**
     * Native name: DEBUG_FLR_SYMBOL_FROM_RAW_STACK_ADDRESS
     * @type {Integer (Int32)}
     */
    static SYMBOL_FROM_RAW_STACK_ADDRESS => -2147483643

    /**
     * Native name: DEBUG_FLR_IMAGE_VERSION
     * @type {Integer (Int32)}
     */
    static IMAGE_VERSION => -2147483642

    /**
     * Native name: DEBUG_FLR_FOLLOWUP_BUCKET_ID
     * @type {Integer (Int32)}
     */
    static FOLLOWUP_BUCKET_ID => -2147483641

    /**
     * Native name: DEBUG_FLR_CUSTOM_ANALYSIS_TAG_MIN
     * @type {Integer (Int32)}
     */
    static CUSTOM_ANALYSIS_TAG_MIN => -1610612736

    /**
     * Native name: DEBUG_FLR_CUSTOM_ANALYSIS_TAG_MAX
     * @type {Integer (Int32)}
     */
    static CUSTOM_ANALYSIS_TAG_MAX => -1342177280

    /**
     * Native name: DEBUG_FLR_FAULTING_THREAD
     * @type {Integer (Int32)}
     */
    static FAULTING_THREAD => -1073741824

    /**
     * Native name: DEBUG_FLR_CONTEXT
     * @type {Integer (Int32)}
     */
    static CONTEXT => -1073741823

    /**
     * Native name: DEBUG_FLR_TRAP_FRAME
     * @type {Integer (Int32)}
     */
    static TRAP_FRAME => -1073741822

    /**
     * Native name: DEBUG_FLR_TSS
     * @type {Integer (Int32)}
     */
    static TSS => -1073741821

    /**
     * Native name: DEBUG_FLR_BLOCKING_THREAD
     * @type {Integer (Int32)}
     */
    static BLOCKING_THREAD => -1073741820

    /**
     * Native name: DEBUG_FLR_UNRESPONSIVE_UI_THREAD
     * @type {Integer (Int32)}
     */
    static UNRESPONSIVE_UI_THREAD => -1073741819

    /**
     * Native name: DEBUG_FLR_BLOCKED_THREAD0
     * @type {Integer (Int32)}
     */
    static BLOCKED_THREAD0 => -1073741818

    /**
     * Native name: DEBUG_FLR_BLOCKED_THREAD1
     * @type {Integer (Int32)}
     */
    static BLOCKED_THREAD1 => -1073741817

    /**
     * Native name: DEBUG_FLR_BLOCKED_THREAD2
     * @type {Integer (Int32)}
     */
    static BLOCKED_THREAD2 => -1073741816

    /**
     * Native name: DEBUG_FLR_BLOCKING_PROCESSID
     * @type {Integer (Int32)}
     */
    static BLOCKING_PROCESSID => -1073741815

    /**
     * Native name: DEBUG_FLR_PROCESSOR_ID
     * @type {Integer (Int32)}
     */
    static PROCESSOR_ID => -1073741814

    /**
     * Native name: DEBUG_FLR_XDV_VIOLATED_CONDITION
     * @type {Integer (Int32)}
     */
    static XDV_VIOLATED_CONDITION => -1073741813

    /**
     * Native name: DEBUG_FLR_XDV_STATE_VARIABLE
     * @type {Integer (Int32)}
     */
    static XDV_STATE_VARIABLE => -1073741812

    /**
     * Native name: DEBUG_FLR_XDV_HELP_LINK
     * @type {Integer (Int32)}
     */
    static XDV_HELP_LINK => -1073741811

    /**
     * Native name: DEBUG_FLR_XDV_RULE_INFO
     * @type {Integer (Int32)}
     */
    static XDV_RULE_INFO => -1073741810

    /**
     * Native name: DEBUG_FLR_DPC_STACK_BASE
     * @type {Integer (Int32)}
     */
    static DPC_STACK_BASE => -1073741809

    /**
     * Native name: DEBUG_FLR_TESTRESULTSERVER
     * @type {Integer (Int32)}
     */
    static TESTRESULTSERVER => -268435456

    /**
     * Native name: DEBUG_FLR_TESTRESULTGUID
     * @type {Integer (Int32)}
     */
    static TESTRESULTGUID => -268435455

    /**
     * Native name: DEBUG_FLR_CUSTOMREPORTTAG
     * @type {Integer (Int32)}
     */
    static CUSTOMREPORTTAG => -268435454

    /**
     * Native name: DEBUG_FLR_DISKSEC_ORGID_DEPRECATED
     * @type {Integer (Int32)}
     */
    static DISKSEC_ORGID_DEPRECATED => -268435453

    /**
     * Native name: DEBUG_FLR_DISKSEC_MODEL_DEPRECATED
     * @type {Integer (Int32)}
     */
    static DISKSEC_MODEL_DEPRECATED => -268435452

    /**
     * Native name: DEBUG_FLR_DISKSEC_MFGID_DEPRECATED
     * @type {Integer (Int32)}
     */
    static DISKSEC_MFGID_DEPRECATED => -268435451

    /**
     * Native name: DEBUG_FLR_DISKSEC_ISSUEDESCSTRING_DEPRECATED
     * @type {Integer (Int32)}
     */
    static DISKSEC_ISSUEDESCSTRING_DEPRECATED => -268435450

    /**
     * Native name: DEBUG_FLR_DISKSEC_PUBLIC_TOTSIZE_DEPRECATED
     * @type {Integer (Int32)}
     */
    static DISKSEC_PUBLIC_TOTSIZE_DEPRECATED => -268435449

    /**
     * Native name: DEBUG_FLR_DISKSEC_PUBLIC_OFFSET_DEPRECATED
     * @type {Integer (Int32)}
     */
    static DISKSEC_PUBLIC_OFFSET_DEPRECATED => -268435448

    /**
     * Native name: DEBUG_FLR_DISKSEC_PUBLIC_DATASIZE_DEPRECATED
     * @type {Integer (Int32)}
     */
    static DISKSEC_PUBLIC_DATASIZE_DEPRECATED => -268435447

    /**
     * Native name: DEBUG_FLR_DISKSEC_PRIVATE_TOTSIZE_DEPRECATED
     * @type {Integer (Int32)}
     */
    static DISKSEC_PRIVATE_TOTSIZE_DEPRECATED => -268435446

    /**
     * Native name: DEBUG_FLR_DISKSEC_PRIVATE_OFFSET_DEPRECATED
     * @type {Integer (Int32)}
     */
    static DISKSEC_PRIVATE_OFFSET_DEPRECATED => -268435445

    /**
     * Native name: DEBUG_FLR_DISKSEC_PRIVATE_DATASIZE_DEPRECATED
     * @type {Integer (Int32)}
     */
    static DISKSEC_PRIVATE_DATASIZE_DEPRECATED => -268435444

    /**
     * Native name: DEBUG_FLR_DISKSEC_TOTALSIZE_DEPRECATED
     * @type {Integer (Int32)}
     */
    static DISKSEC_TOTALSIZE_DEPRECATED => -268435443

    /**
     * Native name: DEBUG_FLR_DISKSEC_REASON_DEPRECATED
     * @type {Integer (Int32)}
     */
    static DISKSEC_REASON_DEPRECATED => -268435442

    /**
     * Native name: DEBUG_FLR_WERCOLLECTION_PROCESSTERMINATED
     * @type {Integer (Int32)}
     */
    static WERCOLLECTION_PROCESSTERMINATED => -268435441

    /**
     * Native name: DEBUG_FLR_WERCOLLECTION_PROCESSHEAPDUMP_REQUEST_FAILURE
     * @type {Integer (Int32)}
     */
    static WERCOLLECTION_PROCESSHEAPDUMP_REQUEST_FAILURE => -268435440

    /**
     * Native name: DEBUG_FLR_WERCOLLECTION_MINIDUMP_WRITE_FAILURE
     * @type {Integer (Int32)}
     */
    static WERCOLLECTION_MINIDUMP_WRITE_FAILURE => -268435439

    /**
     * Native name: DEBUG_FLR_WERCOLLECTION_DEFAULTCOLLECTION_FAILURE
     * @type {Integer (Int32)}
     */
    static WERCOLLECTION_DEFAULTCOLLECTION_FAILURE => -268435438

    /**
     * Native name: DEBUG_FLR_PROCESS_BAM_CURRENT_THROTTLED
     * @type {Integer (Int32)}
     */
    static PROCESS_BAM_CURRENT_THROTTLED => -268435437

    /**
     * Native name: DEBUG_FLR_PROCESS_BAM_PREVIOUS_THROTTLED
     * @type {Integer (Int32)}
     */
    static PROCESS_BAM_PREVIOUS_THROTTLED => -268435436

    /**
     * Native name: DEBUG_FLR_DUMPSTREAM_COMMENTA
     * @type {Integer (Int32)}
     */
    static DUMPSTREAM_COMMENTA => -268435435

    /**
     * Native name: DEBUG_FLR_DUMPSTREAM_COMMENTW
     * @type {Integer (Int32)}
     */
    static DUMPSTREAM_COMMENTW => -268435434

    /**
     * Native name: DEBUG_FLR_CHPE_PROCESS
     * @type {Integer (Int32)}
     */
    static CHPE_PROCESS => -268435433

    /**
     * Native name: DEBUG_FLR_WINLOGON_BLACKBOX
     * @type {Integer (Int32)}
     */
    static WINLOGON_BLACKBOX => -268435432

    /**
     * Native name: DEBUG_FLR_CUSTOM_COMMAND
     * @type {Integer (Int32)}
     */
    static CUSTOM_COMMAND => -268435431

    /**
     * Native name: DEBUG_FLR_CUSTOM_COMMAND_OUTPUT
     * @type {Integer (Int32)}
     */
    static CUSTOM_COMMAND_OUTPUT => -268435430

    /**
     * Native name: DEBUG_FLR_MASK_ALL
     * @type {Integer (Int32)}
     */
    static MASK_ALL => -1
}
