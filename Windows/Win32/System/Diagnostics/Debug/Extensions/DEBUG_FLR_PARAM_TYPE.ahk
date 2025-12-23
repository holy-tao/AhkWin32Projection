#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_FLR_PARAM_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_RESERVED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_OBJECT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DEVICE_OBJECT => 3

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INVALID_PFN => 4

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WORKER_ROUTINE => 5

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WORK_ITEM => 6

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INVALID_DPC_FOUND => 7

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PROCESS_OBJECT => 8

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAILED_INSTRUCTION_ADDRESS => 9

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_LAST_CONTROL_TRANSFER => 10

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ACPI_EXTENSION => 11

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ACPI_RESCONFLICT => 12

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ACPI_OBJECT => 13

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_READ_ADDRESS => 14

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WRITE_ADDRESS => 15

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CRITICAL_SECTION => 16

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BAD_HANDLE => 17

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INVALID_HEAP_ADDRESS => 18

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CHKIMG_EXTENSION => 19

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USBPORT_OCADATA => 20

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WORK_QUEUE_ITEM => 21

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ERESOURCE_ADDRESS => 22

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PNP_TRIAGE_DATA_DEPRECATED => 23

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HANDLE_VALUE => 24

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WHEA_ERROR_RECORD => 25

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_VERIFIER_FOUND_DEADLOCK => 26

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PG_MISMATCH => 27

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DEVICE_NODE => 28

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_POWERREQUEST_ADDRESS => 29

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_EXECUTE_ADDRESS => 30

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_IRP_ADDRESS => 256

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_IRP_MAJOR_FN => 257

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_IRP_MINOR_FN => 258

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_IRP_CANCEL_ROUTINE => 259

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_IOSB_ADDRESS => 260

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INVALID_USEREVENT => 261

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_VIDEO_TDR_CONTEXT => 262

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_VERIFIER_DRIVER_ENTRY => 263

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PNP_IRP_ADDRESS_DEPRECATED => 264

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PREVIOUS_MODE => 265

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CURRENT_IRQL => 512

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PREVIOUS_IRQL => 513

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_REQUESTED_IRQL => 514

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ASSERT_DATA => 768

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ASSERT_FILE => 769

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_EXCEPTION_PARAMETER1 => 770

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_EXCEPTION_PARAMETER2 => 771

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_EXCEPTION_PARAMETER3 => 772

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_EXCEPTION_PARAMETER4 => 773

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_EXCEPTION_RECORD => 774

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_IO_ERROR_CODE => 775

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_EXCEPTION_STR => 776

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_EXCEPTION_DOESNOT_MATCH_CODE => 777

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ASSERT_INSTRUCTION => 778

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_POOL_ADDRESS => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SPECIAL_POOL_CORRUPTION_TYPE => 1025

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CORRUPTING_POOL_ADDRESS => 1026

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CORRUPTING_POOL_TAG => 1027

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FREED_POOL_TAG => 1028

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_LEAKED_SESSION_POOL_TAG => 1029

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INSTR_SESSION_POOL_TAG => 1030

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CLIENT_DRIVER => 1031

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FILE_ID => 1280

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FILE_LINE => 1281

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUGCHECK_STR => 1536

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUGCHECK_SPECIFIER => 1537

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUGCHECK_DESC => 1538

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_CODE => 1792

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_OBJECT => 1793

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_OBJECT => 1794

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_MESSAGE_deprecated => 1795

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_STACK_STRING => 1796

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_BITNESS_MISMATCH => 1797

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_OBJECT_NAME => 1798

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_CONTEXT_MESSAGE => 1799

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_STACK_COMMAND => 1800

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_KERNEL_DEBUGGER => 1801

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_HRESULT_STRING => 1802

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_ENGINE_MODULE => 1803

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_ANALYSIS_PROVIDER => 1804

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_ADDRESS => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_HRESULT => 2049

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_TYPE => 2050

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_MESSAGE => 2051

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_CALLSTACK => 2052

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_INNER_ADDRESS => 2064

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_INNER_HRESULT => 2065

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_INNER_TYPE => 2066

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_INNER_MESSAGE => 2067

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_INNER_CALLSTACK => 2068

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_NESTED_ADDRESS => 2080

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_NESTED_HRESULT => 2081

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_NESTED_TYPE => 2082

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_NESTED_MESSAGE => 2083

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_NESTED_CALLSTACK => 2084

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_EXCEPTION_CMD => 2288

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_THREAD_ID => 2304

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_THREAD_CMD_CALLSTACK => 2544

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_THREAD_CMD_STACKOBJECTS => 2545

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_VERIFIER_IO_VIOLATION_TYPE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_EXCEPTION_CODE => 4097

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_EXCEPTION_CODE_STR => 4098

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_IOCONTROL_CODE => 4099

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MM_INTERNAL_CODE => 4100

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRVPOWERSTATE_SUBCODE => 4101

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STATUS_CODE => 4102

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYMBOL_STACK_INDEX => 4103

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYMBOL_ON_RAW_STACK => 4104

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SECURITY_COOKIES => 4105

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_THREADPOOL_WAITER => 4106

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_TARGET_MODE => 4107

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUGCHECK_CODE => 4108

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BADPAGES_DETECTED => 4109

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DPC_TIMEOUT_TYPE => 4110

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DPC_RUNTIME => 4111

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DPC_TIMELIMIT => 4112

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DUMP_FILE_ATTRIBUTES => 4113

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PAGE_HASH_ERRORS => 4114

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUGCHECK_P1 => 4115

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUGCHECK_P2 => 4116

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUGCHECK_P3 => 4117

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUGCHECK_P4 => 4118

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CRITICAL_PROCESS => 4119

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_RESOURCE_CALL_TYPE => 4352

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_RESOURCE_CALL_TYPE_STR => 4353

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CORRUPT_MODULE_LIST => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BAD_STACK => 8193

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ZEROED_STACK => 8194

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WRONG_SYMBOLS => 8195

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FOLLOWUP_DRIVER_ONLY => 8196

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_UNUSED001 => 8197

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CPU_OVERCLOCKED => 8198

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_POSSIBLE_INVALID_CONTROL_TRANSFER => 8199

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_POISONED_TB => 8200

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_UNKNOWN_MODULE => 8201

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ANALYZABLE_POOL_CORRUPTION => 8202

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SINGLE_BIT_ERROR => 8203

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_TWO_BIT_ERROR => 8204

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INVALID_KERNEL_CONTEXT => 8205

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISK_HARDWARE_ERROR => 8206

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SHOW_ERRORLOG => 8207

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANUAL_BREAKIN => 8208

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HANG => 8209

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BAD_MEMORY_REFERENCE => 8210

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BAD_OBJECT_REFERENCE => 8211

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_APPKILL => 8212

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SINGLE_BIT_PFN_PAGE_ERROR => 8213

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HARDWARE_ERROR => 8214

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_NO_IMAGE_IN_BUCKET => 8215

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_NO_BUGCHECK_IN_BUCKET => 8216

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SKIP_STACK_ANALYSIS => 8217

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INVALID_OPCODE => 8218

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ADD_PROCESS_IN_BUCKET => 8219

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_RAISED_IRQL_USER_FAULT => 8220

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USE_DEFAULT_CONTEXT => 8221

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BOOST_FOLLOWUP_TO_SPECIFIC => 8222

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SWITCH_PROCESS_CONTEXT => 8223

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_VERIFIER_STOP => 8224

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USERBREAK_PEB_PAGEDOUT => 8225

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MOD_SPECIFIC_DATA_ONLY => 8226

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OVERLAPPED_MODULE => 8227

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CPU_MICROCODE_ZERO_INTEL => 8228

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INTEL_CPU_BIOS_UPGRADE_NEEDED => 8229

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OVERLAPPED_UNLOADED_MODULE => 8230

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INVALID_USER_CONTEXT => 8231

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MILCORE_BREAK => 8232

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_NO_IMAGE_TIMESTAMP_IN_BUCKET => 8233

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_KERNEL_VERIFIER_ENABLED => 8234

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SKIP_CORRUPT_MODULE_DETECTION => 8235

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_FALSE_POSITIVE => 8236

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_IGNORE_LARGE_MODULE_CORRUPTION => 8237

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_IGNORE_BUCKET_ID_OFFSET => 8238

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_NO_ARCH_IN_BUCKET => 8239

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_IGNORE_MODULE_HARDWARE_ID => 8240

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ARM_WRITE_AV_CAVEAT => 8241

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ON_DPC_STACK => 8242

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_LIVE_KERNEL_DUMP => 8243

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_COVERAGE_BUILD => 8244

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_POSSIBLE_STACK_OVERFLOW => 8245

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WRONG_SYMBOLS_TIMESTAMP => 8246

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WRONG_SYMBOLS_SIZE => 8247

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MISSING_IMPORTANT_SYMBOL => 8248

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MISSING_CLR_SYMBOL => 8249

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_TARGET_TIME => 8250

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_LOW_SYSTEM_COMMIT => 8251

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_LEGACY_PAGE_TABLE_ACCESS => 8252

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HIGH_PROCESS_COMMIT => 8253

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HIGH_SERVICE_COMMIT => 8254

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HIGH_NONPAGED_POOL_USAGE => 8255

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HIGH_PAGED_POOL_USAGE => 8256

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HIGH_SHARED_COMMIT_USAGE => 8257

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_APPS_NOT_TERMINATED => 8258

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_POOL_CORRUPTOR => 12288

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MEMORY_CORRUPTOR => 12289

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_UNALIGNED_STACK_POINTER => 12290

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_VERSION_deprecated => 12291

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUGCHECKING_DRIVER => 12292

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SOLUTION_ID => 12293

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DEFAULT_SOLUTION_ID => 12294

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SOLUTION_TYPE => 12295

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_RECURRING_STACK => 12296

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_INSTR_CODE => 12297

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYSTEM_LOCALE_deprecated => 12298

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CUSTOMER_CRASH_COUNT => 12299

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_TRAP_FRAME_RECURSION => 12300

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_OVERFLOW => 12301

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_POINTER_ERROR => 12302

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_POINTER_ONEBIT_ERROR => 12303

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_POINTER_MISALIGNED => 12304

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INSTR_POINTER_MISALIGNED => 12305

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INSTR_POINTER_CLIFAULT => 12306

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_REGISTRYTXT_STRESS_ID => 12307

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CORRUPT_SERVICE_TABLE => 12308

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_LOP_STACKHASH => 12309

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_FUNCTION => 12310

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_MODULE_COOKIE => 12311

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_FRAME_COOKIE => 12312

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_FRAME_COOKIE_COMPLEMENT => 12313

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_CORRUPTED_COOKIE => 12314

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_CORRUPTED_EBP => 12315

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_OVERRUN_LOCAL => 12316

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_OVERRUN_LOCAL_NAME => 12317

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_CORRUPTED_EBPESP => 12318

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_POSITIVELY_CORRUPTED_EBPESP => 12319

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_MEMORY_READ_ERROR => 12320

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_PROBABLY_NOT_USING_GS => 12321

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_POSITIVE_BUFFER_OVERFLOW => 12322

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_ANALYSIS_TEXT => 12323

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_OFF_BY_ONE_OVERRUN => 12324

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_RA_SMASHED => 12325

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_NOT_UP2DATE => 12326

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_UP2DATE_UNKNOWN => 12327

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_TRIAGER_OS_BUILD_NAME => 12328

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CPU_MICROCODE_VERSION => 12329

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CPU_COUNT => 12330

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CPU_SPEED => 12331

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CPU_VENDOR => 12332

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CPU_FAMILY => 12333

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CPU_MODEL => 12334

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CPU_STEPPING => 12335

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INSTR_POINTER_ON_STACK => 12336

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INSTR_POINTER_ON_HEAP => 12337

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_EVENT_CODE_DATA_MISMATCH => 12338

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PROCESSOR_INFO => 12339

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INSTR_POINTER_IN_UNLOADED_MODULE => 12340

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MEMDIAG_LASTRUN_STATUS => 12341

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MEMDIAG_LASTRUN_TIME => 12342

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INSTR_POINTER_IN_FREE_BLOCK => 12343

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INSTR_POINTER_IN_RESERVED_BLOCK => 12344

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INSTR_POINTER_IN_VM_MAPPED_MODULE => 12345

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INSTR_POINTER_IN_MODULE_NOT_IN_LIST => 12346

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INSTR_POINTER_NOT_IN_STREAM => 12347

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MEMORY_CORRUPTION_SIGNATURE => 12348

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUILDNAME_IN_BUCKET => 12349

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CANCELLATION_NOT_SUPPORTED => 12350

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DETOURED_IMAGE => 12351

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_EXCEPTION_CONTEXT_RECURSION => 12352

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISKIO_READ_FAILURE => 12353

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISKIO_WRITE_FAILURE => 12354

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_MISSING_ESTABLISHER_FRAME => 12355

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_COOKIES_MATCH_EXH => 12356

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_MANAGED => 12357

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MANAGED_FRAME_CHAIN_CORRUPTION => 12358

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_MANAGED_THREADID => 12359

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_GSFAILURE_MANAGED_FRAMEID => 12360

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACKUSAGE_IMAGE => 12361

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACKUSAGE_IMAGE_SIZE => 12362

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACKUSAGE_FUNCTION => 12363

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACKUSAGE_FUNCTION_SIZE => 12364

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACKUSAGE_RECURSION_COUNT => 12365

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XBOX_SYSTEM_UPTIME => 12366

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XBOX_SYSTEM_CRASHTIME => 12367

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XBOX_LIVE_ENVIRONMENT => 12368

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_LARGE_TICK_INCREMENT => 12369

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INSTR_POINTER_IN_PAGED_CODE => 12370

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SERVICETABLE_MODIFIED => 12371

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ALUREON => 12372

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INTERNAL_RAID_BUG => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INTERNAL_BUCKET_URL => 16385

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INTERNAL_SOLUTION_TEXT => 16386

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INTERNAL_BUCKET_HITCOUNT => 16387

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INTERNAL_RAID_BUG_DATABASE_STRING => 16388

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INTERNAL_BUCKET_CONTINUABLE => 16389

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INTERNAL_BUCKET_STATUS_TEXT => 16390

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_MODULE => 16640

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_MODULE_VERSION => 16641

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_MODULE_OFFSET => 16642

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_PROCESS_VERSION => 16643

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_IBUCKET => 16644

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_MODULE_TIMESTAMP => 16645

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_PROCESS_TIMESTAMP => 16646

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_GENERIC_EVENT_NAME => 16647

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_GENERIC_BUCKETING_00 => 16648

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_GENERIC_BUCKETING_01 => 16649

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_GENERIC_BUCKETING_02 => 16650

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_GENERIC_BUCKETING_03 => 16651

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_GENERIC_BUCKETING_04 => 16652

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_GENERIC_BUCKETING_05 => 16653

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_GENERIC_BUCKETING_06 => 16654

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_GENERIC_BUCKETING_07 => 16655

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_GENERIC_BUCKETING_08 => 16656

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_GENERIC_BUCKETING_09 => 16657

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYSXML_LOCALEID => 16896

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYSXML_CHECKSUM => 16897

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WQL_EVENT_COUNT => 16898

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WQL_EVENTLOG_INFO => 16899

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYSINFO_SYSTEM_MANUFACTURER => 17152

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYSINFO_SYSTEM_PRODUCT => 17153

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYSINFO_SYSTEM_SKU => 17154

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYSINFO_SYSTEM_VERSION => 17155

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYSINFO_BASEBOARD_MANUFACTURER => 17156

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYSINFO_BASEBOARD_PRODUCT => 17157

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYSINFO_BASEBOARD_VERSION => 17158

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYSINFO_BIOS_VENDOR => 17159

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYSINFO_BIOS_VERSION => 17160

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYSINFO_BIOS_DATE => 17161

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_VIRTUAL_MACHINE => 17162

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SERVICE => 20480

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SERVICE_NAME => 20481

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SERVICE_GROUP => 20482

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SERVICE_DISPLAYNAME => 20483

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SERVICE_DESCRIPTION => 20484

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SERVICE_DEPENDONSERVICE => 20485

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SERVICE_DEPENDONGROUP => 20486

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SVCHOST => 20736

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SVCHOST_GROUP => 20737

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SVCHOST_IMAGEPATH => 20738

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SVCHOST_SERVICEDLL => 20739

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SCM => 20992

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SCM_BLACKBOX => 21232

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SCM_BLACKBOX_ENTRY => 21233

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SCM_BLACKBOX_ENTRY_CONTROLCODE => 21234

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SCM_BLACKBOX_ENTRY_STARTTIME => 21235

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SCM_BLACKBOX_ENTRY_SERVICENAME => 21236

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ACPI => 24576

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ACPI_BLACKBOX => 24832

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PO_BLACKBOX => 24833

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BOOTSTAT => 28672

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BOOTSTAT_BLACKBOX => 28928

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORAGE => 29696

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORAGE_ORGID => 29697

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORAGE_MODEL => 29698

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORAGE_MFGID => 29699

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORAGE_ISSUEDESCSTRING => 29700

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORAGE_PUBLIC_TOTSIZE => 29701

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORAGE_PUBLIC_OFFSET => 29702

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORAGE_PUBLIC_DATASIZE => 29703

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORAGE_PRIVATE_TOTSIZE => 29704

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORAGE_PRIVATE_OFFSET => 29705

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORAGE_PRIVATE_DATASIZE => 29706

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORAGE_TOTALSIZE => 29707

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORAGE_REASON => 29708

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORAGE_BLACKBOX => 29936

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FILESYSTEMS_NTFS => 30208

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FILESYSTEMS_NTFS_BLACKBOX => 30448

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FILESYSTEMS_REFS => 30720

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FILESYSTEMS_REFS_BLACKBOX => 30960

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PNP => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PNP_TRIAGE_DATA => 32769

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PNP_IRP_ADDRESS => 32770

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PNP_BLACKBOX => 33024

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUCKET_ID => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_IMAGE_NAME => 65537

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYMBOL_NAME => 65538

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FOLLOWUP_NAME => 65539

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_COMMAND => 65540

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_TEXT => 65541

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MODULE_NAME => 65542

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FIXED_IN_OSVERSION => 65543

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DEFAULT_BUCKET_ID => 65544

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MODULE_BUCKET_ID => 65545

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ADDITIONAL_DEBUGTEXT => 65546

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PROCESS_NAME => 65547

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_NAME => 65548

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MARKER_FILE => 65549

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_INTERNAL_RESPONSE => 65550

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CONTEXT_RESTORE_COMMAND => 65551

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_HARDWAREID => 65552

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_HARDWARE_VENDOR_ID => 65553

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_HARDWARE_DEVICE_ID => 65554

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_HARDWARE_SUBSYS_ID => 65555

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_HARDWARE_REV_ID => 65556

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_HARDWARE_ID_BUS_TYPE => 65557

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MARKER_MODULE_FILE => 65558

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUGCHECKING_DRIVER_IDTAG => 65559

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MARKER_BUCKET => 65560

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAILURE_BUCKET_ID => 65561

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_XML_DESCRIPTION => 65562

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_XML_PRODUCTNAME => 65563

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_XML_MANUFACTURER => 65564

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_XML_VERSION => 65565

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUILD_VERSION_STRING => 65566

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUILD_OS_FULL_VERSION_STRING => 65567

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ORIGINAL_CAB_NAME => 65568

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_SOURCE_CODE => 65569

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_SERVICE_NAME => 65570

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FILE_IN_CAB => 65571

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_UNRESPONSIVE_UI_SYMBOL_NAME => 65572

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_UNRESPONSIVE_UI_FOLLOWUP_NAME => 65573

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_UNRESPONSIVE_UI_STACK => 65574

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PROCESS_PRODUCTNAME => 65575

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MODULE_PRODUCTNAME => 65576

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_COLLECT_DATA_FOR_BUCKET => 65577

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_COMPUTER_NAME => 65578

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_IMAGE_CLASS => 65579

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYMBOL_ROUTINE_NAME => 65580

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HARDWARE_BUCKET_TAG => 65581

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_KERNEL_LOG_PROCESS_NAME => 65582

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_KERNEL_LOG_STATUS => 65583

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_REGISTRYTXT_SOURCE => 65584

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_SOURCE_LINE => 65585

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_SOURCE_FILE => 65586

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_SOURCE_LINE_NUMBER => 65587

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SKIP_MODULE_SPECIFIC_BUCKET_INFO => 65588

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUCKET_ID_FUNC_OFFSET => 65589

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XHCI_FIRMWARE_VERSION => 65590

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAILURE_ANALYSIS_SOURCE => 65591

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAILURE_ID_HASH => 65592

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAILURE_ID_HASH_STRING => 65593

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAILURE_ID_REPORT_LINK => 65594

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HOLDINFO => 65595

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HOLDINFO_ACTIVE_HOLD_COUNT => 65596

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HOLDINFO_TENET_SOCRE => 65597

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HOLDINFO_HISTORIC_HOLD_COUNT => 65598

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HOLDINFO_ALWAYS_IGNORE => 65599

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HOLDINFO_ALWAYS_HOLD => 65600

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HOLDINFO_MAX_HOLD_LIMIT => 65601

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HOLDINFO_MANUAL_HOLD => 65602

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HOLDINFO_NOTIFICATION_ALIASES => 65603

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HOLDINFO_LAST_SEEN_HOLD_DATE => 65604

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HOLDINFO_RECOMMEND_HOLD => 65605

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAILURE_PROBLEM_CLASS => 65606

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAILURE_EXCEPTION_CODE => 65607

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAILURE_IMAGE_NAME => 65608

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAILURE_FUNCTION_NAME => 65609

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAILURE_SYMBOL_NAME => 65610

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FOLLOWUP_BEFORE_RETRACER => 65611

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_END_MESSAGE => 65612

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FEATURE_PATH => 65613

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_MODE_BUCKET => 65614

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_MODE_BUCKET_INDEX => 65615

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_MODE_BUCKET_EVENTTYPE => 65616

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_MODE_BUCKET_REPORTGUID => 65617

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_MODE_BUCKET_REPORTCREATIONTIME => 65618

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_MODE_BUCKET_P0 => 65619

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_MODE_BUCKET_P1 => 65620

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_MODE_BUCKET_P2 => 65621

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_MODE_BUCKET_P3 => 65622

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_MODE_BUCKET_P4 => 65623

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_MODE_BUCKET_P5 => 65624

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_MODE_BUCKET_P6 => 65625

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_MODE_BUCKET_P7 => 65626

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_MODE_BUCKET_STRING => 65627

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CRITICAL_PROCESS_REPORTGUID => 65628

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAILURE_MODULE_NAME => 65629

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PLATFORM_BUCKET_STRING => 65630

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_HARDWARE_VENDOR_NAME => 65631

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_HARDWARE_SUBVENDOR_NAME => 65632

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DRIVER_HARDWARE_DEVICE_NAME => 65633

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_SOURCE_COMMIT_ID => 65634

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_SOURCE_CONTROL_TYPE => 65635

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_SOURCE_PROJECT => 65636

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_SOURCE_REPO_ID => 65637

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_SOURCE_REPO_URL => 65638

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_SOURCE_SRV_COMMAND => 65639

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USERMODE_DATA => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_THREAD_ATTRIBUTES => 1048577

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PROBLEM_CLASSES => 1048578

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PRIMARY_PROBLEM_CLASS => 1048579

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PRIMARY_PROBLEM_CLASS_DATA => 1048580

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_UNRESPONSIVE_UI_PROBLEM_CLASS => 1048581

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_UNRESPONSIVE_UI_PROBLEM_CLASS_DATA => 1048582

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DERIVED_WAIT_CHAIN => 1048583

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HANG_DATA_NEEDED => 1048584

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PROBLEM_CODE_PATH_HASH => 1048585

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SUSPECT_CODE_PATH_HASH => 1048586

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_LOADERLOCK_IN_WAIT_CHAIN => 1048587

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XPROC_HANG => 1048588

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DEADLOCK_INPROC => 1048589

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DEADLOCK_XPROC => 1048590

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WCT_XML_AVAILABLE => 1048591

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XPROC_DUMP_AVAILABLE => 1048592

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DESKTOP_HEAP_MISSING => 1048593

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_HANG_REPORT_THREAD_IS_IDLE => 1048594

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULT_THREAD_SHA1_HASH_MF => 1048595

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULT_THREAD_SHA1_HASH_MFO => 1048596

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULT_THREAD_SHA1_HASH_M => 1048597

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WAIT_CHAIN_COMMAND => 1048598

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_NTGLOBALFLAG => 1048599

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_APPVERIFERFLAGS => 1048600

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MODLIST_SHA1_HASH => 1048601

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DUMP_TYPE => 1048602

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XCS_PATH => 1048603

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_LOADERLOCK_OWNER_API => 1048604

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_LOADERLOCK_BLOCKED_API => 1048605

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MODLIST_TSCHKSUM_SHA1_HASH => 1048606

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MODLIST_UNLOADED_SHA1_HASH => 1048607

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MACHINE_INFO_SHA1_HASH => 1048608

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_URLS_DISCOVERED => 1048609

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_URLS => 1048610

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_URL_ENTRY => 1048611

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_IBUCKET_S1_RESP => 1048612

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WATSON_IBUCKETTABLE_S1_RESP => 1048613

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SEARCH_HANG => 1048614

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WER_DATA_COLLECTION_INFO => 1048615

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WER_MACHINE_ID => 1048616

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ULS_SCRIPT_EXCEPTION => 1048617

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_LCIE_ISO_AVAILABLE => 1048618

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SHOW_LCIE_ISO_DATA => 1048619

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_URL_LCIE_ENTRY => 1048620

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_URL_URLMON_ENTRY => 1048621

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_URL_XMLHTTPREQ_SYNC_ENTRY => 1048622

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_LOCAL_VARIABLE_NAME => 1048623

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MODULE_LIST => 1048624

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DUMP_FLAGS => 1048625

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_APPLICATION_VERIFIER_LOADED => 1048626

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DUMP_CLASS => 1048627

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DUMP_QUALIFIER => 1048628

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_KM_MODULE_LIST => 1048629

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_EXCEPTION_CODE_STR_deprecated => 1052672

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUCKET_ID_PREFIX_STR => 1052673

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUCKET_ID_MODULE_STR => 1052674

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUCKET_ID_MODVER_STR => 1052675

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUCKET_ID_FUNCTION_STR => 1052676

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUCKET_ID_OFFSET => 1052677

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_BUILD => 1052678

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_SERVICEPACK => 1052679

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_BRANCH => 1052680

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_BUILD_TIMESTAMP_LAB => 1052681

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_VERSION => 1052682

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUCKET_ID_TIMEDATESTAMP => 1052683

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUCKET_ID_CHECKSUM => 1052684

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_FLAVOR => 1052685

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUCKET_ID_FLAVOR_STR => 1052686

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_SKU => 1052687

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_PRODUCT_TYPE => 1052688

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_SUITE_MASK => 1052689

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_LCID => 1052690

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_REVISION => 1052691

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_NAME => 1052692

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_NAME_EDITION => 1052693

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_PLATFORM_ARCH => 1052694

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_SERVICEPACK_deprecated => 1052695

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_LOCALE => 1052696

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_BUILD_TIMESTAMP_ISO => 1052697

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_LCID_STR => 1052698

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ANALYSIS_SESSION_TIME => 1052699

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ANALYSIS_SESSION_HOST => 1052700

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ANALYSIS_SESSION_ELAPSED_TIME => 1052701

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ANALYSIS_VERSION => 1052702

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUCKET_ID_IMAGE_STR => 1052703

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUCKET_ID_PRIVATE => 1052704

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ANALYSIS_REPROCESS => 1052705

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_MAJOR => 1052706

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_MINOR => 1052707

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_BUILD_STRING => 1052708

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_LOCALE_LCID => 1052709

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_PLATFORM_ID => 1052710

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OS_BUILD_LAYERS_XML => 1052711

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_OSBUILD_deprecated => 1052928

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BUILDOSVER_STR_deprecated => 1052929

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DEBUG_ANALYSIS => 1118208

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_KEYVALUE_ANALYSIS => 1122304

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_KEY_VALUES_STRING => 1122560

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_KEY_VALUES_VARIANT => 1122816

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_TIMELINE_ANALYSIS => 1126400

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_TIMELINE_TIMES => 1126401

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STREAM_ANALYSIS => 1130496

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MEMORY_ANALYSIS => 1134592

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACKHASH_ANALYSIS => 1138688

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PROCESSES_ANALYSIS => 1142784

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SERVICE_ANALYSIS => 1146880

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_ADDITIONAL_XML => 1150976

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FOLLOWUP_CONTEXT => 2097153

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_LIST => 2097154

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_FRAME => 2097155

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_FRAME_NUMBER => 2097156

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_FRAME_INSTRUCTION => 2097157

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_FRAME_SYMBOL => 2097158

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_FRAME_SYMBOL_OFFSET => 2097159

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_FRAME_MODULE => 2097160

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_FRAME_IMAGE => 2097161

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_FRAME_FUNCTION => 2097162

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_FRAME_FLAGS => 2097163

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CONTEXT_COMMAND => 2097164

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CONTEXT_FLAGS => 2097165

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CONTEXT_ORDER => 2097166

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CONTEXT_SYSTEM => 2097167

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CONTEXT_ID => 2097168

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO => 2097169

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_INDEX => 2097170

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_NAME => 2097171

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_IMAGE_NAME => 2097172

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_IMAGE_PATH => 2097173

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_CHECKSUM => 2097174

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_TIMESTAMP => 2097175

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_UNLOADED => 2097176

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_ON_STACK => 2097177

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_FIXED_FILE_VER => 2097178

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_FIXED_PROD_VER => 2097179

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_STRING_FILE_VER => 2097180

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_STRING_PROD_VER => 2097181

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_COMPANY_NAME => 2097182

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_FILE_DESCRIPTION => 2097183

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_INTERNAL_NAME => 2097184

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_ORIG_FILE_NAME => 2097185

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_BASE => 2097186

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_SIZE => 2097187

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_PRODUCT_NAME => 2097188

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PROCESS_INFO => 2097189

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_EXCEPTION_MODULE_INFO => 2097190

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CONTEXT_FOLLOWUP_INDEX => 2097191

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_GLOBALATTRIBUTE_LIST => 2097192

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_ATTRIBUTE_LIST => 2097193

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_ATTRIBUTE => 2097194

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_ATTRIBUTE_NAME => 2097195

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_ATTRIBUTE_VALUE => 2097196

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_ATTRIBUTE_D1VALUE => 2097197

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_ATTRIBUTE_D2VALUE => 2097198

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_ATTRIBUTE_DOVALUE => 2097199

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_ATTRIBUTE_VALUE_TYPE => 2097200

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_ATTRIBUTE_FRAME_NUMBER => 2097201

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_ATTRIBUTE_THREAD_INDEX => 2097202

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_PROBLEMCLASS_LIST => 2097203

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_PROBLEMCLASS => 2097204

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_PROBLEMCLASS_NAME => 2097205

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_PROBLEMCLASS_VALUE => 2097206

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_PROBLEMCLASS_VALUE_TYPE => 2097207

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_PROBLEMCLASS_FRAME_NUMBER => 2097208

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_PROBLEMCLASS_THREAD_INDEX => 2097209

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_STACK_FRAME_TRIAGE_STATUS => 2097210

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CONTEXT_METADATA => 2097211

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_FRAMES => 2097212

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_ENCODED_OFFSETS => 2097213

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FA_PERF_DATA => 2097214

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FA_PERF_ITEM => 2097215

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FA_PERF_ITEM_NAME => 2097216

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FA_PERF_ITERATIONS => 2097217

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FA_PERF_ELAPSED_MS => 2097218

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_SHA1_HASH_MF => 2097219

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_SHA1_HASH_MFO => 2097220

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_SHA1_HASH_M => 2097221

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_SYMBOL_TYPE => 2097222

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_FILE_FLAGS => 2097223

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_FRAME_MODULE_BASE => 2097224

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STACK_FRAME_SRC => 2097225

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_SYSTEMINFO => 2097226

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_SYSTEMINFO_SYSTEMMANUFACTURER => 2097227

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_SYSTEMINFO_SYSTEMMODEL => 2097228

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_SYSTEMINFO_SYSTEMMARKER => 2097229

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FA_ADHOC_ANALYSIS_ITEMS => 2097230

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_APPLICATION_NAME => 2097231

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_PACKAGE_MONIKER => 2097232

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_PACKAGE_RELATIVE_APPLICATION_ID => 2097233

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODERN_ASYNC_REQUEST_OUTSTANDING => 2097234

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_EVENTTYPE => 2097235

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_PACKAGE_NAME => 2097236

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_PACKAGE_VERSION => 2097237

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAILURE_LIST => 2097238

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAILURE_DISPLAY_NAME => 2097239

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FRAME_SOURCE_FILE_NAME => 2097240

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FRAME_SOURCE_FILE_PATH => 2097241

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FRAME_SOURCE_LINE_NUMBER => 2097242

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_SYMSRV_IMAGE_STATUS => 2097243

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_SYMSRV_IMAGE_ERROR => 2097244

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_SYMSRV_IMAGE_DETAIL => 2097245

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_SYMSRV_IMAGE_SEC => 2097246

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_SYMSRV_PDB_STATUS => 2097247

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_SYMSRV_PDB_ERROR => 2097248

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_SYMSRV_PDB_DETAIL => 2097249

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_SYMSRV_PDB_SEC => 2097250

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XML_MODULE_INFO_DRIVER_GROUP => 2097251

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_REGISTRY_DATA => 3145728

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WMI_QUERY_DATA => 3149824

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_GLOBAL_ATTRIBUTES => 3153920

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_THREAD_ATTRIBUTES => 3158016

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER_PROBLEM_CLASSES => 3162112

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SM_COMPRESSION_FORMAT => 1342177280

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SM_SOURCE_PFN1 => 1342177281

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SM_SOURCE_PFN2 => 1342177282

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SM_SOURCE_OFFSET => 1342177283

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SM_SOURCE_SIZE => 1342177284

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SM_TARGET_PFN => 1342177285

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SM_BUFFER_HASH => 1342177286

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SM_ONEBIT_SOLUTION_COUNT => 1342177287

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_PRODUCT_ID => 1610612736

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_PRODUCT_DISPLAY_NAME => 1610612737

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_PRODUCT_DESCRIPTION => 1610612738

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_PRODUCT_EXTENDED_NAME => 1610612739

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_PUBLISHER_ID => 1610612740

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_PUBLISHER_NAME => 1610612741

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_PUBLISHER_CERTIFICATE_NAME => 1610612742

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_DEVELOPER_NAME => 1610612743

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_PACKAGE_FAMILY_NAME => 1610612744

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_PACKAGE_IDENTITY_NAME => 1610612745

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_PRIMARY_PARENT_PRODUCT_ID => 1610612746

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_LEGACY_PARENT_PRODUCT_ID => 1610612747

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_LEGACY_WINDOWS_STORE_PRODUCT_ID => 1610612748

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_LEGACY_WINDOWS_PHONE_PRODUCT_ID => 1610612749

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_LEGACY_XBOX_ONE_PRODUCT_ID => 1610612750

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_LEGACY_XBOX_360_PRODUCT_ID => 1610612751

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_XBOX_TITLE_ID => 1610612752

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_PREFERRED_SKU_ID => 1610612753

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_IS_MICROSOFT_PRODUCT => 1610612754

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_URL_APP => 1610612755

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_STORE_URL_APPHEALTH => 1610612756

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_VERSIONMAJOR => 1879048192

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_VERSIONMINOR => 1879048193

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_BUILDNUMBER => 1879048194

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_BUILDTIMESTAMP => 1879048195

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_BUILDBRANCH => 1879048196

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_BUILDER => 1879048197

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_LCID => 1879048198

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_QFE => 1879048199

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_OPERATOR => 1879048200

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_MCCMNC => 1879048201

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_FIRMWAREREVISION => 1879048202

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_RAM => 1879048203

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_ROMVERSION => 1879048204

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_SOCVERSION => 1879048205

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_HARDWAREREVISION => 1879048206

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_RADIOHARDWAREREVISION => 1879048207

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_RADIOSOFTWAREREVISION => 1879048208

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_BOOTLOADERVERSION => 1879048209

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_REPORTGUID => 1879048210

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_SOURCE => 1879048211

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_SOURCEEXTERNAL => 1879048212

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_USERALIAS => 1879048213

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_REPORTTIMESTAMP => 1879048214

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_APPID => 1879048215

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_SKUID => 1879048216

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_APPVERSION => 1879048217

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_UIF_COMMENT => 1879048218

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_UIF_APPNAME => 1879048219

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_UIF_APPID => 1879048220

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_UIF_CATEGORY => 1879048221

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PHONE_UIF_ORIGIN => 1879048222

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SIMULTANEOUS_TELSVC_INSTANCES => 1879048223

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SIMULTANEOUS_TELWP_INSTANCES => 1879048224

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MINUTES_SINCE_LAST_EVENT => 1879048225

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MINUTES_SINCE_LAST_EVENT_OF_THIS_TYPE => 1879048226

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_REPORT_INFO_GUID => 1879048227

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_REPORT_INFO_SOURCE => 1879048228

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_REPORT_INFO_CREATION_TIME => 1879048229

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_IP => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_MODULE => -2147483647

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_IMAGE_TIMESTAMP => -2147483646

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FOLLOWUP_IP => -2147483645

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FRAME_ONE_INVALID => -2147483644

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_SYMBOL_FROM_RAW_STACK_ADDRESS => -2147483643

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_IMAGE_VERSION => -2147483642

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FOLLOWUP_BUCKET_ID => -2147483641

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CUSTOM_ANALYSIS_TAG_MIN => -1610612736

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CUSTOM_ANALYSIS_TAG_MAX => -1342177280

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_FAULTING_THREAD => -1073741824

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CONTEXT => -1073741823

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_TRAP_FRAME => -1073741822

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_TSS => -1073741821

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BLOCKING_THREAD => -1073741820

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_UNRESPONSIVE_UI_THREAD => -1073741819

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BLOCKED_THREAD0 => -1073741818

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BLOCKED_THREAD1 => -1073741817

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BLOCKED_THREAD2 => -1073741816

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_BLOCKING_PROCESSID => -1073741815

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PROCESSOR_ID => -1073741814

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XDV_VIOLATED_CONDITION => -1073741813

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XDV_STATE_VARIABLE => -1073741812

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XDV_HELP_LINK => -1073741811

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_XDV_RULE_INFO => -1073741810

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DPC_STACK_BASE => -1073741809

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_TESTRESULTSERVER => -268435456

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_TESTRESULTGUID => -268435455

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CUSTOMREPORTTAG => -268435454

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISKSEC_ORGID_DEPRECATED => -268435453

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISKSEC_MODEL_DEPRECATED => -268435452

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISKSEC_MFGID_DEPRECATED => -268435451

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISKSEC_ISSUEDESCSTRING_DEPRECATED => -268435450

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISKSEC_PUBLIC_TOTSIZE_DEPRECATED => -268435449

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISKSEC_PUBLIC_OFFSET_DEPRECATED => -268435448

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISKSEC_PUBLIC_DATASIZE_DEPRECATED => -268435447

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISKSEC_PRIVATE_TOTSIZE_DEPRECATED => -268435446

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISKSEC_PRIVATE_OFFSET_DEPRECATED => -268435445

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISKSEC_PRIVATE_DATASIZE_DEPRECATED => -268435444

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISKSEC_TOTALSIZE_DEPRECATED => -268435443

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DISKSEC_REASON_DEPRECATED => -268435442

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WERCOLLECTION_PROCESSTERMINATED => -268435441

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WERCOLLECTION_PROCESSHEAPDUMP_REQUEST_FAILURE => -268435440

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WERCOLLECTION_MINIDUMP_WRITE_FAILURE => -268435439

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WERCOLLECTION_DEFAULTCOLLECTION_FAILURE => -268435438

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PROCESS_BAM_CURRENT_THROTTLED => -268435437

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_PROCESS_BAM_PREVIOUS_THROTTLED => -268435436

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DUMPSTREAM_COMMENTA => -268435435

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_DUMPSTREAM_COMMENTW => -268435434

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CHPE_PROCESS => -268435433

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_WINLOGON_BLACKBOX => -268435432

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CUSTOM_COMMAND => -268435431

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_CUSTOM_COMMAND_OUTPUT => -268435430

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_MASK_ALL => -1
}
