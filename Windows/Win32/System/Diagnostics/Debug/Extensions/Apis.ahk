#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class Extensions {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DBG_CANCELLED => 3221226695

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DBG_TIMEOUT => 3221226932

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GET_TEXT_COMPLETIONS_NO_DOT_COMMANDS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GET_TEXT_COMPLETIONS_NO_EXTENSION_COMMANDS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GET_TEXT_COMPLETIONS_NO_SYMBOLS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GET_TEXT_COMPLETIONS_IS_DOT_COMMAND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GET_TEXT_COMPLETIONS_IS_EXTENSION_COMMAND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GET_TEXT_COMPLETIONS_IS_SYMBOL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_SOURCE_PATH_HAS_SOURCE_SERVER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_TARGET_EXCEPTION_CONTEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_TARGET_EXCEPTION_THREAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_TARGET_EXCEPTION_RECORD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_GET_ADDITIONAL_CREATE_OPTIONS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_SET_ADDITIONAL_CREATE_OPTIONS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_GET_WIN32_MAJOR_MINOR_VERSIONS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_READ_USER_MINIDUMP_STREAM => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_TARGET_CAN_DETACH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_SET_LOCAL_IMPLICIT_COMMAND_LINE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_GET_CAPTURED_EVENT_CODE_OFFSET => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_READ_CAPTURED_EVENT_CODE_STREAM => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_EXT_TYPED_DATA_ANSI => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_GET_EXTENSION_SEARCH_PATH_WIDE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_GET_TEXT_COMPLETIONS_WIDE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_GET_CACHED_SYMBOL_INFO => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_ADD_CACHED_SYMBOL_INFO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_REMOVE_CACHED_SYMBOL_INFO => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_GET_TEXT_COMPLETIONS_ANSI => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_CURRENT_OUTPUT_CALLBACKS_ARE_DML_AWARE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_GET_OFFSET_UNWIND_INFORMATION => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_GET_DUMP_HEADER => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_SET_DUMP_HEADER => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_MIDORI => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_PROCESS_DESCRIPTORS => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_MISC_INFORMATION => 25

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_OPEN_PROCESS_TOKEN => 26

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_OPEN_THREAD_TOKEN => 27

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_DUPLICATE_TOKEN => 28

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_QUERY_INFO_TOKEN => 29

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_CLOSE_TOKEN => 30

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_WOW_PROCESS => 31

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_WOW_MODULE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_LIVE_USER_NON_INVASIVE => 33

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_RESUME_THREAD => 34

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_INLINE_QUERY => 35

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_TL_INSTRUMENTATION_AWARE => 36

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_GET_INSTRUMENTATION_VERSION => 37

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_GET_MODULE_ARCHITECTURE => 38

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_GET_IMAGE_ARCHITECTURE => 39

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REQUEST_SET_PARENT_HWND => 40

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SRCFILE_SYMBOL_TOKEN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SRCFILE_SYMBOL_TOKEN_SOURCE_COMMAND_WIDE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SRCFILE_SYMBOL_CHECKSUMINFO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMINFO_BREAKPOINT_SOURCE_LINE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMINFO_IMAGEHLP_MODULEW64 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMINFO_GET_SYMBOL_NAME_BY_OFFSET_AND_TAG_WIDE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMINFO_GET_MODULE_SYMBOL_NAMES_AND_OFFSETS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYSOBJINFO_THREAD_BASIC_INFORMATION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYSOBJINFO_THREAD_NAME_WIDE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYSOBJINFO_CURRENT_PROCESS_COOKIE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TBINFO_EXIT_STATUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TBINFO_PRIORITY_CLASS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TBINFO_PRIORITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TBINFO_TIMES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TBINFO_START_OFFSET => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TBINFO_AFFINITY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TBINFO_ALL => 63

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_BREAKPOINT_CODE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_BREAKPOINT_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_BREAKPOINT_TIME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_BREAKPOINT_INLINE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_BREAKPOINT_GO_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_BREAKPOINT_DEFERRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_BREAKPOINT_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_BREAKPOINT_ADDER_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_BREAKPOINT_ONE_SHOT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_BREAK_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_BREAK_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_BREAK_EXECUTE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_BREAK_IO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ATTACH_KERNEL_CONNECTION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ATTACH_LOCAL_KERNEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ATTACH_EXDI_DRIVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ATTACH_INSTALL_DRIVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GET_PROC_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GET_PROC_FULL_MATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GET_PROC_ONLY_MATCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GET_PROC_SERVICE_NAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PROC_DESC_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PROC_DESC_NO_PATHS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PROC_DESC_NO_SERVICES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PROC_DESC_NO_MTS_PACKAGES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PROC_DESC_NO_COMMAND_LINE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PROC_DESC_NO_SESSION_ID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PROC_DESC_NO_USER_NAME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PROC_DESC_WITH_PACKAGEFAMILY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PROC_DESC_WITH_ARCHITECTURE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ATTACH_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ATTACH_NONINVASIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ATTACH_EXISTING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ATTACH_NONINVASIVE_NO_SUSPEND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ATTACH_INVASIVE_NO_INITIAL_BREAK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ATTACH_INVASIVE_RESUME_PROCESS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ATTACH_NONINVASIVE_ALLOW_PARTIAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ECREATE_PROCESS_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ECREATE_PROCESS_INHERIT_HANDLES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ECREATE_PROCESS_USE_VERIFIER_FLAGS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ECREATE_PROCESS_USE_IMPLICIT_COMMAND_LINE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PROCESS_DETACH_ON_EXIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PROCESS_ONLY_THIS_PROCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CONNECT_SESSION_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CONNECT_SESSION_NO_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CONNECT_SESSION_NO_ANNOUNCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SERVERS_DEBUGGER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SERVERS_PROCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SERVERS_ALL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_END_PASSIVE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_END_ACTIVE_TERMINATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_END_ACTIVE_DETACH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_END_REENTRANT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_END_DISCONNECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_NORMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_ERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_WARNING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_VERBOSE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_PROMPT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_PROMPT_REGISTERS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_EXTENSION_WARNING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_DEBUGGEE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_DEBUGGEE_PROMPT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_SYMBOLS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_STATUS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_XML => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_IOUTPUT_KD_PROTOCOL => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_IOUTPUT_REMOTING => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_IOUTPUT_BREAKPOINT => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_IOUTPUT_EVENT => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_IOUTPUT_ADDR_TRANSLATE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_IDENTITY_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CLIENT_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CLIENT_VSINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CLIENT_NTSD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CLIENT_NTKD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CLIENT_CDB => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CLIENT_KD => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CLIENT_WINDBG => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CLIENT_WINIDE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_CAB_SECONDARY_ALL_IMAGES => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_WRITE_CAB => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_CAB_SECONDARY_FILES => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_NO_OVERWRITE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_FULL_MEMORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_HANDLE_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_UNLOADED_MODULES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_INDIRECT_MEMORY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_DATA_SEGMENTS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_FILTER_MEMORY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_FILTER_PATHS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_PROCESS_THREAD_DATA => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_PRIVATE_READ_WRITE_MEMORY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_NO_OPTIONAL_DATA => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_FULL_MEMORY_INFO => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_THREAD_INFO => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_CODE_SEGMENTS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_NO_AUXILIARY_STATE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_FULL_AUXILIARY_STATE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_MODULE_HEADERS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_FILTER_TRIAGE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_ADD_AVX_XSTATE_CONTEXT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_IPT_TRACE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_IGNORE_INACCESSIBLE_MEM => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FORMAT_USER_SMALL_SCAN_PARTIAL_PAGES => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DUMP_FILE_BASE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DUMP_FILE_PAGE_FILE_DUMP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DUMP_FILE_LOAD_FAILED_INDEX => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DUMP_FILE_ORIGINAL_CAB_INDEX => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_NO_CHANGE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_GO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_GO_HANDLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_GO_NOT_HANDLED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_STEP_OVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_STEP_INTO => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_BREAK => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_NO_DEBUGGEE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_STEP_BRANCH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_IGNORE_EVENT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_RESTART_REQUESTED => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_REVERSE_GO => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_REVERSE_STEP_BRANCH => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_REVERSE_STEP_OVER => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_REVERSE_STEP_INTO => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_OUT_OF_SYNC => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_WAIT_INPUT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_TIMEOUT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STATUS_MASK => 31

    /**
     * @type {Integer (UInt64)}
     */
    static DEBUG_STATUS_INSIDE_WAIT => 4294967296

    /**
     * @type {Integer (UInt64)}
     */
    static DEBUG_STATUS_WAIT_TIMEOUT => 8589934592

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCTL_THIS_CLIENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCTL_ALL_CLIENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCTL_ALL_OTHER_CLIENTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCTL_IGNORE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCTL_LOG_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCTL_SEND_MASK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCTL_NOT_LOGGED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCTL_OVERRIDE_MASK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCTL_DML => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCTL_AMBIENT_DML => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCTL_AMBIENT_TEXT => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCTL_AMBIENT => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_INTERRUPT_ACTIVE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_INTERRUPT_PASSIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_INTERRUPT_EXIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CURRENT_DEFAULT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CURRENT_SYMBOL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CURRENT_DISASM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CURRENT_REGISTERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CURRENT_SOURCE_LINE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DISASM_EFFECTIVE_ADDRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DISASM_MATCHING_SYMBOLS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DISASM_SOURCE_LINE_NUMBER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DISASM_SOURCE_FILE_NAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_LEVEL_SOURCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_LEVEL_ASSEMBLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_IGNORE_DBGHELP_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_IGNORE_EXTENSION_VERSIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_ALLOW_NETWORK_PATHS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_DISALLOW_NETWORK_PATHS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_IGNORE_LOADER_EXCEPTIONS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_INITIAL_BREAK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_INITIAL_MODULE_BREAK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_FINAL_BREAK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_NO_EXECUTE_REPEAT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_FAIL_INCOMPLETE_INFORMATION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_ALLOW_READ_ONLY_BREAKPOINTS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_SYNCHRONIZE_BREAKPOINTS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_DISALLOW_SHELL_COMMANDS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_KD_QUIET_MODE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_DISABLE_MANAGED_SUPPORT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_DISABLE_MODULE_SYMBOL_LOAD => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_DISABLE_EXECUTION_COMMANDS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_DISALLOW_IMAGE_FILE_MAPPING => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_PREFER_DML => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_DISABLESQM => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_DISABLE_STEPLINES_OPTIONS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_DEBUGGING_SENSITIVE_DATA => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_PREFER_TRACE_FILES => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_RESOLVE_SHADOWED_VARIABLES => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ENGOPT_ALL => 32505855

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ANY_ID => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_FRAME_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_FRAME_IGNORE_INLINE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static STACK_FRAME_TYPE_INIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STACK_FRAME_TYPE_STACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STACK_FRAME_TYPE_INLINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STACK_FRAME_TYPE_RA => 128

    /**
     * @type {Integer (UInt32)}
     */
    static STACK_FRAME_TYPE_IGNORE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_ARGUMENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_FUNCTION_INFO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_SOURCE_LINE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_FRAME_ADDRESSES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_COLUMN_NAMES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_NONVOLATILE_REGISTERS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_FRAME_NUMBERS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_PARAMETERS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_FRAME_ADDRESSES_RA_ONLY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_FRAME_MEMORY_USAGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_PARAMETERS_NEWLINE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_DML => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_FRAME_OFFSETS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_PROVIDER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_STACK_FRAME_ARCH => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CLASS_UNINITIALIZED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CLASS_KERNEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CLASS_USER_WINDOWS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CLASS_IMAGE_FILE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DUMP_SMALL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DUMP_DEFAULT => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DUMP_FULL => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DUMP_IMAGE_FILE => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DUMP_TRACE_LOG => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DUMP_WINDOWS_CE => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DUMP_ACTIVE => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_KERNEL_CONNECTION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_KERNEL_LOCAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_KERNEL_EXDI_DRIVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_KERNEL_IDNA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_KERNEL_INSTALL_DRIVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_KERNEL_REPT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_KERNEL_SMALL_DUMP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_KERNEL_DUMP => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_KERNEL_ACTIVE_DUMP => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_KERNEL_FULL_DUMP => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_KERNEL_TRACE_LOG => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_USER_WINDOWS_PROCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_USER_WINDOWS_PROCESS_SERVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_USER_WINDOWS_IDNA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_USER_WINDOWS_REPT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_USER_WINDOWS_SMALL_DUMP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_USER_WINDOWS_DUMP => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_USER_WINDOWS_DUMP_WINDOWS_CE => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXTENSION_AT_ENGINE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXECUTE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXECUTE_ECHO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXECUTE_NOT_LOGGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXECUTE_NO_REPEAT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXECUTE_USER_TYPED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXECUTE_USER_CLICKED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXECUTE_EXTENSION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXECUTE_INTERNAL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXECUTE_SCRIPT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXECUTE_TOOLBAR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXECUTE_MENU => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXECUTE_HOTKEY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXECUTE_EVENT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_CREATE_THREAD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_EXIT_THREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_CREATE_PROCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_EXIT_PROCESS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_LOAD_MODULE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_UNLOAD_MODULE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_SYSTEM_ERROR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_INITIAL_BREAKPOINT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_INITIAL_MODULE_LOAD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_DEBUGGEE_OUTPUT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_BREAK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_SECOND_CHANCE_BREAK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_OUTPUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_IGNORE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_REMOVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_GO_HANDLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FILTER_GO_NOT_HANDLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_WAIT_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VALUE_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VALUE_INT8 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VALUE_INT16 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VALUE_INT32 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VALUE_INT64 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VALUE_FLOAT32 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VALUE_FLOAT64 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VALUE_FLOAT80 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VALUE_FLOAT82 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VALUE_FLOAT128 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VALUE_VECTOR64 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VALUE_VECTOR128 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VALUE_TYPES => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUT_TEXT_REPL_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ASMOPT_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ASMOPT_VERBOSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ASMOPT_NO_CODE_BYTES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ASMOPT_IGNORE_OUTPUT_WIDTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ASMOPT_SOURCE_LINE_NUMBER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXPR_MASM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXPR_CPLUSPLUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EINDEX_NAME => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EINDEX_FROM_START => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EINDEX_FROM_END => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EINDEX_FROM_CURRENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_LOG_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_LOG_APPEND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_LOG_UNICODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_LOG_DML => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYSVERSTR_SERVICE_PACK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYSVERSTR_BUILD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MANAGED_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MANAGED_ALLOWED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MANAGED_DLL_LOADED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MANSTR_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MANSTR_LOADED_SUPPORT_DLL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MANSTR_LOAD_STATUS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MANRESET_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MANRESET_LOAD_DLL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXEC_FLAGS_NONBLOCK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_SPACE_VIRTUAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_SPACE_PHYSICAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_SPACE_CONTROL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_SPACE_IO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_SPACE_MSR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_SPACE_BUS_DATA => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_SPACE_DEBUGGER_DATA => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_SPACE_COUNT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KernBase => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_BreakpointWithStatusAddr => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_SavedContextAddr => 40

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KiCallUserModeAddr => 56

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KeUserCallbackDispatcherAddr => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_PsLoadedModuleListAddr => 72

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_PsActiveProcessHeadAddr => 80

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_PspCidTableAddr => 88

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_ExpSystemResourcesListAddr => 96

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_ExpPagedPoolDescriptorAddr => 104

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_ExpNumberOfPagedPoolsAddr => 112

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KeTimeIncrementAddr => 120

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KeBugCheckCallbackListHeadAddr => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KiBugcheckDataAddr => 136

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_IopErrorLogListHeadAddr => 144

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_ObpRootDirectoryObjectAddr => 152

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_ObpTypeObjectTypeAddr => 160

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmSystemCacheStartAddr => 168

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmSystemCacheEndAddr => 176

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmSystemCacheWsAddr => 184

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmPfnDatabaseAddr => 192

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmSystemPtesStartAddr => 200

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmSystemPtesEndAddr => 208

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmSubsectionBaseAddr => 216

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmNumberOfPagingFilesAddr => 224

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmLowestPhysicalPageAddr => 232

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmHighestPhysicalPageAddr => 240

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmNumberOfPhysicalPagesAddr => 248

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmMaximumNonPagedPoolInBytesAddr => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmNonPagedSystemStartAddr => 264

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmNonPagedPoolStartAddr => 272

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmNonPagedPoolEndAddr => 280

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmPagedPoolStartAddr => 288

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmPagedPoolEndAddr => 296

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmPagedPoolInformationAddr => 304

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmPageSize => 312

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmSizeOfPagedPoolInBytesAddr => 320

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmTotalCommitLimitAddr => 328

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmTotalCommittedPagesAddr => 336

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmSharedCommitAddr => 344

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmDriverCommitAddr => 352

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmProcessCommitAddr => 360

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmPagedPoolCommitAddr => 368

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmExtendedCommitAddr => 376

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmZeroedPageListHeadAddr => 384

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmFreePageListHeadAddr => 392

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmStandbyPageListHeadAddr => 400

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmModifiedPageListHeadAddr => 408

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmModifiedNoWritePageListHeadAddr => 416

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmAvailablePagesAddr => 424

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmResidentAvailablePagesAddr => 432

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_PoolTrackTableAddr => 440

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_NonPagedPoolDescriptorAddr => 448

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmHighestUserAddressAddr => 456

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmSystemRangeStartAddr => 464

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmUserProbeAddressAddr => 472

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KdPrintCircularBufferAddr => 480

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KdPrintCircularBufferEndAddr => 488

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KdPrintWritePointerAddr => 496

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KdPrintRolloverCountAddr => 504

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmLoadedUserImageListAddr => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_NtBuildLabAddr => 520

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KiNormalSystemCall => 528

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KiProcessorBlockAddr => 536

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmUnloadedDriversAddr => 544

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmLastUnloadedDriverAddr => 552

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmTriageActionTakenAddr => 560

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmSpecialPoolTagAddr => 568

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KernelVerifierAddr => 576

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmVerifierDataAddr => 584

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmAllocatedNonPagedPoolAddr => 592

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmPeakCommitmentAddr => 600

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmTotalCommitLimitMaximumAddr => 608

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_CmNtCSDVersionAddr => 616

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmPhysicalMemoryBlockAddr => 624

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmSessionBase => 632

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmSessionSize => 640

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmSystemParentTablePage => 648

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmVirtualTranslationBase => 656

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetKThreadNextProcessor => 664

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetKThreadTeb => 666

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetKThreadKernelStack => 668

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetKThreadInitialStack => 670

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetKThreadApcProcess => 672

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetKThreadState => 674

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetKThreadBStore => 676

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetKThreadBStoreLimit => 678

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_SizeEProcess => 680

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetEprocessPeb => 682

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetEprocessParentCID => 684

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetEprocessDirectoryTableBase => 686

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_SizePrcb => 688

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetPrcbDpcRoutine => 690

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetPrcbCurrentThread => 692

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetPrcbMhz => 694

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetPrcbCpuType => 696

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetPrcbVendorString => 698

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetPrcbProcessorState => 700

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_OffsetPrcbNumber => 702

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_SizeEThread => 704

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KdPrintCircularBufferPtrAddr => 712

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KdPrintBufferSizeAddr => 720

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_MmBadPagesDetected => 800

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_EtwpDebuggerData => 816

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_PteBase => 864

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_PaeEnabled => 100000

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_SharedUserData => 100008

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_ProductType => 100016

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_SuiteMask => 100024

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_DumpWriterStatus => 100032

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_DumpFormatVersion => 100040

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_DumpWriterVersion => 100048

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_DumpPowerState => 100056

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_DumpMmStorage => 100064

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_DumpAttributes => 100072

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_PagingLevels => 100080

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KPCR_OFFSET => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KPRCB_OFFSET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_KTHREAD_OFFSET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_BASE_TRANSLATION_VIRTUAL_OFFSET => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_PROCESSOR_IDENTIFICATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_DATA_PROCESSOR_SPEED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_BASIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_TYPE_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_OBJECT_NAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_HANDLE_COUNT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_TYPE_NAME_WIDE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_OBJECT_NAME_WIDE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_MINI_THREAD_1 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_MINI_MUTANT_1 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_MINI_MUTANT_2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_PER_HANDLE_OPERATIONS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_ALL_HANDLE_OPERATIONS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_MINI_PROCESS_1 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_MINI_PROCESS_2 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_MINI_EVENT_1 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_MINI_SECTION_1 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_HANDLE_DATA_TYPE_MINI_SEMAPHORE_1 => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OFFSINFO_VIRTUAL_SOURCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VSOURCE_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VSOURCE_DEBUGGEE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VSOURCE_MAPPED_IMAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VSOURCE_DUMP_WITHOUT_MEMINFO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VSEARCH_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_VSEARCH_WRITABLE_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PHYSICAL_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PHYSICAL_CACHED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PHYSICAL_UNCACHED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_PHYSICAL_WRITE_COMBINED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EVENT_BREAKPOINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EVENT_EXCEPTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EVENT_CREATE_THREAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EVENT_EXIT_THREAD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EVENT_CREATE_PROCESS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EVENT_EXIT_PROCESS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EVENT_LOAD_MODULE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EVENT_UNLOAD_MODULE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EVENT_SYSTEM_ERROR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EVENT_SESSION_STATUS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EVENT_CHANGE_DEBUGGEE_STATE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EVENT_CHANGE_ENGINE_STATE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EVENT_CHANGE_SYMBOL_STATE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EVENT_SERVICE_EXCEPTION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SESSION_ACTIVE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SESSION_END_SESSION_ACTIVE_TERMINATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SESSION_END_SESSION_ACTIVE_DETACH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SESSION_END_SESSION_PASSIVE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SESSION_END => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SESSION_REBOOT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SESSION_HIBERNATE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SESSION_FAILURE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_ALL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REGISTERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_EVALUATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_EXECUTE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_EXECUTECOMMANDFILE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_ADDBREAKPOINT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_REMOVEBREAKPOINT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_WRITEVIRTUAL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_WRITEVIRTUALUNCACHED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_WRITEPHYSICAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_WRITEPHYSICAL2 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_SETVALUE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_SETVALUE2 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_SETSCOPE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_SETSCOPEFRAMEBYINDEX => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_SETSCOPEFROMJITDEBUGINFO => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_SETSCOPEFROMSTOREDEVENT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_INLINESTEP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CDS_REFRESH_INLINESTEP_PSEUDO => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_ALL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_CURRENT_THREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_EFFECTIVE_PROCESSOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_BREAKPOINTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_CODE_LEVEL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_EXECUTION_STATUS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_ENGINE_OPTIONS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_LOG_FILE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_RADIX => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_EVENT_FILTERS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_PROCESS_OPTIONS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_EXTENSIONS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_SYSTEMS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_ASSEMBLY_OPTIONS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_EXPRESSION_SYNTAX => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CES_TEXT_REPLACEMENTS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CSS_ALL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CSS_LOADS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CSS_UNLOADS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CSS_SCOPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CSS_PATHS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CSS_SYMBOL_OPTIONS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CSS_TYPE_OPTIONS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CSS_COLLAPSE_CHILDREN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCBI_EXPLICIT_FLUSH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCBI_TEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCBI_DML => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCBI_ANY_FORMAT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCB_TEXT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCB_DML => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCB_EXPLICIT_FLUSH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCBF_COMBINED_EXPLICIT_FLUSH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCBF_DML_HAS_TAGS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTCBF_DML_HAS_SPECIAL_CHARACTERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REGISTERS_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REGISTERS_INT32 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REGISTERS_INT64 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REGISTERS_FLOAT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REGISTERS_ALL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REGISTER_SUB_REGISTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REGSRC_DEBUGGEE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REGSRC_EXPLICIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_REGSRC_FRAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_SYMBOLS_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_SYMBOLS_NO_NAMES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_SYMBOLS_NO_OFFSETS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_SYMBOLS_NO_VALUES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTPUT_SYMBOLS_NO_TYPES => 16

    /**
     * @type {String}
     */
    static DEBUG_OUTPUT_NAME_END => "**NAME**"

    /**
     * @type {String}
     */
    static DEBUG_OUTPUT_OFFSET_END => "**OFF**"

    /**
     * @type {String}
     */
    static DEBUG_OUTPUT_VALUE_END => "**VALUE**"

    /**
     * @type {String}
     */
    static DEBUG_OUTPUT_TYPE_END => "**TYPE**"

    /**
     * @type {String}
     */
    static DEBUG_OUTPUT_NAME_END_WIDE => "**NAME**"

    /**
     * @type {String}
     */
    static DEBUG_OUTPUT_OFFSET_END_WIDE => "**OFF**"

    /**
     * @type {String}
     */
    static DEBUG_OUTPUT_VALUE_END_WIDE => "**VALUE**"

    /**
     * @type {String}
     */
    static DEBUG_OUTPUT_TYPE_END_WIDE => "**TYPE**"

    /**
     * @type {String}
     */
    static DEBUG_OUTPUT_NAME_END_T => "**NAME**"

    /**
     * @type {String}
     */
    static DEBUG_OUTPUT_OFFSET_END_T => "**OFF**"

    /**
     * @type {String}
     */
    static DEBUG_OUTPUT_VALUE_END_T => "**VALUE**"

    /**
     * @type {String}
     */
    static DEBUG_OUTPUT_TYPE_END_T => "**TYPE**"

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMBOL_EXPANSION_LEVEL_MASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMBOL_EXPANDED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMBOL_READ_ONLY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMBOL_IS_ARRAY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMBOL_IS_FLOAT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMBOL_IS_ARGUMENT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMBOL_IS_LOCAL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMENT_IS_CODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMENT_IS_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMENT_IS_PARAMETER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMENT_IS_LOCAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMENT_IS_MANAGED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMENT_IS_SYNTHETIC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MODULE_LOADED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MODULE_UNLOADED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MODULE_USER_MODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MODULE_EXE_MODULE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MODULE_EXPLICIT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MODULE_SECONDARY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MODULE_SYNTHETIC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MODULE_SYM_BAD_CHECKSUM => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMTYPE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMTYPE_COFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMTYPE_CODEVIEW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMTYPE_PDB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMTYPE_EXPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMTYPE_DEFERRED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMTYPE_SYM => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SYMTYPE_DIA => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SCOPE_GROUP_ARGUMENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SCOPE_GROUP_LOCALS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SCOPE_GROUP_ALL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SCOPE_GROUP_BY_DATAMODEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTTYPE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTTYPE_NO_INDENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTTYPE_NO_OFFSET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTTYPE_VERBOSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTTYPE_COMPACT_OUTPUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTTYPE_ADDRESS_OF_FIELD => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTTYPE_ADDRESS_AT_END => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTTYPE_BLOCK_RECURSE => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FIND_SOURCE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FIND_SOURCE_FULL_PATH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FIND_SOURCE_BEST_MATCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FIND_SOURCE_NO_SRCSRV => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FIND_SOURCE_TOKEN_LOOKUP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FIND_SOURCE_WITH_CHECKSUM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FIND_SOURCE_WITH_CHECKSUM_STRICT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MODULE_ORDERS_MASK => 4026531840

    /**
     * @type {Integer (UInt32)}
     */
    static MODULE_ORDERS_LOADTIME => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static MODULE_ORDERS_MODULENAME => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MODNAME_IMAGE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MODNAME_MODULE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MODNAME_LOADED_IMAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MODNAME_SYMBOL_FILE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_MODNAME_MAPPED_IMAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TYPEOPTS_UNICODE_DISPLAY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TYPEOPTS_LONGSTATUS_DISPLAY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TYPEOPTS_FORCERADIX_OUTPUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TYPEOPTS_MATCH_MAXSIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GETMOD_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GETMOD_NO_LOADED_MODULES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GETMOD_NO_UNLOADED_MODULES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ADDSYNTHMOD_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ADDSYNTHMOD_ZEROBASE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_ADDSYNTHSYM_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTSYM_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTSYM_FORCE_OFFSET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTSYM_SOURCE_LINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_OUTSYM_ALLOW_DISPLACEMENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GETFNENT_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GETFNENT_RAW_ENTRY_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_SOURCE_IS_STATEMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GSEL_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GSEL_NO_SYMBOL_LOADS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GSEL_ALLOW_LOWER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GSEL_ALLOW_HIGHER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GSEL_NEAREST_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_GSEL_INLINE_CALLSITE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FRAME_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_FRAME_IGNORE_INLINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_COMMAND_EXCEPTION_ID => 3688893886

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CMDEX_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CMDEX_ADD_EVENT_STRING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_CMDEX_RESET_EVENT_STRINGS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXTINIT_HAS_COMMAND_HELP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_NOTIFY_SESSION_ACTIVE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_NOTIFY_SESSION_INACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_NOTIFY_SESSION_ACCESSIBLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_NOTIFY_SESSION_INACCESSIBLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_KNOWN_STRUCT_GET_NAMES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_KNOWN_STRUCT_GET_SINGLE_LINE_OUTPUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_KNOWN_STRUCT_SUPPRESS_TYPE_NAME => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXT_QVALUE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXT_PVALUE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXT_PVTYPE_IS_VALUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_EXT_PVTYPE_IS_POINTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static _EXTSAPI_VER_ => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_HANDLE_FLAG_PRINT_OBJECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_HANDLE_FLAG_PRINT_FREE_ENTRY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_HANDLE_FLAG_KERNEL_TABLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_HANDLE_FLAG_CID_TABLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static KDEXTS_LOCK_CALLBACKROUTINE_DEFINED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_NO_DB_LOOKUP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_VERBOSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_ASSUME_HANG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_IGNORE_BREAKIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_SET_FAILURE_CONTEXT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_EXCEPTION_AS_HANG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_AUTOBUG_PROCESSING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_XML_OUTPUT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_CALLSTACK_XML => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_REGISTRY_DATA => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_WMI_QUERY_DATA => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_USER_ATTRIBUTES => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_MODULE_INFO_XML => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_NO_IMAGE_CORRUPTION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_AUTOSET_SYMPATH => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_USER_ATTRIBUTES_ALL => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_USER_ATTRIBUTES_FRAMES => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_MULTI_TARGET => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_SHOW_SOURCE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_SHOW_WCT_STACKS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_CREATE_INSTANCE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_LIVE_DEBUG_HOLD_CHECK => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_XML_FILE_OUTPUT => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_XSD_VERIFY => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_CALLSTACK_XML_FULL_SOURCE_INFO => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_HEAP_CORRUPTION_BLAME_FUNCTION => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_PERMIT_HEAP_ACCESS_VIOLATIONS => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_XSLT_FILE_INPUT => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static FAILURE_ANALYSIS_XSLT_FILE_OUTPUT => 536870912

    /**
     * @type {String}
     */
    static CLSID_DebugFailureAnalysisBasic => "{b74eed7f-1c7d-4c1b-959f-b96dd9175aa4}"

    /**
     * @type {String}
     */
    static CLSID_DebugFailureAnalysisTarget => "{ba9bfb05-ef75-4bbd-a745-a6b5529458b8}"

    /**
     * @type {String}
     */
    static CLSID_DebugFailureAnalysisUser => "{e60b0c93-cf49-4a32-8147-0362202dc56b}"

    /**
     * @type {String}
     */
    static CLSID_DebugFailureAnalysisKernel => "{ee433078-64af-4c33-ab2f-ecad7f2a002d}"

    /**
     * @type {String}
     */
    static CLSID_DebugFailureAnalysisWinCE => "{67d5e86f-f5e2-462a-9233-1bd616fcc7e8}"

    /**
     * @type {String}
     */
    static CLSID_DebugFailureAnalysisXBox360 => "{901625bb-95f1-4318-ac80-9d733cee8c8b}"

    /**
     * @type {Integer (UInt32)}
     */
    static CROSS_PLATFORM_MAXIMUM_PROCESSORS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_STACK_IN_BYTES => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static TRIAGE_FOLLOWUP_FAIL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TRIAGE_FOLLOWUP_IGNORE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRIAGE_FOLLOWUP_DEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRIAGE_FOLLOWUP_SUCCESS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EXT_ANALYZER_FLAG_MOD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXT_ANALYZER_FLAG_ID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EXTDLL_DATA_QUERY_BUILD_BINDIR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXTDLL_DATA_QUERY_BUILD_SYMDIR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EXTDLL_DATA_QUERY_BUILD_WOW64SYMDIR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EXTDLL_DATA_QUERY_BUILD_WOW64BINDIR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EXTDLL_DATA_QUERY_BUILD_BINDIR_SYMSRV => 11

    /**
     * @type {Integer (UInt32)}
     */
    static EXTDLL_DATA_QUERY_BUILD_SYMDIR_SYMSRV => 12

    /**
     * @type {Integer (UInt32)}
     */
    static EXTDLL_DATA_QUERY_BUILD_WOW64SYMDIR_SYMSRV => 13

    /**
     * @type {Integer (UInt32)}
     */
    static EXTDLL_DATA_QUERY_BUILD_WOW64BINDIR_SYMSRV => 14

    /**
     * @type {Integer (UInt32)}
     */
    static EXT_API_VERSION_NUMBER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static EXT_API_VERSION_NUMBER32 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static EXT_API_VERSION_NUMBER64 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IG_KD_CONTEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IG_READ_CONTROL_SPACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IG_WRITE_CONTROL_SPACE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IG_READ_IO_SPACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IG_WRITE_IO_SPACE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IG_READ_PHYSICAL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IG_WRITE_PHYSICAL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IG_READ_IO_SPACE_EX => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IG_WRITE_IO_SPACE_EX => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IG_KSTACK_HELP => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IG_SET_THREAD => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IG_READ_MSR => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IG_WRITE_MSR => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_DEBUGGER_DATA => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_KERNEL_VERSION => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IG_RELOAD_SYMBOLS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_SET_SYMPATH => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_EXCEPTION_RECORD => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IG_IS_PTR64 => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_BUS_DATA => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IG_SET_BUS_DATA => 21

    /**
     * @type {Integer (UInt32)}
     */
    static IG_DUMP_SYMBOL_INFO => 22

    /**
     * @type {Integer (UInt32)}
     */
    static IG_LOWMEM_CHECK => 23

    /**
     * @type {Integer (UInt32)}
     */
    static IG_SEARCH_MEMORY => 24

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_CURRENT_THREAD => 25

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_CURRENT_PROCESS => 26

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_TYPE_SIZE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_CURRENT_PROCESS_HANDLE => 28

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_INPUT_LINE => 29

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_EXPRESSION_EX => 30

    /**
     * @type {Integer (UInt32)}
     */
    static IG_TRANSLATE_VIRTUAL_TO_PHYSICAL => 31

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_CACHE_SIZE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IG_READ_PHYSICAL_WITH_FLAGS => 33

    /**
     * @type {Integer (UInt32)}
     */
    static IG_WRITE_PHYSICAL_WITH_FLAGS => 34

    /**
     * @type {Integer (UInt32)}
     */
    static IG_POINTER_SEARCH_PHYSICAL => 35

    /**
     * @type {Integer (UInt32)}
     */
    static IG_OBSOLETE_PLACEHOLDER_36 => 36

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_THREAD_OS_INFO => 37

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_CLR_DATA_INTERFACE => 38

    /**
     * @type {Integer (UInt32)}
     */
    static IG_MATCH_PATTERN_A => 39

    /**
     * @type {Integer (UInt32)}
     */
    static IG_FIND_FILE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static IG_TYPED_DATA_OBSOLETE => 41

    /**
     * @type {Integer (UInt32)}
     */
    static IG_QUERY_TARGET_INTERFACE => 42

    /**
     * @type {Integer (UInt32)}
     */
    static IG_TYPED_DATA => 43

    /**
     * @type {Integer (UInt32)}
     */
    static IG_DISASSEMBLE_BUFFER => 44

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_ANY_MODULE_IN_RANGE => 45

    /**
     * @type {Integer (UInt32)}
     */
    static IG_VIRTUAL_TO_PHYSICAL => 46

    /**
     * @type {Integer (UInt32)}
     */
    static IG_PHYSICAL_TO_VIRTUAL => 47

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_CONTEXT_EX => 48

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_TEB_ADDRESS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IG_GET_PEB_ADDRESS => 129

    /**
     * @type {Integer (UInt32)}
     */
    static PHYS_FLAG_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PHYS_FLAG_CACHED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PHYS_FLAG_UNCACHED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PHYS_FLAG_WRITE_COMBINED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PTR_SEARCH_PHYS_ALL_HITS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PTR_SEARCH_PHYS_PTE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PTR_SEARCH_PHYS_RANGE_CHECK_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PTR_SEARCH_PHYS_SIZE_SHIFT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PTR_SEARCH_NO_SYMBOL_CHECK => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static EXT_FIND_FILE_ALLOW_GIVEN_PATH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TYPED_DATA_IS_IN_MEMORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TYPED_DATA_PHYSICAL_DEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TYPED_DATA_PHYSICAL_CACHED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TYPED_DATA_PHYSICAL_UNCACHED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TYPED_DATA_PHYSICAL_WRITE_COMBINED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TYPED_DATA_PHYSICAL_MEMORY => 14

    /**
     * @type {Integer (UInt32)}
     */
    static EXT_TDF_PHYSICAL_DEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EXT_TDF_PHYSICAL_CACHED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EXT_TDF_PHYSICAL_UNCACHED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static EXT_TDF_PHYSICAL_WRITE_COMBINED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EXT_TDF_PHYSICAL_MEMORY => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WDBGEXTS_ADDRESS_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WDBGEXTS_ADDRESS_SEG16 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WDBGEXTS_ADDRESS_SEG32 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WDBGEXTS_ADDRESS_RESERVED0 => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DBGKD_VERS_FLAG_MP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBGKD_VERS_FLAG_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBGKD_VERS_FLAG_PTR64 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DBGKD_VERS_FLAG_NOMM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DBGKD_VERS_FLAG_HSS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DBGKD_VERS_FLAG_PARTITIONS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DBGKD_VERS_FLAG_HAL_IN_NTOS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static KD_SECONDARY_VERSION_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KD_SECONDARY_VERSION_AMD64_OBSOLETE_CONTEXT_1 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KD_SECONDARY_VERSION_AMD64_OBSOLETE_CONTEXT_2 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KD_SECONDARY_VERSION_AMD64_CONTEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CURRENT_KD_SECONDARY_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_NO_INDENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_NO_OFFSET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_VERBOSE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_CALL_FOR_EACH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_LIST => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_NO_PRINT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_GET_SIZE_ONLY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_COMPACT_OUT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_ARRAY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_ADDRESS_OF_FIELD => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_ADDRESS_AT_END => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_COPY_TYPE_DATA => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_READ_PHYSICAL => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FUNCTION_FORMAT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_BLOCK_RECURSE => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_MATCH_SIZE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_RETURN_TYPE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_RETURN_SUBTYPES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_RETURN_TYPE_VALUES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FIELD_CALL_BEFORE_PRINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FIELD_NO_CALLBACK_REQ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FIELD_RECUR_ON_THIS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FIELD_FULL_NAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FIELD_ARRAY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FIELD_COPY_FIELD_DATA => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FIELD_RETURN_ADDRESS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FIELD_SIZE_IN_BITS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FIELD_NO_PRINT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FIELD_DEFAULT_STRING => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FIELD_WCHAR_STRING => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FIELD_MULTI_STRING => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FIELD_GUID_STRING => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_DUMP_FIELD_UTF32_STRING => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_READ_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYMBOL_TYPE_INDEX_NOT_FOUND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYMBOL_TYPE_INFO_NOT_FOUND => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FIELDS_DID_NOT_MATCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NULL_SYM_DUMP_PARAM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NULL_FIELD_NAME => 6

    /**
     * @type {Integer (UInt32)}
     */
    static INCORRECT_VERSION_INFO => 7

    /**
     * @type {Integer (UInt32)}
     */
    static EXIT_ON_CONTROLC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CANNOT_ALLOCATE_MEMORY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static INSUFFICIENT_SPACE_TO_COPY => 10

    /**
     * @type {Integer (UInt32)}
     */
    static ADDRESS_TYPE_INDEX_NOT_FOUND => 11

    /**
     * @type {Integer (UInt32)}
     */
    static UNAVAILABLE_ERROR => 12

    /**
     * @type {Integer (Int32)}
     */
    static DBGKD_SIMULATION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBGKD_SIMULATION_EXDI => 1
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {PSTR} RemoteOptions 
     * @param {Pointer<Guid>} InterfaceId 
     * @param {Pointer<Pointer<Void>>} Interface 
     * @returns {HRESULT} 
     */
    static DebugConnect(RemoteOptions, InterfaceId, Interface) {
        RemoteOptions := RemoteOptions is String ? StrPtr(RemoteOptions) : RemoteOptions

        result := DllCall("dbgeng.dll\DebugConnect", "ptr", RemoteOptions, "ptr", InterfaceId, "ptr*", Interface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} RemoteOptions 
     * @param {Pointer<Guid>} InterfaceId 
     * @param {Pointer<Pointer<Void>>} Interface 
     * @returns {HRESULT} 
     */
    static DebugConnectWide(RemoteOptions, InterfaceId, Interface) {
        RemoteOptions := RemoteOptions is String ? StrPtr(RemoteOptions) : RemoteOptions

        result := DllCall("dbgeng.dll\DebugConnectWide", "ptr", RemoteOptions, "ptr", InterfaceId, "ptr*", Interface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} InterfaceId 
     * @param {Pointer<Pointer<Void>>} Interface 
     * @returns {HRESULT} 
     */
    static DebugCreate(InterfaceId, Interface) {
        result := DllCall("dbgeng.dll\DebugCreate", "ptr", InterfaceId, "ptr*", Interface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} InterfaceId 
     * @param {Integer} DbgEngOptions 
     * @param {Pointer<Pointer<Void>>} Interface 
     * @returns {HRESULT} 
     */
    static DebugCreateEx(InterfaceId, DbgEngOptions, Interface) {
        result := DllCall("dbgeng.dll\DebugCreateEx", "ptr", InterfaceId, "uint", DbgEngOptions, "ptr*", Interface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {IDebugHost} debugHost 
     * @param {Pointer<IDataModelManager>} manager 
     * @returns {HRESULT} 
     */
    static CreateDataModelManager(debugHost, manager) {
        result := DllCall("dbgmodel.dll\CreateDataModelManager", "ptr", debugHost, "ptr*", manager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
