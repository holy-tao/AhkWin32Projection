#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class Debug {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_EXECUTE_HANDLER => 1

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_CONTINUE_SEARCH => 0

    /**
     * @type {Integer (Int32)}
     */
    static EXCEPTION_CONTINUE_EXECUTION => -1

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_SIZE_OF_80387_REGISTERS => 80

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_MAXIMUM_SUPPORTED_EXTENSION => 512

    /**
     * @type {String}
     */
    static RESTORE_LAST_ERROR_NAME_A => "RestoreLastError"

    /**
     * @type {String}
     */
    static RESTORE_LAST_ERROR_NAME_W => "RestoreLastError"

    /**
     * @type {String}
     */
    static RESTORE_LAST_ERROR_NAME => "RestoreLastError"

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_SYM_NAME => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static BIND_NO_BOUND_IMPORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BIND_NO_UPDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BIND_ALL_IMAGES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BIND_CACHE_IMPORT_DLLS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BIND_REPORT_64BIT_VA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKSUM_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKSUM_OPEN_FAILURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKSUM_MAP_FAILURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKSUM_MAPVIEW_FAILURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKSUM_UNICODE_FAILURE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SPLITSYM_REMOVE_PRIVATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPLITSYM_EXTRACT_ALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SPLITSYM_SYMBOLPATH_IS_SRC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_PE_IMAGE_DIGEST_DEBUG_INFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_PE_IMAGE_DIGEST_RESOURCES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_PE_IMAGE_DIGEST_ALL_IMPORT_INFO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_PE_IMAGE_DIGEST_NON_PE_INFO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SECTION_TYPE_ANY => 255

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IMAGE_NOT_STRIPPED => 34816

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_DBG_POINTER => 34817

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_PDB_POINTER => 34818

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_COMPLETE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NO_LEADING_UNDERSCORES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NO_MS_KEYWORDS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NO_FUNCTION_RETURNS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NO_ALLOCATION_MODEL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NO_ALLOCATION_LANGUAGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NO_MS_THISTYPE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NO_CV_THISTYPE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NO_THISTYPE => 96

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NO_ACCESS_SPECIFIERS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NO_THROW_SIGNATURES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NO_MEMBER_TYPE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NO_RETURN_UDT_MODEL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_32_BIT_DECODE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NAME_ONLY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NO_ARGUMENTS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static UNDNAME_NO_SPECIAL_SYMS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DBHHEADER_PDBGUID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static INLINE_FRAME_CONTEXT_INIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INLINE_FRAME_CONTEXT_IGNORE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static TARGET_ATTRIBUTE_PACMASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYM_STKWALK_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SYM_STKWALK_FORCE_FRAMEPTR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYM_STKWALK_ZEROEXTEND_PTRS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static API_VERSION_NUMBER => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_NULL => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_FUNC_NO_RETURN => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_SYNTHETIC_ZEROBASE => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_PUBLIC_CODE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_REGREL_ALIASINDIR => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_FIXUP_ARM64X => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_GLOBAL => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_RESET => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_MODULE_REGION_DLLBASE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_MODULE_REGION_DLLRANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_MODULE_REGION_ADDITIONAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_MODULE_REGION_JIT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_MODULE_REGION_ALL => 255

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_DEFERRED_SYMBOL_LOAD_START => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_DEFERRED_SYMBOL_LOAD_COMPLETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_DEFERRED_SYMBOL_LOAD_FAILURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_SYMBOLS_UNLOADED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_DUPLICATE_SYMBOL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_READ_MEMORY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_DEFERRED_SYMBOL_LOAD_CANCEL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_SET_OPTIONS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_EVENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_DEFERRED_SYMBOL_LOAD_PARTIAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_DEBUG_INFO => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_SRCSRV_INFO => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_SRCSRV_EVENT => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_UPDATE_STATUS_BAR => 1342177280

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_ENGINE_PRESENT => 1610612736

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_CHECK_ENGOPT_DISALLOW_NETWORK_PATHS => 1879048192

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_CHECK_ARM_MACHINE_THUMB_TYPE_OVERRIDE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_XML_LOG => 2415919104

    /**
     * @type {Integer (UInt32)}
     */
    static CBA_MAP_JIT_SYMBOL => 2684354560

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_SRCSPEW_START => 100

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_SRCSPEW => 100

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_SRCSPEW_END => 199

    /**
     * @type {Integer (UInt32)}
     */
    static DSLFLAG_MISMATCHED_PDB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSLFLAG_MISMATCHED_DBG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_ENGINE_PRESENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_ENGOPT_DISALLOW_NETWORK_PATHS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_OVERRIDE_ARM_MACHINE_TYPE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_CASE_INSENSITIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_UNDNAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_DEFERRED_LOADS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_NO_CPP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_LOAD_LINES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_OMAP_FIND_NEAREST => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_LOAD_ANYTHING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_IGNORE_CVREC => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_NO_UNQUALIFIED_LOADS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_FAIL_CRITICAL_ERRORS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_EXACT_SYMBOLS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_ALLOW_ABSOLUTE_SYMBOLS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_IGNORE_NT_SYMPATH => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_INCLUDE_32BIT_MODULES => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_PUBLICS_ONLY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_NO_PUBLICS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_AUTO_PUBLICS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_NO_IMAGE_SEARCH => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_SECURE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_NO_PROMPTS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_OVERWRITE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_IGNORE_IMAGEDIR => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_FLAT_DIRECTORY => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_FAVOR_COMPRESSED => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_ALLOW_ZERO_ADDRESS => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_DISABLE_SYMSRV_AUTODETECT => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_READONLY_CACHE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_SYMPATH_LAST => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_DISABLE_FAST_SYMBOLS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_DISABLE_SYMSRV_TIMEOUT => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_DISABLE_SRVSTAR_ON_STARTUP => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SYMOPT_DEBUG => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SYM_INLINE_COMP_ERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SYM_INLINE_COMP_IDENTICAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYM_INLINE_COMP_STEPIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYM_INLINE_COMP_STEPOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SYM_INLINE_COMP_STEPOVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SYM_INLINE_COMP_DIFFERENT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ESLFLAG_FULLPATH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ESLFLAG_NEAREST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ESLFLAG_PREV => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ESLFLAG_NEXT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ESLFLAG_INLINE_SITE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SYMENUM_OPTIONS_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYMENUM_OPTIONS_INLINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSEARCH_MASKOBJS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSEARCH_RECURSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSEARCH_GLOBALSONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSEARCH_ALLITEMS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EXT_OUTPUT_VER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSRV_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_CALLBACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_OLDGUIDPTR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_UNATTENDED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_NOCOPY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_GETPATH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_PARENTWIN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_PARAMTYPE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_SECURE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_TRACE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_SETCONTEXT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_PROXY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_DOWNSTREAM_STORE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_OVERWRITE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_RESETTOU => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_CALLBACKW => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_FLAT_DEFAULT_STORE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_PROXYW => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_MESSAGE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_SERVICE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_FAVOR_COMPRESSED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_STRING => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_WINHTTP => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_WININET => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_DONT_UNCOMPRESS => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_DISABLE_PING_HOST => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_DISABLE_TIMEOUT => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_ENABLE_COMM_MSG => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_URI_FILTER => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_URI_TIERS => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_RETRY_APP_HANG => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVOPT_MAX => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static NUM_SSRVOPTS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVURI_HTTP_NORMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVURI_HTTP_COMPRESSED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVURI_HTTP_FILEPTR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVURI_UNC_NORMAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVURI_UNC_COMPRESSED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVURI_UNC_FILEPTR => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVURI_HTTP_MASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVURI_UNC_MASK => 240

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVURI_ALL => 255

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVURI_NORMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVURI_COMPRESSED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVURI_FILEPTR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVACTION_TRACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVACTION_QUERYCANCEL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVACTION_EVENT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVACTION_EVENTW => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVACTION_SIZE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVACTION_HTTPSTATUS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVACTION_XMLOUTPUT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SSRVACTION_CHECKSUMSTATUS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSTOREOPT_ALT_INDEX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SYMSTOREOPT_UNICODE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SYMF_OMAP_GENERATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYMF_OMAP_MODIFIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYMF_REGISTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SYMF_REGREL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SYMF_FRAMEREL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SYMF_PARAMETER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SYMF_LOCAL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SYMF_CONSTANT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SYMF_EXPORT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SYMF_FORWARDER => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SYMF_FUNCTION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SYMF_VIRTUAL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SYMF_THUNK => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SYMF_TLSREL => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_SYMBOL_INFO_VALUEPRESENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_SYMBOL_INFO_REGISTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_SYMBOL_INFO_REGRELATIVE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_SYMBOL_INFO_FRAMERELATIVE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_SYMBOL_INFO_PARAMETER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_SYMBOL_INFO_LOCAL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_SYMBOL_INFO_CONSTANT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_SYMBOL_FUNCTION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_SYMBOL_VIRTUAL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_SYMBOL_THUNK => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_SYMBOL_INFO_TLSRELATIVE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_RMAP_MAPPED_FLAT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_RMAP_BIG_ENDIAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_RMAP_IGNORE_MISCOMPARE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_RMAP_FIXUP_ARM64X => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_RMAP_LOAD_RW_DATA_SECTIONS => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_RMAP_OMIT_SHARED_RW_DATA_SECTIONS => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_RMAP_FIXUP_IMAGEBASE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DMP_PHYSICAL_MEMORY_BLOCK_SIZE_32 => 700

    /**
     * @type {Integer (UInt32)}
     */
    static DMP_CONTEXT_RECORD_SIZE_32 => 1200

    /**
     * @type {Integer (UInt32)}
     */
    static DMP_RESERVED_0_SIZE_32 => 1760

    /**
     * @type {Integer (UInt32)}
     */
    static DMP_RESERVED_2_SIZE_32 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DMP_RESERVED_3_SIZE_32 => 56

    /**
     * @type {Integer (UInt32)}
     */
    static DMP_PHYSICAL_MEMORY_BLOCK_SIZE_64 => 700

    /**
     * @type {Integer (UInt32)}
     */
    static DMP_CONTEXT_RECORD_SIZE_64 => 3000

    /**
     * @type {Integer (UInt32)}
     */
    static DMP_RESERVED_0_SIZE_64 => 4008

    /**
     * @type {Integer (UInt32)}
     */
    static DMP_HEADER_COMMENT_SIZE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_SUMMARY_VALID_KERNEL_VA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DUMP_SUMMARY_VALID_CURRENT_USER_VA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_VERSION => 42899

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_MISC1_PROCESSOR_POWER_INFO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_MISC3_PROCESS_INTEGRITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_MISC3_PROCESS_EXECUTE_FLAGS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_MISC3_TIMEZONE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_MISC3_PROTECTED_PROCESS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_MISC4_BUILDSTRING => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_MISC5_PROCESS_COOKIE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_SYSMEMINFO1_FILECACHE_TRANSITIONREPURPOSECOUNT_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_SYSMEMINFO1_BASICPERF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_SYSMEMINFO1_PERF_CCTOTALDIRTYPAGES_CCDIRTYPAGETHRESHOLD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_SYSMEMINFO1_PERF_RESIDENTAVAILABLEPAGES_SHAREDCOMMITPAGES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_PROCESS_VM_COUNTERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_PROCESS_VM_COUNTERS_VIRTUALSIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_PROCESS_VM_COUNTERS_EX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_PROCESS_VM_COUNTERS_EX2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MINIDUMP_PROCESS_VM_COUNTERS_JOB => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INTERFACESAFE_FOR_UNTRUSTED_CALLER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERFACESAFE_FOR_UNTRUSTED_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERFACE_USES_DISPEX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERFACE_USES_SECURITY_MANAGER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WCT_MAX_NODE_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WCT_OBJNAME_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WCT_NETWORK_IO_FLAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_DESCRIPTOR_VERSION_10 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_DESCRIPTOR_VERSION_11 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MAX_MC_BANKS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_FLAG_FIRMWAREFIRST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_FLAG_GLOBAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_FLAG_GHES_ASSIST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_FLAG_DEFAULTSOURCE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_INVALID_RELATED_SOURCE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_XPFMCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_XPFCMC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_XPFNMI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_IPFMCA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_IPFCMC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_IPFCPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_AERROOTPORT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_AERENDPOINT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_AERBRIDGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_GENERIC => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ERROR_SOURCE_DESCRIPTOR_TYPE_GENERIC_V2 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_XPF_MC_BANK_STATUSFORMAT_IA32MCA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_XPF_MC_BANK_STATUSFORMAT_Intel64MCA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_XPF_MC_BANK_STATUSFORMAT_AMD64MCA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_NOTIFICATION_TYPE_POLLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_NOTIFICATION_TYPE_EXTERNALINTERRUPT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_NOTIFICATION_TYPE_LOCALINTERRUPT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_NOTIFICATION_TYPE_SCI => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_NOTIFICATION_TYPE_NMI => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_NOTIFICATION_TYPE_CMCI => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_NOTIFICATION_TYPE_MCE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_NOTIFICATION_TYPE_GPIO_SIGNAL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_NOTIFICATION_TYPE_ARMV8_SEA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_NOTIFICATION_TYPE_ARMV8_SEI => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_NOTIFICATION_TYPE_EXTERNALINTERRUPT_GSIV => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_NOTIFICATION_TYPE_SDEI => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_DEVICE_DRIVER_CONFIG_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_DEVICE_DRIVER_CONFIG_V2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_DEVICE_DRIVER_CONFIG_MIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_DEVICE_DRIVER_CONFIG_MAX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_DEVICE_DRIVER_BUFFER_SET_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_DEVICE_DRIVER_BUFFER_SET_MIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_DEVICE_DRIVER_BUFFER_SET_MAX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_DISABLE_OFFLINE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEM_PERSISTOFFLINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEM_PFA_DISABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEM_PFA_PAGECOUNT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEM_PFA_THRESHOLD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_MEM_PFA_TIMEOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_DISABLE_DUMMY_WRITE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_RESTORE_CMCI_ENABLED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_RESTORE_CMCI_ATTEMPTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_RESTORE_CMCI_ERR_LIMIT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_CMCI_THRESHOLD_COUNT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_CMCI_THRESHOLD_TIME => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_CMCI_THRESHOLD_POLL_COUNT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_PENDING_PAGE_LIST_SZ => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_BAD_PAGE_LIST_MAX_SIZE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_BAD_PAGE_LIST_LOCATION => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_NOTIFY_ALL_OFFLINES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ROW_FAIL_CHECK_EXTENT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ROW_FAIL_CHECK_ENABLE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static WHEA_ROW_FAIL_CHECK_THRESHOLD => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IPMI_OS_SEL_RECORD_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPMI_OS_SEL_RECORD_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPMI_IOCTL_INDEX => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_IPMI_INTERNAL_RECORD_SEL_EVENT => 2232320

    /**
     * @type {Integer (UInt32)}
     */
    static IPMI_OS_SEL_RECORD_MASK => 65535

    /**
     * @type {Integer (Int32)}
     */
    static sevMax => 4
;@endregion Constants

;@region Methods
    /**
     * Adds a dynamic function table to the dynamic function table list. (RtlAddFunctionTable)
     * @remarks
     * Function tables are used on 64-bit Windows to determine how to unwind or walk the stack. These tables are 
     *     usually generated by the compiler and stored as part of the image. However, applications must provide the 
     *     function table for dynamically generated code. For more information about function tables, see the architecture 
     *     guide for your system.
     * 
     * This function is useful for code that is generated from a template or generated only once during the life of 
     *     the process. For more dynamically generated code, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-rtlinstallfunctiontablecallback">RtlInstallFunctionTableCallback</a> 
     *     function.
     * @param {Pointer<IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY>} FunctionTable A pointer to an array of function entries. For a definition of the 
     *        <b>PRUNTIME_FUNCTION</b> type, see WinNT.h. For more information on runtime 
     *        function entries, see the calling convention documentation for the processor.
     * @param {Integer} EntryCount The number of entries in the <i>FunctionTable</i> array.
     * @param {Pointer} BaseAddress The base address to use when computing full virtual addresses from relative virtual addresses of function 
     *        table entries.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. Otherwise, the return value 
     *        is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtladdfunctiontable
     */
    static RtlAddFunctionTable(FunctionTable, EntryCount, BaseAddress) {
        result := DllCall("KERNEL32.dll\RtlAddFunctionTable", "ptr", FunctionTable, "uint", EntryCount, "ptr", BaseAddress, "char")
        return result
    }

    /**
     * Removes a dynamic function table from the dynamic function table list.
     * @remarks
     * Function tables are used on 64-bit Windows to determine how to unwind or walk the stack. These tables are 
     *     usually generated by the compiler and stored as part of the image. However, applications must provide the function 
     *     table for dynamically generated code. For more information about function tables, see the architecture guide for 
     *     your system.
     * @param {Pointer<IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY>} FunctionTable A pointer to an array of function entries that were previously passed to 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-rtladdfunctiontable">RtlAddFunctionTable</a> or an identifier previously 
     *       passed to 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-rtlinstallfunctiontablecallback">RtlInstallFunctionTableCallback</a>. For 
     *       a definition of the <b>PRUNTIME_FUNCTION</b> type, see WinNT.h.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. Otherwise, the return value 
     *       is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtldeletefunctiontable
     */
    static RtlDeleteFunctionTable(FunctionTable) {
        result := DllCall("KERNEL32.dll\RtlDeleteFunctionTable", "ptr", FunctionTable, "char")
        return result
    }

    /**
     * Adds a dynamic function table to the dynamic function table list. (RtlInstallFunctionTableCallback)
     * @remarks
     * Function tables are used on 64-bit Windows to determine how to unwind or walk the stack. These tables are 
     *     usually generated by the compiler and stored as part of the image. However, applications must provide the function 
     *     table for dynamically generated code. For more information about function tables, see the architecture guide for 
     *     your system.
     * 
     * This function is useful for very dynamic code. The application specifies the memory range for the generated 
     *     code, but does not need to generate a table until it is needed by an unwind request. At that time, the system 
     *     calls the callback function with the <i>Context</i> and the control address. The callback 
     *     function must return the runtime function entry for the specified address. Be sure to avoid creating a deadlock 
     *     between the callback function and the code generator.
     * 
     * For code that is generated from a template or generated only once during the life of the process, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-rtladdfunctiontable">RtlAddFunctionTable</a> function.
     * @param {Integer} TableIdentifier The identifier for the dynamic function table callback. The two low-order bits must be set. For example, 
     *       <i>BaseAddress</i>|0x3.
     * @param {Integer} BaseAddress The base address of the region of memory managed by the callback function.
     * @param {Integer} Length The size of the region of memory managed by the callback function, in bytes.
     * @param {Pointer<PGET_RUNTIME_FUNCTION_CALLBACK>} Callback A pointer to the callback function that is called to retrieve the function table entries for the functions 
     *       in the specified region of memory. For a definition of the 
     *       <b>PGET_RUNTIME_FUNCTION_CALLBACK</b> type, see WinNT.h.
     * @param {Pointer<Void>} Context A pointer to the user-defined data to be passed to the callback function.
     * @param {Pointer<Char>} OutOfProcessCallbackDll An optional pointer to a string that specifies the path of a DLL that provides function table entries that 
     *        are outside the process.
     * 
     * When a debugger unwinds to a function in the range of addresses managed by the callback function, it loads 
     *        this DLL and calls the <b>OUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK_EXPORT_NAME</b> 
     *        function, whose type is <b>POUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK</b>. For more 
     *        information, see the definitions of these items in WinNT.h.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the 
     *       return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlinstallfunctiontablecallback
     */
    static RtlInstallFunctionTableCallback(TableIdentifier, BaseAddress, Length, Callback, Context, OutOfProcessCallbackDll) {
        OutOfProcessCallbackDll := OutOfProcessCallbackDll is String? StrPtr(OutOfProcessCallbackDll) : OutOfProcessCallbackDll

        result := DllCall("KERNEL32.dll\RtlInstallFunctionTableCallback", "uint", TableIdentifier, "uint", BaseAddress, "uint", Length, "ptr", Callback, "ptr", Context, "ptr", OutOfProcessCallbackDll, "char")
        return result
    }

    /**
     * Informs the system of a dynamic function table representing a region of memory containing code.
     * @remarks
     * The function table can grow as code is added to the memory region. The entries in the table must be sorted. 
     *      This table is used for dispatching exceptions through runtime-generated code and for collecting stack 
     *      backtraces.
     * @param {Pointer<Void>} DynamicTable A pointer to a variable that receives an opaque reference to the newly-added table on success.
     * @param {Pointer<IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY>} FunctionTable A pointer to a partially-filled array of 
     *        <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-runtime_function">RUNTIME_FUNCTION</a> entries which provides 
     *        unwind information for the region of code. The entries in this array must remain sorted in ascending order of 
     *        the <b>BeginAddress</b> members.
     * @param {Integer} EntryCount The number of entries currently populated in the function table. This value may be zero.
     * @param {Integer} MaximumEntryCount The capacity of the function table.
     * @param {Pointer} RangeBase The beginning of the memory range described by the function table.
     * @param {Pointer} RangeEnd The end of the memory range described by the function table.
     * @returns {Integer} This function returns zero on success. (More detail).
     * 
     * See 
     *       <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-erref/596a1078-e883-4972-9bbc-49e60bebca55">http://msdn.microsoft.com/en-us/library/cc704588(PROT.10).aspx</a> 
     *       for a list of <b>NTSTATUS</b> values.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtladdgrowablefunctiontable
     * @since windows8.0
     */
    static RtlAddGrowableFunctionTable(DynamicTable, FunctionTable, EntryCount, MaximumEntryCount, RangeBase, RangeEnd) {
        result := DllCall("ntdll.dll\RtlAddGrowableFunctionTable", "ptr", DynamicTable, "ptr", FunctionTable, "uint", EntryCount, "uint", MaximumEntryCount, "ptr", RangeBase, "ptr", RangeEnd, "uint")
        return result
    }

    /**
     * Searches the active function tables for an entry that corresponds to the specified PC value.
     * @param {Pointer} ControlPc The virtual address of an instruction bundle within the function.
     * @param {Pointer<UIntPtr>} ImageBase The base address of module to which the function belongs.
     * @param {Pointer<UNWIND_HISTORY_TABLE>} HistoryTable The global pointer value of the module.
     * 
     * This parameter has a different declaration on x64 and ARM systems. For more information, see x64 Definition 
     *         and ARM Definition.
     * @returns {Pointer<IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY>} If there is no entry in the function table for the specified PC, the function returns 
     *       <b>NULL</b>. Otherwise, the function returns the address of the function table entry that 
     *       corresponds to the specified PC.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtllookupfunctionentry
     */
    static RtlLookupFunctionEntry(ControlPc, ImageBase, HistoryTable) {
        result := DllCall("KERNEL32.dll\RtlLookupFunctionEntry", "ptr", ControlPc, "ptr*", ImageBase, "ptr", HistoryTable, "ptr")
        return result
    }

    /**
     * Retrieves the invocation context of the function that precedes the specified function context.
     * @remarks
     * The complete list of epilogue markers for x64 is as follows:
     * 
     * <ul>
     * <li>ret</li>
     * <li>ret <i>n</i></li>
     * <li>rep ret</li>
     * <li>jmp <i>imm8</i> | <i>imm32</i> where the target is outside the function being unwound</li>
     * <li>jmp qword ptr <i>imm32</i></li>
     * <li>rex.w jmp <i>reg</i></li>
     * </ul>
     * @param {Integer} HandlerType 
     * @param {Pointer} ImageBase The base address of the module to which the function belongs.
     * @param {Pointer} ControlPc The virtual address where control left the specified function.
     * @param {Pointer<IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY>} FunctionEntry The address of the function table entry for the specified function. To obtain the function table entry, call 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-rtllookupfunctionentry">RtlLookupFunctionEntry</a> function.
     * @param {Pointer<CONTEXT>} ContextRecord A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure that represents the 
     *       context of the previous frame.
     * @param {Pointer<Void>} HandlerData The location of the PC. If this parameter is 0, the PC is in the prologue, epilogue, or a null frame region 
     *        of the function. If this parameter is 1, the PC is in the body of the function.
     * 
     * This parameter is not present on x64.
     * @param {Pointer<UIntPtr>} EstablisherFrame A pointer to a <b>FRAME_POINTERS</b> structure that receives the establisher frame 
     *        pointer value. The real frame pointer is defined only if <i>InFunction</i> is 1.
     * 
     * This parameter is of type <b>PULONG64</b> on x64.
     * @param {Pointer<KNONVOLATILE_CONTEXT_POINTERS>} ContextPointers An optional pointer to a context pointers structure.
     * @returns {Pointer<EXCEPTION_ROUTINE>} This function returns a pointer to an <i>EXCEPTION_ROUTINE</i> callback 
     *        function.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlvirtualunwind
     */
    static RtlVirtualUnwind(HandlerType, ImageBase, ControlPc, FunctionEntry, ContextRecord, HandlerData, EstablisherFrame, ContextPointers) {
        result := DllCall("KERNEL32.dll\RtlVirtualUnwind", "uint", HandlerType, "ptr", ImageBase, "ptr", ControlPc, "ptr", FunctionEntry, "ptr", ContextRecord, "ptr", HandlerData, "ptr*", EstablisherFrame, "ptr", ContextPointers, "ptr")
        return result
    }

    /**
     * Reads data from an area of memory in a specified process. The entire area to be read must be accessible or the operation fails.
     * @remarks
     * **ReadProcessMemory** copies the data in the specified address range from the address space of the specified process into the specified buffer of the current process. Any process that has a handle with PROCESS_VM_READ access can call the function.
     * 
     * The entire area to be read must be accessible, and if it is not accessible, the function fails.
     * @param {Pointer<Void>} hProcess A handle to the process with memory that is being read. The handle must have PROCESS_VM_READ access to the process.
     * @param {Pointer<Void>} lpBaseAddress A pointer to the base address in the specified process from which to read. Before any data transfer occurs, the system verifies that all data in the base address and memory of the specified size is accessible for read access, and if it is not accessible the function fails.
     * @param {Pointer} lpBuffer A pointer to a buffer that receives the contents from the address space of the specified process.
     * @param {Pointer} nSize The number of bytes to be read from the specified process.
     * @param {Pointer<UIntPtr>} lpNumberOfBytesRead A pointer to a variable that receives the number of bytes transferred into the specified buffer. If *lpNumberOfBytesRead* is **NULL**, the parameter is ignored.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     * [GetLastError](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * 
     * The function fails if the requested read operation crosses into an area of the process that is inaccessible.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-readprocessmemory
     * @since windows5.1.2600
     */
    static ReadProcessMemory(hProcess, lpBaseAddress, lpBuffer, nSize, lpNumberOfBytesRead) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReadProcessMemory", "ptr", hProcess, "ptr", lpBaseAddress, "ptr", lpBuffer, "ptr", nSize, "ptr*", lpNumberOfBytesRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes data to an area of memory in a specified process. The entire area to be written to must be accessible or the operation fails.
     * @remarks
     * <b>WriteProcessMemory</b> copies the data from the specified buffer in the current process to the address range of the specified process. Any process that has a handle with PROCESS_VM_WRITE and PROCESS_VM_OPERATION access to the process to be written to can call the function. Typically but not always, the process with address space that is being written to is  being debugged.
     * 
     * The entire area to be written to must be accessible, and if it is not accessible, the function fails.
     * @param {Pointer<Void>} hProcess A handle to the process memory to be modified. The handle must have PROCESS_VM_WRITE and PROCESS_VM_OPERATION access to the process.
     * @param {Pointer<Void>} lpBaseAddress A pointer to the base address in the specified process to which data is written. Before data transfer occurs, the system verifies that all data in the base address and memory of the specified size is accessible for write access, and if it is not accessible, the function fails.
     * @param {Pointer} lpBuffer A pointer to the buffer that contains data to be written in  the address space of the specified process.
     * @param {Pointer} nSize The number of bytes to be written to the specified process.
     * @param {Pointer<UIntPtr>} lpNumberOfBytesWritten A pointer to a variable that receives the number of bytes transferred into the specified process. This parameter is optional. If <i>lpNumberOfBytesWritten</i> is <b>NULL</b>, the parameter is ignored.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The function fails if the requested write operation crosses into an area of the process that is inaccessible.
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-writeprocessmemory
     * @since windows5.1.2600
     */
    static WriteProcessMemory(hProcess, lpBaseAddress, lpBuffer, nSize, lpNumberOfBytesWritten) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WriteProcessMemory", "ptr", hProcess, "ptr", lpBaseAddress, "ptr", lpBuffer, "ptr", nSize, "ptr*", lpNumberOfBytesWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the context of the specified thread.
     * @remarks
     * This function is used to retrieve the thread context of the specified thread. The function retrieves a selective context based on the value of the **ContextFlags** member of the context structure. The thread identified by the *hThread* parameter is typically being debugged, but the function can also operate when the thread is not being debugged.
     * 
     * You cannot get a valid context for a running thread. Use the [SuspendThread](/windows/desktop/api/processthreadsapi/nf-processthreadsapi-suspendthread) function to suspend the thread before calling **GetThreadContext**.
     * 
     * If you call **GetThreadContext** for the current thread, the function returns successfully; however, the context returned is not valid.
     * @param {Pointer<Void>} hThread A handle to the thread whose context is to be retrieved. The handle must have **THREAD_GET_CONTEXT** access to the thread. For more information, see [Thread Security and Access Rights](/windows/desktop/ProcThread/thread-security-and-access-rights).
     *       
     * 
     * **Windows XP or Windows Server 2003:** The handle must also have **THREAD_QUERY_INFORMATION** access.
     * @param {Pointer<CONTEXT>} lpContext A pointer to a [CONTEXT](/windows/win32/api/winnt/ns-winnt-context) structure (such as [ARM64_NT_CONTEXT](/windows/win32/api/winnt/ns-winnt-arm64_nt_context)) that receives the appropriate context of the specified thread. The value of the **ContextFlags** member of this structure specifies which portions of a thread's context are retrieved. The       **CONTEXT** structure is highly processor specific. Refer to the WinNT.h header file for processor-specific definitions of this structures and any alignment requirements.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadcontext
     * @since windows5.1.2600
     */
    static GetThreadContext(hThread, lpContext) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetThreadContext", "ptr", hThread, "ptr", lpContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the context for the specified thread.
     * @remarks
     * The function sets the thread context based on the value of the <b>ContextFlags</b> member 
     *     of the context structure. The thread identified by the <i>hThread</i> parameter is typically 
     *     being debugged, but the function can also operate even when the thread is not being debugged.
     * 
     * Do not try to set the context for a running thread; the results are unpredictable. Use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-suspendthread">SuspendThread</a> function to suspend the thread before 
     *     calling <b>SetThreadContext</b>.
     * @param {Pointer<Void>} hThread A handle to the thread whose context is to be set. The handle must have the 
     *       <b>THREAD_SET_CONTEXT</b> access right to the thread. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Pointer<CONTEXT>} lpContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure that contains the 
     *       context to be set in the specified thread. The value of the <b>ContextFlags</b> member of 
     *       this structure specifies which portions of a thread's context to set. Some values in the 
     *       <b>CONTEXT</b> structure that cannot be specified are silently 
     *       set to the correct value. This includes bits in the CPU status register that specify the privileged processor 
     *       mode, global enabling bits in the debugging register, and other states that must be controlled by the operating 
     *       system.
     * @returns {Integer} If the context was set, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadcontext
     * @since windows5.1.2600
     */
    static SetThreadContext(hThread, lpContext) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetThreadContext", "ptr", hThread, "ptr", lpContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Flushes the instruction cache for the specified process.
     * @remarks
     * Applications should call 
     * <b>FlushInstructionCache</b> if they generate or modify code in memory. The CPU cannot detect the change, and may execute the old code it cached.
     * @param {Pointer<Void>} hProcess A handle to a process whose instruction cache is to be flushed.
     * @param {Pointer} lpBaseAddress A pointer to the base of the region to be flushed. This parameter can be <b>NULL</b>.
     * @param {Pointer} dwSize The size of the region to be flushed if the <i>lpBaseAddress</i> parameter is not <b>NULL</b>, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-flushinstructioncache
     * @since windows5.1.2600
     */
    static FlushInstructionCache(hProcess, lpBaseAddress, dwSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FlushInstructionCache", "ptr", hProcess, "ptr", lpBaseAddress, "ptr", dwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the context of the specified WOW64 thread.
     * @remarks
     * This function is used to retrieve the thread context of the specified thread. The function retrieves a 
     *     selective context based on the value of the <b>ContextFlags</b> member of the context 
     *     structure. The thread identified by the <i>hThread</i> parameter is typically being debugged, 
     *     but the function can also operate when the thread is not being debugged.
     * 
     * You cannot get a valid context for a running thread. Use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-wow64suspendthread">Wow64SuspendThread</a> function to suspend the thread 
     *     before calling <b>Wow64GetThreadContext</b>.
     * 
     * If you call <b>Wow64GetThreadContext</b> for the 
     *     current thread, the function returns successfully; however, the context returned is not valid.
     * 
     * This function is intended for 64-bit applications. It is not supported on 32-bit Windows; such calls fail and 
     *     set the last error code to <b>ERROR_INVALID_FUNCTION</b>. A 32-bit application can call this 
     *     function on a WOW64 thread; the result is the same as calling the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getthreadcontext">GetThreadContext</a> function.
     * @param {Pointer<Void>} hThread A handle to the thread whose context is to be retrieved. The handle must have 
     *       <b>THREAD_GET_CONTEXT</b> access to the thread. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Pointer<WOW64_CONTEXT>} lpContext A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-wow64_context">WOW64_CONTEXT</a> structure. The caller must 
     *       initialize the <b>ContextFlags</b> member of this structure.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-wow64getthreadcontext
     * @since windows6.0.6000
     */
    static Wow64GetThreadContext(hThread, lpContext) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Wow64GetThreadContext", "ptr", hThread, "ptr", lpContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the context of the specified WOW64 thread.
     * @remarks
     * This function allows the selective context to be set based on the value of the 
     *     <b>ContextFlags</b> member of the context structure. The thread handle identified by the 
     *     <i>hThread</i> parameter is typically being debugged, but the function can also operate even 
     *     when it is not being debugged.
     * 
     * This function is intended for 64-bit applications. It is not supported on 32-bit Windows; such calls fail and 
     *     set the last error code to <b>ERROR_INVALID_FUNCTION</b>. A 32-bit application can call this 
     *     function on a WOW64 thread; the result is the same as calling the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadcontext">SetThreadContext</a> function.
     * 
     * Do not try to set the context for a running thread; the results are unpredictable. Use the 
     *     <a href="https://docs.microsoft.com/windows/win32/api/wow64apiset/nf-wow64apiset-wow64suspendthread">Wow64SuspendThread</a> function to suspend the thread 
     *     before calling <b>Wow64SetThreadContext</b>.
     * @param {Pointer<Void>} hThread A handle to the thread whose context is to be set.
     * @param {Pointer<WOW64_CONTEXT>} lpContext A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-wow64_context">WOW64_CONTEXT</a> structure. The caller must 
     *       initialize the <b>ContextFlags</b> member of this structure.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-wow64setthreadcontext
     * @since windows6.0.6000
     */
    static Wow64SetThreadContext(hThread, lpContext) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Wow64SetThreadContext", "ptr", hThread, "ptr", lpContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<CONTEXT>} ContextRecord 
     * @returns {Pointer} 
     */
    static RtlCaptureContext2(ContextRecord) {
        result := DllCall("KERNEL32.dll\RtlCaptureContext2", "ptr", ContextRecord)
        return result
    }

    /**
     * Reports that a dynamic function table has increased in size.
     * @remarks
     * <b>RtlGrowFunctionTable</b> should be called after populating the corresponding entries in the <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-runtime_function">RUNTIME_FUNCTION</a> array specified in <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-rtladdgrowablefunctiontable">RtlAddGrowableFunctionTable.</a>
     * @param {Pointer<Void>} DynamicTable An opaque reference returned by <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-rtladdgrowablefunctiontable">RtlAddGrowableFunctionTable.</a>.
     * @param {Integer} NewEntryCount The new number of entries in the <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-runtime_function">RUNTIME_FUNCTION</a> array. This must be greater than the previously reported size of the array.
     * @returns {Pointer} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlgrowfunctiontable
     * @since windows8.0
     */
    static RtlGrowFunctionTable(DynamicTable, NewEntryCount) {
        result := DllCall("ntdll.dll\RtlGrowFunctionTable", "ptr", DynamicTable, "uint", NewEntryCount)
        return result
    }

    /**
     * Informs the system that a previously reported dynamic function table is no longer in use.
     * @param {Pointer<Void>} DynamicTable An opaque reference returned by <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-rtladdgrowablefunctiontable">RtlAddGrowableFunctionTable.</a>
     * @returns {Pointer} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtldeletegrowablefunctiontable
     * @since windows8.0
     */
    static RtlDeleteGrowableFunctionTable(DynamicTable) {
        result := DllCall("ntdll.dll\RtlDeleteGrowableFunctionTable", "ptr", DynamicTable)
        return result
    }

    /**
     * Initiates an unwind of procedure call frames.
     * @remarks
     * The <b>FRAME_POINTERS</b> structure is defined as follows:
     * 
     * 
     * ```cpp
     * typedef struct _FRAME_POINTERS {
     *     ULONGLONG MemoryStackFp;
     *     ULONGLONG BackingStoreFp;
     * } FRAME_POINTERS, *PFRAME_POINTERS;
     * ```
     * @param {Pointer<Void>} TargetFrame A pointer to the call frame that is the target of the unwind. If this parameter is <b>NULL</b>, the function 
     *       performs an exit unwind.
     * @param {Pointer<Void>} TargetIp The continuation address of the unwind. This parameter is ignored if <i>TargetFrame</i> is 
     *       <b>NULL</b>.
     * @param {Pointer<EXCEPTION_RECORD>} ExceptionRecord A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_record">EXCEPTION_RECORD</a> structure.
     * @param {Pointer<Void>} ReturnValue A value to be placed in the integer function return register before continuing execution.
     * @param {Pointer<CONTEXT>} ContextRecord A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure that stores context 
     *       during the unwind operation.
     * @param {Pointer<UNWIND_HISTORY_TABLE>} HistoryTable A pointer to the unwind history table. This structure is processor specific. For definitions of this 
     *       structure, see Winternl.h.
     * @returns {Pointer} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlunwindex
     */
    static RtlUnwindEx(TargetFrame, TargetIp, ExceptionRecord, ReturnValue, ContextRecord, HistoryTable) {
        result := DllCall("KERNEL32.dll\RtlUnwindEx", "ptr", TargetFrame, "ptr", TargetIp, "ptr", ExceptionRecord, "ptr", ReturnValue, "ptr", ContextRecord, "ptr", HistoryTable)
        return result
    }

    /**
     * Computes the checksum of the specified image file.
     * @remarks
     * The 
     * <b>CheckSumMappedFile</b> function computes a new checksum for the file and returns it in the <i>CheckSum</i> parameter. This function is used by any application that creates or modifies an executable image. Checksums are required for kernel-mode drivers and some system DLLs. The linker computes the original checksum at link time, if you use the appropriate linker switch. For more details, see your linker documentation.
     * 
     * It is recommended that all images have valid checksums. It is the caller's responsibility to place the newly computed checksum into the mapped image and update the on-disk image of the file.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} BaseAddress The base address of the mapped file. This value is obtained by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> function.
     * @param {Integer} FileLength The size of the file, in bytes.
     * @param {Pointer<UInt32>} HeaderSum A pointer to a variable that receives the original checksum from the image file, or zero if there is an error.
     * @param {Pointer<UInt32>} CheckSum A pointer to the variable that receives the computed checksum.
     * @returns {Pointer<IMAGE_NT_HEADERS64>} If the function succeeds, the return value is a pointer to the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-image_nt_headers32">IMAGE_NT_HEADERS</a> structure contained in the mapped image.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-checksummappedfile
     * @since windows5.1.2600
     */
    static CheckSumMappedFile(BaseAddress, FileLength, HeaderSum, CheckSum) {
        A_LastError := 0

        result := DllCall("imagehlp.dll\CheckSumMappedFile", "ptr", BaseAddress, "uint", FileLength, "uint*", HeaderSum, "uint*", CheckSum, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates and returns the load configuration data of an image.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-setimageconfiginformation">SetImageConfigInformation</a> function locates and changes the load configuration data of an image.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<LOADED_IMAGE>} LoadedImage A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-loaded_image">LOADED_IMAGE</a> structure that is returned from a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-mapandload">MapAndLoad</a> or <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-imageload">ImageLoad</a>.
     * @param {Pointer<IMAGE_LOAD_CONFIG_DIRECTORY64>} ImageConfigInformation A pointer to an IMAGE_LOAD_CONFIG_DIRECTORY structure that receives the configuration information.
     * 
     * If \_WIN64 is defined, then IMAGE_LOAD_CONFIG_DIRECTORY is defined as [IMAGE_LOAD_CONFIG_DIRECTORY64](/windows/desktop/api/winnt/ns-winnt-image_load_config_directory64). However, if \_WIN64 is not defined, then IMAGE_LOAD_CONFIG_DIRECTORY is defined as [IMAGE_LOAD_CONFIG_DIRECTORY32](/windows/desktop/api/winnt/ns-winnt-image_load_config_directory32).
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-getimageconfiginformation
     * @since windows5.1.2600
     */
    static GetImageConfigInformation(LoadedImage, ImageConfigInformation) {
        A_LastError := 0

        result := DllCall("imagehlp.dll\GetImageConfigInformation", "ptr", LoadedImage, "ptr", ImageConfigInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates and changes the load configuration data of an image.
     * @remarks
     * The 
     * <b>SetImageConfigInformation</b> function locates and returns the load configuration data of an image.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<LOADED_IMAGE>} LoadedImage A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-loaded_image">LOADED_IMAGE</a> structure that is returned from a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-mapandload">MapAndLoad</a> or <b>LoadImage</b>.
     * @param {Pointer<IMAGE_LOAD_CONFIG_DIRECTORY64>} ImageConfigInformation A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_load_config_directory32">IMAGE_LOAD_CONFIG_DIRECTORY64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-setimageconfiginformation
     * @since windows5.1.2600
     */
    static SetImageConfigInformation(LoadedImage, ImageConfigInformation) {
        A_LastError := 0

        result := DllCall("imagehlp.dll\SetImageConfigInformation", "ptr", LoadedImage, "ptr", ImageConfigInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates the IMAGE_NT_HEADERS structure in a PE image and returns a pointer to the data.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} Base The base address of an image that is mapped into memory by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> function.
     * @returns {Pointer<IMAGE_NT_HEADERS64>} If the function succeeds, the return value is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-image_nt_headers32">IMAGE_NT_HEADERS</a> structure.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-imagentheader
     */
    static ImageNtHeader(Base) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\ImageNtHeader", "ptr", Base, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates a relative virtual address (RVA) within the image header of a file that is mapped as a file and returns a pointer to the section table entry for that RVA.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<IMAGE_NT_HEADERS64>} NtHeaders A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-image_nt_headers32">IMAGE_NT_HEADERS</a> structure. This structure can be obtained by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-imagentheader">ImageNtHeader</a> function.
     * @param {Pointer<Void>} Base This parameter is reserved.
     * @param {Integer} Rva The relative virtual address to be located.
     * @returns {Pointer<IMAGE_SECTION_HEADER>} If the function succeeds, the return value is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_section_header">IMAGE_SECTION_HEADER</a> structure.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-imagervatosection
     */
    static ImageRvaToSection(NtHeaders, Base, Rva) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\ImageRvaToSection", "ptr", NtHeaders, "ptr", Base, "uint", Rva, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates a relative virtual address (RVA) within the image header of a file that is mapped as a file and returns the virtual address of the corresponding byte in the file.
     * @remarks
     * The 
     * <b>ImageRvaToVa</b> function locates an RVA within the image header of a file that is mapped as a file and returns the virtual address of the corresponding byte in the file.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<IMAGE_NT_HEADERS64>} NtHeaders A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-image_nt_headers32">IMAGE_NT_HEADERS</a> structure. This structure can be obtained by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-imagentheader">ImageNtHeader</a> function.
     * @param {Pointer<Void>} Base The base address of an image that is mapped into memory through a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> function.
     * @param {Integer} Rva The relative virtual address to be located.
     * @param {Pointer<IMAGE_SECTION_HEADER>} LastRvaSection A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_section_header">IMAGE_SECTION_HEADER</a> structure that specifies the last RVA section. This is an optional parameter. When specified, it points to a variable that contains the last section value used for the specified image to translate an RVA to a VA.
     * @returns {Pointer<Void>} If the function succeeds, the return value is the virtual address in the mapped file.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-imagervatova
     */
    static ImageRvaToVa(NtHeaders, Base, Rva, LastRvaSection) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\ImageRvaToVa", "ptr", NtHeaders, "ptr", Base, "uint", Rva, "ptr", LastRvaSection)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The RtlCaptureStackBackTrace routine captures a stack back trace by walking up the stack and recording the information for each frame.
     * @param {Integer} FramesToSkip The number of frames to skip from the start of the back trace.
     * @param {Integer} FramesToCapture The number of frames to be captured.
     * @param {Pointer<Void>} BackTrace An array of pointers captured from the current stack trace.
     * @param {Pointer<UInt32>} BackTraceHash An optional value that can be used to organize hash tables. If this parameter is <b>NULL</b>, no hash value is computed.
     * 
     * This value is calculated based on the values of the pointers returned in the <i>BackTrace</i> array. Two identical stack traces will generate identical hash values.
     * @returns {Integer} The number of captured frames.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlcapturestackbacktrace
     * @since windows5.1.2600
     */
    static RtlCaptureStackBackTrace(FramesToSkip, FramesToCapture, BackTrace, BackTraceHash) {
        result := DllCall("KERNEL32.dll\RtlCaptureStackBackTrace", "uint", FramesToSkip, "uint", FramesToCapture, "ptr", BackTrace, "uint*", BackTraceHash, "ushort")
        return result
    }

    /**
     * Retrieves a context record in the context of the caller.
     * @param {Pointer<CONTEXT>} ContextRecord A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure.
     * @returns {Pointer} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlcapturecontext
     * @since windows5.1.2600
     */
    static RtlCaptureContext(ContextRecord) {
        result := DllCall("KERNEL32.dll\RtlCaptureContext", "ptr", ContextRecord)
        return result
    }

    /**
     * Initiates an unwind of procedure call frames. (RtlUnwind)
     * @param {Pointer<Void>} TargetFrame A pointer to the call frame that is the target of the unwind. If this parameter is 
     *       <b>NULL</b>, the function performs an exit unwind.
     * @param {Pointer<Void>} TargetIp The continuation address of the unwind. This parameter is ignored if <i>TargetFrame</i> 
     *       is <b>NULL</b>.
     * @param {Pointer<EXCEPTION_RECORD>} ExceptionRecord A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_record">EXCEPTION_RECORD</a> 
     *       structure.
     * @param {Pointer<Void>} ReturnValue A value to be placed in the integer function return register before continuing execution.
     * @returns {Pointer} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlunwind
     * @since windows5.1.2600
     */
    static RtlUnwind(TargetFrame, TargetIp, ExceptionRecord, ReturnValue) {
        result := DllCall("KERNEL32.dll\RtlUnwind", "ptr", TargetFrame, "ptr", TargetIp, "ptr", ExceptionRecord, "ptr", ReturnValue)
        return result
    }

    /**
     * Restores the context of the caller to the specified context record.
     * @param {Pointer<CONTEXT>} ContextRecord A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure.
     * @param {Pointer<EXCEPTION_RECORD>} ExceptionRecord A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_record">EXCEPTION_RECORD</a> structure. This parameter is optional and should typically be <b>NULL</b>. 
     * 
     * An exception record is used primarily with long jump and C++ catch-throw support. If the <b>ExceptionCode</b> member is STATUS_LONGJUMP, the <b>ExceptionInformation</b> member contains a pointer to a jump buffer. <b>RtlRestoreContext</b> will copy the non-volatile state from the jump buffer in to the context record before the context record is restored.
     * 
     * If the <b>ExceptionCode</b> member is STATUS_UNWIND_CONSOLIDATE, the <b>ExceptionInformation</b> member contains a pointer to a callback function, such as a catch handler. <b>RtlRestoreContext</b> consolidates the call frames between its frame and the frame specified in the context record before calling the callback function. This hides frames from any exception handling that might occur in the callback function. The difference between this and a typical unwind is that the data on the stack is still present, so frame data such as a throw object is still available. The callback function returns a new program counter to update in the context record, which is then used in a normal restore context.
     * @returns {Pointer} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlrestorecontext
     */
    static RtlRestoreContext(ContextRecord, ExceptionRecord) {
        result := DllCall("KERNEL32.dll\RtlRestoreContext", "ptr", ContextRecord, "ptr", ExceptionRecord, "CDecl ptr")
        return result
    }

    /**
     * Raises an exception.
     * @param {Pointer<EXCEPTION_RECORD>} ExceptionRecord Address of an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_record">EXCEPTION_RECORD</a> structure 
     *       that describes the exception, and the parameters of the exception, that is raised. Raising a software exception 
     *       captures the machine state of the current thread in a context record. The 
     *       <b>ExceptionAddress</b> member of the exception record is set to the caller's return 
     *       address.
     * @returns {Pointer} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/rtlsupportapi/nf-rtlsupportapi-rtlraiseexception
     */
    static RtlRaiseException(ExceptionRecord) {
        result := DllCall("KERNEL32.dll\RtlRaiseException", "ptr", ExceptionRecord)
        return result
    }

    /**
     * Retrieves the base address of the image that contains the specified PC value.
     * @param {Pointer<Void>} PcValue The PC value. The function searches all modules mapped into the address space of the calling process for a module that contains this value.
     * @param {Pointer<Void>} BaseOfImage The base address of the image containing the PC value. This value must be added to any relative addresses in the headers to locate the image.
     * @returns {Pointer<Void>} If the PC value is found, the function returns the base address of the image that contains the PC value.
     * 
     * If no image contains the PC value, the function returns <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlpctofileheader
     */
    static RtlPcToFileHeader(PcValue, BaseOfImage) {
        result := DllCall("KERNEL32.dll\RtlPcToFileHeader", "ptr", PcValue, "ptr", BaseOfImage)
        return result
    }

    /**
     * Determines whether the calling process is being debugged by a user-mode debugger.
     * @remarks
     * This function allows an application to determine whether or not it is being debugged, so that it can modify its behavior. For example, an application could provide additional information using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-outputdebugstringw">OutputDebugString</a> function if it is being debugged.
     * 
     * To determine whether a remote process is being debugged, use the <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-checkremotedebuggerpresent">CheckRemoteDebuggerPresent</a> function.
     * 
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0400 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @returns {Integer} If the current process is running in the context of a debugger, the return value is nonzero.
     * 
     * If the current process is not running in the context of a debugger, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/debugapi/nf-debugapi-isdebuggerpresent
     * @since windows5.1.2600
     */
    static IsDebuggerPresent() {
        result := DllCall("KERNEL32.dll\IsDebuggerPresent", "int")
        return result
    }

    /**
     * Causes a breakpoint exception to occur in the current process. This allows the calling thread to signal the debugger to handle the exception.
     * @remarks
     * If the process is not being debugged, the function uses the search logic of a standard exception handler. In most cases, this causes the calling process to terminate because of an unhandled breakpoint exception.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/debugapi/nf-debugapi-debugbreak
     * @since windows5.1.2600
     */
    static DebugBreak() {
        result := DllCall("KERNEL32.dll\DebugBreak")
        return result
    }

    /**
     * Sends a string to the debugger for display. (ANSI)
     * @remarks
     * > [!IMPORTANT]
     * > To use this function, you must include the Windows.h header in your application (not debugapi.h).
     * 
     * In the past, the operating system did not return Unicode strings through **OutputDebugStringW** (ASCII strings were returned instead). To force **OutputDebugStringW** to return Unicode strings, debuggers are required to call the [**WaitForDebugEventEx**](nf-debugapi-waitfordebugeventex.md) function to opt into the new behavior. In this way, the operating system knows that the debugger supports Unicode and is specifically opting into receiving Unicode strings.
     * 
     * If the application does not have a debugger, and the filter mask allows it, the system debugger displays the string. To display the string, this function calls the [**DbgPrint**](/windows-hardware/drivers/ddi/wdm/nf-wdm-dbgprint) function. Prior to Windows Vista, content was not filtered by the system debugger.
     * 
     * If the application does not have a debugger and the system debugger is not active, **OutputDebugString** does nothing.
     * 
     * [**OutputDebugStringW**](nf-debugapi-outputdebugstringw.md) converts the specified string based on the current system locale information and passes it to **OutputDebugStringA** to be displayed.  As a result, some Unicode characters may not be displayed correctly.
     * 
     * Applications should send very minimal debug output and provide a way for the user to enable or disable its use. See [Event Tracing](/windows/win32/etw/event-tracing-portal) to learn more about tracing details.
     * 
     * Visual Studio has changed how it handles the display of these strings throughout its revision history. Refer to the Visual Studio documentation for details of how your version deals with this.
     * 
     * The debugapi.h header defines OutputDebugString as an alias that automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that is not encoding-neutral can lead to mismatches and compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} lpOutputString The null-terminated string to be displayed.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/debugapi/nf-debugapi-outputdebugstringa
     * @since windows5.1.2600
     */
    static OutputDebugStringA(lpOutputString) {
        lpOutputString := lpOutputString is String? StrPtr(lpOutputString) : lpOutputString

        result := DllCall("KERNEL32.dll\OutputDebugStringA", "ptr", lpOutputString)
        return result
    }

    /**
     * Sends a string to the debugger for display. (Unicode)
     * @remarks
     * > [!IMPORTANT]
     * > To use this function, you must include the Windows.h header in your application (not debugapi.h).
     * 
     * In the past, the operating system did not return Unicode strings through **OutputDebugStringW** (ASCII strings were returned instead). To force **OutputDebugStringW** to return Unicode strings, debuggers are required to call the [**WaitForDebugEventEx**](nf-debugapi-waitfordebugeventex.md) function to opt into the new behavior. In this way, the operating system knows that the debugger supports Unicode and is specifically opting into receiving Unicode strings.
     * 
     * If the application does not have a debugger, and the filter mask allows it, the system debugger displays the string. To display the string, this function calls the [**DbgPrint**](/windows-hardware/drivers/ddi/wdm/nf-wdm-dbgprint) function. Prior to Windows Vista, content was not filtered by the system debugger.
     * 
     * If the application does not have a debugger and the system debugger is not active, **OutputDebugString** does nothing.
     * 
     * [**OutputDebugStringW**](nf-debugapi-outputdebugstringw.md) converts the specified string based on the current system locale information and passes it to **OutputDebugStringA** to be displayed.  As a result, some Unicode characters may not be displayed correctly.
     * 
     * Applications should send very minimal debug output and provide a way for the user to enable or disable its use. See [Event Tracing](/windows/win32/etw/event-tracing-portal) to learn more about tracing details.
     * 
     * Visual Studio has changed how it handles the display of these strings throughout its revision history. Refer to the Visual Studio documentation for details of how your version deals with this.
     * 
     * The debugapi.h header defines OutputDebugString as an alias that automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that is not encoding-neutral can lead to mismatches and compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} lpOutputString The null-terminated string to be displayed.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/debugapi/nf-debugapi-outputdebugstringw
     * @since windows5.1.2600
     */
    static OutputDebugStringW(lpOutputString) {
        lpOutputString := lpOutputString is String? StrPtr(lpOutputString) : lpOutputString

        result := DllCall("KERNEL32.dll\OutputDebugStringW", "ptr", lpOutputString)
        return result
    }

    /**
     * Enables a debugger to continue a thread that previously reported a debugging event.
     * @remarks
     * Only the thread that created <i>dwProcessId</i> with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function can call 
     * <b>ContinueDebugEvent</b>.
     * 
     * After the 
     * <b>ContinueDebugEvent</b> function succeeds, the specified thread continues. Depending on the debugging event previously reported by the thread, different actions occur. If the continued thread previously reported an EXIT_THREAD_DEBUG_EVENT debugging event, 
     * <b>ContinueDebugEvent</b> closes the handle the debugger has to the thread. If the continued thread previously reported an EXIT_PROCESS_DEBUG_EVENT debugging event, 
     * <b>ContinueDebugEvent</b> closes the handles the debugger has to the process and to the thread.
     * @param {Integer} dwProcessId The process identifier  of the process to continue.
     * @param {Integer} dwThreadId The thread identifier of the thread to continue. The combination of process identifier and thread identifier must identify a thread that has previously reported a debugging event.
     * @param {Integer} dwContinueStatus The options to continue the thread that reported the debugging event. 
     * 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DBG_CONTINUE"></a><a id="dbg_continue"></a><dl>
     * <dt><b>DBG_CONTINUE</b></dt>
     * <dt>0x00010002L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the thread specified by the <i>dwThreadId</i> parameter previously reported an EXCEPTION_DEBUG_EVENT debugging event, the function stops all exception processing and continues the thread and the exception is marked as handled. For any other debugging event, this flag simply continues the thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DBG_EXCEPTION_NOT_HANDLED"></a><a id="dbg_exception_not_handled"></a><dl>
     * <dt><b>DBG_EXCEPTION_NOT_HANDLED</b></dt>
     * <dt>0x80010001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the thread specified by <i>dwThreadId</i> previously reported an EXCEPTION_DEBUG_EVENT debugging event, the function continues exception processing. If this is a first-chance exception event, the search and dispatch logic of the structured exception handler is used; otherwise, the process is terminated. For any other debugging event, this flag simply continues the thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DBG_REPLY_LATER"></a><a id="dbg_reply_later"></a><dl>
     * <dt><b>DBG_REPLY_LATER</b></dt>
     * <dt>0x40010001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supported in Windows 10, version 1507 or above, this flag causes <i>dwThreadId</i> to replay the existing breaking event after the target continues. By calling the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-suspendthread">SuspendThread</a> API against <i>dwThreadId</i>, a debugger can resume other threads in the process and later return to the breaking.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/debugapi/nf-debugapi-continuedebugevent
     * @since windows5.1.2600
     */
    static ContinueDebugEvent(dwProcessId, dwThreadId, dwContinueStatus) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ContinueDebugEvent", "uint", dwProcessId, "uint", dwThreadId, "int", dwContinueStatus, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Waits for a debugging event to occur in a process being debugged. (WaitForDebugEvent)
     * @remarks
     * Only the thread that created the process being debugged can call 
     * <b>WaitForDebugEvent</b>.
     * 
     * When a CREATE_PROCESS_DEBUG_EVENT occurs, the debugger application receives a handle to the image file of the process being debugged, a handle to the process being debugged, and a handle to the initial thread of the process being debugged in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-debug_event">DEBUG_EVENT</a> structure. The members these handles are returned in are <b>u.CreateProcessInfo.hFile</b> (image file), <b>u.CreateProcessInfo.hProcess</b> (process), and <b>u.CreateProcessInfo.hThread</b> (initial thread). If the system previously reported an EXIT_PROCESS_DEBUG_EVENT debugging event, the system closes the handles to the process and thread when the debugger calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-continuedebugevent">ContinueDebugEvent</a> function. The debugger should close the handle to the image file by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * 
     * Similarly, when a CREATE_THREAD_DEBUG_EVENT occurs, the debugger application receives a handle to the thread whose creation caused the debugging event in the <b>u.CreateThread.hThread</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-debug_event">DEBUG_EVENT</a> structure. If the system previously reported an EXIT_THREAD_DEBUG_EVENT debugging event, the system closes the handles to the thread when the debugger calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-continuedebugevent">ContinueDebugEvent</a> function.
     * 
     * When a LOAD_DLL_DEBUG_EVENT occurs, the debugger application receives a handle to the loaded DLL in the <b>u.LoadDll.hFile</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-debug_event">DEBUG_EVENT</a> structure. This handle should be closed by the debugger application by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * 
     * <div class="alert"><b>Warning</b>  Do not queue an 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/asynchronous-procedure-calls">asynchronous procedure call</a> (APC) to a thread that calls 
     * <b>WaitForDebugEvent</b>.</div>
     * <div> </div>
     * @param {Pointer<DEBUG_EVENT>} lpDebugEvent A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-debug_event">DEBUG_EVENT</a> structure that receives information about the debugging event.
     * @param {Integer} dwMilliseconds The number of milliseconds to wait for a debugging event. If this parameter is zero, the function tests for a debugging event and returns immediately. If the parameter is INFINITE, the function does not return until a debugging event has occurred.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/debugapi/nf-debugapi-waitfordebugevent
     * @since windows5.1.2600
     */
    static WaitForDebugEvent(lpDebugEvent, dwMilliseconds) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WaitForDebugEvent", "ptr", lpDebugEvent, "uint", dwMilliseconds, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables a debugger to attach to an active process and debug it.
     * @remarks
     * To stop debugging the process, you must exit the process or call the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-debugactiveprocessstop">DebugActiveProcessStop</a> function. Exiting the 
     *     debugger also exits the process unless you use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-debugsetprocesskillonexit">DebugSetProcessKillOnExit</a> function.
     * 
     * The debugger must have appropriate access to the target process, and it must be able to open the process for 
     *     <b>PROCESS_ALL_ACCESS</b>. 
     *     <b>DebugActiveProcess</b> can fail if the target process 
     *     is created with a security descriptor that grants the debugger anything less than full access. If the debugging 
     *     process has the <b>SE_DEBUG_NAME</b> privilege granted and enabled, it can debug any 
     *     process.
     * 
     * After the system checks the process identifier and determines that a valid debugging attachment is being made, 
     *     the function returns <b>TRUE</b>. Then the debugger is expected to wait for debugging events by 
     *     using the <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-waitfordebugevent">WaitForDebugEvent</a> function. The system 
     *     suspends all threads in the process, and sends the debugger events that represents the current state of the 
     *     process.
     * 
     * The system sends the debugger a single <b>CREATE_PROCESS_DEBUG_EVENT</b> debugging event 
     *     that represents the process specified by the <i>dwProcessId</i> parameter. The 
     *     <b>lpStartAddress</b> member of the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-create_process_debug_info">CREATE_PROCESS_DEBUG_INFO</a> structure is 
     *     <b>NULL</b>.
     * 
     * For each thread that is currently part of the process, the system sends a 
     *     <b>CREATE_THREAD_DEBUG_EVENT</b> debugging event. The <b>lpStartAddress</b> 
     *     member of the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-create_thread_debug_info">CREATE_THREAD_DEBUG_INFO</a> 
     *     structure is <b>NULL</b>.
     * 
     * For each dynamic-link library (DLL) that is currently loaded into the address space of the target process, the 
     *     system sends a <b>LOAD_DLL_DEBUG_EVENT</b> debugging event. The system arranges for the first 
     *     thread in the process to execute a breakpoint instruction after it resumes. Continuing this thread causes it to 
     *     return to doing the same thing as before the debugger is attached.
     * 
     * After all of this is done, the system resumes all threads in the process. When the first thread in the process 
     *     resumes, it executes a breakpoint instruction that causes an <b>EXCEPTION_DEBUG_EVENT</b> 
     *     debugging event to be sent to the debugger. All future debugging events are sent to the debugger by using the 
     *     normal mechanism and rules.
     * @param {Integer} dwProcessId The identifier for the process to be debugged. The debugger is granted debugging access to the process as 
     *       if it created the process with the <b>DEBUG_ONLY_THIS_PROCESS</b> flag. For more information, 
     *       see the Remarks section of this topic.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/debugapi/nf-debugapi-debugactiveprocess
     * @since windows5.1.2600
     */
    static DebugActiveProcess(dwProcessId) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\DebugActiveProcess", "uint", dwProcessId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Stops the debugger from debugging the specified process.
     * @param {Integer} dwProcessId The identifier of the process to stop debugging.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/debugapi/nf-debugapi-debugactiveprocessstop
     * @since windows5.1.2600
     */
    static DebugActiveProcessStop(dwProcessId) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\DebugActiveProcessStop", "uint", dwProcessId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether the specified process is being debugged.
     * @remarks
     * The "remote" in <b>CheckRemoteDebuggerPresent</b> does not imply that the debugger  necessarily resides on a different computer; instead, it indicates that the debugger resides in a separate and parallel process. Use the <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-isdebuggerpresent">IsDebuggerPresent</a> function to detect whether the calling process is running under the debugger.
     * 
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0501 or later. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Pointer<Void>} hProcess A handle to the process.
     * @param {Pointer<Int32>} pbDebuggerPresent A pointer to a variable that the function sets to <b>TRUE</b> if the specified process is being debugged, or <b>FALSE</b> otherwise.
     * @returns {Integer} If the function succeeds, the return value is nonzero. 
     * 
     * If the function fails, the return value is zero. To get  extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/debugapi/nf-debugapi-checkremotedebuggerpresent
     * @since windows6.0.6000
     */
    static CheckRemoteDebuggerPresent(hProcess, pbDebuggerPresent) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\CheckRemoteDebuggerPresent", "ptr", hProcess, "int*", pbDebuggerPresent, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Waits for a debugging event to occur in a process being debugged. (WaitForDebugEventEx)
     * @remarks
     * Only the thread that created the process being debugged can call 
     * <b>WaitForDebugEventEx</b>.
     * 
     * When a CREATE_PROCESS_DEBUG_EVENT occurs, the debugger application receives a handle to the image file of the process being debugged, a handle to the process being debugged, and a handle to the initial thread of the process being debugged in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-debug_event">DEBUG_EVENT</a> structure. The members these handles are returned in are <b>u.CreateProcessInfo.hFile</b> (image file), <b>u.CreateProcessInfo.hProcess</b> (process), and <b>u.CreateProcessInfo.hThread</b> (initial thread). If the system previously reported an EXIT_PROCESS_DEBUG_EVENT debugging event, the system closes the handles to the process and thread when the debugger calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-continuedebugevent">ContinueDebugEvent</a> function. The debugger should close the handle to the image file by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * 
     * Similarly, when a CREATE_THREAD_DEBUG_EVENT occurs, the debugger application receives a handle to the thread whose creation caused the debugging event in the <b>u.CreateThread.hThread</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-debug_event">DEBUG_EVENT</a> structure. If the system previously reported an EXIT_THREAD_DEBUG_EVENT debugging event, the system closes the handles to the thread when the debugger calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-continuedebugevent">ContinueDebugEvent</a> function.
     * 
     * When a LOAD_DLL_DEBUG_EVENT occurs, the debugger application receives a handle to the loaded DLL in the <b>u.LoadDll.hFile</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-debug_event">DEBUG_EVENT</a> structure. This handle should be closed by the debugger application by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * 
     * <div class="alert"><b>Warning</b>  Do not queue an 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/asynchronous-procedure-calls">asynchronous procedure call</a> (APC) to a thread that calls 
     * <b>WaitForDebugEventEx</b>.</div>
     * <div> </div>
     * @param {Pointer<DEBUG_EVENT>} lpDebugEvent A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-debug_event">DEBUG_EVENT</a> structure that receives information about the debugging event.
     * @param {Integer} dwMilliseconds The number of milliseconds to wait for a debugging event. If this parameter is zero, the function tests for a debugging event and returns immediately. If the parameter is INFINITE, the function does not return until a debugging event has occurred.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/debugapi/nf-debugapi-waitfordebugeventex
     * @since windows10.0.10240
     */
    static WaitForDebugEventEx(lpDebugEvent, dwMilliseconds) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WaitForDebugEventEx", "ptr", lpDebugEvent, "uint", dwMilliseconds, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Ptr 
     * @returns {Pointer<Void>} 
     */
    static EncodePointer(Ptr) {
        result := DllCall("KERNEL32.dll\EncodePointer", "ptr", Ptr)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Ptr 
     * @returns {Pointer<Void>} 
     */
    static DecodePointer(Ptr) {
        result := DllCall("KERNEL32.dll\DecodePointer", "ptr", Ptr)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Ptr 
     * @returns {Pointer<Void>} 
     */
    static EncodeSystemPointer(Ptr) {
        result := DllCall("KERNEL32.dll\EncodeSystemPointer", "ptr", Ptr)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Ptr 
     * @returns {Pointer<Void>} 
     */
    static DecodeSystemPointer(Ptr) {
        result := DllCall("KERNEL32.dll\DecodeSystemPointer", "ptr", Ptr)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ProcessHandle 
     * @param {Pointer<Void>} Ptr 
     * @param {Pointer<Void>} EncodedPtr 
     * @returns {Integer} 
     */
    static EncodeRemotePointer(ProcessHandle, Ptr, EncodedPtr) {
        result := DllCall("api-ms-win-core-util-l1-1-1.dll\EncodeRemotePointer", "ptr", ProcessHandle, "ptr", Ptr, "ptr", EncodedPtr, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ProcessHandle 
     * @param {Pointer<Void>} Ptr 
     * @param {Pointer<Void>} DecodedPtr 
     * @returns {Integer} 
     */
    static DecodeRemotePointer(ProcessHandle, Ptr, DecodedPtr) {
        result := DllCall("api-ms-win-core-util-l1-1-1.dll\DecodeRemotePointer", "ptr", ProcessHandle, "ptr", Ptr, "ptr", DecodedPtr, "int")
        return result
    }

    /**
     * Generates simple tones on the speaker.
     * @remarks
     * A long time ago, all PC computers shared a common 8254 programmable interval timer chip for the generation of primitive sounds.  The <b>Beep</b> function was written specifically to emit a beep on that piece of hardware.  
     * 
     * On these older systems, muting and volume controls have no effect on <b>Beep</b>; you would still hear the tone. To silence the tone, you used the following commands:
     * 
     * <b>net stop beep</b>
     * 
     * <b>sc config beep start= disabled</b>
     * 
     * Since then, sound cards have become standard equipment on almost all PC computers.  As sound cards became more common, manufacturers began to remove the old timer chip from computers.   The chips were also excluded from the design of server computers.  The result is that <b>Beep</b> did not work on all computers without the chip.  This was okay because most developers had moved on to calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-messagebeep">MessageBeep</a> function that uses whatever is the default sound device instead of the 8254 chip.  
     * 
     * Eventually because of the lack of hardware to communicate with, support for <b>Beep</b> was dropped in Windows Vista and Windows XP 64-Bit Edition.
     * 
     * In Windows 7,  <b>Beep</b> was rewritten to pass the beep to the default sound device for the session.  This is normally the sound card, except when run under Terminal Services, in which case the beep is rendered on the client.
     * @param {Integer} dwFreq The frequency of the sound, in hertz. This parameter must be in the range 37 through 32,767 (0x25 through 0x7FFF).
     * @param {Integer} dwDuration The duration of the sound, in milliseconds.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/utilapiset/nf-utilapiset-beep
     * @since windows5.1.2600
     */
    static Beep(dwFreq, dwDuration) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Beep", "uint", dwFreq, "uint", dwDuration, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Raises an exception in the calling thread.
     * @remarks
     * The 
     * <b>RaiseException</b> function enables a process to use structured exception handling to handle private, software-generated, application-defined exceptions.
     * 
     * Raising an exception causes the exception dispatcher to go through the following search for an exception handler:
     * 
     * <ol>
     * <li>The system first attempts to notify the process's debugger, if any.</li>
     * <li>If the process is not being debugged, or if the associated debugger does not handle the exception, the system attempts to locate a frame-based exception handler by searching the stack frames of the thread in which the exception occurred. The system searches the current stack frame first, then proceeds backward through preceding stack frames.</li>
     * <li>If no frame-based handler can be found, or no frame-based handler handles the exception, the system makes a second attempt to notify the process's debugger.</li>
     * <li>If the process is not being debugged, or if the associated debugger does not handle the exception, the system provides default handling based on the exception type. For most exceptions, the default action is to call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitprocess">ExitProcess</a> function.</li>
     * </ol>
     * The values specified in the <i>dwExceptionCode</i>, <i>dwExceptionFlags</i>, <i>nNumberOfArguments</i>, and <i>lpArguments</i> parameters can be retrieved in the filter expression of a frame-based exception handler by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/getexceptioninformation">GetExceptionInformation</a> function. A debugger can retrieve these values by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-waitfordebugevent">WaitForDebugEvent</a> function.
     * @param {Integer} dwExceptionCode An application-defined exception code of the exception being raised. The filter expression and exception-handler block of an exception handler can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/getexceptioncode">GetExceptionCode</a> function to retrieve this value. 
     * 
     * 
     * 
     * 
     * Note that the system will clear bit 28 of <i>dwExceptionCode</i> before displaying a message This bit is a reserved exception bit, used by the system for its own purposes.
     * @param {Integer} dwExceptionFlags The exception flags. This can be either zero to indicate a continuable exception, or EXCEPTION_NONCONTINUABLE to indicate a noncontinuable exception. Any attempt to continue execution after a noncontinuable exception causes the EXCEPTION_NONCONTINUABLE_EXCEPTION exception.
     * @param {Integer} nNumberOfArguments The number of arguments in the <i>lpArguments</i> array. This value must not exceed EXCEPTION_MAXIMUM_PARAMETERS. This parameter is ignored if <i>lpArguments</i> is <b>NULL</b>.
     * @param {Pointer<UIntPtr>} lpArguments An array of arguments. This parameter can be <b>NULL</b>. These arguments can contain any application-defined data that needs to be passed to the filter expression of the exception handler.
     * @returns {Pointer} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-raiseexception
     * @since windows5.1.2600
     */
    static RaiseException(dwExceptionCode, dwExceptionFlags, nNumberOfArguments, lpArguments) {
        result := DllCall("KERNEL32.dll\RaiseException", "uint", dwExceptionCode, "uint", dwExceptionFlags, "uint", nNumberOfArguments, "ptr*", lpArguments)
        return result
    }

    /**
     * An application-defined function that passes unhandled exceptions to the debugger, if the process is being debugged.
     * @remarks
     * If the process is not being debugged, the function displays an <b>Application Error</b> message box, depending on the current error mode. The default behavior is to display the dialog box, but this can be disabled by specifying SEM_NOGPFAULTERRORBOX in a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-seterrormode">SetErrorMode</a> function.
     * 
     * The system uses 
     * <b>UnhandledExceptionFilter</b> internally to handle exceptions that occur during process and thread creation.
     * @param {Pointer<EXCEPTION_POINTERS>} ExceptionInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_pointers">EXCEPTION_POINTERS</a> structure that specifies a description of the exception and the processor context at the time of the exception. This pointer is the return value of a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/getexceptioninformation">GetExceptionInformation</a> function.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EXCEPTION_CONTINUE_SEARCH</b></dt>
     * <dt>0x0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process is being debugged, so the exception should be passed (as second chance) to the application's debugger.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>EXCEPTION_EXECUTE_HANDLER</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the SEM_NOGPFAULTERRORBOX flag was specified in a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-seterrormode">SetErrorMode</a>, no Application Error message box is displayed. The function returns control to the exception handler, which is free to take any appropriate action.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-unhandledexceptionfilter
     * @since windows5.1.2600
     */
    static UnhandledExceptionFilter(ExceptionInfo) {
        result := DllCall("KERNEL32.dll\UnhandledExceptionFilter", "ptr", ExceptionInfo, "int")
        return result
    }

    /**
     * Enables an application to supersede the top-level exception handler of each thread of a process.
     * @remarks
     * Issuing 
     * <b>SetUnhandledExceptionFilter</b> replaces the existing top-level exception filter for all existing and all future threads in the calling process.
     * 
     * The exception handler specified by <i>lpTopLevelExceptionFilter</i> is executed in the context of the thread that caused the fault. This can affect the exception handler's ability to recover from certain exceptions, such as an invalid stack.
     * @param {Pointer<LPTOP_LEVEL_EXCEPTION_FILTER>} lpTopLevelExceptionFilter A pointer to a top-level exception filter function that will be called whenever the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-unhandledexceptionfilter">UnhandledExceptionFilter</a> function gets control, and the process is not being debugged. A value of <b>NULL</b> for this parameter specifies default handling within 
     * <b>UnhandledExceptionFilter</b>. 
     * 
     * 
     * 
     * 
     * The filter function has syntax similar to that of
     * @returns {Pointer} The 
     * <b>SetUnhandledExceptionFilter</b> function returns the address of the previous exception filter established with the function. A <b>NULL</b> return value means that there is no current top-level exception handler.
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-setunhandledexceptionfilter
     * @since windows5.1.2600
     */
    static SetUnhandledExceptionFilter(lpTopLevelExceptionFilter) {
        result := DllCall("KERNEL32.dll\SetUnhandledExceptionFilter", "ptr", lpTopLevelExceptionFilter)
        return result
    }

    /**
     * Retrieves the error mode for the current process.
     * @remarks
     * Each process has an associated error mode that indicates to the system how the application is going to respond 
     *     to serious errors. A child process inherits the error mode of its parent process.
     * 
     * To change the error mode for the process, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-seterrormode">SetErrorMode</a> function.
     * 
     * <b>Windows 7:  </b>Callers should favor <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setthreaderrormode">SetThreadErrorMode</a> over 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-seterrormode">SetErrorMode</a> since it is less disruptive to the normal 
     *       behavior of the system. <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getthreaderrormode">GetThreadErrorMode</a> is the 
     *       call function that corresponds to <b>GetErrorMode</b>.
     * @returns {Pointer} The process error mode. This function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEM_FAILCRITICALERRORS</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system does not display the critical-error-handler message box. Instead, the system sends the error 
     *         to the calling process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEM_NOALIGNMENTFAULTEXCEPT</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system automatically fixes memory alignment faults and makes them invisible to the application. It 
     *         does this for the calling process and any descendant processes. This feature is only supported by certain 
     *         processor architectures. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-seterrormode">SetErrorMode</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEM_NOGPFAULTERRORBOX</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system does not display the Windows Error Reporting dialog.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEM_NOOPENFILEERRORBOX</b></dt>
     * <dt>0x8000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system does not display a message box when it fails to find a file. Instead, the error is returned to 
     *         the calling process.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-geterrormode
     * @since windows6.0.6000
     */
    static GetErrorMode() {
        result := DllCall("KERNEL32.dll\GetErrorMode")
        return result
    }

    /**
     * Controls whether the system will handle the specified types of serious errors or whether the process will handle them.
     * @remarks
     * Each process has an associated error mode that indicates to the system how the application is going to respond to serious errors. A child process inherits the error mode of its parent process. To retrieve the process error mode, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-geterrormode">GetErrorMode</a> function.
     * 
     * Because the error mode is set for the entire process, you must ensure that multi-threaded applications do not set different error-mode flags. Doing so can lead to inconsistent error handling.
     * 
     * The system does not make alignment faults visible to an application on all processor architectures. Therefore, specifying SEM_NOALIGNMENTFAULTEXCEPT is not an error on such architectures, but the system is free to silently ignore the request. This means that code sequences such as the following are not always valid on x86 computers:
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>SetErrorMode(SEM_NOALIGNMENTFAULTEXCEPT); 
     * fuOldErrorMode = SetErrorMode(0); 
     * ASSERT(fuOldErrorMode == SEM_NOALIGNMENTFAULTEXCEPT);</pre>
     * </td>
     * </tr>
     * </table></span></div>
     * <b>Itanium:  </b>An application must explicitly call 
     * <b>SetErrorMode</b> with SEM_NOALIGNMENTFAULTEXCEPT to have the system automatically fix alignment faults. The default setting is for the system to make alignment faults visible to an application.
     * 
     * <b>Visual Studio 2005:  </b>When declaring a pointer to a structure that may not have aligned data, you can use the <b>__unaligned</b> keyword to indicate that the type must be read one byte at a time. For more information, see <a href="https://msdn.microsoft.com/library/Aa290049.aspx">Windows Data Alignment</a>.
     * 
     * <b>Windows 7:  </b>Callers should favor <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setthreaderrormode">SetThreadErrorMode</a> over <b>SetErrorMode</b> since it is less disruptive to the normal behavior of the system.
     * @param {Integer} uMode 
     * @returns {Integer} The return value is the previous state of the error-mode bit flags.
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-seterrormode
     * @since windows5.1.2600
     */
    static SetErrorMode(uMode) {
        result := DllCall("KERNEL32.dll\SetErrorMode", "uint", uMode, "uint")
        return result
    }

    /**
     * Registers a vectored exception handler.
     * @remarks
     * If the *First* parameter is nonzero, the handler is the first handler to be called until a subsequent call to **AddVectoredExceptionHandler** is used to specify a different handler as the first handler.
     * 
     * If the *VectoredHandler* parameter points to a function in a DLL and that DLL is unloaded, the handler is still registered. This can lead to application errors.
     * 
     * To unregister the handler, use the [RemoveVectoredExceptionHandler function](nf-errhandlingapi-removevectoredexceptionhandler.md) function.
     * 
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0500 or later. For more information, see [Using the Windows Headers](/windows/desktop/WinProg/using-the-windows-headers).
     * @param {Integer} First The order in which the handler should be called. If the parameter is nonzero, the handler is the first handler to be called. If the parameter is zero, the handler is the last handler to be called.
     * @param {Pointer<PVECTORED_EXCEPTION_HANDLER>} Handler A pointer to the handler to be called. For more information, see [VectoredHandler](/windows/desktop/api/winnt/nc-winnt-pvectored_exception_handler).
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the exception handler.
     * 
     * If the function fails, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-addvectoredexceptionhandler
     * @since windows5.1.2600
     */
    static AddVectoredExceptionHandler(First, Handler) {
        result := DllCall("KERNEL32.dll\AddVectoredExceptionHandler", "uint", First, "ptr", Handler)
        return result
    }

    /**
     * Unregisters a vectored exception handler.
     * @remarks
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0500 or later. For more information, see [Using the Windows Headers](/windows/desktop/WinProg/using-the-windows-headers).
     * @param {Pointer<Void>} Handle A handle to the vectored exception handler previously registered using the [AddVectoredExceptionHandler function](nf-errhandlingapi-addvectoredexceptionhandler.md).
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-removevectoredexceptionhandler
     * @since windows5.1.2600
     */
    static RemoveVectoredExceptionHandler(Handle) {
        result := DllCall("KERNEL32.dll\RemoveVectoredExceptionHandler", "ptr", Handle, "uint")
        return result
    }

    /**
     * Registers a vectored continue handler.
     * @remarks
     * If the *First* parameter is nonzero, the handler is the first handler to be called until a subsequent call to **AddVectoredContinueHandler** is used to specify a different handler as the first handler.
     * 
     * If the *VectoredHandler* parameter points to a function in a DLL and that DLL is unloaded, the handler is still registered. This can lead to application errors.
     * 
     * To unregister the handler, use the [RemoveVectoredContinueHandler function](nf-errhandlingapi-removevectoredcontinuehandler.md).
     * 
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0500 or later. For more information, see [Using the Windows Headers](/windows/desktop/WinProg/using-the-windows-headers).
     * @param {Integer} First The order in which the handler should be called. If the parameter is nonzero, the handler is the first handler to be called. If the parameter is zero, the handler is the last handler to be called.
     * @param {Pointer<PVECTORED_EXCEPTION_HANDLER>} Handler A pointer to the handler to be called. For more information, see [VectoredHandler](/windows/desktop/api/winnt/nc-winnt-pvectored_exception_handler).
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the exception handler.
     * 
     * If the function fails, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-addvectoredcontinuehandler
     * @since windows6.0.6000
     */
    static AddVectoredContinueHandler(First, Handler) {
        result := DllCall("KERNEL32.dll\AddVectoredContinueHandler", "uint", First, "ptr", Handler)
        return result
    }

    /**
     * Unregisters a vectored continue handler.
     * @remarks
     * To compile an application that uses this function, define the _WIN32_WINNT macro as 0x0500 or later. For more information, see [/windows/desktop/WinProg/using-the-windows-headers](Using the Windows Headers).
     * @param {Pointer<Void>} Handle A pointer to a vectored exception handler previously registered using the [AddVectoredContinueHandler function](nf-errhandlingapi-addvectoredcontinuehandler.md).
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-removevectoredcontinuehandler
     * @since windows6.0.6000
     */
    static RemoveVectoredContinueHandler(Handle) {
        result := DllCall("KERNEL32.dll\RemoveVectoredContinueHandler", "ptr", Handle, "uint")
        return result
    }

    /**
     * Raises an exception that bypasses all exception handlers (frame or vector based).
     * @remarks
     * Typically, you call this function if your application is in a bad state and you want to terminate the application  immediately and have a Windows Error Report created.
     * 
     * If the WER service is disabled or cannot be started or there is no debugger attached to the process, the process will be terminated.
     * 
     * This function raises a second chance exception. If JIT debugging is enabled, a debugger will attach to the process.
     * @param {Pointer<EXCEPTION_RECORD>} pExceptionRecord A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_record">EXCEPTION_RECORD</a> structure that contains the exception information. You must specify the <b>ExceptionAddress</b> and <b>ExceptionCode</b> members.
     * 
     * If this parameter is <b>NULL</b>, the function creates an exception record and sets the <b>ExceptionCode</b> member to STATUS_FAIL_FAST_EXCEPTION. The function will also set the <b>ExceptionAddress</b> member if the <i>dwFlags</i> parameter contains the FAIL_FAST_GENERATE_EXCEPTION_ADDRESS flag.
     * @param {Pointer<CONTEXT>} pContextRecord A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure that contains the context information. If <b>NULL</b>, this function generates the context (however, the context will not exactly match the context of the caller).
     * @param {Integer} dwFlags You can specify zero or the following flag that control this function's behavior:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FAIL_FAST_GENERATE_EXCEPTION_ADDRESS"></a><a id="fail_fast_generate_exception_address"></a><dl>
     * <dt><b>FAIL_FAST_GENERATE_EXCEPTION_ADDRESS</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes <b>RaiseFailFastException</b> to set the <b>ExceptionAddress</b> of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_record">EXCEPTION_RECORD</a> to the return address of this function (the next instruction in the caller after the call to <b>RaiseFailFastException</b>). This function will set the exception address only if <b>ExceptionAddress</b> is not <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-raisefailfastexception
     * @since windows6.1
     */
    static RaiseFailFastException(pExceptionRecord, pContextRecord, dwFlags) {
        result := DllCall("KERNEL32.dll\RaiseFailFastException", "ptr", pExceptionRecord, "ptr", pContextRecord, "uint", dwFlags)
        return result
    }

    /**
     * Displays a message box and terminates the application when the message box is closed. (ANSI)
     * @remarks
     * An application calls 
     * <b>FatalAppExit</b> only when it is not capable of terminating any other way. 
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The errhandlingapi.h header defines FatalAppExit as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} uAction This parameter must be zero.
     * @param {Pointer<Byte>} lpMessageText The null-terminated string that is displayed in the message box.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-fatalappexita
     * @since windows5.1.2600
     */
    static FatalAppExitA(uAction, lpMessageText) {
        lpMessageText := lpMessageText is String? StrPtr(lpMessageText) : lpMessageText

        result := DllCall("KERNEL32.dll\FatalAppExitA", "uint", uAction, "ptr", lpMessageText)
        return result
    }

    /**
     * Displays a message box and terminates the application when the message box is closed. (Unicode)
     * @remarks
     * An application calls 
     * <b>FatalAppExit</b> only when it is not capable of terminating any other way. 
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The errhandlingapi.h header defines FatalAppExit as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} uAction This parameter must be zero.
     * @param {Pointer<Char>} lpMessageText The null-terminated string that is displayed in the message box.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-fatalappexitw
     * @since windows5.1.2600
     */
    static FatalAppExitW(uAction, lpMessageText) {
        lpMessageText := lpMessageText is String? StrPtr(lpMessageText) : lpMessageText

        result := DllCall("KERNEL32.dll\FatalAppExitW", "uint", uAction, "ptr", lpMessageText)
        return result
    }

    /**
     * Retrieves the error mode for the calling thread.
     * @remarks
     * A thread inherits the error mode of the process in which it is running. To change the error mode for the thread, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setthreaderrormode">SetThreadErrorMode</a> function.
     * @returns {Integer} The process error mode. This function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEM_FAILCRITICALERRORS</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system does not display the critical-error-handler message box. Instead, the system sends the error to the calling thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEM_NOGPFAULTERRORBOX</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system does not display the Windows Error Reporting dialog.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEM_NOOPENFILEERRORBOX</b></dt>
     * <dt>0x8000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system does not display a message box when it fails to find a file. Instead, the error is returned to the calling thread.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getthreaderrormode
     * @since windows6.1
     */
    static GetThreadErrorMode() {
        result := DllCall("KERNEL32.dll\GetThreadErrorMode", "uint")
        return result
    }

    /**
     * Controls whether the system will handle the specified types of serious errors or whether the calling thread will handle them.
     * @remarks
     * Each process has an associated error mode that indicates to the system how the application is going to respond to serious errors. A thread inherits the error mode of the process in which it is running. To retrieve the process error mode, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-geterrormode">GetErrorMode</a> function. To retrieve the error mode of the calling thread, use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getthreaderrormode">GetThreadErrorMode</a> function.
     * @param {Integer} dwNewMode 
     * @param {Pointer<UInt32>} lpOldMode If the function succeeds, this parameter is set to the thread's previous error mode. This parameter can be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-setthreaderrormode
     * @since windows6.1
     */
    static SetThreadErrorMode(dwNewMode, lpOldMode) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetThreadErrorMode", "uint", dwNewMode, "uint*", lpOldMode, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer} FailedAllocationSize 
     * @returns {Pointer} 
     */
    static TerminateProcessOnMemoryExhaustion(FailedAllocationSize) {
        result := DllCall("api-ms-win-core-errorhandling-l1-1-3.dll\TerminateProcessOnMemoryExhaustion", "ptr", FailedAllocationSize)
        return result
    }

    /**
     * Creates a new WCT session.
     * @remarks
     * When you have finished using the session, call the <a href="https://docs.microsoft.com/windows/desktop/api/wct/nf-wct-closethreadwaitchainsession">CloseThreadWaitChainSession</a> function.
     * @param {Integer} Flags 
     * @param {Pointer<PWAITCHAINCALLBACK>} callback If the session is asynchronous, this parameter can be a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wct/nc-wct-pwaitchaincallback">WaitChainCallback</a> callback function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the newly created session.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wct/nf-wct-openthreadwaitchainsession
     * @since windows6.0.6000
     */
    static OpenThreadWaitChainSession(Flags, callback) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenThreadWaitChainSession", "uint", Flags, "ptr", callback)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes the specified WCT session and cancels any outstanding asynchronous operations.
     * @remarks
     * If the WCT session was opened in asynchronous mode (with WCT_ASYNC_OPEN_FLAG), the function cancels any outstanding operations after their callback functions have been called and returned, and then it returns.
     * @param {Pointer<Void>} WctHandle A handle to the WCT session created by the <a href="https://docs.microsoft.com/windows/desktop/api/wct/nf-wct-openthreadwaitchainsession">OpenThreadWaitChainSession</a> function.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/wct/nf-wct-closethreadwaitchainsession
     * @since windows6.0.6000
     */
    static CloseThreadWaitChainSession(WctHandle) {
        result := DllCall("ADVAPI32.dll\CloseThreadWaitChainSession", "ptr", WctHandle)
        return result
    }

    /**
     * Retrieves the wait chain for the specified thread.
     * @remarks
     * If the session is asynchronous, the function returns <b>FALSE</b> and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_IO_PENDING. To obtain the results, see the <a href="https://docs.microsoft.com/windows/desktop/api/wct/nc-wct-pwaitchaincallback">WaitChainCallback</a> callback function.
     * 
     * If the specified thread is not blocked or is blocked on an unsupported synchronization element, the function returns a single item in <i>NodeInfoArray</i>.
     * 
     * The caller must have the SE_DEBUG_NAME privilege. If the caller has insufficient privileges, the function fails if the first thread cannot be accessed. Otherwise, the last node in the array will have its <b>ObjectStatus</b> member set to WctStatusNoAcces.
     * 
     * If any subset of nodes in the array forms a cycle, the function sets the <i>IsCycle</i> parameter to <b>TRUE</b>.
     * 
     * Wait chain information is dynamic; it was correct when the function was called but may be out-of-date by the time it is reviewed by the caller.
     * @param {Pointer<Void>} WctHandle A handle to the WCT session created by the <a href="https://docs.microsoft.com/windows/desktop/api/wct/nf-wct-openthreadwaitchainsession">OpenThreadWaitChainSession</a> function.
     * @param {Pointer} Context A pointer to an application-defined context structure to be passed to the callback function for an asynchronous session.
     * @param {Integer} Flags 
     * @param {Integer} ThreadId The identifier of the thread.
     * @param {Pointer<UInt32>} NodeCount On input, a number from 1 to WCT_MAX_NODE_COUNT that specifies the number of nodes in the wait chain. On return, the number of nodes retrieved. If the array cannot contain all the nodes of the wait chain, the function fails, <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_MORE_DATA, and this parameter receives the number of array elements required to contain all the nodes.
     * 
     * For asynchronous sessions, check the value that is passed to the callback function. Do not free the variable until the callback function has returned.
     * @param {Pointer<WAITCHAIN_NODE_INFO>} NodeInfoArray An array of <a href="https://docs.microsoft.com/windows/desktop/api/wct/ns-wct-waitchain_node_info">WAITCHAIN_NODE_INFO</a> structures that receives the wait chain.
     * 
     * For asynchronous sessions, check the value that is passed to the callback function. Do not free the array until the callback function has returned.
     * @param {Pointer<Int32>} IsCycle If the function detects a deadlock, this variable is set to <b>TRUE</b>; otherwise, it is set to <b>FALSE</b>.
     * 
     * For asynchronous sessions, check the value that is passed to the callback function. Do not free the variable until the callback function has returned.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller did not have sufficient privilege to open a target thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the input parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The WCT session was opened in asynchronous mode. The results will be returned through the <a href="https://docs.microsoft.com/windows/desktop/api/wct/nc-wct-pwaitchaincallback">WaitChainCallback</a> callback function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NodeInfoArray</i> buffer is not large enough to contain all the nodes in the wait chain. The <i>NodeCount</i> parameter contains the number of nodes in the chain. The wait chain returned is still valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operating system is not providing this service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified thread could not be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TOO_MANY_THREADS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of nodes exceeds WCT_MAX_NODE_COUNT. The wait chain returned is still valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wct/nf-wct-getthreadwaitchain
     * @since windows6.0.6000
     */
    static GetThreadWaitChain(WctHandle, Context, Flags, ThreadId, NodeCount, NodeInfoArray, IsCycle) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetThreadWaitChain", "ptr", WctHandle, "ptr", Context, "uint", Flags, "uint", ThreadId, "uint*", NodeCount, "ptr", NodeInfoArray, "int*", IsCycle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Register COM callback functions for WCT.
     * @remarks
     * If a thread is blocked on a COM call, WCT can retrieve COM ownership information using these callback functions. If this function is callback multiple times, only the last addresses retrieved are used.
     * @param {Pointer<PCOGETCALLSTATE>} CallStateCallback The address of the <b>CoGetCallState</b> function.
     * @param {Pointer<PCOGETACTIVATIONSTATE>} ActivationStateCallback The address of the <b>CoGetActivationState</b> function.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/wct/nf-wct-registerwaitchaincomcallback
     * @since windows6.0.6000
     */
    static RegisterWaitChainCOMCallback(CallStateCallback, ActivationStateCallback) {
        result := DllCall("ADVAPI32.dll\RegisterWaitChainCOMCallback", "ptr", CallStateCallback, "ptr", ActivationStateCallback)
        return result
    }

    /**
     * Writes user-mode minidump information to the specified file.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/nc-minidumpapiset-minidump_callback_routine">MiniDumpCallback</a> function receives extended 
     *     minidump information from <b>MiniDumpWriteDump</b>. It also 
     *     provides a way for the caller to determine the granularity of information written to the minidump file, as the 
     *     callback function can filter the default information.
     * 
     * <b>MiniDumpWriteDump</b> should be called from a 
     *     separate process if at all possible, rather than from within the target process being dumped.  This is especially 
     *     true when the target process is already not stable.  For example, if it just crashed.  A loader deadlock is one of 
     *     many potential side effects of calling 
     *     <b>MiniDumpWriteDump</b> from within the target 
     *     process.
     * 
     * <b>MiniDumpWriteDump</b> may not produce a valid  stack 
     *     trace for the calling thread. To work around this problem, you must capture the state of the calling thread before 
     *     calling <b>MiniDumpWriteDump</b> and use it as the 
     *     <i>ExceptionParam</i> parameter. One way to do this is to force  an exception inside a 
     *     <b>__try</b>/<b>__except</b> block and use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_pointers">EXCEPTION_POINTERS</a> information provided by 
     *     <a href="https://docs.microsoft.com/windows/desktop/Debug/getexceptioninformation">GetExceptionInformation</a>. Alternatively, you 
     *     can call the function from a new worker thread and filter this worker thread from the dump.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to 
     *     this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize 
     *     all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hProcess A handle to the process for which the information is to be generated.
     * 
     * This handle must have <b>PROCESS_QUERY_INFORMATION</b> and 
     *        <b>PROCESS_VM_READ</b> access to the process. If handle information is to be collected then 
     *        <b>PROCESS_DUP_HANDLE</b> access is also required. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>. 
     *        The caller must also be able to get <b>THREAD_ALL_ACCESS</b> access to the threads in the 
     *        process. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Integer} ProcessId The identifier of the process for which the information is to be generated.
     * @param {Pointer<Void>} hFile A handle to the file in which the information is to be written.
     * @param {Integer} DumpType The type of information to be generated. This parameter can be one or more of the values from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-minidump_type">MINIDUMP_TYPE</a> enumeration.
     * @param {Pointer<MINIDUMP_EXCEPTION_INFORMATION>} ExceptionParam A pointer to a 
     *       <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception_information">MINIDUMP_EXCEPTION_INFORMATION</a> 
     *       structure describing the client exception that caused the minidump to be generated. If the value of this 
     *       parameter is <b>NULL</b>, no exception information is included in the minidump file.
     * @param {Pointer<MINIDUMP_USER_STREAM_INFORMATION>} UserStreamParam A pointer to a 
     *       <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_user_stream_information">MINIDUMP_USER_STREAM_INFORMATION</a> 
     *       structure. If the value of this parameter is <b>NULL</b>, no user-defined information is 
     *       included in the minidump file.
     * @param {Pointer<MINIDUMP_CALLBACK_INFORMATION>} CallbackParam A pointer to a 
     *       <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_callback_information">MINIDUMP_CALLBACK_INFORMATION</a> 
     *       structure that specifies a callback routine which is to receive extended minidump information. If the value of 
     *       this parameter is <b>NULL</b>, no callbacks are performed.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>; otherwise, the return value is 
     *        <b>FALSE</b>. To retrieve extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Note that the last error will be an 
     *        <b>HRESULT</b> value.
     * 
     * If the operation is canceled, the last error code is 
     *        <c>HRESULT_FROM_WIN32(ERROR_CANCELLED)</c>.
     * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/nf-minidumpapiset-minidumpwritedump
     */
    static MiniDumpWriteDump(hProcess, ProcessId, hFile, DumpType, ExceptionParam, UserStreamParam, CallbackParam) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\MiniDumpWriteDump", "ptr", hProcess, "uint", ProcessId, "ptr", hFile, "int", DumpType, "ptr", ExceptionParam, "ptr", UserStreamParam, "ptr", CallbackParam, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads a stream from a user-mode minidump file.
     * @remarks
     * In this context, a data stream is a block of data written to a minidump file.
     * @param {Pointer<Void>} BaseOfDump A pointer to the base of the mapped minidump file. The file should have been mapped into memory using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> function.
     * @param {Integer} StreamNumber The type of data to be read from the minidump file. This member can be one of the values in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-minidump_stream_type">MINIDUMP_STREAM_TYPE</a> enumeration.
     * @param {Pointer<MINIDUMP_DIRECTORY>} Dir A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_directory">MINIDUMP_DIRECTORY</a> 
     *       structure.
     * @param {Pointer<Void>} StreamPointer A pointer to the beginning of the minidump stream. The format of this stream depends on the value of 
     *       <i>StreamNumber</i>. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-minidump_stream_type">MINIDUMP_STREAM_TYPE</a>.
     * @param {Pointer<UInt32>} StreamSize The size of the stream pointed to by <i>StreamPointer</i>, in bytes.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>; otherwise, the return 
     *        value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/nf-minidumpapiset-minidumpreaddumpstream
     */
    static MiniDumpReadDumpStream(BaseOfDump, StreamNumber, Dir, StreamPointer, StreamSize) {
        result := DllCall("dbghelp.dll\MiniDumpReadDumpStream", "ptr", BaseOfDump, "uint", StreamNumber, "ptr", Dir, "ptr", StreamPointer, "uint*", StreamSize, "int")
        return result
    }

    /**
     * Computes the virtual address of each imported function.
     * @remarks
     * A call to 
     * <b>BindImage</b> is equivalent to the following call: <c>BindImageEx( 0, ImageName, DllPath, SymbolPath, NULL );</c>
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Byte>} ImageName The name of the file to be bound. This value can be a file name, a partial path, or a full path.
     * @param {Pointer<Byte>} DllPath The root of the search path to use if the file specified by the <i>ImageName</i> parameter cannot be opened.
     * @param {Pointer<Byte>} SymbolPath The root of the path to search for the file's corresponding symbol file.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-bindimage
     * @since windows5.1.2600
     */
    static BindImage(ImageName, DllPath, SymbolPath) {
        ImageName := ImageName is String? StrPtr(ImageName) : ImageName
        DllPath := DllPath is String? StrPtr(DllPath) : DllPath
        SymbolPath := SymbolPath is String? StrPtr(SymbolPath) : SymbolPath

        A_LastError := 0

        result := DllCall("imagehlp.dll\BindImage", "ptr", ImageName, "ptr", DllPath, "ptr", SymbolPath, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Computes the virtual address of each function that is imported.
     * @remarks
     * The process of binding an image consists of computing the virtual address of each imported function. The computed virtual address is then saved in the importing image's Import Address Table (IAT). As a result, the image is loaded much faster, particularly if it uses many DLLs, because the system loader does not have to compute the address of each imported function.
     * 
     * If a corresponding symbol file can be located, its time stamp and checksum are updated.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Integer} Flags 
     * @param {Pointer<Byte>} ImageName The name of the file to be bound. This value can be a file name, a partial path, or a full path.
     * @param {Pointer<Byte>} DllPath The root of the search path to use if the file specified by the <i>ImageName</i> parameter cannot be opened.
     * @param {Pointer<Byte>} SymbolPath The root of the path to search for the file's corresponding symbol file.
     * @param {Pointer<PIMAGEHLP_STATUS_ROUTINE>} StatusRoutine A pointer to a status routine. The status routine is called during the progress of the image binding. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nc-imagehlp-pimagehlp_status_routine">StatusRoutine</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-bindimageex
     * @since windows5.1.2600
     */
    static BindImageEx(Flags, ImageName, DllPath, SymbolPath, StatusRoutine) {
        ImageName := ImageName is String? StrPtr(ImageName) : ImageName
        DllPath := DllPath is String? StrPtr(DllPath) : DllPath
        SymbolPath := SymbolPath is String? StrPtr(SymbolPath) : SymbolPath

        A_LastError := 0

        result := DllCall("imagehlp.dll\BindImageEx", "uint", Flags, "ptr", ImageName, "ptr", DllPath, "ptr", SymbolPath, "ptr", StatusRoutine, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the load address for the specified image, which reduces the required load time for a DLL. (ReBaseImage)
     * @remarks
     * The 
     * <b>ReBaseImage</b> function changes the desired load address for the specified image. This operation involves reading the entire image and updating all fixups, debugging information, and checksum. You can rebase an image to reduce the required load time for its DLLs. If an application can rely on a DLL being loaded at the desired load address, then the system loader does not have to relocate the image. The image is simply loaded into the application's virtual address space and the 
     * <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> function is called, if one is present.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * You cannot rebase DLLs that link with /DYNAMICBASE or that reside in protected directories, such as the System32 folder.
     * 
     * As an alternative to using this function, see the <a href="https://docs.microsoft.com/cpp/build/reference/base-base-address">/BASE</a> linker option.
     * @param {Pointer<Byte>} CurrentImageName The name of the file to be rebased. You must specify the full path to the file unless the module is in the current working directory of the calling process.
     * @param {Pointer<Byte>} SymbolPath The path used to find the corresponding symbol file. Specify this path for executable images that have symbolic information because when image addresses change, the corresponding symbol database file (PDB) may also need to be changed.    Note that even if the symbol path is not valid, the function will succeed if it is able to rebases your image.
     * @param {Integer} fReBase If this value is <b>TRUE</b>, the image is rebased. Otherwise, the image is not rebased.
     * @param {Integer} fRebaseSysfileOk If this value is <b>TRUE</b>, the system image is rebased. Otherwise, the system image is not rebased.
     * @param {Integer} fGoingDown If this value is <b>TRUE</b>, the image can be rebased below the given base; otherwise, it cannot.
     * @param {Integer} CheckImageSize The maximum size that the image can grow to, in bytes, or zero if there is no limit.
     * @param {Pointer<UInt32>} OldImageSize A pointer to a variable that receives the original image size, in bytes.
     * @param {Pointer<UIntPtr>} OldImageBase A pointer to a variable that receives the original image base.
     * @param {Pointer<UInt32>} NewImageSize A pointer to a variable that receives the new image size after the rebase operation, in bytes.
     * @param {Pointer<UIntPtr>} NewImageBase The base address to use for rebasing the image. If the address is not available and the <i>fGoingDown</i> parameter is set to <b>TRUE</b>, the function finds a new base address and sets this parameter to the new base address. If <i>fGoingDown</i> is <b>FALSE</b>, the function finds a new base address but does not set this parameter to the new base address.
     * @param {Integer} TimeStamp The new time date stamp for the image file header. The value must be represented in the number of seconds elapsed since midnight (00:00:00), January 1, 1970, Universal Coordinated Time, according to the system clock.
     * 
     * If this parameter is 0, the current file header time date stamp is incremented by 1 second.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-rebaseimage
     * @since windows5.1.2600
     */
    static ReBaseImage(CurrentImageName, SymbolPath, fReBase, fRebaseSysfileOk, fGoingDown, CheckImageSize, OldImageSize, OldImageBase, NewImageSize, NewImageBase, TimeStamp) {
        CurrentImageName := CurrentImageName is String? StrPtr(CurrentImageName) : CurrentImageName
        SymbolPath := SymbolPath is String? StrPtr(SymbolPath) : SymbolPath

        A_LastError := 0

        result := DllCall("imagehlp.dll\ReBaseImage", "ptr", CurrentImageName, "ptr", SymbolPath, "int", fReBase, "int", fRebaseSysfileOk, "int", fGoingDown, "uint", CheckImageSize, "uint*", OldImageSize, "ptr*", OldImageBase, "uint*", NewImageSize, "ptr*", NewImageBase, "uint", TimeStamp, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the load address for the specified image, which reduces the required load time for a DLL. (ReBaseImage64)
     * @remarks
     * The 
     * <b>ReBaseImage64</b> function changes the desired load address for the specified image. This operation involves reading the entire image and updating all fixups, debugging information, and checksum. You can rebase an image to reduce the required load time for its DLLs. If an application can rely on a DLL being loaded at the desired load address, then the system loader does not have to relocate the image. The image is simply loaded into the application's virtual address space and the 
     * <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> function is called, if one is present.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * You cannot rebase DLLs that link with /DYNAMICBASE or that reside in protected directories, such as the System32 folder.
     * 
     * As an alternative to using this function, see the <a href="https://docs.microsoft.com/cpp/build/reference/base-base-address">/BASE</a> linker option.
     * @param {Pointer<Byte>} CurrentImageName The name of the file to be rebased. You must specify the full path to the file unless the module is in the current working directory of the calling process.
     * @param {Pointer<Byte>} SymbolPath The path used to find the corresponding symbol file. Specify this path for executable images that have symbolic information because when image addresses change, the corresponding symbol database file (PDB) may also need to be changed.    Note that even if the symbol path is not valid, the function will succeed if it is able to rebases your image.
     * @param {Integer} fReBase If this value is <b>TRUE</b>, the image is rebased. Otherwise, the image is not rebased.
     * @param {Integer} fRebaseSysfileOk If this value is <b>TRUE</b>, the system image is rebased. Otherwise, the system image is not rebased.
     * @param {Integer} fGoingDown If this value is <b>TRUE</b>, the image can be rebased below the given base; otherwise, it cannot.
     * @param {Integer} CheckImageSize The maximum size that the image can grow to, in bytes, or zero if there is no limit.
     * @param {Pointer<UInt32>} OldImageSize A pointer to a variable that receives the original image size, in bytes.
     * @param {Pointer<UInt64>} OldImageBase A pointer to a variable that receives the original image base.
     * @param {Pointer<UInt32>} NewImageSize A pointer to a variable that receives the new image size after the rebase operation, in bytes.
     * @param {Pointer<UInt64>} NewImageBase The base address to use for rebasing the image. If the address is not available and the <i>fGoingDown</i> parameter is set to <b>TRUE</b>, the function finds a new base address and sets this parameter to the new base address. If <i>fGoingDown</i> is <b>FALSE</b>, the function finds a new base address but does not set this parameter to the new base address.
     * @param {Integer} TimeStamp The new time date stamp for the image file header. The value must be represented in the number of seconds elapsed since midnight (00:00:00), January 1, 1970, Universal Coordinated Time, according to the system clock.
     * 
     * If this parameter is 0, the current file header time date stamp is incremented by 1 second.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-rebaseimage64
     * @since windows5.1.2600
     */
    static ReBaseImage64(CurrentImageName, SymbolPath, fReBase, fRebaseSysfileOk, fGoingDown, CheckImageSize, OldImageSize, OldImageBase, NewImageSize, NewImageBase, TimeStamp) {
        CurrentImageName := CurrentImageName is String? StrPtr(CurrentImageName) : CurrentImageName
        SymbolPath := SymbolPath is String? StrPtr(SymbolPath) : SymbolPath

        A_LastError := 0

        result := DllCall("imagehlp.dll\ReBaseImage64", "ptr", CurrentImageName, "ptr", SymbolPath, "int", fReBase, "int", fRebaseSysfileOk, "int", fGoingDown, "uint", CheckImageSize, "uint*", OldImageSize, "uint*", OldImageBase, "uint*", NewImageSize, "uint*", NewImageBase, "uint", TimeStamp, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Computes the checksum of the specified file. (ANSI)
     * @remarks
     * The 
     * <b>MapFileAndCheckSum</b> function computes a new checksum for the file and returns it in the <i>CheckSum</i> parameter. This function is used by any application that creates or modifies an executable image. Checksums are required for kernel-mode drivers and some system DLLs. The linker computes the original checksum at link time, if you use the appropriate linker switch. For more details, see your linker documentation.
     * 
     * It is recommended that all images have valid checksums. It is the caller's responsibility to place the newly computed checksum into the mapped image and update the on-disk image of the file.
     * 
     * Passing a <i>Filename</i> parameter that does not point to a valid executable image will produce unpredictable results.  Any user of this function is encouraged to make sure that a valid executable image is being passed.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * <div class="alert"><b>Note</b>  The Unicode implementation of this function calls the ASCII implementation and as a result, the function can fail if the codepage does not support the characters in the path. For example, if you pass a non-English Unicode file path, and the default codepage is English, the unrecognized non-English wide chars are converted to "??" and the file cannot be opened (the function returns CHECKSUM_OPEN_FAILURE).</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The imagehlp.h header defines MapFileAndCheckSum as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} Filename The file name of the file for which the checksum is to be computed.
     * @param {Pointer<UInt32>} HeaderSum A pointer to a variable that receives the original checksum from the image file, or zero if there is an error.
     * @param {Pointer<UInt32>} CheckSum A pointer to a variable that receives the computed checksum.
     * @returns {Integer} If the function succeeds, the return value is CHECKSUM_SUCCESS (0).
     * 
     * If the function fails, the return value is one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CHECKSUM_MAP_FAILURE</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not map the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CHECKSUM_MAPVIEW_FAILURE</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not map a view of the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CHECKSUM_OPEN_FAILURE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not open the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CHECKSUM_UNICODE_FAILURE</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not convert the file name to Unicode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-mapfileandchecksuma
     * @since windows5.1.2600
     */
    static MapFileAndCheckSumA(Filename, HeaderSum, CheckSum) {
        Filename := Filename is String? StrPtr(Filename) : Filename

        result := DllCall("imagehlp.dll\MapFileAndCheckSumA", "ptr", Filename, "uint*", HeaderSum, "uint*", CheckSum, "uint")
        return result
    }

    /**
     * Computes the checksum of the specified file. (Unicode)
     * @remarks
     * The 
     * <b>MapFileAndCheckSum</b> function computes a new checksum for the file and returns it in the <i>CheckSum</i> parameter. This function is used by any application that creates or modifies an executable image. Checksums are required for kernel-mode drivers and some system DLLs. The linker computes the original checksum at link time, if you use the appropriate linker switch. For more details, see your linker documentation.
     * 
     * It is recommended that all images have valid checksums. It is the caller's responsibility to place the newly computed checksum into the mapped image and update the on-disk image of the file.
     * 
     * Passing a <i>Filename</i> parameter that does not point to a valid executable image will produce unpredictable results.  Any user of this function is encouraged to make sure that a valid executable image is being passed.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * <div class="alert"><b>Note</b>  The Unicode implementation of this function calls the ASCII implementation and as a result, the function can fail if the codepage does not support the characters in the path. For example, if you pass a non-English Unicode file path, and the default codepage is English, the unrecognized non-English wide chars are converted to "??" and the file cannot be opened (the function returns CHECKSUM_OPEN_FAILURE).</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The imagehlp.h header defines MapFileAndCheckSum as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} Filename The file name of the file for which the checksum is to be computed.
     * @param {Pointer<UInt32>} HeaderSum A pointer to a variable that receives the original checksum from the image file, or zero if there is an error.
     * @param {Pointer<UInt32>} CheckSum A pointer to a variable that receives the computed checksum.
     * @returns {Integer} If the function succeeds, the return value is CHECKSUM_SUCCESS (0).
     * 
     * If the function fails, the return value is one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CHECKSUM_MAP_FAILURE</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not map the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CHECKSUM_MAPVIEW_FAILURE</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not map a view of the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CHECKSUM_OPEN_FAILURE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not open the file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CHECKSUM_UNICODE_FAILURE</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not convert the file name to Unicode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-mapfileandchecksumw
     * @since windows5.1.2600
     */
    static MapFileAndCheckSumW(Filename, HeaderSum, CheckSum) {
        Filename := Filename is String? StrPtr(Filename) : Filename

        result := DllCall("imagehlp.dll\MapFileAndCheckSumW", "ptr", Filename, "uint*", HeaderSum, "uint*", CheckSum, "uint")
        return result
    }

    /**
     * Retrieves the offset and size of the part of the PE header that is currently unused.
     * @remarks
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<LOADED_IMAGE>} LoadedImage A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-loaded_image">LOADED_IMAGE</a> structure that is returned from a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-mapandload">MapAndLoad</a> or <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-imageload">ImageLoad</a>.
     * @param {Pointer<UInt32>} SizeUnusedHeaderBytes A pointer to a variable to receive the size, in bytes, of the part of the image's header which is unused.
     * @returns {Integer} If the function succeeds, the return value is the offset from the base address of the first unused header byte.
     * 
     * If the function fails, the return value is zero. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-getimageunusedheaderbytes
     * @since windows5.1.2600
     */
    static GetImageUnusedHeaderBytes(LoadedImage, SizeUnusedHeaderBytes) {
        A_LastError := 0

        result := DllCall("imagehlp.dll\GetImageUnusedHeaderBytes", "ptr", LoadedImage, "uint*", SizeUnusedHeaderBytes, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the requested data from the specified image file.
     * @remarks
     * The 
     * <b>ImageGetDigestStream</b> function returns the data to be digested from a specified image file, subject to the passed <i>DigestLevel</i> parameter. The order of the bytes will be consistent for different calls, which is required to ensure that the same message digest is always produced from the retrieved byte stream.
     * 
     * To ensure cross-platform compatibility, all implementations of this function must behave in a consistent manner with respect to the order in which the various parts of the image file are returned.
     * 
     * Data should be returned in the following order:
     * 
     * <ol>
     * <li>Image (executable and static data) information.</li>
     * <li>Resource data.</li>
     * <li>Debugging information.</li>
     * </ol>
     * If any of these are not specified, the remaining parts must be returned in the same order.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} FileHandle A handle to the image file. This handle must be opened for FILE_READ_DATA access.
     * @param {Integer} DigestLevel 
     * @param {Pointer<DIGEST_FUNCTION>} DigestFunction A pointer to a callback routine to process the data. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nc-imagehlp-digest_function">DigestFunction</a>.
     * @param {Pointer<Void>} DigestHandle A user-supplied handle to the digest. This parameter is passed to <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nc-imagehlp-digest_function">DigestFunction</a> as the first argument.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-imagegetdigeststream
     * @since windows5.1.2600
     */
    static ImageGetDigestStream(FileHandle, DigestLevel, DigestFunction, DigestHandle) {
        A_LastError := 0

        result := DllCall("imagehlp.dll\ImageGetDigestStream", "ptr", FileHandle, "uint", DigestLevel, "ptr", DigestFunction, "ptr", DigestHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a certificate to the specified file.
     * @remarks
     * The certificate is added at the end of the existing list of certificates and is assigned an index.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} FileHandle A handle to the image file to be modified. This handle must be opened for FILE_READ_DATA and FILE_WRITE_DATA access.
     * @param {Pointer<WIN_CERTIFICATE>} Certificate A pointer to a <b>WIN_CERTIFICATE</b> header and all associated sections. The <b>Length</b> member in the certificate header will be used to determine the length of this buffer.
     * @param {Pointer<UInt32>} Index A pointer to a variable that receives the index of the newly added certificate.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-imageaddcertificate
     * @since windows5.1.2600
     */
    static ImageAddCertificate(FileHandle, Certificate, Index) {
        A_LastError := 0

        result := DllCall("imagehlp.dll\ImageAddCertificate", "ptr", FileHandle, "ptr", Certificate, "uint*", Index, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes the specified certificate from the given file.
     * @remarks
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} FileHandle A handle to the image file to be modified. This handle must be opened for FILE_READ_DATA and FILE_WRITE_DATA access.
     * @param {Integer} Index The index of the certificate to be removed.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-imageremovecertificate
     * @since windows5.1.2600
     */
    static ImageRemoveCertificate(FileHandle, Index) {
        A_LastError := 0

        result := DllCall("imagehlp.dll\ImageRemoveCertificate", "ptr", FileHandle, "uint", Index, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the certificates currently contained in an image file.
     * @remarks
     * The 
     * <b>ImageEnumerateCertificates</b> function returns information about the certificates currently contained in an image file. It has filtering capabilities which allow certificates containing sections of any single type (or of any type) to be returned.
     * 
     * After the indices of interesting certificates are discovered, they can be passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-imagegetcertificatedata">ImageGetCertificateData</a> function to obtain the actual bodies of the certificates.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} FileHandle A handle to the image file to be examined. This handle must be opened for FILE_READ_DATA access.
     * @param {Integer} TypeFilter The certificate section type to be used as a filter when returning certificate information. CERT_SECTION_TYPE_ANY should be passed for information on all section types present in the image.
     * @param {Pointer<UInt32>} CertificateCount A pointer to a variable that receives the number of certificates in the image containing sections of the type specified by the <i>TypeFilter</i> parameter. If none are found, this parameter is zero.
     * @param {Pointer<UInt32>} Indices Optionally provides a buffer to use to return an array of indices to the certificates containing sections of the specified type. No ordering should be assumed for the index values, nor are they guaranteed to be contiguous when CERT_SECTION_TYPE_ANY is queried.
     * @param {Integer} IndexCount The size of the <i>Indices</i> buffer, in <b>DWORDs</b>. This parameter will be examined whenever <i>Indices</i> is present. If <i>CertificateCount</i> is greater than <i>IndexCount</i>, <i>Indices</i> will be filled in with the first <i>IndexCount</i> sections found in the image; any others will not be returned.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-imageenumeratecertificates
     * @since windows5.1.2600
     */
    static ImageEnumerateCertificates(FileHandle, TypeFilter, CertificateCount, Indices, IndexCount) {
        A_LastError := 0

        result := DllCall("imagehlp.dll\ImageEnumerateCertificates", "ptr", FileHandle, "ushort", TypeFilter, "uint*", CertificateCount, "uint*", Indices, "uint", IndexCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a complete certificate from a file.
     * @remarks
     * The    <b>WIN_CERTIFICATE</b> structure is defined as follows: 
     * 
     * 
     * ```cpp
     * typedef struct _WIN_CERTIFICATE {
     *     DWORD       dwLength;
     *     WORD        wRevision;
     *     WORD        wCertificateType;   // WIN_CERT_TYPE_xxx
     *     BYTE        bCertificate[ANYSIZE_ARRAY];
     * } WIN_CERTIFICATE, *LPWIN_CERTIFICATE;
     * ```
     * 
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} FileHandle A handle to the image file. This handle must be opened for <b>FILE_READ_DATA</b> access.
     * @param {Integer} CertificateIndex The index of the certificate to be returned.
     * @param {Pointer<WIN_CERTIFICATE>} Certificate A pointer to a <b>WIN_CERTIFICATE</b> structure that receives the certificate data. If the buffer is not large enough to contain the structure, the function fails and the last error code is set to <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @param {Pointer<UInt32>} RequiredLength On input, this parameter specifies the length of the <i>Certificate</i> buffer in bytes. On success, it receives the length of the certificate.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-imagegetcertificatedata
     * @since windows5.1.2600
     */
    static ImageGetCertificateData(FileHandle, CertificateIndex, Certificate, RequiredLength) {
        A_LastError := 0

        result := DllCall("imagehlp.dll\ImageGetCertificateData", "ptr", FileHandle, "uint", CertificateIndex, "ptr", Certificate, "uint*", RequiredLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the header of the specified certificate, up to, but not including, the section offset array.
     * @remarks
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} FileHandle A handle to the image file. This handle must be opened for FILE_READ_DATA access.
     * @param {Integer} CertificateIndex The index of the certificate whose header is to be returned.
     * @param {Pointer<WIN_CERTIFICATE>} Certificateheader A pointer to the <b>WIN_CERTIFICATE</b> structure that receives the certificate header.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-imagegetcertificateheader
     * @since windows5.1.2600
     */
    static ImageGetCertificateHeader(FileHandle, CertificateIndex, Certificateheader) {
        A_LastError := 0

        result := DllCall("imagehlp.dll\ImageGetCertificateHeader", "ptr", FileHandle, "uint", CertificateIndex, "ptr", Certificateheader, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maintains a list of loaded DLLs.
     * @remarks
     * The 
     * <b>ImageLoad</b> function is used to maintain a list of loaded DLLs. If the image has already been loaded, the prior 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-loaded_image">LOADED_IMAGE</a> is returned. Otherwise, the new image is added to the list.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-loaded_image">LOADED_IMAGE</a> structure must be deallocated by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-imageunload">ImageUnload</a> function.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Byte>} DllName The name of the image.
     * @param {Pointer<Byte>} DllPath The path used to locate the image if the name provided cannot be found. If <b>NULL</b> is used, then the search path rules set forth in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processenv/nf-processenv-searchpathw">SearchPath</a> function apply.
     * @returns {Pointer<LOADED_IMAGE>} If the function succeeds, the return value is a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-loaded_image">LOADED_IMAGE</a> structure.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-imageload
     * @since windows5.1.2600
     */
    static ImageLoad(DllName, DllPath) {
        DllName := DllName is String? StrPtr(DllName) : DllName
        DllPath := DllPath is String? StrPtr(DllPath) : DllPath

        A_LastError := 0

        result := DllCall("imagehlp.dll\ImageLoad", "ptr", DllName, "ptr", DllPath, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deallocates resources from a previous call to the ImageLoad function.
     * @remarks
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<LOADED_IMAGE>} LoadedImage A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-loaded_image">LOADED_IMAGE</a> structure that is returned from a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-imageload">ImageLoad</a> function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-imageload">ImageLoad</a> and 
     * <b>ImageUnload</b> share internal data that can be corrupted if multiple consecutive calls to 
     * <b>ImageLoad</b> are performed. Therefore, make sure that you have called 
     * <b>ImageLoad</b> only once before calling 
     * <b>ImageUnload</b>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-imageunload
     * @since windows5.1.2600
     */
    static ImageUnload(LoadedImage) {
        A_LastError := 0

        result := DllCall("imagehlp.dll\ImageUnload", "ptr", LoadedImage, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Maps an image and preloads data from the mapped file.
     * @remarks
     * The 
     * <b>MapAndLoad</b> function maps an image and preloads data from the mapped file. The corresponding function, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-unmapandload">UnMapAndLoad</a>, must be used to deallocate all resources that are allocated by the 
     * <b>MapAndLoad</b> function.
     * 			
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Byte>} ImageName The file name of the image (executable file or DLL) that is loaded.
     * @param {Pointer<Byte>} DllPath The path used to locate the image if the name provided cannot be found. If this parameter is <b>NULL</b>, then the search path rules set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processenv/nf-processenv-searchpathw">SearchPath</a> function apply.
     * @param {Pointer<LOADED_IMAGE>} LoadedImage A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-loaded_image">LOADED_IMAGE</a> structure that receives information about the image after it is loaded.
     * @param {Integer} DotDll The default extension to be used if the image name does not contain a file name extension. If the value is <b>TRUE</b>, a .DLL extension is used. If the value is <b>FALSE</b>, then an .EXE extension is used.
     * @param {Integer} ReadOnly The access mode. If this value is <b>TRUE</b>, the file is mapped for read-access only. If the value is <b>FALSE</b>, the file is mapped for read and write access.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-mapandload
     * @since windows5.1.2600
     */
    static MapAndLoad(ImageName, DllPath, LoadedImage, DotDll, ReadOnly) {
        ImageName := ImageName is String? StrPtr(ImageName) : ImageName
        DllPath := DllPath is String? StrPtr(DllPath) : DllPath

        A_LastError := 0

        result := DllCall("imagehlp.dll\MapAndLoad", "ptr", ImageName, "ptr", DllPath, "ptr", LoadedImage, "int", DotDll, "int", ReadOnly, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deallocate all resources that are allocated by a previous call to the MapAndLoad function.
     * @remarks
     * The 
     * <b>UnMapAndLoad</b> function must be used to deallocate all resources that are allocated by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-mapandload">MapAndLoad</a>. This function also writes a new checksum value into the image before the file is closed. This ensures that if a file is changed, it can be successfully loaded by the system loader.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<LOADED_IMAGE>} LoadedImage A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-loaded_image">LOADED_IMAGE</a> structure. This structure is obtained through a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-mapandload">MapAndLoad</a> function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-unmapandload
     * @since windows5.1.2600
     */
    static UnMapAndLoad(LoadedImage) {
        A_LastError := 0

        result := DllCall("imagehlp.dll\UnMapAndLoad", "ptr", LoadedImage, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Updates the date and time at which the specified file was last modified.
     * @remarks
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} FileHandle A handle to the file of interest.
     * @param {Pointer<SYSTEMTIME>} pSystemTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure. If this parameter is <b>NULL</b>, the current system date and time is used.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-touchfiletimes
     * @since windows5.1.2600
     */
    static TouchFileTimes(FileHandle, pSystemTime) {
        A_LastError := 0

        result := DllCall("imagehlp.dll\TouchFileTimes", "ptr", FileHandle, "ptr", pSystemTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Uses the specified information to update the corresponding fields in the symbol file.
     * @remarks
     * The 
     * <b>UpdateDebugInfoFile</b> function takes the information stored in the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-image_nt_headers32">IMAGE_NT_HEADERS</a> structure and updates the corresponding fields in the symbol file. Any time an image file is modified, this function should be called to keep the numbers in sync. Specifically, whenever an image checksum changes, the symbol file should be updated to match.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Byte>} ImageFileName The name of the image that is now out of date with respect to its symbol file.
     * @param {Pointer<Byte>} SymbolPath The path in which to look for the symbol file.
     * @param {Pointer<Byte>} DebugFilePath A pointer to a buffer that receives the name of the symbol file that was updated.
     * @param {Pointer<IMAGE_NT_HEADERS32>} NtHeaders A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-image_nt_headers32">IMAGE_NT_HEADERS</a> structure that specifies the new header information.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-updatedebuginfofile
     * @since windows5.1.2600
     */
    static UpdateDebugInfoFile(ImageFileName, SymbolPath, DebugFilePath, NtHeaders) {
        ImageFileName := ImageFileName is String? StrPtr(ImageFileName) : ImageFileName
        SymbolPath := SymbolPath is String? StrPtr(SymbolPath) : SymbolPath
        DebugFilePath := DebugFilePath is String? StrPtr(DebugFilePath) : DebugFilePath

        A_LastError := 0

        result := DllCall("imagehlp.dll\UpdateDebugInfoFile", "ptr", ImageFileName, "ptr", SymbolPath, "ptr", DebugFilePath, "ptr", NtHeaders, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Uses the specified extended information to update the corresponding fields in the symbol file.
     * @remarks
     * The 
     * <b>UpdateDebugInfoFileEx</b> function takes the information stored in the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-image_nt_headers32">IMAGE_NT_HEADERS</a> structure and updates the corresponding fields in the symbol file. Any time an image file is modified, this function should be called to keep the numbers in sync. Specifically, whenever an image checksum changes, the symbol file should be updated to match.
     * 
     * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Byte>} ImageFileName The name of the image that is now out of date with respect to its symbol file.
     * @param {Pointer<Byte>} SymbolPath The path in which to look for the symbol file.
     * @param {Pointer<Byte>} DebugFilePath A pointer to a buffer that receives the name of the symbol file that was updated.
     * @param {Pointer<IMAGE_NT_HEADERS32>} NtHeaders A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-image_nt_headers32">IMAGE_NT_HEADERS</a> structure that specifies the new header information.
     * @param {Integer} OldCheckSum The original checksum value. If this value does not match the checksum that is present in the mapped image, the flags in the symbol file contain IMAGE_SEPARATE_DEBUG_MISMATCH and the last error value is set to ERROR_INVALID_DATA.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nf-imagehlp-updatedebuginfofileex
     * @since windows5.1.2600
     */
    static UpdateDebugInfoFileEx(ImageFileName, SymbolPath, DebugFilePath, NtHeaders, OldCheckSum) {
        ImageFileName := ImageFileName is String? StrPtr(ImageFileName) : ImageFileName
        SymbolPath := SymbolPath is String? StrPtr(SymbolPath) : SymbolPath
        DebugFilePath := DebugFilePath is String? StrPtr(DebugFilePath) : DebugFilePath

        result := DllCall("imagehlp.dll\UpdateDebugInfoFileEx", "ptr", ImageFileName, "ptr", SymbolPath, "ptr", DebugFilePath, "ptr", NtHeaders, "uint", OldCheckSum, "int")
        return result
    }

    /**
     * The SymFindDebugInfoFile function (dbghelp.h) locates a .dbg file in the process search path.
     * @remarks
     * This function uses the search path set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} FileName The name of the .dbg file. You can use a partial path.
     * @param {Pointer<Byte>} DebugFilePath The fully qualified path of the .dbg file. This buffer must be at least MAX_PATH characters.
     * @param {Pointer<PFIND_DEBUG_FILE_CALLBACK>} Callback An application-defined callback function that verifies whether the correct file was found or the function should continue its search. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pfind_debug_file_callback">FindDebugInfoFileProc</a>. 
     * 
     * 
     * 
     * 
     * This parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} CallerData A user-defined value or <b>NULL</b>. This value is simply passed to the callback function. This parameter is typically used by an application to pass a pointer to a data structure that provides some context for the callback function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an open handle to the .dbg file.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfinddebuginfofile
     */
    static SymFindDebugInfoFile(hProcess, FileName, DebugFilePath, Callback, CallerData) {
        FileName := FileName is String? StrPtr(FileName) : FileName
        DebugFilePath := DebugFilePath is String? StrPtr(DebugFilePath) : DebugFilePath

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFindDebugInfoFile", "ptr", hProcess, "ptr", FileName, "ptr", DebugFilePath, "ptr", Callback, "ptr", CallerData)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFindDebugInfoFileW (Unicode) function locates a .dbg file in the process search path.
     * @remarks
     * This function uses the search path set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymFindDebugInfoFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Char>} FileName The name of the .dbg file. You can use a partial path.
     * @param {Pointer<Char>} DebugFilePath The fully qualified path of the .dbg file. This buffer must be at least MAX_PATH characters.
     * @param {Pointer<PFIND_DEBUG_FILE_CALLBACKW>} Callback An application-defined callback function that verifies whether the correct file was found or the function should continue its search. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pfind_debug_file_callback">FindDebugInfoFileProc</a>. 
     * 
     * 
     * 
     * 
     * This parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} CallerData A user-defined value or <b>NULL</b>. This value is simply passed to the callback function. This parameter is typically used by an application to pass a pointer to a data structure that provides some context for the callback function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an open handle to the .dbg file.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfinddebuginfofilew
     */
    static SymFindDebugInfoFileW(hProcess, FileName, DebugFilePath, Callback, CallerData) {
        FileName := FileName is String? StrPtr(FileName) : FileName
        DebugFilePath := DebugFilePath is String? StrPtr(DebugFilePath) : DebugFilePath

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFindDebugInfoFileW", "ptr", hProcess, "ptr", FileName, "ptr", DebugFilePath, "ptr", Callback, "ptr", CallerData)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates a debug (.dbg) file.
     * @remarks
     * The 
     * <b>FindDebugInfoFile</b> function is used to locate a .dbg file. This function is provided so the search can be conducted in several different directories through a single function call. The <i>SymbolPath</i> parameter can contain multiple paths, with each separated by a semicolon (;). When multiple paths are specified, the function searches each directory for the file. Subdirectories are not searched. When the file is located, the search stops. Thus, be sure to specify <i>SymbolPath</i> with the paths in the correct order.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Byte>} FileName The name of the .dbg file that is desired. You can use a partial path.
     * @param {Pointer<Byte>} SymbolPath The path where symbol files are located. This can be multiple paths separated by semicolons. To retrieve the symbol path, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsearchpath">SymGetSearchPath</a> function.
     * @param {Pointer<Byte>} DebugFilePath A pointer to a buffer that receives the full path of the .dbg file.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an open handle to the .dbg file.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-finddebuginfofile
     */
    static FindDebugInfoFile(FileName, SymbolPath, DebugFilePath) {
        FileName := FileName is String? StrPtr(FileName) : FileName
        SymbolPath := SymbolPath is String? StrPtr(SymbolPath) : SymbolPath
        DebugFilePath := DebugFilePath is String? StrPtr(DebugFilePath) : DebugFilePath

        A_LastError := 0

        result := DllCall("dbghelp.dll\FindDebugInfoFile", "ptr", FileName, "ptr", SymbolPath, "ptr", DebugFilePath)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FindDebugInfoFileEx function (dbghelp.h) locates the specified debug (.dbg) file.
     * @remarks
     * The 
     * <b>FindDebugInfoFileEx</b> function is used to locate a .dbg file. This function is provided so the search can be conducted in several different directories through a single function call. The <i>SymbolPath</i> parameter can contain multiple paths, with each separated by a semicolon (;). When multiple paths are specified, the function searches each specified directory for the file. When the file is located, the search stops. Thus, be sure to specify <i>SymbolPath</i> with the paths in the correct order.
     * 
     * If the file name specified does not include a .dbg extension, 
     * <b>FindDebugInfoFileEx</b> searches for the file in the following sequence:
     * 
     * <ol>
     * <li><i>SymbolPath</i>\Symbols&#92;<i>ext</i>&#92;<i>filename</i>.dbg</li>
     * <li><i>SymbolPath</i>&#92;<i>ext</i>&#92;<i>filename</i>.dbg</li>
     * <li><i>SymbolPath</i>&#92;<i>filename</i>.dbg</li>
     * <li><i>FileNamePath</i>&#92;<i>filename</i>.dbg</li>
     * </ol>
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Byte>} FileName The name of the .dbg file to locate. You can use a partial path.
     * @param {Pointer<Byte>} SymbolPath The path where symbol files are located. This can be multiple paths separated by semicolons. To retrieve the symbol path, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsearchpath">SymGetSearchPath</a> function.
     * @param {Pointer<Byte>} DebugFilePath A pointer to a buffer that receives the full path of the .dbg file.
     * @param {Pointer<PFIND_DEBUG_FILE_CALLBACK>} Callback An application-defined callback function that verifies whether the correct file was found or the function should continue its search. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pfind_debug_file_callback">FindDebugInfoFileProc</a>. 
     * 
     * 
     * 
     * 
     * This parameter may be <b>NULL</b>.
     * @param {Pointer<Void>} CallerData Optional user-defined data to pass to the callback function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an open handle to the .dbg file.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-finddebuginfofileex
     */
    static FindDebugInfoFileEx(FileName, SymbolPath, DebugFilePath, Callback, CallerData) {
        FileName := FileName is String? StrPtr(FileName) : FileName
        SymbolPath := SymbolPath is String? StrPtr(SymbolPath) : SymbolPath
        DebugFilePath := DebugFilePath is String? StrPtr(DebugFilePath) : DebugFilePath

        A_LastError := 0

        result := DllCall("dbghelp.dll\FindDebugInfoFileEx", "ptr", FileName, "ptr", SymbolPath, "ptr", DebugFilePath, "ptr", Callback, "ptr", CallerData)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FindDebugInfoFileExW (Unicode) function locates the specified debug (.dbg) file.
     * @remarks
     * The 
     * <b>FindDebugInfoFileEx</b> function is used to locate a .dbg file. This function is provided so the search can be conducted in several different directories through a single function call. The <i>SymbolPath</i> parameter can contain multiple paths, with each separated by a semicolon (;). When multiple paths are specified, the function searches each specified directory for the file. When the file is located, the search stops. Thus, be sure to specify <i>SymbolPath</i> with the paths in the correct order.
     * 
     * If the file name specified does not include a .dbg extension, 
     * <b>FindDebugInfoFileEx</b> searches for the file in the following sequence:
     * 
     * <ol>
     * <li><i>SymbolPath</i>\Symbols&#92;<i>ext</i>&#92;<i>filename</i>.dbg</li>
     * <li><i>SymbolPath</i>&#92;<i>ext</i>&#92;<i>filename</i>.dbg</li>
     * <li><i>SymbolPath</i>&#92;<i>filename</i>.dbg</li>
     * <li><i>FileNamePath</i>&#92;<i>filename</i>.dbg</li>
     * </ol>
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines FindDebugInfoFileEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} FileName The name of the .dbg file to locate. You can use a partial path.
     * @param {Pointer<Char>} SymbolPath The path where symbol files are located. This can be multiple paths separated by semicolons. To retrieve the symbol path, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsearchpath">SymGetSearchPath</a> function.
     * @param {Pointer<Char>} DebugFilePath A pointer to a buffer that receives the full path of the .dbg file.
     * @param {Pointer<PFIND_DEBUG_FILE_CALLBACKW>} Callback An application-defined callback function that verifies whether the correct file was found or the function should continue its search. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pfind_debug_file_callback">FindDebugInfoFileProc</a>. 
     * 
     * 
     * 
     * 
     * This parameter may be <b>NULL</b>.
     * @param {Pointer<Void>} CallerData Optional user-defined data to pass to the callback function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an open handle to the .dbg file.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-finddebuginfofileexw
     */
    static FindDebugInfoFileExW(FileName, SymbolPath, DebugFilePath, Callback, CallerData) {
        FileName := FileName is String? StrPtr(FileName) : FileName
        SymbolPath := SymbolPath is String? StrPtr(SymbolPath) : SymbolPath
        DebugFilePath := DebugFilePath is String? StrPtr(DebugFilePath) : DebugFilePath

        A_LastError := 0

        result := DllCall("dbghelp.dll\FindDebugInfoFileExW", "ptr", FileName, "ptr", SymbolPath, "ptr", DebugFilePath, "ptr", Callback, "ptr", CallerData)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFindFileInPath function (dbghelp.h) locates a symbol file or executable image.
     * @remarks
     * The identifying parameters are filled in as follows:
     * 
     * <ul>
     * <li>
     * If DbgHelp is looking for a .pdb file, the <i>id</i> parameter specifies the PDB signature as found in the codeview debug directory of the original image. Parameter <i>two</i> specifies the PDB age. Parameter <i>three</i> is unused and set to zero.
     * 
     * </li>
     * <li>
     * If DbgHelp is looking for any other type of image, such as an executable file or .dbg file, the <i>id</i> parameter specifies the TimeDateStamp of the original image as found in its PE header. Parameter <i>two</i> specifies the SizeOfImage field, also extracted from the PE header. Parameter <i>three</i> is unused and set to zero.
     * 
     * </li>
     * </ul>
     * All of these values can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsrvgetfileindexinfo">SymSrvGetFileIndexInfo</a>.
     * 
     * When searching a directory, this function does not verify that the symbol identifiers match by default. To ensure the matching symbol files are located, call the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetoptions">SymSetOptions</a> function with SYMOPT_EXACT_SYMBOLS.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hprocess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} SearchPathA 
     * @param {Pointer<Byte>} FileName The name of the file. You can specify a path; however, only the file name is used.
     * @param {Pointer<Void>} id The first of three identifying parameters (see Remarks).
     * @param {Integer} two The second of three identifying parameters (see Remarks).
     * @param {Integer} three The third of three identifying parameters (see Remarks).
     * @param {Integer} flags 
     * @param {Pointer<Byte>} FoundFile A pointer to a buffer that receives the fully qualified path to the symbol file. This buffer must be at least MAX_PATH characters.
     * @param {Pointer<PFINDFILEINPATHCALLBACK>} callback A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pfindfileinpathcallback">SymFindFileInPathProc</a> callback function.
     * @param {Pointer<Void>} context A user-defined value or <b>NULL</b>. This value is simply passed to the callback function. This parameter is typically used by an application to pass a pointer to a data structure that provides some context for the callback function.
     * @returns {Integer} If the server locates a valid symbol file, it returns <b>TRUE</b>; otherwise, it returns <b>FALSE</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns a value that indicates why the symbol file was not returned.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfindfileinpath
     */
    static SymFindFileInPath(hprocess, SearchPathA, FileName, id, two, three, flags, FoundFile, callback, context) {
        SearchPathA := SearchPathA is String? StrPtr(SearchPathA) : SearchPathA
        FileName := FileName is String? StrPtr(FileName) : FileName
        FoundFile := FoundFile is String? StrPtr(FoundFile) : FoundFile

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFindFileInPath", "ptr", hprocess, "ptr", SearchPathA, "ptr", FileName, "ptr", id, "uint", two, "uint", three, "uint", flags, "ptr", FoundFile, "ptr", callback, "ptr", context, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFindFileInPathW (Unicode) function locates a symbol file or executable image.
     * @remarks
     * The identifying parameters are filled in as follows:
     * 
     * <ul>
     * <li>
     * If DbgHelp is looking for a .pdb file, the <i>id</i> parameter specifies the PDB signature as found in the codeview debug directory of the original image. Parameter <i>two</i> specifies the PDB age. Parameter <i>three</i> is unused and set to zero.
     * 
     * </li>
     * <li>
     * If DbgHelp is looking for any other type of image, such as an executable file or .dbg file, the <i>id</i> parameter specifies the TimeDateStamp of the original image as found in its PE header. Parameter <i>two</i> specifies the SizeOfImage field, also extracted from the PE header. Parameter <i>three</i> is unused and set to zero.
     * 
     * </li>
     * </ul>
     * All of these values can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsrvgetfileindexinfo">SymSrvGetFileIndexInfo</a>.
     * 
     * When searching a directory, this function does not verify that the symbol identifiers match by default. To ensure the matching symbol files are located, call the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetoptions">SymSetOptions</a> function with SYMOPT_EXACT_SYMBOLS.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymFindFileInPath as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hprocess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Char>} SearchPathA 
     * @param {Pointer<Char>} FileName The name of the file. You can specify a path; however, only the file name is used.
     * @param {Pointer<Void>} id The first of three identifying parameters (see Remarks).
     * @param {Integer} two The second of three identifying parameters (see Remarks).
     * @param {Integer} three The third of three identifying parameters (see Remarks).
     * @param {Integer} flags 
     * @param {Pointer<Char>} FoundFile A pointer to a buffer that receives the fully qualified path to the symbol file. This buffer must be at least MAX_PATH characters.
     * @param {Pointer<PFINDFILEINPATHCALLBACKW>} callback A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pfindfileinpathcallback">SymFindFileInPathProc</a> callback function.
     * @param {Pointer<Void>} context A user-defined value or <b>NULL</b>. This value is simply passed to the callback function. This parameter is typically used by an application to pass a pointer to a data structure that provides some context for the callback function.
     * @returns {Integer} If the server locates a valid symbol file, it returns <b>TRUE</b>; otherwise, it returns <b>FALSE</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns a value that indicates why the symbol file was not returned.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfindfileinpathw
     */
    static SymFindFileInPathW(hprocess, SearchPathA, FileName, id, two, three, flags, FoundFile, callback, context) {
        SearchPathA := SearchPathA is String? StrPtr(SearchPathA) : SearchPathA
        FileName := FileName is String? StrPtr(FileName) : FileName
        FoundFile := FoundFile is String? StrPtr(FoundFile) : FoundFile

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFindFileInPathW", "ptr", hprocess, "ptr", SearchPathA, "ptr", FileName, "ptr", id, "uint", two, "uint", three, "uint", flags, "ptr", FoundFile, "ptr", callback, "ptr", context, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFindExecutableImage function (dbghelp.h) locates an executable file in the process search path.
     * @remarks
     * This function uses the search path set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} FileName The name of the executable file. You can use a partial path.
     * @param {Pointer<Byte>} ImageFilePath The fully qualified path of the executable file. This buffer must be at least MAX_PATH characters.
     * @param {Pointer<PFIND_EXE_FILE_CALLBACK>} Callback An application-defined callback function that verifies whether the correct executable file was found, or whether the function should continue its search. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pfind_exe_file_callback">FindExecutableImageProc</a>. 
     * 
     * 
     * 
     * 
     * This parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} CallerData A user-defined value or <b>NULL</b>. This value is simply passed to the callback function. This parameter is typically used by an application to pass a pointer to a data structure that provides some context for the callback function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an open handle to the executable file.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfindexecutableimage
     */
    static SymFindExecutableImage(hProcess, FileName, ImageFilePath, Callback, CallerData) {
        FileName := FileName is String? StrPtr(FileName) : FileName
        ImageFilePath := ImageFilePath is String? StrPtr(ImageFilePath) : ImageFilePath

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFindExecutableImage", "ptr", hProcess, "ptr", FileName, "ptr", ImageFilePath, "ptr", Callback, "ptr", CallerData)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFindExecutableImageW (Unicode) function locates an executable file in the process search path.
     * @remarks
     * This function uses the search path set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymFindExecutableImage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Char>} FileName The name of the executable file. You can use a partial path.
     * @param {Pointer<Char>} ImageFilePath The fully qualified path of the executable file. This buffer must be at least MAX_PATH characters.
     * @param {Pointer<PFIND_EXE_FILE_CALLBACKW>} Callback An application-defined callback function that verifies whether the correct executable file was found, or whether the function should continue its search. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pfind_exe_file_callback">FindExecutableImageProc</a>. 
     * 
     * 
     * 
     * 
     * This parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} CallerData A user-defined value or <b>NULL</b>. This value is simply passed to the callback function. This parameter is typically used by an application to pass a pointer to a data structure that provides some context for the callback function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an open handle to the executable file.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfindexecutableimagew
     */
    static SymFindExecutableImageW(hProcess, FileName, ImageFilePath, Callback, CallerData) {
        FileName := FileName is String? StrPtr(FileName) : FileName
        ImageFilePath := ImageFilePath is String? StrPtr(ImageFilePath) : ImageFilePath

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFindExecutableImageW", "ptr", hProcess, "ptr", FileName, "ptr", ImageFilePath, "ptr", Callback, "ptr", CallerData)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates an executable file.
     * @remarks
     * The 
     * <b>FindExecutableImage</b> function is provided so executable files can be located in several different directories through a single function call. The <i>SymbolPath</i> parameter can contain multiple paths, with each separated by a semicolon (;). When multiple paths are specified, the function searches each directory tree for the executable file. When the file is located, the search stops. Thus, be sure to specify <i>SymbolPath</i> with the paths in the correct order.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Byte>} FileName The name of the symbol file to be located. This parameter can be a partial path.
     * @param {Pointer<Byte>} SymbolPath The path where symbol files are located. This can be multiple paths separated by semicolons. To retrieve the symbol path, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsearchpath">SymGetSearchPath</a> function.
     * @param {Pointer<Byte>} ImageFilePath A pointer to a buffer that receives the full path of the executable file.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an open handle to the executable file.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-findexecutableimage
     */
    static FindExecutableImage(FileName, SymbolPath, ImageFilePath) {
        FileName := FileName is String? StrPtr(FileName) : FileName
        SymbolPath := SymbolPath is String? StrPtr(SymbolPath) : SymbolPath
        ImageFilePath := ImageFilePath is String? StrPtr(ImageFilePath) : ImageFilePath

        A_LastError := 0

        result := DllCall("dbghelp.dll\FindExecutableImage", "ptr", FileName, "ptr", SymbolPath, "ptr", ImageFilePath)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FindExecutableImageEx function (dbghelp.h) locates the specified executable file.
     * @remarks
     * The 
     * <b>FindExecutableImageEx</b> function is provided so executable files can be found in several different directories by using a single function call. If the <i>SymbolPath</i> parameter contains multiple paths, the function searches each specified directory tree for the executable file. When the file is found, the search stops. Thus, be sure to specify <i>SymbolPath</i> with the paths in the correct order.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Byte>} FileName The name of the symbol file to be located. This parameter can be a partial path.
     * @param {Pointer<Byte>} SymbolPath The path where symbol files are located. This string can contain multiple paths separated by semicolons. To retrieve the symbol path, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsearchpath">SymGetSearchPath</a> function.
     * @param {Pointer<Byte>} ImageFilePath A pointer to a buffer that receives the full path of the executable file.
     * @param {Pointer<PFIND_EXE_FILE_CALLBACK>} Callback An application-defined callback function that verifies whether the correct executable file was found, or whether the function should continue its search. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pfind_exe_file_callback">FindExecutableImageProc</a>. 
     * 
     * 
     * 
     * 
     * This parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} CallerData Optional user-defined data for the callback function. This parameter can be <b>NULL</b>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an open handle to the executable file.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-findexecutableimageex
     */
    static FindExecutableImageEx(FileName, SymbolPath, ImageFilePath, Callback, CallerData) {
        FileName := FileName is String? StrPtr(FileName) : FileName
        SymbolPath := SymbolPath is String? StrPtr(SymbolPath) : SymbolPath
        ImageFilePath := ImageFilePath is String? StrPtr(ImageFilePath) : ImageFilePath

        A_LastError := 0

        result := DllCall("dbghelp.dll\FindExecutableImageEx", "ptr", FileName, "ptr", SymbolPath, "ptr", ImageFilePath, "ptr", Callback, "ptr", CallerData)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FindExecutableImageExW (Unicode) function locates the specified executable file.
     * @remarks
     * The 
     * <b>FindExecutableImageEx</b> function is provided so executable files can be found in several different directories by using a single function call. If the <i>SymbolPath</i> parameter contains multiple paths, the function searches each specified directory tree for the executable file. When the file is found, the search stops. Thus, be sure to specify <i>SymbolPath</i> with the paths in the correct order.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines FindExecutableImageEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} FileName The name of the symbol file to be located. This parameter can be a partial path.
     * @param {Pointer<Char>} SymbolPath The path where symbol files are located. This string can contain multiple paths separated by semicolons. To retrieve the symbol path, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsearchpath">SymGetSearchPath</a> function.
     * @param {Pointer<Char>} ImageFilePath A pointer to a buffer that receives the full path of the executable file.
     * @param {Pointer<PFIND_EXE_FILE_CALLBACKW>} Callback An application-defined callback function that verifies whether the correct executable file was found, or whether the function should continue its search. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pfind_exe_file_callback">FindExecutableImageProc</a>. 
     * 
     * 
     * 
     * 
     * This parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} CallerData Optional user-defined data for the callback function. This parameter can be <b>NULL</b>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is an open handle to the executable file.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-findexecutableimageexw
     */
    static FindExecutableImageExW(FileName, SymbolPath, ImageFilePath, Callback, CallerData) {
        FileName := FileName is String? StrPtr(FileName) : FileName
        SymbolPath := SymbolPath is String? StrPtr(SymbolPath) : SymbolPath
        ImageFilePath := ImageFilePath is String? StrPtr(ImageFilePath) : ImageFilePath

        A_LastError := 0

        result := DllCall("dbghelp.dll\FindExecutableImageExW", "ptr", FileName, "ptr", SymbolPath, "ptr", ImageFilePath, "ptr", Callback, "ptr", CallerData)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates a directory entry within the image header and returns the address of the data for the directory entry. This function returns the section header for the data located, if one exists.
     * @param {Pointer<Void>} Base The base address of the image or data file.
     * @param {Integer} MappedAsImage If the flag is <b>TRUE</b>, the file is mapped by the system as an image. If this flag is <b>FALSE</b>, the file is mapped as a data file by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> function.
     * @param {Integer} DirectoryEntry 
     * @param {Pointer<UInt32>} Size A pointer to a variable that receives the size of the data for the directory entry that is located.
     * @param {Pointer<IMAGE_SECTION_HEADER>} FoundHeader A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-image_section_header">IMAGE_SECTION_HEADER</a> structure that receives the data. If the section header does not exist, this parameter is <b>NULL</b>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the data for the directory entry.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-imagedirectoryentrytodataex
     */
    static ImageDirectoryEntryToDataEx(Base, MappedAsImage, DirectoryEntry, Size, FoundHeader) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\ImageDirectoryEntryToDataEx", "ptr", Base, "char", MappedAsImage, "ushort", DirectoryEntry, "uint*", Size, "ptr", FoundHeader)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Obtains access to image-specific data.
     * @remarks
     * The 
     * <b>ImageDirectoryEntryToData</b> function is used to obtain access to image-specific data.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} Base The base address of the image.
     * @param {Integer} MappedAsImage If this parameter is <b>TRUE</b>, the file is mapped by the system as an image. If the flag is <b>FALSE</b>, the file is mapped as a data file by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> function.
     * @param {Integer} DirectoryEntry 
     * @param {Pointer<UInt32>} Size A pointer to a variable that receives the size of the data for the directory entry, in bytes.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the directory entry's data.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-imagedirectoryentrytodata
     */
    static ImageDirectoryEntryToData(Base, MappedAsImage, DirectoryEntry, Size) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\ImageDirectoryEntryToData", "ptr", Base, "char", MappedAsImage, "ushort", DirectoryEntry, "uint*", Size)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SearchTreeForFile function (dbghelp.h) searches a directory tree for a specified file.
     * @remarks
     * The function searches for the file specified by the <i>InputPathName</i> parameter beginning at the path specified in the <i>RootPath</i> parameter. The maximum path depth that is allowed in the <i>RootPath</i> is 32 directories. When the function finds the file in the directory tree, it places the full path to the file in the buffer specified by the <i>OutputPathBuffer</i> parameter. The underlying file system specifies the order of the subdirectory search.
     * 
     * The search can be canceled if you register a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psymbol_registered_callback">SymRegisterCallbackProc64</a> callback function. For every directory searched, 
     * <b>SearchTreeForFile</b> calls this callback function with CBA_DEFERRED_SYMBOL_LOAD_CANCEL. If the callback function returns <b>TRUE</b>, 
     * <b>SearchTreeForFile</b> cancels the search.
     * 
     * This function triggers one CBA_DEFERRED_SYMBOL_LOAD_CANCEL event per directory searched. This allows the caller to cancel the search.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Byte>} RootPath The path where the function should begin searching for the file.
     * @param {Pointer<Byte>} InputPathName The file for which the function will search. You can use a partial path.
     * @param {Pointer<Byte>} OutputPathBuffer A pointer to a buffer that receives the full path to the file that is found. This string is not modified if the return value is <b>FALSE</b>.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-searchtreeforfile
     */
    static SearchTreeForFile(RootPath, InputPathName, OutputPathBuffer) {
        RootPath := RootPath is String? StrPtr(RootPath) : RootPath
        InputPathName := InputPathName is String? StrPtr(InputPathName) : InputPathName
        OutputPathBuffer := OutputPathBuffer is String? StrPtr(OutputPathBuffer) : OutputPathBuffer

        A_LastError := 0

        result := DllCall("dbghelp.dll\SearchTreeForFile", "ptr", RootPath, "ptr", InputPathName, "ptr", OutputPathBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SearchTreeForFileW (Unicode) function searches a directory tree for a specified file.
     * @remarks
     * The function searches for the file specified by the <i>InputPathName</i> parameter beginning at the path specified in the <i>RootPath</i> parameter. The maximum path depth that is allowed in the <i>RootPath</i> is 32 directories. When the function finds the file in the directory tree, it places the full path to the file in the buffer specified by the <i>OutputPathBuffer</i> parameter. The underlying file system specifies the order of the subdirectory search.
     * 
     * The search can be canceled if you register a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psymbol_registered_callback">SymRegisterCallbackProc64</a> callback function. For every directory searched, 
     * <b>SearchTreeForFile</b> calls this callback function with CBA_DEFERRED_SYMBOL_LOAD_CANCEL. If the callback function returns <b>TRUE</b>, 
     * <b>SearchTreeForFile</b> cancels the search.
     * 
     * This function triggers one CBA_DEFERRED_SYMBOL_LOAD_CANCEL event per directory searched. This allows the caller to cancel the search.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SearchTreeForFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} RootPath The path where the function should begin searching for the file.
     * @param {Pointer<Char>} InputPathName The file for which the function will search. You can use a partial path.
     * @param {Pointer<Char>} OutputPathBuffer A pointer to a buffer that receives the full path to the file that is found. This string is not modified if the return value is <b>FALSE</b>.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-searchtreeforfilew
     */
    static SearchTreeForFileW(RootPath, InputPathName, OutputPathBuffer) {
        RootPath := RootPath is String? StrPtr(RootPath) : RootPath
        InputPathName := InputPathName is String? StrPtr(InputPathName) : InputPathName
        OutputPathBuffer := OutputPathBuffer is String? StrPtr(OutputPathBuffer) : OutputPathBuffer

        A_LastError := 0

        result := DllCall("dbghelp.dll\SearchTreeForFileW", "ptr", RootPath, "ptr", InputPathName, "ptr", OutputPathBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The EnumDirTree function (dbghelp.h) enumerates all occurrences of the specified file in the specified directory tree.
     * @remarks
     * The search can be canceled if you register a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psymbol_registered_callback">SymRegisterCallbackProc64</a> callback function. For every file operation, 
     * <i>EnumDirTree</i> calls this callback function with CBA_DEFERRED_SYMBOL_LOAD_CANCEL. If the callback function returns <b>TRUE</b>, 
     * <i>EnumDirTree</i> cancels the search.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} RootPath The path where the function should begin searching for the file.
     * @param {Pointer<Byte>} InputPathName The name of the file to be found. You can specify a partial path.
     * @param {Pointer<Byte>} OutputPathBuffer A pointer to a buffer that receives the full path of the file. If the function fails or does not find a matching file, this buffer will still contain the last full path that was found. 
     * 
     * This parameter is optional and can be <b>NULL</b>.
     * @param {Pointer<PENUMDIRTREE_CALLBACK>} cb An application-defined callback function, or <b>NULL</b>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-penumdirtree_callback">EnumDirTreeProc</a>.
     * @param {Pointer<Void>} data The user-defined data or <b>NULL</b>. This value is passed to the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-enumdirtree
     */
    static EnumDirTree(hProcess, RootPath, InputPathName, OutputPathBuffer, cb, data) {
        RootPath := RootPath is String? StrPtr(RootPath) : RootPath
        InputPathName := InputPathName is String? StrPtr(InputPathName) : InputPathName
        OutputPathBuffer := OutputPathBuffer is String? StrPtr(OutputPathBuffer) : OutputPathBuffer

        A_LastError := 0

        result := DllCall("dbghelp.dll\EnumDirTree", "ptr", hProcess, "ptr", RootPath, "ptr", InputPathName, "ptr", OutputPathBuffer, "ptr", cb, "ptr", data, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The EnumDirTreeW (Unicode) function enumerates all occurrences of the specified file in the specified directory tree.
     * @remarks
     * The search can be canceled if you register a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psymbol_registered_callback">SymRegisterCallbackProc64</a> callback function. For every file operation, 
     * <i>EnumDirTree</i> calls this callback function with CBA_DEFERRED_SYMBOL_LOAD_CANCEL. If the callback function returns <b>TRUE</b>, 
     * <i>EnumDirTree</i> cancels the search.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines EnumDirTree as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Char>} RootPath The path where the function should begin searching for the file.
     * @param {Pointer<Char>} InputPathName The name of the file to be found. You can specify a partial path.
     * @param {Pointer<Char>} OutputPathBuffer A pointer to a buffer that receives the full path of the file. If the function fails or does not find a matching file, this buffer will still contain the last full path that was found. 
     * 
     * This parameter is optional and can be <b>NULL</b>.
     * @param {Pointer<PENUMDIRTREE_CALLBACKW>} cb An application-defined callback function, or <b>NULL</b>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-penumdirtree_callback">EnumDirTreeProc</a>.
     * @param {Pointer<Void>} data The user-defined data or <b>NULL</b>. This value is passed to the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-enumdirtreew
     */
    static EnumDirTreeW(hProcess, RootPath, InputPathName, OutputPathBuffer, cb, data) {
        RootPath := RootPath is String? StrPtr(RootPath) : RootPath
        InputPathName := InputPathName is String? StrPtr(InputPathName) : InputPathName
        OutputPathBuffer := OutputPathBuffer is String? StrPtr(OutputPathBuffer) : OutputPathBuffer

        A_LastError := 0

        result := DllCall("dbghelp.dll\EnumDirTreeW", "ptr", hProcess, "ptr", RootPath, "ptr", InputPathName, "ptr", OutputPathBuffer, "ptr", cb, "ptr", data, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates all the directories in the specified path, beginning with the root.
     * @remarks
     * Each directory specified is created, if it does not already exist. If only some of the directories are 
     *     created, the function will return <b>FALSE</b>.
     * 
     * This function does not support Unicode strings. To specify a Unicode path, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreatedirectoryexa">SHCreateDirectoryEx</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to 
     *     this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize 
     *     all concurrent calls from more than one thread to this function.
     * @param {Pointer<Byte>} DirPath A valid path name. If the final component of the path is a directory, not a file name, the string must end 
     *       with a backslash (\\) character.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-makesuredirectorypathexists
     */
    static MakeSureDirectoryPathExists(DirPath) {
        DirPath := DirPath is String? StrPtr(DirPath) : DirPath

        A_LastError := 0

        result := DllCall("dbghelp.dll\MakeSureDirectoryPathExists", "ptr", DirPath, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The UnDecorateSymbolName function (dbghelp.h) undecorates the specified decorated C++ symbol name.
     * @remarks
     * To use undecorated symbols, call the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetoptions">SymSetOptions</a> 
     *     function with the <b>SYMOPT_UNDNAME</b> option.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to 
     *     this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize 
     *     all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define <b>DBGHELP_TRANSLATE_TCHAR</b>.
     * @param {Pointer<Byte>} name The decorated C++ symbol name. This name can be identified by the first character of the name, which is 
     *       always a question mark (?).
     * @param {Pointer<Byte>} outputString A pointer to a string buffer that receives the undecorated name.
     * @param {Integer} maxStringLength The size of the <i>UnDecoratedName</i> buffer, in characters.
     * @param {Integer} flags The options for how the decorated name is undecorated. This parameter can be zero or more of the following 
     *       values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_32_BIT_DECODE"></a><a id="undname_32_bit_decode"></a><dl>
     * <dt><b>UNDNAME_32_BIT_DECODE</b></dt>
     * <dt>0x0800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Undecorate 32-bit decorated names.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_COMPLETE"></a><a id="undname_complete"></a><dl>
     * <dt><b>UNDNAME_COMPLETE</b></dt>
     * <dt>0x0000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enable full undecoration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NAME_ONLY"></a><a id="undname_name_only"></a><dl>
     * <dt><b>UNDNAME_NAME_ONLY</b></dt>
     * <dt>0x1000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Undecorate only the name for primary declaration. Returns [scope::]name. Does expand template 
     *         parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_ACCESS_SPECIFIERS"></a><a id="undname_no_access_specifiers"></a><dl>
     * <dt><b>UNDNAME_NO_ACCESS_SPECIFIERS</b></dt>
     * <dt>0x0080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of access specifiers for members.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_ALLOCATION_LANGUAGE"></a><a id="undname_no_allocation_language"></a><dl>
     * <dt><b>UNDNAME_NO_ALLOCATION_LANGUAGE</b></dt>
     * <dt>0x0010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of the declaration language specifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_ALLOCATION_MODEL"></a><a id="undname_no_allocation_model"></a><dl>
     * <dt><b>UNDNAME_NO_ALLOCATION_MODEL</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of the declaration model.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_ARGUMENTS"></a><a id="undname_no_arguments"></a><dl>
     * <dt><b>UNDNAME_NO_ARGUMENTS</b></dt>
     * <dt>0x2000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not undecorate function arguments.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_CV_THISTYPE"></a><a id="undname_no_cv_thistype"></a><dl>
     * <dt><b>UNDNAME_NO_CV_THISTYPE</b></dt>
     * <dt>0x0040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of CodeView modifiers on the <b>this</b> type for primary 
     *         declaration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_FUNCTION_RETURNS"></a><a id="undname_no_function_returns"></a><dl>
     * <dt><b>UNDNAME_NO_FUNCTION_RETURNS</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of return types for primary declarations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_LEADING_UNDERSCORES"></a><a id="undname_no_leading_underscores"></a><dl>
     * <dt><b>UNDNAME_NO_LEADING_UNDERSCORES</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Remove leading underscores from Microsoft keywords.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_MEMBER_TYPE"></a><a id="undname_no_member_type"></a><dl>
     * <dt><b>UNDNAME_NO_MEMBER_TYPE</b></dt>
     * <dt>0x0200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of the static or virtual attribute of members.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_MS_KEYWORDS"></a><a id="undname_no_ms_keywords"></a><dl>
     * <dt><b>UNDNAME_NO_MS_KEYWORDS</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of Microsoft keywords.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_MS_THISTYPE"></a><a id="undname_no_ms_thistype"></a><dl>
     * <dt><b>UNDNAME_NO_MS_THISTYPE</b></dt>
     * <dt>0x0020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of Microsoft keywords on the <b>this</b> type for primary 
     *         declaration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_RETURN_UDT_MODEL"></a><a id="undname_no_return_udt_model"></a><dl>
     * <dt><b>UNDNAME_NO_RETURN_UDT_MODEL</b></dt>
     * <dt>0x0400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of the Microsoft model for user-defined type returns.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_SPECIAL_SYMS"></a><a id="undname_no_special_syms"></a><dl>
     * <dt><b>UNDNAME_NO_SPECIAL_SYMS</b></dt>
     * <dt>0x4000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not undecorate special names, such as vtable, vcall, vector, metatype, and so on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_THISTYPE"></a><a id="undname_no_thistype"></a><dl>
     * <dt><b>UNDNAME_NO_THISTYPE</b></dt>
     * <dt>0x0060</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable all modifiers on the <b>this</b> type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_THROW_SIGNATURES"></a><a id="undname_no_throw_signatures"></a><dl>
     * <dt><b>UNDNAME_NO_THROW_SIGNATURES</b></dt>
     * <dt>0x0100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of throw-signatures for functions and pointers to functions.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is the number of characters in the 
     *        <i>UnDecoratedName</i> buffer, not including the NULL terminator.
     * 
     * If the function fails, the return value is zero. To retrieve extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the function fails and returns zero, the content of the <i>UnDecoratedName</i> buffer 
     *        is undetermined.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-undecoratesymbolname
     */
    static UnDecorateSymbolName(name, outputString, maxStringLength, flags) {
        name := name is String? StrPtr(name) : name
        outputString := outputString is String? StrPtr(outputString) : outputString

        A_LastError := 0

        result := DllCall("dbghelp.dll\UnDecorateSymbolName", "ptr", name, "ptr", outputString, "uint", maxStringLength, "uint", flags, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The UnDecorateSymbolNameW (Unicode) function (dbghelp.h) undecorates the specified decorated C++ symbol name.
     * @remarks
     * To use undecorated symbols, call the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetoptions">SymSetOptions</a> 
     *     function with the <b>SYMOPT_UNDNAME</b> option.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to 
     *     this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize 
     *     all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define <b>DBGHELP_TRANSLATE_TCHAR</b>.
     * @param {Pointer<Char>} name The decorated C++ symbol name. This name can be identified by the first character of the name, which is 
     *       always a question mark (?).
     * @param {Pointer<Char>} outputString A pointer to a string buffer that receives the undecorated name.
     * @param {Integer} maxStringLength The size of the <i>UnDecoratedName</i> buffer, in characters.
     * @param {Integer} flags The options for how the decorated name is undecorated. This parameter can be zero or more of the following 
     *       values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_32_BIT_DECODE"></a><a id="undname_32_bit_decode"></a><dl>
     * <dt><b>UNDNAME_32_BIT_DECODE</b></dt>
     * <dt>0x0800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Undecorate 32-bit decorated names.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_COMPLETE"></a><a id="undname_complete"></a><dl>
     * <dt><b>UNDNAME_COMPLETE</b></dt>
     * <dt>0x0000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enable full undecoration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NAME_ONLY"></a><a id="undname_name_only"></a><dl>
     * <dt><b>UNDNAME_NAME_ONLY</b></dt>
     * <dt>0x1000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Undecorate only the name for primary declaration. Returns [scope::]name. Does expand template 
     *         parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_ACCESS_SPECIFIERS"></a><a id="undname_no_access_specifiers"></a><dl>
     * <dt><b>UNDNAME_NO_ACCESS_SPECIFIERS</b></dt>
     * <dt>0x0080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of access specifiers for members.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_ALLOCATION_LANGUAGE"></a><a id="undname_no_allocation_language"></a><dl>
     * <dt><b>UNDNAME_NO_ALLOCATION_LANGUAGE</b></dt>
     * <dt>0x0010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of the declaration language specifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_ALLOCATION_MODEL"></a><a id="undname_no_allocation_model"></a><dl>
     * <dt><b>UNDNAME_NO_ALLOCATION_MODEL</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of the declaration model.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_ARGUMENTS"></a><a id="undname_no_arguments"></a><dl>
     * <dt><b>UNDNAME_NO_ARGUMENTS</b></dt>
     * <dt>0x2000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not undecorate function arguments.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_CV_THISTYPE"></a><a id="undname_no_cv_thistype"></a><dl>
     * <dt><b>UNDNAME_NO_CV_THISTYPE</b></dt>
     * <dt>0x0040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of CodeView modifiers on the <b>this</b> type for primary 
     *         declaration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_FUNCTION_RETURNS"></a><a id="undname_no_function_returns"></a><dl>
     * <dt><b>UNDNAME_NO_FUNCTION_RETURNS</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of return types for primary declarations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_LEADING_UNDERSCORES"></a><a id="undname_no_leading_underscores"></a><dl>
     * <dt><b>UNDNAME_NO_LEADING_UNDERSCORES</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Remove leading underscores from Microsoft keywords.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_MEMBER_TYPE"></a><a id="undname_no_member_type"></a><dl>
     * <dt><b>UNDNAME_NO_MEMBER_TYPE</b></dt>
     * <dt>0x0200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of the static or virtual attribute of members.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_MS_KEYWORDS"></a><a id="undname_no_ms_keywords"></a><dl>
     * <dt><b>UNDNAME_NO_MS_KEYWORDS</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of Microsoft keywords.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_MS_THISTYPE"></a><a id="undname_no_ms_thistype"></a><dl>
     * <dt><b>UNDNAME_NO_MS_THISTYPE</b></dt>
     * <dt>0x0020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of Microsoft keywords on the <b>this</b> type for primary 
     *         declaration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_RETURN_UDT_MODEL"></a><a id="undname_no_return_udt_model"></a><dl>
     * <dt><b>UNDNAME_NO_RETURN_UDT_MODEL</b></dt>
     * <dt>0x0400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of the Microsoft model for user-defined type returns.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_SPECIAL_SYMS"></a><a id="undname_no_special_syms"></a><dl>
     * <dt><b>UNDNAME_NO_SPECIAL_SYMS</b></dt>
     * <dt>0x4000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not undecorate special names, such as vtable, vcall, vector, metatype, and so on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_THISTYPE"></a><a id="undname_no_thistype"></a><dl>
     * <dt><b>UNDNAME_NO_THISTYPE</b></dt>
     * <dt>0x0060</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable all modifiers on the <b>this</b> type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UNDNAME_NO_THROW_SIGNATURES"></a><a id="undname_no_throw_signatures"></a><dl>
     * <dt><b>UNDNAME_NO_THROW_SIGNATURES</b></dt>
     * <dt>0x0100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable expansion of throw-signatures for functions and pointers to functions.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is the number of characters in the 
     *        <i>UnDecoratedName</i> buffer, not including the NULL terminator.
     * 
     * If the function fails, the return value is zero. To retrieve extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the function fails and returns zero, the content of the <i>UnDecoratedName</i> buffer 
     *        is undetermined.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-undecoratesymbolnamew
     */
    static UnDecorateSymbolNameW(name, outputString, maxStringLength, flags) {
        name := name is String? StrPtr(name) : name
        outputString := outputString is String? StrPtr(outputString) : outputString

        A_LastError := 0

        result := DllCall("dbghelp.dll\UnDecorateSymbolNameW", "ptr", name, "ptr", outputString, "uint", maxStringLength, "uint", flags, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Obtains a stack trace. (StackWalk64)
     * @remarks
     * The <b>StackWalk64</b> function provides a portable method 
     *     for obtaining a stack trace. Using the <b>StackWalk64</b> 
     *     function is recommended over writing your own function because of all the complexities associated with stack 
     *     walking on platforms. In addition, there are compiler options that cause the stack to appear differently, 
     *     depending on how the module is compiled. By using this function, your application has a portable stack trace that 
     *     continues to work as the compiler and operating system change.
     * 
     * The first call to this function will fail if the <b>AddrPC</b>, 
     *     <b>AddrFrame</b>, and <b>AddrStack</b> members of the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-stackframe">STACKFRAME64</a> structure passed in the 
     *     <i>StackFrame</i> parameter are not initialized.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to 
     *     this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize 
     *     all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>StackWalk</b> function. For 
     *    more information, see <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. 
     *    <b>StackWalk</b> is defined as follows in DbgHelp.h.
     *    
     * 
     * 
     * ```cpp
     * @param {Integer} MachineType The architecture type of the computer for which the stack trace is generated. This parameter can be one of 
     *       the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_FILE_MACHINE_I386"></a><a id="image_file_machine_i386"></a><dl>
     * <dt><b>IMAGE_FILE_MACHINE_I386</b></dt>
     * <dt>0x014c</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Intel x86
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_FILE_MACHINE_IA64"></a><a id="image_file_machine_ia64"></a><dl>
     * <dt><b>IMAGE_FILE_MACHINE_IA64</b></dt>
     * <dt>0x0200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Intel Itanium
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_FILE_MACHINE_AMD64"></a><a id="image_file_machine_amd64"></a><dl>
     * <dt><b>IMAGE_FILE_MACHINE_AMD64</b></dt>
     * <dt>0x8664</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * x64 (AMD64 or EM64T)
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} hProcess A handle to the process for which the stack trace is generated. If the caller supplies a valid callback 
     *       pointer for the <i>ReadMemoryRoutine</i> parameter, then this value does not have to be a 
     *       valid process handle. It can be a token that is unique and consistently the same for all calls to the 
     *       <b>StackWalk64</b> function. If the symbol handler is used with 
     *       <b>StackWalk64</b>, use the same process handles for the calls 
     *       to each function.
     * @param {Pointer<Void>} hThread A handle to the thread for which the stack trace is generated. If the caller supplies a valid callback 
     *      pointer for the <i>ReadMemoryRoutine</i> parameter, then this value does not have to be a 
     *      valid thread handle. It can be a token that is unique and consistently the same for all calls to the 
     *      <b>StackWalk64</b> function.
     * @param {Pointer<STACKFRAME64>} StackFrame A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-stackframe">STACKFRAME64</a> structure. This 
     *       structure receives information for the next frame, if the function call succeeds.
     * @param {Pointer<Void>} ContextRecord A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure. This parameter is 
     *        required only when the <i>MachineType</i> parameter is not 
     *        <b>IMAGE_FILE_MACHINE_I386</b>. However, it is recommended that this parameter contain a 
     *        valid context record. This allows <b>StackWalk64</b> to handle 
     *        a greater variety of situations.
     * 
     * This context may be modified, so do not pass a context record that should not be modified.
     * @param {Pointer<PREAD_PROCESS_MEMORY_ROUTINE64>} ReadMemoryRoutine A callback routine that provides memory read services. When the 
     *        <b>StackWalk64</b> function needs to read memory from the 
     *        process's address space, the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pread_process_memory_routine">ReadProcessMemoryProc64</a> callback is 
     *        used.
     * 
     * If this parameter is <b>NULL</b>, then the function uses a default routine. In this case, 
     *        the <i>hProcess</i> parameter must be a valid process handle.
     * 
     * If this parameter is not 
     *        <b>NULL</b>, the application should implement and register a symbol handler callback 
     *        function that handles <b>CBA_READ_MEMORY</b>.
     * @param {Pointer<PFUNCTION_TABLE_ACCESS_ROUTINE64>} FunctionTableAccessRoutine A callback routine that provides access to the run-time function table for the process. This parameter is 
     *        required because the <b>StackWalk64</b> function does not have 
     *        access to the process's run-time function table. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pfunction_table_access_routine">FunctionTableAccessProc64</a>.
     * 
     * The symbol handler provides functions that load and access the run-time table. If these functions are used, 
     *        then <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symfunctiontableaccess">SymFunctionTableAccess64</a> can be 
     *        passed as a valid parameter.
     * @param {Pointer<PGET_MODULE_BASE_ROUTINE64>} GetModuleBaseRoutine A callback routine that provides a module base for any given virtual address. This parameter is required. For 
     *        more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pget_module_base_routine">GetModuleBaseProc64</a>.
     * 
     * The symbol handler provides functions that load and maintain module information. If these functions are used, 
     *        then <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetmodulebase">SymGetModuleBase64</a> can be passed as a valid 
     *        parameter.
     * @param {Pointer<PTRANSLATE_ADDRESS_ROUTINE64>} TranslateAddress A callback routine that provides address translation for 16-bit addresses. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-ptranslate_address_routine">TranslateAddressProc64</a>.
     * 
     * Most callers of <b>StackWalk64</b> can safely pass 
     *        <b>NULL</b> for this parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. Note that 
     *        <b>StackWalk64</b> generally does not set the last error 
     *        code.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-stackwalk64
     */
    static StackWalk64(MachineType, hProcess, hThread, StackFrame, ContextRecord, ReadMemoryRoutine, FunctionTableAccessRoutine, GetModuleBaseRoutine, TranslateAddress) {
        result := DllCall("dbghelp.dll\StackWalk64", "uint", MachineType, "ptr", hProcess, "ptr", hThread, "ptr", StackFrame, "ptr", ContextRecord, "ptr", ReadMemoryRoutine, "ptr", FunctionTableAccessRoutine, "ptr", GetModuleBaseRoutine, "ptr", TranslateAddress, "int")
        return result
    }

    /**
     * Obtains a stack trace. (StackWalkEx)
     * @remarks
     * The <b>StackWalkEx</b> function provides a portable method 
     *     for obtaining a stack trace. Using the <b>StackWalkEx</b> 
     *     function is recommended over writing your own function because of all the complexities associated with stack 
     *     walking on platforms. In addition, there are compiler options that cause the stack to appear differently, 
     *     depending on how the module is compiled. By using this function, your application has a portable stack trace that 
     *     continues to work as the compiler and operating system change.
     * 
     * The first call to this function will fail if the <b>AddrPC</b>,  
     *     <b>AddrFrame</b>, and <b>AddrStack</b> members of the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-stackframe">STACKFRAME64</a> structure passed in the 
     *     <i>StackFrame</i> parameter are not initialized.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to 
     *     this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize 
     *     all concurrent calls from more than one thread to this function.
     * @param {Integer} MachineType The architecture type of the computer for which the stack trace is generated. This parameter can be one of 
     *       the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_FILE_MACHINE_I386"></a><a id="image_file_machine_i386"></a><dl>
     * <dt><b>IMAGE_FILE_MACHINE_I386</b></dt>
     * <dt>0x014c</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Intel x86
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_FILE_MACHINE_IA64"></a><a id="image_file_machine_ia64"></a><dl>
     * <dt><b>IMAGE_FILE_MACHINE_IA64</b></dt>
     * <dt>0x0200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Intel Itanium
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IMAGE_FILE_MACHINE_AMD64"></a><a id="image_file_machine_amd64"></a><dl>
     * <dt><b>IMAGE_FILE_MACHINE_AMD64</b></dt>
     * <dt>0x8664</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * x64 (AMD64 or EM64T)
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} hProcess A handle to the process for which the stack trace is generated. If the caller supplies a valid callback 
     *       pointer for the <i>ReadMemoryRoutine</i> parameter, then this value does not have to be a 
     *       valid process handle. It can be a token that is unique and consistently the same for all calls to the 
     *       <b>StackWalkEx</b> function. If the symbol handler is used with 
     *       <b>StackWalkEx</b>, use the same process handles for the calls 
     *       to each function.
     * @param {Pointer<Void>} hThread A handle to the thread for which the stack trace is generated. If the caller supplies a valid callback 
     *       pointer for the <i>ReadMemoryRoutine</i> parameter, then this value does not have to be a 
     *       valid thread handle. It can be a token that is unique and consistently the same for all calls to the 
     *       <b>StackWalkEx</b> function.
     * @param {Pointer<STACKFRAME_EX>} StackFrame A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-stackframe_ex">STACKFRAME_EX</a> structure. This 
     *       structure receives information for the next frame, if the function call succeeds.
     * @param {Pointer<Void>} ContextRecord A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure. This parameter is 
     *        required only when the <i>MachineType</i> parameter is not 
     *        <b>IMAGE_FILE_MACHINE_I386</b>. However, it is recommended that this parameter contain a 
     *        valid context record. This allows <b>StackWalkEx</b> to handle 
     *        a greater variety of situations.
     * 
     * This context may be modified, so do not pass a context record that should not be modified.
     * @param {Pointer<PREAD_PROCESS_MEMORY_ROUTINE64>} ReadMemoryRoutine A callback routine that provides memory read services. When the 
     *        <b>StackWalkEx</b> function needs to read memory from the 
     *        process's address space, the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pread_process_memory_routine">ReadProcessMemoryProc64</a> callback is 
     *        used.
     * 
     * If this parameter is <b>NULL</b>, then the function uses a default routine. In this case, 
     *        the <i>hProcess</i> parameter must be a valid process handle.
     * 
     * If this parameter is not 
     *        <b>NULL</b>, the application should implement and register a symbol handler callback 
     *        function that handles <b>CBA_READ_MEMORY</b>.
     * @param {Pointer<PFUNCTION_TABLE_ACCESS_ROUTINE64>} FunctionTableAccessRoutine A callback routine that provides access to the run-time function table for the process. This parameter is 
     *        required because the <b>StackWalkEx</b> function does not have 
     *        access to the process's run-time function table. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pfunction_table_access_routine">FunctionTableAccessProc64</a>.
     * 
     * The symbol handler provides functions that load and access the run-time table. If these functions are used, 
     *        then <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symfunctiontableaccess">SymFunctionTableAccess64</a> can be 
     *        passed as a valid parameter.
     * @param {Pointer<PGET_MODULE_BASE_ROUTINE64>} GetModuleBaseRoutine A callback routine that provides a module base for any given virtual address. This parameter is required. 
     *        For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-pget_module_base_routine">GetModuleBaseProc64</a>.
     * 
     * The symbol handler provides functions that load and maintain module information. If these functions are used, 
     *        then <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetmodulebase">SymGetModuleBase64</a> can be passed as a valid 
     *        parameter.
     * @param {Pointer<PTRANSLATE_ADDRESS_ROUTINE64>} TranslateAddress A callback routine that provides address translation for 16-bit addresses. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-ptranslate_address_routine">TranslateAddressProc64</a>.
     * 
     * Most callers of <b>StackWalkEx</b> can safely pass 
     *        <b>NULL</b> for this parameter.
     * @param {Integer} Flags A combination of zero or more flags.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. Note that 
     *        <b>StackWalkEx</b> generally does not set the last error 
     *        code.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-stackwalkex
     */
    static StackWalkEx(MachineType, hProcess, hThread, StackFrame, ContextRecord, ReadMemoryRoutine, FunctionTableAccessRoutine, GetModuleBaseRoutine, TranslateAddress, Flags) {
        result := DllCall("dbghelp.dll\StackWalkEx", "uint", MachineType, "ptr", hProcess, "ptr", hThread, "ptr", StackFrame, "ptr", ContextRecord, "ptr", ReadMemoryRoutine, "ptr", FunctionTableAccessRoutine, "ptr", GetModuleBaseRoutine, "ptr", TranslateAddress, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Integer} MachineType 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Void>} hThread 
     * @param {Pointer<STACKFRAME_EX>} StackFrame 
     * @param {Pointer<Void>} ContextRecord 
     * @param {Pointer<PREAD_PROCESS_MEMORY_ROUTINE64>} ReadMemoryRoutine 
     * @param {Pointer<PFUNCTION_TABLE_ACCESS_ROUTINE64>} FunctionTableAccessRoutine 
     * @param {Pointer<PGET_MODULE_BASE_ROUTINE64>} GetModuleBaseRoutine 
     * @param {Pointer<PTRANSLATE_ADDRESS_ROUTINE64>} TranslateAddress 
     * @param {Pointer<PGET_TARGET_ATTRIBUTE_VALUE64>} GetTargetAttributeValue 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static StackWalk2(MachineType, hProcess, hThread, StackFrame, ContextRecord, ReadMemoryRoutine, FunctionTableAccessRoutine, GetModuleBaseRoutine, TranslateAddress, GetTargetAttributeValue, Flags) {
        result := DllCall("dbghelp.dll\StackWalk2", "uint", MachineType, "ptr", hProcess, "ptr", hThread, "ptr", StackFrame, "ptr", ContextRecord, "ptr", ReadMemoryRoutine, "ptr", FunctionTableAccessRoutine, "ptr", GetModuleBaseRoutine, "ptr", TranslateAddress, "ptr", GetTargetAttributeValue, "uint", Flags, "int")
        return result
    }

    /**
     * This class is the parent class for stack tracing events.
     * @remarks
     * The **StackWalk** class does not define any members.
     * 
     * 
     * To enable stack tracing of kernel events, call the [**TraceSetInformation**](/windows/win32/api/evntrace/nf-evntrace-tracesetinformation) function and specify the kernel events and types for which you want to capture the stack trace. To enable stack tracing for other events, set the **EnableProperty** member of [**ENABLE\_TRACE\_PARAMETERS**](/windows/win32/api/evntrace/ns-evntrace-enable_trace_parameters) to **EVENT\_ENABLE\_PROPERTY\_STACK\_TRACE**.
     * 
     * Use the following event type to identify the actual event when consuming events.
     * 
     * 
     * 
     * | Event type           | Description                                                                                                           |
     * |----------------------|-----------------------------------------------------------------------------------------------------------------------|
     * | Event type value, 32 | Stack tracing event. The [**StackWalk\_Event**](stackwalk-event.md) MOF class defines the event data for this event. |
     * @param {Integer} MachineType 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Void>} hThread 
     * @param {Pointer<STACKFRAME>} StackFrame 
     * @param {Pointer<Void>} ContextRecord 
     * @param {Pointer<PREAD_PROCESS_MEMORY_ROUTINE>} ReadMemoryRoutine 
     * @param {Pointer<PFUNCTION_TABLE_ACCESS_ROUTINE>} FunctionTableAccessRoutine 
     * @param {Pointer<PGET_MODULE_BASE_ROUTINE>} GetModuleBaseRoutine 
     * @param {Pointer<PTRANSLATE_ADDRESS_ROUTINE>} TranslateAddress 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ETW/stackwalk
     */
    static StackWalk(MachineType, hProcess, hThread, StackFrame, ContextRecord, ReadMemoryRoutine, FunctionTableAccessRoutine, GetModuleBaseRoutine, TranslateAddress) {
        result := DllCall("dbghelp.dll\StackWalk", "uint", MachineType, "ptr", hProcess, "ptr", hThread, "ptr", StackFrame, "ptr", ContextRecord, "ptr", ReadMemoryRoutine, "ptr", FunctionTableAccessRoutine, "ptr", GetModuleBaseRoutine, "ptr", TranslateAddress, "int")
        return result
    }

    /**
     * Retrieves the version information of the DbgHelp library installed on the system.
     * @remarks
     * Use the information in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-api_version">API_VERSION</a> structure to determine whether the version of the library installed on the system is compatible with the version of the library used by the application. Although the library functions are backward compatible, functions introduced in one version are obviously not available in earlier versions.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @returns {Pointer<API_VERSION>} The return value is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-api_version">API_VERSION</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-imagehlpapiversion
     */
    static ImagehlpApiVersion() {
        result := DllCall("dbghelp.dll\ImagehlpApiVersion", "ptr")
        return result
    }

    /**
     * Modifies the version information of the library used by the application.
     * @remarks
     * Use the 
     * <b>ImagehlpApiVersionEx</b> function to indicate the version of the library with which the application was built. The library uses this information to ensure compatibility. For example, consider walking through kernel-mode callback stack frames (User and GDI exist in kernel mode). If you call 
     * <b>ImagehlpApiVersionEx</b> to set the <b>Revision</b> member to version 4 or later, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-stackwalk">StackWalk64</a> function will continue through a callback stack frame. Otherwise, if you set <b>Revision</b> to a version earlier than 4, 
     * <b>StackWalk64</b> will stop at the kernel transition.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<API_VERSION>} AppVersion A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-api_version">API_VERSION</a> structure that contains valid version information for your application.
     * @returns {Pointer<API_VERSION>} The return value is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-api_version">API_VERSION</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-imagehlpapiversionex
     */
    static ImagehlpApiVersionEx(AppVersion) {
        result := DllCall("dbghelp.dll\ImagehlpApiVersionEx", "ptr", AppVersion, "ptr")
        return result
    }

    /**
     * Retrieves the time stamp of a loaded image.
     * @remarks
     * The time stamp for an image is initially set by the linker, but it can be modified by operations such as rebasing. The value is represented in the number of seconds elapsed since midnight (00:00:00), January 1, 1970, Universal Coordinated Time, according to the system clock. The time stamp can be printed using the C run-time (CRT) function ctime.
     * 
     * All <a href="https://docs.microsoft.com/windows/desktop/Debug/dbghelp-functions">DbgHelp Functions</a>, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} Module The base address of an image that is mapped into memory by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</a> function.
     * @returns {Integer} If the function succeeds, the return value is the time stamp from the image.
     * 
     * If the function fails, the return value is zero. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-gettimestampforloadedlibrary
     */
    static GetTimestampForLoadedLibrary(Module) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\GetTimestampForLoadedLibrary", "ptr", Module, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the window that the caller will use to display a user interface.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hwnd A handle to the window.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsetparentwindow
     */
    static SymSetParentWindow(hwnd) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSetParentWindow", "ptr", hwnd, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSetHomeDirectory function (dbghelp.h) sets the home directory used by Dbghelp.
     * @remarks
     * The default home directory is the directory in which Dbghelp.dll resides. Dbghelp uses this directory as a basis for other directories, such as the default downstream store directory (the sym subdirectory of the home directory).
     * 
     * The home directory used for the default symbol store and the source server cache location is stored in the DBGHELP_HOMEDIR environment variable.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} dir The home directory. This directory must be writable, otherwise the home directory is the common application directory specified with [CSIDL_COMMON_APPDATA](/windows/win32/shell/csidl). If this parameter is <b>NULL</b>, the function uses the default directory.
     * @returns {Pointer<Byte>} If the function succeeds, the return value is a pointer to the <i>dir</i> parameter.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsethomedirectory
     */
    static SymSetHomeDirectory(hProcess, dir) {
        dir := dir is String? StrPtr(dir) : dir

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSetHomeDirectory", "ptr", hProcess, "ptr", dir, "char*")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSetHomeDirectoryW (Unicode) function (dbghelp.h) sets the home directory used by Dbghelp.
     * @remarks
     * The default home directory is the directory in which Dbghelp.dll resides. Dbghelp uses this directory as a basis for other directories, such as the default downstream store directory (the sym subdirectory of the home directory).
     * 
     * The home directory used for the default symbol store and the source server cache location is stored in the DBGHELP_HOMEDIR environment variable.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymSetHomeDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Char>} dir The home directory. This directory must be writable, otherwise the home directory is the common application directory specified with [CSIDL_COMMON_APPDATA](/windows/win32/shell/csidl). If this parameter is <b>NULL</b>, the function uses the default directory.
     * @returns {Pointer<Char>} If the function succeeds, the return value is a pointer to the <i>dir</i> parameter.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsethomedirectoryw
     */
    static SymSetHomeDirectoryW(hProcess, dir) {
        dir := dir is String? StrPtr(dir) : dir

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSetHomeDirectoryW", "ptr", hProcess, "ptr", dir, "char*")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetHomeDirectory function (dbghelp.h) retrieves the home directory used by Dbghelp.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Integer} type 
     * @param {Pointer<Byte>} dir A pointer to a string that receives the directory.
     * @param {Pointer} size The size of the output buffer, in characters.
     * @returns {Pointer<Byte>} If the function succeeds, the return value is a pointer to the <i>dir</i> parameter.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgethomedirectory
     */
    static SymGetHomeDirectory(type, dir, size) {
        dir := dir is String? StrPtr(dir) : dir

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetHomeDirectory", "uint", type, "ptr", dir, "ptr", size, "char*")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetHomeDirectoryW (Unicode) function retrieves the home directory used by Dbghelp.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymGetHomeDirectory as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} type 
     * @param {Pointer<Char>} dir A pointer to a string that receives the directory.
     * @param {Pointer} size The size of the output buffer, in characters.
     * @returns {Pointer<Char>} If the function succeeds, the return value is a pointer to the <i>dir</i> parameter.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgethomedirectoryw
     */
    static SymGetHomeDirectoryW(type, dir, size) {
        dir := dir is String? StrPtr(dir) : dir

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetHomeDirectoryW", "uint", type, "ptr", dir, "ptr", size, "char*")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the omap tables within a loaded module.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Pointer<OMAP>} OmapTo An array of address map entries to the new image layout taken from the original layout. For details on the map entries, see the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-omap">OMAP</a> structure.
     * @param {Pointer<UInt64>} cOmapTo The number of entries in the <i>OmapTo</i> array.
     * @param {Pointer<OMAP>} OmapFrom An array of address map entries from the new image layout to the original layout (as described by the debug symbols). For details on the map entries, see the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-omap">OMAP</a> structure.
     * @param {Pointer<UInt64>} cOmapFrom The number of entries in the <i>OmapFrom</i> array.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails (the omap is not found), the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetomaps
     */
    static SymGetOmaps(hProcess, BaseOfDll, OmapTo, cOmapTo, OmapFrom, cOmapFrom) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetOmaps", "ptr", hProcess, "uint", BaseOfDll, "ptr", OmapTo, "uint*", cOmapTo, "ptr", OmapFrom, "uint*", cOmapFrom, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the options mask.
     * @remarks
     * The options value can be changed any number of times while the library is in use by an application. The option change affects all future calls to the symbol handler.
     * 
     * To get the current options mask, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetoptions">SymGetOptions</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Integer} SymOptions The symbol options. Zero is a valid value and indicates that all options are turned off. The options values are combined using the OR operator to form a valid options value. The following are valid values. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_ALLOW_ABSOLUTE_SYMBOLS"></a><a id="symopt_allow_absolute_symbols"></a><dl>
     * <dt><b>SYMOPT_ALLOW_ABSOLUTE_SYMBOLS</b></dt>
     * <dt>0x00000800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables the use of symbols that are stored with absolute addresses. Most symbols are stored as RVAs from the base of the module. DbgHelp translates them to absolute addresses. There are symbols that are stored as an absolute address. These have very specialized purposes and are typically not used.
     * 
     * <b>DbgHelp 5.1 and earlier:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_ALLOW_ZERO_ADDRESS"></a><a id="symopt_allow_zero_address"></a><dl>
     * <dt><b>SYMOPT_ALLOW_ZERO_ADDRESS</b></dt>
     * <dt>0x01000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables the use of symbols that do not have an address. By default, DbgHelp filters out symbols that do not have an address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_AUTO_PUBLICS"></a><a id="symopt_auto_publics"></a><dl>
     * <dt><b>SYMOPT_AUTO_PUBLICS</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not search the public symbols when searching for symbols by address, or when enumerating symbols, unless they were not found in the global symbols or within the current scope. This option has no effect with <b>SYMOPT_PUBLICS_ONLY</b>.
     * 
     * <b>DbgHelp 5.1 and earlier:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_CASE_INSENSITIVE"></a><a id="symopt_case_insensitive"></a><dl>
     * <dt><b>SYMOPT_CASE_INSENSITIVE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All symbol searches are insensitive to case.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_DEBUG"></a><a id="symopt_debug"></a><dl>
     * <dt><b>SYMOPT_DEBUG</b></dt>
     * <dt>0x80000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pass debug output through <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-outputdebugstringw">OutputDebugString</a> or the  <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psymbol_registered_callback">SymRegisterCallbackProc64</a> callback function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_DEFERRED_LOADS"></a><a id="symopt_deferred_loads"></a><dl>
     * <dt><b>SYMOPT_DEFERRED_LOADS</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Symbols are not loaded until a reference is made requiring the symbols be loaded. This is the fastest, most efficient way to use the symbol handler.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_DISABLE_SYMSRV_AUTODETECT"></a><a id="symopt_disable_symsrv_autodetect"></a><dl>
     * <dt><b>SYMOPT_DISABLE_SYMSRV_AUTODETECT</b></dt>
     * <dt>0x02000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables the auto-detection of symbol server stores in the symbol path, even without the "SRV*" designation, maintaining compatibility with previous behavior.
     * 
     * <b>DbgHelp 6.6 and earlier:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_EXACT_SYMBOLS"></a><a id="symopt_exact_symbols"></a><dl>
     * <dt><b>SYMOPT_EXACT_SYMBOLS</b></dt>
     * <dt>0x00000400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not load an unmatched .pdb file. Do not load export symbols if all else fails.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_FAIL_CRITICAL_ERRORS"></a><a id="symopt_fail_critical_errors"></a><dl>
     * <dt><b>SYMOPT_FAIL_CRITICAL_ERRORS</b></dt>
     * <dt>0x00000200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not display system dialog boxes when there is a media failure such as no media in a drive. Instead, the failure happens silently.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_FAVOR_COMPRESSED"></a><a id="symopt_favor_compressed"></a><dl>
     * <dt><b>SYMOPT_FAVOR_COMPRESSED</b></dt>
     * <dt>0x00800000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If there is both an uncompressed and a compressed file available, favor the compressed file. This option is good for slow connections.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_FLAT_DIRECTORY"></a><a id="symopt_flat_directory"></a><dl>
     * <dt><b>SYMOPT_FLAT_DIRECTORY</b></dt>
     * <dt>0x00400000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Symbols are stored in the root directory of the default downstream store.
     * 
     * <b>DbgHelp 6.1 and earlier:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_IGNORE_CVREC"></a><a id="symopt_ignore_cvrec"></a><dl>
     * <dt><b>SYMOPT_IGNORE_CVREC</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore path information in the CodeView record of the image header when loading a .pdb file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_IGNORE_IMAGEDIR"></a><a id="symopt_ignore_imagedir"></a><dl>
     * <dt><b>SYMOPT_IGNORE_IMAGEDIR</b></dt>
     * <dt>0x00200000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore the image directory.
     * 
     * <b>DbgHelp 6.1 and earlier:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_IGNORE_NT_SYMPATH"></a><a id="symopt_ignore_nt_sympath"></a><dl>
     * <dt><b>SYMOPT_IGNORE_NT_SYMPATH</b></dt>
     * <dt>0x00001000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not use the path specified by <b>_NT_SYMBOL_PATH</b> if the user calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> without a valid path.
     * 
     * <b>DbgHelp 5.1:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_INCLUDE_32BIT_MODULES"></a><a id="symopt_include_32bit_modules"></a><dl>
     * <dt><b>SYMOPT_INCLUDE_32BIT_MODULES</b></dt>
     * <dt>0x00002000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When debugging on 64-bit Windows, include any 32-bit modules.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_LOAD_ANYTHING"></a><a id="symopt_load_anything"></a><dl>
     * <dt><b>SYMOPT_LOAD_ANYTHING</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable checks to ensure a file (.exe, .dbg., or .pdb) is the correct file. Instead, load the first file located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_LOAD_LINES"></a><a id="symopt_load_lines"></a><dl>
     * <dt><b>SYMOPT_LOAD_LINES</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Loads line number information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_NO_CPP"></a><a id="symopt_no_cpp"></a><dl>
     * <dt><b>SYMOPT_NO_CPP</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All C++ decorated symbols containing the symbol separator "::" are replaced by "__". This option exists for debuggers that cannot handle parsing real C++ symbol names.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_NO_IMAGE_SEARCH"></a><a id="symopt_no_image_search"></a><dl>
     * <dt><b>SYMOPT_NO_IMAGE_SEARCH</b></dt>
     * <dt>0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not search the image for the symbol path when loading the symbols for a module if the module header cannot be read.
     * 
     * <b>DbgHelp 5.1:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_NO_PROMPTS"></a><a id="symopt_no_prompts"></a><dl>
     * <dt><b>SYMOPT_NO_PROMPTS</b></dt>
     * <dt>0x00080000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prevents prompting for validation from the symbol server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_NO_PUBLICS"></a><a id="symopt_no_publics"></a><dl>
     * <dt><b>SYMOPT_NO_PUBLICS</b></dt>
     * <dt>0x00008000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not search the publics table for symbols. This option should have little effect because there are copies of the public symbols in the globals table.
     * 
     * <b>DbgHelp 5.1:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_NO_UNQUALIFIED_LOADS"></a><a id="symopt_no_unqualified_loads"></a><dl>
     * <dt><b>SYMOPT_NO_UNQUALIFIED_LOADS</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prevents symbols from being loaded when the caller examines symbols across multiple modules. Examine only the module whose symbols have already been loaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_OVERWRITE"></a><a id="symopt_overwrite"></a><dl>
     * <dt><b>SYMOPT_OVERWRITE</b></dt>
     * <dt>0x00100000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Overwrite the downlevel store from the symbol store.
     * 
     * <b>DbgHelp 6.1 and earlier:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_PUBLICS_ONLY"></a><a id="symopt_publics_only"></a><dl>
     * <dt><b>SYMOPT_PUBLICS_ONLY</b></dt>
     * <dt>0x00004000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not use private symbols. The version of DbgHelp that shipped with earlier Windows release supported only public symbols; this option provides compatibility with this limitation.
     * 
     * <b>DbgHelp 5.1:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_SECURE"></a><a id="symopt_secure"></a><dl>
     * <dt><b>SYMOPT_SECURE</b></dt>
     * <dt>0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DbgHelp will not load any symbol server other than SymSrv. SymSrv will not use the downstream store specified in <b>_NT_SYMBOL_PATH</b>. After this flag has been set, it cannot be cleared.
     * 
     * <b>DbgHelp 6.0 and 6.1:  </b>This flag can be cleared.
     * 
     * <b>DbgHelp 5.1:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_UNDNAME"></a><a id="symopt_undname"></a><dl>
     * <dt><b>SYMOPT_UNDNAME</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All symbols are presented in undecorated form. 
     * 
     * 
     * 
     * 
     * This option has no effect on global or local symbols because they are stored undecorated. This option applies only to public symbols.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} The function returns the current options mask.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsetoptions
     */
    static SymSetOptions(SymOptions) {
        result := DllCall("dbghelp.dll\SymSetOptions", "uint", SymOptions, "uint")
        return result
    }

    /**
     * Retrieves the current option mask.
     * @remarks
     * These options can be changed several times while the library is in use by an application. Any option change affects all future calls to the symbol handler.
     * 
     * The return value is the combination of the 
     * following values that have been set using the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetoptions">SymSetOptions</a> function.
     * 
     * <ul>
     * <li>SYMOPT_ALLOW_ABSOLUTE_SYMBOLS</li>
     * <li>SYMOPT_ALLOW_ZERO_ADDRESS</li>
     * <li>SYMOPT_AUTO_PUBLICS</li>
     * <li>SYMOPT_CASE_INSENSITIVE</li>
     * <li>SYMOPT_DEBUG</li>
     * <li>SYMOPT_DEFERRED_LOADS</li>
     * <li>SYMOPT_EXACT_SYMBOLS</li>
     * <li>SYMOPT_FAIL_CRITICAL_ERRORS</li>
     * <li>SYMOPT_FAVOR_COMPRESSED</li>
     * <li>SYMOPT_FLAT_DIRECTORY</li>
     * <li>SYMOPT_IGNORE_CVREC</li>
     * <li>SYMOPT_IGNORE_IMAGEDIR</li>
     * <li>SYMOPT_IGNORE_NT_SYMPATH</li>
     * <li>SYMOPT_INCLUDE_32BIT_MODULES</li>
     * <li>SYMOPT_LOAD_ANYTHING</li>
     * <li>SYMOPT_LOAD_LINES</li>
     * <li>SYMOPT_NO_CPP</li>
     * <li>SYMOPT_NO_IMAGE_SEARCH</li>
     * <li>SYMOPT_NO_PROMPTS</li>
     * <li>SYMOPT_NO_PUBLICS</li>
     * <li>SYMOPT_NO_UNQUALIFIED_LOADS</li>
     * <li>SYMOPT_OVERWRITE</li>
     * <li>SYMOPT_PUBLICS_ONLY</li>
     * <li>SYMOPT_SECURE</li>
     * <li>SYMOPT_UNDNAME</li>
     * </ul>
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @returns {Integer} The 
     * function returns the current options that have been set. Zero is a valid value and indicates that all options are turned off.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetoptions
     */
    static SymGetOptions() {
        result := DllCall("dbghelp.dll\SymGetOptions", "uint")
        return result
    }

    /**
     * Deallocates all resources associated with the process handle.
     * @remarks
     * This function frees all resources associated with the process handle. Failure to call this function causes memory and resource leaks in the calling application
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> only when your process starts and 
     * <b>SymCleanup</b> only when your process ends. It is not necessary for each thread in the process to call these functions.
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symcleanup
     */
    static SymCleanup(hProcess) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymCleanup", "ptr", hProcess, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets whether the specified extended symbol option on or off.
     * @param {Integer} option The extended symbol option to check. The following are valid values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_EX_DISABLEACCESSTIMEUPDATE"></a><a id="symopt_ex_disableaccesstimeupdate"></a><dl>
     * <dt><b>SYMOPT_EX_DISABLEACCESSTIMEUPDATE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Turns off explicit updates to the last access time of a symbol that is loaded. By default, DbgHelp updates the last access time of a symbol file that is consumed so that a symbol cache can be maintained by using a least recently used mechanism.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} The value of the specified symbol option.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetextendedoption
     */
    static SymGetExtendedOption(option) {
        result := DllCall("dbghelp.dll\SymGetExtendedOption", "int", option, "int")
        return result
    }

    /**
     * Turns the specified extended symbol option on or off.
     * @param {Integer} option The extended symbol option to turn on or off. The following are valid values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMOPT_EX_DISABLEACCESSTIMEUPDATE"></a><a id="symopt_ex_disableaccesstimeupdate"></a><dl>
     * <dt><b>SYMOPT_EX_DISABLEACCESSTIMEUPDATE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to TRUE, turns off explicitly updating the last access time of a symbol that is loaded. By default, DbgHelp updates the last access time of a symbol file that is consumed so that a symbol cache can be maintained by using a least recently used mechanism.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} value The value to set for the specified option, either TRUE or FALSE.
     * @returns {Integer} The previous value of the specified extended option.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsetextendedoption
     */
    static SymSetExtendedOption(option, value) {
        result := DllCall("dbghelp.dll\SymSetExtendedOption", "int", option, "int", value, "int")
        return result
    }

    /**
     * The SymMatchString function (dbghelp.h) compares the specified string to the specified wildcard expression.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Byte>} string The string, such as a symbol name, to be compared to the <i>expression</i> parameter.
     * @param {Pointer<Byte>} expression The wildcard expression to compare to the <i>string</i> parameter.  The wildcard expression supports the inclusion of the * and ? characters.  * matches any string and ? matches any single character.
     * @param {Integer} fCase A variable that indicates whether or not the comparison is to be case sensitive.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symmatchstring
     */
    static SymMatchString(string, expression, fCase) {
        string := string is String? StrPtr(string) : string
        expression := expression is String? StrPtr(expression) : expression

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymMatchString", "ptr", string, "ptr", expression, "int", fCase, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Compares the specified string to the specified wildcard expression. (SymMatchStringA)
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymMatchString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} string The string, such as a symbol name, to be compared to the <i>expression</i> parameter.
     * @param {Pointer<Byte>} expression The wildcard expression to compare to the <i>string</i> parameter. The wildcard expression supports the inclusion of the * and ? characters. * matches any string and ? matches any single character.
     * @param {Integer} fCase A variable that indicates whether or not the comparison is to be case sensitive.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.  
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symmatchstringa
     */
    static SymMatchStringA(string, expression, fCase) {
        string := string is String? StrPtr(string) : string
        expression := expression is String? StrPtr(expression) : expression

        result := DllCall("dbghelp.dll\SymMatchStringA", "ptr", string, "ptr", expression, "int", fCase, "int")
        return result
    }

    /**
     * The SymMatchStringW (Unicode) function compares the specified string to the specified wildcard expression.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymMatchString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} string The string, such as a symbol name, to be compared to the <i>expression</i> parameter.
     * @param {Pointer<Char>} expression The wildcard expression to compare to the <i>string</i> parameter.  The wildcard expression supports the inclusion of the * and ? characters.  * matches any string and ? matches any single character.
     * @param {Integer} fCase A variable that indicates whether or not the comparison is to be case sensitive.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symmatchstringw
     */
    static SymMatchStringW(string, expression, fCase) {
        string := string is String? StrPtr(string) : string
        expression := expression is String? StrPtr(expression) : expression

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymMatchStringW", "ptr", string, "ptr", expression, "int", fCase, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumSourceFiles function (dbghelp.h) enumerates all source files in a process.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} ModBase The base address of the module. If this value is zero and <i>Mask</i> contains an exclamation point (!), the function looks across modules. If this value is zero and <i>Mask</i> does not contain an exclamation point, the function uses the scope established by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * @param {Pointer<Byte>} Mask A wildcard expression that indicates the names of the source files to be enumerated. To specify a module name, use the !<i>mod</i> syntax.
     * 
     * If this parameter is <b>NULL</b>, the function will enumerate all files.
     * @param {Pointer<PSYM_ENUMSOURCEFILES_CALLBACK>} cbSrcFiles Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumsourcefiles_callback">SymEnumSourceFilesProc</a> callback function that receives the source file information.
     * @param {Pointer<Void>} UserContext User-defined value that is passed to the callback function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumsourcefiles
     */
    static SymEnumSourceFiles(hProcess, ModBase, Mask, cbSrcFiles, UserContext) {
        Mask := Mask is String? StrPtr(Mask) : Mask

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumSourceFiles", "ptr", hProcess, "uint", ModBase, "ptr", Mask, "ptr", cbSrcFiles, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumSourceFilesW (Unicode) function enumerates all source files in a process.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymEnumSourceFiles as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} ModBase The base address of the module. If this value is zero and <i>Mask</i> contains an exclamation point (!), the function looks across modules. If this value is zero and <i>Mask</i> does not contain an exclamation point, the function uses the scope established by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * @param {Pointer<Char>} Mask A wildcard expression that indicates the names of the source files to be enumerated. To specify a module name, use the !<i>mod</i> syntax.
     * 
     * If this parameter is <b>NULL</b>, the function will enumerate all files.
     * @param {Pointer<PSYM_ENUMSOURCEFILES_CALLBACKW>} cbSrcFiles Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumsourcefiles_callback">SymEnumSourceFilesProc</a> callback function that receives the source file information.
     * @param {Pointer<Void>} UserContext User-defined value that is passed to the callback function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumsourcefilesw
     */
    static SymEnumSourceFilesW(hProcess, ModBase, Mask, cbSrcFiles, UserContext) {
        Mask := Mask is String? StrPtr(Mask) : Mask

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumSourceFilesW", "ptr", hProcess, "uint", ModBase, "ptr", Mask, "ptr", cbSrcFiles, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates all modules that have been loaded for the process by the SymLoadModule64 or SymLoadModuleEx function. (SymEnumerateModules64)
     * @remarks
     * The 
     * <b>SymEnumerateModules64</b> function enumerates all modules that have been loaded for the process by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a>, even if the symbol loading is deferred. The enumeration callback function is called once for each module and is passed the module information.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymEnumerateModulesW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymEnumerateModulesW64(
     *     __in HANDLE hProcess,
     *     __in PSYM_ENUMMODULES_CALLBACKW64 EnumModulesCallback,
     *     __in_opt PVOID UserContext
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<PSYM_ENUMMODULES_CALLBACK64>} EnumModulesCallback The enumeration callback function. This function is called once per module. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enummodules_callback">SymEnumerateModulesProc64</a>.
     * @param {Pointer<Void>} UserContext A user-defined value or <b>NULL</b>. This value is simply passed to the callback function. Normally, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some type of context.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumeratemodules64
     */
    static SymEnumerateModules64(hProcess, EnumModulesCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumerateModules64", "ptr", hProcess, "ptr", EnumModulesCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates all modules that have been loaded for the process by the SymLoadModule64 or SymLoadModuleEx function. (SymEnumerateModulesW64)
     * @remarks
     * The 
     * <b>SymEnumerateModules64</b> function enumerates all modules that have been loaded for the process by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a>, even if the symbol loading is deferred. The enumeration callback function is called once for each module and is passed the module information.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymEnumerateModulesW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymEnumerateModulesW64(
     *     __in HANDLE hProcess,
     *     __in PSYM_ENUMMODULES_CALLBACKW64 EnumModulesCallback,
     *     __in_opt PVOID UserContext
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<PSYM_ENUMMODULES_CALLBACKW64>} EnumModulesCallback The enumeration callback function. This function is called once per module. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enummodules_callback">SymEnumerateModulesProc64</a>.
     * @param {Pointer<Void>} UserContext A user-defined value or <b>NULL</b>. This value is simply passed to the callback function. Normally, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some type of context.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumeratemodulesw64
     */
    static SymEnumerateModulesW64(hProcess, EnumModulesCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumerateModulesW64", "ptr", hProcess, "ptr", EnumModulesCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates all modules that have been loaded for the process by the SymLoadModule64 or SymLoadModuleEx function. (SymEnumerateModules)
     * @remarks
     * The 
     * <b>SymEnumerateModules64</b> function enumerates all modules that have been loaded for the process by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a>, even if the symbol loading is deferred. The enumeration callback function is called once for each module and is passed the module information.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymEnumerateModulesW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymEnumerateModulesW64(
     *     __in HANDLE hProcess,
     *     __in PSYM_ENUMMODULES_CALLBACKW64 EnumModulesCallback,
     *     __in_opt PVOID UserContext
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<PSYM_ENUMMODULES_CALLBACK>} EnumModulesCallback The enumeration callback function. This function is called once per module. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enummodules_callback">SymEnumerateModulesProc64</a>.
     * @param {Pointer<Void>} UserContext A user-defined value or <b>NULL</b>. This value is simply passed to the callback function. Normally, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some type of context.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumeratemodules
     */
    static SymEnumerateModules(hProcess, EnumModulesCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumerateModules", "ptr", hProcess, "ptr", EnumModulesCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The EnumerateLoadedModulesEx function (dbghelp.h) enumerates the loaded modules for the specified process.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to the process whose modules will be enumerated.
     * @param {Pointer<PENUMLOADED_MODULES_CALLBACK64>} EnumLoadedModulesCallback An application-defined callback function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-penumloaded_modules_callback">EnumerateLoadedModulesProc64</a>.
     * @param {Pointer<Void>} UserContext Optional user-defined data. This value is passed to the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-enumerateloadedmodulesex
     */
    static EnumerateLoadedModulesEx(hProcess, EnumLoadedModulesCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\EnumerateLoadedModulesEx", "ptr", hProcess, "ptr", EnumLoadedModulesCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The EnumerateLoadedModulesExW (Unicode) function enumerates the loaded modules for the specified process.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines EnumerateLoadedModulesEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to the process whose modules will be enumerated.
     * @param {Pointer<PENUMLOADED_MODULES_CALLBACKW64>} EnumLoadedModulesCallback An application-defined callback function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-penumloaded_modules_callback">EnumerateLoadedModulesProc64</a>.
     * @param {Pointer<Void>} UserContext Optional user-defined data. This value is passed to the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-enumerateloadedmodulesexw
     */
    static EnumerateLoadedModulesExW(hProcess, EnumLoadedModulesCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\EnumerateLoadedModulesExW", "ptr", hProcess, "ptr", EnumLoadedModulesCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the loaded modules for the specified process. (EnumerateLoadedModules64)
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, <i>EnumerateLoadedModulesW64</i>, define <b>DBGHELP_TRANSLATE_TCHAR</b>. <i>EnumerateLoadedModulesW64</i> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * EnumerateLoadedModulesW64(
     *     __in HANDLE hProcess,
     *     __in PENUMLOADED_MODULES_CALLBACKW64 EnumLoadedModulesCallback,
     *     __in PVOID UserContext
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process whose modules will be enumerated.
     * @param {Pointer<PENUMLOADED_MODULES_CALLBACK64>} EnumLoadedModulesCallback An application-defined callback function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-penumloaded_modules_callback">EnumerateLoadedModulesProc64</a>.
     * @param {Pointer<Void>} UserContext Optional user-defined data. This value is passed to the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-enumerateloadedmodules64
     */
    static EnumerateLoadedModules64(hProcess, EnumLoadedModulesCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\EnumerateLoadedModules64", "ptr", hProcess, "ptr", EnumLoadedModulesCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the loaded modules for the specified process. (EnumerateLoadedModulesW64)
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, <i>EnumerateLoadedModulesW64</i>, define <b>DBGHELP_TRANSLATE_TCHAR</b>. <i>EnumerateLoadedModulesW64</i> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * EnumerateLoadedModulesW64(
     *     __in HANDLE hProcess,
     *     __in PENUMLOADED_MODULES_CALLBACKW64 EnumLoadedModulesCallback,
     *     __in PVOID UserContext
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process whose modules will be enumerated.
     * @param {Pointer<PENUMLOADED_MODULES_CALLBACKW64>} EnumLoadedModulesCallback An application-defined callback function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-penumloaded_modules_callback">EnumerateLoadedModulesProc64</a>.
     * @param {Pointer<Void>} UserContext Optional user-defined data. This value is passed to the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-enumerateloadedmodulesw64
     */
    static EnumerateLoadedModulesW64(hProcess, EnumLoadedModulesCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\EnumerateLoadedModulesW64", "ptr", hProcess, "ptr", EnumLoadedModulesCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the loaded modules for the specified process. (EnumerateLoadedModules)
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, <i>EnumerateLoadedModulesW64</i>, define <b>DBGHELP_TRANSLATE_TCHAR</b>. <i>EnumerateLoadedModulesW64</i> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * EnumerateLoadedModulesW64(
     *     __in HANDLE hProcess,
     *     __in PENUMLOADED_MODULES_CALLBACKW64 EnumLoadedModulesCallback,
     *     __in PVOID UserContext
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process whose modules will be enumerated.
     * @param {Pointer<PENUMLOADED_MODULES_CALLBACK>} EnumLoadedModulesCallback An application-defined callback function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-penumloaded_modules_callback">EnumerateLoadedModulesProc64</a>.
     * @param {Pointer<Void>} UserContext Optional user-defined data. This value is passed to the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-enumerateloadedmodules
     */
    static EnumerateLoadedModules(hProcess, EnumLoadedModulesCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\EnumerateLoadedModules", "ptr", hProcess, "ptr", EnumLoadedModulesCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the function table entry for the specified address. (SymFunctionTableAccess64)
     * @remarks
     * The type of pointer returned is specific to the image from which symbols are loaded. 
     * 
     * <b>x86:  </b>If the image is for an x86 system, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-fpo_data">FPO_DATA</a> structure.
     * 
     * <b>x64:  </b>If the image is for an x64 system, this is a pointer to an <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-runtime_function">_IMAGE_RUNTIME_FUNCTION_ENTRY</a> structure.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymFunctionTableAccess</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymFunctionTableAccess</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} AddrBase The base address for which function table information is required.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the function table entry.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfunctiontableaccess64
     */
    static SymFunctionTableAccess64(hProcess, AddrBase) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFunctionTableAccess64", "ptr", hProcess, "uint", AddrBase)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Finds a function table entry or frame pointer omission (FPO) record for an address.
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} AddrBase The base address for which function table information is required.
     * @param {Pointer<PREAD_PROCESS_MEMORY_ROUTINE64>} ReadMemoryRoutine Pointer to a read memory callback function.
     * @param {Pointer<PGET_MODULE_BASE_ROUTINE64>} GetModuleBaseRoutine Pointer to a get module base callback function.
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfunctiontableaccess64accessroutines
     */
    static SymFunctionTableAccess64AccessRoutines(hProcess, AddrBase, ReadMemoryRoutine, GetModuleBaseRoutine) {
        result := DllCall("dbghelp.dll\SymFunctionTableAccess64AccessRoutines", "ptr", hProcess, "uint", AddrBase, "ptr", ReadMemoryRoutine, "ptr", GetModuleBaseRoutine)
        return result
    }

    /**
     * Retrieves the function table entry for the specified address. (SymFunctionTableAccess)
     * @remarks
     * The type of pointer returned is specific to the image from which symbols are loaded. 
     * 
     * <b>x86:  </b>If the image is for an x86 system, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-fpo_data">FPO_DATA</a> structure.
     * 
     * <b>x64:  </b>If the image is for an x64 system, this is a pointer to an <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-runtime_function">_IMAGE_RUNTIME_FUNCTION_ENTRY</a> structure.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymFunctionTableAccess</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymFunctionTableAccess</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} AddrBase The base address for which function table information is required.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a pointer to the function table entry.
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfunctiontableaccess
     */
    static SymFunctionTableAccess(hProcess, AddrBase) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFunctionTableAccess", "ptr", hProcess, "uint", AddrBase)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Integer} Address 
     * @param {Pointer} Buffer 
     * @param {Pointer<UInt32>} Size 
     * @returns {Integer} 
     */
    static SymGetUnwindInfo(hProcess, Address, Buffer, Size) {
        result := DllCall("dbghelp.dll\SymGetUnwindInfo", "ptr", hProcess, "uint", Address, "ptr", Buffer, "uint*", Size, "int")
        return result
    }

    /**
     * Retrieves the module information of the specified module. (SymGetModuleInfo64)
     * @remarks
     * The module table is searched for a module that contains the <i>dwAddr</i>. The module is located based on the load address and size of each module. If a valid module is found, the <i>ModuleInfo</i> parameter is filled with the information about the module.
     * 
     * The size of the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_module">IMAGEHLP_MODULE64</a> structure used by this function has changed over the years.  If a version of DbgHelp.dll is called that is older than the DbgHelp.h used to compile the calling code, then this function may fail with an error code of <b>ERROR_INVALID_PARAMETER</b>.  This most commonly occurs when the system version (%WinDir%\System32\DbgHelp.dll) is called.  Code that calls the system version of DbgHelp.dll must be compiled using the appropriate SDK for that Windows release or the SDK for a previous release.  
     * 
     * The recommended model is to redistribute the required version of DbgHelp.dll along with the calling software.  This allows the caller to use the most robust versions of DbgHelp.dll as well as a simplifying upgrades.  The most recent version of DbgHelp.dll can always be found in the <a href="https://docs.microsoft.com/windows-hardware/drivers/debugger/">Debugging Tools for Windows</a> package.  As a general rule, code that is compiled to work with older versions will always work with newer versions.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define <b>DBGHELP_TRANSLATE_TCHAR</b>. <b>SymGetModuleInfoW64</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymGetModuleInfoW64(
     *     __in HANDLE hProcess,
     *     __in DWORD64 qwAddr,
     *     __out PIMAGEHLP_MODULEW64 ModuleInfo
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} qwAddr The virtual address that is contained in one of the modules loaded by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a> function.
     * @param {Pointer<IMAGEHLP_MODULE64>} ModuleInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_module">IMAGEHLP_MODULE64</a> structure. The <b>SizeOfStruct</b> member must be set to the size of the 
     * <b>IMAGEHLP_MODULE64</b> structure. An invalid value will result in an error.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetmoduleinfo64
     */
    static SymGetModuleInfo64(hProcess, qwAddr, ModuleInfo) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetModuleInfo64", "ptr", hProcess, "uint", qwAddr, "ptr", ModuleInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the module information of the specified module. (SymGetModuleInfoW64)
     * @remarks
     * The module table is searched for a module that contains the <i>dwAddr</i>. The module is located based on the load address and size of each module. If a valid module is found, the <i>ModuleInfo</i> parameter is filled with the information about the module.
     * 
     * The size of the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_modulew64">IMAGEHLP_MODULEW64</a> structure used by this function has changed over the years.  If a version of DbgHelp.dll is called that is older than the DbgHelp.h used to compile the calling code, then this function may fail with an error code of <b>ERROR_INVALID_PARAMETER</b>.  This most commonly occurs when the system version (%WinDir%\System32\DbgHelp.dll) is called.  Code that calls the system version of DbgHelp.dll must be compiled using the appropriate SDK for that Windows release or the SDK for a previous release.  
     * 
     * The recommended model is to redistribute the required version of DbgHelp.dll along with the calling software.  This allows the caller to use the most robust versions of DbgHelp.dll as well as a simplifying upgrades.  The most recent version of DbgHelp.dll can always be found in the <a href="https://docs.microsoft.com/windows-hardware/drivers/debugger/">Debugging Tools for Windows</a> package.  As a general rule, code that is compiled to work with older versions will always work with newer versions.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define <b>DBGHELP_TRANSLATE_TCHAR</b>. <b>SymGetModuleInfoW64</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymGetModuleInfoW64(
     *     __in HANDLE hProcess,
     *     __in DWORD64 qwAddr,
     *     __out PIMAGEHLP_MODULEW64 ModuleInfo
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} qwAddr The virtual address that is contained in one of the modules loaded by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a> function.
     * @param {Pointer<IMAGEHLP_MODULEW64>} ModuleInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_modulew64">IMAGEHLP_MODULEW64</a> structure. The <b>SizeOfStruct</b> member must be set to the size of the 
     * <b>IMAGEHLP_MODULEW64</b> structure. An invalid value will result in an error.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetmoduleinfow64
     */
    static SymGetModuleInfoW64(hProcess, qwAddr, ModuleInfo) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetModuleInfoW64", "ptr", hProcess, "uint", qwAddr, "ptr", ModuleInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetModuleInfo function (dbghelp.h) retrieves the module information of the specified module.
     * @remarks
     * The module table is searched for a module that contains the <i>dwAddr</i>. The module is located based on the load address and size of each module. If a valid module is found, the <i>ModuleInfo</i> parameter is filled with the information about the module.
     * 
     * The size of the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_module">IMAGEHLP_MODULE64</a> structure used by this function has changed over the years.  If a version of DbgHelp.dll is called that is older than the DbgHelp.h used to compile the calling code, then this function may fail with an error code of <b>ERROR_INVALID_PARAMETER</b>.  This most commonly occurs when the system version (%WinDir%\System32\DbgHelp.dll) is called.  Code that calls the system version of DbgHelp.dll must be compiled using the appropriate SDK for that Windows release or the SDK for a previous release.  
     * 
     * The recommended model is to redistribute the required version of DbgHelp.dll along with the calling software.  This allows the caller to use the most robust versions of DbgHelp.dll as well as a simplifying upgrades.  The most recent version of DbgHelp.dll can always be found in the <a href="https://docs.microsoft.com/windows-hardware/drivers/debugger/">Debugging Tools for Windows</a> package.  As a general rule, code that is compiled to work with older versions will always work with newer versions.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define <b>DBGHELP_TRANSLATE_TCHAR</b>. <b>SymGetModuleInfoW64</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymGetModuleInfoW64(
     *     __in HANDLE hProcess,
     *     __in DWORD64 qwAddr,
     *     __out PIMAGEHLP_MODULEW64 ModuleInfo
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} dwAddr The virtual address that is contained in one of the modules loaded by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a> function
     * @param {Pointer<IMAGEHLP_MODULE>} ModuleInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_module">IMAGEHLP_MODULE64</a> structure. The <b>SizeOfStruct</b> member must be set to the size of the 
     * <b>IMAGEHLP_MODULE64</b> structure. An invalid value will result in an error.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetmoduleinfo
     */
    static SymGetModuleInfo(hProcess, dwAddr, ModuleInfo) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetModuleInfo", "ptr", hProcess, "uint", dwAddr, "ptr", ModuleInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the module information of the specified module. (SymGetModuleInfoW)
     * @remarks
     * The module table is searched for a module that contains the <i>dwAddr</i>. The module is located based on the load address and size of each module. If a valid module is found, the <i>ModuleInfo</i> parameter is filled with the information about the module.
     * 
     * The size of the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_module">IMAGEHLP_MODULE64</a> structure used by this function has changed over the years.  If a version of DbgHelp.dll is called that is older than the DbgHelp.h used to compile the calling code, then this function may fail with an error code of <b>ERROR_INVALID_PARAMETER</b>.  This most commonly occurs when the system version (%WinDir%\System32\DbgHelp.dll) is called.  Code that calls the system version of DbgHelp.dll must be compiled using the appropriate SDK for that Windows release or the SDK for a previous release.  
     * 
     * The recommended model is to redistribute the required version of DbgHelp.dll along with the calling software.  This allows the caller to use the most robust versions of DbgHelp.dll as well as a simplifying upgrades.  The most recent version of DbgHelp.dll can always be found in the <a href="https://docs.microsoft.com/windows-hardware/drivers/debugger/">Debugging Tools for Windows</a> package.  As a general rule, code that is compiled to work with older versions will always work with newer versions.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define <b>DBGHELP_TRANSLATE_TCHAR</b>. <b>SymGetModuleInfoW64</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymGetModuleInfoW64(
     *     __in HANDLE hProcess,
     *     __in DWORD64 qwAddr,
     *     __out PIMAGEHLP_MODULEW64 ModuleInfo
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} dwAddr The virtual address that is contained in one of the modules loaded by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a> function
     * @param {Pointer<IMAGEHLP_MODULEW>} ModuleInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_module">IMAGEHLP_MODULE64</a> structure. The <b>SizeOfStruct</b> member must be set to the size of the 
     * <b>IMAGEHLP_MODULE64</b> structure. An invalid value will result in an error.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetmoduleinfow
     */
    static SymGetModuleInfoW(hProcess, dwAddr, ModuleInfo) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetModuleInfoW", "ptr", hProcess, "uint", dwAddr, "ptr", ModuleInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the base address of the module that contains the specified address. (SymGetModuleBase64)
     * @remarks
     * The module table is searched for a module that contains <i>dwAddr</i>. The module is located based on the load address and size of each module.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymGetModuleBase</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymGetModuleBase</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} qwAddr The virtual address that is contained in one of the modules loaded by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a> function.
     * @returns {Integer} If the function succeeds, the return value is a nonzero virtual address. The value is the base address of the module containing the address specified by the <i>dwAddr</i> parameter.
     * 
     * If the function fails, the return value is zero. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetmodulebase64
     */
    static SymGetModuleBase64(hProcess, qwAddr) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetModuleBase64", "ptr", hProcess, "uint", qwAddr, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the base address of the module that contains the specified address. (SymGetModuleBase)
     * @remarks
     * The module table is searched for a module that contains <i>dwAddr</i>. The module is located based on the load address and size of each module.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymGetModuleBase</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymGetModuleBase</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} dwAddr The virtual address that is contained in one of the modules loaded by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a> function.
     * @returns {Integer} If the function succeeds, the return value is a nonzero virtual address. The value is the base address of the module containing the address specified by the <i>dwAddr</i> parameter.
     * 
     * If the function fails, the return value is zero. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetmodulebase
     */
    static SymGetModuleBase(hProcess, dwAddr) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetModuleBase", "ptr", hProcess, "uint", dwAddr, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumLines function (dbghelp.h) enumerates all lines in the specified module.
     * @remarks
     * This function is supported for PDB information only. If you have COFF information, try using one of the <b>SymGetLineXXX</b> functions.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the module.
     * @param {Pointer<Byte>} Obj The name of an .obj file within the module. The scope of the enumeration is limited to this file. If this parameter is <b>NULL</b> or an empty string, all .obj files are searched.
     * @param {Pointer<Byte>} File A wildcard expression that indicates the names of the source files to be searched. If this parameter is <b>NULL</b> or an empty string, all files are searched.
     * @param {Pointer<PSYM_ENUMLINES_CALLBACK>} EnumLinesCallback A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumlines_callback">SymEnumLinesProc</a> callback function that receives the line information.
     * @param {Pointer<Void>} UserContext A user-defined value that is passed to the callback function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumlines
     */
    static SymEnumLines(hProcess, Base, Obj, File, EnumLinesCallback, UserContext) {
        Obj := Obj is String? StrPtr(Obj) : Obj
        File := File is String? StrPtr(File) : File

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumLines", "ptr", hProcess, "uint", Base, "ptr", Obj, "ptr", File, "ptr", EnumLinesCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumLinesW function enumerates all lines in the specified module.
     * @remarks
     * This function is supported for PDB information only. If you have COFF information, try using one of the <b>SymGetLineXXX</b> functions.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymEnumLines as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the module.
     * @param {Pointer<Char>} Obj The name of an .obj file within the module. The scope of the enumeration is limited to this file. If this parameter is <b>NULL</b> or an empty string, all .obj files are searched.
     * @param {Pointer<Char>} File A wildcard expression that indicates the names of the source files to be searched. If this parameter is <b>NULL</b> or an empty string, all files are searched.
     * @param {Pointer<PSYM_ENUMLINES_CALLBACKW>} EnumLinesCallback A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumlines_callback">SymEnumLinesProc</a> callback function that receives the line information.
     * @param {Pointer<Void>} UserContext A user-defined value that is passed to the callback function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumlinesw
     */
    static SymEnumLinesW(hProcess, Base, Obj, File, EnumLinesCallback, UserContext) {
        Obj := Obj is String? StrPtr(Obj) : Obj
        File := File is String? StrPtr(File) : File

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumLinesW", "ptr", hProcess, "uint", Base, "ptr", Obj, "ptr", File, "ptr", EnumLinesCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates the source line for the specified address. (SymGetLineFromAddr64)
     * @remarks
     * The caller must allocate the <i>Line</i> buffer properly and fill in the required members 
     *     of the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure before 
     *     calling <b>SymGetLineFromAddr64</b>.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy 
     *     the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to 
     *     this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize 
     *     all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define <b>DBGHELP_TRANSLATE_TCHAR</b>. 
     *    <b>SymGetLineFromAddrW64</b> is defined as follows in 
     *    Dbghelp.h.
     *    
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * SymGetLineFromAddrW64(
     *     _In_ HANDLE hProcess,
     *     _In_ DWORD64 dwAddr,
     *     _Out_ PDWORD pdwDisplacement,
     *     _Out_ PIMAGEHLP_LINEW64 Line
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} qwAddr The address for which a line should be located. It is not necessary for the address to be on a line 
     *       boundary. If the address appears after the beginning of a line and before the end of the line, the line is 
     *       found.
     * @param {Pointer<UInt32>} pdwDisplacement The displacement in bytes from the beginning of the line, or zero.
     * @param {Pointer<IMAGEHLP_LINE64>} Line64 A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> 
     *       structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetlinefromaddr64
     */
    static SymGetLineFromAddr64(hProcess, qwAddr, pdwDisplacement, Line64) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetLineFromAddr64", "ptr", hProcess, "uint", qwAddr, "uint*", pdwDisplacement, "ptr", Line64, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates the source line for the specified address. (SymGetLineFromAddrW64)
     * @remarks
     * The caller must allocate the <i>Line</i> buffer properly and fill in the required members 
     *     of the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure before 
     *     calling <b>SymGetLineFromAddr64</b>.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy 
     *     the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to 
     *     this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize 
     *     all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define <b>DBGHELP_TRANSLATE_TCHAR</b>. 
     *    <b>SymGetLineFromAddrW64</b> is defined as follows in 
     *    Dbghelp.h.
     *    
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * SymGetLineFromAddrW64(
     *     _In_ HANDLE hProcess,
     *     _In_ DWORD64 dwAddr,
     *     _Out_ PDWORD pdwDisplacement,
     *     _Out_ PIMAGEHLP_LINEW64 Line
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} dwAddr The address for which a line should be located. It is not necessary for the address to be on a line 
     *       boundary. If the address appears after the beginning of a line and before the end of the line, the line is 
     *       found.
     * @param {Pointer<UInt32>} pdwDisplacement The displacement in bytes from the beginning of the line, or zero.
     * @param {Pointer<IMAGEHLP_LINEW64>} Line A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> 
     *       structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetlinefromaddrw64
     */
    static SymGetLineFromAddrW64(hProcess, dwAddr, pdwDisplacement, Line) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetLineFromAddrW64", "ptr", hProcess, "uint", dwAddr, "uint*", pdwDisplacement, "ptr", Line, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetLineFromInlineContext function (dbghelp.h) locates the source line for the specified inline context.
     * @remarks
     * The caller must allocate the <i>Line</i> buffer properly and fill in the required members 
     *     of the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure before 
     *     calling <b>SymGetLineFromInlineContext</b>.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy 
     *     the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single 
     *     threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or 
     *     memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this 
     *     function.
     * 
     * To call the Unicode version of this function, define <b>DBGHELP_TRANSLATE_TCHAR</b>. 
     *     <b>SymGetLineFromInlineContext</b> is defined as 
     *     follows in Dbghelp.h.
     * 
     * 
     * ``` syntax
     * BOOL
     * IMAGEAPI
     * SymGetLineFromInlineContextW(
     *     _In_ HANDLE hProcess,
     *     _In_ DWORD64 dwAddr,
     *     _In_ ULONG InlineContext,
     *     _In_opt_ DWORD64 qwModuleBaseAddress,
     *     _Out_ PDWORD pdwDisplacement,
     *     _Out_ PIMAGEHLP_LINEW64 Line
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} qwAddr The address for which a line should be located. It is not necessary for the address to be on a line 
     *       boundary. If the address appears after the beginning of a line and before the end of the line, the line is 
     *       found.
     * @param {Integer} InlineContext The inline context.
     * @param {Integer} qwModuleBaseAddress The base address of the module.
     * @param {Pointer<UInt32>} pdwDisplacement The displacement in bytes from the beginning of the line, or zero.
     * @param {Pointer<IMAGEHLP_LINE64>} Line64 A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> 
     *       structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetlinefrominlinecontext
     */
    static SymGetLineFromInlineContext(hProcess, qwAddr, InlineContext, qwModuleBaseAddress, pdwDisplacement, Line64) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetLineFromInlineContext", "ptr", hProcess, "uint", qwAddr, "uint", InlineContext, "uint", qwModuleBaseAddress, "uint*", pdwDisplacement, "ptr", Line64, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetLineFromInlineContextW (Unicode) function locates the source line for the specified inline context.
     * @remarks
     * The caller must allocate the <i>Line</i> buffer properly and fill in the required members 
     *     of the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure before 
     *     calling <b>SymGetLineFromInlineContext</b>.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy 
     *     the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single 
     *     threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or 
     *     memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this 
     *     function.
     * 
     * To call the Unicode version of this function, define <b>DBGHELP_TRANSLATE_TCHAR</b>. 
     *     <b>SymGetLineFromInlineContext</b> is defined as 
     *     follows in Dbghelp.h.
     * 
     * 
     * ``` syntax
     * BOOL
     * IMAGEAPI
     * SymGetLineFromInlineContextW(
     *     _In_ HANDLE hProcess,
     *     _In_ DWORD64 dwAddr,
     *     _In_ ULONG InlineContext,
     *     _In_opt_ DWORD64 qwModuleBaseAddress,
     *     _Out_ PDWORD pdwDisplacement,
     *     _Out_ PIMAGEHLP_LINEW64 Line
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} dwAddr The address for which a line should be located. It is not necessary for the address to be on a line 
     *       boundary. If the address appears after the beginning of a line and before the end of the line, the line is 
     *       found.
     * @param {Integer} InlineContext The inline context.
     * @param {Integer} qwModuleBaseAddress The base address of the module.
     * @param {Pointer<UInt32>} pdwDisplacement The displacement in bytes from the beginning of the line, or zero.
     * @param {Pointer<IMAGEHLP_LINEW64>} Line A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> 
     *       structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetlinefrominlinecontextw
     */
    static SymGetLineFromInlineContextW(hProcess, dwAddr, InlineContext, qwModuleBaseAddress, pdwDisplacement, Line) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetLineFromInlineContextW", "ptr", hProcess, "uint", dwAddr, "uint", InlineContext, "uint", qwModuleBaseAddress, "uint*", pdwDisplacement, "ptr", Line, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumSourceLines function (dbghelp.h) enumerates all source lines in a module.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the module.
     * @param {Pointer<Byte>} Obj The name of an .obj file within the module. The scope of the enumeration is limited to this file. If this parameter is <b>NULL</b> or an empty string, all .obj files are searched.
     * @param {Pointer<Byte>} File A wildcard expression that indicates the names of the source files to be searched. If this parameter is <b>NULL</b> or an empty string, all files are searched.
     * @param {Integer} Line The line number of a line within the module. The scope of the enumeration is limited to this line. If this parameter is 0, all lines are searched.
     * @param {Integer} Flags If this parameter is ESLFLAG_FULLPATH, the function matches the full path in the <i>File</i> parameter.
     * @param {Pointer<PSYM_ENUMLINES_CALLBACK>} EnumLinesCallback A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumlines_callback">SymEnumLinesProc</a> callback function that receives the line information.
     * @param {Pointer<Void>} UserContext A user-defined value that is passed to the callback function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumsourcelines
     */
    static SymEnumSourceLines(hProcess, Base, Obj, File, Line, Flags, EnumLinesCallback, UserContext) {
        Obj := Obj is String? StrPtr(Obj) : Obj
        File := File is String? StrPtr(File) : File

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumSourceLines", "ptr", hProcess, "uint", Base, "ptr", Obj, "ptr", File, "uint", Line, "uint", Flags, "ptr", EnumLinesCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumSourceLinesW (Unicode) function enumerates all source lines in a module.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymEnumSourceLines as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the module.
     * @param {Pointer<Char>} Obj The name of an .obj file within the module. The scope of the enumeration is limited to this file. If this parameter is <b>NULL</b> or an empty string, all .obj files are searched.
     * @param {Pointer<Char>} File A wildcard expression that indicates the names of the source files to be searched. If this parameter is <b>NULL</b> or an empty string, all files are searched.
     * @param {Integer} Line The line number of a line within the module. The scope of the enumeration is limited to this line. If this parameter is 0, all lines are searched.
     * @param {Integer} Flags If this parameter is ESLFLAG_FULLPATH, the function matches the full path in the <i>File</i> parameter.
     * @param {Pointer<PSYM_ENUMLINES_CALLBACKW>} EnumLinesCallback A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumlines_callback">SymEnumLinesProc</a> callback function that receives the line information.
     * @param {Pointer<Void>} UserContext A user-defined value that is passed to the callback function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumsourcelinesw
     */
    static SymEnumSourceLinesW(hProcess, Base, Obj, File, Line, Flags, EnumLinesCallback, UserContext) {
        Obj := Obj is String? StrPtr(Obj) : Obj
        File := File is String? StrPtr(File) : File

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumSourceLinesW", "ptr", hProcess, "uint", Base, "ptr", Obj, "ptr", File, "uint", Line, "uint", Flags, "ptr", EnumLinesCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Indicates whether the specified address is within an inline frame.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Address The address.
     * @returns {Integer} Returns zero if the address is not within an inline frame.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symaddrincludeinlinetrace
     */
    static SymAddrIncludeInlineTrace(hProcess, Address) {
        result := DllCall("dbghelp.dll\SymAddrIncludeInlineTrace", "ptr", hProcess, "uint", Address, "uint")
        return result
    }

    /**
     * Compares two inline traces.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Address1 The first address to be compared.
     * @param {Integer} InlineContext1 The inline context for the first trace to be compared.
     * @param {Integer} RetAddress1 The return address of the first trace to be compared.
     * @param {Integer} Address2 The second address to be compared.
     * @param {Integer} RetAddress2 The return address of the second trace to be compared.
     * @returns {Integer} Indicates the result of the comparison.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYM_INLINE_COMP_ERROR</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYM_INLINE_COMP_IDENTICAL</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The inline contexts are identical.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYM_INLINE_COMP_STEPIN</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The inline trace is a step-in of an inline function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYM_INLINE_COMP_STEPOUT</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The inline trace is a step-out of an inline function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYM_INLINE_COMP_STEPOVER</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The inline trace is a step-over of an inline function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYM_INLINE_COMP_DIFFERENT</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The inline contexts are different.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symcompareinlinetrace
     */
    static SymCompareInlineTrace(hProcess, Address1, InlineContext1, RetAddress1, Address2, RetAddress2) {
        result := DllCall("dbghelp.dll\SymCompareInlineTrace", "ptr", hProcess, "uint", Address1, "uint", InlineContext1, "uint", RetAddress1, "uint", Address2, "uint", RetAddress2, "uint")
        return result
    }

    /**
     * Queries an inline trace.
     * @remarks
     * Either the <i>StartAddress</i> or <i>StartRetAddress</i> parameters must be within the same function scope as the <i>CurAddress</i> parameter. The former indicates a step-over within the same function and the latter indicates a step-over from <i>StartAddress</i>.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} StartAddress The start address.
     * @param {Integer} StartContext Contains the context of the start of block.
     * @param {Integer} StartRetAddress Contains the return address of the start of the current block/
     * @param {Integer} CurAddress Contains the current address.
     * @param {Pointer<UInt32>} CurContext Address of a <b>DWORD</b> that receives the current context.
     * @param {Pointer<UInt32>} CurFrameIndex If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symqueryinlinetrace
     */
    static SymQueryInlineTrace(hProcess, StartAddress, StartContext, StartRetAddress, CurAddress, CurContext, CurFrameIndex) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymQueryInlineTrace", "ptr", hProcess, "uint", StartAddress, "uint", StartContext, "uint", StartRetAddress, "uint", CurAddress, "uint*", CurContext, "uint*", CurFrameIndex, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates the source line for the specified address. (SymGetLineFromAddr)
     * @remarks
     * The caller must allocate the <i>Line</i> buffer properly and fill in the required members 
     *     of the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure before 
     *     calling <b>SymGetLineFromAddr64</b>.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy 
     *     the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to 
     *     this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize 
     *     all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define <b>DBGHELP_TRANSLATE_TCHAR</b>. 
     *    <b>SymGetLineFromAddrW64</b> is defined as follows in 
     *    Dbghelp.h.
     *    
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * SymGetLineFromAddrW64(
     *     _In_ HANDLE hProcess,
     *     _In_ DWORD64 dwAddr,
     *     _Out_ PDWORD pdwDisplacement,
     *     _Out_ PIMAGEHLP_LINEW64 Line
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} dwAddr The address for which a line should be located. It is not necessary for the address to be on a line 
     *       boundary. If the address appears after the beginning of a line and before the end of the line, the line is 
     *       found.
     * @param {Pointer<UInt32>} pdwDisplacement The displacement in bytes from the beginning of the line, or zero.
     * @param {Pointer<IMAGEHLP_LINE>} Line A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> 
     *       structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetlinefromaddr
     */
    static SymGetLineFromAddr(hProcess, dwAddr, pdwDisplacement, Line) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetLineFromAddr", "ptr", hProcess, "uint", dwAddr, "uint*", pdwDisplacement, "ptr", Line, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates a source line for the specified module, file name, and line number. (SymGetLineFromName64)
     * @remarks
     * The caller must allocate the <i>Line</i> buffer properly and fill in the required members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure before calling 
     * <b>SymGetLineFromName64</b>.
     * 
     * Before calling this function, ensure that the symbols are initialized correctly by first calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetoptions">SymSetOptions</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a>.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymGetLineFromNameW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymGetLineFromNameW64(
     *     __in HANDLE hProcess,
     *     __in_opt PCWSTR ModuleName,
     *     __in_opt PCWSTR FileName,
     *     __in DWORD dwLineNumber,
     *     __out PLONG plDisplacement,
     *     __inout PIMAGEHLP_LINEW64 Line
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} ModuleName The name of the module in which a line is to be located.
     * @param {Pointer<Byte>} FileName The name of the file in which a line is to be located. If the application has more than one source file with this name, be sure to specify a full path.
     * @param {Integer} dwLineNumber The line number to be located.
     * @param {Pointer<Int32>} plDisplacement The displacement in bytes from the beginning of the line, or zero.
     * @param {Pointer<IMAGEHLP_LINE64>} Line A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetlinefromname64
     */
    static SymGetLineFromName64(hProcess, ModuleName, FileName, dwLineNumber, plDisplacement, Line) {
        ModuleName := ModuleName is String? StrPtr(ModuleName) : ModuleName
        FileName := FileName is String? StrPtr(FileName) : FileName

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetLineFromName64", "ptr", hProcess, "ptr", ModuleName, "ptr", FileName, "uint", dwLineNumber, "int*", plDisplacement, "ptr", Line, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates a source line for the specified module, file name, and line number. (SymGetLineFromNameW64)
     * @remarks
     * The caller must allocate the <i>Line</i> buffer properly and fill in the required members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure before calling 
     * <b>SymGetLineFromName64</b>.
     * 
     * Before calling this function, ensure that the symbols are initialized correctly by first calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetoptions">SymSetOptions</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a>.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymGetLineFromNameW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymGetLineFromNameW64(
     *     __in HANDLE hProcess,
     *     __in_opt PCWSTR ModuleName,
     *     __in_opt PCWSTR FileName,
     *     __in DWORD dwLineNumber,
     *     __out PLONG plDisplacement,
     *     __inout PIMAGEHLP_LINEW64 Line
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Char>} ModuleName The name of the module in which a line is to be located.
     * @param {Pointer<Char>} FileName The name of the file in which a line is to be located. If the application has more than one source file with this name, be sure to specify a full path.
     * @param {Integer} dwLineNumber The line number to be located.
     * @param {Pointer<Int32>} plDisplacement The displacement in bytes from the beginning of the line, or zero.
     * @param {Pointer<IMAGEHLP_LINEW64>} Line A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetlinefromnamew64
     */
    static SymGetLineFromNameW64(hProcess, ModuleName, FileName, dwLineNumber, plDisplacement, Line) {
        ModuleName := ModuleName is String? StrPtr(ModuleName) : ModuleName
        FileName := FileName is String? StrPtr(FileName) : FileName

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetLineFromNameW64", "ptr", hProcess, "ptr", ModuleName, "ptr", FileName, "uint", dwLineNumber, "int*", plDisplacement, "ptr", Line, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates a source line for the specified module, file name, and line number. (SymGetLineFromName)
     * @remarks
     * The caller must allocate the <i>Line</i> buffer properly and fill in the required members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure before calling 
     * <b>SymGetLineFromName64</b>.
     * 
     * Before calling this function, ensure that the symbols are initialized correctly by first calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetoptions">SymSetOptions</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a>.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymGetLineFromNameW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymGetLineFromNameW64(
     *     __in HANDLE hProcess,
     *     __in_opt PCWSTR ModuleName,
     *     __in_opt PCWSTR FileName,
     *     __in DWORD dwLineNumber,
     *     __out PLONG plDisplacement,
     *     __inout PIMAGEHLP_LINEW64 Line
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} ModuleName The name of the module in which a line is to be located.
     * @param {Pointer<Byte>} FileName The name of the file in which a line is to be located. If the application has more than one source file with this name, be sure to specify a full path.
     * @param {Integer} dwLineNumber The line number to be located.
     * @param {Pointer<Int32>} plDisplacement The displacement in bytes from the beginning of the line, or zero.
     * @param {Pointer<IMAGEHLP_LINE>} Line A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetlinefromname
     */
    static SymGetLineFromName(hProcess, ModuleName, FileName, dwLineNumber, plDisplacement, Line) {
        ModuleName := ModuleName is String? StrPtr(ModuleName) : ModuleName
        FileName := FileName is String? StrPtr(FileName) : FileName

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetLineFromName", "ptr", hProcess, "ptr", ModuleName, "ptr", FileName, "uint", dwLineNumber, "int*", plDisplacement, "ptr", Line, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the line information for the next source line. (SymGetLineNext64)
     * @remarks
     * The 
     * <b>SymGetLineNext64</b> function requires that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure have valid data, presumably obtained from a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetlinefromaddr">SymGetLineFromAddr64</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetlinefromname">SymGetLineFromName64</a> function. This structure receives the line information for the next line in sequence.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymGetLineNextW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymGetLineNextW64(
     *     __in HANDLE hProcess,
     *     __inout PIMAGEHLP_LINEW64 Line
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<IMAGEHLP_LINE64>} Line A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure that contains the line information.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetlinenext64
     */
    static SymGetLineNext64(hProcess, Line) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetLineNext64", "ptr", hProcess, "ptr", Line, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the line information for the next source line. (SymGetLineNextW64)
     * @remarks
     * The 
     * <b>SymGetLineNext64</b> function requires that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure have valid data, presumably obtained from a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetlinefromaddr">SymGetLineFromAddr64</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetlinefromname">SymGetLineFromName64</a> function. This structure receives the line information for the next line in sequence.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymGetLineNextW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymGetLineNextW64(
     *     __in HANDLE hProcess,
     *     __inout PIMAGEHLP_LINEW64 Line
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<IMAGEHLP_LINEW64>} Line A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure that contains the line information.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetlinenextw64
     */
    static SymGetLineNextW64(hProcess, Line) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetLineNextW64", "ptr", hProcess, "ptr", Line, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the line information for the next source line. (SymGetLineNext)
     * @remarks
     * The 
     * <b>SymGetLineNext64</b> function requires that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure have valid data, presumably obtained from a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetlinefromaddr">SymGetLineFromAddr64</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetlinefromname">SymGetLineFromName64</a> function. This structure receives the line information for the next line in sequence.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymGetLineNextW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymGetLineNextW64(
     *     __in HANDLE hProcess,
     *     __inout PIMAGEHLP_LINEW64 Line
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<IMAGEHLP_LINE>} Line A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure that contains the line information.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetlinenext
     */
    static SymGetLineNext(hProcess, Line) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetLineNext", "ptr", hProcess, "ptr", Line, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the line information for the previous source line. (SymGetLinePrev64)
     * @remarks
     * The 
     * <b>SymGetLinePrev64</b> function requires that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure have valid data, presumably obtained from a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetlinefromaddr">SymGetLineFromAddr64</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetlinefromname">SymGetLineFromName64</a> function. This structure is filled with the line information for the previous line in sequence.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymGetLinePrevW64</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * SymGetLinePrevW64(
     *     __in HANDLE hProcess,
     *     __inout PIMAGEHLP_LINEW64 Line
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<IMAGEHLP_LINE64>} Line A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetlineprev64
     */
    static SymGetLinePrev64(hProcess, Line) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetLinePrev64", "ptr", hProcess, "ptr", Line, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the line information for the previous source line. (SymGetLinePrevW64)
     * @remarks
     * The 
     * <b>SymGetLinePrev64</b> function requires that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure have valid data, presumably obtained from a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetlinefromaddr">SymGetLineFromAddr64</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetlinefromname">SymGetLineFromName64</a> function. This structure is filled with the line information for the previous line in sequence.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymGetLinePrevW64</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * SymGetLinePrevW64(
     *     __in HANDLE hProcess,
     *     __inout PIMAGEHLP_LINEW64 Line
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<IMAGEHLP_LINEW64>} Line A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetlineprevw64
     */
    static SymGetLinePrevW64(hProcess, Line) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetLinePrevW64", "ptr", hProcess, "ptr", Line, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the line information for the previous source line. (SymGetLinePrev)
     * @remarks
     * The 
     * <b>SymGetLinePrev64</b> function requires that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure have valid data, presumably obtained from a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetlinefromaddr">SymGetLineFromAddr64</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetlinefromname">SymGetLineFromName64</a> function. This structure is filled with the line information for the previous line in sequence.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymGetLinePrevW64</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * SymGetLinePrevW64(
     *     __in HANDLE hProcess,
     *     __inout PIMAGEHLP_LINEW64 Line
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<IMAGEHLP_LINE>} Line A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_line">IMAGEHLP_LINE64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetlineprev
     */
    static SymGetLinePrev(hProcess, Line) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetLinePrev", "ptr", hProcess, "ptr", Line, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates line information for the specified module and file name.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} ModuleName The name of the module in which  lines are to be located. If this parameter is <b>NULL</b>, the function searches all modules.
     * @param {Pointer<Byte>} FileName The name of the file in which lines are to be located.
     * @param {Pointer<UInt64>} Buffer An array of offsets for each line. The offset for the line n is stored in element n-1. Array elements for lines that do not have line information are left unchanged.
     * @param {Integer} BufferLines The size of the <i>Buffer</i> array, in elements.
     * @returns {Integer} If the function succeeds, the return value is the highest line number found.
     * 						This value is zero if no line information was found.
     * 
     * If the function fails, the return value is LINE_ERROR. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetfilelineoffsets64
     */
    static SymGetFileLineOffsets64(hProcess, ModuleName, FileName, Buffer, BufferLines) {
        ModuleName := ModuleName is String? StrPtr(ModuleName) : ModuleName
        FileName := FileName is String? StrPtr(FileName) : FileName

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetFileLineOffsets64", "ptr", hProcess, "ptr", ModuleName, "ptr", FileName, "uint*", Buffer, "uint", BufferLines, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymMatchFileName function (dbghelp.h) compares a string to a file name and path.
     * @remarks
     * Because the match string can be a suffix of the complete file name, this function can be used to match a plain file name to a fully qualified file name.
     * 
     * Matching begins from the end of both strings and proceeds backward. Matching is case-insensitive and equates a backslash (\\) with a forward slash (/).
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Byte>} FileName The file name to be compared to the <i>Match</i> parameter.
     * @param {Pointer<Byte>} Match The string to be compared to the <i>FileName</i> parameter.
     * @param {Pointer<Byte>} FileNameStop A pointer to a string buffer that receives a pointer to the location in <i>FileName</i> where matching stopped. For a complete match, this value can be one character before <i>FileName</i>. This value can also be <b>NULL</b>.
     * @param {Pointer<Byte>} MatchStop A pointer to a string buffer that receives a pointer to the location in <i>Match</i> where matching stopped. For a complete match, this value may be one character before <i>Match</i>. This value may be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symmatchfilename
     */
    static SymMatchFileName(FileName, Match, FileNameStop, MatchStop) {
        FileName := FileName is String? StrPtr(FileName) : FileName
        Match := Match is String? StrPtr(Match) : Match

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymMatchFileName", "ptr", FileName, "ptr", Match, "ptr", FileNameStop, "ptr", MatchStop, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymMatchFileNameW (Unicode) function compares a string to a file name and path.
     * @remarks
     * Because the match string can be a suffix of the complete file name, this function can be used to match a plain file name to a fully qualified file name.
     * 
     * Matching begins from the end of both strings and proceeds backward. Matching is case-insensitive and equates a backslash (\\) with a forward slash (/).
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymMatchFileName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} FileName The file name to be compared to the <i>Match</i> parameter.
     * @param {Pointer<Char>} Match The string to be compared to the <i>FileName</i> parameter.
     * @param {Pointer<Char>} FileNameStop A pointer to a string buffer that receives a pointer to the location in <i>FileName</i> where matching stopped. For a complete match, this value can be one character before <i>FileName</i>. This value can also be <b>NULL</b>.
     * @param {Pointer<Char>} MatchStop A pointer to a string buffer that receives a pointer to the location in <i>Match</i> where matching stopped. For a complete match, this value may be one character before <i>Match</i>. This value may be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symmatchfilenamew
     */
    static SymMatchFileNameW(FileName, Match, FileNameStop, MatchStop) {
        FileName := FileName is String? StrPtr(FileName) : FileName
        Match := Match is String? StrPtr(Match) : Match

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymMatchFileNameW", "ptr", FileName, "ptr", Match, "ptr", FileNameStop, "ptr", MatchStop, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetSourceFile function (dbghelp.h) retrieves the specified source file from the source server.
     * @remarks
     * To control which directory receives the source files, use the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsethomedirectory">SymSetHomeDirectory</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the module.
     * @param {Pointer<Byte>} Params This parameter is unused.
     * @param {Pointer<Byte>} FileSpec The name of the source file.
     * @param {Pointer<Byte>} FilePath A pointer to a 
     * buffer that receives the fully qualified path of the source file.
     * @param {Integer} Size The size of the <i>FilePath</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsourcefile
     */
    static SymGetSourceFile(hProcess, Base, Params, FileSpec, FilePath, Size) {
        Params := Params is String? StrPtr(Params) : Params
        FileSpec := FileSpec is String? StrPtr(FileSpec) : FileSpec
        FilePath := FilePath is String? StrPtr(FilePath) : FilePath

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSourceFile", "ptr", hProcess, "uint", Base, "ptr", Params, "ptr", FileSpec, "ptr", FilePath, "uint", Size, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetSourceFileW (Unicode) function retrieves the specified source file from the source server.
     * @remarks
     * To control which directory receives the source files, use the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsethomedirectory">SymSetHomeDirectory</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymGetSourceFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the module.
     * @param {Pointer<Char>} Params This parameter is unused.
     * @param {Pointer<Char>} FileSpec The name of the source file.
     * @param {Pointer<Char>} FilePath A pointer to a 
     * buffer that receives the fully qualified path of the source file.
     * @param {Integer} Size The size of the <i>FilePath</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsourcefilew
     */
    static SymGetSourceFileW(hProcess, Base, Params, FileSpec, FilePath, Size) {
        Params := Params is String? StrPtr(Params) : Params
        FileSpec := FileSpec is String? StrPtr(FileSpec) : FileSpec
        FilePath := FilePath is String? StrPtr(FilePath) : FilePath

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSourceFileW", "ptr", hProcess, "uint", Base, "ptr", Params, "ptr", FileSpec, "ptr", FilePath, "uint", Size, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetSourceFileToken function (dbghelp.h) retrieves token for the specified source file from the source server.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the module.
     * @param {Pointer<Byte>} FileSpec The name of the source file.
     * @param {Pointer<Void>} Token A pointer to a 
     * buffer that receives the token.
     * @param {Pointer<UInt32>} Size The size of the <i>Token</i> buffer, in bytes.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsourcefiletoken
     */
    static SymGetSourceFileToken(hProcess, Base, FileSpec, Token, Size) {
        FileSpec := FileSpec is String? StrPtr(FileSpec) : FileSpec

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSourceFileToken", "ptr", hProcess, "uint", Base, "ptr", FileSpec, "ptr", Token, "uint*", Size, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Integer} Base 
     * @param {Pointer<Byte>} FileSpec 
     * @param {Pointer<Byte>} TokenName 
     * @param {Pointer<Byte>} TokenParameters 
     * @param {Pointer<Void>} Token 
     * @param {Pointer<UInt32>} Size 
     * @returns {Integer} 
     */
    static SymGetSourceFileTokenByTokenName(hProcess, Base, FileSpec, TokenName, TokenParameters, Token, Size) {
        FileSpec := FileSpec is String? StrPtr(FileSpec) : FileSpec
        TokenName := TokenName is String? StrPtr(TokenName) : TokenName
        TokenParameters := TokenParameters is String? StrPtr(TokenParameters) : TokenParameters

        result := DllCall("dbghelp.dll\SymGetSourceFileTokenByTokenName", "ptr", hProcess, "uint", Base, "ptr", FileSpec, "ptr", TokenName, "ptr", TokenParameters, "ptr", Token, "uint*", Size, "int")
        return result
    }

    /**
     * The SymGetSourceFileChecksumW (Unicode) function retrieves the specified source file checksum from the source server.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the module.
     * @param {Pointer<Char>} FileSpec The name of the source file.
     * @param {Pointer<UInt32>} pCheckSumType On success, points to the checksum type.
     * @param {Pointer<Byte>} pChecksum pointer to a buffer that receives the checksum. If <b>NULL</b>, then when the call returns <i>pActualBytesWritten</i> returns the number of bytes required.
     * @param {Integer} checksumSize The size of the <i>pChecksum</i> buffer, in bytes.
     * @param {Pointer<UInt32>} pActualBytesWritten Pointer to the actual bytes written in the buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsourcefilechecksumw
     */
    static SymGetSourceFileChecksumW(hProcess, Base, FileSpec, pCheckSumType, pChecksum, checksumSize, pActualBytesWritten) {
        FileSpec := FileSpec is String? StrPtr(FileSpec) : FileSpec

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSourceFileChecksumW", "ptr", hProcess, "uint", Base, "ptr", FileSpec, "uint*", pCheckSumType, "char*", pChecksum, "uint", checksumSize, "uint*", pActualBytesWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetSourceFileChecksum function (dbghelp.h) retrieves the specified source file checksum from the source server.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the module.
     * @param {Pointer<Byte>} FileSpec The name of the source file.
     * @param {Pointer<UInt32>} pCheckSumType On success, points to the checksum type.
     * @param {Pointer<Byte>} pChecksum pointer to a buffer that receives the checksum. If <b>NULL</b>, then when the call returns <i>pActualBytesWritten</i> returns the number of bytes required.
     * @param {Integer} checksumSize The size of the <i>pChecksum</i> buffer, in bytes.
     * @param {Pointer<UInt32>} pActualBytesWritten Pointer to the actual bytes written in the buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsourcefilechecksum
     */
    static SymGetSourceFileChecksum(hProcess, Base, FileSpec, pCheckSumType, pChecksum, checksumSize, pActualBytesWritten) {
        FileSpec := FileSpec is String? StrPtr(FileSpec) : FileSpec

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSourceFileChecksum", "ptr", hProcess, "uint", Base, "ptr", FileSpec, "uint*", pCheckSumType, "char*", pChecksum, "uint", checksumSize, "uint*", pActualBytesWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetSourceFileTokenW (Unicode) function retrieves token for the specified source file from the source server.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymGetSourceFileToken as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the module.
     * @param {Pointer<Char>} FileSpec The name of the source file.
     * @param {Pointer<Void>} Token A pointer to a 
     * buffer that receives the token.
     * @param {Pointer<UInt32>} Size The size of the <i>Token</i> buffer, in bytes.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsourcefiletokenw
     */
    static SymGetSourceFileTokenW(hProcess, Base, FileSpec, Token, Size) {
        FileSpec := FileSpec is String? StrPtr(FileSpec) : FileSpec

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSourceFileTokenW", "ptr", hProcess, "uint", Base, "ptr", FileSpec, "ptr", Token, "uint*", Size, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Integer} Base 
     * @param {Pointer<Char>} FileSpec 
     * @param {Pointer<Char>} TokenName 
     * @param {Pointer<Char>} TokenParameters 
     * @param {Pointer<Void>} Token 
     * @param {Pointer<UInt32>} Size 
     * @returns {Integer} 
     */
    static SymGetSourceFileTokenByTokenNameW(hProcess, Base, FileSpec, TokenName, TokenParameters, Token, Size) {
        FileSpec := FileSpec is String? StrPtr(FileSpec) : FileSpec
        TokenName := TokenName is String? StrPtr(TokenName) : TokenName
        TokenParameters := TokenParameters is String? StrPtr(TokenParameters) : TokenParameters

        result := DllCall("dbghelp.dll\SymGetSourceFileTokenByTokenNameW", "ptr", hProcess, "uint", Base, "ptr", FileSpec, "ptr", TokenName, "ptr", TokenParameters, "ptr", Token, "uint*", Size, "int")
        return result
    }

    /**
     * The SymGetSourceFileFromToken function (dbghelp.h) retrieves the source file associated with the specified token from the source server.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Void>} Token A pointer to the token.
     * @param {Pointer<Byte>} Params This parameter is unused.
     * @param {Pointer<Byte>} FilePath A pointer to a 
     * buffer that receives the fully qualified path of the source file.
     * @param {Integer} Size The size of the <i>FilePath</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsourcefilefromtoken
     */
    static SymGetSourceFileFromToken(hProcess, Token, Params, FilePath, Size) {
        Params := Params is String? StrPtr(Params) : Params
        FilePath := FilePath is String? StrPtr(FilePath) : FilePath

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSourceFileFromToken", "ptr", hProcess, "ptr", Token, "ptr", Params, "ptr", FilePath, "uint", Size, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Void>} Token 
     * @param {Pointer<Byte>} TokenName 
     * @param {Pointer<Byte>} Params 
     * @param {Pointer<Byte>} FilePath 
     * @param {Integer} Size 
     * @returns {Integer} 
     */
    static SymGetSourceFileFromTokenByTokenName(hProcess, Token, TokenName, Params, FilePath, Size) {
        TokenName := TokenName is String? StrPtr(TokenName) : TokenName
        Params := Params is String? StrPtr(Params) : Params
        FilePath := FilePath is String? StrPtr(FilePath) : FilePath

        result := DllCall("dbghelp.dll\SymGetSourceFileFromTokenByTokenName", "ptr", hProcess, "ptr", Token, "ptr", TokenName, "ptr", Params, "ptr", FilePath, "uint", Size, "int")
        return result
    }

    /**
     * The SymGetSourceFileFromTokenW (Unicode) function retrieves the source file associated with the specified token from the source server.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymGetSourceFileFromToken as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Void>} Token A pointer to the token.
     * @param {Pointer<Char>} Params This parameter is unused.
     * @param {Pointer<Char>} FilePath A pointer to a 
     * buffer that receives the fully qualified path of the source file.
     * @param {Integer} Size The size of the <i>FilePath</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsourcefilefromtokenw
     */
    static SymGetSourceFileFromTokenW(hProcess, Token, Params, FilePath, Size) {
        Params := Params is String? StrPtr(Params) : Params
        FilePath := FilePath is String? StrPtr(FilePath) : FilePath

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSourceFileFromTokenW", "ptr", hProcess, "ptr", Token, "ptr", Params, "ptr", FilePath, "uint", Size, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Void>} Token 
     * @param {Pointer<Char>} TokenName 
     * @param {Pointer<Char>} Params 
     * @param {Pointer<Char>} FilePath 
     * @param {Integer} Size 
     * @returns {Integer} 
     */
    static SymGetSourceFileFromTokenByTokenNameW(hProcess, Token, TokenName, Params, FilePath, Size) {
        TokenName := TokenName is String? StrPtr(TokenName) : TokenName
        Params := Params is String? StrPtr(Params) : Params
        FilePath := FilePath is String? StrPtr(FilePath) : FilePath

        result := DllCall("dbghelp.dll\SymGetSourceFileFromTokenByTokenNameW", "ptr", hProcess, "ptr", Token, "ptr", TokenName, "ptr", Params, "ptr", FilePath, "uint", Size, "int")
        return result
    }

    /**
     * The SymGetSourceVarFromToken function (dbghelp.h) retrieves the value associated with the specified variable name from the Source Server token.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Void>} Token A pointer to the token.
     * @param {Pointer<Byte>} Params This parameter is unused.
     * @param {Pointer<Byte>} VarName The name of the variable token whose value you want to retrieve.
     * @param {Pointer<Byte>} Value A pointer to a 
     * buffer that receives the value associated with the variable token specified in the <i>VarName</i> parameter.
     * @param {Integer} Size The size of the <i>Value</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsourcevarfromtoken
     */
    static SymGetSourceVarFromToken(hProcess, Token, Params, VarName, Value, Size) {
        Params := Params is String? StrPtr(Params) : Params
        VarName := VarName is String? StrPtr(VarName) : VarName
        Value := Value is String? StrPtr(Value) : Value

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSourceVarFromToken", "ptr", hProcess, "ptr", Token, "ptr", Params, "ptr", VarName, "ptr", Value, "uint", Size, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetSourceVarFromTokenW (Unicode) function retrieves the value associated with the specified variable name from the Source Server token.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymGetSourceVarFromToken as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Void>} Token A pointer to the token.
     * @param {Pointer<Char>} Params This parameter is unused.
     * @param {Pointer<Char>} VarName The name of the variable token whose value you want to retrieve.
     * @param {Pointer<Char>} Value A pointer to a 
     * buffer that receives the value associated with the variable token specified in the <i>VarName</i> parameter.
     * @param {Integer} Size The size of the <i>Value</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsourcevarfromtokenw
     */
    static SymGetSourceVarFromTokenW(hProcess, Token, Params, VarName, Value, Size) {
        Params := Params is String? StrPtr(Params) : Params
        VarName := VarName is String? StrPtr(VarName) : VarName
        Value := Value is String? StrPtr(Value) : Value

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSourceVarFromTokenW", "ptr", hProcess, "ptr", Token, "ptr", Params, "ptr", VarName, "ptr", Value, "uint", Size, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates all individual entries in a module's source server data, if available.
     * @remarks
     * Some modules have PDB files with <a href="https://docs.microsoft.com/windows/desktop/Debug/source-server-and-source-indexing">source server</a> information detailing the version control information for each of the source files used to create each individual module.  An application can use this function to enumerate the  data for every source file that was "source indexed".
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the module.
     * @param {Pointer<PENUMSOURCEFILETOKENSCALLBACK>} Callback A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-penumsourcefiletokenscallback">SymEnumSourceFileTokensProc</a> callback function that receives the symbol information.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumsourcefiletokens
     */
    static SymEnumSourceFileTokens(hProcess, Base, Callback) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumSourceFileTokens", "ptr", hProcess, "uint", Base, "ptr", Callback, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymInitialize function (dbghelp.h) initializes the symbol handler for a process.
     * @remarks
     * The 
     * <b>SymInitialize</b> function is used to initialize the symbol handler for a process. In the context of the symbol handler, a process is a convenient object to use when collecting symbol information. Usually, symbol handlers are used by debuggers and other tools that need to load symbols for a process being debugged.
     * 
     * The  handle passed to 
     * <b>SymInitialize</b> must be the same value passed to all other symbol handler functions called by the process. It is the  handle that the functions use to identify the caller and locate the correct symbol information. When you have finished using the symbol information, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symcleanup">SymCleanup</a> function to deallocate all resources associated with the process for which symbols are loaded.
     * 
     * The search for symbols files is performed recursively for all paths specified in the <i>UserSearchPath</i> parameter. Therefore, if you specify the root directory in a search, the whole drive is searched, which can take significant time. Note that the directory that contains the executable file for the process is not automatically part of the search path. To include this directory in the search path, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getmodulefilenameexa">GetModuleFileNameEx</a> function, then add the path returned to <i>UserSearchPath</i>.
     * 
     * A process that calls <b>SymInitialize</b> should not call it again unless it calls <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symcleanup">SymCleanup</a> first. If the call to <b>SymInitialize</b> set <i>fInvadeProcess</i> to <b>TRUE</b> and you simply need to reload the module list, use the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symrefreshmodulelist">SymRefreshModuleList</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, call 
     * <b>SymInitialize</b> only when your process starts and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symcleanup">SymCleanup</a> only when your process ends. It is not necessary for each thread in the process to call these functions.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle that identifies the caller. This value should be unique and nonzero, but need not be a process handle. However, if you do use a process handle, be sure to use the correct handle. If the application is a debugger, use the process handle for the process being debugged. Do not use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a>. The handle used must be unique to avoid sharing a session with another component, and using <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> can have unexpected results when multiple components are attempting to use dbghelp to inspect the current process. Using <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> when debugging another process will also cause functions like <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmoduleex">SymLoadModuleEx</a> to have unexpected results.
     * 
     * 
     * 
     * 
     * This parameter cannot be <b>NULL</b>.
     * @param {Pointer<Byte>} UserSearchPath The path, or series of paths separated by a semicolon (;), that is used to search for symbol files. If this parameter is <b>NULL</b>, the library attempts to form a symbol path from the following sources: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>The current working directory of the application</li>
     * <li>The _NT_SYMBOL_PATH environment variable</li>
     * <li>The _NT_ALTERNATE_SYMBOL_PATH environment variable</li>
     * </ul>
     * Note that the search path can also be set using the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> function.
     * @param {Integer} fInvadeProcess If this value is <b>TRUE</b>, enumerates the loaded modules for the process and effectively calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a> function for each module.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-syminitialize
     */
    static SymInitialize(hProcess, UserSearchPath, fInvadeProcess) {
        UserSearchPath := UserSearchPath is String? StrPtr(UserSearchPath) : UserSearchPath

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymInitialize", "ptr", hProcess, "ptr", UserSearchPath, "int", fInvadeProcess, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymInitializeW (Unicode) function initializes the symbol handler for a process.
     * @remarks
     * The 
     * <b>SymInitialize</b> function is used to initialize the symbol handler for a process. In the context of the symbol handler, a process is a convenient object to use when collecting symbol information. Usually, symbol handlers are used by debuggers and other tools that need to load symbols for a process being debugged.
     * 
     * The  handle passed to 
     * <b>SymInitialize</b> must be the same value passed to all other symbol handler functions called by the process. It is the  handle that the functions use to identify the caller and locate the correct symbol information. When you have finished using the symbol information, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symcleanup">SymCleanup</a> function to deallocate all resources associated with the process for which symbols are loaded.
     * 
     * The search for symbols files is performed recursively for all paths specified in the <i>UserSearchPath</i> parameter. Therefore, if you specify the root directory in a search, the whole drive is searched, which can take significant time. Note that the directory that contains the executable file for the process is not automatically part of the search path. To include this directory in the search path, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/psapi/nf-psapi-getmodulefilenameexa">GetModuleFileNameEx</a> function, then add the path returned to <i>UserSearchPath</i>.
     * 
     * A process that calls <b>SymInitialize</b> should not call it again unless it calls <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symcleanup">SymCleanup</a> first. If the call to <b>SymInitialize</b> set <i>fInvadeProcess</i> to <b>TRUE</b> and you simply need to reload the module list, use the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symrefreshmodulelist">SymRefreshModuleList</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, call 
     * <b>SymInitialize</b> only when your process starts and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symcleanup">SymCleanup</a> only when your process ends. It is not necessary for each thread in the process to call these functions.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle that identifies the caller. This value should be unique and nonzero, but need not be a process handle. However, if you do use a process handle, be sure to use the correct handle. If the application is a debugger, use the process handle for the process being debugged. Do not use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> when debugging another process, because calling functions like <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmoduleex">SymLoadModuleEx</a> can have unexpected results. 
     * 
     * 
     * 
     * 
     * This parameter cannot be <b>NULL</b>.
     * @param {Pointer<Char>} UserSearchPath The path, or series of paths separated by a semicolon (;), that is used to search for symbol files. If this parameter is <b>NULL</b>, the library attempts to form a symbol path from the following sources: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>The current working directory of the application</li>
     * <li>The _NT_SYMBOL_PATH environment variable</li>
     * <li>The _NT_ALTERNATE_SYMBOL_PATH environment variable</li>
     * </ul>
     * Note that the search path can also be set using the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> function.
     * @param {Integer} fInvadeProcess If this value is <b>TRUE</b>, enumerates the loaded modules for the process and effectively calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a> function for each module.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-syminitializew
     */
    static SymInitializeW(hProcess, UserSearchPath, fInvadeProcess) {
        UserSearchPath := UserSearchPath is String? StrPtr(UserSearchPath) : UserSearchPath

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymInitializeW", "ptr", hProcess, "ptr", UserSearchPath, "int", fInvadeProcess, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetSearchPath function (dbghelp.h) retrieves the symbol search path for the specified process.
     * @remarks
     * The 
     * <b>SymGetSearchPath</b> function copies the symbol search path for the specified process into the <i>SearchPath</i> buffer. If the function fails, the contents of the buffer are undefined.
     * 
     * To specify a symbol search path for the process, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} SearchPathA 
     * @param {Integer} SearchPathLength The size of the <i>SearchPath</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsearchpath
     */
    static SymGetSearchPath(hProcess, SearchPathA, SearchPathLength) {
        SearchPathA := SearchPathA is String? StrPtr(SearchPathA) : SearchPathA

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSearchPath", "ptr", hProcess, "ptr", SearchPathA, "uint", SearchPathLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetSearchPathW (Unicode) function retrieves the symbol search path for the specified process.
     * @remarks
     * The 
     * <b>SymGetSearchPath</b> function copies the symbol search path for the specified process into the <i>SearchPath</i> buffer. If the function fails, the contents of the buffer are undefined.
     * 
     * To specify a symbol search path for the process, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymGetSearchPath as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Char>} SearchPathA 
     * @param {Integer} SearchPathLength The size of the <i>SearchPath</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsearchpathw
     */
    static SymGetSearchPathW(hProcess, SearchPathA, SearchPathLength) {
        SearchPathA := SearchPathA is String? StrPtr(SearchPathA) : SearchPathA

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSearchPathW", "ptr", hProcess, "ptr", SearchPathA, "uint", SearchPathLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSetSearchPath function (dbghelp.h) sets the search path for the specified process.
     * @remarks
     * The symbol search path can be changed any number of times while the library is in use by an application. The change affects all future calls to the symbol handler.
     * 
     * To get the current search path, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsearchpath">SymGetSearchPath</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} SearchPathA 
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsetsearchpath
     */
    static SymSetSearchPath(hProcess, SearchPathA) {
        SearchPathA := SearchPathA is String? StrPtr(SearchPathA) : SearchPathA

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSetSearchPath", "ptr", hProcess, "ptr", SearchPathA, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSetSearchPathW (Unicode) function (dbghelp.h) sets the search path for the specified process.
     * @remarks
     * The symbol search path can be changed any number of times while the library is in use by an application. The change affects all future calls to the symbol handler.
     * 
     * To get the current search path, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsearchpath">SymGetSearchPath</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymSetSearchPath as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Char>} SearchPathA 
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsetsearchpathw
     */
    static SymSetSearchPathW(hProcess, SearchPathA) {
        SearchPathA := SearchPathA is String? StrPtr(SearchPathA) : SearchPathA

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSetSearchPathW", "ptr", hProcess, "ptr", SearchPathA, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymLoadModuleEx function (dbghelp.h) loads the symbol table for the specified module.
     * @remarks
     * The symbol handler creates an entry for the module and if the deferred symbol loading option is turned off, an attempt is made to load the symbols. If deferred symbol loading is enabled, the module is marked as deferred and the symbols are not loaded until a reference is made to a symbol in the module. Therefore, you should always call the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetmoduleinfo">SymGetModuleInfo64</a> function after calling <b>SymLoadModuleEx</b>.
     * 
     * To unload the symbol table, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symunloadmodule">SymUnloadModule64</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Void>} hFile A handle to the file for the executable image. This argument is used mostly by debuggers, where the debugger passes the file handle obtained from a debugging event. A value of <b>NULL</b> indicates that <i>hFile</i> is not used.
     * @param {Pointer<Byte>} ImageName The name of the executable image. This name can contain a partial path, a full path, or no path at all. If the file cannot be located by the name provided, the symbol search path is used.
     * @param {Pointer<Byte>} ModuleName A shortcut name for the module. If the pointer value is <b>NULL</b>, the library creates a name using the base name of the symbol file.
     * @param {Integer} BaseOfDll The load address of the module. If the value is zero, the library obtains the load address from the symbol file. The load address contained in the symbol file is not necessarily the actual load address. Debuggers and other applications having an actual load address should use the real load address when calling this function.
     * 
     * If the image is a .pdb file, this parameter cannot be zero.
     * @param {Integer} DllSize The size of the module, in bytes. If the value is zero, the library obtains the size from the symbol file. The size contained in the symbol file is not necessarily the actual size. Debuggers and other applications having an actual size should use the real size when calling this function.
     * 
     * If the image is a .pdb file, this parameter cannot be zero.
     * @param {Pointer<MODLOAD_DATA>} Data A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-modload_data">MODLOAD_DATA</a> structure that represents headers other than the standard PE header. This parameter is optional and can be <b>NULL</b>.
     * @param {Integer} Flags 
     * @returns {Integer} If the function succeeds, the return value is the base address of the loaded module.
     * 
     * If the function fails, the return value is zero. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the module is already loaded, the return value is zero and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_SUCCESS.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symloadmoduleex
     */
    static SymLoadModuleEx(hProcess, hFile, ImageName, ModuleName, BaseOfDll, DllSize, Data, Flags) {
        ImageName := ImageName is String? StrPtr(ImageName) : ImageName
        ModuleName := ModuleName is String? StrPtr(ModuleName) : ModuleName

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymLoadModuleEx", "ptr", hProcess, "ptr", hFile, "ptr", ImageName, "ptr", ModuleName, "uint", BaseOfDll, "uint", DllSize, "ptr", Data, "uint", Flags, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymLoadModuleExW (Unicode) function loads the symbol table for the specified module.
     * @remarks
     * The symbol handler creates an entry for the module and if the deferred symbol loading option is turned off, an attempt is made to load the symbols. If deferred symbol loading is enabled, the module is marked as deferred and the symbols are not loaded until a reference is made to a symbol in the module. Therefore, you should always call the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetmoduleinfo">SymGetModuleInfo64</a> function after calling <b>SymLoadModuleEx</b>.
     * 
     * To unload the symbol table, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symunloadmodule">SymUnloadModule64</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Void>} hFile A handle to the file for the executable image. This argument is used mostly by debuggers, where the debugger passes the file handle obtained from a debugging event. A value of <b>NULL</b> indicates that <i>hFile</i> is not used.
     * @param {Pointer<Char>} ImageName The name of the executable image. This name can contain a partial path, a full path, or no path at all. If the file cannot be located by the name provided, the symbol search path is used.
     * @param {Pointer<Char>} ModuleName A shortcut name for the module. If the pointer value is <b>NULL</b>, the library creates a name using the base name of the symbol file.
     * @param {Integer} BaseOfDll The load address of the module. If the value is zero, the library obtains the load address from the symbol file. The load address contained in the symbol file is not necessarily the actual load address. Debuggers and other applications having an actual load address should use the real load address when calling this function.
     * 
     * If the image is a .pdb file, this parameter cannot be zero.
     * @param {Integer} DllSize The size of the module, in bytes. If the value is zero, the library obtains the size from the symbol file. The size contained in the symbol file is not necessarily the actual size. Debuggers and other applications having an actual size should use the real size when calling this function.
     * 
     * If the image is a .pdb file, this parameter cannot be zero.
     * @param {Pointer<MODLOAD_DATA>} Data A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-modload_data">MODLOAD_DATA</a> structure that represents headers other than the standard PE header. This parameter is optional and can be <b>NULL</b>.
     * @param {Integer} Flags 
     * @returns {Integer} If the function succeeds, the return value is the base address of the loaded module.
     * 
     * If the function fails, the return value is zero. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the module is already loaded, the return value is zero and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_SUCCESS.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symloadmoduleexw
     */
    static SymLoadModuleExW(hProcess, hFile, ImageName, ModuleName, BaseOfDll, DllSize, Data, Flags) {
        ImageName := ImageName is String? StrPtr(ImageName) : ImageName
        ModuleName := ModuleName is String? StrPtr(ModuleName) : ModuleName

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymLoadModuleExW", "ptr", hProcess, "ptr", hFile, "ptr", ImageName, "ptr", ModuleName, "uint", BaseOfDll, "uint", DllSize, "ptr", Data, "uint", Flags, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unloads the symbol table. (SymUnloadModule64)
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymUnloadedModule</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymUnloadedModule</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module that is to be unloaded.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symunloadmodule64
     */
    static SymUnloadModule64(hProcess, BaseOfDll) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymUnloadModule64", "ptr", hProcess, "uint", BaseOfDll, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unloads the symbol table. (SymUnloadModule)
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymUnloadedModule</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymUnloadedModule</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module that is to be unloaded.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symunloadmodule
     */
    static SymUnloadModule(hProcess, BaseOfDll) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymUnloadModule", "ptr", hProcess, "uint", BaseOfDll, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Undecorates a decorated C++ symbol name. (SymUnDName64)
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymUnDName</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymUnDName</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<IMAGEHLP_SYMBOL64>} sym A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure that specifies the symbol to be undecorated.
     * @param {Pointer<Byte>} UnDecName A pointer to a buffer that receives the undecorated name.
     * @param {Integer} UnDecNameLength The size of the <i>UnDecName</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symundname64
     */
    static SymUnDName64(sym, UnDecName, UnDecNameLength) {
        UnDecName := UnDecName is String? StrPtr(UnDecName) : UnDecName

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymUnDName64", "ptr", sym, "ptr", UnDecName, "uint", UnDecNameLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Undecorates a decorated C++ symbol name. (SymUnDName)
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymUnDName</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymUnDName</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<IMAGEHLP_SYMBOL>} sym A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure that specifies the symbol to be undecorated.
     * @param {Pointer<Byte>} UnDecName A pointer to a buffer that receives the undecorated name.
     * @param {Integer} UnDecNameLength The size of the <i>UnDecName</i> buffer, in characters.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symundname
     */
    static SymUnDName(sym, UnDecName, UnDecNameLength) {
        UnDecName := UnDecName is String? StrPtr(UnDecName) : UnDecName

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymUnDName", "ptr", sym, "ptr", UnDecName, "uint", UnDecNameLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a callback function for use by the symbol handler. (SymRegisterCallback64)
     * @remarks
     * The 
     * <b>SymRegisterCallback64</b> function lets an application register a callback function for use by the symbol handler. The symbol handler calls the registered callback function when there is status or progress information for the application.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymRegisterCallbackW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * SymRegisterCallbackW64(
     *     __in HANDLE hProcess,
     *     __in PSYMBOL_REGISTERED_CALLBACK64 CallbackFunction,
     *     __in ULONG64 UserContext
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<PSYMBOL_REGISTERED_CALLBACK64>} CallbackFunction A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psymbol_registered_callback">SymRegisterCallbackProc64</a> callback function.
     * @param {Integer} UserContext A user-defined value or <b>NULL</b>. This value is simply passed to the callback function. Normally, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some context.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symregistercallback64
     */
    static SymRegisterCallback64(hProcess, CallbackFunction, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymRegisterCallback64", "ptr", hProcess, "ptr", CallbackFunction, "uint", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a callback function for use by the symbol handler. (SymRegisterCallbackW64)
     * @remarks
     * The 
     * <b>SymRegisterCallback64</b> function lets an application register a callback function for use by the symbol handler. The symbol handler calls the registered callback function when there is status or progress information for the application.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymRegisterCallbackW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * SymRegisterCallbackW64(
     *     __in HANDLE hProcess,
     *     __in PSYMBOL_REGISTERED_CALLBACK64 CallbackFunction,
     *     __in ULONG64 UserContext
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<PSYMBOL_REGISTERED_CALLBACK64>} CallbackFunction A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psymbol_registered_callback">SymRegisterCallbackProc64</a> callback function.
     * @param {Integer} UserContext A user-defined value or <b>NULL</b>. This value is simply passed to the callback function. Normally, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some context.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symregistercallbackw64
     */
    static SymRegisterCallbackW64(hProcess, CallbackFunction, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymRegisterCallbackW64", "ptr", hProcess, "ptr", CallbackFunction, "uint", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a callback function for use by the stack walking procedure on Alpha computers. (SymRegisterFunctionEntryCallback64)
     * @remarks
     * The 
     * <b>SymRegisterFunctionEntryCallback64</b> function lets an application register a callback function for use by the stack walking procedure. The stack walking procedure calls the registered callback function when it is unable to locate a function table entry for an address. In most cases, the stack walking procedure locates the function table entries in the function table of the image containing the address. However, in situations where the function table entries are not in the image, this callback allows the debugger to provide the function table entry from another source. For example, run-time generated code on Alpha computers can define dynamic function tables to support exception handling and stack tracing.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymRegisterFunctionEntryCallback</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymRegisterFunctionEntryCallback</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-stackwalk">StackWalk64</a> function.
     * @param {Pointer<PSYMBOL_FUNCENTRY_CALLBACK64>} CallbackFunction A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psymbol_funcentry_callback">SymRegisterFunctionEntryCallbackProc64</a> callback function.
     * @param {Integer} UserContext A user-defined value or <b>NULL</b>. This value is simply passed to the callback function. Normally, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some context.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symregisterfunctionentrycallback64
     */
    static SymRegisterFunctionEntryCallback64(hProcess, CallbackFunction, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymRegisterFunctionEntryCallback64", "ptr", hProcess, "ptr", CallbackFunction, "uint", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a callback function for use by the symbol handler. (SymRegisterCallback)
     * @remarks
     * The 
     * <b>SymRegisterCallback64</b> function lets an application register a callback function for use by the symbol handler. The symbol handler calls the registered callback function when there is status or progress information for the application.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymRegisterCallbackW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * SymRegisterCallbackW64(
     *     __in HANDLE hProcess,
     *     __in PSYMBOL_REGISTERED_CALLBACK64 CallbackFunction,
     *     __in ULONG64 UserContext
     *     );
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<PSYMBOL_REGISTERED_CALLBACK>} CallbackFunction A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psymbol_registered_callback">SymRegisterCallbackProc64</a> callback function.
     * @param {Pointer<Void>} UserContext A user-defined value or <b>NULL</b>. This value is simply passed to the callback function. Normally, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some context.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symregistercallback
     */
    static SymRegisterCallback(hProcess, CallbackFunction, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymRegisterCallback", "ptr", hProcess, "ptr", CallbackFunction, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a callback function for use by the stack walking procedure on Alpha computers. (SymRegisterFunctionEntryCallback)
     * @remarks
     * The 
     * <b>SymRegisterFunctionEntryCallback64</b> function lets an application register a callback function for use by the stack walking procedure. The stack walking procedure calls the registered callback function when it is unable to locate a function table entry for an address. In most cases, the stack walking procedure locates the function table entries in the function table of the image containing the address. However, in situations where the function table entries are not in the image, this callback allows the debugger to provide the function table entry from another source. For example, run-time generated code on Alpha computers can define dynamic function tables to support exception handling and stack tracing.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymRegisterFunctionEntryCallback</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymRegisterFunctionEntryCallback</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-stackwalk">StackWalk64</a> function.
     * @param {Pointer<PSYMBOL_FUNCENTRY_CALLBACK>} CallbackFunction A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psymbol_funcentry_callback">SymRegisterFunctionEntryCallbackProc64</a> callback function.
     * @param {Pointer<Void>} UserContext A user-defined value or <b>NULL</b>. This value is simply passed to the callback function. Normally, this parameter is used by an application to pass a pointer to a data structure that lets the callback function establish some context.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symregisterfunctionentrycallback
     */
    static SymRegisterFunctionEntryCallback(hProcess, CallbackFunction, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymRegisterFunctionEntryCallback", "ptr", hProcess, "ptr", CallbackFunction, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets context information used by the SymEnumSymbols function. This function only works with PDB symbols.
     * @remarks
     * If you call <b>SymSetContext</b> to set the context to its 
     *     current value, the function fails but <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> 
     *     returns <b>ERROR_SUCCESS</b>.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to 
     *     this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize 
     *     all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<IMAGEHLP_STACK_FRAME>} StackFrame A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_stack_frame">IMAGEHLP_STACK_FRAME</a> 
     *       structure that contains frame information.
     * @param {Pointer<Void>} Context This parameter is ignored.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsetcontext
     */
    static SymSetContext(hProcess, StackFrame, Context) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSetContext", "ptr", hProcess, "ptr", StackFrame, "ptr", Context, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the local scope to the symbol that matches the specified address.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Address The address.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsetscopefromaddr
     */
    static SymSetScopeFromAddr(hProcess, Address) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSetScopeFromAddr", "ptr", hProcess, "uint", Address, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the local scope to the symbol that matches the specified address and inline context.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Address The address.
     * @param {Integer} InlineContext The inline context.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsetscopefrominlinecontext
     */
    static SymSetScopeFromInlineContext(hProcess, Address, InlineContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSetScopeFromInlineContext", "ptr", hProcess, "uint", Address, "uint", InlineContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the local scope to the symbol that matches the specified index.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Integer} Index The unique value for the symbol.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsetscopefromindex
     */
    static SymSetScopeFromIndex(hProcess, BaseOfDll, Index) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSetScopeFromIndex", "ptr", hProcess, "uint", BaseOfDll, "uint", Index, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates each process that has called the SymInitialize function.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<PSYM_ENUMPROCESSES_CALLBACK>} EnumProcessesCallback A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumprocesses_callback">SymEnumProcessesProc</a> callback function that receives the process information.
     * @param {Pointer<Void>} UserContext A user-defined value that is passed to the callback function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumprocesses
     */
    static SymEnumProcesses(EnumProcessesCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumProcesses", "ptr", EnumProcessesCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFromAddr function (dbghelp.h) retrieves symbol information for the specified address.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Address The address for which a symbol should be located. The address does not have to be on a symbol boundary. If the address comes after the beginning of a symbol and before the end of the symbol, the symbol is found.
     * @param {Pointer<UInt64>} Displacement The displacement from the beginning of the symbol, or zero.
     * @param {Pointer<SYMBOL_INFO>} Symbol A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that provides information about the symbol. The symbol name is variable in length; therefore this buffer must be large enough to hold the name stored at the end of the 
     * <b>SYMBOL_INFO</b> structure. Be sure to set the <b>MaxNameLen</b> member to the number of bytes reserved for the name.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfromaddr
     */
    static SymFromAddr(hProcess, Address, Displacement, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFromAddr", "ptr", hProcess, "uint", Address, "uint*", Displacement, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFromAddrW (Unicode) function retrieves symbol information for the specified address.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Address The address for which a symbol should be located. The address does not have to be on a symbol boundary. If the address comes after the beginning of a symbol and before the end of the symbol, the symbol is found.
     * @param {Pointer<UInt64>} Displacement The displacement from the beginning of the symbol, or zero.
     * @param {Pointer<SYMBOL_INFOW>} Symbol A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that provides information about the symbol. The symbol name is variable in length; therefore this buffer must be large enough to hold the name stored at the end of the 
     * <b>SYMBOL_INFO</b> structure. Be sure to set the <b>MaxNameLen</b> member to the number of bytes reserved for the name.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfromaddrw
     */
    static SymFromAddrW(hProcess, Address, Displacement, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFromAddrW", "ptr", hProcess, "uint", Address, "uint*", Displacement, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFromInlineContext function (dbghelp.h) retrieves symbol information for the specified address and inline context.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Address The address for which a symbol should be located. The address does not have to be on a symbol boundary. If 
     *       the address comes after the beginning of a symbol and before the end of the symbol, the symbol is found.
     * @param {Integer} InlineContext The inline context for which a symbol should be located.
     * @param {Pointer<UInt64>} Displacement The displacement from the beginning of the symbol, or zero.
     * @param {Pointer<SYMBOL_INFO>} Symbol A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that 
     *       provides information about the symbol. The symbol name is variable in length; therefore this buffer must be 
     *       large enough to hold the name stored at the end of the 
     *       <b>SYMBOL_INFO</b> structure. Be sure to set the 
     *       <b>MaxNameLen</b> member to the number of bytes reserved for the name.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfrominlinecontext
     */
    static SymFromInlineContext(hProcess, Address, InlineContext, Displacement, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFromInlineContext", "ptr", hProcess, "uint", Address, "uint", InlineContext, "uint*", Displacement, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFromInlineContextW (Unicode) function retrieves symbol information for the specified address and inline context.
     * @remarks
     * > [!NOTE]
     * > The dbghelp.h header defines SymFromInlineContext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Address The address for which a symbol should be located. The address does not have to be on a symbol boundary. If 
     *       the address comes after the beginning of a symbol and before the end of the symbol, the symbol is found.
     * @param {Integer} InlineContext The inline context for which a symbol should be located.
     * @param {Pointer<UInt64>} Displacement The displacement from the beginning of the symbol, or zero.
     * @param {Pointer<SYMBOL_INFOW>} Symbol A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that 
     *       provides information about the symbol. The symbol name is variable in length; therefore this buffer must be 
     *       large enough to hold the name stored at the end of the 
     *       <b>SYMBOL_INFO</b> structure. Be sure to set the 
     *       <b>MaxNameLen</b> member to the number of bytes reserved for the name.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfrominlinecontextw
     */
    static SymFromInlineContextW(hProcess, Address, InlineContext, Displacement, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFromInlineContextW", "ptr", hProcess, "uint", Address, "uint", InlineContext, "uint*", Displacement, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFromToken function (dbghelp.h) retrieves symbol information for the specified managed code token.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the managed code module.
     * @param {Integer} Token The managed code token.
     * @param {Pointer<SYMBOL_INFO>} Symbol A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that provides information about the symbol.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfromtoken
     */
    static SymFromToken(hProcess, Base, Token, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFromToken", "ptr", hProcess, "uint", Base, "uint", Token, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFromTokenW (Unicode) function retrieves symbol information for the specified managed code token.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymFromToken as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the managed code module.
     * @param {Integer} Token The managed code token.
     * @param {Pointer<SYMBOL_INFOW>} Symbol A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that provides information about the symbol.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfromtokenw
     */
    static SymFromTokenW(hProcess, Base, Token, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFromTokenW", "ptr", hProcess, "uint", Base, "uint", Token, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymNext function (dbghelp.h) retrieves symbol information for the next symbol.
     * @remarks
     * This function requires that the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure have valid data for the current symbol. The next symbol is the symbol with the virtual address that is next in the sequence.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<SYMBOL_INFO>} si A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that provides information about the current symbol. Upon return, the structure contains information about the next symbol.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symnext
     */
    static SymNext(hProcess, si) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymNext", "ptr", hProcess, "ptr", si, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymNextW (Unicode) function retrieves symbol information for the next symbol.
     * @remarks
     * This function requires that the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure have valid data for the current symbol. The next symbol is the symbol with the virtual address that is next in the sequence.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymNext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<SYMBOL_INFOW>} siw A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that provides information about the current symbol. Upon return, the structure contains information about the next symbol.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symnextw
     */
    static SymNextW(hProcess, siw) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymNextW", "ptr", hProcess, "ptr", siw, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymPrev function (dbghelp.h) retrieves symbol information for the previous symbol.
     * @remarks
     * This function requires that the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure have valid data for the current symbol. The previous symbol is the symbol with a virtual address that immediately precedes this symbol.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<SYMBOL_INFO>} si A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that provides information about the current symbol. Upon return, the structure contains information about the previous symbol.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symprev
     */
    static SymPrev(hProcess, si) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymPrev", "ptr", hProcess, "ptr", si, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymPrevW (Unicode) function (dbghelp.h) retrieves symbol information for the previous symbol.
     * @remarks
     * This function requires that the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure have valid data for the current symbol. The previous symbol is the symbol with a virtual address that immediately precedes this symbol.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymPrev as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<SYMBOL_INFOW>} siw A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that provides information about the current symbol. Upon return, the structure contains information about the previous symbol.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symprevw
     */
    static SymPrevW(hProcess, siw) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymPrevW", "ptr", hProcess, "ptr", siw, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFromName function (dbghelp.h) retrieves symbol information for the specified name.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} Name The name of the symbol to be located.
     * @param {Pointer<SYMBOL_INFO>} Symbol A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that provides information about the symbol.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfromname
     */
    static SymFromName(hProcess, Name, Symbol) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFromName", "ptr", hProcess, "ptr", Name, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFromNameW (Unicode) function retrieves symbol information for the specified name.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Char>} Name The name of the symbol to be located.
     * @param {Pointer<SYMBOL_INFOW>} Symbol A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that provides information about the symbol.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfromnamew
     */
    static SymFromNameW(hProcess, Name, Symbol) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFromNameW", "ptr", hProcess, "ptr", Name, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumSymbols function (dbghelp.h) enumerates all symbols in a process.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to 
     *     this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize 
     *     all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define 
     *     <b>DBGHELP_TRANSLATE_TCHAR</b>.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module. If this value is zero and <i>Mask</i> contains an 
     *       exclamation point (!), the function looks across modules. If this value is zero and 
     *       <i>Mask</i> does not contain an exclamation point, the function uses the scope established by 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * @param {Pointer<Byte>} Mask A wildcard string that indicates the names of the symbols to be enumerated. The text can optionally contain 
     *        the wildcards, "*" and "?".
     * 
     * To specify a specific module or set of modules, begin the text with a wildcard string specifying the module, 
     *        followed by an exclamation point. When specifying a module, <i>BaseOfDll</i> is ignored.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="foo"></a><a id="FOO"></a><dl>
     * <dt><b>foo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <i>BaseOfDll</i> is not zero, then 
     *          <b>SymEnumSymbols</b> will look for a global symbol named 
     *          "foo".
     * 
     * If <i>BaseOfDll</i> is zero, then 
     *          <b>SymEnumSymbols</b> will look for a local symbol named 
     *          "foo" within the scope established by the most recent call to the 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="foo_"></a><a id="FOO_"></a><dl>
     * <dt><b>foo?</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <i>BaseOfDll</i> is not zero, then 
     *          <b>SymEnumSymbols</b> will look for a global symbol that 
     *          starts with "foo" and contains one extra character afterwards, such as 
     *          "fool" and "foot".
     * 
     * If <i>BaseOfDll</i> is zero, then 
     *          <b>SymEnumSymbols</b> will look for a symbol that starts 
     *          with "foo" and contains one extra character afterwards, such as "fool" and 
     *          "foot". The search would be within the scope established by the most recent call to the 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="foo__bar"></a><a id="FOO__BAR"></a><dl>
     * <dt><b>foo*!bar</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>SymEnumSymbols</b> will look in every loaded module 
     *          that starts with the text "foo" for a symbol called "bar".  It could find 
     *          matches such as these, "foot!bar", "footlocker!bar", and 
     *          "fool!bar".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="___"></a><dl>
     * <dt><b>*!*</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>SymEnumSymbols</b> will enumerate every symbol in 
     *          every loaded module.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<PSYM_ENUMERATESYMBOLS_CALLBACK>} EnumSymbolsCallback A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumeratesymbols_callback">SymEnumSymbolsProc</a> callback function that 
     *       receives the symbol information.
     * @param {Pointer<Void>} UserContext A user-defined value that is passed to the callback function, or <b>NULL</b>. This 
     *       parameter is typically used by an application to pass a pointer to a data structure that provides context for 
     *       the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumsymbols
     */
    static SymEnumSymbols(hProcess, BaseOfDll, Mask, EnumSymbolsCallback, UserContext) {
        Mask := Mask is String? StrPtr(Mask) : Mask

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumSymbols", "ptr", hProcess, "uint", BaseOfDll, "ptr", Mask, "ptr", EnumSymbolsCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumSymbolsEx function (dbghelp.h) enumerates all symbols in a process.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module. If this value is zero and <i>Mask</i> contains an 
     *       exclamation point (!), the function looks across modules. If this value is zero and 
     *       <i>Mask</i> does not contain an exclamation point, the function uses the scope established by 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * @param {Pointer<Byte>} Mask A wildcard string that indicates the names of the symbols to be enumerated. The text can optionally contain 
     *        the wildcards, "*" and "?".
     * 
     * To specify a specific module or set of modules, begin the text with a wildcard string specifying the module, 
     *        followed by an exclamation point. When specifying a module, <i>BaseOfDll</i> is ignored.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="foo"></a><a id="FOO"></a><dl>
     * <dt><b>foo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <i>BaseOfDll</i> is not zero, then 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumsymbols">SymEnumSymbols</a> will look for a global symbol named 
     *          "foo".
     * 
     * If <i>BaseOfDll</i> is zero, then 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumsymbols">SymEnumSymbols</a> will look for a local symbol named 
     *          "foo" within the scope established by the most recent call to the 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="foo_"></a><a id="FOO_"></a><dl>
     * <dt><b>foo?</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <i>BaseOfDll</i> is not zero, then 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumsymbols">SymEnumSymbols</a> will look for a global symbol that 
     *          starts with "foo" and contains one extra character afterwards, such as 
     *          "fool" and "foot".
     * 
     * If <i>BaseOfDll</i> is zero, then 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumsymbols">SymEnumSymbols</a> will look for a symbol that starts 
     *          with "foo" and contains one extra character afterwards, such as "fool" and 
     *          "foot". The search would be within the scope established by the most recent call to the 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="foo__bar"></a><a id="FOO__BAR"></a><dl>
     * <dt><b>foo*!bar</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumsymbols">SymEnumSymbols</a> will look in every loaded module 
     *          that starts with the text "foo" for a symbol called "bar".  It could find 
     *          matches such as these, "foot!bar", "footlocker!bar", and 
     *          "fool!bar".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="___"></a><dl>
     * <dt><b>*!*</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumsymbols">SymEnumSymbols</a> will enumerate every symbol in 
     *          every loaded module.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<PSYM_ENUMERATESYMBOLS_CALLBACK>} EnumSymbolsCallback A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumeratesymbols_callback">SymEnumSymbolsProc</a> callback function that 
     *       receives the symbol information.
     * @param {Pointer<Void>} UserContext A user-defined value that is passed to the callback function, or <b>NULL</b>. This 
     *       parameter is typically used by an application to pass a pointer to a data structure that provides context for 
     *       the callback function.
     * @param {Integer} Options Indicates possible options.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMENUM_OPTIONS_DEFAULT"></a><a id="symenum_options_default"></a><dl>
     * <dt><b>SYMENUM_OPTIONS_DEFAULT</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the default options.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMENUM_OPTIONS_INLINE"></a><a id="symenum_options_inline"></a><dl>
     * <dt><b>SYMENUM_OPTIONS_INLINE</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate inline symbols.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumsymbolsex
     */
    static SymEnumSymbolsEx(hProcess, BaseOfDll, Mask, EnumSymbolsCallback, UserContext, Options) {
        Mask := Mask is String? StrPtr(Mask) : Mask

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumSymbolsEx", "ptr", hProcess, "uint", BaseOfDll, "ptr", Mask, "ptr", EnumSymbolsCallback, "ptr", UserContext, "uint", Options, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumSymbolsW (Unicode) function enumerates all symbols in a process.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to 
     *     this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize 
     *     all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define 
     *     <b>DBGHELP_TRANSLATE_TCHAR</b>.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module. If this value is zero and <i>Mask</i> contains an 
     *       exclamation point (!), the function looks across modules. If this value is zero and 
     *       <i>Mask</i> does not contain an exclamation point, the function uses the scope established by 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * @param {Pointer<Char>} Mask A wildcard string that indicates the names of the symbols to be enumerated. The text can optionally contain 
     *        the wildcards, "*" and "?".
     * 
     * To specify a specific module or set of modules, begin the text with a wildcard string specifying the module, 
     *        followed by an exclamation point. When specifying a module, <i>BaseOfDll</i> is ignored.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="foo"></a><a id="FOO"></a><dl>
     * <dt><b>foo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <i>BaseOfDll</i> is not zero, then 
     *          <b>SymEnumSymbols</b> will look for a global symbol named 
     *          "foo".
     * 
     * If <i>BaseOfDll</i> is zero, then 
     *          <b>SymEnumSymbols</b> will look for a local symbol named 
     *          "foo" within the scope established by the most recent call to the 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="foo_"></a><a id="FOO_"></a><dl>
     * <dt><b>foo?</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <i>BaseOfDll</i> is not zero, then 
     *          <b>SymEnumSymbols</b> will look for a global symbol that 
     *          starts with "foo" and contains one extra character afterwards, such as 
     *          "fool" and "foot".
     * 
     * If <i>BaseOfDll</i> is zero, then 
     *          <b>SymEnumSymbols</b> will look for a symbol that starts 
     *          with "foo" and contains one extra character afterwards, such as "fool" and 
     *          "foot". The search would be within the scope established by the most recent call to the 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="foo__bar"></a><a id="FOO__BAR"></a><dl>
     * <dt><b>foo*!bar</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>SymEnumSymbols</b> will look in every loaded module 
     *          that starts with the text "foo" for a symbol called "bar".  It could find 
     *          matches such as these, "foot!bar", "footlocker!bar", and 
     *          "fool!bar".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="___"></a><dl>
     * <dt><b>*!*</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>SymEnumSymbols</b> will enumerate every symbol in 
     *          every loaded module.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<PSYM_ENUMERATESYMBOLS_CALLBACKW>} EnumSymbolsCallback A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumeratesymbols_callback">SymEnumSymbolsProc</a> callback function that 
     *       receives the symbol information.
     * @param {Pointer<Void>} UserContext A user-defined value that is passed to the callback function, or <b>NULL</b>. This 
     *       parameter is typically used by an application to pass a pointer to a data structure that provides context for 
     *       the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumsymbolsw
     */
    static SymEnumSymbolsW(hProcess, BaseOfDll, Mask, EnumSymbolsCallback, UserContext) {
        Mask := Mask is String? StrPtr(Mask) : Mask

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumSymbolsW", "ptr", hProcess, "uint", BaseOfDll, "ptr", Mask, "ptr", EnumSymbolsCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumSymbolsExW (Unicode) function enumerates all symbols in a process.
     * @remarks
     * > [!NOTE]
     * > The dbghelp.h header defines SymEnumSymbolsEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module. If this value is zero and <i>Mask</i> contains an 
     *       exclamation point (!), the function looks across modules. If this value is zero and 
     *       <i>Mask</i> does not contain an exclamation point, the function uses the scope established by 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * @param {Pointer<Char>} Mask A wildcard string that indicates the names of the symbols to be enumerated. The text can optionally contain 
     *        the wildcards, "*" and "?".
     * 
     * To specify a specific module or set of modules, begin the text with a wildcard string specifying the module, 
     *        followed by an exclamation point. When specifying a module, <i>BaseOfDll</i> is ignored.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="foo"></a><a id="FOO"></a><dl>
     * <dt><b>foo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <i>BaseOfDll</i> is not zero, then 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumsymbols">SymEnumSymbols</a> will look for a global symbol named 
     *          "foo".
     * 
     * If <i>BaseOfDll</i> is zero, then 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumsymbols">SymEnumSymbols</a> will look for a local symbol named 
     *          "foo" within the scope established by the most recent call to the 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="foo_"></a><a id="FOO_"></a><dl>
     * <dt><b>foo?</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <i>BaseOfDll</i> is not zero, then 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumsymbols">SymEnumSymbols</a> will look for a global symbol that 
     *          starts with "foo" and contains one extra character afterwards, such as 
     *          "fool" and "foot".
     * 
     * If <i>BaseOfDll</i> is zero, then 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumsymbols">SymEnumSymbols</a> will look for a symbol that starts 
     *          with "foo" and contains one extra character afterwards, such as "fool" and 
     *          "foot". The search would be within the scope established by the most recent call to the 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="foo__bar"></a><a id="FOO__BAR"></a><dl>
     * <dt><b>foo*!bar</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumsymbols">SymEnumSymbols</a> will look in every loaded module 
     *          that starts with the text "foo" for a symbol called "bar".  It could find 
     *          matches such as these, "foot!bar", "footlocker!bar", and 
     *          "fool!bar".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="___"></a><dl>
     * <dt><b>*!*</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symenumsymbols">SymEnumSymbols</a> will enumerate every symbol in 
     *          every loaded module.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<PSYM_ENUMERATESYMBOLS_CALLBACKW>} EnumSymbolsCallback A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumeratesymbols_callback">SymEnumSymbolsProc</a> callback function that 
     *       receives the symbol information.
     * @param {Pointer<Void>} UserContext A user-defined value that is passed to the callback function, or <b>NULL</b>. This 
     *       parameter is typically used by an application to pass a pointer to a data structure that provides context for 
     *       the callback function.
     * @param {Integer} Options Indicates possible options.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMENUM_OPTIONS_DEFAULT"></a><a id="symenum_options_default"></a><dl>
     * <dt><b>SYMENUM_OPTIONS_DEFAULT</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the default options.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMENUM_OPTIONS_INLINE"></a><a id="symenum_options_inline"></a><dl>
     * <dt><b>SYMENUM_OPTIONS_INLINE</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate inline symbols.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumsymbolsexw
     */
    static SymEnumSymbolsExW(hProcess, BaseOfDll, Mask, EnumSymbolsCallback, UserContext, Options) {
        Mask := Mask is String? StrPtr(Mask) : Mask

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumSymbolsExW", "ptr", hProcess, "uint", BaseOfDll, "ptr", Mask, "ptr", EnumSymbolsCallback, "ptr", UserContext, "uint", Options, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumSymbolsForAddr function (dbghelp.h) enumerates the symbols for the specified address.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Address The address for which symbols are to be located. The address does not have to be on a symbol boundary. If the address comes after the beginning of a symbol and before the end of the symbol (the beginning of the symbol plus the symbol size), the function will find the symbol.
     * @param {Pointer<PSYM_ENUMERATESYMBOLS_CALLBACK>} EnumSymbolsCallback An application-defined callback function. This function is called for every symbol found at <i>Address</i>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumeratesymbols_callback">SymEnumSymbolsProc</a>.
     * @param {Pointer<Void>} UserContext Optional user-defined data. This value is passed to the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumsymbolsforaddr
     */
    static SymEnumSymbolsForAddr(hProcess, Address, EnumSymbolsCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumSymbolsForAddr", "ptr", hProcess, "uint", Address, "ptr", EnumSymbolsCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumSymbolsForAddrW (Unicode) function enumerates the symbols for the specified address.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymEnumSymbolsForAddr as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Address The address for which symbols are to be located. The address does not have to be on a symbol boundary. If the address comes after the beginning of a symbol and before the end of the symbol (the beginning of the symbol plus the symbol size), the function will find the symbol.
     * @param {Pointer<PSYM_ENUMERATESYMBOLS_CALLBACKW>} EnumSymbolsCallback An application-defined callback function. This function is called for every symbol found at <i>Address</i>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumeratesymbols_callback">SymEnumSymbolsProc</a>.
     * @param {Pointer<Void>} UserContext Optional user-defined data. This value is passed to the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumsymbolsforaddrw
     */
    static SymEnumSymbolsForAddrW(hProcess, Address, EnumSymbolsCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumSymbolsForAddrW", "ptr", hProcess, "uint", Address, "ptr", EnumSymbolsCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSearch function (dbghelp.h) searches for PDB symbols that meet the specified criteria.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module. If this value is zero and <i>Mask</i> contains an exclamation point (!), the function looks across modules. If this value is zero and <i>Mask</i> does not contain an exclamation point, the function uses the scope established by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * @param {Integer} Index A unique value for the symbol.
     * @param {Integer} SymTag The PDB classification. These values are defined in Dbghelp.h in the <b>SymTagEnum</b> enumeration type. For  descriptions, see the PDB documentation.
     * @param {Pointer<Byte>} Mask A wildcard expression that indicates the names of the symbols to be enumerated. To specify a module name, use the !<i>mod</i> syntax.
     * @param {Integer} Address The address of the symbol.
     * @param {Pointer<PSYM_ENUMERATESYMBOLS_CALLBACK>} EnumSymbolsCallback A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumeratesymbols_callback">SymEnumSymbolsProc</a> callback function that receives the symbol information.
     * @param {Pointer<Void>} UserContext A user-defined value that is passed to the callback function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
     * @param {Integer} Options The options that control the behavior of this function.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMSEARCH_ALLITEMS"></a><a id="symsearch_allitems"></a><dl>
     * <dt><b>SYMSEARCH_ALLITEMS</b></dt>
     * <dt>0x08</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include all symbols and other data in the .pdb files.
     * 
     * <b>DbgHelp 6.6 and earlier:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMSEARCH_GLOBALSONLY"></a><a id="symsearch_globalsonly"></a><dl>
     * <dt><b>SYMSEARCH_GLOBALSONLY</b></dt>
     * <dt>0x04</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search only for global symbols.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMSEARCH_MASKOBJS"></a><a id="symsearch_maskobjs"></a><dl>
     * <dt><b>SYMSEARCH_MASKOBJS</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For internal use only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMSEARCH_RECURSE"></a><a id="symsearch_recurse"></a><dl>
     * <dt><b>SYMSEARCH_RECURSE</b></dt>
     * <dt>0x02</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recurse from the top to find all symbols.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsearch
     */
    static SymSearch(hProcess, BaseOfDll, Index, SymTag, Mask, Address, EnumSymbolsCallback, UserContext, Options) {
        Mask := Mask is String? StrPtr(Mask) : Mask

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSearch", "ptr", hProcess, "uint", BaseOfDll, "uint", Index, "uint", SymTag, "ptr", Mask, "uint", Address, "ptr", EnumSymbolsCallback, "ptr", UserContext, "uint", Options, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSearchW (Unicode) function (dbghelp.h) searches for PDB symbols that meet the specified criteria.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymSearch as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module. If this value is zero and <i>Mask</i> contains an exclamation point (!), the function looks across modules. If this value is zero and <i>Mask</i> does not contain an exclamation point, the function uses the scope established by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetcontext">SymSetContext</a> function.
     * @param {Integer} Index A unique value for the symbol.
     * @param {Integer} SymTag The PDB classification. These values are defined in Dbghelp.h in the <b>SymTagEnum</b> enumeration type. For  descriptions, see the PDB documentation.
     * @param {Pointer<Char>} Mask A wildcard expression that indicates the names of the symbols to be enumerated. To specify a module name, use the !<i>mod</i> syntax.
     * @param {Integer} Address The address of the symbol.
     * @param {Pointer<PSYM_ENUMERATESYMBOLS_CALLBACKW>} EnumSymbolsCallback A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumeratesymbols_callback">SymEnumSymbolsProc</a> callback function that receives the symbol information.
     * @param {Pointer<Void>} UserContext A user-defined value that is passed to the callback function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context for the callback function.
     * @param {Integer} Options The options that control the behavior of this function.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMSEARCH_ALLITEMS"></a><a id="symsearch_allitems"></a><dl>
     * <dt><b>SYMSEARCH_ALLITEMS</b></dt>
     * <dt>0x08</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include all symbols and other data in the .pdb files.
     * 
     * <b>DbgHelp 6.6 and earlier:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMSEARCH_GLOBALSONLY"></a><a id="symsearch_globalsonly"></a><dl>
     * <dt><b>SYMSEARCH_GLOBALSONLY</b></dt>
     * <dt>0x04</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Search only for global symbols.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMSEARCH_MASKOBJS"></a><a id="symsearch_maskobjs"></a><dl>
     * <dt><b>SYMSEARCH_MASKOBJS</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For internal use only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYMSEARCH_RECURSE"></a><a id="symsearch_recurse"></a><dl>
     * <dt><b>SYMSEARCH_RECURSE</b></dt>
     * <dt>0x02</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recurse from the top to find all symbols.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsearchw
     */
    static SymSearchW(hProcess, BaseOfDll, Index, SymTag, Mask, Address, EnumSymbolsCallback, UserContext, Options) {
        Mask := Mask is String? StrPtr(Mask) : Mask

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSearchW", "ptr", hProcess, "uint", BaseOfDll, "uint", Index, "uint", SymTag, "ptr", Mask, "uint", Address, "ptr", EnumSymbolsCallback, "ptr", UserContext, "uint", Options, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetScope function (dbghelp.h) retrieves the scope for the specified index.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Integer} Index A unique value for the symbol.
     * @param {Pointer<SYMBOL_INFO>} Symbol A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure. The <b>Scope</b> member contains the scope.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetscope
     */
    static SymGetScope(hProcess, BaseOfDll, Index, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetScope", "ptr", hProcess, "uint", BaseOfDll, "uint", Index, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetScopeW (Unicode) function retrieves the scope for the specified index.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymGetScope as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Integer} Index A unique value for the symbol.
     * @param {Pointer<SYMBOL_INFOW>} Symbol A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure. The <b>Scope</b> member contains the scope.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetscopew
     */
    static SymGetScopeW(hProcess, BaseOfDll, Index, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetScopeW", "ptr", hProcess, "uint", BaseOfDll, "uint", Index, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFromIndex function (dbghelp.h) retrieves symbol information for the specified index.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Integer} Index A unique value for the symbol.
     * @param {Pointer<SYMBOL_INFO>} Symbol A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that provides information about the symbol.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfromindex
     */
    static SymFromIndex(hProcess, BaseOfDll, Index, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFromIndex", "ptr", hProcess, "uint", BaseOfDll, "uint", Index, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymFromIndexW (Unicode) function retrieves symbol information for the specified index.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymFromIndex as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Integer} Index A unique value for the symbol.
     * @param {Pointer<SYMBOL_INFOW>} Symbol A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure that provides information about the symbol.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symfromindexw
     */
    static SymFromIndexW(hProcess, BaseOfDll, Index, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymFromIndexW", "ptr", hProcess, "uint", BaseOfDll, "uint", Index, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves type information for the specified type index.
     * @remarks
     * For more details on the type information, see the documentation for the PDB format.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} ModBase The base address of the module.
     * @param {Integer} TypeId The type index. (A number of functions return a type index in the <b>TypeIndex</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure.)
     * @param {Integer} GetType The information type. This parameter can be one of more of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ne-dbghelp-imagehlp_symbol_type_info">IMAGEHLP_SYMBOL_TYPE_INFO</a> enumeration type.
     * @param {Pointer<Void>} pInfo The data. The format of the data depends on the value of the <i>GetType</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgettypeinfo
     */
    static SymGetTypeInfo(hProcess, ModBase, TypeId, GetType, pInfo) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetTypeInfo", "ptr", hProcess, "uint", ModBase, "uint", TypeId, "int", GetType, "ptr", pInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves multiple pieces of type information.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} ModBase The base address of the module.
     * @param {Pointer<IMAGEHLP_GET_TYPE_INFO_PARAMS>} Params A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_get_type_info_params">IMAGEHLP_GET_TYPE_INFO_PARAMS</a> structure that specifies input and output information for the query.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgettypeinfoex
     */
    static SymGetTypeInfoEx(hProcess, ModBase, Params) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetTypeInfoEx", "ptr", hProcess, "uint", ModBase, "ptr", Params, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumTypes function (dbghelp.h) enumerates all user-defined types.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Pointer<PSYM_ENUMERATESYMBOLS_CALLBACK>} EnumSymbolsCallback A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumeratesymbols_callback">SymEnumSymbolsProc</a> callback function that receives the symbol information.
     * @param {Pointer<Void>} UserContext A user-defined value to be passed to the callback function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context information for the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumtypes
     */
    static SymEnumTypes(hProcess, BaseOfDll, EnumSymbolsCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumTypes", "ptr", hProcess, "uint", BaseOfDll, "ptr", EnumSymbolsCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumTypesW (Unicode) function enumerates all user-defined types.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymEnumTypes as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Pointer<PSYM_ENUMERATESYMBOLS_CALLBACKW>} EnumSymbolsCallback A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumeratesymbols_callback">SymEnumSymbolsProc</a> callback function that receives the symbol information.
     * @param {Pointer<Void>} UserContext A user-defined value to be passed to the callback function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context information for the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumtypesw
     */
    static SymEnumTypesW(hProcess, BaseOfDll, EnumSymbolsCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumTypesW", "ptr", hProcess, "uint", BaseOfDll, "ptr", EnumSymbolsCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumTypesByName function (dbghelp.h) enumerates all user-defined types.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Pointer<Byte>} mask A wildcard expression that indicates the names of the symbols to be enumerated. To specify a module name, use the !<i>mod</i> syntax.
     * @param {Pointer<PSYM_ENUMERATESYMBOLS_CALLBACK>} EnumSymbolsCallback A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumeratesymbols_callback">SymEnumSymbolsProc</a> callback function that receives the symbol information.
     * @param {Pointer<Void>} UserContext A user-defined value to be passed to the callback function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context information for the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumtypesbyname
     */
    static SymEnumTypesByName(hProcess, BaseOfDll, mask, EnumSymbolsCallback, UserContext) {
        mask := mask is String? StrPtr(mask) : mask

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumTypesByName", "ptr", hProcess, "uint", BaseOfDll, "ptr", mask, "ptr", EnumSymbolsCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumTypesByNameW (Unicode) function enumerates all user-defined types.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymEnumTypesByName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Pointer<Char>} mask A wildcard expression that indicates the names of the symbols to be enumerated. To specify a module name, use the !<i>mod</i> syntax.
     * @param {Pointer<PSYM_ENUMERATESYMBOLS_CALLBACKW>} EnumSymbolsCallback A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumeratesymbols_callback">SymEnumSymbolsProc</a> callback function that receives the symbol information.
     * @param {Pointer<Void>} UserContext A user-defined value to be passed to the callback function, or <b>NULL</b>. This parameter is typically used by an application to pass a pointer to a data structure that provides context information for the callback function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumtypesbynamew
     */
    static SymEnumTypesByNameW(hProcess, BaseOfDll, mask, EnumSymbolsCallback, UserContext) {
        mask := mask is String? StrPtr(mask) : mask

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumTypesByNameW", "ptr", hProcess, "uint", BaseOfDll, "ptr", mask, "ptr", EnumSymbolsCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetTypeFromName function (dbghelp.h) retrieves a type index for the specified type name.
     * @remarks
     * To retrieve information about the type, pass the type index to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgettypeinfo">SymGetTypeInfo</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Pointer<Byte>} Name The name of the type.
     * @param {Pointer<SYMBOL_INFO>} Symbol A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure. The <b>TypeIndex</b> member contains the type index.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgettypefromname
     */
    static SymGetTypeFromName(hProcess, BaseOfDll, Name, Symbol) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetTypeFromName", "ptr", hProcess, "uint", BaseOfDll, "ptr", Name, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetTypeFromNameW (Unicode) function retrieves a type index for the specified type name.
     * @remarks
     * To retrieve information about the type, pass the type index to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgettypeinfo">SymGetTypeInfo</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymGetTypeFromName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Pointer<Char>} Name The name of the type.
     * @param {Pointer<SYMBOL_INFOW>} Symbol A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symbol_info">SYMBOL_INFO</a> structure. The <b>TypeIndex</b> member contains the type index.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgettypefromnamew
     */
    static SymGetTypeFromNameW(hProcess, BaseOfDll, Name, Symbol) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetTypeFromNameW", "ptr", hProcess, "uint", BaseOfDll, "ptr", Name, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymAddSymbol function (dbghelp.h) adds a virtual symbol to the specified module.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Pointer<Byte>} Name The name of the symbol. The maximum size of a symbol name is MAX_SYM_NAME characters.
     * @param {Integer} Address The address of the symbol. This address must be within the address range of the specified module.
     * @param {Integer} Size The size of the symbol, in bytes. This parameter is optional.
     * @param {Integer} Flags This parameter is unused.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symaddsymbol
     */
    static SymAddSymbol(hProcess, BaseOfDll, Name, Address, Size, Flags) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymAddSymbol", "ptr", hProcess, "uint", BaseOfDll, "ptr", Name, "uint", Address, "uint", Size, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymAddSymbolW (Unicode) function adds a virtual symbol to the specified module.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymAddSymbol as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Pointer<Char>} Name The name of the symbol. The maximum size of a symbol name is MAX_SYM_NAME characters.
     * @param {Integer} Address The address of the symbol. This address must be within the address range of the specified module.
     * @param {Integer} Size The size of the symbol, in bytes. This parameter is optional.
     * @param {Integer} Flags This parameter is unused.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symaddsymbolw
     */
    static SymAddSymbolW(hProcess, BaseOfDll, Name, Address, Size, Flags) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymAddSymbolW", "ptr", hProcess, "uint", BaseOfDll, "ptr", Name, "uint", Address, "uint", Size, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymDeleteSymbol function (dbghelp.h) deletes a virtual symbol from the specified module.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Pointer<Byte>} Name The name of the symbol.
     * @param {Integer} Address The address of the symbol. This address must be within the address range of the specified module.
     * @param {Integer} Flags This parameter is unused.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symdeletesymbol
     */
    static SymDeleteSymbol(hProcess, BaseOfDll, Name, Address, Flags) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymDeleteSymbol", "ptr", hProcess, "uint", BaseOfDll, "ptr", Name, "uint", Address, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymDeleteSymbolW (Unicode) function deletes a virtual symbol from the specified module.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymDeleteSymbol as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module.
     * @param {Pointer<Char>} Name The name of the symbol.
     * @param {Integer} Address The address of the symbol. This address must be within the address range of the specified module.
     * @param {Integer} Flags This parameter is unused.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symdeletesymbolw
     */
    static SymDeleteSymbolW(hProcess, BaseOfDll, Name, Address, Flags) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymDeleteSymbolW", "ptr", hProcess, "uint", BaseOfDll, "ptr", Name, "uint", Address, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Refreshes the module list for the process.
     * @remarks
     * This function enumerates the loaded modules for the process and effectively calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symloadmodule">SymLoadModule64</a> function for each module. This same process is performed by <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> if <i>fInvadeProcess</i> is <b>TRUE</b>.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symrefreshmodulelist
     */
    static SymRefreshModuleList(hProcess) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymRefreshModuleList", "ptr", hProcess, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymAddSourceStream function (dbghelp.h) adds the stream to the specified module for use by the Source Server.
     * @remarks
     * <b>SymAddSourceStream</b> adds a stream of data formatted for use by the <a href="https://docs.microsoft.com/windows/desktop/Debug/source-server-and-source-indexing">source Server</a> to a designated module.  The caller can pass the stream either as a buffer in the <i>Buffer</i> parameter or a file in the <i>StreamFile</i> parameter.  If both parameters are filled, then the function uses the   <i>Buffer</i> parameter.  If both parameters are <b>NULL</b>, then the function returns <b>FALSE</b> and the <a href="https://docs.microsoft.com/windows/desktop/Debug/last-error-code">last-error code</a> is set to <b>ERROR_INVALID_PARAMETER</b>.
     * 
     * It is important to note that <b>SymAddSourceStream</b> does not add the stream to any corresponding PDB in order to persist the data.  This function is used by those programmatically implementing their own debuggers in scenarios in which a PDB is not available.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the module.
     * @param {Pointer<Byte>} StreamFile A null-terminated string that contains the absolute or relative path to a file that contains the source indexing stream. Can be <b>NULL</b> if <i>Buffer</i> is not <b>NULL</b>.
     * @param {Pointer} Buffer A buffer that contains the source indexing stream. Can be <b>NULL</b> if <i>StreamFile</i> is not <b>NULL</b>.
     * @param {Pointer} Size Size, in bytes, of the <i>Buffer</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symaddsourcestream
     */
    static SymAddSourceStream(hProcess, Base, StreamFile, Buffer, Size) {
        StreamFile := StreamFile is String? StrPtr(StreamFile) : StreamFile

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymAddSourceStream", "ptr", hProcess, "uint", Base, "ptr", StreamFile, "ptr", Buffer, "ptr", Size, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds the stream to the specified module for use by the Source Server. (SymAddSourceStreamA)
     * @remarks
     * <b>SymAddSourceStream</b> adds a stream of data formatted for use by the <a href="https://docs.microsoft.com/windows/desktop/Debug/source-server-and-source-indexing">source Server</a> to a designated module. The caller can pass the stream either as a buffer in the <i>Buffer</i> parameter or a file in the <i>StreamFile</i> parameter. If both parameters are filled, then the function uses the <i>Buffer</i> parameter. If both parameters are <b>NULL</b>, then the function returns <b>FALSE</b> and the <a href="https://docs.microsoft.com/windows/desktop/Debug/last-error-code">last-error code</a> is set to <b>ERROR_INVALID_PARAMETER</b>.
     * 
     * It is important to note that <b>SymAddSourceStream</b> does not add the stream to any corresponding PDB in order to persist the data. This function is used by those programmatically implementing their own debuggers in scenarios in which a PDB is not available.
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymAddSourceStream as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the module.
     * @param {Pointer<Byte>} StreamFile A null-terminated string that contains the absolute or relative path to a file that contains the source indexing stream. Can be <b>NULL</b> if <i>Buffer</i> is not <b>NULL</b>.
     * @param {Pointer} Buffer A buffer that contains the source indexing stream. Can be <b>NULL</b> if <i>StreamFile</i> is not <b>NULL</b>.
     * @param {Pointer} Size Size, in bytes, of the <i>Buffer</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symaddsourcestreama
     */
    static SymAddSourceStreamA(hProcess, Base, StreamFile, Buffer, Size) {
        StreamFile := StreamFile is String? StrPtr(StreamFile) : StreamFile

        result := DllCall("dbghelp.dll\SymAddSourceStreamA", "ptr", hProcess, "uint", Base, "ptr", StreamFile, "ptr", Buffer, "ptr", Size, "int")
        return result
    }

    /**
     * The SymAddSourceStreamW (Unicode) function adds the stream to the specified module for use by the Source Server.
     * @remarks
     * <b>SymAddSourceStream</b> adds a stream of data formatted for use by the <a href="https://docs.microsoft.com/windows/desktop/Debug/source-server-and-source-indexing">source Server</a> to a designated module.  The caller can pass the stream either as a buffer in the <i>Buffer</i> parameter or a file in the <i>StreamFile</i> parameter.  If both parameters are filled, then the function uses the   <i>Buffer</i> parameter.  If both parameters are <b>NULL</b>, then the function returns <b>FALSE</b> and the <a href="https://docs.microsoft.com/windows/desktop/Debug/last-error-code">last-error code</a> is set to <b>ERROR_INVALID_PARAMETER</b>.
     * 
     * It is important to note that <b>SymAddSourceStream</b> does not add the stream to any corresponding PDB in order to persist the data.  This function is used by those programmatically implementing their own debuggers in scenarios in which a PDB is not available.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymAddSourceStream as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} Base The base address of the module.
     * @param {Pointer<Char>} FileSpec A null-terminated string that contains the absolute or relative path to a file that contains the source indexing stream. Can be <b>NULL</b> if <i>Buffer</i> is not <b>NULL</b>.
     * @param {Pointer} Buffer A buffer that contains the source indexing stream. Can be <b>NULL</b> if <i>StreamFile</i> is not <b>NULL</b>.
     * @param {Pointer} Size Size, in bytes, of the <i>Buffer</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symaddsourcestreamw
     */
    static SymAddSourceStreamW(hProcess, Base, FileSpec, Buffer, Size) {
        FileSpec := FileSpec is String? StrPtr(FileSpec) : FileSpec

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymAddSourceStreamW", "ptr", hProcess, "uint", Base, "ptr", FileSpec, "ptr", Buffer, "ptr", Size, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvIsStoreW (Unicode) function (dbghelp.h) determines whether the specified path points to a symbol store.
     * @remarks
     * If the path points to the default symbol store (for example, SRV*) or to an HTTP or HTTPS symbol server, the function assumes the store exists.
     * 
     * If there is a proxy computer between the client computer and the server, the version of the SymSrv.dll on the proxy cannot be less than the version that is on the client.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymSrvIsStore as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess The handle of a process that you previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function. If this parameter is set to  <b>NULL</b>, the function determines only whether the store exists; otherwise, the function determines whether the store exists and contains a process entry for the specified process handle.
     * @param {Pointer<Char>} path The path to a symbol store. The path can specify the default symbol store (for example, SRV*), point to an HTTP or HTTPS symbol server, or specify a UNC, absolute, or relative path to the store.
     * @returns {Integer} If the path specifies a symbol store, the function returns <b>TRUE</b>. Otherwise, it returns <b>FALSE</b>. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvisstorew
     */
    static SymSrvIsStoreW(hProcess, path) {
        path := path is String? StrPtr(path) : path

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvIsStoreW", "ptr", hProcess, "ptr", path, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvIsStore function (dbghelp.h) determines whether the specified path points to a symbol store.
     * @remarks
     * If the path points to the default symbol store (for example, SRV*) or to an HTTP or HTTPS symbol server, the function assumes the store exists.
     * 
     * If there is a proxy computer between the client computer and the server, the version of the SymSrv.dll on the proxy cannot be less than the version that is on the client.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess The handle of a process that you previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function. If this parameter is set to  <b>NULL</b>, the function determines only whether the store exists; otherwise, the function determines whether the store exists and contains a process entry for the specified process handle.
     * @param {Pointer<Byte>} path The path to a symbol store. The path can specify the default symbol store (for example, SRV*), point to an HTTP or HTTPS symbol server, or specify a UNC, absolute, or relative path to the store.
     * @returns {Integer} If the path specifies a symbol store, the function returns <b>TRUE</b>. Otherwise, it returns <b>FALSE</b>. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvisstore
     */
    static SymSrvIsStore(hProcess, path) {
        path := path is String? StrPtr(path) : path

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvIsStore", "ptr", hProcess, "ptr", path, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvDeltaName function (dbghelp.h) generates the name for a file that describes the relationship between two versions of the same symbol/image.
     * @remarks
     * This function opens the two specified files, reads the indexing information from the header, and passes this information to the symbol server so it can create the file name. If you specify the <i>Type</i> parameter as "xml", the name is the index of <i>File1</i>, followed by a dash, followed by the index of <i>File2</i>, followed by an .xml extension. For example:
     * 
     * 3F3D5C755000-3F3D647621000.xml
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} SymPath The symbol path. The function uses only the symbol stores described in standard syntax for symbol stores. All other paths are ignored. If this parameter is <b>NULL</b>, the function uses the symbol path set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> function.
     * @param {Pointer<Byte>} Type The extension for the generated file name.
     * @param {Pointer<Byte>} File1 The path of the first version of the symbol or image file.
     * @param {Pointer<Byte>} File2 The path of the second version of the symbol or image file.
     * @returns {Pointer<Byte>} If the function succeeds, the return value is the resulting file name.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvdeltaname
     */
    static SymSrvDeltaName(hProcess, SymPath, Type, File1, File2) {
        SymPath := SymPath is String? StrPtr(SymPath) : SymPath
        Type := Type is String? StrPtr(Type) : Type
        File1 := File1 is String? StrPtr(File1) : File1
        File2 := File2 is String? StrPtr(File2) : File2

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvDeltaName", "ptr", hProcess, "ptr", SymPath, "ptr", Type, "ptr", File1, "ptr", File2, "char*")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvDeltaNameW (Unicode) function (dbghelp.h) generates the name for a file that describes the relationship between two versions of the same symbol/image.
     * @remarks
     * This function opens the two specified files, reads the indexing information from the header, and passes this information to the symbol server so it can create the file name. If you specify the <i>Type</i> parameter as "xml", the name is the index of <i>File1</i>, followed by a dash, followed by the index of <i>File2</i>, followed by an .xml extension. For example:
     * 
     * 3F3D5C755000-3F3D647621000.xml
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymSrvDeltaName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Char>} SymPath The symbol path. The function uses only the symbol stores described in standard syntax for symbol stores. All other paths are ignored. If this parameter is <b>NULL</b>, the function uses the symbol path set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> function.
     * @param {Pointer<Char>} Type The extension for the generated file name.
     * @param {Pointer<Char>} File1 The path of the first version of the symbol or image file.
     * @param {Pointer<Char>} File2 The path of the second version of the symbol or image file.
     * @returns {Pointer<Char>} If the function succeeds, the return value is the resulting file name.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvdeltanamew
     */
    static SymSrvDeltaNameW(hProcess, SymPath, Type, File1, File2) {
        SymPath := SymPath is String? StrPtr(SymPath) : SymPath
        Type := Type is String? StrPtr(Type) : Type
        File1 := File1 is String? StrPtr(File1) : File1
        File2 := File2 is String? StrPtr(File2) : File2

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvDeltaNameW", "ptr", hProcess, "ptr", SymPath, "ptr", Type, "ptr", File1, "ptr", File2, "char*")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvGetSupplement function (dbghelp.h) retrieves the specified file from the supplement for a symbol store.
     * @remarks
     * For more information on supplemental files, see <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsrvstoresupplement">SymSrvStoreSupplement</a>.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} SymPath The symbol path. The function uses only the symbol stores described in standard syntax for symbol stores. All other paths are ignored. If this parameter is <b>NULL</b>, the function uses the symbol path set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> function.
     * @param {Pointer<Byte>} Node The symbol file associated with the supplemental file.
     * @param {Pointer<Byte>} File The name of the file.
     * @returns {Pointer<Byte>} If the function succeeds, the return value is the fully qualified path for the supplemental file.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvgetsupplement
     */
    static SymSrvGetSupplement(hProcess, SymPath, Node, File) {
        SymPath := SymPath is String? StrPtr(SymPath) : SymPath
        Node := Node is String? StrPtr(Node) : Node
        File := File is String? StrPtr(File) : File

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvGetSupplement", "ptr", hProcess, "ptr", SymPath, "ptr", Node, "ptr", File, "char*")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvGetSupplementW (Unicode) function (dbghelp.h) retrieves the specified file from the supplement for a symbol store.
     * @remarks
     * For more information on supplemental files, see <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsrvstoresupplement">SymSrvStoreSupplement</a>.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymSrvGetSupplement as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Char>} SymPath The symbol path. The function uses only the symbol stores described in standard syntax for symbol stores. All other paths are ignored. If this parameter is <b>NULL</b>, the function uses the symbol path set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> function.
     * @param {Pointer<Char>} Node The symbol file associated with the supplemental file.
     * @param {Pointer<Char>} File The name of the file.
     * @returns {Pointer<Char>} If the function succeeds, the return value is the fully qualified path for the supplemental file.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvgetsupplementw
     */
    static SymSrvGetSupplementW(hProcess, SymPath, Node, File) {
        SymPath := SymPath is String? StrPtr(SymPath) : SymPath
        Node := Node is String? StrPtr(Node) : Node
        File := File is String? StrPtr(File) : File

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvGetSupplementW", "ptr", hProcess, "ptr", SymPath, "ptr", Node, "ptr", File, "char*")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvGetFileIndexes function (dbghelp.h) retrieves the indexes for the specified .pdb, .dbg, or image file that would be used to store the file.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Byte>} File The name of the file.
     * @param {Pointer<Guid>} Id The first of three identifying parameters.
     * @param {Pointer<UInt32>} Val1 The second of three identifying parameters.
     * @param {Pointer<UInt32>} Val2 The third of three identifying parameters.
     * @param {Integer} Flags This parameter is reserved for future use.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvgetfileindexes
     */
    static SymSrvGetFileIndexes(File, Id, Val1, Val2, Flags) {
        File := File is String? StrPtr(File) : File

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvGetFileIndexes", "ptr", File, "ptr", Id, "uint*", Val1, "uint*", Val2, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvGetFileIndexesW (Unicode) function (dbghelp.h) retrieves the indexes for the specified .pdb, .dbg, or image file that would be used to store the file.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Char>} File The name of the file.
     * @param {Pointer<Guid>} Id The first of three identifying parameters.
     * @param {Pointer<UInt32>} Val1 The second of three identifying parameters.
     * @param {Pointer<UInt32>} Val2 The third of three identifying parameters.
     * @param {Integer} Flags This parameter is reserved for future use.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvgetfileindexesw
     */
    static SymSrvGetFileIndexesW(File, Id, Val1, Val2, Flags) {
        File := File is String? StrPtr(File) : File

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvGetFileIndexesW", "ptr", File, "ptr", Id, "uint*", Val1, "uint*", Val2, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvGetFileIndexStringW (Unicode) function (dbghelp.h) retrieves the index string for the specified .pdb, .dbg, or image file.
     * @remarks
     * This function is not for general use.  Those writing utilities for the management of files in symbol server stores may use to this function to predict the relative path the symbol server will look for a file.  It is used by srctool.exe to actually populate symbol server stores.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymSrvGetFileIndexString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Char>} SrvPath The path to the symbol server.
     * @param {Pointer<Char>} File The name of the file.
     * @param {Pointer<Char>} Index A pointer to a 
     * buffer that receives the index string.
     * @param {Pointer} Size The size of 
     * the <i>Index</i> buffer, in characters.
     * @param {Integer} Flags This parameter is reserved for future use.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvgetfileindexstringw
     */
    static SymSrvGetFileIndexStringW(hProcess, SrvPath, File, Index, Size, Flags) {
        SrvPath := SrvPath is String? StrPtr(SrvPath) : SrvPath
        File := File is String? StrPtr(File) : File
        Index := Index is String? StrPtr(Index) : Index

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvGetFileIndexStringW", "ptr", hProcess, "ptr", SrvPath, "ptr", File, "ptr", Index, "ptr", Size, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvGetFileIndexString function (dbghelp.h) retrieves the index string for the specified .pdb, .dbg, or image file.
     * @remarks
     * This function is not for general use.  Those writing utilities for the management of files in symbol server stores may use to this function to predict the relative path the symbol server will look for a file.  It is used by srctool.exe to actually populate symbol server stores.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} SrvPath The path to the symbol server.
     * @param {Pointer<Byte>} File The name of the file.
     * @param {Pointer<Byte>} Index A pointer to a 
     * buffer that receives the index string.
     * @param {Pointer} Size The size of 
     * the <i>Index</i> buffer, in characters.
     * @param {Integer} Flags This parameter is reserved for future use.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvgetfileindexstring
     */
    static SymSrvGetFileIndexString(hProcess, SrvPath, File, Index, Size, Flags) {
        SrvPath := SrvPath is String? StrPtr(SrvPath) : SrvPath
        File := File is String? StrPtr(File) : File
        Index := Index is String? StrPtr(Index) : Index

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvGetFileIndexString", "ptr", hProcess, "ptr", SrvPath, "ptr", File, "ptr", Index, "ptr", Size, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvGetFileIndexInfo function (dbghelp.h) retrieves the index information for the specified .pdb, .dbg, or image file.
     * @remarks
     * This function is not for general use.  Those writing utilities for the management of files in symbol server stores may use to this function to predict the relative path the symbol server will look for a file.  It is used by srctool.exe to actually populate symbol server stores.  It may also be of use to those looking to find the parameters to feed the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symfindfileinpath">SymFindFileInPath</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Byte>} File The name of the file.
     * @param {Pointer<SYMSRV_INDEX_INFO>} Info A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symsrv_index_info">SYMSRV_INDEX_INFO</a> structure that receives the index information.
     * @param {Integer} Flags This parameter is reserved for future use.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvgetfileindexinfo
     */
    static SymSrvGetFileIndexInfo(File, Info, Flags) {
        File := File is String? StrPtr(File) : File

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvGetFileIndexInfo", "ptr", File, "ptr", Info, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvGetFileIndexInfoW (Unicode) function (dbghelp.h) retrieves the index information for the specified .pdb, .dbg, or image file.
     * @remarks
     * This function is not for general use.  Those writing utilities for the management of files in symbol server stores may use to this function to predict the relative path the symbol server will look for a file.  It is used by srctool.exe to actually populate symbol server stores.  It may also be of use to those looking to find the parameters to feed the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symfindfileinpath">SymFindFileInPath</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymSrvGetFileIndexInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} File The name of the file.
     * @param {Pointer<SYMSRV_INDEX_INFOW>} Info A <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-symsrv_index_info">SYMSRV_INDEX_INFO</a> structure that receives the index information.
     * @param {Integer} Flags This parameter is reserved for future use.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvgetfileindexinfow
     */
    static SymSrvGetFileIndexInfoW(File, Info, Flags) {
        File := File is String? StrPtr(File) : File

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvGetFileIndexInfoW", "ptr", File, "ptr", Info, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvStoreSupplement function (dbghelp.h) stores a file in the specified supplement to a symbol store.
     * @remarks
     * An important use for this function is to store delta files. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsrvdeltaname">SymSrvDeltaName</a>.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * The symbol server stores supplemental files with the same extension in a common directory. For example, Sup1.xml would be stored in the following directory: <i>SymPath</i>\supplement&#92;<i>Node</i>\xml.
     * 
     * The administrator of a store can prevent users from writing supplemental files by creating a read-only file in the root of the store named Supplement. Alternatively, the administrator can create the supplement directory and use ACLs to control access.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} SrvPath The path to the symbol store.
     * @param {Pointer<Byte>} Node The symbol file associated with the supplemental file.
     * @param {Pointer<Byte>} File The name of the file.
     * @param {Integer} Flags If this parameter is <b>SYMSTOREOPT_COMPRESS</b>, the file is compressed in the symbol store. Currently, there are no other supported values.
     * @returns {Pointer<Byte>} If the function succeeds, the return value is the fully qualified path for the supplemental file.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvstoresupplement
     */
    static SymSrvStoreSupplement(hProcess, SrvPath, Node, File, Flags) {
        SrvPath := SrvPath is String? StrPtr(SrvPath) : SrvPath
        Node := Node is String? StrPtr(Node) : Node
        File := File is String? StrPtr(File) : File

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvStoreSupplement", "ptr", hProcess, "ptr", SrvPath, "ptr", Node, "ptr", File, "uint", Flags, "char*")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvStoreSupplementW (Unicode) function (dbghelp.h) stores a file in the specified supplement to a symbol store.
     * @remarks
     * An important use for this function is to store delta files. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsrvdeltaname">SymSrvDeltaName</a>.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * The symbol server stores supplemental files with the same extension in a common directory. For example, Sup1.xml would be stored in the following directory: <i>SymPath</i>\supplement&#92;<i>Node</i>\xml.
     * 
     * The administrator of a store can prevent users from writing supplemental files by creating a read-only file in the root of the store named Supplement. Alternatively, the administrator can create the supplement directory and use ACLs to control access.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymSrvStoreSupplement as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Char>} SymPath The path to the symbol store.
     * @param {Pointer<Char>} Node The symbol file associated with the supplemental file.
     * @param {Pointer<Char>} File The name of the file.
     * @param {Integer} Flags If this parameter is <b>SYMSTOREOPT_COMPRESS</b>, the file is compressed in the symbol store. Currently, there are no other supported values.
     * @returns {Pointer<Char>} If the function succeeds, the return value is the fully qualified path for the supplemental file.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvstoresupplementw
     */
    static SymSrvStoreSupplementW(hProcess, SymPath, Node, File, Flags) {
        SymPath := SymPath is String? StrPtr(SymPath) : SymPath
        Node := Node is String? StrPtr(Node) : Node
        File := File is String? StrPtr(File) : File

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvStoreSupplementW", "ptr", hProcess, "ptr", SymPath, "ptr", Node, "ptr", File, "uint", Flags, "char*")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvStoreFile function (dbghelp.h) stores a file in the specified symbol store.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} SrvPath The symbol store.
     * @param {Pointer<Byte>} File The name of the file.
     * @param {Integer} Flags The flags that control the function.
     * @returns {Pointer<Byte>} If the function succeeds, the return value is a pointer to a null-terminated string that specifies the full-qualified path to the stored file.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvstorefile
     */
    static SymSrvStoreFile(hProcess, SrvPath, File, Flags) {
        SrvPath := SrvPath is String? StrPtr(SrvPath) : SrvPath
        File := File is String? StrPtr(File) : File

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvStoreFile", "ptr", hProcess, "ptr", SrvPath, "ptr", File, "uint", Flags, "char*")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymSrvStoreFileW (Unicode) function (dbghelp.h) stores a file in the specified symbol store.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function returns a pointer to a buffer that may be reused by another function. Therefore, be sure to copy the data returned to another buffer immediately.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymSrvStoreFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to a process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Char>} SrvPath The symbol store.
     * @param {Pointer<Char>} File The name of the file.
     * @param {Integer} Flags The flags that control the function.
     * @returns {Pointer<Char>} If the function succeeds, the return value is a pointer to a null-terminated string that specifies the full-qualified path to the stored file.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symsrvstorefilew
     */
    static SymSrvStoreFileW(hProcess, SrvPath, File, Flags) {
        SrvPath := SrvPath is String? StrPtr(SrvPath) : SrvPath
        File := File is String? StrPtr(File) : File

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymSrvStoreFileW", "ptr", hProcess, "ptr", SrvPath, "ptr", File, "uint", Flags, "char*")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetSymbolFile function (dbghelp.h) locates a symbol file in the specified symbol path.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function. 
     * 
     * If this handle is 0, <i>SymPath</i> cannot be <b>NULL</b>. Use this option to load a symbol file without calling <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symcleanup">SymCleanup</a>.
     * @param {Pointer<Byte>} SymPath The symbol path. If this parameter is <b>NULL</b> or an empty string, the function uses the symbol path set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> function.
     * @param {Pointer<Byte>} ImageFile The name of the image  file.
     * @param {Integer} Type 
     * @param {Pointer<Byte>} SymbolFile A pointer to a null-terminated string that receives the name of the symbol file.
     * @param {Pointer} cSymbolFile The size of the <i>SymbolFile</i> buffer, in characters.
     * @param {Pointer<Byte>} DbgFile A pointer to a buffer that receives the fully qualified path to the symbol file. This buffer must be at least MAX_PATH characters.
     * @param {Pointer} cDbgFile The size of the <i>DbgFile</i> buffer, in characters.
     * @returns {Integer} If the server locates a valid symbol file, it returns <b>TRUE</b>; otherwise, it returns <b>FALSE</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns a value that indicates why the symbol file was not returned.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsymbolfile
     */
    static SymGetSymbolFile(hProcess, SymPath, ImageFile, Type, SymbolFile, cSymbolFile, DbgFile, cDbgFile) {
        SymPath := SymPath is String? StrPtr(SymPath) : SymPath
        ImageFile := ImageFile is String? StrPtr(ImageFile) : ImageFile
        SymbolFile := SymbolFile is String? StrPtr(SymbolFile) : SymbolFile
        DbgFile := DbgFile is String? StrPtr(DbgFile) : DbgFile

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSymbolFile", "ptr", hProcess, "ptr", SymPath, "ptr", ImageFile, "uint", Type, "ptr", SymbolFile, "ptr", cSymbolFile, "ptr", DbgFile, "ptr", cDbgFile, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymGetSymbolFileW (Unicode) function locates a symbol file in the specified symbol path.
     * @remarks
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The dbghelp.h header defines SymGetSymbolFile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function. 
     * 
     * If this handle is 0, <i>SymPath</i> cannot be <b>NULL</b>. Use this option to load a symbol file without calling <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symcleanup">SymCleanup</a>.
     * @param {Pointer<Char>} SymPath The symbol path. If this parameter is <b>NULL</b> or an empty string, the function uses the symbol path set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetsearchpath">SymSetSearchPath</a> function.
     * @param {Pointer<Char>} ImageFile The name of the image  file.
     * @param {Integer} Type 
     * @param {Pointer<Char>} SymbolFile A pointer to a null-terminated string that receives the name of the symbol file.
     * @param {Pointer} cSymbolFile The size of the <i>SymbolFile</i> buffer, in characters.
     * @param {Pointer<Char>} DbgFile A pointer to a buffer that receives the fully qualified path to the symbol file. This buffer must be at least MAX_PATH characters.
     * @param {Pointer} cDbgFile The size of the <i>DbgFile</i> buffer, in characters.
     * @returns {Integer} If the server locates a valid symbol file, it returns <b>TRUE</b>; otherwise, it returns <b>FALSE</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns a value that indicates why the symbol file was not returned.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsymbolfilew
     */
    static SymGetSymbolFileW(hProcess, SymPath, ImageFile, Type, SymbolFile, cSymbolFile, DbgFile, cDbgFile) {
        SymPath := SymPath is String? StrPtr(SymPath) : SymPath
        ImageFile := ImageFile is String? StrPtr(ImageFile) : ImageFile
        SymbolFile := SymbolFile is String? StrPtr(SymbolFile) : SymbolFile
        DbgFile := DbgFile is String? StrPtr(DbgFile) : DbgFile

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSymbolFileW", "ptr", hProcess, "ptr", SymPath, "ptr", ImageFile, "uint", Type, "ptr", SymbolFile, "ptr", cSymbolFile, "ptr", DbgFile, "ptr", cDbgFile, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} FileName 
     * @param {Pointer<PDBGHELP_CREATE_USER_DUMP_CALLBACK>} Callback 
     * @param {Pointer<Void>} UserData 
     * @returns {Integer} 
     */
    static DbgHelpCreateUserDump(FileName, Callback, UserData) {
        FileName := FileName is String? StrPtr(FileName) : FileName

        result := DllCall("dbghelp.dll\DbgHelpCreateUserDump", "ptr", FileName, "ptr", Callback, "ptr", UserData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} FileName 
     * @param {Pointer<PDBGHELP_CREATE_USER_DUMP_CALLBACK>} Callback 
     * @param {Pointer<Void>} UserData 
     * @returns {Integer} 
     */
    static DbgHelpCreateUserDumpW(FileName, Callback, UserData) {
        FileName := FileName is String? StrPtr(FileName) : FileName

        result := DllCall("dbghelp.dll\DbgHelpCreateUserDumpW", "ptr", FileName, "ptr", Callback, "ptr", UserData, "int")
        return result
    }

    /**
     * Locates the symbol for the specified address. (SymGetSymFromAddr64)
     * @remarks
     * The 
     * <b>SymGetSymFromAddr64</b> function locates the symbol for a specified address. The modules are searched for the one the address belongs to. When the module is found, its symbol table is searched for a match. When the symbol is found, the symbol information is copied into the <i>Symbol</i> buffer provided by the caller. The caller must allocate the <i>Symbol</i> buffer properly and fill in the required parameters in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure before calling 
     * <b>SymGetSymFromAddr64</b>.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymGetSymFromAddr</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymGetSymFromAddr</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} qwAddr The address for which a symbol is to be located. The address does not have to be on a symbol boundary. If the address comes after the beginning of a symbol and before the end of the symbol (the beginning of the symbol plus the symbol size), the symbol is found.
     * @param {Pointer<UInt64>} pdwDisplacement The displacement from the beginning of the symbol, or zero.
     * @param {Pointer<IMAGEHLP_SYMBOL64>} Symbol A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsymfromaddr64
     */
    static SymGetSymFromAddr64(hProcess, qwAddr, pdwDisplacement, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSymFromAddr64", "ptr", hProcess, "uint", qwAddr, "uint*", pdwDisplacement, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates the symbol for the specified address. (SymGetSymFromAddr)
     * @remarks
     * The 
     * <b>SymGetSymFromAddr64</b> function locates the symbol for a specified address. The modules are searched for the one the address belongs to. When the module is found, its symbol table is searched for a match. When the symbol is found, the symbol information is copied into the <i>Symbol</i> buffer provided by the caller. The caller must allocate the <i>Symbol</i> buffer properly and fill in the required parameters in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure before calling 
     * <b>SymGetSymFromAddr64</b>.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymGetSymFromAddr</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymGetSymFromAddr</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} dwAddr The address for which a symbol is to be located. The address does not have to be on a symbol boundary. If the address comes after the beginning of a symbol and before the end of the symbol (the beginning of the symbol plus the symbol size), the symbol is found.
     * @param {Pointer<UInt32>} pdwDisplacement The displacement from the beginning of the symbol, or zero.
     * @param {Pointer<IMAGEHLP_SYMBOL>} Symbol A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsymfromaddr
     */
    static SymGetSymFromAddr(hProcess, dwAddr, pdwDisplacement, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSymFromAddr", "ptr", hProcess, "uint", dwAddr, "uint*", pdwDisplacement, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates a symbol for the specified name. (SymGetSymFromName64)
     * @remarks
     * The 
     * <b>SymGetSymFromName64</b> function is used to locate a symbol for a specified name. The name can contain a module prefix that isolates the symbol search to a single module's symbol table.
     * 
     * The module prefix is in the form of "<i>module</i>!". The "!" character is the delimiter between the module name and the symbol name. If there is no module prefix, then the search is performed on each module's symbol table in a linear manner, beginning with the first module that is loaded.
     * 
     * Using the module prefix is preferable for two reasons. First, the symbol search occurs much faster. Second, when deferred symbol loading is turned on, the search causes symbols to be loaded for each module that is searched. When the symbol is found, the symbol information is copied into the <i>Symbol</i> buffer provided by the caller. The caller must allocate the <i>Symbol</i> buffer properly and fill in the required parameters in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure before calling 
     * <b>SymGetSymFromName64</b>.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymGetSymFromName</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymGetSymFromName</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} Name The symbol name for which a symbol is to be located.
     * @param {Pointer<IMAGEHLP_SYMBOL64>} Symbol A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsymfromname64
     */
    static SymGetSymFromName64(hProcess, Name, Symbol) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSymFromName64", "ptr", hProcess, "ptr", Name, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locates a symbol for the specified name. (SymGetSymFromName)
     * @remarks
     * The 
     * <b>SymGetSymFromName64</b> function is used to locate a symbol for a specified name. The name can contain a module prefix that isolates the symbol search to a single module's symbol table.
     * 
     * The module prefix is in the form of "<i>module</i>!". The "!" character is the delimiter between the module name and the symbol name. If there is no module prefix, then the search is performed on each module's symbol table in a linear manner, beginning with the first module that is loaded.
     * 
     * Using the module prefix is preferable for two reasons. First, the symbol search occurs much faster. Second, when deferred symbol loading is turned on, the search causes symbols to be loaded for each module that is searched. When the symbol is found, the symbol information is copied into the <i>Symbol</i> buffer provided by the caller. The caller must allocate the <i>Symbol</i> buffer properly and fill in the required parameters in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure before calling 
     * <b>SymGetSymFromName64</b>.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymGetSymFromName</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymGetSymFromName</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Byte>} Name The symbol name for which a symbol is to be located.
     * @param {Pointer<IMAGEHLP_SYMBOL>} Symbol A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsymfromname
     */
    static SymGetSymFromName(hProcess, Name, Symbol) {
        Name := Name is String? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSymFromName", "ptr", hProcess, "ptr", Name, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hprocess 
     * @param {Pointer<Byte>} SearchPathA 
     * @param {Pointer<Byte>} FileName 
     * @param {Pointer<Void>} id 
     * @param {Integer} two 
     * @param {Integer} three 
     * @param {Integer} flags 
     * @param {Pointer<Byte>} FilePath 
     * @returns {Integer} 
     * @deprecated
     */
    static FindFileInPath(hprocess, SearchPathA, FileName, id, two, three, flags, FilePath) {
        SearchPathA := SearchPathA is String? StrPtr(SearchPathA) : SearchPathA
        FileName := FileName is String? StrPtr(FileName) : FileName
        FilePath := FilePath is String? StrPtr(FilePath) : FilePath

        result := DllCall("dbghelp.dll\FindFileInPath", "ptr", hprocess, "ptr", SearchPathA, "ptr", FileName, "ptr", id, "uint", two, "uint", three, "uint", flags, "ptr", FilePath, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hprocess 
     * @param {Pointer<Byte>} SearchPathA 
     * @param {Pointer<Byte>} FileName 
     * @param {Integer} one 
     * @param {Integer} two 
     * @param {Integer} three 
     * @param {Pointer<Byte>} FilePath 
     * @returns {Integer} 
     * @deprecated
     */
    static FindFileInSearchPath(hprocess, SearchPathA, FileName, one, two, three, FilePath) {
        SearchPathA := SearchPathA is String? StrPtr(SearchPathA) : SearchPathA
        FileName := FileName is String? StrPtr(FileName) : FileName
        FilePath := FilePath is String? StrPtr(FilePath) : FilePath

        result := DllCall("dbghelp.dll\FindFileInSearchPath", "ptr", hprocess, "ptr", SearchPathA, "ptr", FileName, "uint", one, "uint", two, "uint", three, "ptr", FilePath, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Integer} BaseOfDll 
     * @param {Pointer<PSYM_ENUMERATESYMBOLS_CALLBACK>} EnumSymbolsCallback 
     * @param {Pointer<Void>} UserContext 
     * @returns {Integer} 
     * @deprecated
     */
    static SymEnumSym(hProcess, BaseOfDll, EnumSymbolsCallback, UserContext) {
        result := DllCall("dbghelp.dll\SymEnumSym", "ptr", hProcess, "uint", BaseOfDll, "ptr", EnumSymbolsCallback, "ptr", UserContext, "int")
        return result
    }

    /**
     * Enumerates all the symbols for a specified module. (SymEnumerateSymbols64)
     * @remarks
     * The 
     * <b>SymEnumerateSymbols64</b> function enumerates all the symbols for the specified module. The module information is located by the <i>BaseOfDll</i> parameter. The callback function is called once per symbol and is passed the information for each symbol.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * The Unicode version of this function, <b>SymEnumerateSymbolsW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymEnumerateSymbolsW64(
     *     __in HANDLE hProcess,
     *     __in ULONG64 BaseOfDll,
     *     __in PSYM_ENUMSYMBOLS_CALLBACK64W EnumSymbolsCallback,
     *     __in_opt PVOID UserContext
     *     );
     * ```
     * 
     * 
     * This function supersedes the <b>SymEnumerateSymbols</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymEnumerateSymbols</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module for which symbols are to be enumerated.
     * @param {Pointer<PSYM_ENUMSYMBOLS_CALLBACK64>} EnumSymbolsCallback The callback function that receives the symbol information. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumsymbols_callback">SymEnumerateSymbolsProc64</a>.
     * @param {Pointer<Void>} UserContext A user-defined value or <b>NULL</b>. This value is passed to the callback function. Typically, this parameter is used by an application to pass a pointer to a data structure that enables the callback function establish some type of context.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumeratesymbols64
     * @deprecated
     */
    static SymEnumerateSymbols64(hProcess, BaseOfDll, EnumSymbolsCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumerateSymbols64", "ptr", hProcess, "uint", BaseOfDll, "ptr", EnumSymbolsCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates all the symbols for a specified module. (SymEnumerateSymbolsW64)
     * @remarks
     * The 
     * <b>SymEnumerateSymbols64</b> function enumerates all the symbols for the specified module. The module information is located by the <i>BaseOfDll</i> parameter. The callback function is called once per symbol and is passed the information for each symbol.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * The Unicode version of this function, <b>SymEnumerateSymbolsW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymEnumerateSymbolsW64(
     *     __in HANDLE hProcess,
     *     __in ULONG64 BaseOfDll,
     *     __in PSYM_ENUMSYMBOLS_CALLBACK64W EnumSymbolsCallback,
     *     __in_opt PVOID UserContext
     *     );
     * ```
     * 
     * 
     * This function supersedes the <b>SymEnumerateSymbols</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymEnumerateSymbols</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module for which symbols are to be enumerated.
     * @param {Pointer<PSYM_ENUMSYMBOLS_CALLBACK64W>} EnumSymbolsCallback The callback function that receives the symbol information. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumsymbols_callback">SymEnumerateSymbolsProc64</a>.
     * @param {Pointer<Void>} UserContext A user-defined value or <b>NULL</b>. This value is passed to the callback function. Typically, this parameter is used by an application to pass a pointer to a data structure that enables the callback function establish some type of context.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumeratesymbolsw64
     * @deprecated
     */
    static SymEnumerateSymbolsW64(hProcess, BaseOfDll, EnumSymbolsCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumerateSymbolsW64", "ptr", hProcess, "uint", BaseOfDll, "ptr", EnumSymbolsCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumerateSymbols function (dbghelp.h) enumerates all the symbols for a specified module.
     * @remarks
     * The 
     * <b>SymEnumerateSymbols64</b> function enumerates all the symbols for the specified module. The module information is located by the <i>BaseOfDll</i> parameter. The callback function is called once per symbol and is passed the information for each symbol.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * The Unicode version of this function, <b>SymEnumerateSymbolsW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymEnumerateSymbolsW64(
     *     __in HANDLE hProcess,
     *     __in ULONG64 BaseOfDll,
     *     __in PSYM_ENUMSYMBOLS_CALLBACK64W EnumSymbolsCallback,
     *     __in_opt PVOID UserContext
     *     );
     * ```
     * 
     * 
     * This function supersedes the <b>SymEnumerateSymbols</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymEnumerateSymbols</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module for which symbols are to be enumerated.
     * @param {Pointer<PSYM_ENUMSYMBOLS_CALLBACK>} EnumSymbolsCallback The callback function that receives the symbol information. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumsymbols_callback">SymEnumerateSymbolsProc64</a>.
     * @param {Pointer<Void>} UserContext A user-defined value or <b>NULL</b>. This value is passed to the callback function. Typically, this parameter is used by an application to pass a pointer to a data structure that enables the callback function establish some type of context.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumeratesymbols
     * @deprecated
     */
    static SymEnumerateSymbols(hProcess, BaseOfDll, EnumSymbolsCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumerateSymbols", "ptr", hProcess, "uint", BaseOfDll, "ptr", EnumSymbolsCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SymEnumerateSymbolsW (Unicode) function enumerates all the symbols for a specified module.
     * @remarks
     * The 
     * <b>SymEnumerateSymbols64</b> function enumerates all the symbols for the specified module. The module information is located by the <i>BaseOfDll</i> parameter. The callback function is called once per symbol and is passed the information for each symbol.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * The Unicode version of this function, <b>SymEnumerateSymbolsW64</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * 
     * BOOL
     * IMAGEAPI
     * SymEnumerateSymbolsW64(
     *     __in HANDLE hProcess,
     *     __in ULONG64 BaseOfDll,
     *     __in PSYM_ENUMSYMBOLS_CALLBACK64W EnumSymbolsCallback,
     *     __in_opt PVOID UserContext
     *     );
     * ```
     * 
     * 
     * This function supersedes the <b>SymEnumerateSymbols</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymEnumerateSymbols</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Integer} BaseOfDll The base address of the module for which symbols are to be enumerated.
     * @param {Pointer<PSYM_ENUMSYMBOLS_CALLBACKW>} EnumSymbolsCallback The callback function that receives the symbol information. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nc-dbghelp-psym_enumsymbols_callback">SymEnumerateSymbolsProc64</a>.
     * @param {Pointer<Void>} UserContext A user-defined value or <b>NULL</b>. This value is passed to the callback function. Typically, this parameter is used by an application to pass a pointer to a data structure that enables the callback function establish some type of context.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symenumeratesymbolsw
     * @deprecated
     */
    static SymEnumerateSymbolsW(hProcess, BaseOfDll, EnumSymbolsCallback, UserContext) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymEnumerateSymbolsW", "ptr", hProcess, "uint", BaseOfDll, "ptr", EnumSymbolsCallback, "ptr", UserContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Loads the symbol table. (SymLoadModule64)
     * @remarks
     * The symbol handler creates an entry for the module and if the deferred symbol loading option is turned off, an attempt is made to load the symbols. If deferred symbol loading is enabled, the module is marked as deferred and the symbols are not loaded until a reference is made to a symbol in the module.
     * 
     * To unload the symbol table, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symunloadmodule">SymUnloadModule64</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymLoadModule</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymLoadModule</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Void>} hFile A handle to the file for the executable image. This argument is used mostly by debuggers, where the debugger passes the file handle obtained from a debugging event. A value of <b>NULL</b> indicates that <i>hFile</i> is not used.
     * @param {Pointer<Byte>} ImageName The name of the executable image. This name can contain a partial path, a full path, or no path at all. If the file cannot be located by the name provided, the symbol search path is used.
     * @param {Pointer<Byte>} ModuleName A shortcut name for the module. If the pointer value is <b>NULL</b>, the library creates a name using the base name of the symbol file.
     * @param {Integer} BaseOfDll The load address of the module. If the value is zero, the library obtains the load address from the symbol file. The load address contained in the symbol file is not necessarily the actual load address. Debuggers and other applications having an actual load address should use the real load address when calling this function.
     * 
     * If the image is a .pdb file, this parameter cannot be zero.
     * @param {Integer} SizeOfDll The size of the module, in bytes. If the value is zero, the library obtains the size from the symbol file. The size contained in the symbol file is not necessarily the actual size. Debuggers and other applications having an actual size should use the real size when calling this function.
     * 
     * If the image is a .pdb file, this parameter cannot be zero.
     * @returns {Integer} If the function succeeds, the return value is the base address of the loaded module.
     * 
     * If the function fails, the return value is zero. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the module is already loaded, the return value is zero and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_SUCCESS</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symloadmodule64
     */
    static SymLoadModule64(hProcess, hFile, ImageName, ModuleName, BaseOfDll, SizeOfDll) {
        ImageName := ImageName is String? StrPtr(ImageName) : ImageName
        ModuleName := ModuleName is String? StrPtr(ModuleName) : ModuleName

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymLoadModule64", "ptr", hProcess, "ptr", hFile, "ptr", ImageName, "ptr", ModuleName, "uint", BaseOfDll, "uint", SizeOfDll, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Loads the symbol table. (SymLoadModule)
     * @remarks
     * The symbol handler creates an entry for the module and if the deferred symbol loading option is turned off, an attempt is made to load the symbols. If deferred symbol loading is enabled, the module is marked as deferred and the symbols are not loaded until a reference is made to a symbol in the module.
     * 
     * To unload the symbol table, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symunloadmodule">SymUnloadModule64</a> function.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * This function supersedes the <b>SymLoadModule</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymLoadModule</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process. This handle must have been previously passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<Void>} hFile A handle to the file for the executable image. This argument is used mostly by debuggers, where the debugger passes the file handle obtained from a debugging event. A value of <b>NULL</b> indicates that <i>hFile</i> is not used.
     * @param {Pointer<Byte>} ImageName The name of the executable image. This name can contain a partial path, a full path, or no path at all. If the file cannot be located by the name provided, the symbol search path is used.
     * @param {Pointer<Byte>} ModuleName A shortcut name for the module. If the pointer value is <b>NULL</b>, the library creates a name using the base name of the symbol file.
     * @param {Integer} BaseOfDll The load address of the module. If the value is zero, the library obtains the load address from the symbol file. The load address contained in the symbol file is not necessarily the actual load address. Debuggers and other applications having an actual load address should use the real load address when calling this function.
     * 
     * If the image is a .pdb file, this parameter cannot be zero.
     * @param {Integer} SizeOfDll The size of the module, in bytes. If the value is zero, the library obtains the size from the symbol file. The size contained in the symbol file is not necessarily the actual size. Debuggers and other applications having an actual size should use the real size when calling this function.
     * 
     * If the image is a .pdb file, this parameter cannot be zero.
     * @returns {Integer} If the function succeeds, the return value is the base address of the loaded module.
     * 
     * If the function fails, the return value is zero. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the module is already loaded, the return value is zero and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_SUCCESS</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symloadmodule
     */
    static SymLoadModule(hProcess, hFile, ImageName, ModuleName, BaseOfDll, SizeOfDll) {
        ImageName := ImageName is String? StrPtr(ImageName) : ImageName
        ModuleName := ModuleName is String? StrPtr(ModuleName) : ModuleName

        A_LastError := 0

        result := DllCall("dbghelp.dll\SymLoadModule", "ptr", hProcess, "ptr", hFile, "ptr", ImageName, "ptr", ModuleName, "uint", BaseOfDll, "uint", SizeOfDll, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the symbol information for the next symbol. (SymGetSymNext64)
     * @remarks
     * The 
     * <b>SymGetSymNext64</b> function requires that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure have valid data, presumably obtained from a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsymfromaddr">SymGetSymFromAddr64</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsymfromname">SymGetSymFromName64</a> function. This structure is filled with the symbol information for the next symbol in sequence by virtual address.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define <b>DBGHELP_TRANSLATE_TCHAR</b>. <b>SymGetSymNextW64</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * SymGetSymNextW64(
     *     __in HANDLE hProcess,
     *     __inout PIMAGEHLP_SYMBOLW64 Symbol
     *     );
     * ```
     * 
     * 
     * This function supersedes the <b>SymGetSymNext</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymGetSymNext</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<IMAGEHLP_SYMBOL64>} Symbol A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsymnext64
     */
    static SymGetSymNext64(hProcess, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSymNext64", "ptr", hProcess, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the symbol information for the next symbol. (SymGetSymNext)
     * @remarks
     * The 
     * <b>SymGetSymNext64</b> function requires that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure have valid data, presumably obtained from a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsymfromaddr">SymGetSymFromAddr64</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsymfromname">SymGetSymFromName64</a> function. This structure is filled with the symbol information for the next symbol in sequence by virtual address.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define <b>DBGHELP_TRANSLATE_TCHAR</b>. <b>SymGetSymNextW64</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * SymGetSymNextW64(
     *     __in HANDLE hProcess,
     *     __inout PIMAGEHLP_SYMBOLW64 Symbol
     *     );
     * ```
     * 
     * 
     * This function supersedes the <b>SymGetSymNext</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymGetSymNext</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<IMAGEHLP_SYMBOL>} Symbol A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsymnext
     */
    static SymGetSymNext(hProcess, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSymNext", "ptr", hProcess, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the symbol information for the previous symbol. (SymGetSymPrev64)
     * @remarks
     * The 
     * <b>SymGetSymPrev64</b> function requires the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure to have valid data, presumably obtained from a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsymfromaddr">SymGetSymFromAddr64</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsymfromname">SymGetSymFromName64</a> function. This structure is filled in with the symbol information for the previous symbol in sequence by virtual address.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymGetSymPrevW64</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * SymGetSymPrevW64(
     *     __in HANDLE hProcess,
     *     __inout PIMAGEHLP_SYMBOLW64 Symbol
     *     );
     * ```
     * 
     * 
     * This function supersedes the <b>SymGetSymPrev</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymGetSymPrev</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<IMAGEHLP_SYMBOL64>} Symbol A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsymprev64
     */
    static SymGetSymPrev64(hProcess, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSymPrev64", "ptr", hProcess, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the symbol information for the previous symbol. (SymGetSymPrev)
     * @remarks
     * The 
     * <b>SymGetSymPrev64</b> function requires the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure to have valid data, presumably obtained from a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsymfromaddr">SymGetSymFromAddr64</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsymfromname">SymGetSymFromName64</a> function. This structure is filled in with the symbol information for the previous symbol in sequence by virtual address.
     * 
     * All DbgHelp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
     * 
     * To call the Unicode version of this function, define DBGHELP_TRANSLATE_TCHAR. <b>SymGetSymPrevW64</b> is defined as follows in DbgHelp.h. 
     * 
     * 
     * ```cpp
     * BOOL
     * IMAGEAPI
     * SymGetSymPrevW64(
     *     __in HANDLE hProcess,
     *     __inout PIMAGEHLP_SYMBOLW64 Symbol
     *     );
     * ```
     * 
     * 
     * This function supersedes the <b>SymGetSymPrev</b> function. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>SymGetSymPrev</b> is defined as follows in Dbghelp.h. 
     * 
     * 
     * ```cpp
     * @param {Pointer<Void>} hProcess A handle to the process that was originally passed to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-syminitialize">SymInitialize</a> function.
     * @param {Pointer<IMAGEHLP_SYMBOL>} Symbol A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-symgetsymprev
     */
    static SymGetSymPrev(hProcess, Symbol) {
        A_LastError := 0

        result := DllCall("dbghelp.dll\SymGetSymPrev", "ptr", hProcess, "ptr", Symbol, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<LPCALL_BACK_USER_INTERRUPT_ROUTINE>} lpStartAddress 
     * @returns {Pointer} 
     */
    static SetCheckUserInterruptShared(lpStartAddress) {
        result := DllCall("dbghelp.dll\SetCheckUserInterruptShared", "ptr", lpStartAddress)
        return result
    }

    /**
     * Gets the last symbol load error.
     * @returns {Integer} The last symbol load error.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-getsymloaderror
     */
    static GetSymLoadError() {
        result := DllCall("dbghelp.dll\GetSymLoadError", "uint")
        return result
    }

    /**
     * Sets a symbol load error.
     * @param {Integer} error A symbol load error.
     * @returns {Pointer} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nf-dbghelp-setsymloaderror
     */
    static SetSymLoadError(error) {
        result := DllCall("dbghelp.dll\SetSymLoadError", "uint", error)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @param {Pointer<Char>} pLoadModule 
     * @param {Pointer<DBGHELP_DATA_REPORT_STRUCT>} pSymbolData 
     * @returns {Integer} 
     */
    static ReportSymbolLoadSummary(hProcess, pLoadModule, pSymbolData) {
        pLoadModule := pLoadModule is String? StrPtr(pLoadModule) : pLoadModule

        result := DllCall("dbghelp.dll\ReportSymbolLoadSummary", "ptr", hProcess, "ptr", pLoadModule, "ptr", pSymbolData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hProcess 
     * @returns {Pointer} 
     */
    static RemoveInvalidModuleList(hProcess) {
        result := DllCall("dbghelp.dll\RemoveInvalidModuleList", "ptr", hProcess)
        return result
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    static RangeMapCreate() {
        result := DllCall("dbghelp.dll\RangeMapCreate")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} RmapHandle 
     * @returns {Pointer} 
     */
    static RangeMapFree(RmapHandle) {
        result := DllCall("dbghelp.dll\RangeMapFree", "ptr", RmapHandle)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} RmapHandle 
     * @param {Pointer<Char>} ImageName 
     * @param {Pointer} MappedImage 
     * @param {Integer} MappingBytes 
     * @param {Integer} ImageBase 
     * @param {Integer} UserTag 
     * @param {Integer} MappingFlags 
     * @returns {Integer} 
     */
    static RangeMapAddPeImageSections(RmapHandle, ImageName, MappedImage, MappingBytes, ImageBase, UserTag, MappingFlags) {
        ImageName := ImageName is String? StrPtr(ImageName) : ImageName

        result := DllCall("dbghelp.dll\RangeMapAddPeImageSections", "ptr", RmapHandle, "ptr", ImageName, "ptr", MappedImage, "uint", MappingBytes, "uint", ImageBase, "uint", UserTag, "uint", MappingFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} RmapHandle 
     * @param {Integer} UserTag 
     * @returns {Integer} 
     */
    static RangeMapRemove(RmapHandle, UserTag) {
        result := DllCall("dbghelp.dll\RangeMapRemove", "ptr", RmapHandle, "uint", UserTag, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} RmapHandle 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} RequestBytes 
     * @param {Integer} Flags 
     * @param {Pointer<UInt32>} DoneBytes 
     * @returns {Integer} 
     */
    static RangeMapRead(RmapHandle, Offset, Buffer, RequestBytes, Flags, DoneBytes) {
        result := DllCall("dbghelp.dll\RangeMapRead", "ptr", RmapHandle, "uint", Offset, "ptr", Buffer, "uint", RequestBytes, "uint", Flags, "uint*", DoneBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} RmapHandle 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} RequestBytes 
     * @param {Integer} Flags 
     * @param {Pointer<UInt32>} DoneBytes 
     * @returns {Integer} 
     */
    static RangeMapWrite(RmapHandle, Offset, Buffer, RequestBytes, Flags, DoneBytes) {
        result := DllCall("dbghelp.dll\RangeMapWrite", "ptr", RmapHandle, "uint", Offset, "ptr", Buffer, "uint", RequestBytes, "uint", Flags, "uint*", DoneBytes, "int")
        return result
    }

    /**
     * Plays a waveform sound. The waveform sound for each sound type is identified by an entry in the registry.
     * @remarks
     * After queuing the sound, the <b>MessageBeep</b> function 
     *     returns control to the calling function and plays the sound asynchronously.
     * 
     * If it cannot play the specified alert sound, 
     *     <b>MessageBeep</b> attempts to play the system default sound. If 
     *     it cannot play the system default sound, the function produces a standard beep sound through the computer 
     *     speaker.
     * 
     * The user can disable the warning beep by using the Sound control panel application.
     * 
     * <b>Note</b>  To send a beep to a remote client, use the <a href="https://docs.microsoft.com/windows/desktop/api/utilapiset/nf-utilapiset-beep">Beep</a> function. 
     *      The <b>Beep</b> function is redirected to the client, whereas 
     *      <b>MessageBeep</b> is not.
     * @param {Integer} uType The sound to be played. The sounds are set by the user through the Sound control panel application, and then 
     *        stored in the registry.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-messagebeep
     * @since windows5.1.2600
     */
    static MessageBeep(uType) {
        A_LastError := 0

        result := DllCall("USER32.dll\MessageBeep", "uint", uType, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Transfers execution control to the debugger. The behavior of the debugger thereafter is specific to the type of debugger used.
     * @remarks
     * An application should only use 
     * <b>FatalExit</b> for debugging purposes. It should not call the function in a retail version of the application because doing so will terminate the application.
     * @param {Integer} ExitCode The error code associated with the exit.
     * @returns {Pointer} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-fatalexit
     * @since windows5.1.2600
     */
    static FatalExit(ExitCode) {
        result := DllCall("KERNEL32.dll\FatalExit", "int", ExitCode)
        return result
    }

    /**
     * Retrieves a descriptor table entry for the specified selector and thread.
     * @remarks
     * <b>GetThreadSelectorEntry</b> is only functional on x86-based systems. For systems that are not x86-based, the function returns <b>FALSE</b>.
     * 
     * Debuggers use this function to convert segment-relative addresses to linear virtual addresses. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-readprocessmemory">ReadProcessMemory</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-writeprocessmemory">WriteProcessMemory</a> functions use linear virtual addresses.
     * @param {Pointer<Void>} hThread A handle to the thread containing the specified selector. The handle must have THREAD_QUERY_INFORMATION access. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Integer} dwSelector The global or local selector value to look up in the thread's descriptor tables.
     * @param {Pointer<LDT_ENTRY>} lpSelectorEntry A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ldt_entry">LDT_ENTRY</a> structure that receives a copy of the descriptor table entry if the specified selector has an entry in the specified thread's descriptor table. This information can be used to convert a segment-relative address to a linear virtual address.
     * @returns {Integer} If the function succeeds, the return value is nonzero. In that case, the structure pointed to by the <i>lpSelectorEntry</i> parameter receives a copy of the specified descriptor table entry.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getthreadselectorentry
     * @since windows5.1.2600
     */
    static GetThreadSelectorEntry(hThread, dwSelector, lpSelectorEntry) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetThreadSelectorEntry", "ptr", hThread, "uint", dwSelector, "ptr", lpSelectorEntry, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a descriptor table entry for the specified selector and WOW64 thread.
     * @remarks
     * The <b>Wow64GetThreadSelectorEntry</b> function is functional only on 64-bit systems and can be called only by 64-bit processes. If this function is called by a 32-bit process, the function fails with ERROR_NOT_SUPPORTED. A 32-bit process should use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getthreadselectorentry">GetThreadSelectorEntry</a> function instead. 
     * 
     * Debuggers use this function to convert segment-relative addresses to linear virtual addresses. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-readprocessmemory">ReadProcessMemory</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/nf-memoryapi-writeprocessmemory">WriteProcessMemory</a> functions use linear virtual addresses.
     * @param {Pointer<Void>} hThread A handle to the thread containing the
     *         specified selector.  The handle must have been created with
     *         THREAD_QUERY_INFORMATION access to the thread. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Integer} dwSelector The global or local selector value to look up in the thread's descriptor tables.
     * @param {Pointer<WOW64_LDT_ENTRY>} lpSelectorEntry A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-wow64_ldt_entry">WOW64_LDT_ENTRY</a> structure that receives a copy of the descriptor table entry if the specified selector has an entry in the specified thread's descriptor table. This information can be used to convert a segment-relative address to a linear virtual address.
     * @returns {Integer} If the function succeeds, the return value is nonzero. In that case, the structure pointed to by the <i>lpSelectorEntry</i> parameter receives a copy of the specified descriptor table entry.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-wow64getthreadselectorentry
     * @since windows6.1
     */
    static Wow64GetThreadSelectorEntry(hThread, dwSelector, lpSelectorEntry) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\Wow64GetThreadSelectorEntry", "ptr", hThread, "uint", dwSelector, "ptr", lpSelectorEntry, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the action to be performed when the calling thread exits.
     * @remarks
     * The calling thread must have established at least one debugging connection using the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> or <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-debugactiveprocess">DebugActiveProcess</a> function before calling this function. <b>DebugSetProcessKillOnExit</b> affects all current and future debuggees connected to the calling thread. A thread can call this function multiple times to change the action as needed.
     * @param {Integer} KillOnExit If this parameter is <b>TRUE</b>, the thread terminates all attached processes on exit (note that this is the default). Otherwise, the thread detaches from all processes being debugged on exit.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-debugsetprocesskillonexit
     * @since windows5.1.2600
     */
    static DebugSetProcessKillOnExit(KillOnExit) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\DebugSetProcessKillOnExit", "int", KillOnExit, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Causes a breakpoint exception to occur in the specified process. This allows the calling thread to signal the debugger to handle the exception.
     * @remarks
     * If the process is not being debugged, the function uses the search logic of a standard exception handler. In most cases, this causes the process to terminate because of an unhandled breakpoint exception.
     * @param {Pointer<Void>} Process A handle to the process.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-debugbreakprocess
     * @since windows5.1.2600
     */
    static DebugBreakProcess(Process) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\DebugBreakProcess", "ptr", Process, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Formats a message string. (FormatMessageA)
     * @remarks
     * Within the message text, several escape sequences are supported for dynamically formatting the message. These 
     *     escape sequences and their meanings are shown in the following tables. All escape sequences start with the percent 
     *     character (%).
     * 
     * <table>
     * <tr>
     * <th>Escape sequence</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>%0</td>
     * <td>Terminates a message text line without a trailing new line character. This escape sequence can be used to 
     *        build up long lines or to terminate the message itself without a trailing new line character. It is useful for 
     *        prompt messages.</td>
     * </tr>
     * <tr>
     * <td>%<i>n</i>!<i>format string</i>!</td>
     * <td>
     * Identifies an insert sequence. The value of <i>n</i> can be in the range from 1 through 99. The 
     *         format string (which must be surrounded by exclamation marks) is optional and defaults to !s! if not 
     *         specified. For more information, see 
     *         <a href="https://docs.microsoft.com/cpp/c-runtime-library/format-specification-syntax-printf-and-wprintf-functions">Format Specification Fields</a>.
     * 
     * The format string can include a width and precision specifier for strings and a width specifier for 
     *         integers. Use an asterisk (*) to specify the width and precision. For example, %1!*.*s! or %1!*u!.
     * 
     * If you do not use the width and precision specifiers, the insert numbers correspond directly to the input 
     *         arguments. For example, if the source string is "%1 %2 %1" and the input arguments are "Bill" and "Bob", the 
     *         formatted output string is "Bill Bob Bill".
     * 
     * However, if you use a width and precision specifier, the insert numbers do not correspond directly to the 
     *         input arguments. For example, the insert numbers for the previous example could change to 
     *         "%1!*.*s! %4 %5!*s!".
     * 
     * The insert numbers depend on whether you use an arguments array 
     *         (<b>FORMAT_MESSAGE_ARGUMENT_ARRAY</b>) or a <b>va_list</b>. For an 
     *         arguments array, the next insert number is <i>n+2</i> if the previous format string 
     *         contained one asterisk and is <i>n+3</i> if two asterisks were specified. For a 
     *         <b>va_list</b>, the next insert number is <i>n+1</i> if the previous 
     *         format string contained one asterisk and is <i>n+2</i> if two asterisks were specified.
     * 
     * If you want to repeat "Bill", as in the previous example, the arguments must include "Bill" twice. For 
     *         example, if the source string is "%1!*.*s! %4 %5!*s!", the arguments could be, 4, 2, Bill, Bob, 6, Bill 
     *         (if using the <b>FORMAT_MESSAGE_ARGUMENT_ARRAY</b> flag). The formatted string would then 
     *         be "  Bi Bob   Bill".
     * 
     * Repeating insert numbers when the source string contains width and precision specifiers may not yield the 
     *         intended results. If you replaced %5 with %1, the function would try to print a string at address 6 (likely 
     *         resulting in an access violation).
     * 
     * Floating-point format specifiers—e, E, f, and g—are not supported. 
     *         The workaround is to use the <a href="https://docs.microsoft.com/windows/desktop/api/strsafe/nf-strsafe-stringcchprintfa">StringCchPrintf</a> 
     *         function to format the floating-point number into a temporary buffer, then use that buffer as the insert 
     *         string.
     * 
     * Inserts that use the I64 prefix are treated as two 32-bit arguments. They must be used before subsequent 
     *         arguments are used. Note that it may be easier for you to use 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/strsafe/nf-strsafe-stringcchprintfa">StringCchPrintf</a> instead of this prefix.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Any other nondigit character following a percent character is formatted in the output message without the 
     *     percent character. Following are some examples.
     * 
     * <table>
     * <tr>
     * <th>Format string</th>
     * <th>Resulting output</th>
     * </tr>
     * <tr>
     * <td>%%</td>
     * <td>A single percent sign.</td>
     * </tr>
     * <tr>
     * <td>%<i>space</i></td>
     * <td>A single space. This format string can be used to ensure the appropriate number of trailing spaces in a 
     *        message text line.</td>
     * </tr>
     * <tr>
     * <td>%.</td>
     * <td>A single period. This format string can be used to include a single period at the beginning of a line 
     *        without terminating the message text definition.</td>
     * </tr>
     * <tr>
     * <td>%!</td>
     * <td>A single exclamation point. This format string can be used to include an exclamation point immediately after 
     *        an insert without its being mistaken for the beginning of a format string.</td>
     * </tr>
     * <tr>
     * <td>%n</td>
     * <td>A hard line break when the format string occurs at the end of a line. This format string is 
     *        useful when <b>FormatMessage</b> is supplying regular line 
     *        breaks so the message fits in a certain width.</td>
     * </tr>
     * <tr>
     * <td>%r</td>
     * <td>A hard carriage return without a trailing newline character.</td>
     * </tr>
     * <tr>
     * <td>%t</td>
     * <td>A single tab.</td>
     * </tr>
     * </table>
     *  
     * 
     * <h3><a id="Security_Remarks"></a><a id="security_remarks"></a><a id="SECURITY_REMARKS"></a>Security Remarks</h3>
     * If this function is called without <b>FORMAT_MESSAGE_IGNORE_INSERTS</b>, the 
     *       <i>Arguments</i> parameter must contain enough parameters to satisfy all insertion sequences 
     *       in the message string, and they must be of the correct type. Therefore, do not use untrusted or unknown message 
     *       strings with inserts enabled because they can contain more insertion sequences than 
     *       <i>Arguments</i> provides, or those that may be of the wrong type. In particular, it is 
     *       unsafe to take an arbitrary system error code returned from an API and use 
     *       <b>FORMAT_MESSAGE_FROM_SYSTEM</b> without 
     *       <b>FORMAT_MESSAGE_IGNORE_INSERTS</b>.
     * @param {Integer} dwFlags The formatting options, and how to interpret the <i>lpSource</i> parameter. The 
     *        low-order byte of <i>dwFlags</i> specifies how the function handles line breaks in the output 
     *        buffer. The low-order byte can also specify the maximum width of a formatted output line.
     * @param {Pointer<Void>} lpSource The location of the message definition. The type of this parameter depends upon the settings in the 
     *       <i>dwFlags</i> parameter.
     * 
     * <table>
     * <tr>
     * <th><i>dwFlags</i> Setting</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FORMAT_MESSAGE_FROM_HMODULE"></a><a id="format_message_from_hmodule"></a><dl>
     * <dt><b>FORMAT_MESSAGE_FROM_HMODULE</b></dt>
     * <dt>0x00000800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A handle to the module that contains the message table to search.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FORMAT_MESSAGE_FROM_STRING"></a><a id="format_message_from_string"></a><dl>
     * <dt><b>FORMAT_MESSAGE_FROM_STRING</b></dt>
     * <dt>0x00000400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer to a string that consists of unformatted message text. It will be scanned for inserts and 
     *         formatted accordingly.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If neither of these flags is set in <i>dwFlags</i>, then 
     *        <i>lpSource</i> is ignored.
     * @param {Integer} dwMessageId The message identifier for the requested message. This parameter is ignored if 
     *       <i>dwFlags</i> includes <b>FORMAT_MESSAGE_FROM_STRING</b>.
     * @param {Integer} dwLanguageId The <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">language identifier</a> for the requested 
     *        message. This parameter is ignored if <i>dwFlags</i> includes 
     *        <b>FORMAT_MESSAGE_FROM_STRING</b>.
     * 
     * If you pass a specific <b>LANGID</b> in this parameter, 
     *        <b>FormatMessage</b> will return a message for that 
     *        <b>LANGID</b> only. If the function cannot find a message for that 
     *        <b>LANGID</b>, it sets Last-Error to 
     *        <b>ERROR_RESOURCE_LANG_NOT_FOUND</b>. If you pass in zero, 
     *        <b>FormatMessage</b> looks for a message for 
     *        <b>LANGIDs</b> in the following order:
     * 
     * <ol>
     * <li>Language neutral</li>
     * <li>Thread <b>LANGID</b>, based on the thread's locale value</li>
     * <li>User default <b>LANGID</b>, based on the user's default locale value</li>
     * <li>System default <b>LANGID</b>, based on the system default locale value</li>
     * <li>US English</li>
     * </ol>
     * If <b>FormatMessage</b> does not locate a message for any 
     *        of the preceding <b>LANGIDs</b>, it returns any language message string that is present. 
     *        If that fails, it returns <b>ERROR_RESOURCE_LANG_NOT_FOUND</b>.
     * @param {Pointer<Byte>} lpBuffer A pointer to a buffer that receives the null-terminated string that specifies the formatted message. If 
     *        <i>dwFlags</i> includes <b>FORMAT_MESSAGE_ALLOCATE_BUFFER</b>, the 
     *        function allocates a buffer using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> 
     *        function, and places the pointer to the buffer at the address specified in 
     *        <i>lpBuffer</i>.
     * 
     * This buffer cannot be larger than 64K bytes.
     * @param {Integer} nSize If the <b>FORMAT_MESSAGE_ALLOCATE_BUFFER</b> flag is not set, this parameter specifies 
     *        the size of the output buffer, in <b>TCHARs</b>. If 
     *        <b>FORMAT_MESSAGE_ALLOCATE_BUFFER</b> is set, this parameter specifies the minimum number of 
     *        <b>TCHARs</b> to allocate for an output buffer.
     * 
     * The output buffer cannot be larger than 64K bytes.
     * @param {Pointer<SByte>} Arguments An array of values that are used as insert values in the formatted message. A %1 in the format string 
     *        indicates the first value in the <i>Arguments</i> array; a %2 indicates the second argument; 
     *        and so on.
     * 
     * The interpretation of each value depends on the formatting information associated with the insert in the 
     *        message definition. The default is to treat each value as a pointer to a null-terminated string.
     * 
     * By default, the <i>Arguments</i> parameter is of type 
     *        <b>va_list*</b>, which is a language- and implementation-specific data type for 
     *        describing a variable number of arguments. The state of the <b>va_list</b> argument is 
     *        undefined upon return from the function. To use the <b>va_list</b> again, destroy the 
     *        variable argument list pointer using <b>va_end</b> and reinitialize it with 
     *        <b>va_start</b>.
     * 
     * If you do not have a pointer of type 
     *        <b>va_list*</b>, then specify the <b>FORMAT_MESSAGE_ARGUMENT_ARRAY</b> 
     *        flag and pass a pointer to an array of <b>DWORD_PTR</b> values; those values are input to 
     *        the message formatted as the insert values. Each insert must have a corresponding element in the array.
     * @returns {Integer} If the function succeeds, the return value is the number of <b>TCHARs</b> stored in the 
     *        output buffer, excluding the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-formatmessagea
     * @since windows5.1.2600
     */
    static FormatMessageA(dwFlags, lpSource, dwMessageId, dwLanguageId, lpBuffer, nSize, Arguments) {
        lpBuffer := lpBuffer is String? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FormatMessageA", "uint", dwFlags, "ptr", lpSource, "uint", dwMessageId, "uint", dwLanguageId, "ptr", lpBuffer, "uint", nSize, "ptr", Arguments, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FormatMessageW (Unicode) function (winbase.h) formats a message string.
     * @remarks
     * Within the message text, several escape sequences are supported for dynamically formatting the message. These 
     *     escape sequences and their meanings are shown in the following tables. All escape sequences start with the percent 
     *     character (%).
     * 
     * <table>
     * <tr>
     * <th>Escape sequence</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>%0</td>
     * <td>Terminates a message text line without a trailing new line character. This escape sequence can be used to 
     *        build up long lines or to terminate the message itself without a trailing new line character. It is useful for 
     *        prompt messages.</td>
     * </tr>
     * <tr>
     * <td>%<i>n</i>!<i>format string</i>!</td>
     * <td>
     * Identifies an insert sequence. The value of <i>n</i> can be in the range from 1 through 99. The 
     *         format string (which must be surrounded by exclamation marks) is optional and defaults to !s! if not 
     *         specified. For more information, see 
     *         <a href="https://docs.microsoft.com/cpp/c-runtime-library/format-specification-syntax-printf-and-wprintf-functions">Format Specification Fields</a>.
     * 
     * The format string can include a width and precision specifier for strings and a width specifier for 
     *         integers. Use an asterisk (*) to specify the width and precision. For example, %1!*.*s! or %1!*u!.
     * 
     * If you do not use the width and precision specifiers, the insert numbers correspond directly to the input 
     *         arguments. For example, if the source string is "%1 %2 %1" and the input arguments are "Bill" and "Bob", the 
     *         formatted output string is "Bill Bob Bill".
     * 
     * However, if you use a width and precision specifier, the insert numbers do not correspond directly to the 
     *         input arguments. For example, the insert numbers for the previous example could change to 
     *         "%1!*.*s! %4 %5!*s!".
     * 
     * The insert numbers depend on whether you use an arguments array 
     *         (<b>FORMAT_MESSAGE_ARGUMENT_ARRAY</b>) or a <b>va_list</b>. For an 
     *         arguments array, the next insert number is <i>n+2</i> if the previous format string 
     *         contained one asterisk and is <i>n+3</i> if two asterisks were specified. For a 
     *         <b>va_list</b>, the next insert number is <i>n+1</i> if the previous 
     *         format string contained one asterisk and is <i>n+2</i> if two asterisks were specified.
     * 
     * If you want to repeat "Bill", as in the previous example, the arguments must include "Bill" twice. For 
     *         example, if the source string is "%1!*.*s! %4 %5!*s!", the arguments could be, 4, 2, Bill, Bob, 6, Bill 
     *         (if using the <b>FORMAT_MESSAGE_ARGUMENT_ARRAY</b> flag). The formatted string would then 
     *         be "  Bi Bob   Bill".
     * 
     * Repeating insert numbers when the source string contains width and precision specifiers may not yield the 
     *         intended results. If you replaced %5 with %1, the function would try to print a string at address 6 (likely 
     *         resulting in an access violation).
     * 
     * Floating-point format specifiers—e, E, f, and g—are not supported. 
     *         The workaround is to use the <a href="https://docs.microsoft.com/windows/desktop/api/strsafe/nf-strsafe-stringcchprintfa">StringCchPrintf</a> 
     *         function to format the floating-point number into a temporary buffer, then use that buffer as the insert 
     *         string.
     * 
     * Inserts that use the I64 prefix are treated as two 32-bit arguments. They must be used before subsequent 
     *         arguments are used. Note that it may be easier for you to use 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/strsafe/nf-strsafe-stringcchprintfa">StringCchPrintf</a> instead of this prefix.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Any other nondigit character following a percent character is formatted in the output message without the 
     *     percent character. Following are some examples.
     * 
     * <table>
     * <tr>
     * <th>Format string</th>
     * <th>Resulting output</th>
     * </tr>
     * <tr>
     * <td>%%</td>
     * <td>A single percent sign.</td>
     * </tr>
     * <tr>
     * <td>%<i>space</i></td>
     * <td>A single space. This format string can be used to ensure the appropriate number of trailing spaces in a 
     *        message text line.</td>
     * </tr>
     * <tr>
     * <td>%.</td>
     * <td>A single period. This format string can be used to include a single period at the beginning of a line 
     *        without terminating the message text definition.</td>
     * </tr>
     * <tr>
     * <td>%!</td>
     * <td>A single exclamation point. This format string can be used to include an exclamation point immediately after 
     *        an insert without its being mistaken for the beginning of a format string.</td>
     * </tr>
     * <tr>
     * <td>%n</td>
     * <td>A hard line break when the format string occurs at the end of a line. This format string is 
     *        useful when <b>FormatMessage</b> is supplying regular line 
     *        breaks so the message fits in a certain width.</td>
     * </tr>
     * <tr>
     * <td>%r</td>
     * <td>A hard carriage return without a trailing newline character.</td>
     * </tr>
     * <tr>
     * <td>%t</td>
     * <td>A single tab.</td>
     * </tr>
     * </table>
     *  
     * 
     * <h3><a id="Security_Remarks"></a><a id="security_remarks"></a><a id="SECURITY_REMARKS"></a>Security Remarks</h3>
     * If this function is called without <b>FORMAT_MESSAGE_IGNORE_INSERTS</b>, the 
     *       <i>Arguments</i> parameter must contain enough parameters to satisfy all insertion sequences 
     *       in the message string, and they must be of the correct type. Therefore, do not use untrusted or unknown message 
     *       strings with inserts enabled because they can contain more insertion sequences than 
     *       <i>Arguments</i> provides, or those that may be of the wrong type. In particular, it is 
     *       unsafe to take an arbitrary system error code returned from an API and use 
     *       <b>FORMAT_MESSAGE_FROM_SYSTEM</b> without 
     *       <b>FORMAT_MESSAGE_IGNORE_INSERTS</b>.
     * @param {Integer} dwFlags The formatting options, and how to interpret the <i>lpSource</i> parameter. The 
     *        low-order byte of <i>dwFlags</i> specifies how the function handles line breaks in the output 
     *        buffer. The low-order byte can also specify the maximum width of a formatted output line.
     * @param {Pointer<Void>} lpSource The location of the message definition. The type of this parameter depends upon the settings in the 
     *       <i>dwFlags</i> parameter.
     * 
     * <table>
     * <tr>
     * <th><i>dwFlags</i> Setting</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FORMAT_MESSAGE_FROM_HMODULE"></a><a id="format_message_from_hmodule"></a><dl>
     * <dt><b>FORMAT_MESSAGE_FROM_HMODULE</b></dt>
     * <dt>0x00000800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A handle to the module that contains the message table to search.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FORMAT_MESSAGE_FROM_STRING"></a><a id="format_message_from_string"></a><dl>
     * <dt><b>FORMAT_MESSAGE_FROM_STRING</b></dt>
     * <dt>0x00000400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer to a string that consists of unformatted message text. It will be scanned for inserts and 
     *         formatted accordingly.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If neither of these flags is set in <i>dwFlags</i>, then 
     *        <i>lpSource</i> is ignored.
     * @param {Integer} dwMessageId The message identifier for the requested message. This parameter is ignored if 
     *       <i>dwFlags</i> includes <b>FORMAT_MESSAGE_FROM_STRING</b>.
     * @param {Integer} dwLanguageId The <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">language identifier</a> for the requested 
     *        message. This parameter is ignored if <i>dwFlags</i> includes 
     *        <b>FORMAT_MESSAGE_FROM_STRING</b>.
     * 
     * If you pass a specific <b>LANGID</b> in this parameter, 
     *        <b>FormatMessage</b> will return a message for that 
     *        <b>LANGID</b> only. If the function cannot find a message for that 
     *        <b>LANGID</b>, it sets Last-Error to 
     *        <b>ERROR_RESOURCE_LANG_NOT_FOUND</b>. If you pass in zero, 
     *        <b>FormatMessage</b> looks for a message for 
     *        <b>LANGIDs</b> in the following order:
     * 
     * <ol>
     * <li>Language neutral</li>
     * <li>Thread <b>LANGID</b>, based on the thread's locale value</li>
     * <li>User default <b>LANGID</b>, based on the user's default locale value</li>
     * <li>System default <b>LANGID</b>, based on the system default locale value</li>
     * <li>US English</li>
     * </ol>
     * If <b>FormatMessage</b> does not locate a message for any 
     *        of the preceding <b>LANGIDs</b>, it returns any language message string that is present. 
     *        If that fails, it returns <b>ERROR_RESOURCE_LANG_NOT_FOUND</b>.
     * @param {Pointer<Char>} lpBuffer A pointer to a buffer that receives the null-terminated string that specifies the formatted message. If 
     *        <i>dwFlags</i> includes <b>FORMAT_MESSAGE_ALLOCATE_BUFFER</b>, the 
     *        function allocates a buffer using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> 
     *        function, and places the pointer to the buffer at the address specified in 
     *        <i>lpBuffer</i>.
     * 
     * This buffer cannot be larger than 64K bytes.
     * @param {Integer} nSize If the <b>FORMAT_MESSAGE_ALLOCATE_BUFFER</b> flag is not set, this parameter specifies 
     *        the size of the output buffer, in <b>TCHARs</b>. If 
     *        <b>FORMAT_MESSAGE_ALLOCATE_BUFFER</b> is set, this parameter specifies the minimum number of 
     *        <b>TCHARs</b> to allocate for an output buffer.
     * 
     * The output buffer cannot be larger than 64K bytes.
     * @param {Pointer<SByte>} Arguments An array of values that are used as insert values in the formatted message. A %1 in the format string 
     *        indicates the first value in the <i>Arguments</i> array; a %2 indicates the second argument; 
     *        and so on.
     * 
     * The interpretation of each value depends on the formatting information associated with the insert in the 
     *        message definition. The default is to treat each value as a pointer to a null-terminated string.
     * 
     * By default, the <i>Arguments</i> parameter is of type 
     *        <b>va_list*</b>, which is a language- and implementation-specific data type for 
     *        describing a variable number of arguments. The state of the <b>va_list</b> argument is 
     *        undefined upon return from the function. To use the <b>va_list</b> again, destroy the 
     *        variable argument list pointer using <b>va_end</b> and reinitialize it with 
     *        <b>va_start</b>.
     * 
     * If you do not have a pointer of type 
     *        <b>va_list*</b>, then specify the <b>FORMAT_MESSAGE_ARGUMENT_ARRAY</b> 
     *        flag and pass a pointer to an array of <b>DWORD_PTR</b> values; those values are input to 
     *        the message formatted as the insert values. Each insert must have a corresponding element in the array.
     * @returns {Integer} If the function succeeds, the return value is the number of <b>TCHARs</b> stored in the 
     *        output buffer, excluding the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-formatmessagew
     * @since windows5.1.2600
     */
    static FormatMessageW(dwFlags, lpSource, dwMessageId, dwLanguageId, lpBuffer, nSize, Arguments) {
        lpBuffer := lpBuffer is String? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FormatMessageW", "uint", dwFlags, "ptr", lpSource, "uint", dwMessageId, "uint", dwLanguageId, "ptr", lpBuffer, "uint", nSize, "ptr", Arguments, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Copies a source context structure (including any XState) onto an initialized destination context structure.
     * @remarks
     * The function copies data from the <i>Source</i>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> over the corresponding data in the 
     *      <i>Destination</i> <b>CONTEXT</b>, including 
     *      extended context if any is present. The <i>Destination</i>
     * <b>CONTEXT</b> must have been initialized with 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializecontext">InitializeContext</a> to ensure proper alignment and 
     *      initialization. If any data is present in the <i>Destination</i>
     * <b>CONTEXT</b> and the corresponding flag is not set in the 
     *      <i>Source</i> <b>CONTEXT</b> or in the 
     *      <i>ContextFlags</i> parameter, the data remains valid in the 
     *      <i>Destination</i>.
     * 
     * 
     * <b>Windows 7 with SP1 and Windows Server 2008 R2 with SP1:  </b>The <a href="https://docs.microsoft.com/windows/desktop/Debug/avx-support-portal">AVX API</a> is first implemented on 
     *        Windows 7 with SP1 and Windows Server 2008 R2 with SP1 . Since there is no SDK for SP1, that means there are 
     *        no available headers and library files to work with. In this situation, a caller must declare the needed 
     *        functions from this documentation and get pointers to them using 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> on 
     *        "Kernel32.dll", followed by calls to 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/working-with-xstate-context">Working with XState Context</a> for 
     *        details.
     * @param {Pointer<CONTEXT>} Destination A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure that receives the 
     *       context copied from the <i>Source</i>. The 
     *       <b>CONTEXT</b> structure should be initialized by calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializecontext">InitializeContext</a> before calling this 
     *       function.
     * @param {Integer} ContextFlags Flags specifying the pieces of the <i>Source</i>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure that will be copied into the 
     *       destination. This must be a subset of the <i>ContextFlags</i> specified when calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializecontext">InitializeContext</a> on the 
     *       <i>Destination</i> <b>CONTEXT</b>.
     * @param {Pointer<CONTEXT>} Source A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure from which to copy 
     *       processor context data.
     * @returns {Integer} This function returns <b>TRUE</b> if the context was copied successfully, otherwise 
     *       <b>FALSE</b>. To get extended error information, call 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-copycontext
     * @since windows6.1
     */
    static CopyContext(Destination, ContextFlags, Source) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\CopyContext", "ptr", Destination, "uint", ContextFlags, "ptr", Source, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes a CONTEXT structure inside a buffer with the necessary size and alignment.
     * @remarks
     * <i>InitializeContext</i> can be used to initialize a 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure within a buffer with the required size and 
     *     alignment characteristics.  This routine is required if the <b>CONTEXT_XSTATE</b> <i>ContextFlag</i> is specified since the required context size and alignment may change 
     *     depending on which processor features are enabled on the system.
     * 
     * First, call this function with the 
     *     <i>ContextFlags</i> parameter set to the maximum number of features you will be using and the 
     *     <i>Buffer</i> parameter to <b>NULL</b>. The function returns the required 
     *     buffer size in bytes in the <i>ContextLength</i> parameter. Allocate enough space for the data 
     *     in the <i>Buffer</i> and call the function again to initialize the 
     *     <i>Context</i>. Upon successful completion of this routine, the 
     *     <i>ContextFlags</i> member of the <i>Context</i> structure is initialized, 
     *     but the remaining contents of the structure are undefined. Some bits specified in the 
     *     <i>ContextFlags</i> parameter may not be set in 
     *     <i>Context</i>-&gt;<i>ContextFlags</i> if they are not supported by the 
     *     system. Applications may subsequently remove, but must never add, bits from the 
     *     <i>ContextFlags</i> member of 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a>.
     * 
     * 
     * <b>Windows 7 with SP1 and Windows Server 2008 R2 with SP1:  </b>The <a href="https://docs.microsoft.com/windows/desktop/Debug/avx-support-portal">AVX API</a> is first implemented on 
     *        Windows 7 with SP1 and Windows Server 2008 R2 with SP1 . Since there is no SDK for SP1, that means there are 
     *        no available headers and library files to work with. In this situation, a caller must declare the needed 
     *        functions from this documentation and get pointers to them using 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> on 
     *        "Kernel32.dll", followed by calls to 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/working-with-xstate-context">Working with XState Context</a> for 
     *        details.
     * @param {Pointer} Buffer A pointer to a buffer within which to initialize a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure. This parameter can be 
     *        <b>NULL</b> to determine the buffer size required to hold a context record with the 
     *        specified <i>ContextFlags</i>.
     * @param {Integer} ContextFlags A value indicating which portions of the <i>Context</i> structure should be initialized. 
     *       This parameter influences the size of the initialized <i>Context</i> structure.
     *       
     * 
     * <div class="alert"><b>Note</b>  <b>CONTEXT_XSTATE</b> is not part of <b>CONTEXT_FULL</b> or 
     *        <b>CONTEXT_ALL</b>.  It must be specified separately if an XState context is desired.</div>
     * <div> </div>
     * @param {Pointer<CONTEXT>} Context A pointer to a variable which receives the address of the initialized 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure within the 
     *       <i>Buffer</i>.
     *       
     * 
     * <div class="alert"><b>Note</b>  Due to alignment requirements of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structures, 
     *        the value returned in <i>Context</i> may not be at the beginning of the supplied 
     *        buffer.</div>
     * <div> </div>
     * @param {Pointer<UInt32>} ContextLength On input, specifies the length of the buffer pointed to by <i>Buffer</i>, in bytes. If 
     *       the buffer is not large enough to contain the specified portions of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a>, the function fails, 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *       <b>ERROR_INSUFFICIENT_BUFFER</b>, and <i>ContextLength</i> is set to the 
     *       required size of the buffer.  If the function fails with an error other than 
     *       <b>ERROR_INSUFFICIENT_BUFFER</b>, the contents of 
     *       <i>ContextLength</i> are undefined.
     * @returns {Integer} This function returns <b>TRUE</b> if successful, otherwise 
     *       <b>FALSE</b>. To get extended error information, call 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-initializecontext
     * @since windows6.1
     */
    static InitializeContext(Buffer, ContextFlags, Context, ContextLength) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\InitializeContext", "ptr", Buffer, "uint", ContextFlags, "ptr", Context, "uint*", ContextLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes a CONTEXT structure inside a buffer with the necessary size and alignment, with the option to specify an XSTATE compaction mask.
     * @remarks
     * <i>InitializeContext</i> can be used to initialize a 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure within a buffer with the required size and 
     *     alignment characteristics.  This routine is required if the <b>CONTEXT_XSTATE</b> <i>ContextFlag</i> is specified since the required context size and alignment may change 
     *     depending on which processor features are enabled on the system.
     * 
     * First, call this function with the 
     *     <i>ContextFlags</i> parameter set to the maximum number of features you will be using and the 
     *     <i>Buffer</i> parameter to <b>NULL</b>. The function returns the required 
     *     buffer size in bytes in the <i>ContextLength</i> parameter. Allocate enough space for the data 
     *     in the <i>Buffer</i> and call the function again to initialize the 
     *     <i>Context</i>. Upon successful completion of this routine, the 
     *     <i>ContextFlags</i> member of the <i>Context</i> structure is initialized, 
     *     but the remaining contents of the structure are undefined. Some bits specified in the 
     *     <i>ContextFlags</i> parameter may not be set in 
     *     <i>Context</i>-&gt;<i>ContextFlags</i> if they are not supported by the 
     *     system. Applications may subsequently remove, but must never add, bits from the 
     *     <i>ContextFlags</i> member of 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a>.
     * 
     * 
     * <b>Windows 7 with SP1 and Windows Server 2008 R2 with SP1:  </b>The <a href="https://docs.microsoft.com/windows/desktop/Debug/avx-support-portal">AVX API</a> is first implemented on 
     *        Windows 7 with SP1 and Windows Server 2008 R2 with SP1 . Since there is no SDK for SP1, that means there are 
     *        no available headers and library files to work with. In this situation, a caller must declare the needed 
     *        functions from this documentation and get pointers to them using 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> on 
     *        "Kernel32.dll", followed by calls to 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/working-with-xstate-context">Working with XState Context</a> for 
     *        details.
     * 
     * When XState is enabled in compaction mode, specifying an <i>XStateCompactionMask</i> that contains only a subset of the enabled XState components can decrease the buffer size required to store the <i>Context</i>.
     * This is particularly useful if the system has many XState components enabled, but the <i>Context</i> will only be used to affect a small number of XState components.
     * The full set of enabled XState components can be obtained by calling <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-getenabledxstatefeatures">GetEnabledXStateFeatures</a>.
     * This function copies the specified XState compaction mask into the relevant location in the XState header.
     * @param {Pointer} Buffer A pointer to a buffer within which to initialize a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure. This parameter can be 
     *        <b>NULL</b> to determine the buffer size required to hold a context record with the 
     *        specified <i>ContextFlags</i>.
     * @param {Integer} ContextFlags A value indicating which portions of the <i>Context</i> structure should be initialized. 
     *       This parameter influences the size of the initialized <i>Context</i> structure.
     * 
     * 
     * <div class="alert"><b>Note</b>  <b>CONTEXT_XSTATE</b> is not part of <b>CONTEXT_FULL</b> or 
     *        <b>CONTEXT_ALL</b>.  It must be specified separately if an XState context is desired.</div>
     * <div> </div>
     * @param {Pointer<CONTEXT>} Context A pointer to a variable which receives the address of the initialized 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure within the 
     *       <i>Buffer</i>.
     * 
     * 
     * <div class="alert"><b>Note</b>  Due to alignment requirements of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structures, 
     *        the value returned in <i>Context</i> may not be at the beginning of the supplied 
     *        buffer.</div>
     * <div> </div>
     * @param {Pointer<UInt32>} ContextLength On input, specifies the length of the buffer pointed to by <i>Buffer</i>, in bytes. If 
     *       the buffer is not large enough to contain the specified portions of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a>, the function fails, 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *       <b>ERROR_INSUFFICIENT_BUFFER</b>, and <i>ContextLength</i> is set to the 
     *       required size of the buffer.  If the function fails with an error other than 
     *       <b>ERROR_INSUFFICIENT_BUFFER</b>, the contents of 
     *       <i>ContextLength</i> are undefined.
     * @param {Integer} XStateCompactionMask Supplies the XState compaction mask to use when allocating the <i>Context</i> structure.
     * This parameter is only used when <b>CONTEXT_XSTATE</b> is supplied to <i>ContextFlags</i> and the system has XState enabled in compaction mode.
     * @returns {Integer} This function returns <b>TRUE</b> if successful, otherwise 
     *       <b>FALSE</b>. To get extended error information, call 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-initializecontext2
     */
    static InitializeContext2(Buffer, ContextFlags, Context, ContextLength, XStateCompactionMask) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\InitializeContext2", "ptr", Buffer, "uint", ContextFlags, "ptr", Context, "uint*", ContextLength, "uint", XStateCompactionMask, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets a mask of enabled XState features on x86 or x64 processors.
     * @remarks
     * An application should call this function to determine what features are present and enabled on the system 
     *      before using an XState processor feature or attempting to manipulate XState contexts. Bits 0 and 1 refer to the 
     *      X87 FPU and the presence of SSE registers, respectively. The meanings of specific feature bits beyond 0 and 1 are 
     *      defined in the Programmer Reference Manuals released by the processor vendors.
     *      <div class="alert"><b>Note</b>  Not all features supported by a processor may be enabled on the system. Using a feature which is not 
     *       enabled may result in exceptions or undefined behavior.</div>
     * <div> </div>
     * 
     * 
     * 
     * <b>Windows 7 with SP1 and Windows Server 2008 R2 with SP1:  </b>The <a href="https://docs.microsoft.com/windows/desktop/Debug/avx-support-portal">AVX API</a> is first implemented on 
     *        Windows 7 with SP1 and Windows Server 2008 R2 with SP1 . Since there is no SDK for SP1, that means there are 
     *        no available headers and library files to work with. In this situation, a caller must declare the needed 
     *        functions from this documentation and get pointers to them using 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> on 
     *        "Kernel32.dll", followed by calls to 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/working-with-xstate-context">Working with XState Context</a> for 
     *        details.
     * @returns {Integer} This function returns a bitmask in which each bit represents an XState feature that is enabled on the 
     *       system.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getenabledxstatefeatures
     * @since windows6.1
     */
    static GetEnabledXStateFeatures() {
        result := DllCall("KERNEL32.dll\GetEnabledXStateFeatures", "uint")
        return result
    }

    /**
     * Returns the mask of XState features set within a CONTEXT structure.
     * @remarks
     * The <b>GetXStateFeaturesMask</b> function returns 
     *      the mask of valid features in the specified context.  If a 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-wow64_context">CONTEXT</a> is to be passed to 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getthreadcontext">GetThreadContext</a> or 
     *      <a href="https://github.com/MicrosoftDocs/sdk-api/blob/docs/sdk-api-src/content/winbase/nf-winbase-wow64getthreadcontext.md">Wow64GetThreadContext</a>, the application must 
     *      call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setxstatefeaturesmask">SetXStateFeaturesMask</a> to set which 
     *      features are to be retrieved. 
     *      <b>GetXStateFeaturesMask</b> should then be called on 
     *      the <b>CONTEXT</b> returned by 
     *      <b>GetThreadContext</b> or 
     *      <b>Wow64GetThreadContext</b> to determine which 
     *      feature areas contain valid data. If a particular feature bit is not set, the corresponding state is in a 
     *      processor-specific <b>INITIALIZED</b> state and the contents of the feature area retrieved by 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-locatexstatefeature">LocateXStateFeature</a> are undefined.
     * 
     * The definition of XState features are processor vendor specific. Please refer to the relevant processor 
     *      reference manuals for additional information on a particular feature.
     * 
     * 
     * <div class="alert"><b>Note</b>  The value returned by 
     *       <b>GetXStateFeaturesMask</b> on a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-wow64_context">CONTEXT</a> after a context operation will always be a subset 
     *       of the mask specified in a call to 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setxstatefeaturesmask">SetXStateFeaturesMask</a> prior to the context 
     *       operation.</div>
     * <div> </div>
     * 
     * 
     * 
     * <b>Windows 7 with SP1 and Windows Server 2008 R2 with SP1:  </b>The <a href="https://docs.microsoft.com/windows/desktop/Debug/avx-support-portal">AVX API</a> is first implemented on 
     *        Windows 7 with SP1 and Windows Server 2008 R2 with SP1 . Since there is no SDK for SP1, that means there are 
     *        no available headers and library files to work with. In this situation, a caller must declare the needed 
     *        functions from this documentation and get pointers to them using 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> on 
     *        "Kernel32.dll", followed by calls to 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/working-with-xstate-context">Working with XState Context</a> for 
     *        details.
     * @param {Pointer<CONTEXT>} Context A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-wow64_context">CONTEXT</a> structure that has been 
     *       initialized with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializecontext">InitializeContext</a>.
     * @param {Pointer<UInt64>} FeatureMask A pointer to a variable that receives the mask of XState features which are present in the specified 
     *       <b>CONTEXT</b> structure.
     * @returns {Integer} This function returns <b>TRUE</b> if successful, otherwise 
     *       <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getxstatefeaturesmask
     * @since windows6.1
     */
    static GetXStateFeaturesMask(Context, FeatureMask) {
        result := DllCall("KERNEL32.dll\GetXStateFeaturesMask", "ptr", Context, "uint*", FeatureMask, "int")
        return result
    }

    /**
     * Retrieves a pointer to the processor state for an XState feature within a CONTEXT structure.
     * @remarks
     * The <b>LocateXStateFeature</b> function must be used 
     *     to find an individual XState feature within an extensible 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure. Features are not necessarily contiguous 
     *     in memory and applications should not assume the offset between two consecutive features will remain constant in 
     *     the future.
     * 
     * The <i>FeatureID</i> parameter of the function corresponds to a bit within the feature 
     *     mask. For example, <i>FeatureId</i> 2 corresponds to a <i>FeatureMask</i> of 
     *     4 in <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setxstatefeaturesmask">SetXStateFeaturesMask</a>. 
     *     <i>FeatureID</i> values of 0 and 1 correspond to X87 FPU state and SSE state, 
     *     respectively.
     * 
     * If you are setting XState on a thread via the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadcontext">SetThreadContext</a> or 
     *     <a href="https://docs.microsoft.com/windows/win32/api/wow64apiset/">Wow64SetThreadContext</a> 
     *     APIs, you must also call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setxstatefeaturesmask">SetXStateFeaturesMask</a> on the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure with the mask value of the filled-in 
     *     feature to mark the feature as active.
     * 
     * 
     * <b>Windows 7 with SP1 and Windows Server 2008 R2 with SP1:  </b>The <a href="https://docs.microsoft.com/windows/desktop/Debug/avx-support-portal">AVX API</a> is first implemented on 
     *        Windows 7 with SP1 and Windows Server 2008 R2 with SP1 . Since there is no SDK for SP1, that means there are 
     *        no available headers and library files to work with. In this situation, a caller must declare the needed 
     *        functions from this documentation and get pointers to them using 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> on 
     *        "Kernel32.dll", followed by calls to 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/working-with-xstate-context">Working with XState Context</a> for 
     *        details.
     * @param {Pointer<CONTEXT>} Context A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure containing the state 
     *       to retrieve or set. This <b>CONTEXT</b> should have been 
     *       initialized with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializecontext">InitializeContext</a> with the 
     *       <b>CONTEXT_XSTATE</b> flag set in the <i>ContextFlags</i> 
     *       parameter.
     * @param {Integer} FeatureId The number of the feature to locate within the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure.
     * @param {Pointer<UInt32>} Length A pointer to a variable which receives the length of the feature area in bytes. The contents of this 
     *       variable are undefined if this function returns <b>NULL</b>.
     * @returns {Pointer<Void>} If the specified feature is supported by the system and the specified 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure has been initialized with the 
     *        <b>CONTEXT_XSTATE</b> flag, this function returns a pointer to the feature area for the 
     *        specified feature.  The contents and layout of this area is processor-specific.
     * 
     * If the <b>CONTEXT_XSTATE</b> flag is not set in the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure or the 
     *        <i>FeatureID</i> is not supported by the system, the return value is 
     *        <b>NULL</b>. No additional error information is available.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-locatexstatefeature
     * @since windows6.1
     */
    static LocateXStateFeature(Context, FeatureId, Length) {
        result := DllCall("KERNEL32.dll\LocateXStateFeature", "ptr", Context, "uint", FeatureId, "uint*", Length)
        return result
    }

    /**
     * Sets the mask of XState features set within a CONTEXT structure.
     * @remarks
     * The <b>SetXStateFeaturesMask</b> function sets the 
     *      mask of valid features in the specified context. Before calling 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getthreadcontext">GetThreadContext</a>, 
     *      <a href="https://github.com/MicrosoftDocs/sdk-api/blob/docs/sdk-api-src/content/winbase/nf-winbase-wow64getthreadcontext.md">Wow64GetThreadContext</a>, 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadcontext">SetThreadContext</a>, or 
     *      <a href="https://github.com/MicrosoftDocs/sdk-api/blob/docs/sdk-api-src/content/winbase/nf-winbase-wow64setthreadcontext.md">Wow64SetThreadContext</a> the application must call 
     *      <b>SetXStateFeaturesMask</b> to specify which set of 
     *      features to retrieve or set.  The system silently ignores any feature specified in the 
     *      <i>FeatureMask</i> which is not enabled on the processor.
     * 
     * 
     * <b>Windows 7 with SP1 and Windows Server 2008 R2 with SP1:  </b>The <a href="https://docs.microsoft.com/windows/desktop/Debug/avx-support-portal">AVX API</a> is first implemented on 
     *        Windows 7 with SP1 and Windows Server 2008 R2 with SP1 . Since there is no SDK for SP1, that means there are 
     *        no available headers and library files to work with. In this situation, a caller must declare the needed 
     *        functions from this documentation and get pointers to them using 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> on 
     *        "Kernel32.dll", followed by calls to 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. See 
     *        <a href="https://docs.microsoft.com/windows/desktop/Debug/working-with-xstate-context">Working with XState Context</a> for 
     *        details.
     * @param {Pointer<CONTEXT>} Context A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure that has been 
     *       initialized with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializecontext">InitializeContext</a>.
     * @param {Integer} FeatureMask A mask of XState features to set in the specified 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-arm64_nt_context">CONTEXT</a> structure.
     * @returns {Integer} This function returns <b>TRUE</b> if successful, otherwise 
     *       <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setxstatefeaturesmask
     * @since windows6.1
     */
    static SetXStateFeaturesMask(Context, FeatureMask) {
        result := DllCall("KERNEL32.dll\SetXStateFeaturesMask", "ptr", Context, "uint", FeatureMask, "int")
        return result
    }

;@endregion Methods
}
