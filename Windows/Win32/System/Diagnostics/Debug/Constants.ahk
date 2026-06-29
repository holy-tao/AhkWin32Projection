#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global EXCEPTION_EXECUTE_HANDLER := 1

/**
 * @type {Integer (Int32)}
 */
export global EXCEPTION_CONTINUE_SEARCH := 0

/**
 * @type {Integer (Int32)}
 */
export global EXCEPTION_CONTINUE_EXECUTION := -1

/**
 * @type {Integer (UInt32)}
 */
export global WOW64_SIZE_OF_80387_REGISTERS := 80

/**
 * @type {Integer (UInt32)}
 */
export global WOW64_MAXIMUM_SUPPORTED_EXTENSION := 512

/**
 * @type {String}
 */
export global RESTORE_LAST_ERROR_NAME_A := "RestoreLastError"

/**
 * @type {String}
 */
export global RESTORE_LAST_ERROR_NAME_W := "RestoreLastError"

/**
 * @type {String}
 */
export global RESTORE_LAST_ERROR_NAME := "RestoreLastError"

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SYM_NAME := 2000

/**
 * @type {Integer (UInt32)}
 */
export global BIND_NO_BOUND_IMPORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global BIND_NO_UPDATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global BIND_ALL_IMAGES := 4

/**
 * @type {Integer (UInt32)}
 */
export global BIND_CACHE_IMPORT_DLLS := 8

/**
 * @type {Integer (UInt32)}
 */
export global BIND_REPORT_64BIT_VA := 16

/**
 * @type {Integer (UInt32)}
 */
export global CHECKSUM_SUCCESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global CHECKSUM_OPEN_FAILURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CHECKSUM_MAP_FAILURE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CHECKSUM_MAPVIEW_FAILURE := 3

/**
 * @type {Integer (UInt32)}
 */
export global CHECKSUM_UNICODE_FAILURE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SPLITSYM_REMOVE_PRIVATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPLITSYM_EXTRACT_ALL := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPLITSYM_SYMBOLPATH_IS_SRC := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PE_IMAGE_DIGEST_DEBUG_INFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PE_IMAGE_DIGEST_RESOURCES := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PE_IMAGE_DIGEST_ALL_IMPORT_INFO := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_PE_IMAGE_DIGEST_NON_PE_INFO := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_SECTION_TYPE_ANY := 255

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_IMAGE_NOT_STRIPPED := 34816

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_DBG_POINTER := 34817

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_NO_PDB_POINTER := 34818

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_COMPLETE := 0

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NO_LEADING_UNDERSCORES := 1

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NO_MS_KEYWORDS := 2

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NO_FUNCTION_RETURNS := 4

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NO_ALLOCATION_MODEL := 8

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NO_ALLOCATION_LANGUAGE := 16

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NO_MS_THISTYPE := 32

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NO_CV_THISTYPE := 64

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NO_THISTYPE := 96

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NO_ACCESS_SPECIFIERS := 128

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NO_THROW_SIGNATURES := 256

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NO_MEMBER_TYPE := 512

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NO_RETURN_UDT_MODEL := 1024

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_32_BIT_DECODE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NAME_ONLY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NO_ARGUMENTS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global UNDNAME_NO_SPECIAL_SYMS := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DBHHEADER_PDBGUID := 3

/**
 * @type {Integer (UInt32)}
 */
export global INLINE_FRAME_CONTEXT_INIT := 0

/**
 * @type {Integer (UInt32)}
 */
export global INLINE_FRAME_CONTEXT_IGNORE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global TARGET_ATTRIBUTE_PACMASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYM_STKWALK_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SYM_STKWALK_FORCE_FRAMEPTR := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYM_STKWALK_ZEROEXTEND_PTRS := 2

/**
 * @type {Integer (UInt32)}
 */
export global API_VERSION_NUMBER := 12

/**
 * @type {Integer (UInt32)}
 */
export global SYMFLAG_NULL := 524288

/**
 * @type {Integer (UInt32)}
 */
export global SYMFLAG_FUNC_NO_RETURN := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global SYMFLAG_SYNTHETIC_ZEROBASE := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global SYMFLAG_PUBLIC_CODE := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global SYMFLAG_REGREL_ALIASINDIR := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global SYMFLAG_FIXUP_ARM64X := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global SYMFLAG_GLOBAL := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global SYMFLAG_COMPLEX := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global SYMFLAG_RESET := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_MODULE_REGION_DLLBASE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_MODULE_REGION_DLLRANGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_MODULE_REGION_ADDITIONAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_MODULE_REGION_JIT := 8

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_MODULE_REGION_ALL := 255

/**
 * @type {Integer (UInt32)}
 */
export global CBA_DEFERRED_SYMBOL_LOAD_START := 1

/**
 * @type {Integer (UInt32)}
 */
export global CBA_DEFERRED_SYMBOL_LOAD_COMPLETE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CBA_DEFERRED_SYMBOL_LOAD_FAILURE := 3

/**
 * @type {Integer (UInt32)}
 */
export global CBA_SYMBOLS_UNLOADED := 4

/**
 * @type {Integer (UInt32)}
 */
export global CBA_DUPLICATE_SYMBOL := 5

/**
 * @type {Integer (UInt32)}
 */
export global CBA_READ_MEMORY := 6

/**
 * @type {Integer (UInt32)}
 */
export global CBA_DEFERRED_SYMBOL_LOAD_CANCEL := 7

/**
 * @type {Integer (UInt32)}
 */
export global CBA_SET_OPTIONS := 8

/**
 * @type {Integer (UInt32)}
 */
export global CBA_EVENT := 16

/**
 * @type {Integer (UInt32)}
 */
export global CBA_DEFERRED_SYMBOL_LOAD_PARTIAL := 32

/**
 * @type {Integer (UInt32)}
 */
export global CBA_DEBUG_INFO := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CBA_SRCSRV_INFO := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global CBA_SRCSRV_EVENT := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CBA_UPDATE_STATUS_BAR := 1342177280

/**
 * @type {Integer (UInt32)}
 */
export global CBA_ENGINE_PRESENT := 1610612736

/**
 * @type {Integer (UInt32)}
 */
export global CBA_CHECK_ENGOPT_DISALLOW_NETWORK_PATHS := 1879048192

/**
 * @type {Integer (UInt32)}
 */
export global CBA_CHECK_ARM_MACHINE_THUMB_TYPE_OVERRIDE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CBA_XML_LOG := 2415919104

/**
 * @type {Integer (UInt32)}
 */
export global CBA_MAP_JIT_SYMBOL := 2684354560

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SRCSPEW_START := 100

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SRCSPEW := 100

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_SRCSPEW_END := 199

/**
 * @type {Integer (UInt32)}
 */
export global DSLFLAG_MISMATCHED_PDB := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSLFLAG_MISMATCHED_DBG := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_ENGINE_PRESENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_ENGOPT_DISALLOW_NETWORK_PATHS := 8

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_OVERRIDE_ARM_MACHINE_TYPE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_CASE_INSENSITIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_UNDNAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_DEFERRED_LOADS := 4

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_NO_CPP := 8

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_LOAD_LINES := 16

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_OMAP_FIND_NEAREST := 32

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_LOAD_ANYTHING := 64

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_IGNORE_CVREC := 128

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_NO_UNQUALIFIED_LOADS := 256

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_FAIL_CRITICAL_ERRORS := 512

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_EXACT_SYMBOLS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_ALLOW_ABSOLUTE_SYMBOLS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_IGNORE_NT_SYMPATH := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_INCLUDE_32BIT_MODULES := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_PUBLICS_ONLY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_NO_PUBLICS := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_AUTO_PUBLICS := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_NO_IMAGE_SEARCH := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_SECURE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_NO_PROMPTS := 524288

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_OVERWRITE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_IGNORE_IMAGEDIR := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_FLAT_DIRECTORY := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_FAVOR_COMPRESSED := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_ALLOW_ZERO_ADDRESS := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_DISABLE_SYMSRV_AUTODETECT := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_READONLY_CACHE := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_SYMPATH_LAST := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_DISABLE_FAST_SYMBOLS := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_DISABLE_SYMSRV_TIMEOUT := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_DISABLE_SRVSTAR_ON_STARTUP := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SYMOPT_DEBUG := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SYM_INLINE_COMP_ERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global SYM_INLINE_COMP_IDENTICAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYM_INLINE_COMP_STEPIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYM_INLINE_COMP_STEPOUT := 3

/**
 * @type {Integer (UInt32)}
 */
export global SYM_INLINE_COMP_STEPOVER := 4

/**
 * @type {Integer (UInt32)}
 */
export global SYM_INLINE_COMP_DIFFERENT := 5

/**
 * @type {Integer (UInt32)}
 */
export global ESLFLAG_FULLPATH := 1

/**
 * @type {Integer (UInt32)}
 */
export global ESLFLAG_NEAREST := 2

/**
 * @type {Integer (UInt32)}
 */
export global ESLFLAG_PREV := 4

/**
 * @type {Integer (UInt32)}
 */
export global ESLFLAG_NEXT := 8

/**
 * @type {Integer (UInt32)}
 */
export global ESLFLAG_INLINE_SITE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SYMENUM_OPTIONS_DEFAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYMENUM_OPTIONS_INLINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYMSEARCH_MASKOBJS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYMSEARCH_RECURSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYMSEARCH_GLOBALSONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global SYMSEARCH_ALLITEMS := 8

/**
 * @type {Integer (UInt32)}
 */
export global EXT_OUTPUT_VER := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYMSRV_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_CALLBACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_OLDGUIDPTR := 16

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_UNATTENDED := 32

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_NOCOPY := 64

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_GETPATH := 64

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_PARENTWIN := 128

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_PARAMTYPE := 256

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_SECURE := 512

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_TRACE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_SETCONTEXT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_PROXY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_DOWNSTREAM_STORE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_OVERWRITE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_RESETTOU := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_CALLBACKW := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_FLAT_DEFAULT_STORE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_PROXYW := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_MESSAGE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_SERVICE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_FAVOR_COMPRESSED := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_STRING := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_WINHTTP := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_WININET := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_DONT_UNCOMPRESS := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_DISABLE_PING_HOST := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_DISABLE_TIMEOUT := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_ENABLE_COMM_MSG := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_URI_FILTER := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_URI_TIERS := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_RETRY_APP_HANG := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SSRVOPT_MAX := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global NUM_SSRVOPTS := 32

/**
 * @type {Integer (UInt32)}
 */
export global SSRVURI_HTTP_NORMAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global SSRVURI_HTTP_COMPRESSED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SSRVURI_HTTP_FILEPTR := 4

/**
 * @type {Integer (UInt32)}
 */
export global SSRVURI_UNC_NORMAL := 16

/**
 * @type {Integer (UInt32)}
 */
export global SSRVURI_UNC_COMPRESSED := 32

/**
 * @type {Integer (UInt32)}
 */
export global SSRVURI_UNC_FILEPTR := 64

/**
 * @type {Integer (UInt32)}
 */
export global SSRVURI_HTTP_MASK := 15

/**
 * @type {Integer (UInt32)}
 */
export global SSRVURI_UNC_MASK := 240

/**
 * @type {Integer (UInt32)}
 */
export global SSRVURI_ALL := 255

/**
 * @type {Integer (UInt32)}
 */
export global SSRVURI_NORMAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global SSRVURI_COMPRESSED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SSRVURI_FILEPTR := 4

/**
 * @type {Integer (UInt32)}
 */
export global SSRVACTION_TRACE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SSRVACTION_QUERYCANCEL := 2

/**
 * @type {Integer (UInt32)}
 */
export global SSRVACTION_EVENT := 3

/**
 * @type {Integer (UInt32)}
 */
export global SSRVACTION_EVENTW := 4

/**
 * @type {Integer (UInt32)}
 */
export global SSRVACTION_SIZE := 5

/**
 * @type {Integer (UInt32)}
 */
export global SSRVACTION_HTTPSTATUS := 6

/**
 * @type {Integer (UInt32)}
 */
export global SSRVACTION_XMLOUTPUT := 7

/**
 * @type {Integer (UInt32)}
 */
export global SSRVACTION_CHECKSUMSTATUS := 8

/**
 * @type {Integer (UInt32)}
 */
export global SYMSTOREOPT_ALT_INDEX := 16

/**
 * @type {Integer (UInt32)}
 */
export global SYMSTOREOPT_UNICODE := 32

/**
 * @type {Integer (UInt32)}
 */
export global SYMF_OMAP_GENERATED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SYMF_OMAP_MODIFIED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYMF_REGISTER := 8

/**
 * @type {Integer (UInt32)}
 */
export global SYMF_REGREL := 16

/**
 * @type {Integer (UInt32)}
 */
export global SYMF_FRAMEREL := 32

/**
 * @type {Integer (UInt32)}
 */
export global SYMF_PARAMETER := 64

/**
 * @type {Integer (UInt32)}
 */
export global SYMF_LOCAL := 128

/**
 * @type {Integer (UInt32)}
 */
export global SYMF_CONSTANT := 256

/**
 * @type {Integer (UInt32)}
 */
export global SYMF_EXPORT := 512

/**
 * @type {Integer (UInt32)}
 */
export global SYMF_FORWARDER := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SYMF_FUNCTION := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SYMF_VIRTUAL := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SYMF_THUNK := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SYMF_TLSREL := 16384

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_SYMBOL_INFO_VALUEPRESENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_SYMBOL_INFO_REGISTER := 8

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_SYMBOL_INFO_REGRELATIVE := 16

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_SYMBOL_INFO_FRAMERELATIVE := 32

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_SYMBOL_INFO_PARAMETER := 64

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_SYMBOL_INFO_LOCAL := 128

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_SYMBOL_INFO_CONSTANT := 256

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_SYMBOL_FUNCTION := 2048

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_SYMBOL_VIRTUAL := 4096

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_SYMBOL_THUNK := 8192

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_SYMBOL_INFO_TLSRELATIVE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_RMAP_MAPPED_FLAT := 1

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_RMAP_BIG_ENDIAN := 2

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_RMAP_IGNORE_MISCOMPARE := 4

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_RMAP_FIXUP_ARM64X := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_RMAP_LOAD_RW_DATA_SECTIONS := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_RMAP_OMIT_SHARED_RW_DATA_SECTIONS := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global IMAGEHLP_RMAP_FIXUP_IMAGEBASE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global DMP_PHYSICAL_MEMORY_BLOCK_SIZE_32 := 700

/**
 * @type {Integer (UInt32)}
 */
export global DMP_CONTEXT_RECORD_SIZE_32 := 1200

/**
 * @type {Integer (UInt32)}
 */
export global DMP_RESERVED_0_SIZE_32 := 1760

/**
 * @type {Integer (UInt32)}
 */
export global DMP_RESERVED_2_SIZE_32 := 16

/**
 * @type {Integer (UInt32)}
 */
export global DMP_RESERVED_3_SIZE_32 := 56

/**
 * @type {Integer (UInt32)}
 */
export global DMP_PHYSICAL_MEMORY_BLOCK_SIZE_64 := 700

/**
 * @type {Integer (UInt32)}
 */
export global DMP_CONTEXT_RECORD_SIZE_64 := 3000

/**
 * @type {Integer (UInt32)}
 */
export global DMP_RESERVED_0_SIZE_64 := 4008

/**
 * @type {Integer (UInt32)}
 */
export global DMP_HEADER_COMMENT_SIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global DUMP_SUMMARY_VALID_KERNEL_VA := 1

/**
 * @type {Integer (UInt32)}
 */
export global DUMP_SUMMARY_VALID_CURRENT_USER_VA := 2

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_VERSION := 42899

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_MISC1_PROCESSOR_POWER_INFO := 4

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_MISC3_PROCESS_INTEGRITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_MISC3_PROCESS_EXECUTE_FLAGS := 32

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_MISC3_TIMEZONE := 64

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_MISC3_PROTECTED_PROCESS := 128

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_MISC4_BUILDSTRING := 256

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_MISC5_PROCESS_COOKIE := 512

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_SYSMEMINFO1_FILECACHE_TRANSITIONREPURPOSECOUNT_FLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_SYSMEMINFO1_BASICPERF := 2

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_SYSMEMINFO1_PERF_CCTOTALDIRTYPAGES_CCDIRTYPAGETHRESHOLD := 4

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_SYSMEMINFO1_PERF_RESIDENTAVAILABLEPAGES_SHAREDCOMMITPAGES := 8

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_SYSMEMINFO1_PERF_MDLPAGESALLOCATED_PFNDATABASECOMMITTEDPAGES := 16

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_SYSMEMINFO1_PERF_SYSTEMPAGETABLECOMMITTEDPAGES_CONTIGUOUSPAGESALLOCATED := 32

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_PROCESS_VM_COUNTERS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_PROCESS_VM_COUNTERS_VIRTUALSIZE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_PROCESS_VM_COUNTERS_EX := 4

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_PROCESS_VM_COUNTERS_EX2 := 8

/**
 * @type {Integer (UInt32)}
 */
export global MINIDUMP_PROCESS_VM_COUNTERS_JOB := 16

/**
 * @type {Integer (UInt32)}
 */
export global INTERFACESAFE_FOR_UNTRUSTED_CALLER := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERFACESAFE_FOR_UNTRUSTED_DATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERFACE_USES_DISPEX := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERFACE_USES_SECURITY_MANAGER := 8

/**
 * @type {Integer (UInt32)}
 */
export global WCT_MAX_NODE_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global WCT_OBJNAME_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global WCT_NETWORK_IO_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_DESCRIPTOR_VERSION_10 := 10

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_DESCRIPTOR_VERSION_11 := 11

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MAX_MC_BANKS := 32

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_FLAG_FIRMWAREFIRST := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_FLAG_GLOBAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_FLAG_GHES_ASSIST := 4

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_FLAG_DEFAULTSOURCE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERR_SRC_OVERRIDE_FLAG := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_INVALID_RELATED_SOURCE := 65535

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_XPFMCE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_XPFCMC := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_XPFNMI := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_IPFMCA := 3

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_IPFCMC := 4

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_IPFCPE := 5

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_AERROOTPORT := 6

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_AERENDPOINT := 7

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_AERBRIDGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_GENERIC := 9

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_GENERIC_V2 := 10

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_XPF_MC_BANK_STATUSFORMAT_IA32MCA := 0

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_XPF_MC_BANK_STATUSFORMAT_Intel64MCA := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_XPF_MC_BANK_STATUSFORMAT_AMD64MCA := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_NOTIFICATION_TYPE_POLLED := 0

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_NOTIFICATION_TYPE_EXTERNALINTERRUPT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_NOTIFICATION_TYPE_LOCALINTERRUPT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_NOTIFICATION_TYPE_SCI := 3

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_NOTIFICATION_TYPE_NMI := 4

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_NOTIFICATION_TYPE_CMCI := 5

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_NOTIFICATION_TYPE_MCE := 6

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_NOTIFICATION_TYPE_GPIO_SIGNAL := 7

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_NOTIFICATION_TYPE_ARMV8_SEA := 8

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_NOTIFICATION_TYPE_ARMV8_SEI := 9

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_NOTIFICATION_TYPE_EXTERNALINTERRUPT_GSIV := 10

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_NOTIFICATION_TYPE_SDEI := 11

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_DEVICE_DRIVER_CONFIG_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_DEVICE_DRIVER_CONFIG_V2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_DEVICE_DRIVER_CONFIG_MIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_DEVICE_DRIVER_CONFIG_MAX := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_DEVICE_DRIVER_BUFFER_SET_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_DEVICE_DRIVER_BUFFER_SET_MIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_DEVICE_DRIVER_BUFFER_SET_MAX := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_DISABLE_OFFLINE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEM_PERSISTOFFLINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEM_PFA_DISABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEM_PFA_PAGECOUNT := 3

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEM_PFA_THRESHOLD := 4

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_MEM_PFA_TIMEOUT := 5

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_DISABLE_DUMMY_WRITE := 6

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_RESTORE_CMCI_ENABLED := 7

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_RESTORE_CMCI_ATTEMPTS := 8

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_RESTORE_CMCI_ERR_LIMIT := 9

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_CMCI_THRESHOLD_COUNT := 10

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_CMCI_THRESHOLD_TIME := 11

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_CMCI_THRESHOLD_POLL_COUNT := 12

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_PENDING_PAGE_LIST_SZ := 13

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_BAD_PAGE_LIST_MAX_SIZE := 14

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_BAD_PAGE_LIST_LOCATION := 15

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_NOTIFY_ALL_OFFLINES := 16

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ROW_FAIL_CHECK_EXTENT := 17

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ROW_FAIL_CHECK_ENABLE := 18

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ROW_FAIL_CHECK_THRESHOLD := 19

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_DISABLE_PRM_ADDRESS_TRANSLATION := 20

/**
 * @type {Integer (UInt32)}
 */
export global WHEA_ENABLE_BATCHED_ROW_OFFLINE := 21

/**
 * @type {Integer (UInt32)}
 */
export global IPMI_OS_SEL_RECORD_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global IPMI_OS_SEL_RECORD_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global IPMI_IOCTL_INDEX := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_IPMI_INTERNAL_RECORD_SEL_EVENT := 2232320

/**
 * @type {Integer (UInt32)}
 */
export global IPMI_OS_SEL_RECORD_MASK := 65535

/**
 * @type {Integer (Int32)}
 */
export global sevMax := 4
;@endregion Constants
