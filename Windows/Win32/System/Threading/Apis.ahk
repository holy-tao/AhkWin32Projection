#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\PTP_POOL.ahk
#Include .\PTP_CLEANUP_GROUP.ahk
#Include .\PTP_WORK.ahk
#Include .\PTP_TIMER.ahk
#Include .\PTP_WAIT.ahk
#Include .\PTP_IO.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class Threading {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static CONDITION_VARIABLE_LOCKMODE_SHARED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INIT_ONCE_CHECK_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INIT_ONCE_ASYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INIT_ONCE_INIT_FAILED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INIT_ONCE_CTX_RESERVED_BITS => 2

    /**
     * @type {Integer (UInt16)}
     */
    static ALL_PROCESSOR_GROUPS => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_CRITICAL_SECTION_FLAG_NO_DEBUG_INFO => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_CRITICAL_SECTION_FLAG_DYNAMIC_SPIN => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_CRITICAL_SECTION_FLAG_STATIC_INIT => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_CRITICAL_SECTION_FLAG_RESOURCE_TYPE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_CRITICAL_SECTION_FLAG_FORCE_DEBUG_INFO => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_CRITICAL_SECTION_ALL_FLAG_BITS => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_CRITICAL_SECTION_DEBUG_FLAG_STATIC_INIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLS_OUT_OF_INDEXES => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVATE_NAMESPACE_FLAG_DESTROY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TLS_OUT_OF_INDEXES => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_REPLACE_VALUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_POWER_THROTTLING_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_POWER_THROTTLING_EXECUTION_SPEED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_POWER_THROTTLING_VALID_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PME_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PME_FAILFAST_ON_COMMIT_FAIL_DISABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PME_FAILFAST_ON_COMMIT_FAIL_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_POWER_THROTTLING_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_POWER_THROTTLING_EXECUTION_SPEED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_POWER_THROTTLING_IGNORE_TIMER_RESOLUTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_LEAP_SECOND_INFO_FLAG_ENABLE_SIXTY_SECOND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_LEAP_SECOND_INFO_VALID_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_MUTEX_INITIAL_OWNER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_WAITABLE_TIMER_MANUAL_RESET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_WAITABLE_TIMER_HIGH_RESOLUTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZATION_BARRIER_FLAGS_SPIN_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZATION_BARRIER_FLAGS_BLOCK_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZATION_BARRIER_FLAGS_NO_DELETE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INFINITE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_NUMBER => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_THREAD => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_INPUT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_ADDITIVE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_DEP_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_DEP_ATL_THUNK_ENABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_SEHOP_ENABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_FORCE_RELOCATE_IMAGES_MASK => 768

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_FORCE_RELOCATE_IMAGES_DEFER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_FORCE_RELOCATE_IMAGES_ALWAYS_ON => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_FORCE_RELOCATE_IMAGES_ALWAYS_OFF => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_FORCE_RELOCATE_IMAGES_ALWAYS_ON_REQ_RELOCS => 768

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_HEAP_TERMINATE_MASK => 12288

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_HEAP_TERMINATE_DEFER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_HEAP_TERMINATE_ALWAYS_ON => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_HEAP_TERMINATE_ALWAYS_OFF => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_HEAP_TERMINATE_RESERVED => 12288

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_BOTTOM_UP_ASLR_MASK => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_BOTTOM_UP_ASLR_DEFER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_BOTTOM_UP_ASLR_ALWAYS_ON => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_BOTTOM_UP_ASLR_ALWAYS_OFF => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_BOTTOM_UP_ASLR_RESERVED => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_HIGH_ENTROPY_ASLR_MASK => 3145728

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_HIGH_ENTROPY_ASLR_DEFER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_HIGH_ENTROPY_ASLR_ALWAYS_ON => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_HIGH_ENTROPY_ASLR_ALWAYS_OFF => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_HIGH_ENTROPY_ASLR_RESERVED => 3145728

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_STRICT_HANDLE_CHECKS_MASK => 50331648

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_STRICT_HANDLE_CHECKS_DEFER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_STRICT_HANDLE_CHECKS_ALWAYS_ON => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_STRICT_HANDLE_CHECKS_ALWAYS_OFF => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_STRICT_HANDLE_CHECKS_RESERVED => 50331648

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_WIN32K_SYSTEM_CALL_DISABLE_MASK => 805306368

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_WIN32K_SYSTEM_CALL_DISABLE_DEFER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_WIN32K_SYSTEM_CALL_DISABLE_ALWAYS_ON => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_WIN32K_SYSTEM_CALL_DISABLE_ALWAYS_OFF => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_WIN32K_SYSTEM_CALL_DISABLE_RESERVED => 805306368

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_EXTENSION_POINT_DISABLE_MASK => 12884901888

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_EXTENSION_POINT_DISABLE_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_EXTENSION_POINT_DISABLE_ALWAYS_ON => 4294967296

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_EXTENSION_POINT_DISABLE_ALWAYS_OFF => 8589934592

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_EXTENSION_POINT_DISABLE_RESERVED => 12884901888

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_PROHIBIT_DYNAMIC_CODE_MASK => 206158430208

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_PROHIBIT_DYNAMIC_CODE_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_PROHIBIT_DYNAMIC_CODE_ALWAYS_ON => 68719476736

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_PROHIBIT_DYNAMIC_CODE_ALWAYS_OFF => 137438953472

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_PROHIBIT_DYNAMIC_CODE_ALWAYS_ON_ALLOW_OPT_OUT => 206158430208

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_CONTROL_FLOW_GUARD_MASK => 3298534883328

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_CONTROL_FLOW_GUARD_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_CONTROL_FLOW_GUARD_ALWAYS_ON => 1099511627776

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_CONTROL_FLOW_GUARD_ALWAYS_OFF => 2199023255552

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_CONTROL_FLOW_GUARD_EXPORT_SUPPRESSION => 3298534883328

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_BLOCK_NON_MICROSOFT_BINARIES_MASK => 52776558133248

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_BLOCK_NON_MICROSOFT_BINARIES_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_BLOCK_NON_MICROSOFT_BINARIES_ALWAYS_ON => 17592186044416

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_BLOCK_NON_MICROSOFT_BINARIES_ALWAYS_OFF => 35184372088832

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_BLOCK_NON_MICROSOFT_BINARIES_ALLOW_STORE => 52776558133248

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_FONT_DISABLE_MASK => 844424930131968

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_FONT_DISABLE_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_FONT_DISABLE_ALWAYS_ON => 281474976710656

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_FONT_DISABLE_ALWAYS_OFF => 562949953421312

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_AUDIT_NONSYSTEM_FONTS => 844424930131968

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_REMOTE_MASK => 13510798882111488

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_REMOTE_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_REMOTE_ALWAYS_ON => 4503599627370496

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_REMOTE_ALWAYS_OFF => 9007199254740992

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_REMOTE_RESERVED => 13510798882111488

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_LOW_LABEL_MASK => 216172782113783808

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_LOW_LABEL_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_LOW_LABEL_ALWAYS_ON => 72057594037927936

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_LOW_LABEL_ALWAYS_OFF => 144115188075855872

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_NO_LOW_LABEL_RESERVED => 216172782113783808

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_PREFER_SYSTEM32_MASK => 3458764513820540928

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_PREFER_SYSTEM32_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_PREFER_SYSTEM32_ALWAYS_ON => 1152921504606846976

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_PREFER_SYSTEM32_ALWAYS_OFF => 2305843009213693952

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY_IMAGE_LOAD_PREFER_SYSTEM32_RESERVED => 3458764513820540928

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_LOADER_INTEGRITY_CONTINUITY_MASK => 48

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_LOADER_INTEGRITY_CONTINUITY_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_LOADER_INTEGRITY_CONTINUITY_ALWAYS_ON => 16

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_LOADER_INTEGRITY_CONTINUITY_ALWAYS_OFF => 32

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_LOADER_INTEGRITY_CONTINUITY_AUDIT => 48

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_STRICT_CONTROL_FLOW_GUARD_MASK => 768

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_STRICT_CONTROL_FLOW_GUARD_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_STRICT_CONTROL_FLOW_GUARD_ALWAYS_ON => 256

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_STRICT_CONTROL_FLOW_GUARD_ALWAYS_OFF => 512

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_STRICT_CONTROL_FLOW_GUARD_RESERVED => 768

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_MODULE_TAMPERING_PROTECTION_MASK => 12288

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_MODULE_TAMPERING_PROTECTION_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_MODULE_TAMPERING_PROTECTION_ALWAYS_ON => 4096

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_MODULE_TAMPERING_PROTECTION_ALWAYS_OFF => 8192

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_MODULE_TAMPERING_PROTECTION_NOINHERIT => 12288

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_INDIRECT_BRANCH_PREDICTION_MASK => 196608

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_INDIRECT_BRANCH_PREDICTION_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_INDIRECT_BRANCH_PREDICTION_ALWAYS_ON => 65536

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_INDIRECT_BRANCH_PREDICTION_ALWAYS_OFF => 131072

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_INDIRECT_BRANCH_PREDICTION_RESERVED => 196608

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_ALLOW_DOWNGRADE_DYNAMIC_CODE_POLICY_MASK => 3145728

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_ALLOW_DOWNGRADE_DYNAMIC_CODE_POLICY_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_ALLOW_DOWNGRADE_DYNAMIC_CODE_POLICY_ALWAYS_ON => 1048576

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_ALLOW_DOWNGRADE_DYNAMIC_CODE_POLICY_ALWAYS_OFF => 2097152

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_ALLOW_DOWNGRADE_DYNAMIC_CODE_POLICY_RESERVED => 3145728

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_SPECULATIVE_STORE_BYPASS_DISABLE_MASK => 50331648

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_SPECULATIVE_STORE_BYPASS_DISABLE_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_SPECULATIVE_STORE_BYPASS_DISABLE_ALWAYS_ON => 16777216

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_SPECULATIVE_STORE_BYPASS_DISABLE_ALWAYS_OFF => 33554432

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_SPECULATIVE_STORE_BYPASS_DISABLE_RESERVED => 50331648

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_CET_USER_SHADOW_STACKS_MASK => 805306368

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_CET_USER_SHADOW_STACKS_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_CET_USER_SHADOW_STACKS_ALWAYS_ON => 268435456

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_CET_USER_SHADOW_STACKS_ALWAYS_OFF => 536870912

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_CET_USER_SHADOW_STACKS_STRICT_MODE => 805306368

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_MASK => 12884901888

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_ALWAYS_ON => 4294967296

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_ALWAYS_OFF => 8589934592

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_RELAXED_MODE => 12884901888

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_BLOCK_NON_CET_BINARIES_MASK => 206158430208

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_BLOCK_NON_CET_BINARIES_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_BLOCK_NON_CET_BINARIES_ALWAYS_ON => 68719476736

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_BLOCK_NON_CET_BINARIES_ALWAYS_OFF => 137438953472

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_BLOCK_NON_CET_BINARIES_NON_EHCONT => 206158430208

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_XTENDED_CONTROL_FLOW_GUARD_MASK => 3298534883328

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_XTENDED_CONTROL_FLOW_GUARD_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_XTENDED_CONTROL_FLOW_GUARD_ALWAYS_ON => 1099511627776

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_XTENDED_CONTROL_FLOW_GUARD_ALWAYS_OFF => 2199023255552

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_XTENDED_CONTROL_FLOW_GUARD_RESERVED => 3298534883328

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_POINTER_AUTH_USER_IP_MASK => 52776558133248

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_POINTER_AUTH_USER_IP_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_POINTER_AUTH_USER_IP_ALWAYS_ON => 17592186044416

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_POINTER_AUTH_USER_IP_ALWAYS_OFF => 35184372088832

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_POINTER_AUTH_USER_IP_RESERVED => 52776558133248

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_CET_DYNAMIC_APIS_OUT_OF_PROC_ONLY_MASK => 844424930131968

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_CET_DYNAMIC_APIS_OUT_OF_PROC_ONLY_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_CET_DYNAMIC_APIS_OUT_OF_PROC_ONLY_ALWAYS_ON => 281474976710656

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_CET_DYNAMIC_APIS_OUT_OF_PROC_ONLY_ALWAYS_OFF => 562949953421312

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_CET_DYNAMIC_APIS_OUT_OF_PROC_ONLY_RESERVED => 844424930131968

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_CORE_SHARING_MASK => 13510798882111488

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_CORE_SHARING_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_CORE_SHARING_ALWAYS_ON => 4503599627370496

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_CORE_SHARING_ALWAYS_OFF => 9007199254740992

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_RESTRICT_CORE_SHARING_RESERVED => 13510798882111488

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_FSCTL_SYSTEM_CALL_DISABLE_MASK => 216172782113783808

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_FSCTL_SYSTEM_CALL_DISABLE_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_FSCTL_SYSTEM_CALL_DISABLE_ALWAYS_ON => 72057594037927936

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_FSCTL_SYSTEM_CALL_DISABLE_ALWAYS_OFF => 144115188075855872

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_POLICY2_FSCTL_SYSTEM_CALL_DISABLE_RESERVED => 216172782113783808

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_CHILD_PROCESS_RESTRICTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_CHILD_PROCESS_OVERRIDE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_CHILD_PROCESS_RESTRICTED_UNLESS_SECURE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_ALL_APPLICATION_PACKAGES_OPT_OUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_ENABLE_PROCESS_TREE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_DISABLE_PROCESS_TREE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_CREATION_DESKTOP_APP_BREAKAWAY_OVERRIDE => 4

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_CET_USER_SHADOW_STACKS_MASK => 805306368

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_CET_USER_SHADOW_STACKS_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_CET_USER_SHADOW_STACKS_ALWAYS_ON => 268435456

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_CET_USER_SHADOW_STACKS_ALWAYS_OFF => 536870912

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_CET_USER_SHADOW_STACKS_RESERVED => 805306368

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_MASK => 12884901888

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_ALWAYS_ON => 4294967296

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_ALWAYS_OFF => 8589934592

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_USER_CET_SET_CONTEXT_IP_VALIDATION_RESERVED => 12884901888

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_BLOCK_NON_CET_BINARIES_MASK => 206158430208

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_BLOCK_NON_CET_BINARIES_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_BLOCK_NON_CET_BINARIES_ALWAYS_ON => 68719476736

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_BLOCK_NON_CET_BINARIES_ALWAYS_OFF => 137438953472

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_BLOCK_NON_CET_BINARIES_RESERVED => 206158430208

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_XTENDED_CONTROL_FLOW_GUARD_MASK => 3298534883328

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_XTENDED_CONTROL_FLOW_GUARD_DEFER => 0

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_XTENDED_CONTROL_FLOW_GUARD_ALWAYS_ON => 1099511627776

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_XTENDED_CONTROL_FLOW_GUARD_ALWAYS_OFF => 2199023255552

    /**
     * @type {Integer (UInt64)}
     */
    static PROCESS_CREATION_MITIGATION_AUDIT_POLICY2_XTENDED_CONTROL_FLOW_GUARD_RESERVED => 3298534883328

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_PARENT_PROCESS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_HANDLE_LIST => 131074

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_GROUP_AFFINITY => 196611

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_PREFERRED_NODE => 131076

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_IDEAL_PROCESSOR => 196613

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_UMS_THREAD => 196614

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_MITIGATION_POLICY => 131079

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_SECURITY_CAPABILITIES => 131081

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_PROTECTION_LEVEL => 131083

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_PSEUDOCONSOLE => 131094

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_MACHINE_TYPE => 131097

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_ENABLE_OPTIONAL_XSTATE_FEATURES => 196635

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_WIN32K_FILTER => 131088

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_JOB_LIST => 131085

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_CHILD_PROCESS_POLICY => 131086

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_ALL_APPLICATION_PACKAGES_POLICY => 131087

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_DESKTOP_APP_POLICY => 131090

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_MITIGATION_AUDIT_POLICY => 131096

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_THREAD_ATTRIBUTE_COMPONENT_FILTER => 131098
;@endregion Constants

;@region Methods
    /**
     * Retrieves a pseudo-handle that you can use as a shorthand way to refer to the access token associated with a process.
     * @returns {HANDLE} A pseudo-handle that you can use as a shorthand way to refer to the <a href="/windows/desktop/SecGloss/a-gly">access token</a> associated with a process.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentprocesstoken
     */
    static GetCurrentProcessToken() {
        result := DllCall("FORCEINLINE\GetCurrentProcessToken", "ptr")
        return HANDLE({Value: result}, False)
    }

    /**
     * Retrieves a pseudo-handle that you can use as a shorthand way to refer to the impersonation token that was assigned to the current thread.
     * @returns {HANDLE} A pseudo-handle that you can use as a shorthand way to refer to the <a href="/windows/desktop/SecGloss/i-gly">impersonation token</a> that was assigned to the current thread.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentthreadtoken
     */
    static GetCurrentThreadToken() {
        result := DllCall("FORCEINLINE\GetCurrentThreadToken", "ptr")
        return HANDLE({Value: result}, False)
    }

    /**
     * Retrieves a pseudo-handle that you can use as a shorthand way to refer to the token that is currently in effect for the thread, which is the thread token if one exists and the process token otherwise.
     * @returns {HANDLE} A pseudo-handle that you can use as a shorthand way to refer to the token that is currently in effect for the thread.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentthreadeffectivetoken
     */
    static GetCurrentThreadEffectiveToken() {
        result := DllCall("FORCEINLINE\GetCurrentThreadEffectiveToken", "ptr")
        return HANDLE({Value: result}, False)
    }

    /**
     * Retrieves the minimum and maximum working set sizes of the specified process.
     * @param {HANDLE} hProcess A handle to the process whose working set sizes will be obtained. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right.
     * @param {Pointer<Pointer>} lpMinimumWorkingSetSize A pointer to a variable that receives the minimum working set size of the specified process, in bytes. The virtual memory manager attempts to keep at least this much memory resident in the process whenever the process is active.
     * @param {Pointer<Pointer>} lpMaximumWorkingSetSize A pointer to a variable that receives the maximum working set size of the specified process, in bytes. The virtual memory manager attempts to keep no more than this much memory resident in the process whenever the process is active when memory is in short supply.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-getprocessworkingsetsize
     * @since windows5.1.2600
     */
    static GetProcessWorkingSetSize(hProcess, lpMinimumWorkingSetSize, lpMaximumWorkingSetSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        lpMinimumWorkingSetSizeMarshal := lpMinimumWorkingSetSize is VarRef ? "ptr*" : "ptr"
        lpMaximumWorkingSetSizeMarshal := lpMaximumWorkingSetSize is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessWorkingSetSize", "ptr", hProcess, lpMinimumWorkingSetSizeMarshal, lpMinimumWorkingSetSize, lpMaximumWorkingSetSizeMarshal, lpMaximumWorkingSetSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the minimum and maximum working set sizes for the specified process.
     * @param {HANDLE} hProcess A handle to the process whose working set sizes is to be set. 
     * 
     * 
     * The handle must have the <b>PROCESS_SET_QUOTA</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer} dwMinimumWorkingSetSize The minimum working set size for the process, in bytes. The virtual memory manager attempts to keep at least this much memory resident in the process whenever the process is active. 
     * 
     * This parameter must be greater than zero but less than or equal to the maximum working set size. The default size is 50 pages (for example, this is 204,800 bytes on systems with a 4K page size). If the value is greater than zero but less than 20 pages, the minimum value is set to 20 pages.
     * 
     * If both <i>dwMinimumWorkingSetSize</i> and <i>dwMaximumWorkingSetSize</i> have the value (<b>SIZE_T</b>)–1, the function removes as many pages as possible from the working set of the specified process.
     * @param {Pointer} dwMaximumWorkingSetSize The maximum working set size for the process, in bytes. The virtual memory manager attempts to keep no more than this much memory resident in the process whenever the process is active and available memory is low. 
     * 
     * 
     * 
     * 
     * This parameter must be greater than or equal to 13 pages (for example, 53,248 on systems with a 4K page size), and less than the system-wide maximum (number of available pages minus 512 pages). The default size is 345 pages (for example, this is 1,413,120 bytes on systems with a 4K page size).
     * 
     * If both <i>dwMinimumWorkingSetSize</i> and <i>dwMaximumWorkingSetSize</i> have the value (<b>SIZE_T</b>)–1, the function removes as many pages as possible from the working set of the specified process.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. Call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to obtain extended error information.
     * @see https://docs.microsoft.com/windows/win32/api//memoryapi/nf-memoryapi-setprocessworkingsetsize
     * @since windows5.1.2600
     */
    static SetProcessWorkingSetSize(hProcess, dwMinimumWorkingSetSize, dwMaximumWorkingSetSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetProcessWorkingSetSize", "ptr", hProcess, "ptr", dwMinimumWorkingSetSize, "ptr", dwMaximumWorkingSetSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates a fiber local storage (FLS) index.
     * @param {Pointer<PFLS_CALLBACK_FUNCTION>} lpCallback A pointer to the application-defined callback function of type <b>PFLS_CALLBACK_FUNCTION</b>. This parameter is optional. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nc-winnt-pfls_callback_function">FlsCallback</a>.
     * @returns {Integer} If the function succeeds, the return value is an FLS index initialized to zero.
     * 
     * If the function fails, the return value is FLS_OUT_OF_INDEXES. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//fibersapi/nf-fibersapi-flsalloc
     * @since windows6.0.6000
     */
    static FlsAlloc(lpCallback) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FlsAlloc", "ptr", lpCallback, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the value in the calling fiber's fiber local storage (FLS) slot for the specified FLS index. Each fiber has its own slot for each FLS index.
     * @param {Integer} dwFlsIndex The FLS index that was allocated by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fibersapi/nf-fibersapi-flsalloc">FlsAlloc</a> function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is the value stored in the calling fiber's FLS slot associated with the specified index.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//fibersapi/nf-fibersapi-flsgetvalue
     * @since windows6.0.6000
     */
    static FlsGetValue(dwFlsIndex) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FlsGetValue", "uint", dwFlsIndex, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Stores a value in the calling fiber's fiber local storage (FLS) slot for the specified FLS index. Each fiber has its own slot for each FLS index.
     * @param {Integer} dwFlsIndex The FLS index that was allocated by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fibersapi/nf-fibersapi-flsalloc">FlsAlloc</a> function.
     * @param {Pointer<Void>} lpFlsData The value to be stored in the FLS slot for the calling fiber.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following errors can be returned.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The index is not in range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The FLS array has not been allocated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//fibersapi/nf-fibersapi-flssetvalue
     * @since windows6.0.6000
     */
    static FlsSetValue(dwFlsIndex, lpFlsData) {
        lpFlsDataMarshal := lpFlsData is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FlsSetValue", "uint", dwFlsIndex, lpFlsDataMarshal, lpFlsData, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Releases a fiber local storage (FLS) index, making it available for reuse.
     * @param {Integer} dwFlsIndex The FLS index that was allocated by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fibersapi/nf-fibersapi-flsalloc">FlsAlloc</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//fibersapi/nf-fibersapi-flsfree
     * @since windows6.0.6000
     */
    static FlsFree(dwFlsIndex) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\FlsFree", "uint", dwFlsIndex, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether the current thread is a fiber.
     * @returns {BOOL} The function returns <b>TRUE</b> if the thread is a fiber and <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//fibersapi/nf-fibersapi-isthreadafiber
     * @since windows6.0.6000
     */
    static IsThreadAFiber() {
        result := DllCall("KERNEL32.dll\IsThreadAFiber", "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwTlsIndex 
     * @returns {Pointer<Void>} 
     */
    static FlsGetValue2(dwTlsIndex) {
        result := DllCall("KERNEL32.dll\FlsGetValue2", "uint", dwTlsIndex, "ptr")
        return result
    }

    /**
     * Initialize a slim reader/writer (SRW) lock.
     * @remarks
     * 
     * An SRW lock must be initialized before it is used. The InitializeSRWLock function is used to initialize a SRW lock dynamically. To initialize the structure statically, assign the constant <b>SRWLOCK_INIT</b> to the structure variable.
     * 
     * An SRW lock cannot be moved or copied while in use. The process must not modify the object, and must instead treat it as logically opaque. Only use the SRW functions to manage SRW locks. 
     * 
     * An unlocked SRW lock with no waiting threads is in its initial state and can be copied, moved, and forgotten without being explicitly destroyed.
     * 
     * 
     * @param {Pointer<SRWLOCK>} SRWLock A pointer to the SRW lock.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-initializesrwlock
     * @since windows6.0.6000
     */
    static InitializeSRWLock(SRWLock) {
        DllCall("KERNEL32.dll\InitializeSRWLock", "ptr", SRWLock)
    }

    /**
     * Releases a slim reader/writer (SRW) lock that was acquired in exclusive mode.
     * @remarks
     * 
     * The SRW lock must be released by the same thread that acquired it. You can use [Application Verifier](/windows-hardware/drivers/devtest/application-verifier) to help verify that your program uses SRW locks correctly (enable Locks checker from Basic group).
     * 
     * 
     * @param {Pointer<SRWLOCK>} SRWLock A pointer to the SRW lock.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-releasesrwlockexclusive
     * @since windows6.0.6000
     */
    static ReleaseSRWLockExclusive(SRWLock) {
        DllCall("KERNEL32.dll\ReleaseSRWLockExclusive", "ptr", SRWLock)
    }

    /**
     * Releases a slim reader/writer (SRW) lock that was acquired in shared mode.
     * @remarks
     * 
     * The SRW lock must be released by the same thread that acquired it. You can use [Application Verifier](/windows-hardware/drivers/devtest/application-verifier) to help verify that your program uses SRW locks correctly (enable Locks checker from Basic group).
     * 
     * 
     * @param {Pointer<SRWLOCK>} SRWLock A pointer to the SRW lock.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-releasesrwlockshared
     * @since windows6.0.6000
     */
    static ReleaseSRWLockShared(SRWLock) {
        DllCall("KERNEL32.dll\ReleaseSRWLockShared", "ptr", SRWLock)
    }

    /**
     * Acquires a slim reader/writer (SRW) lock in exclusive mode.
     * @param {Pointer<SRWLOCK>} SRWLock A pointer to the SRW lock.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-acquiresrwlockexclusive
     * @since windows6.0.6000
     */
    static AcquireSRWLockExclusive(SRWLock) {
        DllCall("KERNEL32.dll\AcquireSRWLockExclusive", "ptr", SRWLock)
    }

    /**
     * Acquires a slim reader/writer (SRW) lock in shared mode.
     * @param {Pointer<SRWLOCK>} SRWLock A pointer to the SRW lock.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-acquiresrwlockshared
     * @since windows6.0.6000
     */
    static AcquireSRWLockShared(SRWLock) {
        DllCall("KERNEL32.dll\AcquireSRWLockShared", "ptr", SRWLock)
    }

    /**
     * Attempts to acquire a slim reader/writer (SRW) lock in exclusive mode. If the call is successful, the calling thread takes ownership of the lock.
     * @param {Pointer<SRWLOCK>} SRWLock A pointer to the SRW lock.
     * @returns {BOOLEAN} If the lock is successfully acquired, the return value is nonzero.
     * 
     * if the current thread could not acquire the lock, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-tryacquiresrwlockexclusive
     * @since windows6.1
     */
    static TryAcquireSRWLockExclusive(SRWLock) {
        result := DllCall("KERNEL32.dll\TryAcquireSRWLockExclusive", "ptr", SRWLock, "char")
        return result
    }

    /**
     * Attempts to acquire a slim reader/writer (SRW) lock in shared mode. If the call is successful, the calling thread takes ownership of the lock.
     * @param {Pointer<SRWLOCK>} SRWLock A pointer to the SRW lock.
     * @returns {BOOLEAN} If the lock is successfully acquired, the return value is nonzero.
     * 
     * if the current thread could not acquire the lock, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-tryacquiresrwlockshared
     * @since windows6.1
     */
    static TryAcquireSRWLockShared(SRWLock) {
        result := DllCall("KERNEL32.dll\TryAcquireSRWLockShared", "ptr", SRWLock, "char")
        return result
    }

    /**
     * Initializes a critical section object.
     * @param {Pointer<CRITICAL_SECTION>} lpCriticalSection A pointer to the critical section object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-initializecriticalsection
     * @since windows5.1.2600
     */
    static InitializeCriticalSection(lpCriticalSection) {
        DllCall("KERNEL32.dll\InitializeCriticalSection", "ptr", lpCriticalSection)
    }

    /**
     * Waits for ownership of the specified critical section object. The function returns when the calling thread is granted ownership.
     * @param {Pointer<CRITICAL_SECTION>} lpCriticalSection A pointer to the critical section object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-entercriticalsection
     * @since windows5.1.2600
     */
    static EnterCriticalSection(lpCriticalSection) {
        DllCall("KERNEL32.dll\EnterCriticalSection", "ptr", lpCriticalSection)
    }

    /**
     * Releases ownership of the specified critical section object.
     * @remarks
     * 
     * The threads of a single process can use a critical-section object for mutual-exclusion synchronization. The process is responsible for allocating the memory used by a critical-section object, which it can do by declaring a variable of type <b>CRITICAL_SECTION</b>. Before using a critical section, some thread of the process must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-initializecriticalsection">InitializeCriticalSection</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-initializecriticalsectionandspincount">InitializeCriticalSectionAndSpinCount</a> function to initialize the object.
     * 
     * A thread uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-entercriticalsection">EnterCriticalSection</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-tryentercriticalsection">TryEnterCriticalSection</a> function to acquire ownership of a critical section object. To release its ownership, the thread must call 
     * <b>LeaveCriticalSection</b> once for each time that it entered the critical section.
     * 
     * If a thread calls 
     * <b>LeaveCriticalSection</b> when it does not have ownership of the specified critical section object, an error occurs that may cause another thread using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-entercriticalsection">EnterCriticalSection</a> to wait indefinitely.
     * 
     * Any thread of the process can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-deletecriticalsection">DeleteCriticalSection</a> function to release the system resources that were allocated when the critical section object was initialized. After this function has been called, the critical section object can no longer be used for synchronization.
     * 
     * 
     * 
     * @param {Pointer<CRITICAL_SECTION>} lpCriticalSection A pointer to the critical section object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-leavecriticalsection
     * @since windows5.1.2600
     */
    static LeaveCriticalSection(lpCriticalSection) {
        DllCall("KERNEL32.dll\LeaveCriticalSection", "ptr", lpCriticalSection)
    }

    /**
     * Initializes a critical section object and sets the spin count for the critical section.
     * @param {Pointer<CRITICAL_SECTION>} lpCriticalSection A pointer to the critical section object.
     * @param {Integer} dwSpinCount The spin count for the critical section object. On single-processor systems, the spin count is ignored and the critical section spin count is set to 0 (zero). On multiprocessor systems, if the critical section is unavailable, the calling thread spins <i>dwSpinCount</i> times before performing a wait operation on a semaphore associated with the critical section. If the critical section becomes free during the spin operation, the calling thread avoids the wait operation.
     * @returns {BOOL} This function always succeeds and returns a nonzero value.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>If the function succeeds, the return value is nonzero. If the function fails, the return value is zero (0). To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.  Starting with Windows Vista, the <b>InitializeCriticalSectionAndSpinCount</b> function always succeeds, even in low memory situations.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-initializecriticalsectionandspincount
     * @since windows5.1.2600
     */
    static InitializeCriticalSectionAndSpinCount(lpCriticalSection, dwSpinCount) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\InitializeCriticalSectionAndSpinCount", "ptr", lpCriticalSection, "uint", dwSpinCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes a critical section object with a spin count and optional flags.
     * @param {Pointer<CRITICAL_SECTION>} lpCriticalSection A pointer to the critical section object.
     * @param {Integer} dwSpinCount The spin count for the critical section object. On single-processor systems, the spin count is ignored and the critical section spin count is set to 0 (zero). On multiprocessor systems, if the critical section is unavailable, the calling thread spin <i>dwSpinCount</i> times before performing a wait operation on a semaphore associated with the critical section. If the critical section becomes free during the spin operation, the calling thread avoids the wait operation.
     * @param {Integer} Flags This parameter can be 0 or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRITICAL_SECTION_NO_DEBUG_INFO"></a><a id="critical_section_no_debug_info"></a><dl>
     * <dt><b>CRITICAL_SECTION_NO_DEBUG_INFO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The critical section is created without debug information.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero (0). To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-initializecriticalsectionex
     * @since windows6.0.6000
     */
    static InitializeCriticalSectionEx(lpCriticalSection, dwSpinCount, Flags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\InitializeCriticalSectionEx", "ptr", lpCriticalSection, "uint", dwSpinCount, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the spin count for the specified critical section.
     * @param {Pointer<CRITICAL_SECTION>} lpCriticalSection A pointer to the critical section object.
     * @param {Integer} dwSpinCount The spin count for the critical section object. On single-processor systems, the spin count is ignored and the critical section spin count is set to zero (0). On multiprocessor systems, if the critical section is unavailable, the calling thread spins <i>dwSpinCount</i> times before performing a wait operation on a semaphore associated with the critical section. If the critical section becomes free during the spin operation, the calling thread avoids the wait operation.
     * @returns {Integer} The function returns the previous spin count for the critical section.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-setcriticalsectionspincount
     * @since windows5.1.2600
     */
    static SetCriticalSectionSpinCount(lpCriticalSection, dwSpinCount) {
        result := DllCall("KERNEL32.dll\SetCriticalSectionSpinCount", "ptr", lpCriticalSection, "uint", dwSpinCount, "uint")
        return result
    }

    /**
     * Attempts to enter a critical section without blocking. If the call is successful, the calling thread takes ownership of the critical section.
     * @param {Pointer<CRITICAL_SECTION>} lpCriticalSection A pointer to the critical section object.
     * @returns {BOOL} If the critical section is successfully entered or the current thread already owns the critical section, the return value is nonzero.
     * 
     * If another thread already owns the critical section, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-tryentercriticalsection
     * @since windows5.1.2600
     */
    static TryEnterCriticalSection(lpCriticalSection) {
        result := DllCall("KERNEL32.dll\TryEnterCriticalSection", "ptr", lpCriticalSection, "int")
        return result
    }

    /**
     * Releases all resources used by an unowned critical section object.
     * @remarks
     * 
     * Deleting a critical section object releases all system resources used by the object. The caller is responsible for ensuring that the critical section object is unowned and the specified CRITICAL_SECTION structure is not being accessed by any critical section functions called by other threads in the process.
     * 
     * After a critical section object has been deleted, do not reference the object in any function that operates on critical sections (such as <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-entercriticalsection">EnterCriticalSection</a>, <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-tryentercriticalsection">TryEnterCriticalSection</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-leavecriticalsection">LeaveCriticalSection</a>) other than <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-initializecriticalsection">InitializeCriticalSection</a> and <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-initializecriticalsectionandspincount">InitializeCriticalSectionAndSpinCount</a>. If you attempt to do so, memory corruption and other unexpected errors can occur.
     * 
     * If a critical section is deleted while it is still owned, the state of the threads waiting for ownership of the deleted critical section is undefined.
     * 
     * 
     * 
     * @param {Pointer<CRITICAL_SECTION>} lpCriticalSection A pointer to the critical section object. The object must have been previously initialized with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-initializecriticalsection">InitializeCriticalSection</a> function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-deletecriticalsection
     * @since windows5.1.2600
     */
    static DeleteCriticalSection(lpCriticalSection) {
        DllCall("KERNEL32.dll\DeleteCriticalSection", "ptr", lpCriticalSection)
    }

    /**
     * Initializes a one-time initialization structure.
     * @remarks
     * 
     * The <b>InitOnceInitialize</b> function is used to initialize a one-time initialization structure dynamically. To initialize the structure statically, assign the constant <b>INIT_ONCE_STATIC_INIT</b> to the structure variable.
     * 
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0600 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * A one-time initialization object cannot be moved or copied. The process must not modify the initialization object, and must instead treat it as logically opaque. Only use the one-time initialization functions to manage one-time initialization objects.
     * 
     * 
     * 
     * @param {Pointer<INIT_ONCE>} InitOnce A pointer to the one-time initialization structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-initonceinitialize
     * @since windows6.0.6000
     */
    static InitOnceInitialize(InitOnce) {
        DllCall("KERNEL32.dll\InitOnceInitialize", "ptr", InitOnce)
    }

    /**
     * Executes the specified function successfully one time. No other threads that specify the same one-time initialization structure can execute the specified function while it is being executed by the current thread.
     * @param {Pointer<INIT_ONCE>} InitOnce A pointer to the one-time initialization structure.
     * @param {Pointer<PINIT_ONCE_FN>} InitFn A pointer to an application-defined <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nc-synchapi-pinit_once_fn">InitOnceCallback</a> function.
     * @param {Pointer<Void>} Parameter A parameter to be passed to the callback function.
     * @param {Pointer<Pointer<Void>>} Context A parameter that receives data stored with the one-time initialization structure upon success. The low-order <b>INIT_ONCE_CTX_RESERVED_BITS</b> bits of the data are always zero.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-initonceexecuteonce
     * @since windows6.0.6000
     */
    static InitOnceExecuteOnce(InitOnce, InitFn, Parameter, Context) {
        ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\InitOnceExecuteOnce", "ptr", InitOnce, "ptr", InitFn, ParameterMarshal, Parameter, ContextMarshal, Context, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Begins one-time initialization.
     * @param {Pointer<INIT_ONCE>} lpInitOnce A pointer to the one-time initialization structure.
     * @param {Integer} dwFlags This parameter can have a value of 0, or one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INIT_ONCE_ASYNC"></a><a id="init_once_async"></a><dl>
     * <dt><b>INIT_ONCE_ASYNC</b></dt>
     * <dt>0x00000002UL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables multiple initialization attempts to execute in parallel. If this flag is used, subsequent calls to this function will fail unless this flag is also specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INIT_ONCE_CHECK_ONLY"></a><a id="init_once_check_only"></a><dl>
     * <dt><b>INIT_ONCE_CHECK_ONLY</b></dt>
     * <dt>0x00000001UL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function call does not begin initialization. The return value indicates whether initialization has already completed. If the function returns <b>TRUE</b>, the <i>lpContext</i> parameter receives the data.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<BOOL>} fPending If the function succeeds, this parameter indicates the current initialization status. 
     * 
     * If this parameter is **TRUE** and *dwFlags* contains **INIT_ONCE_CHECK_ONLY**, the initialization is pending and the context data is invalid.
     * 
     * If this parameter is **FALSE**, initialization has already completed and the caller can retrieve the context data from the *lpContext* parameter.
     * 
     * If this parameter is **TRUE** and *dwFlags* does not contain **INIT_ONCE_CHECK_ONLY**, initialization has been started and the caller can perform the initialization tasks.
     * @param {Pointer<Pointer<Void>>} lpContext An optional parameter that receives the data stored with the one-time initialization structure upon success. The low-order **INIT_ONCE_CTX_RESERVED_BITS** bits of the data are always zero.
     * @returns {BOOL} If **INIT_ONCE_CHECK_ONLY** is not specified and the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If **INIT_ONCE_CHECK_ONLY** is specified and initialization has completed, the return value is <b>TRUE</b>.
     * 
     * Otherwise, the return value is **FALSE**. 
     * 
     * To get extended error information, call [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-initoncebegininitialize
     * @since windows6.0.6000
     */
    static InitOnceBeginInitialize(lpInitOnce, dwFlags, fPending, lpContext) {
        lpContextMarshal := lpContext is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\InitOnceBeginInitialize", "ptr", lpInitOnce, "uint", dwFlags, "ptr", fPending, lpContextMarshal, lpContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Completes one-time initialization started with the InitOnceBeginInitialize function.
     * @param {Pointer<INIT_ONCE>} lpInitOnce A pointer to the one-time initialization structure.
     * @param {Integer} dwFlags This parameter can be one of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INIT_ONCE_ASYNC"></a><a id="init_once_async"></a><dl>
     * <dt><b>INIT_ONCE_ASYNC</b></dt>
     * <dt>0x00000002UL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Operate in asynchronous mode. This enables multiple completion attempts to execute in parallel. This flag must match the flag passed in the corresponding call to the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-initoncebegininitialize">InitOnceBeginInitialize</a> function. This flag may not be combined with <b>INIT_ONCE_INIT_FAILED</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INIT_ONCE_INIT_FAILED"></a><a id="init_once_init_failed"></a><dl>
     * <dt><b>INIT_ONCE_INIT_FAILED</b></dt>
     * <dt>0x00000004UL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The initialization attempt failed. This flag may not be combined with <b>INIT_ONCE_ASYNC</b>. To fail an asynchronous initialization, merely abandon it (that is, do not call the <b>InitOnceComplete</b> function).
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} lpContext A pointer to the data to be stored with the one-time initialization structure. This data is returned in the <i>lpContext</i> parameter passed to subsequent calls to the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-initoncebegininitialize">InitOnceBeginInitialize</a> function. If <i>lpContext</i> points to a value, the low-order <b>INIT_ONCE_CTX_RESERVED_BITS</b> of the value must be zero. If <i>lpContext</i>  points to a data structure, the data structure must be <b>DWORD</b>-aligned.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-initoncecomplete
     * @since windows6.0.6000
     */
    static InitOnceComplete(lpInitOnce, dwFlags, lpContext) {
        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\InitOnceComplete", "ptr", lpInitOnce, "uint", dwFlags, lpContextMarshal, lpContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes a condition variable.
     * @remarks
     * 
     * Threads  can atomically release a lock and enter the sleeping state using the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-sleepconditionvariablecs">SleepConditionVariableCS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-sleepconditionvariablesrw">SleepConditionVariableSRW</a> function. The threads are woken using the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-wakeconditionvariable">WakeConditionVariable</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-wakeallconditionvariable">WakeAllConditionVariable</a> function.
     * 
     * Condition variables are user-mode objects that cannot be shared across processes.
     * 
     * A condition variable cannot be moved or copied while in use. The process must not modify the object, and must instead treat it as logically opaque. Only use the condition variable functions to manage condition variables.
     * 
     * A condition variable with no waiting threads is in its initial state and can be copied, moved, and forgotten without being explicitly destroyed.
     * 
     * 
     * @param {Pointer<CONDITION_VARIABLE>} ConditionVariable A pointer to the condition variable.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-initializeconditionvariable
     * @since windows6.0.6000
     */
    static InitializeConditionVariable(ConditionVariable) {
        DllCall("KERNEL32.dll\InitializeConditionVariable", "ptr", ConditionVariable)
    }

    /**
     * Wake a single thread waiting on the specified condition variable.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-wakeallconditionvariable">WakeAllConditionVariable</a> wakes all waiting threads while the <b>WakeConditionVariable</b> wakes only a single thread. Waking one thread is similar to setting an auto-reset event, while waking all threads is similar to pulsing a manual reset event but more reliable (see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-pulseevent">PulseEvent</a> for details).
     * 
     * 
     * 
     * @param {Pointer<CONDITION_VARIABLE>} ConditionVariable A pointer to the condition variable.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-wakeconditionvariable
     * @since windows6.0.6000
     */
    static WakeConditionVariable(ConditionVariable) {
        DllCall("KERNEL32.dll\WakeConditionVariable", "ptr", ConditionVariable)
    }

    /**
     * Wake all threads waiting on the specified condition variable.
     * @remarks
     * 
     * The <b>WakeAllConditionVariable</b> wakes all 
     *     waiting threads while the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-wakeconditionvariable">WakeConditionVariable</a> 
     *     wakes only a single thread. Waking one thread is similar to setting an auto-reset event, while waking all threads 
     *     is similar to pulsing a manual reset event but more reliable (see 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-pulseevent">PulseEvent</a> for details).
     * 
     * 
     * @param {Pointer<CONDITION_VARIABLE>} ConditionVariable A pointer to the condition variable.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-wakeallconditionvariable
     * @since windows6.0.6000
     */
    static WakeAllConditionVariable(ConditionVariable) {
        DllCall("KERNEL32.dll\WakeAllConditionVariable", "ptr", ConditionVariable)
    }

    /**
     * Sleeps on the specified condition variable and releases the specified critical section as an atomic operation.
     * @param {Pointer<CONDITION_VARIABLE>} ConditionVariable A pointer to the condition variable. This variable must be initialized using the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-initializeconditionvariable">InitializeConditionVariable</a> function.
     * @param {Pointer<CRITICAL_SECTION>} CriticalSection A pointer to the critical section object. This critical section must be entered exactly once by the caller at the time <b>SleepConditionVariableCS</b> is called.
     * @param {Integer} dwMilliseconds The time-out interval, in milliseconds. If the time-out interval elapses, the function re-acquires the critical section and returns zero. If <i>dwMilliseconds</i> is zero, the function tests the states of the specified objects and returns immediately. If <i>dwMilliseconds</i> is <b>INFINITE</b>, the function's time-out interval never elapses. For more information, see Remarks.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails or the time-out interval elapses, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error codes include <b>ERROR_TIMEOUT</b>, which indicates that the time-out interval has elapsed before another thread has attempted to wake the sleeping thread.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-sleepconditionvariablecs
     * @since windows6.0.6000
     */
    static SleepConditionVariableCS(ConditionVariable, CriticalSection, dwMilliseconds) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SleepConditionVariableCS", "ptr", ConditionVariable, "ptr", CriticalSection, "uint", dwMilliseconds, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sleeps on the specified condition variable and releases the specified lock as an atomic operation.
     * @param {Pointer<CONDITION_VARIABLE>} ConditionVariable A pointer to the condition variable. This variable must be initialized using the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-initializeconditionvariable">InitializeConditionVariable</a> function.
     * @param {Pointer<SRWLOCK>} SRWLock A pointer to the lock. This lock must be held in the manner specified by the <i>Flags</i> parameter.
     * @param {Integer} dwMilliseconds The time-out interval, in milliseconds. The function returns if the interval elapses. If <i>dwMilliseconds</i> is zero, the function tests the states of the specified objects and returns immediately. If <i>dwMilliseconds</i> is <b>INFINITE</b>, the function's time-out interval never elapses.
     * @param {Integer} Flags If this parameter is <b>CONDITION_VARIABLE_LOCKMODE_SHARED</b>, the SRW lock is in shared mode. Otherwise, the lock is in exclusive mode.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the timeout expires the function returns FALSE and <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_TIMEOUT.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-sleepconditionvariablesrw
     * @since windows6.0.6000
     */
    static SleepConditionVariableSRW(ConditionVariable, SRWLock, dwMilliseconds, Flags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SleepConditionVariableSRW", "ptr", ConditionVariable, "ptr", SRWLock, "uint", dwMilliseconds, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the specified event object to the signaled state.
     * @param {HANDLE} hEvent A handle to the event object. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-openeventa">OpenEvent</a> function returns this handle. 
     * 
     * 
     * 
     * 
     * The handle must have the EVENT_MODIFY_STATE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-setevent
     * @since windows5.1.2600
     */
    static SetEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetEvent", "ptr", hEvent, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the specified event object to the nonsignaled state.
     * @param {HANDLE} hEvent A handle to the event object. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-openeventa">OpenEvent</a> function returns this handle. 
     * 
     * 
     * 
     * 
     * The handle must have the EVENT_MODIFY_STATE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-resetevent
     * @since windows5.1.2600
     */
    static ResetEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ResetEvent", "ptr", hEvent, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Increases the count of the specified semaphore object by a specified amount.
     * @param {HANDLE} hSemaphore A handle to the semaphore object. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createsemaphorea">CreateSemaphore</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-opensemaphorea">OpenSemaphore</a> function returns this handle.
     * 
     * This handle must have the <b>SEMAPHORE_MODIFY_STATE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {Integer} lReleaseCount The amount by which the semaphore object's current count is to be increased. The value must be greater than zero. If the specified amount would cause the semaphore's count to exceed the maximum count that was specified when the semaphore was created, the count is not changed and the function returns <b>FALSE</b>.
     * @param {Pointer<Integer>} lpPreviousCount A pointer to a variable to receive the previous count for the semaphore. This parameter can be <b>NULL</b> if the previous count is not required.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-releasesemaphore
     * @since windows5.1.2600
     */
    static ReleaseSemaphore(hSemaphore, lReleaseCount, lpPreviousCount) {
        hSemaphore := hSemaphore is Win32Handle ? NumGet(hSemaphore, "ptr") : hSemaphore

        lpPreviousCountMarshal := lpPreviousCount is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReleaseSemaphore", "ptr", hSemaphore, "int", lReleaseCount, lpPreviousCountMarshal, lpPreviousCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Releases ownership of the specified mutex object.
     * @param {HANDLE} hMutex A handle to the mutex object. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createmutexa">CreateMutex</a> or 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/synchapi/nf-synchapi-openmutexw">OpenMutex</a> function returns this handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-releasemutex
     * @since windows5.1.2600
     */
    static ReleaseMutex(hMutex) {
        hMutex := hMutex is Win32Handle ? NumGet(hMutex, "ptr") : hMutex

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ReleaseMutex", "ptr", hMutex, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Waits until the specified object is in the signaled state or the time-out interval elapses.
     * @param {HANDLE} hHandle A handle to the object. For a list of the object types whose handles can be specified, see the following Remarks section. 
     * 
     * 
     * 
     * 
     * If this handle is closed while the wait is still pending, the function's behavior is undefined.
     * 
     * The handle must have the <b>SYNCHRONIZE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">Standard Access Rights</a>.
     * @param {Integer} dwMilliseconds The time-out interval, in milliseconds. If a nonzero value is specified, the function waits until the object is signaled or the interval elapses. If <i>dwMilliseconds</i> is zero, the function does not enter a wait state if the object is not signaled; it always returns immediately. If <i>dwMilliseconds</i> is <b>INFINITE</b>, the function will return only when the object is signaled.
     * 
     * <b>Windows XP, Windows Server 2003, Windows Vista, Windows 7, Windows Server 2008 and Windows Server 2008 R2:  </b>The <i>dwMilliseconds</i> value does include time spent in low-power states. For example, the timeout does keep counting down while the computer is asleep.
     * 
     * <b>Windows 8, Windows Server 2012, Windows 8.1, Windows Server 2012 R2, Windows 10 and Windows Server 2016:  </b>The <i>dwMilliseconds</i> value does not include time spent in low-power states. For example, the timeout does not keep counting down while the computer is asleep.
     * @returns {Integer} If the function succeeds, the return value indicates the event that caused the function to return. It can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_ABANDONED</b></dt>
     * <dt>0x00000080L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object is a mutex object that was not released by the thread that owned the mutex object before the owning thread terminated. Ownership of the mutex object is granted to the calling thread and the mutex state is set to nonsignaled.
     * 
     * If the mutex was protecting persistent state information, you should check it for consistency.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_OBJECT_0</b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the specified object is signaled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_TIMEOUT</b></dt>
     * <dt>0x00000102L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time-out interval elapsed, and the object's state is nonsignaled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_FAILED</b></dt>
     * <dt>(DWORD)0xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function has failed. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-waitforsingleobject
     * @since windows5.1.2600
     */
    static WaitForSingleObject(hHandle, dwMilliseconds) {
        hHandle := hHandle is Win32Handle ? NumGet(hHandle, "ptr") : hHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WaitForSingleObject", "ptr", hHandle, "uint", dwMilliseconds, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Suspends the current thread until the specified condition is met.
     * @param {Integer} dwMilliseconds The time interval for which execution is to be suspended, in milliseconds.
     * 
     * A value of zero, together with the bAlertable parameter set to FALSE, causes the thread to relinquish the remainder of its time slice to any other thread that is ready to run, if there are no pending user APCs on the calling thread. If there are no other threads ready to run and no user APCs are queued, the function returns immediately, and the thread continues execution.<b>Windows XP: </b>A value of zero causes the thread to relinquish the remainder of its time slice to any other thread of equal priority that is ready to run. If there are no other threads of equal priority ready to run, the function returns immediately, and the thread continues execution. This behavior changed starting with Windows Server 2003.
     * 
     * 
     * 
     * A value of INFINITE indicates that the suspension should not time out.
     * @param {BOOL} bAlertable If this parameter is FALSE, the function does not return until the time-out period has elapsed. If an I/O completion callback occurs, the function does not return and the I/O completion function is not executed. If an APC is queued to the thread, the function does not return and the APC function is not executed.
     * 
     * If the parameter is TRUE and the thread that called this function is the same thread that called the extended I/O function (<a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfileex">ReadFileEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefileex">WriteFileEx</a>), the function returns when either the time-out period has elapsed or when an I/O completion callback function occurs. If an I/O completion callback occurs, the I/O completion function is called. If an APC is queued to the thread (<a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-queueuserapc">QueueUserAPC</a>), the function returns when either the timer-out period has elapsed or when the APC function is called.
     * @returns {Integer} The return value is zero if the specified time interval expired.
     * 
     * The return value is <b>WAIT_IO_COMPLETION</b> if the function returned due to one or more I/O completion callback functions. This can happen only if <i>bAlertable</i> is TRUE, and if the thread that called the 
     * <b>SleepEx</b> function is the same thread that called the extended I/O function.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-sleepex
     * @since windows5.1.2600
     */
    static SleepEx(dwMilliseconds, bAlertable) {
        result := DllCall("KERNEL32.dll\SleepEx", "uint", dwMilliseconds, "int", bAlertable, "uint")
        return result
    }

    /**
     * Waits until the specified object is in the signaled state, an I/O completion routine or asynchronous procedure call (APC) is queued to the thread, or the time-out interval elapses.
     * @param {HANDLE} hHandle A handle to the object. For a list of the object types whose handles can be specified, see the following Remarks section. 
     * 
     * 
     * 
     * 
     * If this handle is closed while the wait is still pending, the function's behavior is undefined.
     * 
     * The handle must have the <b>SYNCHRONIZE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">Standard Access Rights</a>.
     * @param {Integer} dwMilliseconds The time-out interval, in milliseconds. If a nonzero value is specified, the function waits until the object is signaled, an I/O completion routine or APC is queued, or the interval elapses. If <i>dwMilliseconds</i> is zero, the function does not enter a wait state if the criteria is not met; it always returns immediately. If <i>dwMilliseconds</i> is <b>INFINITE</b>, the function will return only when the object is signaled or an I/O completion routine or APC is queued.
     * 
     * <b>Windows XP, Windows Server 2003, Windows Vista, Windows 7, Windows Server 2008 and Windows Server 2008 R2:  </b>The <i>dwMilliseconds</i> value does include time spent in low-power states. For example, the timeout does keep counting down while the computer is asleep.
     * 
     * <b>Windows 8, Windows Server 2012, Windows 8.1, Windows Server 2012 R2, Windows 10 and Windows Server 2016:  </b>The <i>dwMilliseconds</i> value does not include time spent in low-power states. For example, the timeout does not keep counting down while the computer is asleep.
     * @param {BOOL} bAlertable If this parameter is <b>TRUE</b> and the thread is in the waiting state, the function returns when the system queues an I/O completion routine or APC, and the thread runs the routine or function. Otherwise, the function does not return, and the completion routine or APC function is not executed.
     * 
     * A completion routine is queued when the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfileex">ReadFileEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefileex">WriteFileEx</a> function in which it was specified has completed. The wait function returns and the completion routine is called only if <i>bAlertable</i> is <b>TRUE</b>, and the calling thread is the thread that initiated the read or write operation. An APC is queued when you call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-queueuserapc">QueueUserAPC</a>.
     * @returns {Integer} If the function succeeds, the return value indicates the event that caused the function to return. It can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_ABANDONED</b></dt>
     * <dt>0x00000080L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object is a mutex object that was not released by the thread that owned the mutex object before the owning thread terminated. Ownership of the mutex object is granted to the calling thread and the mutex is set to nonsignaled.
     * 
     * If the mutex was protecting persistent state information, you should check it for consistency.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_IO_COMPLETION</b></dt>
     * <dt>0x000000C0L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wait was ended by one or more user-mode 
     * <a href="/windows/desktop/Sync/asynchronous-procedure-calls">asynchronous procedure calls</a> (APC) queued to the thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_OBJECT_0</b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the specified object is signaled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_TIMEOUT</b></dt>
     * <dt>0x00000102L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time-out interval elapsed, and the object's state is nonsignaled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_FAILED</b></dt>
     * <dt>(<b>DWORD</b>)0xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function has failed. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-waitforsingleobjectex
     * @since windows5.1.2600
     */
    static WaitForSingleObjectEx(hHandle, dwMilliseconds, bAlertable) {
        hHandle := hHandle is Win32Handle ? NumGet(hHandle, "ptr") : hHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WaitForSingleObjectEx", "ptr", hHandle, "uint", dwMilliseconds, "int", bAlertable, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Waits until one or all of the specified objects are in the signaled state, an I/O completion routine or asynchronous procedure call (APC) is queued to the thread, or the time-out interval elapses.
     * @param {Integer} nCount The number of object handles to wait for in the array pointed to by <i>lpHandles</i>. The maximum number of object handles is <b>MAXIMUM_WAIT_OBJECTS</b>. This parameter cannot be zero.
     * @param {Pointer<HANDLE>} lpHandles An array of object handles. For a list of the object types whose handles can be specified, see the following Remarks section. The array can contain handles of objects of different types. It may not contain multiple copies of the same handle. 
     * 
     * 
     * 
     * 
     * If one of these handles is closed while the wait is still pending, the function's behavior is undefined.
     * 
     * The handles must have the <b>SYNCHRONIZE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">Standard Access Rights</a>.
     * @param {BOOL} bWaitAll If this parameter is <b>TRUE</b>, the function returns when the state of all objects in the <i>lpHandles</i> array is set to signaled. If <b>FALSE</b>, the function returns when the state of any one of the objects is set to signaled. In the latter case, the return value indicates the object whose state caused the function to return.
     * @param {Integer} dwMilliseconds The time-out interval, in milliseconds. If a nonzero value is specified, the function waits until the specified objects are signaled, an I/O completion routine or APC is queued, or the interval elapses. If <i>dwMilliseconds</i> is zero, the function does not enter a wait state if the criteria is not met; it always returns immediately. If <i>dwMilliseconds</i> is <b>INFINITE</b>, the function will return only when the specified objects are signaled or an I/O completion routine or APC is queued.
     * 
     * <b>Windows XP, Windows Server 2003, Windows Vista, Windows 7, Windows Server 2008 and Windows Server 2008 R2:  </b>The <i>dwMilliseconds</i> value does include time spent in low-power states. For example, the timeout does keep counting down while the computer is asleep.
     * 
     * <b>Windows 8, Windows Server 2012, Windows 8.1, Windows Server 2012 R2, Windows 10 and Windows Server 2016:  </b>The <i>dwMilliseconds</i> value does not include time spent in low-power states. For example, the timeout does not keep counting down while the computer is asleep.
     * @param {BOOL} bAlertable If this parameter is <b>TRUE</b> and the thread is in the waiting state, the function returns when the system queues an I/O completion routine or APC, and the thread runs the routine or function. Otherwise, the function does not return and the completion routine or APC function is not executed.
     * 
     * A completion routine is queued when the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfileex">ReadFileEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefileex">WriteFileEx</a> function in which it was specified has completed. The wait function returns and the completion routine is called only if <i>bAlertable</i> is <b>TRUE</b> and the calling thread is the thread that initiated the read or write operation. An APC is queued when you call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-queueuserapc">QueueUserAPC</a>.
     * @returns {Integer} If the function succeeds, the return value indicates the event that caused the function to return. It can be one of the following values. (Note that <b>WAIT_OBJECT_0</b> is defined as 0 and <b>WAIT_ABANDONED_0</b> is defined as 0x00000080L.)
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_OBJECT_0</b> to (<b>WAIT_OBJECT_0</b> + <i>nCount</i>– 1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <i>bWaitAll</i> is <b>TRUE</b>, a return value in this range indicates that the state of all specified objects is signaled. 
     * 
     * 
     * 
     * 
     * If <i>bWaitAll</i> is <b>FALSE</b>, the return value minus <b>WAIT_OBJECT_0</b> indicates the <i>lpHandles</i> array index of the object that satisfied the wait. If more than one object became signaled during the call, this is the array index of the signaled object with the smallest index value of all the signaled objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_ABANDONED_0</b> to (<b>WAIT_ABANDONED_0</b> + <i>nCount</i>– 1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <i>bWaitAll</i> is <b>TRUE</b>, a return value in this range indicates that the state of all specified objects is signaled, and at least one of the objects is an abandoned mutex object. 
     * 
     * 
     * 
     * 
     * If <i>bWaitAll</i> is <b>FALSE</b>, the return value minus <b>WAIT_ABANDONED_0</b> indicates the <i>lpHandles</i> array index of an abandoned mutex object that satisfied the wait. Ownership of the mutex object is granted to the calling thread, and the mutex is set to nonsignaled.
     * 
     * If a mutex was protecting persistent state information, you should check it for consistency.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_IO_COMPLETION</b></dt>
     * <dt>0x000000C0L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wait was ended by one or more user-mode 
     * <a href="/windows/desktop/Sync/asynchronous-procedure-calls">asynchronous procedure calls</a> (APC) queued to the thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_TIMEOUT</b></dt>
     * <dt>0x00000102L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time-out interval elapsed, the conditions specified by the <i>bWaitAll</i> parameter were not satisfied, and no completion routines are queued.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_FAILED</b></dt>
     * <dt>(<b>DWORD</b>)0xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function has failed. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-waitformultipleobjectsex
     * @since windows5.1.2600
     */
    static WaitForMultipleObjectsEx(nCount, lpHandles, bWaitAll, dwMilliseconds, bAlertable) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WaitForMultipleObjectsEx", "uint", nCount, "ptr", lpHandles, "int", bWaitAll, "uint", dwMilliseconds, "int", bAlertable, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a named or unnamed mutex object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpMutexAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. If this parameter is <b>NULL</b>, the handle cannot be inherited by child processes. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new mutex. If <i>lpMutexAttributes</i> is <b>NULL</b>, the mutex gets a default security descriptor. The ACLs in the default security descriptor for a mutex come from the primary or impersonation token of the creator. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {BOOL} bInitialOwner If this value is <b>TRUE</b> and the caller created the mutex, the calling thread obtains initial ownership of the mutex object. Otherwise, the calling thread does not obtain ownership of the mutex. To determine if the caller created the mutex, see the Return Values section.
     * @param {PSTR} lpName The name of the mutex object. The name is limited to <b>MAX_PATH</b> characters. Name comparison is case sensitive. 
     * 
     * 
     * 
     * 
     * If <i>lpName</i> matches the name of an existing named mutex object, this function requests the <b>MUTEX_ALL_ACCESS</b> access right. In this case, the <i>bInitialOwner</i> parameter is ignored because it has already been set by the creating process. If the <i>lpMutexAttributes</i> parameter is not <b>NULL</b>, it determines whether the handle can be inherited, but its security-descriptor member is ignored.
     * 
     * If <i>lpName</i> is <b>NULL</b>, the mutex object is created without a name.
     * 
     * If <i>lpName</i> matches the name of an existing event, semaphore, waitable timer, job, or file-mapping object, the function fails and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the newly created mutex object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the mutex is a named mutex and the object existed before this function call, the return value is a handle to the existing object, and the [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) function returns **ERROR_ALREADY_EXISTS**.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-createmutexa
     * @since windows5.1.2600
     */
    static CreateMutexA(lpMutexAttributes, bInitialOwner, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateMutexA", "ptr", lpMutexAttributes, "int", bInitialOwner, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Creates or opens a named or unnamed mutex object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpMutexAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. If this parameter is <b>NULL</b>, the handle cannot be inherited by child processes. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new mutex. If <i>lpMutexAttributes</i> is <b>NULL</b>, the mutex gets a default security descriptor. The ACLs in the default security descriptor for a mutex come from the primary or impersonation token of the creator. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {BOOL} bInitialOwner If this value is <b>TRUE</b> and the caller created the mutex, the calling thread obtains initial ownership of the mutex object. Otherwise, the calling thread does not obtain ownership of the mutex. To determine if the caller created the mutex, see the Return Values section.
     * @param {PWSTR} lpName The name of the mutex object. The name is limited to <b>MAX_PATH</b> characters. Name comparison is case sensitive. 
     * 
     * 
     * 
     * 
     * If <i>lpName</i> matches the name of an existing named mutex object, this function requests the <b>MUTEX_ALL_ACCESS</b> access right. In this case, the <i>bInitialOwner</i> parameter is ignored because it has already been set by the creating process. If the <i>lpMutexAttributes</i> parameter is not <b>NULL</b>, it determines whether the handle can be inherited, but its security-descriptor member is ignored.
     * 
     * If <i>lpName</i> is <b>NULL</b>, the mutex object is created without a name.
     * 
     * If <i>lpName</i> matches the name of an existing event, semaphore, waitable timer, job, or file-mapping object, the function fails and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the newly created mutex object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the mutex is a named mutex and the object existed before this function call, the return value is a handle to the existing object, 
     * and the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_ALREADY_EXISTS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-createmutexw
     * @since windows5.1.2600
     */
    static CreateMutexW(lpMutexAttributes, bInitialOwner, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateMutexW", "ptr", lpMutexAttributes, "int", bInitialOwner, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Opens an existing named mutex object.
     * @param {Integer} dwDesiredAccess The access to the mutex object. Only the <b>SYNCHRONIZE</b> access right is required to use a mutex; to change the mutex's security, specify <b>MUTEX_ALL_ACCESS</b>. The function fails if the security descriptor of the specified object does not permit the requested access for the calling process. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {BOOL} bInheritHandle If this value is <b>TRUE</b>, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {PWSTR} lpName The name of the mutex to be opened. Name comparisons are case sensitive. 
     * 
     * 
     * 
     * 
     * This function can open objects in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * 
     * <b>Terminal Services:  </b>The name can have a "Global\" or "Local\" prefix to explicitly open an object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * 
     * <b>Note</b>  Fast user switching is implemented using Terminal Services sessions. The first user to log on uses session 0, the next user to log on uses session 1, and so on. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the mutex object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If a named mutex does not exist, the function fails and <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_FILE_NOT_FOUND</b>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-openmutexw
     * @since windows5.1.2600
     */
    static OpenMutexW(dwDesiredAccess, bInheritHandle, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\OpenMutexW", "uint", dwDesiredAccess, "int", bInheritHandle, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Creates or opens a named or unnamed event object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpEventAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. If 
     *       this parameter is <b>NULL</b>, the handle cannot be inherited by child processes. 
     *       
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a 
     *        <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptors">security descriptor</a> for the new 
     *        event. If <i>lpEventAttributes</i> is <b>NULL</b>, the event gets a default security descriptor. 
     *        The ACLs in the default security descriptor for an event come from the primary or impersonation token of the creator.
     * @param {BOOL} bManualReset If this parameter is <b>TRUE</b>, the function creates a manual-reset event object, which requires the use of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-resetevent">ResetEvent</a> function to set the event state to nonsignaled. If 
     *       this parameter is <b>FALSE</b>, the function creates an auto-reset event object, and system automatically resets the 
     *       event state to nonsignaled after a single waiting thread has been released.
     * @param {BOOL} bInitialState If this parameter is <b>TRUE</b>, the initial state of the event object is signaled; otherwise, it is nonsignaled.
     * @param {PSTR} lpName The name of the event object. The name is limited to 
     *       <b>MAX_PATH</b> characters. Name comparison is case sensitive. 
     *       
     * 
     * If <i>lpName</i> matches the name of an existing named event object, this function requests 
     *        the <b>EVENT_ALL_ACCESS</b> access right. In this case, the 
     *        <i>bManualReset</i> and <i>bInitialState</i> parameters are ignored 
     *        because they have already been set by the creating process. If the 
     *        <i>lpEventAttributes</i> parameter is not <b>NULL</b>, it determines whether the handle can be 
     *        inherited, but its security-descriptor member is ignored.
     * 
     * If <i>lpName</i> is <b>NULL</b>, the event object is created without a name.
     * 
     * If <i>lpName</i> matches the name of another kind of object in the same namespace (such as an existing semaphore, mutex, waitable timer, job, or 
     *        file-mapping object), the function fails and the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns 
     *        <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session 
     *         namespace. The remainder of the name can contain any character except the backslash character (\\). For more 
     *         information, see <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined 
     *         for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the event object. If the named event object existed 
     *        before the function call, the function returns a handle to the existing object and 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-createeventa
     * @since windows5.1.2600
     */
    static CreateEventA(lpEventAttributes, bManualReset, bInitialState, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateEventA", "ptr", lpEventAttributes, "int", bManualReset, "int", bInitialState, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Creates or opens a named or unnamed event object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpEventAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. If 
     *       this parameter is <b>NULL</b>, the handle cannot be inherited by child processes. 
     *       
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a 
     *        <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptors">security descriptor</a> for the new 
     *        event. If <i>lpEventAttributes</i> is <b>NULL</b>, the event gets a default security descriptor. 
     *        The ACLs in the default security descriptor for an event come from the primary or impersonation token of the creator.
     * @param {BOOL} bManualReset If this parameter is <b>TRUE</b>, the function creates a manual-reset event object, which requires the use of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-resetevent">ResetEvent</a> function to set the event state to nonsignaled. If 
     *       this parameter is <b>FALSE</b>, the function creates an auto-reset event object, and system automatically resets the 
     *       event state to nonsignaled after a single waiting thread has been released.
     * @param {BOOL} bInitialState If this parameter is <b>TRUE</b>, the initial state of the event object is signaled; otherwise, it is nonsignaled.
     * @param {PWSTR} lpName The name of the event object. The name is limited to 
     *       <b>MAX_PATH</b> characters. Name comparison is case sensitive. 
     *       
     * 
     * If <i>lpName</i> matches the name of an existing named event object, this function requests 
     *        the <b>EVENT_ALL_ACCESS</b> access right. In this case, the 
     *        <i>bManualReset</i> and <i>bInitialState</i> parameters are ignored 
     *        because they have already been set by the creating process. If the 
     *        <i>lpEventAttributes</i> parameter is not <b>NULL</b>, it determines whether the handle can be 
     *        inherited, but its security-descriptor member is ignored.
     * 
     * If <i>lpName</i> is <b>NULL</b>, the event object is created without a name.
     * 
     * If <i>lpName</i> matches the name of another kind of object in the same namespace (such as an existing semaphore, mutex, waitable timer, job, or 
     *        file-mapping object), the function fails and the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns 
     *        <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session 
     *         namespace. The remainder of the name can contain any character except the backslash character (\\). For more 
     *         information, see <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined 
     *         for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the event object. If the named event object existed 
     *        before the function call, the function returns a handle to the existing object and 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-createeventw
     * @since windows5.1.2600
     */
    static CreateEventW(lpEventAttributes, bManualReset, bInitialState, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateEventW", "ptr", lpEventAttributes, "int", bManualReset, "int", bInitialState, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Opens an existing named event object.
     * @param {Integer} dwDesiredAccess The access to the event object. The function fails if the security descriptor of the specified object does not permit the requested access for the calling process. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {BOOL} bInheritHandle If this value is <b>TRUE</b>, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {PSTR} lpName The  name of the event to be opened. Name comparisons are case sensitive.
     * 
     * This function can open objects in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * 
     * <b>Terminal Services:  </b>The name can have a "Global\" or "Local\" prefix to explicitly open an object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * 
     * <b>Note</b>  Fast user switching is implemented using Terminal Services sessions. The first user to log on uses session 0, the next user to log on uses session 1, and so on. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the event object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-openeventa
     * @since windows5.1.2600
     */
    static OpenEventA(dwDesiredAccess, bInheritHandle, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\OpenEventA", "uint", dwDesiredAccess, "int", bInheritHandle, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Opens an existing named event object.
     * @param {Integer} dwDesiredAccess The access to the event object. The function fails if the security descriptor of the specified object does not permit the requested access for the calling process. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {BOOL} bInheritHandle If this value is <b>TRUE</b>, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {PWSTR} lpName The  name of the event to be opened. Name comparisons are case sensitive.
     * 
     * This function can open objects in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * 
     * <b>Terminal Services:  </b>The name can have a "Global\" or "Local\" prefix to explicitly open an object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * 
     * <b>Note</b>  Fast user switching is implemented using Terminal Services sessions. The first user to log on uses session 0, the next user to log on uses session 1, and so on. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the event object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-openeventw
     * @since windows5.1.2600
     */
    static OpenEventW(dwDesiredAccess, bInheritHandle, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\OpenEventW", "uint", dwDesiredAccess, "int", bInheritHandle, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Opens an existing named semaphore object.
     * @param {Integer} dwDesiredAccess The access to the semaphore object. The function fails if the security descriptor of the specified object does not permit the requested access for the calling process. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {BOOL} bInheritHandle If this value is <b>TRUE</b>, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {PWSTR} lpName The name of the semaphore to be opened. Name comparisons are case sensitive. 
     * 
     * 
     * 
     * 
     * This function can open objects in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * 
     * <b>Terminal Services:  </b>The name can have a "Global\" or "Local\" prefix to explicitly open an object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * 
     * <b>Note</b>  Fast user switching is implemented using Terminal Services sessions. The first user to log on uses session 0, the next user to log on uses session 1, and so on. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the semaphore object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-opensemaphorew
     * @since windows5.1.2600
     */
    static OpenSemaphoreW(dwDesiredAccess, bInheritHandle, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\OpenSemaphoreW", "uint", dwDesiredAccess, "int", bInheritHandle, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Opens an existing named waitable timer object.
     * @param {Integer} dwDesiredAccess The access to the timer object. The function fails if the security descriptor of the specified object does 
     *       not permit the requested access for the calling process. For a list of access rights, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {BOOL} bInheritHandle If this value is <b>TRUE</b>, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {PWSTR} lpTimerName The name of the timer object. The name is limited to <b>MAX_PATH</b> characters. Name comparison is case sensitive.
     * 
     * This function can open objects in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * 
     * <b>Terminal Services:  </b>The name can have a "Global\" or "Local\" prefix to explicitly open an object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     * 
     * <b>Note</b>  Fast user switching is implemented using Terminal Services sessions. The first user to log on uses session 0, the next user to log on uses session 1, and so on. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the timer object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-openwaitabletimerw
     * @since windows5.1.2600
     */
    static OpenWaitableTimerW(dwDesiredAccess, bInheritHandle, lpTimerName) {
        lpTimerName := lpTimerName is String ? StrPtr(lpTimerName) : lpTimerName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\OpenWaitableTimerW", "uint", dwDesiredAccess, "int", bInheritHandle, "ptr", lpTimerName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Activates the specified waitable timer and provides context information for the timer. When the due time arrives, the timer is signaled and the thread that set the timer calls the optional completion routine.
     * @param {HANDLE} hTimer A handle to the timer object. The [CreateWaitableTimer](./nf-synchapi-createwaitabletimerexw.md) or [OpenWaitableTimer](./nf-synchapi-openwaitabletimerw.md) function returns this handle.
     * 
     * The handle must have the <b>TIMER_MODIFY_STATE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {Pointer<Integer>} lpDueTime The time after which the state of the timer is to be set to signaled, in 100 nanosecond intervals. Use the format described by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure. Positive values indicate absolute time. Be sure to use a UTC-based absolute time, as the system uses UTC-based time internally. Negative values indicate relative time. The actual timer accuracy depends on the capability of your hardware. For more information about UTC-based time, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/system-time">System Time</a>.
     * @param {Integer} lPeriod The period of the timer, in milliseconds. If <i>lPeriod</i> is zero, the timer is signaled once. If <i>lPeriod</i> is greater than zero, the timer is periodic. A periodic timer automatically reactivates each time the period elapses, until the timer is canceled using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-cancelwaitabletimer">CancelWaitableTimer</a> function or reset using 
     * <b>SetWaitableTimerEx</b>. If <i>lPeriod</i> is less than zero, the function fails.
     * @param {Pointer<PTIMERAPCROUTINE>} pfnCompletionRoutine A pointer to an optional completion routine. The completion routine is application-defined function of type <b>PTIMERAPCROUTINE</b> to be executed when the timer is signaled. For more information on the timer callback function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nc-synchapi-ptimerapcroutine">TimerAPCProc</a>.  For more information about APCs and thread pool threads, see Remarks.
     * @param {Pointer<Void>} lpArgToCompletionRoutine A pointer to a structure that is passed to the completion routine.
     * @param {Pointer<REASON_CONTEXT>} WakeContext Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-reason_context">REASON_CONTEXT</a> structure that contains context information for the timer.
     * @param {Integer} TolerableDelay The tolerable delay for expiration time, in milliseconds.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-setwaitabletimerex
     * @since windows6.1
     */
    static SetWaitableTimerEx(hTimer, lpDueTime, lPeriod, pfnCompletionRoutine, lpArgToCompletionRoutine, WakeContext, TolerableDelay) {
        hTimer := hTimer is Win32Handle ? NumGet(hTimer, "ptr") : hTimer

        lpDueTimeMarshal := lpDueTime is VarRef ? "int64*" : "ptr"
        lpArgToCompletionRoutineMarshal := lpArgToCompletionRoutine is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetWaitableTimerEx", "ptr", hTimer, lpDueTimeMarshal, lpDueTime, "int", lPeriod, "ptr", pfnCompletionRoutine, lpArgToCompletionRoutineMarshal, lpArgToCompletionRoutine, "ptr", WakeContext, "uint", TolerableDelay, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Activates the specified waitable timer. When the due time arrives, the timer is signaled and the thread that set the timer calls the optional completion routine.
     * @param {HANDLE} hTimer A handle to the timer object. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createwaitabletimerw">CreateWaitableTimer</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-openwaitabletimerw">OpenWaitableTimer</a> function returns this handle. 
     * 
     * 
     * 
     * 
     * The handle must have the <b>TIMER_MODIFY_STATE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {Pointer<Integer>} lpDueTime The time after which the state of the timer is to be set to signaled, in 100 nanosecond intervals. Use the format described by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure. Positive values indicate absolute time. Be sure to use a UTC-based absolute time, as the system uses UTC-based time internally. Negative values indicate relative time. The actual timer accuracy depends on the capability of your hardware. For more information about UTC-based time, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/system-time">System Time</a>.
     * @param {Integer} lPeriod The period of the timer, in milliseconds. If <i>lPeriod</i> is zero, the timer is signaled once. If <i>lPeriod</i> is greater than zero, the timer is periodic. A periodic timer automatically reactivates each time the period elapses, until the timer is canceled using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-cancelwaitabletimer">CancelWaitableTimer</a> function or reset using 
     * <b>SetWaitableTimer</b>. If <i>lPeriod</i> is less than zero, the function fails.
     * @param {Pointer<PTIMERAPCROUTINE>} pfnCompletionRoutine A pointer to an optional completion routine. The completion routine is application-defined function of type <b>PTIMERAPCROUTINE</b> to be executed when the timer is signaled. For more information on the timer callback function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nc-synchapi-ptimerapcroutine">TimerAPCProc</a>. For more information about APCs and thread pool threads, see Remarks.
     * @param {Pointer<Void>} lpArgToCompletionRoutine A pointer to a structure that is passed to the completion routine.
     * @param {BOOL} fResume If this parameter is <b>TRUE</b>, restores a system in suspended power conservation mode when the timer state is set to signaled. Otherwise, the system is not restored. If the system does not support a restore, the call succeeds, but <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_NOT_SUPPORTED</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-setwaitabletimer
     * @since windows5.1.2600
     */
    static SetWaitableTimer(hTimer, lpDueTime, lPeriod, pfnCompletionRoutine, lpArgToCompletionRoutine, fResume) {
        hTimer := hTimer is Win32Handle ? NumGet(hTimer, "ptr") : hTimer

        lpDueTimeMarshal := lpDueTime is VarRef ? "int64*" : "ptr"
        lpArgToCompletionRoutineMarshal := lpArgToCompletionRoutine is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetWaitableTimer", "ptr", hTimer, lpDueTimeMarshal, lpDueTime, "int", lPeriod, "ptr", pfnCompletionRoutine, lpArgToCompletionRoutineMarshal, lpArgToCompletionRoutine, "int", fResume, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the specified waitable timer to the inactive state.
     * @param {HANDLE} hTimer A handle to the timer object. The 
     * [CreateWaitableTimer](./nf-synchapi-createwaitabletimerw.md) or 
     * [OpenWaitableTimer](./nf-synchapi-openwaitabletimerw.md) function returns this handle. The handle must have the <b>TIMER_MODIFY_STATE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-cancelwaitabletimer
     * @since windows5.1.2600
     */
    static CancelWaitableTimer(hTimer) {
        hTimer := hTimer is Win32Handle ? NumGet(hTimer, "ptr") : hTimer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CancelWaitableTimer", "ptr", hTimer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a named or unnamed mutex object and returns a handle to the object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpMutexAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. If this parameter is <b>NULL</b>, the mutex handle cannot be inherited by child processes. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new mutex. If <i>lpMutexAttributes</i> is <b>NULL</b>, the mutex gets a default security descriptor. The ACLs in the default security descriptor for a mutex come from the primary or impersonation token of the creator. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {PSTR} lpName The name of the mutex object. The name is limited to <b>MAX_PATH</b> characters. Name comparison is case sensitive. 
     * 
     * 
     * 
     *       
     * 
     * If <i>lpName</i> is <b>NULL</b>, the mutex object is created without a name.
     * 
     * If <i>lpName</i> matches the name of an existing event, semaphore, waitable timer, job, or file-mapping object, the function fails and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @param {Integer} dwFlags This parameter can be 0 or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREATE_MUTEX_INITIAL_OWNER"></a><a id="create_mutex_initial_owner"></a><dl>
     * <dt><b>CREATE_MUTEX_INITIAL_OWNER</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object creator is the initial owner of the mutex.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwDesiredAccess The access mask for the mutex object. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the newly created mutex object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the mutex is a named mutex and the object existed before this function call, the return value is a handle to the existing object, and the [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) function returns **ERROR_ALREADY_EXISTS**.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-createmutexexa
     * @since windows6.0.6000
     */
    static CreateMutexExA(lpMutexAttributes, lpName, dwFlags, dwDesiredAccess) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateMutexExA", "ptr", lpMutexAttributes, "ptr", lpName, "uint", dwFlags, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Creates or opens a named or unnamed mutex object and returns a handle to the object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpMutexAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. If this parameter is <b>NULL</b>, the mutex handle cannot be inherited by child processes. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new mutex. If <i>lpMutexAttributes</i> is <b>NULL</b>, the mutex gets a default security descriptor. The ACLs in the default security descriptor for a mutex come from the primary or impersonation token of the creator. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {PWSTR} lpName The name of the mutex object. The name is limited to <b>MAX_PATH</b> characters. Name comparison is case sensitive. 
     * 
     * 
     * 
     *       
     * 
     * If <i>lpName</i> is <b>NULL</b>, the mutex object is created without a name.
     * 
     * If <i>lpName</i> matches the name of an existing event, semaphore, waitable timer, job, or file-mapping object, the function fails and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @param {Integer} dwFlags This parameter can be 0 or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREATE_MUTEX_INITIAL_OWNER"></a><a id="create_mutex_initial_owner"></a><dl>
     * <dt><b>CREATE_MUTEX_INITIAL_OWNER</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object creator is the initial owner of the mutex.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwDesiredAccess The access mask for the mutex object. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the newly created mutex object.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the mutex is a named mutex and the object existed before this function call, the return value is a handle to the existing object, and the [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) function returns **ERROR_ALREADY_EXISTS**.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-createmutexexw
     * @since windows6.0.6000
     */
    static CreateMutexExW(lpMutexAttributes, lpName, dwFlags, dwDesiredAccess) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateMutexExW", "ptr", lpMutexAttributes, "ptr", lpName, "uint", dwFlags, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Creates or opens a named or unnamed event object and returns a handle to the object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpEventAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. If 
     *       <i>lpEventAttributes</i> is <b>NULL</b>, the event handle cannot be inherited by child processes.
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a 
     *        <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptors">security descriptor</a> for the new 
     *        event. If <i>lpEventAttributes</i> is <b>NULL</b>, the event gets a default security descriptor. 
     *        The ACLs in the default security descriptor for an event come from the primary or impersonation token of the creator.
     * @param {PSTR} lpName The name of the event object. The name is limited to 
     *       <b>MAX_PATH</b> characters. Name comparison is case sensitive.
     * 
     * If <i>lpName</i> is <b>NULL</b>, the event object is created without a name.
     * 
     * If <i>lpName</i> matches the name of another kind of object in the same namespace (such as an existing semaphore, mutex, waitable timer, job, or 
     *        file-mapping object), the function fails and the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns 
     *        <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session 
     *         namespace. The remainder of the name can contain any character except the backslash character (\\). For more 
     *         information, see <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined 
     *         for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @param {Integer} dwFlags 
     * @param {Integer} dwDesiredAccess The access mask for the event object. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the event object. If the named event object existed 
     *        before the function call, the function returns a handle to the existing object and 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_ALREADY_EXISTS</b>.
     *      
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-createeventexa
     * @since windows6.0.6000
     */
    static CreateEventExA(lpEventAttributes, lpName, dwFlags, dwDesiredAccess) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateEventExA", "ptr", lpEventAttributes, "ptr", lpName, "uint", dwFlags, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Creates or opens a named or unnamed event object and returns a handle to the object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpEventAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. If 
     *       <i>lpEventAttributes</i> is <b>NULL</b>, the event handle cannot be inherited by child processes.
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a 
     *        <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptors">security descriptor</a> for the new 
     *        event. If <i>lpEventAttributes</i> is <b>NULL</b>, the event gets a default security descriptor. 
     *        The ACLs in the default security descriptor for an event come from the primary or impersonation token of the creator.
     * @param {PWSTR} lpName The name of the event object. The name is limited to 
     *       <b>MAX_PATH</b> characters. Name comparison is case sensitive.
     * 
     * If <i>lpName</i> is <b>NULL</b>, the event object is created without a name.
     * 
     * If <i>lpName</i> matches the name of another kind of object in the same namespace (such as an existing semaphore, mutex, waitable timer, job, or 
     *        file-mapping object), the function fails and the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns 
     *        <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session 
     *         namespace. The remainder of the name can contain any character except the backslash character (\\). For more 
     *         information, see <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined 
     *         for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @param {Integer} dwFlags 
     * @param {Integer} dwDesiredAccess The access mask for the event object. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the event object. If the named event object existed 
     *        before the function call, the function returns a handle to the existing object and 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_ALREADY_EXISTS</b>.
     *      
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-createeventexw
     * @since windows6.0.6000
     */
    static CreateEventExW(lpEventAttributes, lpName, dwFlags, dwDesiredAccess) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateEventExW", "ptr", lpEventAttributes, "ptr", lpName, "uint", dwFlags, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Creates or opens a named or unnamed semaphore object and returns a handle to the object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSemaphoreAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. If this parameter is <b>NULL</b>, the semaphore handle cannot be inherited by child processes. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new semaphore. If this parameter is <b>NULL</b>, the semaphore gets a default security descriptor. The ACLs in the default security descriptor for a semaphore come from the primary or impersonation token of the creator.
     * @param {Integer} lInitialCount The initial count for the semaphore object. This value must be greater than or equal to zero and less than or equal to <i>lMaximumCount</i>. The state of a semaphore is signaled when its count is greater than zero and nonsignaled when it is zero. The count is decreased by one whenever a wait function releases a thread that was waiting for the semaphore. The count is increased by a specified amount by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-releasesemaphore">ReleaseSemaphore</a> function.
     * @param {Integer} lMaximumCount The maximum count for the semaphore object. This value must be greater than zero.
     * @param {PWSTR} lpName A pointer to a null-terminated string specifying the name of the semaphore object. The name is limited to <b>MAX_PATH</b> characters. Name comparison is case sensitive.
     * 
     * If <i>lpName</i> matches the name of an existing named semaphore object, the <i>lInitialCount</i> and <i>lMaximumCount</i> parameters are ignored because they have already been set by the creating process. If the <i>lpSemaphoreAttributes</i> parameter is not <b>NULL</b>, it determines whether the handle can be inherited.
     * 
     * If <i>lpName</i> is <b>NULL</b>, the semaphore object is created without a name.
     * 
     * If <i>lpName</i> matches the name of an existing event, mutex, waitable timer, job, or file-mapping object, the function fails and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @param {Integer} dwDesiredAccess The access mask for the semaphore object. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the semaphore object. If the named semaphore object existed before the function call, the function returns a handle to the existing object and 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-createsemaphoreexw
     * @since windows6.0.6000
     */
    static CreateSemaphoreExW(lpSemaphoreAttributes, lInitialCount, lMaximumCount, lpName, dwDesiredAccess) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateSemaphoreExW", "ptr", lpSemaphoreAttributes, "int", lInitialCount, "int", lMaximumCount, "ptr", lpName, "uint", dwFlags, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Creates or opens a waitable timer object and returns a handle to the object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpTimerAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. If this parameter is <b>NULL</b>, the timer handle cannot be inherited by child processes. 
     * 
     * If <i>lpTimerAttributes</i> is <b>NULL</b>, the timer object gets a default security descriptor and the handle cannot be inherited. The ACLs in the default security descriptor for a timer come from the primary or impersonation token of the creator.
     * @param {PWSTR} lpTimerName The name of the timer object. The name is limited to <b>MAX_PATH</b> characters. Name comparison is case sensitive. 
     * 
     * 
     * 
     * 
     * If <i>lpTimerName</i> is <b>NULL</b>, the timer object is created without a name.
     * 
     * If <i>lpTimerName</i> matches the name of an existing event, semaphore, mutex, job, or file-mapping object, the function fails and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @param {Integer} dwFlags This parameter can be 0 or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREATE_WAITABLE_TIMER_MANUAL_RESET"></a><a id="create_waitable_timer_manual_reset"></a><dl>
     * <dt><b>CREATE_WAITABLE_TIMER_MANUAL_RESET</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The timer must be manually reset. Otherwise, the system automatically resets the timer after releasing a single waiting thread.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwDesiredAccess The access mask for the timer object. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the timer object. If the named timer object exists before the function call, the function returns a handle to the existing object and 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-createwaitabletimerexw
     * @since windows6.0.6000
     */
    static CreateWaitableTimerExW(lpTimerAttributes, lpTimerName, dwFlags, dwDesiredAccess) {
        lpTimerName := lpTimerName is String ? StrPtr(lpTimerName) : lpTimerName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateWaitableTimerExW", "ptr", lpTimerAttributes, "ptr", lpTimerName, "uint", dwFlags, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Causes the calling thread to wait at a synchronization barrier until the maximum number of threads have entered the barrier.
     * @param {Pointer<SYNCHRONIZATION_BARRIER>} lpBarrier A pointer to an initialized synchronization barrier. Use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-initializesynchronizationbarrier">InitializeSynchronizationBarrier</a> 
     *       function to initialize the barrier. <b>SYNCHRONIZATION_BARRIER</b> is an opaque 
     *       structure that should not be modified by the application.
     * @param {Integer} dwFlags Flags that control the behavior of threads that enter this barrier. This parameter can be one or more of 
     *       the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYNCHRONIZATION_BARRIER_FLAGS_BLOCK_ONLY"></a><a id="synchronization_barrier_flags_block_only"></a><dl>
     * <dt><b>SYNCHRONIZATION_BARRIER_FLAGS_BLOCK_ONLY</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the thread entering the barrier should block immediately until the last thread enters the 
     *         barrier. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYNCHRONIZATION_BARRIER_FLAGS_SPIN_ONLY"></a><a id="synchronization_barrier_flags_spin_only"></a><dl>
     * <dt><b>SYNCHRONIZATION_BARRIER_FLAGS_SPIN_ONLY</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the thread entering the barrier should spin until the last thread enters the barrier, even 
     *         if the spinning thread exceeds the barrier's maximum spin count. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SYNCHRONIZATION_BARRIER_FLAGS_NO_DELETE"></a><a id="synchronization_barrier_flags_no_delete"></a><dl>
     * <dt><b>SYNCHRONIZATION_BARRIER_FLAGS_NO_DELETE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the function can skip the work required to ensure that it is safe to delete the barrier, 
     *         which can improve performance. All threads that enter this barrier must specify the flag; otherwise, the flag 
     *         is ignored. This flag should be used only if the barrier will never be deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} <b>TRUE</b> for the last thread to signal the barrier. Threads that signal the barrier 
     *       before the last thread signals it receive a return value of <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-entersynchronizationbarrier
     * @since windows8.0
     */
    static EnterSynchronizationBarrier(lpBarrier, dwFlags) {
        result := DllCall("KERNEL32.dll\EnterSynchronizationBarrier", "ptr", lpBarrier, "uint", dwFlags, "int")
        return result
    }

    /**
     * Initializes a new synchronization barrier.
     * @param {Pointer<SYNCHRONIZATION_BARRIER>} lpBarrier A pointer to the <b>SYNCHRONIZATION_BARRIER</b> structure to initialize. This is an 
     *       opaque structure that should not be modified by applications.
     * @param {Integer} lTotalThreads The maximum number of threads that can enter this barrier. After the maximum number of threads have entered 
     *       the barrier, all threads continue.
     * @param {Integer} lSpinCount The number of times an individual thread should spin while waiting for other threads to arrive at the 
     *       barrier. If this parameter is -1, the thread spins 2000 times. If the thread exceeds 
     *       <i>lSpinCount</i>, the thread blocks unless it called 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-entersynchronizationbarrier">EnterSynchronizationBarrier</a> with 
     *       <b>SYNCHRONIZATION_BARRIER_FLAGS_SPIN_ONLY</b>.
     * @returns {BOOL} <b>TRUE </b>if the barrier was successfully initialized. If the barrier was not 
     *       successfully initialized, this function returns <b>FALSE</b>. Use 
     *       <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to get extended error information.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-initializesynchronizationbarrier
     * @since windows8.0
     */
    static InitializeSynchronizationBarrier(lpBarrier, lTotalThreads, lSpinCount) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\InitializeSynchronizationBarrier", "ptr", lpBarrier, "int", lTotalThreads, "int", lSpinCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes a synchronization barrier.
     * @param {Pointer<SYNCHRONIZATION_BARRIER>} lpBarrier A pointer to the synchronization barrier to delete.
     * @returns {BOOL} The <b>DeleteSynchronizationBarrier</b> function always returns <b>TRUE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-deletesynchronizationbarrier
     * @since windows8.0
     */
    static DeleteSynchronizationBarrier(lpBarrier) {
        result := DllCall("KERNEL32.dll\DeleteSynchronizationBarrier", "ptr", lpBarrier, "int")
        return result
    }

    /**
     * Suspends the execution of the current thread until the time-out interval elapses.
     * @remarks
     * 
     * This function causes a thread to relinquish the remainder of its time slice and become unrunnable for an interval based on the value of <i>dwMilliseconds</i>. The system clock "ticks" at a constant rate. If <i>dwMilliseconds</i> is less than the resolution of the system clock, the thread may sleep for less than the specified length of time. If <i>dwMilliseconds</i> is greater than one tick but less than two, the wait can be anywhere between one and two ticks, and so on. To increase the accuracy of the sleep interval, call the <b>timeGetDevCaps</b> function to determine the supported minimum timer resolution and the <b>timeBeginPeriod</b> function to set the timer resolution to its minimum. Use caution when calling <b>timeBeginPeriod</b>, as frequent calls can significantly affect the system clock, system power usage, and the scheduler. If you call <b>timeBeginPeriod</b>, call it one time early in the application and be sure to call the <b>timeEndPeriod</b> function at the very end of the application.
     * 
     * After the sleep interval has passed, the thread is ready to run. If you specify 0 milliseconds, the thread will relinquish the remainder of its time slice but remain ready. Note that a ready thread is not guaranteed to run immediately. Consequently, the thread may not run until some time after the sleep interval elapses. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/scheduling-priorities">Scheduling Priorities</a>.
     * 
     * Be careful when using <b>Sleep</b> in the following scenarios:
     * 
     * <ul>
     * <li>Code  that directly or indirectly creates windows (for example, DDE and COM <b>CoInitialize</b>). If a thread creates any windows, it must process messages. Message broadcasts are sent to all windows in the system. If you have a thread that uses 
     * <b>Sleep</b> with infinite delay, the system will deadlock. </li>
     * <li>Threads that are under concurrency control. For example, an I/O completion port or thread pool limits the number of associated threads that can run. If the maximum number of threads is already running, no additional associated thread can run until a running thread finishes. If a thread uses <b>Sleep</b> with an interval of zero to wait for one of the additional associated threads to accomplish some work,  the process might deadlock. </li>
     * </ul>
     *  For these scenarios, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-msgwaitformultipleobjects">MsgWaitForMultipleObjects</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-msgwaitformultipleobjectsex">MsgWaitForMultipleObjectsEx</a>, rather than 
     * <b>Sleep</b>.
     * 
     * <b>Windows Phone 8.1:</b> This function is supported for Windows Phone Store apps on Windows Phone 8.1 and later.
     * 
     * <b>Windows 8.1</b> and <b>Windows Server 2012 R2</b>: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
     * 
     * 
     * 
     * @param {Integer} dwMilliseconds The time interval for which execution is to be suspended, in milliseconds.
     * 
     * A value of zero causes the thread to relinquish the remainder of its time slice to any other thread  that is ready to run. If there are no other threads ready to run, the function returns immediately, and the thread continues execution.<b>Windows XP:  </b>A value of zero causes the thread to relinquish the remainder of its time slice to any other thread of equal priority that is ready to run. If there are no other threads of equal priority ready to run, the function returns immediately, and the thread continues execution. This behavior changed starting with Windows Server 2003.
     * 
     * 
     * 
     * A value of INFINITE indicates that the suspension should not time out.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-sleep
     * @since windows5.1.2600
     */
    static Sleep(dwMilliseconds) {
        DllCall("KERNEL32.dll\Sleep", "uint", dwMilliseconds)
    }

    /**
     * Waits for the value at the specified address to change.
     * @param {Pointer} Address The address on which to wait. If the value at <i>Address</i> differs from the value at <i>CompareAddress</i>, the function returns immediately. If the values are the same, the function does not return until another thread in the same process signals that the value at Address has changed by calling <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-wakebyaddresssingle">WakeByAddressSingle</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-wakebyaddressall">WakeByAddressAll</a> or the timeout elapses, whichever comes first.
     * @param {Pointer} CompareAddress A pointer to the location of the previously observed value at <i>Address</i>. The function returns when the value at <i>Address</i> differs from the value at <i>CompareAddress</i>.
     * @param {Pointer} AddressSize The size of the value, in bytes. This parameter can be 1, 2, 4, or 8.
     * @param {Integer} dwMilliseconds The number of milliseconds to wait before the operation times out. If this parameter is <b>INFINITE</b>, the thread waits indefinitely.
     * @returns {BOOL} TRUE if the wait succeeded. If the operation fails, the function returns FALSE. If the wait fails, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to obtain extended error information. In particular, if the operation times out, <b>GetLastError</b>  returns <b>ERROR_TIMEOUT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-waitonaddress
     * @since windows8.0
     */
    static WaitOnAddress(Address, CompareAddress, AddressSize, dwMilliseconds) {
        A_LastError := 0

        result := DllCall("api-ms-win-core-synch-l1-2-0.dll\WaitOnAddress", "ptr", Address, "ptr", CompareAddress, "ptr", AddressSize, "uint", dwMilliseconds, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Wakes one thread that is waiting for the value of an address to change.
     * @remarks
     * 
     * Windows Store apps developers may need to obtain synchronization.lib by installing the <a href="https://developer.microsoft.com/en-us/windows/downloads/windows-8-sdk">Windows Software Development Kit (SDK) for Windows 8</a>.
     * 
     * Only a thread within the same process can be woken.
     * 
     * 
     * @param {Pointer<Void>} Address The address to signal. If another thread has previously called 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-waitonaddress">WaitOnAddress</a> for this address, the system wakes the 
     *       waiting thread. If multiple threads are waiting for this address, the system wakes the first thread to 
     *       wait.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-wakebyaddresssingle
     * @since windows8.0
     */
    static WakeByAddressSingle(Address) {
        AddressMarshal := Address is VarRef ? "ptr" : "ptr"

        DllCall("api-ms-win-core-synch-l1-2-0.dll\WakeByAddressSingle", AddressMarshal, Address)
    }

    /**
     * Wakes all threads that are waiting for the value of an address to change.
     * @remarks
     * 
     * Windows Store apps developers may need to obtain synchronization.lib by installing the <a href="https://developer.microsoft.com/en-us/windows/downloads/windows-8-sdk">Windows Software Development Kit (SDK) for Windows 8</a>.
     * 
     * Only threads within the same process can be woken.
     * 
     * 
     * @param {Pointer<Void>} Address The address to signal. If any threads have previously called 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-waitonaddress">WaitOnAddress</a> for this address, the system wakes all 
     *       of the waiting threads.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-wakebyaddressall
     * @since windows8.0
     */
    static WakeByAddressAll(Address) {
        AddressMarshal := Address is VarRef ? "ptr" : "ptr"

        DllCall("api-ms-win-core-synch-l1-2-0.dll\WakeByAddressAll", AddressMarshal, Address)
    }

    /**
     * Waits until one or all of the specified objects are in the signaled state or the time-out interval elapses.
     * @param {Integer} nCount The number of object handles in the array pointed to by <i>lpHandles</i>. The maximum number of object handles is <b>MAXIMUM_WAIT_OBJECTS</b>. This parameter cannot be zero.
     * @param {Pointer<HANDLE>} lpHandles An array of object handles. For a list of the object types whose handles can be specified, see the following Remarks section. The array can contain handles to objects of different types. It may not contain multiple copies of the same handle.
     * 
     * If one of these handles is closed while the wait is still pending, the function's behavior is undefined.
     * 
     * The handles must have the <b>SYNCHRONIZE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">Standard Access Rights</a>.
     * @param {BOOL} bWaitAll If this parameter is <b>TRUE</b>, the function returns when the state of all objects in the <i>lpHandles</i> array is signaled. If <b>FALSE</b>, the function returns when the state of any one of the objects is set to signaled. In the latter case, the return value indicates the object whose state caused the function to return.
     * @param {Integer} dwMilliseconds The time-out interval, in milliseconds. If a nonzero value is specified, the function waits until the specified objects are signaled or the interval elapses. If <i>dwMilliseconds</i> is zero, the function does not enter a wait state if the specified objects are not signaled; it always returns immediately. If <i>dwMilliseconds</i> is <b>INFINITE</b>, the function will return only when the specified objects are signaled.
     * 
     * <b>Windows XP, Windows Server 2003, Windows Vista, Windows 7, Windows Server 2008 and Windows Server 2008 R2:  </b>The <i>dwMilliseconds</i> value does include time spent in low-power states. For example, the timeout does keep counting down while the computer is asleep.
     * 
     * <b>Windows 8, Windows Server 2012, Windows 8.1, Windows Server 2012 R2, Windows 10 and Windows Server 2016:  </b>The <i>dwMilliseconds</i> value does not include time spent in low-power states. For example, the timeout does not keep counting down while the computer is asleep.
     * @returns {Integer} If the function succeeds, the return value indicates the event that caused the function to return. It can be one of the following values. (Note that <b>WAIT_OBJECT_0</b> is defined as 0 and <b>WAIT_ABANDONED_0</b> is defined as 0x00000080L.)
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_OBJECT_0</b> to (<b>WAIT_OBJECT_0</b> + <i>nCount</i>– 1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <i>bWaitAll</i> is <b>TRUE</b>, a return value within the specified range indicates that the state of all specified objects is signaled. 
     * 
     * 
     * 
     * 
     * If <i>bWaitAll</i> is <b>FALSE</b>, the return value minus <b>WAIT_OBJECT_0</b> indicates the <i>lpHandles</i> array index of the object that satisfied the wait. If more than one object became signaled during the call, this is the array index of the signaled object with the smallest index value of all the signaled objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_ABANDONED_0</b> to (<b>WAIT_ABANDONED_0</b> + <i>nCount</i>– 1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <i>bWaitAll</i> is <b>TRUE</b>, a return value within the specified range indicates that the state of all specified objects is signaled and at least one of the objects is an abandoned mutex object. 
     * 
     * 
     * 
     * 
     * If <i>bWaitAll</i> is <b>FALSE</b>, the return value minus [WAIT_ABANDONED_0](nf-synchapi-waitforsingleobject.md) indicates the <i>lpHandles</i> array index of an abandoned mutex object that satisfied the wait. Ownership of the mutex object is granted to the calling thread, and the mutex is set to nonsignaled.
     * 
     * If a mutex was protecting persistent state information, you should check it for consistency.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_TIMEOUT</b></dt>
     * <dt>0x00000102L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time-out interval elapsed and the conditions specified by the <i>bWaitAll</i> parameter are not satisfied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_FAILED</b></dt>
     * <dt>(<b>DWORD</b>)0xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function has failed. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-waitformultipleobjects
     * @since windows5.1.2600
     */
    static WaitForMultipleObjects(nCount, lpHandles, bWaitAll, dwMilliseconds) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WaitForMultipleObjects", "uint", nCount, "ptr", lpHandles, "int", bWaitAll, "uint", dwMilliseconds, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a named or unnamed semaphore object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSemaphoreAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> 
     *        structure. If this parameter is <b>NULL</b>, the handle cannot be inherited by child 
     *        processes.
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor 
     *        for the new semaphore. If this parameter is <b>NULL</b>, the semaphore gets a default security descriptor. The ACLs in the default security descriptor for a semaphore come from the primary or impersonation token of the creator.
     * @param {Integer} lInitialCount The initial count for the semaphore object. This value must be greater than or equal to zero and less than or equal to <i>lMaximumCount</i>. The state of a semaphore is signaled when its count is greater than zero and nonsignaled when it is zero. The count is decreased by one whenever a wait function releases a thread that was waiting for the semaphore. The count is increased by a specified amount by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-releasesemaphore">ReleaseSemaphore</a> function.
     * @param {Integer} lMaximumCount The maximum count for the semaphore object. This value must be greater than zero.
     * @param {PWSTR} lpName The name of the semaphore object. The name is limited to <b>MAX_PATH</b> characters. Name comparison is case sensitive.
     * 
     * If <i>lpName</i> matches the name of an existing named semaphore object, this function requests the <b>SEMAPHORE_ALL_ACCESS</b> access right. In this case, the <i>lInitialCount</i> and <i>lMaximumCount</i> parameters are ignored because they have already been set by the creating process. If the <i>lpSemaphoreAttributes</i> parameter is not <b>NULL</b>, it determines whether the handle can be inherited, but its security-descriptor member is ignored.
     * 
     * If <i>lpName</i> is <b>NULL</b>, the semaphore object is created without a name.
     * 
     * If <i>lpName</i> matches the name of an existing event, mutex, waitable timer, job, or file-mapping object, the function fails and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the semaphore object. If the named semaphore object existed before the function call, the function returns a handle to the existing object and 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-createsemaphorew
     * @since windows5.1.2600
     */
    static CreateSemaphoreW(lpSemaphoreAttributes, lInitialCount, lMaximumCount, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateSemaphoreW", "ptr", lpSemaphoreAttributes, "int", lInitialCount, "int", lMaximumCount, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Creates or opens a waitable timer object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpTimerAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new timer object and determines whether child processes can inherit the returned handle. 
     * 
     * If <i>lpTimerAttributes</i> is <b>NULL</b>, the timer object gets a default security descriptor and the handle cannot be inherited. The ACLs in the default security descriptor for a timer come from the primary or impersonation token of the creator.
     * @param {BOOL} bManualReset If this parameter is <b>TRUE</b>, the timer is a manual-reset notification timer. Otherwise, the timer is a synchronization timer.
     * @param {PWSTR} lpTimerName The name of the timer object. The name is limited to <b>MAX_PATH</b> characters. Name comparison is case sensitive. 
     * 
     * 
     * 
     * 
     * If <i>lpTimerName</i> is <b>NULL</b>, the timer object is created without a name.
     * 
     * If <i>lpTimerName</i> matches the name of an existing event, semaphore, mutex, job, or file-mapping object, the function fails and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the timer object. If the named timer object exists before the function call, the function returns a handle to the existing object and 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-createwaitabletimerw
     * @since windows5.1.2600
     */
    static CreateWaitableTimerW(lpTimerAttributes, bManualReset, lpTimerName) {
        lpTimerName := lpTimerName is String ? StrPtr(lpTimerName) : lpTimerName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateWaitableTimerW", "ptr", lpTimerAttributes, "int", bManualReset, "ptr", lpTimerName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Initializes the head of a singly linked list.
     * @remarks
     * 
     * All list items must be aligned on a  <b>MEMORY_ALLOCATION_ALIGNMENT</b> boundary. Unaligned items can cause unpredictable results. See <b>_aligned_malloc</b>.
     * 
     * To add items to the list, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-interlockedpushentryslist">InterlockedPushEntrySList</a> function. To remove items from the list, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-interlockedpopentryslist">InterlockedPopEntrySList</a> function.
     * 
     * 
     * 
     * @param {Pointer<SLIST_HEADER>} ListHead A pointer to an <b>SLIST_HEADER</b> structure that represents the head of a singly linked list. This structure is for system use only.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//interlockedapi/nf-interlockedapi-initializeslisthead
     * @since windows5.1.2600
     */
    static InitializeSListHead(ListHead) {
        DllCall("KERNEL32.dll\InitializeSListHead", "ptr", ListHead)
    }

    /**
     * Removes an item from the front of a singly linked list. Access to the list is synchronized on a multiprocessor system.
     * @param {Pointer<SLIST_HEADER>} ListHead Pointer to an <b>SLIST_HEADER</b> structure that represents the head of a singly linked list.
     * @returns {Pointer<SLIST_ENTRY>} The return value is a pointer to the item removed from the list. If the list is empty, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//interlockedapi/nf-interlockedapi-interlockedpopentryslist
     * @since windows5.1.2600
     */
    static InterlockedPopEntrySList(ListHead) {
        result := DllCall("KERNEL32.dll\InterlockedPopEntrySList", "ptr", ListHead, "ptr")
        return result
    }

    /**
     * Inserts an item at the front of a singly linked list. Access to the list is synchronized on a multiprocessor system.
     * @param {Pointer<SLIST_HEADER>} ListHead Pointer to an <b>SLIST_HEADER</b> structure that represents the head of a singly linked list.
     * @param {Pointer<SLIST_ENTRY>} ListEntry Pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-slist_entry">SLIST_ENTRY</a> structure that represents an item in a singly linked list.
     * @returns {Pointer<SLIST_ENTRY>} The return value is the previous first item in the list. If the list was previously empty, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//interlockedapi/nf-interlockedapi-interlockedpushentryslist
     * @since windows5.1.2600
     */
    static InterlockedPushEntrySList(ListHead, ListEntry) {
        result := DllCall("KERNEL32.dll\InterlockedPushEntrySList", "ptr", ListHead, "ptr", ListEntry, "ptr")
        return result
    }

    /**
     * Inserts a singly-linked list at the front of another singly linked list. Access to the lists is synchronized on a multiprocessor system. This version of the method does not use the __fastcall calling convention.
     * @param {Pointer<SLIST_HEADER>} ListHead Pointer to an <b>SLIST_HEADER</b> structure that represents the head of a singly linked list. The list specified by the <i>List</i> and <i>ListEnd</i> parameters is inserted at the front of this list.
     * @param {Pointer<SLIST_ENTRY>} List Pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-slist_entry">SLIST_ENTRY</a> structure that represents the first item in the  list to be inserted.
     * @param {Pointer<SLIST_ENTRY>} ListEnd Pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-slist_entry">SLIST_ENTRY</a> structure that represents the last item in the  list to be inserted.
     * @param {Integer} Count The number of items in the list to be inserted.
     * @returns {Pointer<SLIST_ENTRY>} The return value is the previous first item in the list specified by the <i>ListHead</i> parameter. If the list was previously empty, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//interlockedapi/nf-interlockedapi-interlockedpushlistslistex
     * @since windows8.0
     */
    static InterlockedPushListSListEx(ListHead, List, ListEnd, Count) {
        result := DllCall("KERNEL32.dll\InterlockedPushListSListEx", "ptr", ListHead, "ptr", List, "ptr", ListEnd, "uint", Count, "ptr")
        return result
    }

    /**
     * Removes all items from a singly linked list. Access to the list is synchronized on a multiprocessor system.
     * @param {Pointer<SLIST_HEADER>} ListHead Pointer to an <b>SLIST_HEADER</b> structure that represents the head of the singly linked list. This structure is for system use only.
     * @returns {Pointer<SLIST_ENTRY>} The return value is a pointer to the items removed from the list. If the list is empty, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//interlockedapi/nf-interlockedapi-interlockedflushslist
     * @since windows5.1.2600
     */
    static InterlockedFlushSList(ListHead) {
        result := DllCall("KERNEL32.dll\InterlockedFlushSList", "ptr", ListHead, "ptr")
        return result
    }

    /**
     * Retrieves the number of entries in the specified singly linked list.
     * @param {Pointer<SLIST_HEADER>} ListHead A pointer to an <b>SLIST_HEADER</b> structure that represents the head of a singly linked list. This structure is for system use only. 
     * 
     * The list must  be previously initialized with the <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-initializeslisthead">InitializeSListHead</a> function.
     * @returns {Integer} The function returns the number of entries in the list, up to a maximum value of 65535.
     * @see https://docs.microsoft.com/windows/win32/api//interlockedapi/nf-interlockedapi-querydepthslist
     * @since windows5.1.2600
     */
    static QueryDepthSList(ListHead) {
        result := DllCall("KERNEL32.dll\QueryDepthSList", "ptr", ListHead, "ushort")
        return result
    }

    /**
     * Adds a user-mode asynchronous procedure call (APC) object to the APC queue of the specified thread.
     * @param {Pointer<PAPCFUNC>} pfnAPC A pointer to the application-supplied APC function to be called when the specified thread performs an alertable wait operation. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nc-winnt-papcfunc">APCProc</a>.
     * @param {HANDLE} hThread A handle to the thread. The handle must have the <b>THREAD_SET_CONTEXT</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {Pointer} dwData A single value that is passed to the APC function pointed to by the <i>pfnAPC</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. <b>Windows Server 2003 and Windows XP:  </b>There are no error values defined for this function that can be retrieved by calling 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-queueuserapc
     * @since windows5.1.2600
     */
    static QueueUserAPC(pfnAPC, hThread, dwData) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueueUserAPC", "ptr", pfnAPC, "ptr", hThread, "ptr", dwData, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<PAPCFUNC>} ApcRoutine 
     * @param {HANDLE} Thread 
     * @param {Pointer} Data 
     * @param {Integer} Flags 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-queueuserapc2
     */
    static QueueUserAPC2(ApcRoutine, Thread, Data, Flags) {
        Thread := Thread is Win32Handle ? NumGet(Thread, "ptr") : Thread

        result := DllCall("KERNEL32.dll\QueueUserAPC2", "ptr", ApcRoutine, "ptr", Thread, "ptr", Data, "int", Flags, "int")
        return result
    }

    /**
     * Retrieves timing information for the specified process.
     * @param {HANDLE} hProcess A handle to the process whose timing information is sought. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right.
     * @param {Pointer<FILETIME>} lpCreationTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the creation time of the process.
     * @param {Pointer<FILETIME>} lpExitTime A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the exit time of the process. If the process has not exited, the content of this structure is undefined.
     * @param {Pointer<FILETIME>} lpKernelTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the amount of time that the process has executed in kernel mode. The time that each of the threads of the process has executed in kernel mode is determined, and then all of those times are summed together to obtain this value.
     * @param {Pointer<FILETIME>} lpUserTime A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the amount of time that the process has executed in user mode. The time that each of the threads of the process has executed in user mode is determined, and then all of those times are summed together to obtain this value. Note that this value can exceed the amount of real time elapsed (between <i>lpCreationTime</i> and <i>lpExitTime</i>) if the process executes across multiple CPU cores.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocesstimes
     * @since windows5.1.2600
     */
    static GetProcessTimes(hProcess, lpCreationTime, lpExitTime, lpKernelTime, lpUserTime) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessTimes", "ptr", hProcess, "ptr", lpCreationTime, "ptr", lpExitTime, "ptr", lpKernelTime, "ptr", lpUserTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a pseudo handle for the current process.
     * @returns {HANDLE} The return value is a pseudo handle to the current process.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentprocess
     * @since windows5.1.2600
     */
    static GetCurrentProcess() {
        result := DllCall("KERNEL32.dll\GetCurrentProcess", "ptr")
        return HANDLE({Value: result}, False)
    }

    /**
     * Retrieves the process identifier of the calling process.
     * @returns {Integer} The return value is the process identifier of the calling process.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentprocessid
     * @since windows5.1.2600
     */
    static GetCurrentProcessId() {
        result := DllCall("KERNEL32.dll\GetCurrentProcessId", "uint")
        return result
    }

    /**
     * Ends the calling process and all its threads.
     * @remarks
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess">GetExitCodeProcess</a> function to retrieve the process's exit value. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodethread">GetExitCodeThread</a> function to retrieve a thread's exit value.
     * 
     * Exiting a process causes the following:
     * 
     * <ol>
     * <li>All of the threads in the process, except the calling thread, terminate their execution without receiving a DLL_THREAD_DETACH notification.</li>
     * <li>The states of all of the threads terminated in step 1 become signaled.</li>
     * <li>The entry-point functions of all loaded dynamic-link libraries (DLLs) are called with DLL_PROCESS_DETACH. </li>
     * <li>After all attached DLLs have executed any process termination code, the <b>ExitProcess</b> function terminates the current process, including the calling thread.</li>
     * <li>The state of the calling thread becomes signaled.</li>
     * <li>All of the object handles opened by the process are closed.</li>
     * <li>The termination status of the process changes from STILL_ACTIVE to the exit value of the process.</li>
     * <li>The state of the process object becomes signaled, satisfying any threads that had been waiting for the process to terminate.</li>
     * </ol>
     * If one of the terminated threads in the process holds a lock and the DLL detach code in one of the loaded DLLs attempts to acquire the same lock, then calling <b>ExitProcess</b> results in a deadlock. In contrast, if a process terminates by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-terminateprocess">TerminateProcess</a>, the DLLs that the process is attached to are not notified of the process termination. Therefore, if you do not know the state of all threads in your process, it is better to call <b>TerminateProcess</b> than  <b>ExitProcess</b>. Note that returning from the <b>main</b> function of an application results in a call to <b>ExitProcess</b>.
     * 
     * Calling 
     * <b>ExitProcess</b> in a DLL can lead to unexpected application or system errors. Be sure to call 
     * <b>ExitProcess</b> from a DLL only if you know which applications or system components will load the DLL and that it is safe to call 
     * <b>ExitProcess</b> in this context. 
     * 
     * Exiting a process does not cause child processes to be terminated.
     * 
     * Exiting a process does not necessarily remove the process object from the operating system. A process object is deleted when the last handle to the process is closed.
     * 
     * 
     * 
     * @param {Integer} uExitCode The exit code for the process and all threads.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-exitprocess
     * @since windows5.1.2600
     */
    static ExitProcess(uExitCode) {
        DllCall("KERNEL32.dll\ExitProcess", "uint", uExitCode)
    }

    /**
     * Terminates the specified process and all of its threads.
     * @param {HANDLE} hProcess A handle to the process to be terminated.
     * 
     * The handle must have the <b>PROCESS_TERMINATE</b> access right. For more information, see
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Integer} uExitCode The exit code to be used by the process and threads terminated as a result of this call. Use the
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess">GetExitCodeProcess</a> function to retrieve a process's exit value. Use the
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodethread">GetExitCodeThread</a> function to retrieve a thread's exit value.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-terminateprocess
     * @since windows5.1.2600
     */
    static TerminateProcess(hProcess, uExitCode) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\TerminateProcess", "ptr", hProcess, "uint", uExitCode, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the termination status of the specified process.
     * @param {HANDLE} hProcess A handle to the process.
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right.
     * @param {Pointer<Integer>} lpExitCode A pointer to a variable to receive the process termination status. For more information, see Remarks.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getexitcodeprocess
     * @since windows5.1.2600
     */
    static GetExitCodeProcess(hProcess, lpExitCode) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        lpExitCodeMarshal := lpExitCode is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetExitCodeProcess", "ptr", hProcess, lpExitCodeMarshal, lpExitCode, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Causes the calling thread to yield execution to another thread that is ready to run on the current processor. The operating system selects the next thread to be executed.
     * @returns {BOOL} If calling the 
     * <b>SwitchToThread</b> function caused the operating system to switch execution to another thread, the return value is nonzero.
     * 
     * If there are no other threads ready to execute, the operating system does not switch execution to another thread, and the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-switchtothread
     * @since windows5.1.2600
     */
    static SwitchToThread() {
        result := DllCall("KERNEL32.dll\SwitchToThread", "int")
        return result
    }

    /**
     * Creates a thread to execute within the virtual address space of the calling process.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpThreadAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> 
     *        structure that determines whether the returned handle can be inherited by child processes. If 
     *        <i>lpThreadAttributes</i> is NULL, the handle cannot be inherited.
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new thread. If <i>lpThreadAttributes</i> is NULL, the thread gets a default security descriptor. The ACLs in the default security descriptor for a thread come from the primary token of the creator.
     * @param {Pointer} dwStackSize The initial size of the stack, in bytes. The system rounds this value to the nearest page. If this parameter is zero, the new thread uses the default size for the executable. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-stack-size">Thread Stack Size</a>.
     * @param {Pointer<LPTHREAD_START_ROUTINE>} lpStartAddress A pointer to the application-defined function to be executed by the thread. This pointer represents the starting address of the thread. For more information on the thread function, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms686736(v=vs.85)">ThreadProc</a>.
     * @param {Pointer<Void>} lpParameter A pointer to a variable to be passed to the thread.
     * @param {Integer} dwCreationFlags The flags that control the creation of the thread.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The thread runs immediately after creation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREATE_SUSPENDED"></a><a id="create_suspended"></a><dl>
     * <dt><b>CREATE_SUSPENDED</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The thread is created in a suspended state, and does not run until the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-resumethread">ResumeThread</a> function is called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STACK_SIZE_PARAM_IS_A_RESERVATION"></a><a id="stack_size_param_is_a_reservation"></a><dl>
     * <dt><b>STACK_SIZE_PARAM_IS_A_RESERVATION</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwStackSize</i> parameter specifies the initial reserve size of the stack. If this flag is not specified, <i>dwStackSize</i> specifies the commit size.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpThreadId A pointer to a variable that receives the  thread identifier. If this parameter is 
     *       <b>NULL</b>, the thread identifier is not returned.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the new thread.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Note that <b>CreateThread</b> may succeed even if 
     *        <i>lpStartAddress</i> points to data, code, or is not accessible. If the start address is 
     *        invalid when the thread runs, an exception occurs, and the thread terminates. Thread termination due to a 
     *        invalid start address is handled as an error exit for the thread's process. This behavior is similar to the 
     *        asynchronous nature of <a href="/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>, where the 
     *        process is created even if it refers to invalid or missing dynamic-link libraries (DLLs).
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-createthread
     * @since windows5.1.2600
     */
    static CreateThread(lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId) {
        lpParameterMarshal := lpParameter is VarRef ? "ptr" : "ptr"
        lpThreadIdMarshal := lpThreadId is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateThread", "ptr", lpThreadAttributes, "ptr", dwStackSize, "ptr", lpStartAddress, lpParameterMarshal, lpParameter, "uint", dwCreationFlags, lpThreadIdMarshal, lpThreadId, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Creates a thread that runs in the virtual address space of another process.
     * @param {HANDLE} hProcess A handle to the process in which the thread is to be created. The handle must have the <b>PROCESS_CREATE_THREAD</b>, <b>PROCESS_QUERY_INFORMATION</b>, <b>PROCESS_VM_OPERATION</b>, <b>PROCESS_VM_WRITE</b>, and <b>PROCESS_VM_READ</b> access rights, and may fail without these rights on certain platforms. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpThreadAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new thread and determines whether child processes can inherit the returned handle. If <i>lpThreadAttributes</i> is NULL, the thread gets a default security descriptor and the handle cannot be inherited. The access control lists (ACL) in the default security descriptor for a thread come from the primary token of the creator.
     * 
     * <b>Windows XP:  </b>The ACLs in the default security descriptor for a thread come from the primary or impersonation token of the creator. This behavior changed with Windows XP with SP2 and Windows Server 2003.
     * @param {Pointer} dwStackSize The initial size of the stack, in bytes. The system rounds this value to the nearest page. If this parameter is 0 (zero), the new thread uses the default size for the executable. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-stack-size">Thread Stack Size</a>.
     * @param {Pointer<LPTHREAD_START_ROUTINE>} lpStartAddress A pointer to the application-defined function of type <b>LPTHREAD_START_ROUTINE</b> to be executed by the thread and represents the starting address of the thread in the remote process. The function must exist in the remote process. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms686736(v=vs.85)">ThreadProc</a>.
     * @param {Pointer<Void>} lpParameter A pointer to a variable to be passed to the thread function.
     * @param {Integer} dwCreationFlags The flags that control the creation of the thread.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The thread runs immediately after creation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREATE_SUSPENDED"></a><a id="create_suspended"></a><dl>
     * <dt><b>CREATE_SUSPENDED</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The thread is created in a suspended state, and does not run until the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-resumethread">ResumeThread</a> function is called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STACK_SIZE_PARAM_IS_A_RESERVATION"></a><a id="stack_size_param_is_a_reservation"></a><dl>
     * <dt><b>STACK_SIZE_PARAM_IS_A_RESERVATION</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwStackSize</i> parameter specifies the initial reserve size of the stack. If this flag is not specified, <i>dwStackSize</i> specifies the commit size.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpThreadId A pointer to a variable that receives the thread identifier. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, the thread identifier is not returned.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the new thread.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Note that 
     * <b>CreateRemoteThread</b> may succeed even if <i>lpStartAddress</i> points to data, code, or is not accessible. If the start address is invalid when the thread runs, an exception occurs, and the thread terminates. Thread termination due to a invalid start address is handled as an error exit for the thread's process. This behavior is similar to the asynchronous nature of 
     * <a href="/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>, where the process is created even if it refers to invalid or missing dynamic-link libraries (DLL).
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-createremotethread
     * @since windows5.1.2600
     */
    static CreateRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        lpParameterMarshal := lpParameter is VarRef ? "ptr" : "ptr"
        lpThreadIdMarshal := lpThreadId is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateRemoteThread", "ptr", hProcess, "ptr", lpThreadAttributes, "ptr", dwStackSize, "ptr", lpStartAddress, lpParameterMarshal, lpParameter, "uint", dwCreationFlags, lpThreadIdMarshal, lpThreadId, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Retrieves a pseudo handle for the calling thread.
     * @returns {HANDLE} The return value is a pseudo handle for the current thread.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentthread
     * @since windows5.1.2600
     */
    static GetCurrentThread() {
        result := DllCall("KERNEL32.dll\GetCurrentThread", "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * Retrieves the thread identifier of the calling thread.
     * @returns {Integer} The return value is the thread identifier of the calling thread.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentthreadid
     * @since windows5.1.2600
     */
    static GetCurrentThreadId() {
        result := DllCall("KERNEL32.dll\GetCurrentThreadId", "uint")
        return result
    }

    /**
     * Opens an existing thread object.
     * @param {Integer} dwDesiredAccess The access to the thread object. This access right is checked against the security descriptor for the thread. This parameter can be one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">thread access rights</a>.
     * 
     * If the caller has enabled the SeDebugPrivilege privilege, the requested access is  granted regardless of the contents of the security descriptor.
     * @param {BOOL} bInheritHandle If this value is TRUE, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {Integer} dwThreadId The identifier of the thread to be opened.
     * @returns {HANDLE} If the function succeeds, the return value is an open handle to the specified thread.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-openthread
     * @since windows5.1.2600
     */
    static OpenThread(dwDesiredAccess, bInheritHandle, dwThreadId) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\OpenThread", "uint", dwDesiredAccess, "int", bInheritHandle, "uint", dwThreadId, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Sets the priority value for the specified thread. This value, together with the priority class of the thread's process, determines the thread's base priority level.
     * @param {HANDLE} hThread A handle to the thread whose priority value is to be set.
     * 
     * The handle must have the <b>THREAD_SET_INFORMATION</b> or <b>THREAD_SET_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.<b>Windows Server 2003:  </b>The handle must have the <b>THREAD_SET_INFORMATION</b> access right.
     * @param {Integer} nPriority 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * <b>Windows Phone 8.1:  </b>Windows Phone Store apps may call this function but it has no effect. The function will return a nonzero value indicating success.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setthreadpriority
     * @since windows5.1.2600
     */
    static SetThreadPriority(hThread, nPriority) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetThreadPriority", "ptr", hThread, "int", nPriority, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Disables or enables the ability of the system to temporarily boost the priority of a thread.
     * @param {HANDLE} hThread A handle to the thread whose priority is to be boosted. The handle must have the <b>THREAD_SET_INFORMATION</b> or <b>THREAD_SET_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>THREAD_SET_INFORMATION</b> access right.
     * @param {BOOL} bDisablePriorityBoost If this parameter is <b>TRUE</b>, dynamic boosting is disabled. If the parameter is <b>FALSE</b>, dynamic boosting is enabled.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setthreadpriorityboost
     * @since windows5.1.2600
     */
    static SetThreadPriorityBoost(hThread, bDisablePriorityBoost) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetThreadPriorityBoost", "ptr", hThread, "int", bDisablePriorityBoost, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the priority boost control state of the specified thread.
     * @param {HANDLE} hThread A handle to the thread. The handle must have the <b>THREAD_QUERY_INFORMATION</b> or <b>THREAD_QUERY_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>THREAD_QUERY_INFORMATION</b> access right.
     * @param {Pointer<BOOL>} pDisablePriorityBoost A pointer to a variable that receives the priority boost control state. A value of TRUE indicates that dynamic boosting is disabled. A value of FALSE indicates normal behavior.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. In that case, the variable pointed to by the <i>pDisablePriorityBoost</i> parameter receives the priority boost control state.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadpriorityboost
     * @since windows5.1.2600
     */
    static GetThreadPriorityBoost(hThread, pDisablePriorityBoost) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetThreadPriorityBoost", "ptr", hThread, "ptr", pDisablePriorityBoost, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the priority value for the specified thread. This value, together with the priority class of the thread's process, determines the thread's base-priority level.
     * @param {HANDLE} hThread A handle to the thread.
     * 
     * The handle must have the <b>THREAD_QUERY_INFORMATION</b> or <b>THREAD_QUERY_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003:  </b>The handle must have the <b>THREAD_QUERY_INFORMATION</b> access right.
     * @returns {Integer} If the function succeeds, the return value is the thread's priority level.
     * 
     * If the function fails, the return value is <b>THREAD_PRIORITY_ERROR_RETURN</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * <b>Windows Phone 8.1:  </b>This function will always return <b>THREAD_PRIORITY_NORMAL</b>.
     * 
     * The thread's priority level is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>THREAD_PRIORITY_ABOVE_NORMAL</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Priority 1 point above the priority class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>THREAD_PRIORITY_BELOW_NORMAL</b></dt>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Priority 1 point below the priority class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>THREAD_PRIORITY_HIGHEST</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Priority 2 points above the priority class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>THREAD_PRIORITY_IDLE</b></dt>
     * <dt>-15</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Base priority of 1 for <b>IDLE_PRIORITY_CLASS</b>, <b>BELOW_NORMAL_PRIORITY_CLASS</b>, <b>NORMAL_PRIORITY_CLASS</b>, <b>ABOVE_NORMAL_PRIORITY_CLASS</b>, or <b>HIGH_PRIORITY_CLASS</b> processes, and a base priority of 16 for <b>REALTIME_PRIORITY_CLASS</b> processes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>THREAD_PRIORITY_LOWEST</b></dt>
     * <dt>-2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Priority 2 points below the priority class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>THREAD_PRIORITY_NORMAL</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Normal priority for the priority class.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>THREAD_PRIORITY_TIME_CRITICAL</b></dt>
     * <dt>15</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Base-priority level of 15 for <b>IDLE_PRIORITY_CLASS</b>, <b>BELOW_NORMAL_PRIORITY_CLASS</b>, <b>NORMAL_PRIORITY_CLASS</b>, <b>ABOVE_NORMAL_PRIORITY_CLASS</b>, or <b>HIGH_PRIORITY_CLASS</b> processes, and a base-priority level of 31 for <b>REALTIME_PRIORITY_CLASS</b> processes.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the thread has the <b>REALTIME_PRIORITY_CLASS</b> base class, this function can also return one of the following values: -7, -6, -5, -4, -3, 3, 4, 5, or 6. For more information, see 
     * <a href="/windows/desktop/ProcThread/scheduling-priorities">Scheduling Priorities</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadpriority
     * @since windows5.1.2600
     */
    static GetThreadPriority(hThread) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetThreadPriority", "ptr", hThread, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Ends the calling thread.
     * @remarks
     * 
     * <b>ExitThread</b> is the preferred method of exiting a thread in C code. However, in C++ code, the thread is exited before any destructors can be called or any other automatic cleanup can be performed. Therefore, in C++ code, you should return from your thread function.
     * 
     * When this function is called (either explicitly or by returning from a thread procedure), the current thread's stack is deallocated, all pending I/O initiated by the thread is canceled, and the thread terminates. The entry-point function of all attached dynamic-link libraries (DLLs) is invoked with a value indicating that the thread is detaching from the DLL.
     * 
     * If the thread is the last thread in the process when this function is called, the thread's process is also terminated.
     * 
     * The state of the thread object becomes signaled, releasing any other threads that had been waiting for the thread to terminate. The thread's termination status changes from STILL_ACTIVE to the value of the <i>dwExitCode</i> parameter.
     * 
     * Terminating a thread does not necessarily remove the thread object from the operating system. A thread object is deleted when the last handle to the thread is closed.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitprocess">ExitProcess</a>, 
     * <b>ExitThread</b>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createthread">CreateThread</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createremotethread">CreateRemoteThread</a> functions, and a process that is starting (as the result of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> call) are serialized between each other within a process. Only one of these events can happen in an address space at a time. This means the following restrictions hold:
     * 
     * <ul>
     * <li>During process startup and DLL initialization routines, new threads can be created, but they do not begin execution until DLL initialization is done for the process.</li>
     * <li>Only one thread in a process can be in a DLL initialization or detach routine at a time.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitprocess">ExitProcess</a> does not return until no threads are in their DLL initialization or detach routines.</li>
     * </ul>
     * A thread in an executable that is linked to the static C run-time library (CRT) should use <b>_beginthread</b> and <b>_endthread</b> for thread management rather than 
     * <b>CreateThread</b> and 
     * <b>ExitThread</b>. Failure to do so results in small memory leaks when 
     * the thread calls <b>ExitThread</b>. Another work around is to link the executable to the CRT in a DLL instead of the static CRT. Note that this memory leak only occurs from a DLL if the DLL is linked to the static CRT and a thread calls the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-disablethreadlibrarycalls">DisableThreadLibraryCalls</a> function. Otherwise, it is safe to call <b>CreateThread</b> and 
     * <b>ExitThread</b> from a thread in a DLL that links to the static CRT.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodethread">GetExitCodeThread</a> function to retrieve a thread's exit code.
     * 
     * <b>Windows Phone 8.1:</b> This function is supported for Windows Phone Store apps on Windows Phone 8.1 and later.
     * 
     * <b>Windows 8.1</b> and <b>Windows Server 2012 R2</b>: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
     * 
     * 
     * 
     * @param {Integer} dwExitCode The exit code for the thread.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-exitthread
     * @since windows5.1.2600
     */
    static ExitThread(dwExitCode) {
        DllCall("KERNEL32.dll\ExitThread", "uint", dwExitCode)
    }

    /**
     * Terminates a thread.
     * @param {HANDLE} hThread A handle to the thread to be terminated.
     * 
     * The handle must have the <b>THREAD_TERMINATE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Integer} dwExitCode The exit code for the thread. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodethread">GetExitCodeThread</a> function to retrieve a thread's exit value.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-terminatethread
     * @since windows5.1.2600
     */
    static TerminateThread(hThread, dwExitCode) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\TerminateThread", "ptr", hThread, "uint", dwExitCode, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the termination status of the specified thread.
     * @param {HANDLE} hThread A handle to the thread.
     * 
     * The handle must have the <b>THREAD_QUERY_INFORMATION</b> or <b>THREAD_QUERY_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>THREAD_QUERY_INFORMATION</b> access right.
     * @param {Pointer<Integer>} lpExitCode A pointer to a variable to receive the thread termination status. For more information, see Remarks.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getexitcodethread
     * @since windows5.1.2600
     */
    static GetExitCodeThread(hThread, lpExitCode) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        lpExitCodeMarshal := lpExitCode is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetExitCodeThread", "ptr", hThread, lpExitCodeMarshal, lpExitCode, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Suspends the specified thread.
     * @param {HANDLE} hThread A handle to the thread that is to be suspended.
     * 
     * The handle must have the <b>THREAD_SUSPEND_RESUME</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @returns {Integer} If the function succeeds, the return value is the thread's previous suspend count; otherwise, it is <code>(DWORD) -1</code>. To get extended error information, use the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-suspendthread
     * @since windows5.1.2600
     */
    static SuspendThread(hThread) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SuspendThread", "ptr", hThread, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Decrements a thread's suspend count. When the suspend count is decremented to zero, the execution of the thread is resumed.
     * @param {HANDLE} hThread A handle to the thread to be restarted. 
     * 
     * 
     * 
     * 
     * This handle must have the THREAD_SUSPEND_RESUME access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @returns {Integer} If the function succeeds, the return value is the thread's previous suspend count.
     * 
     * If the function fails, the return value is (DWORD) -1. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-resumethread
     * @since windows5.1.2600
     */
    static ResumeThread(hThread) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ResumeThread", "ptr", hThread, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates a thread local storage (TLS) index. Any thread of the process can subsequently use this index to store and retrieve values that are local to the thread, because each thread receives its own slot for the index.
     * @returns {Integer} If the function succeeds, the return value is a TLS index. The slots for the index are initialized to zero.
     * 
     * If the function fails, the return value is <b>TLS_OUT_OF_INDEXES</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-tlsalloc
     * @since windows5.1.2600
     */
    static TlsAlloc() {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\TlsAlloc", "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the value in the calling thread's thread local storage (TLS) slot for the specified TLS index. Each thread of a process has its own slot for each TLS index.
     * @param {Integer} dwTlsIndex The TLS index that was allocated by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-tlsalloc">TlsAlloc</a> function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is the value stored in the calling thread's TLS slot associated with the specified index. If <i>dwTlsIndex</i> is a valid index allocated by a successful call to <a href="/windows/desktop/api/processthreadsapi/nf-processthreadsapi-tlsalloc">TlsAlloc</a>, this function always succeeds.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The data stored in a TLS slot can have a value of 0 because it still has its initial value or because the thread called the <a href="/windows/desktop/api/processthreadsapi/nf-processthreadsapi-tlssetvalue">TlsSetValue</a> function with 0. Therefore, if the return value is 0, you must check whether <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_SUCCESS</b> before determining that the function has failed. If <b>GetLastError</b> returns <b>ERROR_SUCCESS</b>, then the function has succeeded and the data stored in the TLS slot is 0. Otherwise, the function has failed.
     * 
     * Functions that return indications of failure call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a>when they fail. They generally do not call <b>SetLastError</b>when they succeed. The 
     * <b>TlsGetValue</b> function is an exception to this general rule. The 
     * <b>TlsGetValue</b> function calls <b>SetLastError</b>to clear a thread's last error when it succeeds. That allows checking for the error-free retrieval of zero values.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-tlsgetvalue
     * @since windows5.1.2600
     */
    static TlsGetValue(dwTlsIndex) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\TlsGetValue", "uint", dwTlsIndex, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Stores a value in the calling thread's thread local storage (TLS) slot for the specified TLS index. Each thread of a process has its own slot for each TLS index.
     * @param {Integer} dwTlsIndex The TLS index that was allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-tlsalloc">TlsAlloc</a> 
     *       function.
     * @param {Pointer<Void>} lpTlsValue The value to be stored in the calling thread's TLS slot for the index.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-tlssetvalue
     * @since windows5.1.2600
     */
    static TlsSetValue(dwTlsIndex, lpTlsValue) {
        lpTlsValueMarshal := lpTlsValue is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\TlsSetValue", "uint", dwTlsIndex, lpTlsValueMarshal, lpTlsValue, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Releases a thread local storage (TLS) index, making it available for reuse.
     * @param {Integer} dwTlsIndex The TLS index that was allocated by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-tlsalloc">TlsAlloc</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-tlsfree
     * @since windows5.1.2600
     */
    static TlsFree(dwTlsIndex) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\TlsFree", "uint", dwTlsIndex, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a new process and its primary thread. The new process runs in the security context of the calling process.
     * @param {PSTR} lpApplicationName The name of the module to be executed. This module can be a Windows-based application. It can be some other type of module (for example, MS-DOS or OS/2) if the appropriate subsystem is available on the local computer. 
     * 
     * 
     * 
     * 
     * The string can specify the full path and file name of the module to execute or it can specify a partial name. In the case of a partial name, the function uses the current drive and current directory to complete the specification. The function will not use the search path. This parameter must include the file name extension; no default extension is assumed.
     * 
     * The <i>lpApplicationName</i> parameter can be <b>NULL</b>. In that case, the module name must be the first white space–delimited token in the <i>lpCommandLine</i> string. If you are using a long file name that contains a space, use quoted strings to indicate where the file name ends and the arguments begin; otherwise, the file name is ambiguous. For example, consider the string "c:\program files\sub dir\program name". This string can be interpreted in a number of ways. The system tries to interpret the possibilities in the following order:
     * 
     * 1. **c:\program.exe**
     * 1. **c:\program files\sub.exe**
     * 1. **c:\program files\sub dir\program.exe**
     * 1. **c:\program files\sub dir\program name.exe**
     * 
     * If the executable module is a 16-bit application, <i>lpApplicationName</i> should be <b>NULL</b>, and the string pointed to by <i>lpCommandLine</i> should specify the executable module as well as its arguments.
     * 
     * To run a batch file, you must start the command interpreter; set <i>lpApplicationName</i> to cmd.exe and set <i>lpCommandLine</i> to the following arguments: /c plus the name of the batch file.
     * @param {PSTR} lpCommandLine The command line to be executed. 
     * 
     * 
     * The maximum length of this string is 32,767 characters, including the Unicode terminating null character. If <i>lpApplicationName</i> is <b>NULL</b>, the module name portion of <i>lpCommandLine</i> is limited to <b>MAX_PATH</b> characters.
     * 
     * The Unicode version of this function, <b>CreateProcessW</b>, can modify the contents of this string. Therefore, this parameter cannot be a pointer to read-only memory (such as a <b>const</b> variable or a literal string). If this parameter is a constant string, the function may cause an access violation.
     * 
     * The <i>lpCommandLine</i> parameter can be NULL. In that case, the function uses the string pointed to by <i>lpApplicationName</i> as the command line.
     * 
     * If both <i>lpApplicationName</i> and <i>lpCommandLine</i> are non-<b>NULL</b>,  the null-terminated string pointed to by <i>lpApplicationName</i> specifies the module to execute, and the null-terminated string pointed to by  <i>lpCommandLine</i> specifies the command line. The new process can use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processenv/nf-processenv-getcommandlinea">GetCommandLine</a> to retrieve the entire command line. Console processes written in C can use the <i>argc</i> and <i>argv</i> arguments to parse the command line. Because argv[0] is the module name, C programmers generally repeat the module name as the first token in the command line.
     * 
     * If <i>lpApplicationName</i> is NULL, the first white space–delimited token of the command line specifies the module name. If you are using a long file name that contains a space, use quoted strings to indicate where the file name ends and the arguments begin (see the explanation for the <i>lpApplicationName</i> parameter). If the file name does not contain an extension, .exe is appended. Therefore, if the file name extension is .com, this parameter must include the .com extension. If the file name ends in a period (.) with no extension, or if the file name contains a path, .exe is not appended. If the file name does not contain a directory path, the system searches for the executable file in the following sequence:
     * 
     * <ol>
     * <li>The directory from which the application loaded.</li>
     * <li>The current directory for the parent process.</li>
     * <li>The 32-bit Windows system directory. Use the <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsystemdirectorya">GetSystemDirectory</a> function to get the path of this directory.</li>
     * <li> The 16-bit Windows system directory. There is no function that obtains the path of this directory, but it is searched. The name of this directory is System.</li>
     * <li>The Windows directory. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getwindowsdirectorya">GetWindowsDirectory</a> function to get the path of this directory.</li>
     * <li>The directories that are listed in the PATH environment variable. Note that this function does not search the per-application path specified by the <b>App Paths</b> registry key. To include this per-application path in the search sequence, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/axe/shellexecute">ShellExecute</a> function.</li>
     * </ol>
     * The system adds a terminating null character to the command-line string to separate the file name from the arguments. This divides the original string into two strings for internal processing.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpProcessAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle to the new process object can be inherited by child processes. If <i>lpProcessAttributes</i> is <b>NULL</b>, the handle cannot be inherited. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new process. If <i>lpProcessAttributes</i> is NULL or <b>lpSecurityDescriptor</b> is <b>NULL</b>, the process gets a default security descriptor. The ACLs in the default security descriptor for a process come from the primary token of the creator.<b>Windows XP:  </b>The ACLs in the default security descriptor for a process come from the primary or impersonation token of the creator. This behavior changed with Windows XP with SP2 and Windows Server 2003.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpThreadAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle to the new thread object can be inherited by child processes. If <i>lpThreadAttributes</i> is NULL, the handle cannot be inherited. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the main thread. If <i>lpThreadAttributes</i> is NULL or <b>lpSecurityDescriptor</b> is NULL, the thread gets a default security descriptor. The ACLs in the default security descriptor for a thread come from the process token.<b>Windows XP:  </b>The ACLs in the default security descriptor for a thread come from the primary or impersonation token of the creator. This behavior changed with Windows XP with SP2 and Windows Server 2003.
     * @param {BOOL} bInheritHandles If this parameter is TRUE, each inheritable handle in the calling process is inherited by the new process. If the parameter is FALSE, the handles are not inherited. Note that inherited handles have the same value and access rights as the original handles.
     * For additional discussion of inheritable handles, see Remarks.
     * 
     * <b>Terminal Services:  </b>You cannot inherit handles across sessions. Additionally, if this parameter is TRUE, you must create the process in the same session as the caller.
     * 
     * <b>Protected Process Light (PPL) processes:  </b>The generic handle inheritance is blocked when a PPL process creates a non-PPL process since PROCESS_DUP_HANDLE is not allowed from a non-PPL process to a PPL process. See <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>
     * @param {Integer} dwCreationFlags The flags that control the priority class and the creation of the process. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-creation-flags">Process Creation Flags</a>. 
     * 
     * This parameter also controls the new process's priority class, which is used to determine the scheduling priorities of the process's threads. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getpriorityclass">GetPriorityClass</a>. If none of the priority class flags is specified, the priority class defaults to <b>NORMAL_PRIORITY_CLASS</b> unless the priority class of the creating process is <b>IDLE_PRIORITY_CLASS</b> or <b>BELOW_NORMAL_PRIORITY_CLASS</b>. In this case, the child process receives the default priority class of the calling process.
     * 
     * If the dwCreationFlags parameter has a value of 0:
     * 
     * - The process inherits both the error mode of the caller and the parent's console. 
     * - The environment block for the new process is assumed to contain ANSI characters (see *lpEnvironment* parameter for additional information).
     * - A 16-bit Windows-based application runs in a shared Virtual DOS machine (VDM).
     * @param {Pointer<Void>} lpEnvironment A pointer to the environment block for the new process. If this parameter is <b>NULL</b>, the new process uses the environment of the calling process.
     * 
     * An environment block consists of a null-terminated block of null-terminated strings. Each string is in the following form:
     * 
     * <i>name</i>=<i>value</i>\0
     * 
     * Because the equal sign is used as a separator, it must not be used in the name of an environment variable.
     * 
     * An environment block can contain either Unicode or ANSI characters. If the environment block pointed to by <i>lpEnvironment</i> contains Unicode characters, be sure that <i>dwCreationFlags</i> includes <b>CREATE_UNICODE_ENVIRONMENT</b>. If this parameter is <b>NULL</b> and the environment block of the parent process contains Unicode characters, you must also ensure that <i>dwCreationFlags</i> includes <b>CREATE_UNICODE_ENVIRONMENT</b>.
     * 
     * The ANSI version of this function, <b>CreateProcessA</b> fails if the total size of the environment block for the process exceeds 32,767 characters.
     * 
     * Note that an ANSI environment block is terminated by two zero bytes: one for the last string, one more to terminate the block. A Unicode environment block is terminated by four zero bytes: two for the last string, two more to terminate the block.
     * @param {PSTR} lpCurrentDirectory The full path to the current directory for the process. The string can also specify a UNC path.
     * 
     * If this parameter is <b>NULL</b>, the new process will have the same current drive and directory as the calling process. (This feature is provided primarily for shells that need to start an application and specify its initial drive and working directory.)
     * @param {Pointer<STARTUPINFOA>} lpStartupInfo A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-startupinfoexa">STARTUPINFOEX</a> structure.
     * 
     * To set extended attributes, use a <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-startupinfoexa">STARTUPINFOEX</a> structure and specify EXTENDED_STARTUPINFO_PRESENT in the <i>dwCreationFlags</i> parameter.
     * 
     * Handles in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-startupinfoexa">STARTUPINFOEX</a> must be closed with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> when they are no longer needed.
     * 
     * <div class="alert"><b>Important</b>  The caller is responsible for ensuring that the standard handle fields in <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a>  contain valid handle values. These fields are copied unchanged to the child process without validation, even when the <b>dwFlags</b> member specifies <b>STARTF_USESTDHANDLES</b>. Incorrect values can cause the child process to misbehave or crash. Use the <a href="https://docs.microsoft.com/windows-hardware/drivers/devtest/application-verifier">Application Verifier</a> runtime verification tool to detect invalid handles. </div>
     * <div> </div>
     * @param {Pointer<PROCESS_INFORMATION>} lpProcessInformation A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> structure that receives identification information about the new process. 
     * 
     * 
     * 
     * 
     * Handles in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> must be closed with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> when they are no longer needed.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Note that the function returns before the process has finished initialization. If a required DLL cannot be located or fails to initialize, the process is terminated. To get the termination status of a process, call <a href="/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess">GetExitCodeProcess</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-createprocessa
     * @since windows5.1.2600
     */
    static CreateProcessA(lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation) {
        lpApplicationName := lpApplicationName is String ? StrPtr(lpApplicationName) : lpApplicationName
        lpCommandLine := lpCommandLine is String ? StrPtr(lpCommandLine) : lpCommandLine
        lpCurrentDirectory := lpCurrentDirectory is String ? StrPtr(lpCurrentDirectory) : lpCurrentDirectory

        lpEnvironmentMarshal := lpEnvironment is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateProcessA", "ptr", lpApplicationName, "ptr", lpCommandLine, "ptr", lpProcessAttributes, "ptr", lpThreadAttributes, "int", bInheritHandles, "uint", dwCreationFlags, lpEnvironmentMarshal, lpEnvironment, "ptr", lpCurrentDirectory, "ptr", lpStartupInfo, "ptr", lpProcessInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a new process and its primary thread. The new process runs in the security context of the calling process.
     * @param {PWSTR} lpApplicationName The name of the module to be executed. This module can be a Windows-based application. It can be some other type of module (for example, MS-DOS or OS/2) if the appropriate subsystem is available on the local computer. 
     * 
     * 
     * 
     * 
     * The string can specify the full path and file name of the module to execute or it can specify a partial name. In the case of a partial name, the function uses the current drive and current directory to complete the specification. The function will not use the search path. This parameter must include the file name extension; no default extension is assumed.
     * 
     * The <i>lpApplicationName</i> parameter can be <b>NULL</b>. In that case, the module name must be the first white space–delimited token in the <i>lpCommandLine</i> string. If you are using a long file name that contains a space, use quoted strings to indicate where the file name ends and the arguments begin; otherwise, the file name is ambiguous. For example, consider the string "c:\program files\sub dir\program name". This string can be interpreted in a number of ways. The system tries to interpret the possibilities in the following order:
     * 
     * 1. **c:\program.exe**
     * 1. **c:\program files\sub.exe**
     * 1. **c:\program files\sub dir\program.exe**
     * 1. **c:\program files\sub dir\program name.exe**
     * 
     * If the executable module is a 16-bit application, <i>lpApplicationName</i> should be <b>NULL</b>, and the string pointed to by <i>lpCommandLine</i> should specify the executable module as well as its arguments.
     * 
     * To run a batch file, you must start the command interpreter; set <i>lpApplicationName</i> to cmd.exe and set <i>lpCommandLine</i> to the following arguments: /c plus the name of the batch file.
     * @param {PWSTR} lpCommandLine The command line to be executed. 
     * 
     * 
     * The maximum length of this string is 32,767 characters, including the Unicode terminating null character. If <i>lpApplicationName</i> is <b>NULL</b>, the module name portion of <i>lpCommandLine</i> is limited to <b>MAX_PATH</b> characters.
     * 
     * The Unicode version of this function, <b>CreateProcessW</b>, can modify the contents of this string. Therefore, this parameter cannot be a pointer to read-only memory (such as a <b>const</b> variable or a literal string). If this parameter is a constant string, the function may cause an access violation.
     * 
     * The <i>lpCommandLine</i> parameter can be NULL. In that case, the function uses the string pointed to by <i>lpApplicationName</i> as the command line.
     * 
     * If both <i>lpApplicationName</i> and <i>lpCommandLine</i> are non-<b>NULL</b>,  the null-terminated string pointed to by <i>lpApplicationName</i> specifies the module to execute, and the null-terminated string pointed to by  <i>lpCommandLine</i> specifies the command line. The new process can use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processenv/nf-processenv-getcommandlinea">GetCommandLine</a> to retrieve the entire command line. Console processes written in C can use the <i>argc</i> and <i>argv</i> arguments to parse the command line. Because argv[0] is the module name, C programmers generally repeat the module name as the first token in the command line.
     * 
     * If <i>lpApplicationName</i> is NULL, the first white space–delimited token of the command line specifies the module name. If you are using a long file name that contains a space, use quoted strings to indicate where the file name ends and the arguments begin (see the explanation for the <i>lpApplicationName</i> parameter). If the file name does not contain an extension, .exe is appended. Therefore, if the file name extension is .com, this parameter must include the .com extension. If the file name ends in a period (.) with no extension, or if the file name contains a path, .exe is not appended. If the file name does not contain a directory path, the system searches for the executable file in the following sequence:
     * 
     * <ol>
     * <li>The directory from which the application loaded.</li>
     * <li>The current directory for the parent process.</li>
     * <li>The 32-bit Windows system directory. Use the <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsystemdirectorya">GetSystemDirectory</a> function to get the path of this directory.</li>
     * <li> The 16-bit Windows system directory. There is no function that obtains the path of this directory, but it is searched. The name of this directory is System.</li>
     * <li>The Windows directory. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getwindowsdirectorya">GetWindowsDirectory</a> function to get the path of this directory.</li>
     * <li>The directories that are listed in the PATH environment variable. Note that this function does not search the per-application path specified by the <b>App Paths</b> registry key. To include this per-application path in the search sequence, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/axe/shellexecute">ShellExecute</a> function.</li>
     * </ol>
     * The system adds a terminating null character to the command-line string to separate the file name from the arguments. This divides the original string into two strings for internal processing.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpProcessAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle to the new process object can be inherited by child processes. If <i>lpProcessAttributes</i> is <b>NULL</b>, the handle cannot be inherited. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new process. If <i>lpProcessAttributes</i> is NULL or <b>lpSecurityDescriptor</b> is <b>NULL</b>, the process gets a default security descriptor. The ACLs in the default security descriptor for a process come from the primary token of the creator.<b>Windows XP:  </b>The ACLs in the default security descriptor for a process come from the primary or impersonation token of the creator. This behavior changed with Windows XP with SP2 and Windows Server 2003.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpThreadAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle to the new thread object can be inherited by child processes. If <i>lpThreadAttributes</i> is NULL, the handle cannot be inherited. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the main thread. If <i>lpThreadAttributes</i> is NULL or <b>lpSecurityDescriptor</b> is NULL, the thread gets a default security descriptor. The ACLs in the default security descriptor for a thread come from the process token.<b>Windows XP:  </b>The ACLs in the default security descriptor for a thread come from the primary or impersonation token of the creator. This behavior changed with Windows XP with SP2 and Windows Server 2003.
     * @param {BOOL} bInheritHandles If this parameter is TRUE, each inheritable handle in the calling process is inherited by the new process. If the parameter is FALSE, the handles are not inherited. Note that inherited handles have the same value and access rights as the original handles.
     * For additional discussion of inheritable handles, see Remarks.
     * 
     * <b>Terminal Services:  </b>You cannot inherit handles across sessions. Additionally, if this parameter is TRUE, you must create the process in the same session as the caller.
     * 
     * <b>Protected Process Light (PPL) processes:  </b>The generic handle inheritance is blocked when a PPL process creates a non-PPL process since PROCESS_DUP_HANDLE is not allowed from a non-PPL process to a PPL process. See <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>
     * @param {Integer} dwCreationFlags The flags that control the priority class and the creation of the process. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-creation-flags">Process Creation Flags</a>. 
     * 
     * 
     * 
     * 
     * This parameter also controls the new process's priority class, which is used to determine the scheduling priorities of the process's threads. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getpriorityclass">GetPriorityClass</a>. If none of the priority class flags is specified, the priority class defaults to <b>NORMAL_PRIORITY_CLASS</b> unless the priority class of the creating process is <b>IDLE_PRIORITY_CLASS</b> or <b>BELOW_NORMAL_PRIORITY_CLASS</b>. In this case, the child process receives the default priority class of the calling process.
     * 
     * 
     * If the dwCreationFlags parameter has a value of 0:
     * 
     * - The process inherits both the error mode of the caller and the parent's console. 
     * - The environment block for the new process is assumed to contain ANSI characters (see *lpEnvironment* parameter for additional information).
     * - A 16-bit Windows-based application runs in a shared Virtual DOS machine (VDM).
     * @param {Pointer<Void>} lpEnvironment A pointer to the environment block for the new process. If this parameter is <b>NULL</b>, the new process uses the environment of the calling process.
     * 
     * An environment block consists of a null-terminated block of null-terminated strings. Each string is in the following form:
     * 
     * <i>name</i>=<i>value</i>\0
     * 
     * Because the equal sign is used as a separator, it must not be used in the name of an environment variable.
     * 
     * An environment block can contain either Unicode or ANSI characters. If the environment block pointed to by <i>lpEnvironment</i> contains Unicode characters, be sure that <i>dwCreationFlags</i> includes <b>CREATE_UNICODE_ENVIRONMENT</b>. If this parameter is <b>NULL</b> and the environment block of the parent process contains Unicode characters, you must also ensure that <i>dwCreationFlags</i> includes <b>CREATE_UNICODE_ENVIRONMENT</b>.
     * 
     * The ANSI version of this function, <b>CreateProcessA</b> fails if the total size of the environment block for the process exceeds 32,767 characters.
     * 
     * Note that an ANSI environment block is terminated by two zero bytes: one for the last string, one more to terminate the block. A Unicode environment block is terminated by four zero bytes: two for the last string, two more to terminate the block.
     * @param {PWSTR} lpCurrentDirectory The full path to the current directory for the process. The string can also specify a UNC path.
     * 
     * If this parameter is <b>NULL</b>, the new process will have the same current drive and directory as the calling process. (This feature is provided primarily for shells that need to start an application and specify its initial drive and working directory.)
     * @param {Pointer<STARTUPINFOW>} lpStartupInfo A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-startupinfoexa">STARTUPINFOEX</a> structure.
     * 
     * To set extended attributes, use a <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-startupinfoexa">STARTUPINFOEX</a> structure and specify EXTENDED_STARTUPINFO_PRESENT in the <i>dwCreationFlags</i> parameter.
     * 
     * Handles in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-startupinfoexa">STARTUPINFOEX</a> must be closed with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> when they are no longer needed.
     * 
     * <div class="alert"><b>Important</b>  The caller is responsible for ensuring that the standard handle fields in <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a>  contain valid handle values. These fields are copied unchanged to the child process without validation, even when the <b>dwFlags</b> member specifies <b>STARTF_USESTDHANDLES</b>. Incorrect values can cause the child process to misbehave or crash. Use the <a href="https://docs.microsoft.com/windows-hardware/drivers/devtest/application-verifier">Application Verifier</a> runtime verification tool to detect invalid handles. </div>
     * <div> </div>
     * @param {Pointer<PROCESS_INFORMATION>} lpProcessInformation A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> structure that receives identification information about the new process. 
     * 
     * 
     * 
     * 
     * Handles in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> must be closed with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> when they are no longer needed.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Note that the function returns before the process has finished initialization. If a required DLL cannot be located or fails to initialize, the process is terminated. To get the termination status of a process, call <a href="/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess">GetExitCodeProcess</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-createprocessw
     * @since windows5.1.2600
     */
    static CreateProcessW(lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation) {
        lpApplicationName := lpApplicationName is String ? StrPtr(lpApplicationName) : lpApplicationName
        lpCommandLine := lpCommandLine is String ? StrPtr(lpCommandLine) : lpCommandLine
        lpCurrentDirectory := lpCurrentDirectory is String ? StrPtr(lpCurrentDirectory) : lpCurrentDirectory

        lpEnvironmentMarshal := lpEnvironment is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateProcessW", "ptr", lpApplicationName, "ptr", lpCommandLine, "ptr", lpProcessAttributes, "ptr", lpThreadAttributes, "int", bInheritHandles, "uint", dwCreationFlags, lpEnvironmentMarshal, lpEnvironment, "ptr", lpCurrentDirectory, "ptr", lpStartupInfo, "ptr", lpProcessInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets shutdown parameters for the currently calling process. This function sets a shutdown order for a process relative to the other processes in the system.
     * @param {Integer} dwLevel The shutdown priority for a process relative to other processes in the system. The system shuts down processes from high <i>dwLevel</i> values to low. The highest and lowest shutdown priorities are reserved for system components. This parameter must be in the following range of values. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>000-0FF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * System reserved last shutdown range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>100-1FF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Application reserved last shutdown range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>200-2FF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Application reserved "in between" shutdown range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>300-3FF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Application reserved first shutdown range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>400-4FF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * System reserved first shutdown range.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * All processes start at shutdown level 0x280.
     * @param {Integer} dwFlags This parameter can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_NORETRY"></a><a id="shutdown_noretry"></a><dl>
     * <dt><b>SHUTDOWN_NORETRY</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system terminates the process without displaying a retry dialog box for the user.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function is succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setprocessshutdownparameters
     * @since windows5.1.2600
     */
    static SetProcessShutdownParameters(dwLevel, dwFlags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetProcessShutdownParameters", "uint", dwLevel, "uint", dwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the major and minor version numbers of the system on which the specified process expects to run.
     * @param {Integer} ProcessId The process identifier of the process of interest. A value of zero specifies the calling process.
     * @returns {Integer} If the function succeeds, the return value is the version of the system on which the process expects to run. The high word of the return value contains the major version number. The low word of the return value contains the minor version number.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The function fails if <i>ProcessId</i> is an invalid value.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocessversion
     * @since windows5.1.2600
     */
    static GetProcessVersion(ProcessId) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessVersion", "uint", ProcessId, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the contents of the STARTUPINFO structure that was specified when the calling process was created.
     * @param {Pointer<STARTUPINFOW>} lpStartupInfo A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure that receives the startup information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getstartupinfow
     * @since windows5.1.2600
     */
    static GetStartupInfoW(lpStartupInfo) {
        DllCall("KERNEL32.dll\GetStartupInfoW", "ptr", lpStartupInfo)
    }

    /**
     * Creates a new process and its primary thread. The new process runs in the security context of the user represented by the specified token.
     * @param {HANDLE} hToken A handle to the primary token that represents a user. The handle must have the <b>TOKEN_QUERY</b>, <b>TOKEN_DUPLICATE</b>, and <b>TOKEN_ASSIGN_PRIMARY</b> access rights. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a>. The user represented by the token must have read and execute access to the application specified by the <i>lpApplicationName</i> or the <i>lpCommandLine</i> parameter. 
     * 
     * 
     * 
     * 
     * To get a primary token that represents the specified user, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> function. Alternatively, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetokenex">DuplicateTokenEx</a> function to convert an impersonation token into a primary token. This allows a server application that is impersonating a client to create a process that has the security context of the client.
     * 
     * If <i>hToken</i> is a restricted version of the caller's primary token, the <b>SE_ASSIGNPRIMARYTOKEN_NAME</b> privilege is not required. If the necessary privileges are not already enabled, 
     * <b>CreateProcessAsUser</b> enables them for the duration of the call. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * <b>Terminal Services:  </b>The process is run in the session specified in the token. By default, this is the same session that called <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a>. To change the session, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-settokeninformation">SetTokenInformation</a> function.
     * @param {PWSTR} lpApplicationName The name of the module to be executed. This module can be a Windows-based application. It can be some other type of module (for example, MS-DOS or OS/2) if the appropriate subsystem is available on the local computer. 
     * 
     * 
     * 
     * 
     * The string can specify the full path and file name of the module to execute or it can specify a partial name. In the case of a partial name, the function uses the current drive and current directory to complete the specification. The function will not use the search path. This parameter must include the file name extension; no default extension is assumed.
     * 
     * The <i>lpApplicationName</i> parameter can be <b>NULL</b>. In that case, the module name must be the first white space–delimited token in the <i>lpCommandLine</i> string. If you are using a long file name that contains a space, use quoted strings to indicate where the file name ends and the arguments begin; otherwise, the file name is ambiguous. For example, consider the string "c:\program files\sub dir\program name". This string can be interpreted in a number of ways. The system tries to interpret the possibilities in the following order:
     * 
     * <b>c:\program.exe</b>
     * <b>c:\program files\sub.exe</b>
     * <b>c:\program files\sub dir\program.exe</b>
     * <b>c:\program files\sub dir\program name.exe</b>
     * If the executable module is a 16-bit application, <i>lpApplicationName</i> should be <b>NULL</b>, and the string pointed to by <i>lpCommandLine</i> should specify the executable module as well as its arguments. By default, all 16-bit Windows-based applications created by 
     * <b>CreateProcessAsUser</b> are run in a separate VDM (equivalent to <b>CREATE_SEPARATE_WOW_VDM</b> in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>).
     * @param {PWSTR} lpCommandLine The command line to be executed. The maximum length of this string is 32K characters. If <i>lpApplicationName</i> is <b>NULL</b>, the module name portion of <i>lpCommandLine</i> is limited to <b>MAX_PATH</b> characters.
     * 
     * The Unicode version of this function, <b>CreateProcessAsUserW</b>, can modify the contents of this string. Therefore, this parameter cannot be a pointer to read-only memory (such as a <b>const</b> variable or a literal string). If this parameter is a constant string, the function may cause an access violation.
     * 
     * The <i>lpCommandLine</i> parameter can be <b>NULL</b>. In that case, the function uses the string pointed to by <i>lpApplicationName</i> as the command line.
     * 
     * If both <i>lpApplicationName</i> and <i>lpCommandLine</i> are non-<b>NULL</b>, *<i>lpApplicationName</i> specifies the module to execute, and *<i>lpCommandLine</i> specifies the command line. The new process can use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processenv/nf-processenv-getcommandlinea">GetCommandLine</a> to retrieve the entire command line. Console processes written in C can use the <i>argc</i> and <i>argv</i> arguments to parse the command line. Because <i>argv</i>[0] is the module name, C programmers generally repeat the module name as the first token in the command line.
     * 
     * If <i>lpApplicationName</i> is <b>NULL</b>, the first white space–delimited token of the command line specifies the module name. If you are using a long file name that contains a space, use quoted strings to indicate where the file name ends and the arguments begin (see the explanation for the <i>lpApplicationName</i> parameter). If the file name does not contain an extension, .exe is appended. Therefore, if the file name extension is .com, this parameter must include the .com extension. If the file name ends in a period (.) with no extension, or if the file name contains a path, .exe is not appended. If the file name does not contain a directory path, the system searches for the executable file in the following sequence:
     * 
     * <ol>
     * <li>The directory from which the application loaded.</li>
     * <li>The current directory for the parent process.</li>
     * <li>The 32-bit Windows system directory. Use the <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsystemdirectorya">GetSystemDirectory</a> function to get the path of this directory. </li>
     * <li>The 16-bit Windows system directory. There is no function that obtains the path of this directory, but it is searched. </li>
     * <li>The Windows directory. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getwindowsdirectorya">GetWindowsDirectory</a> function to get the path of this directory.</li>
     * <li>The directories that are listed in the PATH environment variable. Note that this function does not search the per-application path specified by the <b>App Paths</b> registry key. To include this per-application path in the search sequence, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/axe/shellexecute">ShellExecute</a> function.</li>
     * </ol>
     * The system adds a null character to the command line string to separate the file name from the arguments. This divides the original string into two strings for internal processing.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpProcessAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new process object and determines whether child processes can inherit the returned handle to the process. If <i>lpProcessAttributes</i> is <b>NULL</b> or <b>lpSecurityDescriptor</b> is <b>NULL</b>, the process gets a default security descriptor and the handle cannot be inherited. The default security descriptor is that of the user referenced in the <i>hToken</i> parameter. This security descriptor may not allow access for the caller, in which case the process may not be opened again after it is run. The process handle is valid and will continue to have full access rights.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpThreadAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new thread object and determines whether child processes can inherit the returned handle to the thread. If <i>lpThreadAttributes</i> is <b>NULL</b> or <b>lpSecurityDescriptor</b> is <b>NULL</b>, the thread gets a default security descriptor and the handle cannot be inherited. The default security descriptor is that of the user referenced in the <i>hToken</i> parameter. This security descriptor may not allow access for the caller.
     * @param {BOOL} bInheritHandles If this parameter is <b>TRUE</b>, each inheritable handle in the calling process is inherited by the new process. If the parameter is <b>FALSE</b>, the handles are not inherited. Note that inherited handles have the same value and access rights as the original handles.
     * For additional discussion of inheritable handles, see Remarks.
     * 
     * <b>Terminal Services:  </b>You cannot inherit handles across sessions. Additionally, if this parameter is <b>TRUE</b>, you must create the process in the same session as the caller.
     * 
     * <b>Protected Process Light (PPL) processes:  </b>The generic handle inheritance is blocked when a PPL process creates a non-PPL process since PROCESS_DUP_HANDLE is not allowed from a non-PPL process to a PPL process. See <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>
     * @param {Integer} dwCreationFlags The flags that control the priority class and the creation of the process. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-creation-flags">Process Creation Flags</a>. 
     * 
     * 
     * 
     * 
     * This parameter also controls the new process's priority class, which is used to determine the scheduling priorities of the process's threads. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getpriorityclass">GetPriorityClass</a>. If none of the priority class flags is specified, the priority class defaults to <b>NORMAL_PRIORITY_CLASS</b> unless the priority class of the creating process is <b>IDLE_PRIORITY_CLASS</b> or <b>BELOW_NORMAL_PRIORITY_CLASS</b>. In this case, the child process receives the default priority class of the calling process.
     * 
     * 
     * If the dwCreationFlags parameter has a value of 0:
     * 
     * - The process inherits both the error mode of the caller and the parent's console. 
     * - The environment block for the new process is assumed to contain ANSI characters (see *lpEnvironment* parameter for additional information).
     * - A 16-bit Windows-based application runs in a shared Virtual DOS machine (VDM).
     * @param {Pointer<Void>} lpEnvironment A pointer to an environment block for the new process. If this parameter is <b>NULL</b>, the new process uses the environment of the calling process. 
     * 
     * 
     * 
     * 
     * An environment block consists of a null-terminated block of null-terminated strings. Each string is in the following form:
     * 
     * <i>name</i>=<i>value</i>\0
     * 
     * Because the equal sign is used as a separator, it must not be used in the name of an environment variable.
     * 
     * An environment block can contain either Unicode or ANSI characters. If the environment block pointed to by <i>lpEnvironment</i> contains Unicode characters, be sure that <i>dwCreationFlags</i> includes <b>CREATE_UNICODE_ENVIRONMENT</b>.  If this parameter is <b>NULL</b> and the environment block of the parent process contains Unicode characters, you must also ensure that <i>dwCreationFlags</i> includes <b>CREATE_UNICODE_ENVIRONMENT</b>.
     * 
     * The ANSI version of this function, <b>CreateProcessAsUserA</b> fails if the total size of the environment block for the process exceeds 32,767 characters.
     * 
     * Note that an ANSI environment block is terminated by two zero bytes: one for the last string, one more to terminate the block. A Unicode environment block is terminated by four zero bytes: two for the last string, two more to terminate the block.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>If the size of the combined user and system environment variable exceeds 8192 bytes, the process created by <b>CreateProcessAsUser</b> no longer runs with the environment block passed to the function by the parent process. Instead, the child process runs with the environment block returned by the <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-createenvironmentblock">CreateEnvironmentBlock</a> function.
     * 
     * 
     * 
     * To retrieve a copy of the environment block for a given user, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-createenvironmentblock">CreateEnvironmentBlock</a> function.
     * @param {PWSTR} lpCurrentDirectory The full path to the current directory for the process. The string can also specify a UNC path. 
     * 
     * If this parameter is NULL, the new process will have the same current drive and directory as the calling process. (This feature is provided primarily for shells that need to start an application and specify its initial drive and working directory.)
     * @param {Pointer<STARTUPINFOW>} lpStartupInfo A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-startupinfoexa">STARTUPINFOEX</a> structure.
     * 
     * The user must have full access to both the specified window station and desktop. If you want the process to be interactive, specify winsta0\default. If the <b>lpDesktop</b> member is NULL, the new process inherits the desktop and window station of its parent process. 
     * If this member is an empty string, "", the new process connects to a window station using the rules described in <a href="https://docs.microsoft.com/windows/desktop/winstation/process-connection-to-a-window-station">Process Connection to a Window Station</a>.
     * 
     * To set extended attributes, use a <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-startupinfoexa">STARTUPINFOEX</a> structure and specify <b>EXTENDED_STARTUPINFO_PRESENT</b> in the <i>dwCreationFlags</i> parameter.
     * 
     * Handles in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-startupinfoexa">STARTUPINFOEX</a> must be closed with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> when they are no longer needed.
     * 
     * <div class="alert"><b>Important</b>  The caller is responsible for ensuring that the standard handle fields in <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> contain valid handle values. These fields are copied unchanged to the child process without validation, even when the <b>dwFlags</b> member specifies <b>STARTF_USESTDHANDLES</b>. Incorrect values can cause the child process to misbehave or crash. Use the <a href="https://docs.microsoft.com/windows-hardware/drivers/devtest/application-verifier">Application Verifier</a> runtime verification tool to detect invalid handles. </div>
     * <div> </div>
     * @param {Pointer<PROCESS_INFORMATION>} lpProcessInformation A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> structure that receives identification information about the new process. 
     * 
     * 
     * 
     * 
     * Handles in 
     * <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> must be closed with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> when they are no longer needed.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Note that the function returns before the process has finished initialization. If a required DLL cannot be located or fails to initialize, the process is terminated. To get the termination status of a process, call <a href="/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess">GetExitCodeProcess</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-createprocessasuserw
     * @since windows5.1.2600
     */
    static CreateProcessAsUserW(hToken, lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken
        lpApplicationName := lpApplicationName is String ? StrPtr(lpApplicationName) : lpApplicationName
        lpCommandLine := lpCommandLine is String ? StrPtr(lpCommandLine) : lpCommandLine
        lpCurrentDirectory := lpCurrentDirectory is String ? StrPtr(lpCurrentDirectory) : lpCurrentDirectory

        lpEnvironmentMarshal := lpEnvironment is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CreateProcessAsUserW", "ptr", hToken, "ptr", lpApplicationName, "ptr", lpCommandLine, "ptr", lpProcessAttributes, "ptr", lpThreadAttributes, "int", bInheritHandles, "uint", dwCreationFlags, lpEnvironmentMarshal, lpEnvironment, "ptr", lpCurrentDirectory, "ptr", lpStartupInfo, "ptr", lpProcessInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Assigns an impersonation token to a thread. The function can also cause a thread to stop using an impersonation token.
     * @param {Pointer<HANDLE>} Thread A pointer to a handle to the thread to which the function assigns the impersonation token. 
     * 
     * 
     * 
     * 
     * If <i>Thread</i> is <b>NULL</b>, the function assigns the impersonation token to the calling thread.
     * @param {HANDLE} Token A handle to the impersonation token to assign to the thread. This handle must have been opened with TOKEN_IMPERSONATE access rights. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a>. 
     * 
     * 
     * 
     * 
     * If <i>Token</i> is <b>NULL</b>, the function causes the thread to stop using an impersonation token.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setthreadtoken
     * @since windows5.1.2600
     */
    static SetThreadToken(Thread, Token) {
        Token := Token is Win32Handle ? NumGet(Token, "ptr") : Token

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetThreadToken", "ptr", Thread, "ptr", Token, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens the access token associated with a process.
     * @param {HANDLE} ProcessHandle A handle to the process whose access token is opened. The process must have the PROCESS_QUERY_INFORMATION access permission.
     * @param {Integer} DesiredAccess Specifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> that specifies the requested types of access to the access token. These requested access types are compared with the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) of the token to determine which accesses are granted or denied. 
     * 
     * 
     * 
     * 
     * For a list of access rights for access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a>.
     * @param {Pointer<HANDLE>} TokenHandle A pointer to a handle that identifies the newly opened access token when the function returns.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-openprocesstoken
     * @since windows5.1.2600
     */
    static OpenProcessToken(ProcessHandle, DesiredAccess, TokenHandle) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenProcessToken", "ptr", ProcessHandle, "uint", DesiredAccess, "ptr", TokenHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens the access token associated with a thread.
     * @param {HANDLE} ThreadHandle A handle to the thread whose access token is opened.
     * @param {Integer} DesiredAccess Specifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> that specifies the requested types of access to the access token. These requested access types are reconciled against the token's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) to determine which accesses are granted or denied. 
     * 
     * 
     * 
     * 
     * For a list of access rights for access tokens, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a>.
     * @param {BOOL} OpenAsSelf TRUE if the access check is to be made against the  process-level <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>.
     * 
     * <b>FALSE</b> if the access check is to be made against the current security context of the thread calling the <b>OpenThreadToken</b> function.
     * 
     * The <i>OpenAsSelf</i> parameter allows the caller of this function to open the access token of a specified thread when the caller is impersonating a token at <b>SecurityIdentification</b> level. Without this parameter, the calling thread cannot open the access token on the specified thread because it is impossible to open executive-level objects by using the <b>SecurityIdentification</b> impersonation level.
     * @param {Pointer<HANDLE>} TokenHandle A pointer to a variable that receives the handle to the newly opened access token.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the token has the anonymous impersonation level, the token will not be opened and <b>OpenThreadToken</b> sets  ERROR_CANT_OPEN_ANONYMOUS as the error.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-openthreadtoken
     * @since windows5.1.2600
     */
    static OpenThreadToken(ThreadHandle, DesiredAccess, OpenAsSelf, TokenHandle) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenThreadToken", "ptr", ThreadHandle, "uint", DesiredAccess, "int", OpenAsSelf, "ptr", TokenHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the priority class for the specified process. This value together with the priority value of each thread of the process determines each thread's base priority level.
     * @param {HANDLE} hProcess A handle to the process. 
     * 
     * 
     * 
     * 
     * The handle must have the <b>PROCESS_SET_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Integer} dwPriorityClass 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setpriorityclass
     * @since windows5.1.2600
     */
    static SetPriorityClass(hProcess, dwPriorityClass) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetPriorityClass", "ptr", hProcess, "uint", dwPriorityClass, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the priority class for the specified process. This value, together with the priority value of each thread of the process, determines each thread's base priority level.
     * @param {HANDLE} hProcess A handle to the process. 
     * 
     * 
     * 
     * 
     * The handle must have the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right.
     * @returns {Integer} If the function succeeds, the return value is the priority class of the specified process.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The process's priority class is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ABOVE_NORMAL_PRIORITY_CLASS</b></dt>
     * <dt>0x00008000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Process that has priority above <b>NORMAL_PRIORITY_CLASS</b> but below <b>HIGH_PRIORITY_CLASS</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BELOW_NORMAL_PRIORITY_CLASS</b></dt>
     * <dt>0x00004000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Process that has priority above <b>IDLE_PRIORITY_CLASS</b> but below <b>NORMAL_PRIORITY_CLASS</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HIGH_PRIORITY_CLASS</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Process that performs time-critical tasks that must be executed immediately for it to run correctly. The threads of a high-priority class process preempt the threads of normal or idle priority class processes. An example is the Task List, which must respond quickly when called by the user, regardless of the load on the operating system. Use extreme care when using the high-priority class, because a high-priority class CPU-bound application can use nearly all available cycles.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDLE_PRIORITY_CLASS</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Process whose threads run only when the system is idle and are preempted by the threads of any process running in a higher priority class. An example is a screen saver. The idle priority class is inherited by child processes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NORMAL_PRIORITY_CLASS</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Process with no special scheduling needs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REALTIME_PRIORITY_CLASS</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Process that has the highest possible priority. The threads of a real-time priority class process preempt the threads of all other processes, including operating system processes performing important tasks. For example, a real-time process that executes for more than a very brief interval can cause disk caches not to flush or cause the mouse to be unresponsive.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getpriorityclass
     * @since windows5.1.2600
     */
    static GetPriorityClass(hProcess) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetPriorityClass", "ptr", hProcess, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the minimum size of the stack associated with the calling thread or fiber that will be available during any stack overflow exceptions.
     * @param {Pointer<Integer>} StackSizeInBytes The size of the stack, in bytes. On return, this value is set to the size of the previous stack, in bytes.
     * 
     * If this parameter is 0 (zero), the function succeeds and the parameter contains the size of the current stack.
     * 
     * If the specified size is less than the current size, the function succeeds but ignores this request. Therefore, you cannot use this function to reduce the size of the stack.
     * 
     * This value cannot be larger than the reserved stack size.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setthreadstackguarantee
     * @since windows6.0.6000
     */
    static SetThreadStackGuarantee(StackSizeInBytes) {
        StackSizeInBytesMarshal := StackSizeInBytes is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetThreadStackGuarantee", StackSizeInBytesMarshal, StackSizeInBytes, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the process identifier of the specified process.
     * @param {HANDLE} Process A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION or PROCESS_QUERY_LIMITED_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the PROCESS_QUERY_INFORMATION access right.
     * @returns {Integer} If the function succeeds, the return value is the process identifier.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocessid
     * @since windows6.0.6000
     */
    static GetProcessId(Process) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessId", "ptr", Process, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the thread identifier of the specified thread.
     * @param {HANDLE} Thread A handle to the thread. The handle must have the THREAD_QUERY_INFORMATION or THREAD_QUERY_LIMITED_INFORMATION access right. For more information about access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003:  </b>The handle must have the THREAD_QUERY_INFORMATION access right.
     * @returns {Integer} If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadid
     * @since windows6.0.6000
     */
    static GetThreadId(Thread) {
        Thread := Thread is Win32Handle ? NumGet(Thread, "ptr") : Thread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetThreadId", "ptr", Thread, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Flushes the write queue of each processor that is running a thread of the current process.
     * @remarks
     * 
     * The function generates an interprocessor interrupt (IPI) to all processors that are part of the current process affinity. It guarantees the visibility of write operations performed on one processor to the other processors.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-flushprocesswritebuffers
     * @since windows6.0.6000
     */
    static FlushProcessWriteBuffers() {
        DllCall("KERNEL32.dll\FlushProcessWriteBuffers")
    }

    /**
     * Retrieves the process identifier of the process associated with the specified thread.
     * @param {HANDLE} Thread A handle to the thread. The handle must have the THREAD_QUERY_INFORMATION or THREAD_QUERY_LIMITED_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003:  </b>The handle must have the THREAD_QUERY_INFORMATION access right.
     * @returns {Integer} If the function succeeds, the return value is the process identifier of the process associated with the specified thread.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocessidofthread
     * @since windows6.0.6000
     */
    static GetProcessIdOfThread(Thread) {
        Thread := Thread is Win32Handle ? NumGet(Thread, "ptr") : Thread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessIdOfThread", "ptr", Thread, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes the specified list of attributes for process and thread creation.
     * @param {Pointer} lpAttributeList The attribute list. This parameter can be NULL to determine the buffer size required to support the specified number of attributes.
     * @param {Integer} dwAttributeCount The count of attributes to be added to the list.
     * @param {Pointer<Pointer>} lpSize If <i>lpAttributeList</i> is not NULL, this parameter specifies the size in bytes of the <i>lpAttributeList</i> buffer on input. On output, this parameter receives the size in bytes of the initialized attribute list. 
     * 
     * If <i>lpAttributeList</i> is NULL, this parameter receives the required buffer size in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-initializeprocthreadattributelist
     * @since windows6.0.6000
     */
    static InitializeProcThreadAttributeList(lpAttributeList, dwAttributeCount, lpSize) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        lpSizeMarshal := lpSize is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\InitializeProcThreadAttributeList", "ptr", lpAttributeList, "uint", dwAttributeCount, "uint", dwFlags, lpSizeMarshal, lpSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes the specified list of attributes for process and thread creation.
     * @param {LPPROC_THREAD_ATTRIBUTE_LIST} lpAttributeList The attribute list. This list is created by the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-initializeprocthreadattributelist">InitializeProcThreadAttributeList</a> function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-deleteprocthreadattributelist
     * @since windows6.0.6000
     */
    static DeleteProcThreadAttributeList(lpAttributeList) {
        lpAttributeList := lpAttributeList is Win32Handle ? NumGet(lpAttributeList, "ptr") : lpAttributeList

        DllCall("KERNEL32.dll\DeleteProcThreadAttributeList", "ptr", lpAttributeList)
    }

    /**
     * Updates the specified attribute in a list of attributes for process and thread creation.
     * @param {LPPROC_THREAD_ATTRIBUTE_LIST} lpAttributeList A pointer to an attribute list created by the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-initializeprocthreadattributelist">InitializeProcThreadAttributeList</a> function.
     * @param {Integer} dwFlags This parameter is reserved and must be zero.
     * @param {Pointer} Attribute 
     * @param {Pointer} lpValue A pointer to the attribute value. This value should persist until the attribute is destroyed using the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-deleteprocthreadattributelist">DeleteProcThreadAttributeList</a> function.
     * @param {Pointer} cbSize The size of the attribute value specified by the <i>lpValue</i> parameter.
     * @param {Pointer} lpPreviousValue This parameter is reserved and must be NULL.
     * @param {Pointer<Pointer>} lpReturnSize This parameter is reserved and must be NULL.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-updateprocthreadattribute
     * @since windows6.0.6000
     */
    static UpdateProcThreadAttribute(lpAttributeList, dwFlags, Attribute, lpValue, cbSize, lpPreviousValue, lpReturnSize) {
        lpAttributeList := lpAttributeList is Win32Handle ? NumGet(lpAttributeList, "ptr") : lpAttributeList

        lpReturnSizeMarshal := lpReturnSize is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\UpdateProcThreadAttribute", "ptr", lpAttributeList, "uint", dwFlags, "ptr", Attribute, "ptr", lpValue, "ptr", cbSize, "ptr", lpPreviousValue, lpReturnSizeMarshal, lpReturnSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets dynamic exception handling continuation targets for the specified process.
     * @param {HANDLE} Process A handle to the process. This handle must have the <b>PROCESS_SET_INFORMATION</b> access right. 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Integer} NumberOfTargets Supplies the number of dynamic exception handling continuation targets to set.
     * @param {Pointer<PROCESS_DYNAMIC_EH_CONTINUATION_TARGET>} Targets A pointer to an array of dynamic exception handling continuation targets. For more information on this structure, see <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-process_dynamic_eh_continuation_target">PROCESS_DYNAMIC_EH_CONTINUATION_TARGET</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * Note that even if the function fails, a portion of the supplied continuation targets may have been successfully processed.
     * The caller needs to check the flags in each individual continuation target specified via <i>Targets</i> to determine if it was successfully processed.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setprocessdynamicehcontinuationtargets
     */
    static SetProcessDynamicEHContinuationTargets(Process, NumberOfTargets, Targets) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetProcessDynamicEHContinuationTargets", "ptr", Process, "ushort", NumberOfTargets, "ptr", Targets, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets dynamic enforced CETCOMPAT ranges for the specified process.
     * @param {HANDLE} Process A handle to the process. This handle must have the <b>PROCESS_SET_INFORMATION</b> access right. 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Integer} NumberOfRanges Supplies the number of dynamic enforced CETCOMPAT ranges to set.
     * @param {Pointer<PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE>} Ranges A pointer to an array of dynamic enforced CETCOMPAT ranges. For more information on this structure, see <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-process_dynamic_enforced_address_range">PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * Note that even if the function fails, a portion of the supplied CETCOMPAT ranges may have been successfully processed.
     * The caller needs to check the flags in each individual CETCOMPAT range specified via <i>Ranges</i> to determine if it was successfully processed.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setprocessdynamicenforcedcetcompatibleranges
     */
    static SetProcessDynamicEnforcedCetCompatibleRanges(Process, NumberOfRanges, Ranges) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        result := DllCall("KERNEL32.dll\SetProcessDynamicEnforcedCetCompatibleRanges", "ptr", Process, "ushort", NumberOfRanges, "ptr", Ranges, "int")
        return result
    }

    /**
     * Sets the affinity update mode of the specified process.
     * @param {HANDLE} hProcess A handle to the process. This handle must be returned by the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> function.
     * @param {Integer} dwFlags 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setprocessaffinityupdatemode
     * @since windows6.0.6000
     */
    static SetProcessAffinityUpdateMode(hProcess, dwFlags) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetProcessAffinityUpdateMode", "ptr", hProcess, "uint", dwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the affinity update mode of the specified process.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION or PROCESS_QUERY_LIMITED_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Integer>} lpdwFlags 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-queryprocessaffinityupdatemode
     * @since windows6.0.6000
     */
    static QueryProcessAffinityUpdateMode(hProcess, lpdwFlags) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueryProcessAffinityUpdateMode", "ptr", hProcess, lpdwFlagsMarshal, lpdwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a thread that runs in the virtual address space of another process and optionally specifies extended attributes such as processor group affinity.
     * @param {HANDLE} hProcess A handle to the process in which the thread is to be created. The handle must have the PROCESS_CREATE_THREAD, PROCESS_QUERY_INFORMATION, PROCESS_VM_OPERATION, PROCESS_VM_WRITE, and PROCESS_VM_READ access rights. In Windows 10, version 1607, your code must obtain these access rights for the new handle. However, starting in Windows 10, version 1703, if the new handle is entitled to these access rights, the system obtains them for you. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpThreadAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new thread and determines whether child processes can inherit the returned handle. If <i>lpThreadAttributes</i> is NULL, the thread gets a default security descriptor and the handle cannot be inherited. The access control lists (ACL) in the default security descriptor for a thread come from the primary token of the creator.
     * @param {Pointer} dwStackSize The initial size of the stack, in bytes. The system rounds this value to the nearest page. If this parameter is 0 (zero), the new thread uses the default size for the executable. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-stack-size">Thread Stack Size</a>.
     * @param {Pointer<LPTHREAD_START_ROUTINE>} lpStartAddress A pointer to the application-defined function of type <b>LPTHREAD_START_ROUTINE</b> to be executed by the thread and represents the starting address of the thread in the remote process. The function must exist in the remote process. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms686736(v=vs.85)">ThreadProc</a>.
     * @param {Pointer<Void>} lpParameter A pointer to a variable to be passed to the thread function pointed to by <i>lpStartAddress</i>. This parameter can be NULL.
     * @param {Integer} dwCreationFlags The flags that control the creation of the thread.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The thread runs immediately after creation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREATE_SUSPENDED"></a><a id="create_suspended"></a><dl>
     * <dt><b>CREATE_SUSPENDED</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The thread is created in a suspended state and does not run until the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-resumethread">ResumeThread</a> function is called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STACK_SIZE_PARAM_IS_A_RESERVATION"></a><a id="stack_size_param_is_a_reservation"></a><dl>
     * <dt><b>STACK_SIZE_PARAM_IS_A_RESERVATION</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwStackSize</i> parameter specifies the initial reserve size of the stack. If this flag is not specified, <i>dwStackSize</i> specifies the commit size.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {LPPROC_THREAD_ATTRIBUTE_LIST} lpAttributeList An attribute list that contains additional parameters for the new thread. This list is created by the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-initializeprocthreadattributelist">InitializeProcThreadAttributeList</a> function.
     * @param {Pointer<Integer>} lpThreadId A pointer to a variable that receives the thread identifier. 
     * 
     * 
     * 
     * 
     * If this parameter is NULL, the thread identifier is not returned.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the new thread.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-createremotethreadex
     * @since windows6.1
     */
    static CreateRemoteThreadEx(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpAttributeList, lpThreadId) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        lpAttributeList := lpAttributeList is Win32Handle ? NumGet(lpAttributeList, "ptr") : lpAttributeList

        lpParameterMarshal := lpParameter is VarRef ? "ptr" : "ptr"
        lpThreadIdMarshal := lpThreadId is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateRemoteThreadEx", "ptr", hProcess, "ptr", lpThreadAttributes, "ptr", dwStackSize, "ptr", lpStartAddress, lpParameterMarshal, lpParameter, "uint", dwCreationFlags, "ptr", lpAttributeList, lpThreadIdMarshal, lpThreadId, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Retrieves the boundaries of the stack that was allocated by the system for the current thread.
     * @remarks
     * 
     *     It is possible for user-mode code to execute in stack memory
     *          that is outside the region allocated by the system when the thread was created. Callers
     *          can use the <b>GetCurrentThreadStackLimits</b> function to verify that the current stack pointer is within the returned
     *          limits.
     * 
     * 
     * To compile an application that uses this function, set _WIN32_WINNT &gt;= 0x0602. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * 
     * @param {Pointer<Pointer>} LowLimit A pointer variable that receives the lower boundary of the current thread stack.
     * @param {Pointer<Pointer>} HighLimit A pointer variable that receives the upper boundary of the current thread stack.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentthreadstacklimits
     * @since windows8.0
     */
    static GetCurrentThreadStackLimits(LowLimit, HighLimit) {
        LowLimitMarshal := LowLimit is VarRef ? "ptr*" : "ptr"
        HighLimitMarshal := HighLimit is VarRef ? "ptr*" : "ptr"

        DllCall("KERNEL32.dll\GetCurrentThreadStackLimits", LowLimitMarshal, LowLimit, HighLimitMarshal, HighLimit)
    }

    /**
     * Retrieves mitigation policy settings for the calling process.
     * @param {HANDLE} hProcess A handle to the process. This handle must have the PROCESS_QUERY_INFORMATION access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Integer} MitigationPolicy 
     * @param {Pointer} lpBuffer If the <i>MitigationPolicy</i> parameter is <b>ProcessDEPPolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-process_mitigation_dep_policy">PROCESS_MITIGATION_DEP_POLICY</a> structure that receives the DEP policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessASLRPolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-process_mitigation_aslr_policy">PROCESS_MITIGATION_ASLR_POLICY</a> structure that receives the ASLR policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessDynamicCodePolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-process_mitigation_dynamic_code_policy">PROCESS_MITIGATION_DYNAMIC_CODE_POLICY</a> structure that receives the dynamic code policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessStrictHandleCheckPolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_strict_handle_check_policy">PROCESS_MITIGATION_STRICT_HANDLE_CHECK_POLICY</a> structure that specifies the handle check policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessSystemCallDisablePolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_system_call_disable_policy">PROCESS_MITIGATION_SYSTEM_CALL_DISABLE_POLICY</a> structure that specifies the system call disable policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessMitigationOptionsMask</b>, this parameter points to a <b>ULONG64</b> bit vector for the mask or a two-element array of <b>ULONG64</b> bit vectors.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessExtensionPointDisablePolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_extension_point_disable_policy">PROCESS_MITIGATION_EXTENSION_POINT_DISABLE_POLICY</a> structure that specifies the extension point disable policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessControlFlowGuardPolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_control_flow_guard_policy">PROCESS_MITIGATION_CONTROL_FLOW_GUARD_POLICY</a> structure that specifies the CFG policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessSignaturePolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_binary_signature_policy">PROCESS_MITIGATION_BINARY_SIGNATURE_POLICY</a> structure that receives the signature policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessFontDisablePolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-process_mitigation_font_disable_policy">PROCESS_MITIGATION_FONT_DISABLE_POLICY</a> structure that receives the policy flags for font loading.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessImageLoadPolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-process_mitigation_image_load_policy">PROCESS_MITIGATION_IMAGE_LOAD_POLICY</a> structure that receives the policy flags for image loading.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessUserShadowStackPolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_user_shadow_stack_policy">PROCESS_MITIGATION_USER_SHADOW_STACK_POLICY</a> structure that receives the policy flags for user-mode Hardware-enforced Stack Protection.
     * @param {Pointer} dwLength The size of <i>lpBuffer</i>, in bytes.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>. If the function fails, it returns <b>FALSE</b>. To retrieve error values defined for this function, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocessmitigationpolicy
     * @since windows8.0
     */
    static GetProcessMitigationPolicy(hProcess, MitigationPolicy, lpBuffer, dwLength) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessMitigationPolicy", "ptr", hProcess, "int", MitigationPolicy, "ptr", lpBuffer, "ptr", dwLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets a mitigation policy for the calling process. Mitigation policies enable a process to harden itself against various types of attacks.
     * @param {Integer} MitigationPolicy 
     * @param {Pointer} lpBuffer If the <i>MitigationPolicy</i> parameter is <b>ProcessDEPPolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-process_mitigation_dep_policy">PROCESS_MITIGATION_DEP_POLICY</a> structure that specifies the DEP policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessASLRPolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-process_mitigation_aslr_policy">PROCESS_MITIGATION_ASLR_POLICY</a> structure that specifies the ASLR policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessImageLoadPolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-process_mitigation_image_load_policy">PROCESS_MITIGATION_IMAGE_LOAD_POLICY</a> structure that receives the policy flags for image loading.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessStrictHandleCheckPolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_strict_handle_check_policy">PROCESS_MITIGATION_STRICT_HANDLE_CHECK_POLICY</a> structure that specifies the handle check policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessSystemCallDisablePolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_system_call_disable_policy">PROCESS_MITIGATION_SYSTEM_CALL_DISABLE_POLICY</a> structure that specifies the system call disable policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessMitigationOptionsMask</b>, this parameter points to a <b>ULONG64</b> bit vector for the mask, or to accommodate more than 64 bits, a two-element array of <b>ULONG64</b> bit vectors.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessExtensionPointDisablePolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_extension_point_disable_policy">PROCESS_MITIGATION_EXTENSION_POINT_DISABLE_POLICY</a> structure that specifies the extension point disable policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessControlFlowGuardPolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_control_flow_guard_policy">PROCESS_MITIGATION_CONTROL_FLOW_GUARD_POLICY</a> structure that specifies the CFG policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessSignaturePolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_binary_signature_policy">PROCESS_MITIGATION_BINARY_SIGNATURE_POLICY</a> structure that specifies the signature policy flags.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessFontDisablePolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-process_mitigation_font_disable_policy">PROCESS_MITIGATION_FONT_DISABLE_POLICY</a> structure that specifies the policy flags for font loading.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessImageLoadPolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-process_mitigation_image_load_policy">PROCESS_MITIGATION_IMAGE_LOAD_POLICY</a> structure that specifies the policy flags for image loading.
     * 
     * If the <i>MitigationPolicy</i> parameter is <b>ProcessUserShadowStackPolicy</b>, this parameter points to a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-process_mitigation_user_shadow_stack_policy">PROCESS_MITIGATION_USER_SHADOW_STACK_POLICY</a> structure that specifies the policy flags for user-mode Hardware-enforced Stack Protection.
     * @param {Pointer} dwLength The size of <i>lpBuffer</i>, in bytes.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>. If the function fails, it returns <b>FALSE</b>. To retrieve error values defined for this function, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setprocessmitigationpolicy
     * @since windows8.0
     */
    static SetProcessMitigationPolicy(MitigationPolicy, lpBuffer, dwLength) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetProcessMitigationPolicy", "int", MitigationPolicy, "ptr", lpBuffer, "ptr", dwLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves timing information for the specified thread.
     * @param {HANDLE} hThread A handle to the thread whose timing information is sought. The handle must have the <b>THREAD_QUERY_INFORMATION</b> or <b>THREAD_QUERY_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>THREAD_QUERY_INFORMATION</b> access right.
     * @param {Pointer<FILETIME>} lpCreationTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the creation time of the thread.
     * @param {Pointer<FILETIME>} lpExitTime A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the exit time of the thread. If the thread has not exited, the content of this structure is undefined.
     * @param {Pointer<FILETIME>} lpKernelTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the amount of time that the thread has executed in kernel mode.
     * @param {Pointer<FILETIME>} lpUserTime A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the amount of time that the thread has executed in user mode.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadtimes
     * @since windows5.1.2600
     */
    static GetThreadTimes(hThread, lpCreationTime, lpExitTime, lpKernelTime, lpUserTime) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetThreadTimes", "ptr", hThread, "ptr", lpCreationTime, "ptr", lpExitTime, "ptr", lpKernelTime, "ptr", lpUserTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens an existing local process object.
     * @param {Integer} dwDesiredAccess The access to the process object. This access right is checked against the  security descriptor for the process. This parameter can be one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">process access rights</a>. 
     * 
     * If the caller has enabled the SeDebugPrivilege privilege, the requested access is  granted regardless of the contents of the security descriptor.
     * @param {BOOL} bInheritHandle If this value is TRUE, processes created by this process will inherit the handle. Otherwise, the processes do not inherit this handle.
     * @param {Integer} dwProcessId The identifier of the local process to be opened. 
     * 
     * If the specified process is the System Idle Process (0x00000000), the function fails and the last error code is `ERROR_INVALID_PARAMETER`. If the specified process is the System process or one of the Client Server Run-Time Subsystem (CSRSS) processes, this function fails and the last error code is `ERROR_ACCESS_DENIED` because their access restrictions prevent user-level code from opening them.
     * 
     * If you are using <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocessid">GetCurrentProcessId</a> as an argument to this function, consider using <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a> instead of OpenProcess, for improved performance.
     * @returns {HANDLE} If the function succeeds, the return value is an open handle to the specified process.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-openprocess
     * @since windows5.1.2600
     */
    static OpenProcess(dwDesiredAccess, bInheritHandle, dwProcessId) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\OpenProcess", "uint", dwDesiredAccess, "int", bInheritHandle, "uint", dwProcessId, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Determines whether the specified processor feature is supported by the current computer.
     * @param {Integer} ProcessorFeature 
     * @returns {BOOL} If the feature is supported, the return value is a nonzero value.
     * 
     * If the feature is not supported, the return value is zero.
     * 
     * If the HAL does not support detection of the feature, whether or not the hardware supports the feature, the return value is also zero.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-isprocessorfeaturepresent
     * @since windows5.0
     */
    static IsProcessorFeaturePresent(ProcessorFeature) {
        result := DllCall("KERNEL32.dll\IsProcessorFeaturePresent", "uint", ProcessorFeature, "int")
        return result
    }

    /**
     * Retrieves the number of open handles that belong to the specified process.
     * @param {HANDLE} hProcess A handle to the process whose handle count is being requested.  The
     *         handle must have the PROCESS_QUERY_INFORMATION
     *         or PROCESS_QUERY_LIMITED_INFORMATION access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the PROCESS_QUERY_INFORMATION access right.
     * @param {Pointer<Integer>} pdwHandleCount A pointer to a variable that receives the number of open handles that belong to the specified process.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. 
     * 
     * If the function fails, the return value is zero. To get extended error  information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocesshandlecount
     * @since windows6.0.6000
     */
    static GetProcessHandleCount(hProcess, pdwHandleCount) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        pdwHandleCountMarshal := pdwHandleCount is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessHandleCount", "ptr", hProcess, pdwHandleCountMarshal, pdwHandleCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the number of the processor the current thread was running on during the call to this function.
     * @returns {Integer} The function returns the current processor number.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentprocessornumber
     * @since windows6.0.6000
     */
    static GetCurrentProcessorNumber() {
        result := DllCall("KERNEL32.dll\GetCurrentProcessorNumber", "uint")
        return result
    }

    /**
     * Sets the ideal processor for the specified thread and optionally retrieves the previous ideal processor.
     * @param {HANDLE} hThread A handle to the thread for which to set the ideal processor. This handle must have been created with the THREAD_SET_INFORMATION access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Pointer<PROCESSOR_NUMBER>} lpIdealProcessor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_number">PROCESSOR_NUMBER</a> structure that specifies the processor number of the desired ideal processor.
     * @param {Pointer<PROCESSOR_NUMBER>} lpPreviousIdealProcessor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_number">PROCESSOR_NUMBER</a> structure to receive the previous ideal processor. This parameter can point to the same memory location as the <i>lpIdealProcessor</i> parameter. This parameter can be NULL if the previous ideal processor is not required.
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, it returns zero. To get extended error information, use <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setthreadidealprocessorex
     * @since windows6.1
     */
    static SetThreadIdealProcessorEx(hThread, lpIdealProcessor, lpPreviousIdealProcessor) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetThreadIdealProcessorEx", "ptr", hThread, "ptr", lpIdealProcessor, "ptr", lpPreviousIdealProcessor, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the processor number of the ideal processor for the specified thread.
     * @param {HANDLE} hThread A handle to the thread for which to retrieve the ideal processor. This handle must have been created with the THREAD_QUERY_LIMITED_INFORMATION access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Pointer<PROCESSOR_NUMBER>} lpIdealProcessor Points to <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_number">PROCESSOR_NUMBER</a> structure to receive the number of the ideal processor.
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, it returns zero. To get extended error information, use <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadidealprocessorex
     * @since windows6.1
     */
    static GetThreadIdealProcessorEx(hThread, lpIdealProcessor) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetThreadIdealProcessorEx", "ptr", hThread, "ptr", lpIdealProcessor, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the processor group and number of the logical processor in which the calling thread is running.
     * @param {Pointer<PROCESSOR_NUMBER>} ProcNumber A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_number">PROCESSOR_NUMBER</a> structure that receives the processor group to which the logical processor is assigned and the number of the logical processor within its group.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getcurrentprocessornumberex
     * @since windows6.1
     */
    static GetCurrentProcessorNumberEx(ProcNumber) {
        DllCall("KERNEL32.dll\GetCurrentProcessorNumberEx", "ptr", ProcNumber)
    }

    /**
     * Retrieves the priority boost control state of the specified process.
     * @param {HANDLE} hProcess A handle to the process. This handle must have the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right.
     * @param {Pointer<BOOL>} pDisablePriorityBoost A pointer to a variable that receives the priority boost control state. A value of TRUE indicates that dynamic boosting is disabled. A value of FALSE indicates normal behavior.
     * @returns {BOOL} If the function succeeds, the return value is nonzero. In that case, the variable pointed to by the <i>pDisablePriorityBoost</i> parameter receives the priority boost control state.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocesspriorityboost
     * @since windows5.1.2600
     */
    static GetProcessPriorityBoost(hProcess, pDisablePriorityBoost) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessPriorityBoost", "ptr", hProcess, "ptr", pDisablePriorityBoost, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Disables or enables the ability of the system to temporarily boost the priority of the threads of the specified process.
     * @param {HANDLE} hProcess A handle to the process. This handle must have the PROCESS_SET_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {BOOL} bDisablePriorityBoost If this parameter is TRUE, dynamic boosting is disabled. If the parameter is FALSE, dynamic boosting is enabled.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setprocesspriorityboost
     * @since windows5.1.2600
     */
    static SetProcessPriorityBoost(hProcess, bDisablePriorityBoost) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetProcessPriorityBoost", "ptr", hProcess, "int", bDisablePriorityBoost, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether a specified thread has any I/O requests pending.
     * @param {HANDLE} hThread A handle to the thread in question. This handle must have been created with the THREAD_QUERY_INFORMATION access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Pointer<BOOL>} lpIOIsPending A pointer to a  variable which the function sets to TRUE if the specified thread has one or more I/O requests pending, or to FALSE otherwise.
     * @returns {BOOL} If the  function succeeds, the return value is nonzero. 
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadiopendingflag
     * @since windows6.0.6000
     */
    static GetThreadIOPendingFlag(hThread, lpIOIsPending) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetThreadIOPendingFlag", "ptr", hThread, "ptr", lpIOIsPending, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves system timing information. On a multiprocessor system, the values returned are the sum of the designated times across all processors.
     * @param {Pointer<FILETIME>} lpIdleTime A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the amount of time that the system has been idle.
     * @param {Pointer<FILETIME>} lpKernelTime A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the amount of time that the system has spent executing in Kernel mode (including all threads in all processes, on all processors). This time value also includes the amount of time the system has been idle.
     * @param {Pointer<FILETIME>} lpUserTime A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the amount of time that the system has spent executing in User mode (including all threads in all processes, on all processors).
     * @returns {BOOL} If the function succeeds, the return value is nonzero. 
     * 
     * If the function fails, the return value is zero. To get extended error  information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getsystemtimes
     * @since windows6.0.6000
     */
    static GetSystemTimes(lpIdleTime, lpKernelTime, lpUserTime) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetSystemTimes", "ptr", lpIdleTime, "ptr", lpKernelTime, "ptr", lpUserTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified thread.
     * @param {HANDLE} hThread A handle to the thread. The handle must have THREAD_QUERY_INFORMATION access rights. For more information, see  <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Integer} ThreadInformationClass The class of information to retrieve. The only supported values are <b>ThreadMemoryPriority</b> and <b>ThreadPowerThrottling</b>.
     * @param {Pointer} ThreadInformation Pointer to a structure to receive the type of information specified by the <i>ThreadInformationClass</i> parameter.
     * 
     * If the <i>ThreadInformationClass</i> parameter is <b>ThreadMemoryPriority</b>, this parameter must point to a <b>MEMORY_PRIORITY_INFORMATION</b> structure.
     * 
     * If the <i>ThreadInformationClass</i> parameter is <b>ThreadPowerThrottling</b>, this parameter must point to a <b>THREAD_POWER_THROTTLING_STATE</b> structure.
     * @param {Integer} ThreadInformationSize The size in bytes of the structure specified by the <i>ThreadInformation</i> parameter.
     * 
     * If the <i>ThreadInformationClass</i> parameter is <b>ThreadMemoryPriority</b>, this parameter must be <c>sizeof(MEMORY_PRIORITY_INFORMATION)</c>.  
     * 
     * If the <i>ThreadInformationClass</i> parameter is <b>ThreadPowerThrottling</b>, this parameter must be <c>sizeof(THREAD_POWER_THROTTLING_STATE)</c>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *       <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadinformation
     * @since windows8.0
     */
    static GetThreadInformation(hThread, ThreadInformationClass, ThreadInformation, ThreadInformationSize) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetThreadInformation", "ptr", hThread, "int", ThreadInformationClass, "ptr", ThreadInformation, "uint", ThreadInformationSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets information for the specified thread.
     * @param {HANDLE} hThread A handle to the thread. The handle must have THREAD_SET_INFORMATION access right. For more information, see  <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Integer} ThreadInformationClass The class of information to set. The only supported values are <b>ThreadMemoryPriority</b> and <b>ThreadPowerThrottling</b>.
     * @param {Pointer} ThreadInformation Pointer to a structure that contains the type of information specified by the <i>ThreadInformationClass</i> parameter.
     * 
     * If the <i>ThreadInformationClass</i> parameter is <b>ThreadMemoryPriority</b>, this parameter must point to a <b>MEMORY_PRIORITY_INFORMATION</b> structure.
     * 
     * If the <i>ThreadInformationClass</i> parameter is <b>ThreadPowerThrottling</b>, this parameter must point to a <b>THREAD_POWER_THROTTLING_STATE</b> structure.
     * @param {Integer} ThreadInformationSize The size in bytes of the structure specified by the <i>ThreadInformation</i> parameter.
     * 
     * If the <i>ThreadInformationClass</i> parameter is <b>ThreadMemoryPriority</b>, this parameter must be <c>sizeof(MEMORY_PRIORITY_INFORMATION)</c>.  
     * 
     * If the <i>ThreadInformationClass</i> parameter is <b>ThreadPowerThrottling</b>, this parameter must be <c>sizeof(THREAD_POWER_THROTTLING_STATE)</c>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *       <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setthreadinformation
     * @since windows8.0
     */
    static SetThreadInformation(hThread, ThreadInformationClass, ThreadInformation, ThreadInformationSize) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetThreadInformation", "ptr", hThread, "int", ThreadInformationClass, "ptr", ThreadInformation, "uint", ThreadInformationSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether the specified process is considered critical.
     * @param {HANDLE} hProcess A handle to the process to query. The process must have been          opened with <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access.
     * @param {Pointer<BOOL>} Critical A pointer to the <b>BOOL</b> value this function will use to indicate whether the process          is considered critical.
     * @returns {BOOL} This routine returns FALSE on failure. Any other value indicates success.      Call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to query for the specific error reason on failure.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-isprocesscritical
     * @since windows8.1
     */
    static IsProcessCritical(hProcess, Critical) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\IsProcessCritical", "ptr", hProcess, "ptr", Critical, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets a protected policy.
     * @param {Pointer<Guid>} PolicyGuid The globally-unique identifier of the policy to set.
     * @param {Pointer} PolicyValue The value to set the policy to.
     * @param {Pointer<Pointer>} OldPolicyValue Optionally receives the original value that was associated with the supplied policy.
     * @returns {BOOL} True if the function succeeds; otherwise, false. To retrieve error values for this function, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setprotectedpolicy
     * @since windows8.1
     */
    static SetProtectedPolicy(PolicyGuid, PolicyValue, OldPolicyValue) {
        OldPolicyValueMarshal := OldPolicyValue is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetProtectedPolicy", "ptr", PolicyGuid, "ptr", PolicyValue, OldPolicyValueMarshal, OldPolicyValue, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Queries the value associated with a protected policy.
     * @param {Pointer<Guid>} PolicyGuid The globally-unique identifier of the policy to query.
     * @param {Pointer<Pointer>} PolicyValue Receives the value that the supplied policy is set to.
     * @returns {BOOL} True if the function succeeds; otherwise, false.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-queryprotectedpolicy
     * @since windows8.1
     */
    static QueryProtectedPolicy(PolicyGuid, PolicyValue) {
        PolicyValueMarshal := PolicyValue is VarRef ? "ptr*" : "ptr"

        result := DllCall("KERNEL32.dll\QueryProtectedPolicy", "ptr", PolicyGuid, PolicyValueMarshal, PolicyValue, "int")
        return result
    }

    /**
     * Sets a preferred processor for a thread. The system schedules threads on their preferred processors whenever possible.
     * @param {HANDLE} hThread A handle to the thread whose preferred processor is to be set. The handle must have the THREAD_SET_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Integer} dwIdealProcessor The number of the preferred processor for the thread. This value is zero-based. If this parameter is MAXIMUM_PROCESSORS, the function returns the current ideal processor without changing it.
     * @returns {Integer} If the function succeeds, the return value is the previous preferred processor.
     * 
     * If the function fails, the return value is (DWORD) – 1. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setthreadidealprocessor
     * @since windows5.1.2600
     */
    static SetThreadIdealProcessor(hThread, dwIdealProcessor) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetThreadIdealProcessor", "ptr", hThread, "uint", dwIdealProcessor, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets information for the specified process.
     * @param {HANDLE} hProcess A handle to the process. This handle must have the <b>PROCESS_SET_INFORMATION</b> access 
     *       right. For more information, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Integer} ProcessInformationClass A member of the [PROCESS_INFORMATION_CLASS](./ne-processthreadsapi-process_information_class.md) enumeration specifying the kind of information to set.
     * @param {Pointer} ProcessInformation Pointer to an object that contains the type of information specified by the 
     *        <i>ProcessInformationClass</i> parameter.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessMemoryPriority</b>, this parameter must point to a 
     *        <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-memory_priority_information">MEMORY_PRIORITY_INFORMATION</a> structure.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessPowerThrottling</b>, this parameter must point to a 
     *        <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_power_throttling_state">PROCESS_POWER_THROTTLING_STATE</a> structure.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessLeapSecondInfo</b>, this parameter must point to a 
     *        <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_leap_second_info">PROCESS_LEAP_SECOND_INFO</a> structure.
     * @param {Integer} ProcessInformationSize The size in bytes of the structure specified by the <i>ProcessInformation</i> parameter.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessMemoryPriority</b>, this parameter must be 
     *        <c>sizeof(MEMORY_PRIORITY_INFORMATION)</c>.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessPowerThrottling</b>, this parameter must be 
     *        <c>sizeof(PROCESS_POWER_THROTTLING_STATE)</c>.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessLeapSecondInfo</b>, this parameter must be 
     *        <c>sizeof(PROCESS_LEAP_SECOND_INFO)</c>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setprocessinformation
     * @since windows8.0
     */
    static SetProcessInformation(hProcess, ProcessInformationClass, ProcessInformation, ProcessInformationSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetProcessInformation", "ptr", hProcess, "int", ProcessInformationClass, "ptr", ProcessInformation, "uint", ProcessInformationSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified process.
     * @param {HANDLE} hProcess A handle to the process. This handle must have the <b>PROCESS_SET_INFORMATION</b> access 
     *      right. For more information, see 
     *      <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Integer} ProcessInformationClass A member of the [PROCESS_INFORMATION_CLASS](./ne-processthreadsapi-process_information_class.md) enumeration specifying the kind of information to retrieve.
     * @param {Pointer} ProcessInformation Pointer to an object to receive the type of information specified by the 
     *        <i>ProcessInformationClass</i> parameter.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessMemoryPriority</b>, this parameter must point to a 
     *        <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-memory_priority_information">MEMORY_PRIORITY_INFORMATION</a> structure.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessPowerThrottling</b>, this parameter must point to a 
     *        <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_power_throttling_state">PROCESS_POWER_THROTTLING_STATE</a> structure.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessProtectionLevelInfo</b>, this parameter must point to a 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-process_protection_level_information">PROCESS_PROTECTION_LEVEL_INFORMATION</a> structure.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessLeapSecondInfo</b>, this parameter must point to a 
     *        <a href="../processthreadsapi/ns-processthreadsapi-process_leap_second_info.md">PROCESS_LEAP_SECOND_INFO</a> structure.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessAppMemoryInfo</b>, this parameter must point to a 
     *        <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-app_memory_information">APP_MEMORY_INFORMATION</a> structure.
     * @param {Integer} ProcessInformationSize The size in bytes of the structure specified by the <i>ProcessInformation</i> parameter.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *       <b>ProcessMemoryPriority</b>, this parameter must be 
     *       <c>sizeof(MEMORY_PRIORITY_INFORMATION)</c>.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessPowerThrottling</b>, this parameter must be 
     *        <c>sizeof(PROCESS_POWER_THROTTLING_STATE)</c>.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessProtectionLevelInfo</b>, this parameter must be 
     *        <c>sizeof(PROCESS_PROTECTION_LEVEL_INFORMATION)</c>.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessLeapSecondInfo</b>, this parameter must be 
     *        <c>sizeof(PROCESS_LEAP_SECOND_INFO)</c>.
     * 
     * If the <i>ProcessInformationClass</i> parameter is 
     *        <b>ProcessAppMemoryInfo</b>, this parameter must be 
     *        <c>sizeof(APP_MEMORY_INFORMATION)</c>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *       <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocessinformation
     * @since windows8.0
     */
    static GetProcessInformation(hProcess, ProcessInformationClass, ProcessInformation, ProcessInformationSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessInformation", "ptr", hProcess, "int", ProcessInformationClass, "ptr", ProcessInformation, "uint", ProcessInformationSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the list of CPU Sets in the process default set that was set by SetProcessDefaultCpuSets.
     * @param {HANDLE} Process Specifies a process handle for the process to query. This handle must have the PROCESS\_QUERY\_LIMITED\_INFORMATION access right. The value returned by [**GetCurrentProcess**](/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess) can also be specified here.
     * @param {Pointer<Integer>} CpuSetIds Specifies an optional buffer to retrieve the list of CPU Set identifiers.
     * @param {Integer} CpuSetIdCount Specifies the capacity of the buffer specified in **CpuSetIds**. If the buffer is NULL, this must be 0.
     * @param {Pointer<Integer>} RequiredIdCount Specifies the required capacity of the buffer to hold the entire list of process default CPU Sets. On successful return, this specifies the number of IDs filled into the buffer.
     * @returns {BOOL} This API returns TRUE on success. If the buffer is not large enough the API returns FALSE, and the **GetLastError** value is ERROR\_INSUFFICIENT\_BUFFER. This API cannot fail when passed valid parameters and the return buffer is large enough.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocessdefaultcpusets
     */
    static GetProcessDefaultCpuSets(Process, CpuSetIds, CpuSetIdCount, RequiredIdCount) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        CpuSetIdsMarshal := CpuSetIds is VarRef ? "uint*" : "ptr"
        RequiredIdCountMarshal := RequiredIdCount is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetProcessDefaultCpuSets", "ptr", Process, CpuSetIdsMarshal, CpuSetIds, "uint", CpuSetIdCount, RequiredIdCountMarshal, RequiredIdCount, "int")
        return result
    }

    /**
     * Sets the default CPU Sets assignment for threads in the specified process.
     * @param {HANDLE} Process Specifies the process for which to set the default CPU Sets. This handle must have the PROCESS\_SET\_LIMITED\_INFORMATION access right. The value returned by [**GetCurrentProcess**](nf-processthreadsapi-getcurrentprocess.md) can also be specified here.
     * @param {Pointer<Integer>} CpuSetIds Specifies the list of CPU Set IDs to set as the process default CPU set. If this is NULL, the **SetProcessDefaultCpuSets** clears out any assignment.
     * @param {Integer} CpuSetIdCount Specifies the number of IDs in the list passed in the **CpuSetIds** argument. If that value is NULL, this should be 0.
     * @returns {BOOL} This function cannot fail when passed valid parameters
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setprocessdefaultcpusets
     */
    static SetProcessDefaultCpuSets(Process, CpuSetIds, CpuSetIdCount) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        CpuSetIdsMarshal := CpuSetIds is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\SetProcessDefaultCpuSets", "ptr", Process, CpuSetIdsMarshal, CpuSetIds, "uint", CpuSetIdCount, "int")
        return result
    }

    /**
     * Returns the explicit CPU Set assignment of the specified thread, if any assignment was set using the SetThreadSelectedCpuSets API.
     * @param {HANDLE} Thread Specifies the thread for which to query the selected CPU Sets. This handle must have the THREAD\_QUERY\_LIMITED\_INFORMATION access right. The value returned by [**GetCurrentThread**](/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentthread) can also be specified here.
     * @param {Pointer<Integer>} CpuSetIds Specifies an optional buffer to retrieve the list of CPU Set identifiers.
     * @param {Integer} CpuSetIdCount Specifies the capacity of the buffer specified in **CpuSetIds**. If the buffer is NULL, this must be 0.
     * @param {Pointer<Integer>} RequiredIdCount Specifies the required capacity of the buffer to hold the entire list of thread selected CPU Sets. On successful return, this specifies the number of IDs filled into the buffer.
     * @returns {BOOL} This API returns TRUE on success. If the buffer is not large enough, the **GetLastError** value is ERROR\_INSUFFICIENT\_BUFFER. This API cannot fail when passed valid parameters and the return buffer is large enough.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadselectedcpusets
     */
    static GetThreadSelectedCpuSets(Thread, CpuSetIds, CpuSetIdCount, RequiredIdCount) {
        Thread := Thread is Win32Handle ? NumGet(Thread, "ptr") : Thread

        CpuSetIdsMarshal := CpuSetIds is VarRef ? "uint*" : "ptr"
        RequiredIdCountMarshal := RequiredIdCount is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\GetThreadSelectedCpuSets", "ptr", Thread, CpuSetIdsMarshal, CpuSetIds, "uint", CpuSetIdCount, RequiredIdCountMarshal, RequiredIdCount, "int")
        return result
    }

    /**
     * Sets the selected CPU Sets assignment for the specified thread. This assignment overrides the process default assignment, if one is set.
     * @param {HANDLE} Thread Specifies the thread on which to set the CPU Set assignment. This handle must have the THREAD\_SET\_LIMITED\_INFORMATION access right. The value returned by [**GetCurrentThread**](/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentthread) can also be used.
     * @param {Pointer<Integer>} CpuSetIds Specifies the list of CPU Set IDs to set as the thread selected CPU set. If this is NULL, the API clears out any assignment, reverting to process default assignment if one is set.
     * @param {Integer} CpuSetIdCount Specifies the number of IDs in the list passed in the **CpuSetIds** argument. If that value is NULL, this should be 0.
     * @returns {BOOL} This function cannot fail when passed valid parameters.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setthreadselectedcpusets
     */
    static SetThreadSelectedCpuSets(Thread, CpuSetIds, CpuSetIdCount) {
        Thread := Thread is Win32Handle ? NumGet(Thread, "ptr") : Thread

        CpuSetIdsMarshal := CpuSetIds is VarRef ? "uint*" : "ptr"

        result := DllCall("KERNEL32.dll\SetThreadSelectedCpuSets", "ptr", Thread, CpuSetIdsMarshal, CpuSetIds, "uint", CpuSetIdCount, "int")
        return result
    }

    /**
     * Creates a new process and its primary thread. The new process runs in the security context of the user represented by the specified token.
     * @param {HANDLE} hToken A handle to the primary token that represents a user. The handle must have the <b>TOKEN_QUERY</b>, <b>TOKEN_DUPLICATE</b>, and <b>TOKEN_ASSIGN_PRIMARY</b> access rights. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a>. The user represented by the token must have read and execute access to the application specified by the <i>lpApplicationName</i> or the <i>lpCommandLine</i> parameter. 
     * 
     * 
     * 
     * 
     * To get a primary token that represents the specified user, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> function. Alternatively, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetokenex">DuplicateTokenEx</a> function to convert an impersonation token into a primary token. This allows a server application that is impersonating a client to create a process that has the security context of the client.
     * 
     * If <i>hToken</i> is a restricted version of the caller's primary token, the <b>SE_ASSIGNPRIMARYTOKEN_NAME</b> privilege is not required. If the necessary privileges are not already enabled, 
     * <b>CreateProcessAsUser</b> enables them for the duration of the call. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecBP/running-with-special-privileges">Running with Special Privileges</a>.
     * 
     * <b>Terminal Services:  </b>The process is run in the session specified in the token. By default, this is the same session that called <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a>. To change the session, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-settokeninformation">SetTokenInformation</a> function.
     * @param {PSTR} lpApplicationName The name of the module to be executed. This module can be a Windows-based application. It can be some other type of module (for example, MS-DOS or OS/2) if the appropriate subsystem is available on the local computer. 
     * 
     * 
     * 
     * 
     * The string can specify the full path and file name of the module to execute or it can specify a partial name. In the case of a partial name, the function uses the current drive and current directory to complete the specification. The function will not use the search path. This parameter must include the file name extension; no default extension is assumed.
     * 
     * The <i>lpApplicationName</i> parameter can be <b>NULL</b>. In that case, the module name must be the first white space–delimited token in the <i>lpCommandLine</i> string. If you are using a long file name that contains a space, use quoted strings to indicate where the file name ends and the arguments begin; otherwise, the file name is ambiguous. For example, consider the string "c:\program files\sub dir\program name". This string can be interpreted in a number of ways. The system tries to interpret the possibilities in the following order:
     * 
     * <b>c:\program.exe</b>
     * <b>c:\program files\sub.exe</b>
     * <b>c:\program files\sub dir\program.exe</b>
     * <b>c:\program files\sub dir\program name.exe</b>
     * If the executable module is a 16-bit application, <i>lpApplicationName</i> should be <b>NULL</b>, and the string pointed to by <i>lpCommandLine</i> should specify the executable module as well as its arguments. By default, all 16-bit Windows-based applications created by 
     * <b>CreateProcessAsUser</b> are run in a separate VDM (equivalent to <b>CREATE_SEPARATE_WOW_VDM</b> in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>).
     * @param {PSTR} lpCommandLine The command line to be executed. The maximum length of this string is 32K characters. If <i>lpApplicationName</i> is <b>NULL</b>, the module name portion of <i>lpCommandLine</i> is limited to <b>MAX_PATH</b> characters.
     * 
     * The Unicode version of this function, <b>CreateProcessAsUserW</b>, can modify the contents of this string. Therefore, this parameter cannot be a pointer to read-only memory (such as a <b>const</b> variable or a literal string). If this parameter is a constant string, the function may cause an access violation.
     * 
     * The <i>lpCommandLine</i> parameter can be <b>NULL</b>. In that case, the function uses the string pointed to by <i>lpApplicationName</i> as the command line.
     * 
     * If both <i>lpApplicationName</i> and <i>lpCommandLine</i> are non-<b>NULL</b>, *<i>lpApplicationName</i> specifies the module to execute, and *<i>lpCommandLine</i> specifies the command line. The new process can use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processenv/nf-processenv-getcommandlinea">GetCommandLine</a> to retrieve the entire command line. Console processes written in C can use the <i>argc</i> and <i>argv</i> arguments to parse the command line. Because <i>argv</i>[0] is the module name, C programmers generally repeat the module name as the first token in the command line.
     * 
     * If <i>lpApplicationName</i> is <b>NULL</b>, the first white space–delimited token of the command line specifies the module name. If you are using a long file name that contains a space, use quoted strings to indicate where the file name ends and the arguments begin (see the explanation for the <i>lpApplicationName</i> parameter). If the file name does not contain an extension, .exe is appended. Therefore, if the file name extension is .com, this parameter must include the .com extension. If the file name ends in a period (.) with no extension, or if the file name contains a path, .exe is not appended. If the file name does not contain a directory path, the system searches for the executable file in the following sequence:
     * 
     * <ol>
     * <li>The directory from which the application loaded.</li>
     * <li>The current directory for the parent process.</li>
     * <li>The 32-bit Windows system directory. Use the <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsystemdirectorya">GetSystemDirectory</a> function to get the path of this directory. </li>
     * <li>The 16-bit Windows system directory. There is no function that obtains the path of this directory, but it is searched. </li>
     * <li>The Windows directory. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getwindowsdirectorya">GetWindowsDirectory</a> function to get the path of this directory.</li>
     * <li>The directories that are listed in the PATH environment variable. Note that this function does not search the per-application path specified by the <b>App Paths</b> registry key. To include this per-application path in the search sequence, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/axe/shellexecute">ShellExecute</a> function.</li>
     * </ol>
     * The system adds a null character to the command line string to separate the file name from the arguments. This divides the original string into two strings for internal processing.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpProcessAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new process object and determines whether child processes can inherit the returned handle to the process. If <i>lpProcessAttributes</i> is <b>NULL</b> or <b>lpSecurityDescriptor</b> is <b>NULL</b>, the process gets a default security descriptor and the handle cannot be inherited. The default security descriptor is that of the user referenced in the <i>hToken</i> parameter. This security descriptor may not allow access for the caller, in which case the process may not be opened again after it is run. The process handle is valid and will continue to have full access rights.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpThreadAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new thread object and determines whether child processes can inherit the returned handle to the thread. If <i>lpThreadAttributes</i> is <b>NULL</b> or <b>lpSecurityDescriptor</b> is <b>NULL</b>, the thread gets a default security descriptor and the handle cannot be inherited. The default security descriptor is that of the user referenced in the <i>hToken</i> parameter. This security descriptor may not allow access for the caller.
     * @param {BOOL} bInheritHandles If this parameter is <b>TRUE</b>, each inheritable handle in the calling process is inherited by the new process. If the parameter is <b>FALSE</b>, the handles are not inherited. Note that inherited handles have the same value and access rights as the original handles.
     * For additional discussion of inheritable handles, see Remarks.
     * 
     * <b>Terminal Services:  </b>You cannot inherit handles across sessions. Additionally, if this parameter is <b>TRUE</b>, you must create the process in the same session as the caller.
     * 
     * <b>Protected Process Light (PPL) processes:  </b>The generic handle inheritance is blocked when a PPL process creates a non-PPL process since PROCESS_DUP_HANDLE is not allowed from a non-PPL process to a PPL process. See <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>
     * @param {Integer} dwCreationFlags The flags that control the priority class and the creation of the process. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-creation-flags">Process Creation Flags</a>. 
     * 
     * This parameter also controls the new process's priority class, which is used to determine the scheduling priorities of the process's threads. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getpriorityclass">GetPriorityClass</a>. If none of the priority class flags is specified, the priority class defaults to <b>NORMAL_PRIORITY_CLASS</b> unless the priority class of the creating process is <b>IDLE_PRIORITY_CLASS</b> or <b>BELOW_NORMAL_PRIORITY_CLASS</b>. In this case, the child process receives the default priority class of the calling process.
     * 
     * 
     * If the dwCreationFlags parameter has a value of 0:
     * 
     * - The process inherits both the error mode of the caller and the parent's console. 
     * - The environment block for the new process is assumed to contain ANSI characters (see *lpEnvironment* parameter for additional information).
     * - A 16-bit Windows-based application runs in a shared Virtual DOS machine (VDM).
     * @param {Pointer<Void>} lpEnvironment A pointer to an environment block for the new process. If this parameter is <b>NULL</b>, the new process uses the environment of the calling process. 
     * 
     * 
     * 
     * 
     * An environment block consists of a null-terminated block of null-terminated strings. Each string is in the following form:
     * 
     * <i>name</i>=<i>value</i>\0
     * 
     * Because the equal sign is used as a separator, it must not be used in the name of an environment variable.
     * 
     * An environment block can contain either Unicode or ANSI characters. If the environment block pointed to by <i>lpEnvironment</i> contains Unicode characters, be sure that <i>dwCreationFlags</i> includes <b>CREATE_UNICODE_ENVIRONMENT</b>.  If this parameter is <b>NULL</b> and the environment block of the parent process contains Unicode characters, you must also ensure that <i>dwCreationFlags</i> includes <b>CREATE_UNICODE_ENVIRONMENT</b>.
     * 
     * The ANSI version of this function, <b>CreateProcessAsUserA</b> fails if the total size of the environment block for the process exceeds 32,767 characters.
     * 
     * Note that an ANSI environment block is terminated by two zero bytes: one for the last string, one more to terminate the block. A Unicode environment block is terminated by four zero bytes: two for the last string, two more to terminate the block.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>If the size of the combined user and system environment variable exceeds 8192 bytes, the process created by <b>CreateProcessAsUser</b> no longer runs with the environment block passed to the function by the parent process. Instead, the child process runs with the environment block returned by the <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-createenvironmentblock">CreateEnvironmentBlock</a> function.
     * 
     * 
     * 
     * To retrieve a copy of the environment block for a given user, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-createenvironmentblock">CreateEnvironmentBlock</a> function.
     * @param {PSTR} lpCurrentDirectory The full path to the current directory for the process. The string can also specify a UNC path. 
     * 
     * If this parameter is NULL, the new process will have the same current drive and directory as the calling process. (This feature is provided primarily for shells that need to start an application and specify its initial drive and working directory.)
     * @param {Pointer<STARTUPINFOA>} lpStartupInfo A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-startupinfoexa">STARTUPINFOEX</a> structure.
     * 
     * The user must have full access to both the specified window station and desktop. If you want the process to be interactive, specify winsta0\default. If the <b>lpDesktop</b> member is NULL, the new process inherits the desktop and window station of its parent process. 
     * If this member is an empty string, "", the new process connects to a window station using the rules described in <a href="https://docs.microsoft.com/windows/desktop/winstation/process-connection-to-a-window-station">Process Connection to a Window Station</a>.
     * 
     * To set extended attributes, use a <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-startupinfoexa">STARTUPINFOEX</a> structure and specify <b>EXTENDED_STARTUPINFO_PRESENT</b> in the <i>dwCreationFlags</i> parameter.
     * 
     * Handles in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-startupinfoexa">STARTUPINFOEX</a> must be closed with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> when they are no longer needed.
     * 
     * <div class="alert"><b>Important</b>  The caller is responsible for ensuring that the standard handle fields in <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> contain valid handle values. These fields are copied unchanged to the child process without validation, even when the <b>dwFlags</b> member specifies <b>STARTF_USESTDHANDLES</b>. Incorrect values can cause the child process to misbehave or crash. Use the <a href="https://docs.microsoft.com/windows-hardware/drivers/devtest/application-verifier">Application Verifier</a> runtime verification tool to detect invalid handles. </div>
     * <div> </div>
     * @param {Pointer<PROCESS_INFORMATION>} lpProcessInformation A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> structure that receives identification information about the new process. 
     * 
     * 
     * 
     * 
     * Handles in 
     * <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> must be closed with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> when they are no longer needed.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Note that the function returns before the process has finished initialization. If a required DLL cannot be located or fails to initialize, the process is terminated. To get the termination status of a process, call <a href="/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess">GetExitCodeProcess</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-createprocessasusera
     * @since windows5.1.2600
     */
    static CreateProcessAsUserA(hToken, lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken
        lpApplicationName := lpApplicationName is String ? StrPtr(lpApplicationName) : lpApplicationName
        lpCommandLine := lpCommandLine is String ? StrPtr(lpCommandLine) : lpCommandLine
        lpCurrentDirectory := lpCurrentDirectory is String ? StrPtr(lpCurrentDirectory) : lpCurrentDirectory

        lpEnvironmentMarshal := lpEnvironment is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CreateProcessAsUserA", "ptr", hToken, "ptr", lpApplicationName, "ptr", lpCommandLine, "ptr", lpProcessAttributes, "ptr", lpThreadAttributes, "int", bInheritHandles, "uint", dwCreationFlags, lpEnvironmentMarshal, lpEnvironment, "ptr", lpCurrentDirectory, "ptr", lpStartupInfo, "ptr", lpProcessInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the shutdown parameters for the currently calling process.
     * @param {Pointer<Integer>} lpdwLevel A pointer to a variable that receives the shutdown priority level. Higher levels shut down first. System level shutdown orders are reserved for system components. Higher numbers shut down first. Following are the level conventions.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>000-0FF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * System reserved last shutdown range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>100-1FF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Application reserved last shutdown range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>200-2FF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Application reserved "in between" shutdown range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>300-3FF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Application reserved first shutdown range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>400-4FF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * System reserved first shutdown range.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * All processes start at shutdown level 0x280.
     * @param {Pointer<Integer>} lpdwFlags A pointer to a variable that receives the shutdown flags. This parameter can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SHUTDOWN_NORETRY"></a><a id="shutdown_noretry"></a><dl>
     * <dt><b>SHUTDOWN_NORETRY</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this process takes longer than the specified timeout to shut down, do not display a retry dialog box for the user. Instead, just cause the process to directly exit.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocessshutdownparameters
     * @since windows5.1.2600
     */
    static GetProcessShutdownParameters(lpdwLevel, lpdwFlags) {
        lpdwLevelMarshal := lpdwLevel is VarRef ? "uint*" : "ptr"
        lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessShutdownParameters", lpdwLevelMarshal, lpdwLevel, lpdwFlagsMarshal, lpdwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the list of CPU Sets in the process default set that was set by SetProcessDefaultCpuSetMasks or SetProcessDefaultCpuSets.
     * @param {HANDLE} Process Specifies a process handle for the process to query. This handle must have the [PROCESS_QUERY_LIMITED_INFORMATION](/windows/win32/procthread/process-security-and-access-rights) access right. The value returned by [GetCurrentProcess](nf-processthreadsapi-getcurrentprocess.md) can also be specified here.
     * @param {Pointer<GROUP_AFFINITY>} CpuSetMasks Specifies an optional buffer to retrieve a list of [GROUP_AFFINITY](../winnt/ns-winnt-group_affinity.md) structures representing the process default CPU Sets.
     * @param {Integer} CpuSetMaskCount Specifies the size of the *CpuSetMasks* array, in elements.
     * @param {Pointer<Integer>} RequiredMaskCount On successful return, specifies the number of affinity structures written to the array. If the *CpuSetMasks* array is too small, the function fails with **ERROR_INSUFFICIENT_BUFFER** and sets the *RequiredMaskCount* parameter to the number of elements required. The number of required elements is always less than or equal to the maximum group count returned by [GetMaximumProcessorGroupCount](../winbase/nf-winbase-getmaximumprocessorgroupcount.md).
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero and extended error information can be retrieved by calling [GetLastError](../errhandlingapi/nf-errhandlingapi-getlasterror.md). 
     * 
     * If the array supplied is too small, the error value is **ERROR_INSUFFICIENT_BUFFER** and the *RequiredMaskCount* is set to the number of elements required.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocessdefaultcpusetmasks
     */
    static GetProcessDefaultCpuSetMasks(Process, CpuSetMasks, CpuSetMaskCount, RequiredMaskCount) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        RequiredMaskCountMarshal := RequiredMaskCount is VarRef ? "ushort*" : "ptr"

        result := DllCall("KERNEL32.dll\GetProcessDefaultCpuSetMasks", "ptr", Process, "ptr", CpuSetMasks, "ushort", CpuSetMaskCount, RequiredMaskCountMarshal, RequiredMaskCount, "int")
        return result
    }

    /**
     * Sets the default CPU Sets assignment for threads in the specified process.
     * @param {HANDLE} Process Specifies the process for which to set the default CPU Sets. This handle must have the [PROCESS_SET_LIMITED_INFORMATION](/windows/win32/procthread/process-security-and-access-rights) access right. The value returned by [GetCurrentProcess](nf-processthreadsapi-getcurrentprocess.md) can also be specified here.
     * @param {Pointer<GROUP_AFFINITY>} CpuSetMasks Specifies an optional buffer of [GROUP_AFFINITY](../winnt/ns-winnt-group_affinity.md) structures representing the CPU Sets to set as the process default CPU set. If this is NULL, the **SetProcessDefaultCpuSetMasks** function clears out any assignment.
     * @param {Integer} CpuSetMaskCount Specifies the size of the *CpuSetMasks* array, in elements. If the buffer is NULL, this value must be zero.
     * @returns {BOOL} This function cannot fail when passed valid parameters.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setprocessdefaultcpusetmasks
     */
    static SetProcessDefaultCpuSetMasks(Process, CpuSetMasks, CpuSetMaskCount) {
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        result := DllCall("KERNEL32.dll\SetProcessDefaultCpuSetMasks", "ptr", Process, "ptr", CpuSetMasks, "ushort", CpuSetMaskCount, "int")
        return result
    }

    /**
     * Returns the explicit CPU Set assignment of the specified thread, if any assignment was set using SetThreadSelectedCpuSetMasks or SetThreadSelectedCpuSets.
     * @param {HANDLE} Thread Specifies the thread for which to query the selected CPU Sets. This handle must have the [PROCESS_QUERY_LIMITED_INFORMATION](/windows/win32/procthread/process-security-and-access-rights) access right. The value returned by [GetCurrentProcess](nf-processthreadsapi-getcurrentprocess.md) can also be specified here.
     * @param {Pointer<GROUP_AFFINITY>} CpuSetMasks Specifies an optional buffer to retrieve a list of [GROUP_AFFINITY](../winnt/ns-winnt-group_affinity.md) structures representing the thread selected CPU Sets.
     * @param {Integer} CpuSetMaskCount Specifies the size of the *CpuSetMasks* array, in elements.
     * @param {Pointer<Integer>} RequiredMaskCount On successful return, specifies the number of affinity structures written to the array.
     * If the array is too small, the function fails with **ERROR_INSUFFICIENT_BUFFER** and sets the *RequiredMaskCount* parameter to the number of elements required.
     * The number of required elements is always less than or equal to the maximum group count returned by [GetMaximumProcessorGroupCount](../winbase/nf-winbase-getmaximumprocessorgroupcount.md).
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero and extended error information can be retrieved by calling [GetLastError](../errhandlingapi/nf-errhandlingapi-getlasterror.md). 
     * 
     * If the array supplied is too small, the error value is **ERROR_INSUFFICIENT_BUFFER** and the RequiredMaskCount is set to the number of elements required.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreadselectedcpusetmasks
     */
    static GetThreadSelectedCpuSetMasks(Thread, CpuSetMasks, CpuSetMaskCount, RequiredMaskCount) {
        Thread := Thread is Win32Handle ? NumGet(Thread, "ptr") : Thread

        RequiredMaskCountMarshal := RequiredMaskCount is VarRef ? "ushort*" : "ptr"

        result := DllCall("KERNEL32.dll\GetThreadSelectedCpuSetMasks", "ptr", Thread, "ptr", CpuSetMasks, "ushort", CpuSetMaskCount, RequiredMaskCountMarshal, RequiredMaskCount, "int")
        return result
    }

    /**
     * Sets the selected CPU Sets assignment for the specified thread. This assignment overrides the process default assignment, if one is set.
     * @param {HANDLE} Thread Specifies the thread on which to set the CPU Set assignment. [PROCESS_SET_LIMITED_INFORMATION](/windows/win32/procthread/process-security-and-access-rights) access right. The value returned by [GetCurrentProcess](nf-processthreadsapi-getcurrentprocess.md) can also be specified here.
     * @param {Pointer<GROUP_AFFINITY>} CpuSetMasks Specifies an optional buffer of [GROUP_AFFINITY](../winnt/ns-winnt-group_affinity.md) structures representing the CPU Sets to set as the thread selected CPU set. If this is NULL, the **SetThreadSelectedCpuSetMasks** function clears out any assignment, reverting to process default assignment if one is set.
     * @param {Integer} CpuSetMaskCount Specifies the number of **GROUP_AFFINITY** structures in the list passed in the GroupCpuSets argument. If the buffer is NULL, this value must be zero.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero and extended error information can be retrieved by calling [GetLastError](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setthreadselectedcpusetmasks
     */
    static SetThreadSelectedCpuSetMasks(Thread, CpuSetMasks, CpuSetMaskCount) {
        Thread := Thread is Win32Handle ? NumGet(Thread, "ptr") : Thread

        result := DllCall("KERNEL32.dll\SetThreadSelectedCpuSetMasks", "ptr", Thread, "ptr", CpuSetMasks, "ushort", CpuSetMaskCount, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Machine 
     * @param {Pointer<Integer>} MachineTypeAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getmachinetypeattributes
     */
    static GetMachineTypeAttributes(Machine, MachineTypeAttributes) {
        MachineTypeAttributesMarshal := MachineTypeAttributes is VarRef ? "int*" : "ptr"

        result := DllCall("KERNEL32.dll\GetMachineTypeAttributes", "ushort", Machine, MachineTypeAttributesMarshal, MachineTypeAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Assigns a description to a thread.
     * @param {HANDLE} hThread A handle for the thread for which you want to set the description. The handle must have THREAD_SET_LIMITED_INFORMATION access.
     * @param {PWSTR} lpThreadDescription A Unicode string that specifies the description of the thread.
     * @returns {HRESULT} If the function succeeds, the return value is the **HRESULT** that denotes a successful operation.
     * If the function fails, the return value is an **HRESULT** that denotes the error.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-setthreaddescription
     * @since windows10.0.14393
     */
    static SetThreadDescription(hThread, lpThreadDescription) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread
        lpThreadDescription := lpThreadDescription is String ? StrPtr(lpThreadDescription) : lpThreadDescription

        result := DllCall("KERNEL32.dll\SetThreadDescription", "ptr", hThread, "ptr", lpThreadDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the description that was assigned to a thread by calling SetThreadDescription.
     * @param {HANDLE} hThread A handle to the thread for which to retrieve the description. The handle must have THREAD_QUERY_LIMITED_INFORMATION access.
     * @param {Pointer<PWSTR>} ppszThreadDescription A Unicode string that contains the description of the thread.
     * @returns {HRESULT} If the function succeeds, the return value is the <b>HRESULT</b> that denotes a successful operation.
     * If the function fails, the return value is an <b>HRESULT</b> that denotes the error.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getthreaddescription
     * @since windows10.0.14393
     */
    static GetThreadDescription(hThread, ppszThreadDescription) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        result := DllCall("KERNEL32.dll\GetThreadDescription", "ptr", hThread, "ptr", ppszThreadDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwTlsIndex 
     * @returns {Pointer<Void>} 
     */
    static TlsGetValue2(dwTlsIndex) {
        result := DllCall("KERNEL32.dll\TlsGetValue2", "uint", dwTlsIndex, "ptr")
        return result
    }

    /**
     * Queues a work item to a worker thread in the thread pool.
     * @param {Pointer<LPTHREAD_START_ROUTINE>} Function A pointer to the application-defined callback function of type <b>LPTHREAD_START_ROUTINE</b> to be executed by the thread in the thread pool. This value represents the starting address of the thread. This callback function must not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-terminatethread">TerminateThread</a> function. 
     * 
     * The return value of the callback function is not used.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms686736(v=vs.85)">ThreadProc</a>.
     * @param {Pointer<Void>} Context A single parameter value to be passed to the thread function.
     * @param {Integer} Flags 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoollegacyapiset/nf-threadpoollegacyapiset-queueuserworkitem
     * @since windows5.1.2600
     */
    static QueueUserWorkItem(Function, Context, Flags) {
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueueUserWorkItem", "ptr", Function, ContextMarshal, Context, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Cancels a registered wait operation issued by the RegisterWaitForSingleObject function.
     * @param {HANDLE} WaitHandle The wait handle. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registerwaitforsingleobject">RegisterWaitForSingleObject</a> function.
     * @param {HANDLE} CompletionEvent A handle to the event object to be signaled when the wait operation has been unregistered. This parameter can be <b>NULL</b>.
     * 
     * If this parameter is <b>INVALID_HANDLE_VALUE</b>, the function waits for all callback functions to complete before returning.
     * 
     * If this parameter is <b>NULL</b>, the function marks the timer for deletion and returns immediately. However, most callers should wait for the callback function to complete so they can perform any needed cleanup.
     * 
     * If the caller provides this event and the function succeeds or the function fails with  <b>ERROR_IO_PENDING</b>,  do not close the event until it is signaled.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoollegacyapiset/nf-threadpoollegacyapiset-unregisterwaitex
     * @since windows5.1.2600
     */
    static UnregisterWaitEx(WaitHandle, CompletionEvent) {
        WaitHandle := WaitHandle is Win32Handle ? NumGet(WaitHandle, "ptr") : WaitHandle
        CompletionEvent := CompletionEvent is Win32Handle ? NumGet(CompletionEvent, "ptr") : CompletionEvent

        A_LastError := 0

        result := DllCall("KERNEL32.dll\UnregisterWaitEx", "ptr", WaitHandle, "ptr", CompletionEvent, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a queue for timers.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the timer queue. This handle can be used only in functions that require a handle to a timer queue.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueue
     * @since windows5.1.2600
     */
    static CreateTimerQueue() {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateTimerQueue", "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Creates a timer-queue timer. This timer expires at the specified due time, then after every specified period. When the timer expires, the callback function is called.
     * @param {Pointer<HANDLE>} phNewTimer A pointer to a buffer that receives a handle to the timer-queue timer on return. When this handle has expired and is no longer required, release it by calling <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-deletetimerqueuetimer">DeleteTimerQueueTimer</a>.
     * @param {HANDLE} TimerQueue A handle to the timer queue. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueue">CreateTimerQueue</a> function.
     * 
     * If this parameter is <b>NULL</b>, the timer is associated with the default timer queue.
     * @param {Pointer<WAITORTIMERCALLBACK>} Callback A pointer to the application-defined function of type <b>WAITORTIMERCALLBACK</b> to be executed when the timer expires. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms687066(v=vs.85)">WaitOrTimerCallback</a>.
     * @param {Pointer<Void>} Parameter A single parameter value that will be passed to the callback function.
     * @param {Integer} DueTime The amount of time in milliseconds relative to the current time that must elapse before the timer is signaled for the first time.
     * @param {Integer} Period The period of the timer, in milliseconds. If this parameter is zero, the timer is signaled once. If this parameter is greater than zero, the timer is periodic. A periodic timer automatically reactivates each time the period elapses, until the timer is canceled.
     * @param {Integer} Flags 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueuetimer
     * @since windows5.1.2600
     */
    static CreateTimerQueueTimer(phNewTimer, TimerQueue, Callback, Parameter, DueTime, Period, Flags) {
        TimerQueue := TimerQueue is Win32Handle ? NumGet(TimerQueue, "ptr") : TimerQueue

        ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateTimerQueueTimer", "ptr", phNewTimer, "ptr", TimerQueue, "ptr", Callback, ParameterMarshal, Parameter, "uint", DueTime, "uint", Period, "uint", Flags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Updates a timer-queue timer that was created by the CreateTimerQueueTimer function.
     * @param {HANDLE} TimerQueue A handle to the timer queue. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueue">CreateTimerQueue</a> function. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, the timer is associated with the default timer queue.
     * @param {HANDLE} Timer A handle to the timer-queue timer. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueuetimer">CreateTimerQueueTimer</a> function.
     * @param {Integer} DueTime The time after which the timer should expire, in milliseconds.
     * @param {Integer} Period The period of the timer, in milliseconds. If this parameter is zero, the timer is signaled once. If this parameter is greater than zero, the timer is periodic. A periodic timer automatically reactivates each time the period elapses, until the timer is canceled using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-deletetimerqueuetimer">DeleteTimerQueueTimer</a> function or reset using 
     * <b>ChangeTimerQueueTimer</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoollegacyapiset/nf-threadpoollegacyapiset-changetimerqueuetimer
     * @since windows5.1.2600
     */
    static ChangeTimerQueueTimer(TimerQueue, Timer, DueTime, Period) {
        TimerQueue := TimerQueue is Win32Handle ? NumGet(TimerQueue, "ptr") : TimerQueue
        Timer := Timer is Win32Handle ? NumGet(Timer, "ptr") : Timer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ChangeTimerQueueTimer", "ptr", TimerQueue, "ptr", Timer, "uint", DueTime, "uint", Period, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes a timer from the timer queue and optionally waits for currently running timer callback functions to complete before deleting the timer.
     * @param {HANDLE} TimerQueue A handle to the timer queue. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueue">CreateTimerQueue</a> function. 
     * 
     * 
     * 
     * 
     * If the timer was created using the default timer queue, this parameter should be <b>NULL</b>.
     * @param {HANDLE} Timer A handle to the timer-queue timer. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueuetimer">CreateTimerQueueTimer</a> function.
     * @param {HANDLE} CompletionEvent A handle to the event object to be signaled when the system has canceled the timer and all callback functions  have completed. This parameter can be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>INVALID_HANDLE_VALUE</b>, the function waits for any running timer callback functions to complete before returning.
     * 
     * If this parameter is <b>NULL</b>, the function marks the timer for deletion and returns immediately. If the timer has already expired, the timer callback function will run to completion. However, there is no notification sent when the timer callback function has completed. Most callers should not use this option, and should wait for running timer callback functions to complete so they can perform any needed cleanup.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the error code is <b>ERROR_IO_PENDING</b>, it is not necessary to call this function again. For any other error, you should retry the call.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoollegacyapiset/nf-threadpoollegacyapiset-deletetimerqueuetimer
     * @since windows5.1.2600
     */
    static DeleteTimerQueueTimer(TimerQueue, Timer, CompletionEvent) {
        TimerQueue := TimerQueue is Win32Handle ? NumGet(TimerQueue, "ptr") : TimerQueue
        Timer := Timer is Win32Handle ? NumGet(Timer, "ptr") : Timer
        CompletionEvent := CompletionEvent is Win32Handle ? NumGet(CompletionEvent, "ptr") : CompletionEvent

        A_LastError := 0

        result := DllCall("KERNEL32.dll\DeleteTimerQueueTimer", "ptr", TimerQueue, "ptr", Timer, "ptr", CompletionEvent, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes a timer queue. Any pending timers in the queue are canceled and deleted.
     * @param {HANDLE} TimerQueue A handle to the timer queue. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueue">CreateTimerQueue</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoollegacyapiset/nf-threadpoollegacyapiset-deletetimerqueue
     * @since windows5.1.2600
     */
    static DeleteTimerQueue(TimerQueue) {
        TimerQueue := TimerQueue is Win32Handle ? NumGet(TimerQueue, "ptr") : TimerQueue

        A_LastError := 0

        result := DllCall("KERNEL32.dll\DeleteTimerQueue", "ptr", TimerQueue, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes a timer queue. Any pending timers in the queue are canceled and deleted.
     * @param {HANDLE} TimerQueue A handle to the timer queue. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueue">CreateTimerQueue</a> function.
     * @param {HANDLE} CompletionEvent A handle to the event object to be signaled when the function is successful and all callback functions have completed. This parameter can be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>INVALID_HANDLE_VALUE</b>, the function waits for all callback functions to complete before returning.
     * 
     * If this parameter is <b>NULL</b>, the function marks the timer for deletion and returns immediately. However, most callers should wait for the callback function to complete so they can perform any needed cleanup.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoollegacyapiset/nf-threadpoollegacyapiset-deletetimerqueueex
     * @since windows5.1.2600
     */
    static DeleteTimerQueueEx(TimerQueue, CompletionEvent) {
        TimerQueue := TimerQueue is Win32Handle ? NumGet(TimerQueue, "ptr") : TimerQueue
        CompletionEvent := CompletionEvent is Win32Handle ? NumGet(CompletionEvent, "ptr") : CompletionEvent

        A_LastError := 0

        result := DllCall("KERNEL32.dll\DeleteTimerQueueEx", "ptr", TimerQueue, "ptr", CompletionEvent, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates a new pool of threads to execute callbacks.
     * @returns {PTP_POOL} If the function succeeds, it returns a pointer to a <b>TP_POOL</b> structure representing the newly allocated thread pool. Applications do not modify the members of this structure.
     * 
     * If function fails, it returns NULL. To retrieve extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-createthreadpool
     * @since windows6.0.6000
     */
    static CreateThreadpool() {
        static reserved := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateThreadpool", "ptr", reserved, "ptr")
        if(A_LastError)
            throw OSError()

        return PTP_POOL({Value: result}, True)
    }

    /**
     * Sets the maximum number of threads that the specified thread pool can allocate to process callbacks.
     * @remarks
     * 
     * To specify the minimum number of threads available in the pool, call <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolthreadminimum">SetThreadpoolThreadMinimum</a>.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * 
     * @param {PTP_POOL} ptpp A pointer to a <b>TP_POOL</b> structure that defines the thread pool. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpool">CreateThreadpool</a> function returns this pointer.
     * @param {Integer} cthrdMost The maximum number of threads.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-setthreadpoolthreadmaximum
     * @since windows6.0.6000
     */
    static SetThreadpoolThreadMaximum(ptpp, cthrdMost) {
        ptpp := ptpp is Win32Handle ? NumGet(ptpp, "ptr") : ptpp

        DllCall("KERNEL32.dll\SetThreadpoolThreadMaximum", "ptr", ptpp, "uint", cthrdMost)
    }

    /**
     * Sets the minimum number of threads that the specified thread pool must make available to process callbacks.
     * @param {PTP_POOL} ptpp A pointer to a <b>TP_POOL</b> structure that defines the thread pool. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpool">CreateThreadpool</a> function returns this pointer.
     * @param {Integer} cthrdMic The minimum number of threads.
     * @returns {BOOL} If the function succeeds, it returns TRUE.
     * 
     * If the function fails, it returns FALSE. To retrieve extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-setthreadpoolthreadminimum
     * @since windows6.0.6000
     */
    static SetThreadpoolThreadMinimum(ptpp, cthrdMic) {
        ptpp := ptpp is Win32Handle ? NumGet(ptpp, "ptr") : ptpp

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetThreadpoolThreadMinimum", "ptr", ptpp, "uint", cthrdMic, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the stack reserve and commit sizes for new threads in the specified thread pool. Stack reserve and commit sizes for existing threads are not changed.
     * @param {PTP_POOL} ptpp A pointer to a <b>TP_POOL</b> structure that specifies the thread pool. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpool">CreateThreadpool</a> function returns this [pomter.
     * @param {Pointer<TP_POOL_STACK_INFORMATION>} ptpsi A pointer to a <b>TP_POOL_STACK_INFORMATION</b> structure that specifies the stack reserve and commit size for threads in the pool.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-setthreadpoolstackinformation
     * @since windows6.1
     */
    static SetThreadpoolStackInformation(ptpp, ptpsi) {
        ptpp := ptpp is Win32Handle ? NumGet(ptpp, "ptr") : ptpp

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetThreadpoolStackInformation", "ptr", ptpp, "ptr", ptpsi, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the stack reserve and commit sizes for threads in the specified thread pool.
     * @param {PTP_POOL} ptpp A pointer to a <b>TP_POOL</b> structure that specifies the thread pool. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpool">CreateThreadpool</a> function returns this pointer.
     * @param {Pointer<TP_POOL_STACK_INFORMATION>} ptpsi A pointer to a <b>TP_POOL_STACK_INFORMATION</b> structure that receives the stack reserve and commit size.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-querythreadpoolstackinformation
     * @since windows6.1
     */
    static QueryThreadpoolStackInformation(ptpp, ptpsi) {
        ptpp := ptpp is Win32Handle ? NumGet(ptpp, "ptr") : ptpp

        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueryThreadpoolStackInformation", "ptr", ptpp, "ptr", ptpsi, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes the specified thread pool.
     * @remarks
     * 
     * The thread pool is closed immediately if there are no outstanding <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolwork">work</a>, <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolio">I/O</a>, <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpooltimer">timer</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolwait">wait</a> objects that are bound to the pool; otherwise, the thread pool is released asynchronously after the outstanding objects are freed.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * 
     * @param {PTP_POOL} ptpp A pointer to a <b>TP_POOL</b> structure that defines the thread pool. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpool">CreateThreadpool</a> function returns this pointer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-closethreadpool
     * @since windows6.0.6000
     */
    static CloseThreadpool(ptpp) {
        ptpp := ptpp is Win32Handle ? NumGet(ptpp, "ptr") : ptpp

        DllCall("KERNEL32.dll\CloseThreadpool", "ptr", ptpp)
    }

    /**
     * Creates a cleanup group that applications can use to track one or more thread pool callbacks.
     * @returns {PTP_CLEANUP_GROUP} If the function succeeds, it returns a pointer to a <b>TP_CLEANUP_GROUP</b> structure of the newly allocated cleanup group. Applications do not modify the members of this structure.
     * 
     * If function fails, it returns NULL. To retrieve extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-createthreadpoolcleanupgroup
     * @since windows6.0.6000
     */
    static CreateThreadpoolCleanupGroup() {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateThreadpoolCleanupGroup", "ptr")
        if(A_LastError)
            throw OSError()

        return PTP_CLEANUP_GROUP({Value: result}, True)
    }

    /**
     * Releases the members of the specified cleanup group, waits for all callback functions to complete, and optionally cancels any outstanding callback functions.
     * @remarks
     * 
     * The <b>CloseThreadpoolCleanupGroupMembers</b> function simplifies cleanup of thread pool callback objects by releasing, in a single operation, all work objects, wait objects, and timer objects that are members of the cleanup group. An object becomes a member of a cleanup group when the object is created with the threadpool callback environment that was specified when the cleanup group was created. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolcleanupgroup">CreateThreadpoolCleanupGroup</a>.
     * 
     * The <b>CloseThreadpoolCleanupGroupMembers</b> function blocks until all currently executing callback functions finish. If <i>fCancelPendingCallbacks</i> is TRUE, outstanding callbacks are canceled; otherwise, the function blocks until all outstanding callbacks also finish.  After the <b>CloseThreadpoolCleanupGroupMembers</b> function returns, an application should not use any object that was a member of the cleanup group at the time <b>CloseThreadpoolCleanupGroupMembers</b> was called.  Also, an application should not release any of the objects individually by calling a function such as <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolwork">CloseThreadpoolWork</a>, because the objects have already been released. 
     * 
     * The <b>CloseThreadpoolCleanupGroupMembers</b> function does not close the cleanup group itself. Instead, the cleanup group persists until the <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolcleanupgroup">CloseThreadpoolCleanupGroup</a> function is called. Also, closing a cleanup group does not affect the associated threadpool callback environment. The callback environment persists until it is destroyed by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-destroythreadpoolenvironment">DestroyThreadpoolEnvironment</a>.
     * 
     *  As long as a cleanup group persists, new objects created with the cleanup group's associated threadpool callback environment are added to the cleanup group. This allows an application to reuse the cleanup group. However, it can lead to errors if the application does not synchronize code that calls <b>CloseThreadpoolCleanupGroupMembers</b> with code that creates new objects. For example, suppose a thread creates two threadpool work objects, Work1 and Work2. Another thread calls <b>CloseThreadpoolCleanupGroupMembers</b>. Depending on when the threads run, any of the following might occur: 
     * 
     * <ul>
     * <li>Work1 and Work2 are added to the cleanup group after its existing members were released. Code that submits Work1 and Work2 will succeed.</li>
     * <li>Work1 is added to the cleanup group before its existing members are released, causing Work1 to be released along with other members. Then Work2 is added. Code that submits Work1 will generate an exception; code that submits Work2 will succeed.</li>
     * <li>Work1 and Work2 are added to the cleanup group before its existing members are released, causing both Work1 and Work2 to be released. Code that submits Work1 or Work2 will generate an exception.</li>
     * </ul>
     * To simply wait for or cancel pending work items without releasing them, use one of the threadpool callback functions: <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-waitforthreadpooliocallbacks">WaitForThreadpoolIoCallbacks</a>, <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-waitforthreadpooltimercallbacks">WaitForThreadpoolTimerCallbacks</a>, <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-waitforthreadpoolwaitcallbacks">WaitForThreadpoolWaitCallbacks</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-waitforthreadpoolworkcallbacks">WaitForThreadpoolWorkCallbacks</a>.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * 
     * @param {PTP_CLEANUP_GROUP} ptpcg A pointer to a <b>TP_CLEANUP_GROUP</b> structure that defines the cleanup group. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolcleanupgroup">CreateThreadpoolCleanupGroup</a> function returns this pointer.
     * @param {BOOL} fCancelPendingCallbacks If this parameter is TRUE, the function cancels outstanding callbacks that have not yet started. If this parameter is FALSE, the function waits for outstanding callback functions to complete.
     * @param {Pointer<Void>} pvCleanupContext The application-defined data to pass to the application's cleanup group callback function. You can specify the callback function when you call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setthreadpoolcallbackcleanupgroup">SetThreadpoolCallbackCleanupGroup</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-closethreadpoolcleanupgroupmembers
     * @since windows6.0.6000
     */
    static CloseThreadpoolCleanupGroupMembers(ptpcg, fCancelPendingCallbacks, pvCleanupContext) {
        ptpcg := ptpcg is Win32Handle ? NumGet(ptpcg, "ptr") : ptpcg

        pvCleanupContextMarshal := pvCleanupContext is VarRef ? "ptr" : "ptr"

        DllCall("KERNEL32.dll\CloseThreadpoolCleanupGroupMembers", "ptr", ptpcg, "int", fCancelPendingCallbacks, pvCleanupContextMarshal, pvCleanupContext)
    }

    /**
     * Closes the specified cleanup group.
     * @remarks
     * 
     * The cleanup group must have no members when you call this function. For information on removing members of the group, see <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolcleanupgroupmembers">CloseThreadpoolCleanupGroupMembers</a>.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * 
     * @param {PTP_CLEANUP_GROUP} ptpcg A pointer to a <b>TP_CLEANUP_GROUP</b> structure that defines the cleanup group. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolcleanupgroup">CreateThreadpoolCleanupGroup</a> returns this pointer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-closethreadpoolcleanupgroup
     * @since windows6.0.6000
     */
    static CloseThreadpoolCleanupGroup(ptpcg) {
        ptpcg := ptpcg is Win32Handle ? NumGet(ptpcg, "ptr") : ptpcg

        DllCall("KERNEL32.dll\CloseThreadpoolCleanupGroup", "ptr", ptpcg)
    }

    /**
     * Specifies the event that the thread pool will set when the current callback completes.
     * @remarks
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_CALLBACK_INSTANCE} pci A pointer to a <b>TP_CALLBACK_INSTANCE</b> structure that defines the callback instance. The pointer is passed to the callback function.
     * @param {HANDLE} evt A handle to the event to be set.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-seteventwhencallbackreturns
     * @since windows6.0.6000
     */
    static SetEventWhenCallbackReturns(pci, evt) {
        pci := pci is Win32Handle ? NumGet(pci, "ptr") : pci
        evt := evt is Win32Handle ? NumGet(evt, "ptr") : evt

        DllCall("KERNEL32.dll\SetEventWhenCallbackReturns", "ptr", pci, "ptr", evt)
    }

    /**
     * Specifies the semaphore that the thread pool will release when the current callback completes.
     * @remarks
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_CALLBACK_INSTANCE} pci A pointer to a <b>TP_CALLBACK_INSTANCE</b> structure that defines the callback instance. The pointer is passed to the callback function.
     * @param {HANDLE} sem A handle to the semaphore.
     * @param {Integer} crel The amount by which to increment the semaphore object's count.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-releasesemaphorewhencallbackreturns
     * @since windows6.0.6000
     */
    static ReleaseSemaphoreWhenCallbackReturns(pci, sem, crel) {
        pci := pci is Win32Handle ? NumGet(pci, "ptr") : pci
        sem := sem is Win32Handle ? NumGet(sem, "ptr") : sem

        DllCall("KERNEL32.dll\ReleaseSemaphoreWhenCallbackReturns", "ptr", pci, "ptr", sem, "uint", crel)
    }

    /**
     * Specifies the mutex that the thread pool will release when the current callback completes.
     * @remarks
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_CALLBACK_INSTANCE} pci A pointer to a <b>TP_CALLBACK_INSTANCE</b> structure that defines the callback instance. The pointer is passed to the callback function.
     * @param {HANDLE} mut A handle to the mutex.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-releasemutexwhencallbackreturns
     * @since windows6.0.6000
     */
    static ReleaseMutexWhenCallbackReturns(pci, mut) {
        pci := pci is Win32Handle ? NumGet(pci, "ptr") : pci
        mut := mut is Win32Handle ? NumGet(mut, "ptr") : mut

        DllCall("KERNEL32.dll\ReleaseMutexWhenCallbackReturns", "ptr", pci, "ptr", mut)
    }

    /**
     * Specifies the critical section that the thread pool will release when the current callback completes.
     * @remarks
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_CALLBACK_INSTANCE} pci A pointer to a <b>TP_CALLBACK_INSTANCE</b> structure that defines the callback instance. The pointer is passed to the callback function.
     * @param {Pointer<CRITICAL_SECTION>} pcs The critical section.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-leavecriticalsectionwhencallbackreturns
     * @since windows6.0.6000
     */
    static LeaveCriticalSectionWhenCallbackReturns(pci, pcs) {
        pci := pci is Win32Handle ? NumGet(pci, "ptr") : pci

        DllCall("KERNEL32.dll\LeaveCriticalSectionWhenCallbackReturns", "ptr", pci, "ptr", pcs)
    }

    /**
     * Specifies the DLL that the thread pool will unload when the current callback completes.
     * @remarks
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_CALLBACK_INSTANCE} pci A pointer to a <b>TP_CALLBACK_INSTANCE</b> structure that defines the callback instance. The pointer is passed to the callback function.
     * @param {HMODULE} mod A handle to the DLL.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-freelibrarywhencallbackreturns
     * @since windows6.0.6000
     */
    static FreeLibraryWhenCallbackReturns(pci, mod) {
        pci := pci is Win32Handle ? NumGet(pci, "ptr") : pci
        mod := mod is Win32Handle ? NumGet(mod, "ptr") : mod

        DllCall("KERNEL32.dll\FreeLibraryWhenCallbackReturns", "ptr", pci, "ptr", mod)
    }

    /**
     * Indicates that the callback may not return quickly.
     * @param {PTP_CALLBACK_INSTANCE} pci A pointer to a <b>TP_CALLBACK_INSTANCE</b> structure that defines the callback instance. The pointer is passed to the callback function.
     * @returns {BOOL} The function returns TRUE if another thread in the thread pool is available for processing callbacks or the thread pool was able to create a new thread.  In this case, the current callback function may use the current thread indefinitely.
     * 
     * The function returns FALSE if another thread in the thread pool is not available to process callbacks and the thread pool was not able to create a new thread.  The thread pool will attempt to create a new thread after a delay, but if the current callback function runs long, the thread pool may lose efficiency.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-callbackmayrunlong
     * @since windows6.0.6000
     */
    static CallbackMayRunLong(pci) {
        pci := pci is Win32Handle ? NumGet(pci, "ptr") : pci

        result := DllCall("KERNEL32.dll\CallbackMayRunLong", "ptr", pci, "int")
        return result
    }

    /**
     * Removes the association between the currently executing callback function and the object that initiated the callback. The current thread will no longer count as executing a callback on behalf of the object.
     * @remarks
     * 
     * If this is the last thread executing a callback on behalf of the object, any threads waiting for the object's callbacks to complete will be released.
     * 
     * The thread remains associated with the object's <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolcleanupgroup">cleanup group</a> until the thread returns to the thread pool. This lets DLL shutdown routines safely synchronize with outstanding callbacks and proceed with unloading the DLL's code when all callbacks have completed.
     * 
     * The callback-generating object remains valid for the duration of the callback. The callback object may be reused or released (although synchronization with cleanup group release is still required).
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_CALLBACK_INSTANCE} pci A pointer to a <b>TP_CALLBACK_INSTANCE</b> structure that defines the callback instance. The pointer is passed to the callback function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-disassociatecurrentthreadfromcallback
     * @since windows6.0.6000
     */
    static DisassociateCurrentThreadFromCallback(pci) {
        pci := pci is Win32Handle ? NumGet(pci, "ptr") : pci

        DllCall("KERNEL32.dll\DisassociateCurrentThreadFromCallback", "ptr", pci)
    }

    /**
     * Requests that a thread pool worker thread call the specified callback function.
     * @param {Pointer<PTP_SIMPLE_CALLBACK>} pfns The callback function. For details, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms686295(v=vs.85)">SimpleCallback</a>.
     * @param {Pointer<Void>} pv Optional application-defined data to pass to the callback function.
     * @param {Pointer<TP_CALLBACK_ENVIRON_V3>} pcbe A pointer to a <b>TP_CALLBACK_ENVIRON</b> structure that defines the environment in which to execute the callback function. Use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializethreadpoolenvironment">InitializeThreadpoolEnvironment</a> function to initialize the structure before calling this function.
     * 
     * If this parameter is NULL, the callback executes in the default callback environment. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializethreadpoolenvironment">InitializeThreadpoolEnvironment</a>.
     * @returns {BOOL} If the function succeeds, it returns TRUE.
     * 
     * If the function fails, it returns FALSE. To retrieve extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-trysubmitthreadpoolcallback
     * @since windows6.0.6000
     */
    static TrySubmitThreadpoolCallback(pfns, pv, pcbe) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\TrySubmitThreadpoolCallback", "ptr", pfns, pvMarshal, pv, "ptr", pcbe, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a new work object.
     * @param {Pointer<PTP_WORK_CALLBACK>} pfnwk The callback function. A worker thread calls this callback each time you call <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-submitthreadpoolwork">SubmitThreadpoolWork</a> to post the work object. For details, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms687396(v=vs.85)">WorkCallback</a>.
     * @param {Pointer<Void>} pv Optional application-defined data to pass to the callback function.
     * @param {Pointer<TP_CALLBACK_ENVIRON_V3>} pcbe A pointer to a <b>TP_CALLBACK_ENVIRON</b> structure that defines the  environment in which to execute the callback. Use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializethreadpoolenvironment">InitializeThreadpoolEnvironment</a> function to initialize the structure before calling this function.
     * 
     * If this parameter is NULL, the callback executes in the default callback environment. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializethreadpoolenvironment">InitializeThreadpoolEnvironment</a>.
     * @returns {PTP_WORK} If the function succeeds, it returns a pointer to a <b>TP_WORK</b> structure that defines the work object. Applications do not modify the members of this structure.
     * 
     * If the function fails, it returns NULL. To retrieve extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-createthreadpoolwork
     * @since windows6.0.6000
     */
    static CreateThreadpoolWork(pfnwk, pv, pcbe) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateThreadpoolWork", "ptr", pfnwk, pvMarshal, pv, "ptr", pcbe, "ptr")
        if(A_LastError)
            throw OSError()

        return PTP_WORK({Value: result}, True)
    }

    /**
     * Posts a work object to the thread pool. A worker thread calls the work object's callback function.
     * @remarks
     * 
     * You can post a work object one or more times (up to MAXULONG) without waiting for prior callbacks to complete.  The callbacks will execute in parallel. To improve efficiency, the thread pool may throttle the threads.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * 
     * @param {PTP_WORK} pwk A pointer to a <b>TP_WORK</b> structure that defines the work object. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolwork">CreateThreadpoolWork</a> function returns this pointer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-submitthreadpoolwork
     * @since windows6.0.6000
     */
    static SubmitThreadpoolWork(pwk) {
        pwk := pwk is Win32Handle ? NumGet(pwk, "ptr") : pwk

        DllCall("KERNEL32.dll\SubmitThreadpoolWork", "ptr", pwk)
    }

    /**
     * Waits for outstanding work callbacks to complete and optionally cancels pending callbacks that have not yet started to execute.
     * @remarks
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_WORK} pwk A pointer to a <b>TP_WORK</b> structure that defines the work object. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolwork">CreateThreadpoolWork</a> function returns this pointer.
     * @param {BOOL} fCancelPendingCallbacks Indicates whether to cancel queued callbacks that have not yet started to execute.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-waitforthreadpoolworkcallbacks
     * @since windows6.0.6000
     */
    static WaitForThreadpoolWorkCallbacks(pwk, fCancelPendingCallbacks) {
        pwk := pwk is Win32Handle ? NumGet(pwk, "ptr") : pwk

        DllCall("KERNEL32.dll\WaitForThreadpoolWorkCallbacks", "ptr", pwk, "int", fCancelPendingCallbacks)
    }

    /**
     * Releases the specified work object.
     * @remarks
     * 
     * The work object is freed immediately if there are no outstanding callbacks; otherwise, the work object is freed asynchronously after the outstanding callbacks complete.
     * 
     * If there is a cleanup group associated with the work object, it is not necessary to call this function; calling the <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolcleanupgroupmembers">CloseThreadpoolCleanupGroupMembers</a> function releases the  work, wait, and timer objects associated with the cleanup group.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_WORK} pwk A pointer to a <b>TP_WORK</b> structure that defines the work object. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolwork">CreateThreadpoolWork</a> function returns this pointer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-closethreadpoolwork
     * @since windows6.0.6000
     */
    static CloseThreadpoolWork(pwk) {
        pwk := pwk is Win32Handle ? NumGet(pwk, "ptr") : pwk

        DllCall("KERNEL32.dll\CloseThreadpoolWork", "ptr", pwk)
    }

    /**
     * Creates a new timer object.
     * @param {Pointer<PTP_TIMER_CALLBACK>} pfnti The callback function to call each time the timer object expires. For details, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms686790(v=vs.85)">TimerCallback</a>.
     * @param {Pointer<Void>} pv Optional application-defined data to pass to the callback function.
     * @param {Pointer<TP_CALLBACK_ENVIRON_V3>} pcbe A <b>TP_CALLBACK_ENVIRON</b> structure that defines the environment in which to execute the callback. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializethreadpoolenvironment">InitializeThreadpoolEnvironment</a> function returns this structure.
     * 
     * If this parameter is NULL, the callback executes in the default callback environment. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializethreadpoolenvironment">InitializeThreadpoolEnvironment</a>.
     * @returns {PTP_TIMER} If the function succeeds, it returns a pointer to a <b>TP_TIMER</b> structure that defines the timer object. Applications do not modify the members of this structure.
     * 
     * If the function fails, it returns NULL. To retrieve extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-createthreadpooltimer
     * @since windows6.0.6000
     */
    static CreateThreadpoolTimer(pfnti, pv, pcbe) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateThreadpoolTimer", "ptr", pfnti, pvMarshal, pv, "ptr", pcbe, "ptr")
        if(A_LastError)
            throw OSError()

        return PTP_TIMER({Value: result}, True)
    }

    /**
     * Sets the timer object�, replacing the previous timer, if any. A worker thread calls the timer object's callback after the specified timeout expires.
     * @remarks
     * 
     * Setting the timer cancels the previous timer, if any.
     * 
     * In some cases, callback functions might run after an application closes the threadpool timer. To prevent this behavior, an application should follow the steps described in <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpooltimer">CloseThreadpoolTimer</a>.
     * 
     * If the due time specified by <i>pftDueTime</i> is relative, the time that the system spends in sleep or hibernation does not count toward the expiration of the timer. The timer is signaled when the cumulative amount of elapsed time the system spends in the waking state equals the timer's relative due time or period. If the  due time specified by <i>pftDueTime</i> is absolute, the time that the system spends in sleep or hibernation does count toward the expiration of the timer. If the timer expires while the system is sleeping, the timer is signaled immediately when the system wakes.
     * 
     * If the due time specified by <i>pftDueTime</i> is zero, then the timer expires immediately.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_TIMER} pti A pointer to a <b>TP_TIMER</b> structure that defines the timer object to set. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpooltimer">CreateThreadpoolTimer</a> function returns this pointer.
     * @param {Pointer<FILETIME>} pftDueTime A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies the absolute or relative time at which the timer should expire.  If positive or zero, it indicates the absolute time since January 1, 1601 (UTC), measured in 100 nanosecond units. If negative, it indicates the amount of time to wait relative to the current time. For more information about time values, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/file-times">File Times</a>.
     * 
     * If this parameter is NULL, the timer object will cease to queue new callbacks (but callbacks already queued will still occur).
     * 
     * The timer is set if the <i>pftDueTime</i> parameter is non-NULL.
     * @param {Integer} msPeriod The timer period, in milliseconds. If this parameter is zero, the timer is signaled once. If this parameter is greater than zero, the timer is periodic. A periodic timer automatically reactivates each time the period elapses, until the timer is canceled.
     * @param {Integer} msWindowLength The maximum amount of time the system can delay before calling the timer callback. If this parameter is set, the system can batch calls to conserve power.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-setthreadpooltimer
     * @since windows6.0.6000
     */
    static SetThreadpoolTimer(pti, pftDueTime, msPeriod, msWindowLength) {
        pti := pti is Win32Handle ? NumGet(pti, "ptr") : pti

        DllCall("KERNEL32.dll\SetThreadpoolTimer", "ptr", pti, "ptr", pftDueTime, "uint", msPeriod, "uint", msWindowLength)
    }

    /**
     * Determines whether the specified timer object is currently set.
     * @param {PTP_TIMER} pti A pointer to a <b>TP_TIMER</b> structure that defines the timer object. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpooltimer">CreateThreadpoolTimer</a> function returns this pointer.
     * @returns {BOOL} The return value is TRUE if the timer is set; otherwise, the return value is FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-isthreadpooltimerset
     * @since windows6.0.6000
     */
    static IsThreadpoolTimerSet(pti) {
        pti := pti is Win32Handle ? NumGet(pti, "ptr") : pti

        result := DllCall("KERNEL32.dll\IsThreadpoolTimerSet", "ptr", pti, "int")
        return result
    }

    /**
     * Waits for outstanding timer callbacks to complete and optionally cancels pending callbacks that have not yet started to execute.
     * @remarks
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_TIMER} pti A pointer to a <b>TP_TIMER</b> structure that defines the timer object. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpooltimer">CreateThreadpoolTimer</a> function returns this pointer.
     * @param {BOOL} fCancelPendingCallbacks Indicates whether to cancel queued callbacks that have not yet started to execute.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-waitforthreadpooltimercallbacks
     * @since windows6.0.6000
     */
    static WaitForThreadpoolTimerCallbacks(pti, fCancelPendingCallbacks) {
        pti := pti is Win32Handle ? NumGet(pti, "ptr") : pti

        DllCall("KERNEL32.dll\WaitForThreadpoolTimerCallbacks", "ptr", pti, "int", fCancelPendingCallbacks)
    }

    /**
     * Releases the specified timer object.
     * @remarks
     * 
     * The timer object is freed immediately if there are no outstanding callbacks; otherwise, the timer object is freed asynchronously after the outstanding callback functions complete. 
     * 
     * In some cases, callback functions might run after <b>CloseThreadpoolTimer</b> has been called. To prevent this behavior: 
     * 
     * * Call the <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-setthreadpooltimer">SetThreadpoolTimer</a> function
     * or <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-setthreadpooltimerex">SetThreadpoolTimerEx</a> function
     * with the <i>pftDueTime</i> parameter set to NULL and the <i>msPeriod</i> and <i>msWindowLength</i> parameters set to 0.
     * * Call the <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-waitforthreadpooltimercallbacks">WaitForThreadpoolTimerCallbacks</a> function.
     * * Call <b>CloseThreadpoolTimer</b>.
     * 
     * If there is a cleanup group associated with the timer object, it is not necessary to call this function; calling the <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolcleanupgroupmembers">CloseThreadpoolCleanupGroupMembers</a> function releases the  work, wait, and timer objects associated with the cleanup group.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_TIMER} pti A pointer to <b>TP_TIMER</b> structure that defines the timer object.
     * The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpooltimer">CreateThreadpoolTimer</a> function returns this pointer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-closethreadpooltimer
     * @since windows6.0.6000
     */
    static CloseThreadpoolTimer(pti) {
        pti := pti is Win32Handle ? NumGet(pti, "ptr") : pti

        DllCall("KERNEL32.dll\CloseThreadpoolTimer", "ptr", pti)
    }

    /**
     * Creates a new wait object.
     * @param {Pointer<PTP_WAIT_CALLBACK>} pfnwa The callback function to call when the wait completes or times out. For details, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms687017(v=vs.85)">WaitCallback</a>.
     * @param {Pointer<Void>} pv Optional application-defined data to pass to the callback function.
     * @param {Pointer<TP_CALLBACK_ENVIRON_V3>} pcbe A <b>TP_CALLBACK_ENVIRON</b> structure that defines the environment in which to execute the callback. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializethreadpoolenvironment">InitializeThreadpoolEnvironment</a> function returns this structure.
     * 
     * If this parameter is NULL, the callback executes in the default callback environment. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializethreadpoolenvironment">InitializeThreadpoolEnvironment</a>.
     * @returns {PTP_WAIT} If the function succeeds, it returns a pointer to a <b>TP_WAIT</b> structure that defines the wait object. Applications do not modify the members of this structure.
     * 
     * If the function fails, it returns NULL. To retrieve extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-createthreadpoolwait
     * @since windows6.0.6000
     */
    static CreateThreadpoolWait(pfnwa, pv, pcbe) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateThreadpoolWait", "ptr", pfnwa, pvMarshal, pv, "ptr", pcbe, "ptr")
        if(A_LastError)
            throw OSError()

        return PTP_WAIT({Value: result}, True)
    }

    /**
     * Sets the wait object�replacing the previous wait object, if any. A worker thread calls the wait object's callback function after the handle becomes signaled or after the specified timeout expires.
     * @remarks
     * 
     * A wait object can wait for only one handle. Setting the handle for a wait object replaces the previous handle, if any.
     * 
     * You must re-register the event with the wait object  before signaling it each time to trigger the wait callback.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * 
     * @param {PTP_WAIT} pwa A pointer to a <b>TP_WAIT</b> structure that defines the wait object. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolwait">CreateThreadpoolWait</a> function returns this pointer.
     * @param {HANDLE} h A handle.
     * 
     * If this parameter is NULL, the wait object will cease to queue new callbacks (but callbacks already queued will still occur).
     * 
     * If this parameter is not NULL, it must refer to a valid waitable object.
     * 
     * If this handle is closed while the wait is still pending, the function's behavior is undefined. If the wait is still pending and the handle must be closed, use <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolwait">CloseThreadpoolWait</a> to cancel the wait and then close the handle.
     * 
     * The wait is considered set if this parameter is non-NULL.
     * @param {Pointer<FILETIME>} pftTimeout A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies the absolute or relative time at which the wait operation should time out.  If this parameter points to a positive value, it indicates the absolute time since January 1, 1601 (UTC), in 100-nanosecond intervals. If this parameter points to a negative value, it indicates the amount of time to wait relative to the current time. For more information about time values, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/file-times">File Times</a>.
     * 
     * If this parameter points to 0, the wait times out immediately. If this parameter is NULL, the wait will not time out.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-setthreadpoolwait
     * @since windows6.0.6000
     */
    static SetThreadpoolWait(pwa, h, pftTimeout) {
        pwa := pwa is Win32Handle ? NumGet(pwa, "ptr") : pwa
        h := h is Win32Handle ? NumGet(h, "ptr") : h

        DllCall("KERNEL32.dll\SetThreadpoolWait", "ptr", pwa, "ptr", h, "ptr", pftTimeout)
    }

    /**
     * Waits for outstanding wait callbacks to complete and optionally cancels pending callbacks that have not yet started to execute.
     * @remarks
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * 
     * @param {PTP_WAIT} pwa A pointer to a <b>TP_WAIT</b> structure that defines the wait object. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolwait">CreateThreadpoolWait</a> function returns this pointer.
     * @param {BOOL} fCancelPendingCallbacks Indicates whether to cancel queued callbacks that have not yet started to execute.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-waitforthreadpoolwaitcallbacks
     * @since windows6.0.6000
     */
    static WaitForThreadpoolWaitCallbacks(pwa, fCancelPendingCallbacks) {
        pwa := pwa is Win32Handle ? NumGet(pwa, "ptr") : pwa

        DllCall("KERNEL32.dll\WaitForThreadpoolWaitCallbacks", "ptr", pwa, "int", fCancelPendingCallbacks)
    }

    /**
     * Releases the specified wait object.
     * @remarks
     * 
     * The wait object is freed immediately if there are no outstanding callbacks; otherwise, the timer object is freed asynchronously after the outstanding callbacks complete.
     * 
     * In some cases, callback functions might run after <b>CloseThreadpoolWait</b> has been called. To prevent this behavior: 
     * 
     * * Call the <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolwait">SetThreadpoolWait</a> function
     * or <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolwaitex">SetThreadpoolWaitEx</a> function
     * with the <i>h</i> parameter set to NULL.
     * * Call the <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-waitforthreadpoolwaitcallbacks">WaitForThreadpoolWaitCallbacks</a> function.
     * * Call <b>CloseThreadpoolWait</b>.
     * 
     * If there is a cleanup group associated with the wait object, it is not necessary to call this function; calling the <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolcleanupgroupmembers">CloseThreadpoolCleanupGroupMembers</a> function releases the  work, wait, and timer objects associated with the cleanup group.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * 
     * @param {PTP_WAIT} pwa A pointer to a <b>TP_WAIT</b> structure that defines the wait object. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolwait">CreateThreadpoolWait</a> function returns this pointer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-closethreadpoolwait
     * @since windows6.0.6000
     */
    static CloseThreadpoolWait(pwa) {
        pwa := pwa is Win32Handle ? NumGet(pwa, "ptr") : pwa

        DllCall("KERNEL32.dll\CloseThreadpoolWait", "ptr", pwa)
    }

    /**
     * Creates a new I/O completion object.
     * @param {HANDLE} fl The file handle to bind to this I/O completion object.
     * @param {Pointer<PTP_WIN32_IO_CALLBACK>} pfnio The callback function to be called each time  an overlapped I/O operation completes on the file. For details, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms684124(v=vs.85)">IoCompletionCallback</a>.
     * @param {Pointer<Void>} pv Optional application-defined data to pass to the callback function.
     * @param {Pointer<TP_CALLBACK_ENVIRON_V3>} pcbe A pointer to a <b>TP_CALLBACK_ENVIRON</b> structure that defines the environment in which to execute the callback. Use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializethreadpoolenvironment">InitializeThreadpoolEnvironment</a> function to initialize the structure before calling this function.
     * 
     * If this parameter is NULL, the callback executes in the default callback environment. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-initializethreadpoolenvironment">InitializeThreadpoolEnvironment</a>.
     * @returns {PTP_IO} If the function succeeds, it returns a pointer to a <b>TP_IO</b> structure that defines the I/O object. Applications do not modify the members of this structure.
     * 
     * If the function fails, it returns NULL. To retrieve extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-createthreadpoolio
     * @since windows6.0.6000
     */
    static CreateThreadpoolIo(fl, pfnio, pv, pcbe) {
        fl := fl is Win32Handle ? NumGet(fl, "ptr") : fl

        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateThreadpoolIo", "ptr", fl, "ptr", pfnio, pvMarshal, pv, "ptr", pcbe, "ptr")
        if(A_LastError)
            throw OSError()

        return PTP_IO({Value: result}, True)
    }

    /**
     * Notifies the thread pool that I/O operations may possibly begin for the specified I/O completion object. A worker thread calls the I/O completion object's callback function after the operation completes on the file handle bound to this object.
     * @remarks
     * 
     * You must call this function before initiating each asynchronous I/O operation on the file handle bound to the I/O completion object. Failure to do so will cause the thread pool to ignore an I/O operation when it completes and will cause memory corruption.
     * 
     * If the I/O operation fails, call the <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-cancelthreadpoolio">CancelThreadpoolIo</a> function to cancel this notification.
     * 
     * If the file handle bound to the I/O completion object has the notification mode FILE_SKIP_COMPLETION_PORT_ON_SUCCESS and an asynchronous I/O operation returns immediately with success, the object's I/O completion callback function is not called and threadpool I/O notifications must be canceled. For more information, see  <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-cancelthreadpoolio">CancelThreadpoolIo</a>.   
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_IO} pio A pointer to a <b>TP_IO</b> structure that defines the I/O completion object. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolio">CreateThreadpoolIo</a> function returns this pointer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-startthreadpoolio
     * @since windows6.0.6000
     */
    static StartThreadpoolIo(pio) {
        pio := pio is Win32Handle ? NumGet(pio, "ptr") : pio

        DllCall("KERNEL32.dll\StartThreadpoolIo", "ptr", pio)
    }

    /**
     * Cancels the notification from the StartThreadpoolIo function.
     * @remarks
     * 
     * To prevent memory leaks, you must call the <b>CancelThreadpoolIo</b> function for either of the following scenarios:
     * 
     * <ul>
     * <li>An overlapped (asynchronous) I/O operation fails (that is, the asynchronous I/O function call returns failure with an error code other than ERROR_IO_PENDING).</li>
     * <li>An asynchronous I/O operation returns immediately with success and the file handle associated with the I/O completion object has the notification mode FILE_SKIP_COMPLETION_PORT_ON_SUCCESS. The file handle will not notify the I/O completion port and the associated I/O callback function will not be called. </li>
     * </ul>
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_IO} pio A pointer to a <b>TP_IO</b> structure that defines the I/O completion object. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolio">CreateThreadpoolIo</a> function returns this pointer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-cancelthreadpoolio
     * @since windows6.0.6000
     */
    static CancelThreadpoolIo(pio) {
        pio := pio is Win32Handle ? NumGet(pio, "ptr") : pio

        DllCall("KERNEL32.dll\CancelThreadpoolIo", "ptr", pio)
    }

    /**
     * Waits for outstanding I/O completion callbacks to complete and optionally cancels pending callbacks that have not yet started to execute.
     * @remarks
     * 
     * When <i>fCancelPendingCallbacks</i> is set to TRUE, only queued callbacks are canceled. Pending I/O requests are not canceled. Therefore, the caller should call <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> for the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure to check whether the I/O operation has completed before freeing the structure. As an alternative, set <i>fCancelPendingCallbacks</i> to FALSE and have the associated I/O completion callback free the <b>OVERLAPPED</b> structure. Be careful not to free the <b>OVERLAPPED</b> structure while I/O requests are still pending; use <b>GetOverlappedResult</b> to determine the status of the I/O operation and wait for the operation to complete. The <a href="https://docs.microsoft.com/windows/desktop/FileIO/cancelioex-func">CancelIoEx</a> function can optionally be used first to cancel outstanding I/O requests, potentially shortening the wait. For more information, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/canceling-pending-i-o-operations">Canceling Pending I/O Operations</a>.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_IO} pio A pointer to a <b>TP_IO</b> structure that defines the I/O completion object. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolio">CreateThreadpoolIo</a> function returns this pointer.
     * @param {BOOL} fCancelPendingCallbacks Indicates whether to cancel queued callbacks that have not yet started to execute.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-waitforthreadpooliocallbacks
     * @since windows6.0.6000
     */
    static WaitForThreadpoolIoCallbacks(pio, fCancelPendingCallbacks) {
        pio := pio is Win32Handle ? NumGet(pio, "ptr") : pio

        DllCall("KERNEL32.dll\WaitForThreadpoolIoCallbacks", "ptr", pio, "int", fCancelPendingCallbacks)
    }

    /**
     * Releases the specified I/O completion object.
     * @remarks
     * 
     * The I/O completion object is freed immediately if there are no outstanding callbacks; otherwise, the I/O completion object is freed asynchronously after the outstanding callbacks complete. 
     * 
     * You should close the associated file handle and wait for all outstanding overlapped I/O operations to complete before calling this function. You must not cause any more overlapped I/O operations to occur after calling this function.
     * 
     * It may be necessary to cancel threadpool I/O notifications to prevent memory leaks. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-cancelthreadpoolio">CancelThreadpoolIo</a>.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0600 or higher.
     * 
     * 
     * @param {PTP_IO} pio A pointer to a <b>TP_IO</b> structure that defines the I/O completion object. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolio">CreateThreadpoolIo</a> function returns this pointer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-closethreadpoolio
     * @since windows6.0.6000
     */
    static CloseThreadpoolIo(pio) {
        pio := pio is Win32Handle ? NumGet(pio, "ptr") : pio

        DllCall("KERNEL32.dll\CloseThreadpoolIo", "ptr", pio)
    }

    /**
     * Sets the timer object�, replacing the previous timer, if any. A worker thread calls the timer object's callback after the specified timeout expires.
     * @param {PTP_TIMER} pti A pointer to a <b>TP_TIMER</b> structure that defines the timer object to set. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpooltimer">CreateThreadpoolTimer</a> function returns this pointer.
     * @param {Pointer<FILETIME>} pftDueTime A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies the absolute or relative time at which the timer should expire.  If this parameter points to a positive value, it indicates the absolute time since January 1, 1601 (UTC), measured in 100 nanosecond units. If this parameter points to a negative value, it indicates the amount of time to wait relative to the current time. If this parameter points to zero, then the timer expires immediately. For more information about time values, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/file-times">File Times</a>.
     * 
     * If this parameter is NULL, the timer object will cease to queue new callbacks (but callbacks already queued will still occur).
     * 
     * The timer is set if the <i>pftDueTime</i> parameter is non-NULL.
     * @param {Integer} msPeriod The timer period, in milliseconds. If this parameter is zero, the timer is signaled once. If this parameter is greater than zero, the timer is periodic. A periodic timer automatically reactivates each time the period elapses, until the timer is canceled.
     * @param {Integer} msWindowLength The maximum amount of time the system can delay before calling the timer callback. If this parameter is set, the system can batch calls to conserve power.
     * @returns {BOOL} Returns TRUE if the timer was previously set and was canceled.
     * Otherwise returns FALSE.
     * 
     * If the timer's previous state was "set", and the function returns FALSE, then a callback is in progress or about to commence.
     * See the remarks for further discussion.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-setthreadpooltimerex
     * @since windows8.0
     */
    static SetThreadpoolTimerEx(pti, pftDueTime, msPeriod, msWindowLength) {
        pti := pti is Win32Handle ? NumGet(pti, "ptr") : pti

        result := DllCall("KERNEL32.dll\SetThreadpoolTimerEx", "ptr", pti, "ptr", pftDueTime, "uint", msPeriod, "uint", msWindowLength, "int")
        return result
    }

    /**
     * Sets the wait object�replacing the previous wait object, if any. A worker thread calls the wait object's callback function after the handle becomes signaled or after the specified timeout expires.
     * @param {PTP_WAIT} pwa A pointer to a <b>TP_WAIT</b> structure that defines the wait object. The <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolwait">CreateThreadpoolWait</a> function returns this pointer.
     * @param {HANDLE} h A handle.
     * 
     * If this parameter is NULL, the wait object will cease to queue new callbacks (but callbacks already queued will still occur).
     * 
     * If this parameter is not NULL, it must refer to a valid waitable object.
     * 
     * If this handle is closed while the wait is still pending, the function's behavior is undefined. If the wait is still pending and the handle must be closed, use <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolwait">CloseThreadpoolWait</a> to cancel the wait and then close the handle.
     * 
     * The wait is considered set if this parameter is non-NULL.
     * @param {Pointer<FILETIME>} pftTimeout A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies the absolute or relative time at which the wait operation should time out.  If this parameter points to a positive value, it indicates the absolute time since January 1, 1601 (UTC), in 100-nanosecond intervals. If this parameter points to a negative value, it indicates the amount of time to wait relative to the current time. If this parameter points to zero, then the wait times out immediately. For more information about time values, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/file-times">File Times</a>.
     * 
     * If this parameter is NULL, then the wait does not time out.
     * @returns {BOOL} Returns TRUE if the wait was previously set and was canceled.
     * Otherwise returns FALSE.
     * 
     * If the wait's previous state was "set", and the function returns FALSE, then a callback is in progress or about to commence.
     * See the remarks for further discussion.
     * @see https://docs.microsoft.com/windows/win32/api//threadpoolapiset/nf-threadpoolapiset-setthreadpoolwaitex
     * @since windows8.0
     */
    static SetThreadpoolWaitEx(pwa, h, pftTimeout) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        pwa := pwa is Win32Handle ? NumGet(pwa, "ptr") : pwa
        h := h is Win32Handle ? NumGet(h, "ptr") : h

        result := DllCall("KERNEL32.dll\SetThreadpoolWaitEx", "ptr", pwa, "ptr", h, "ptr", pftTimeout, "ptr", Reserved, "int")
        return result
    }

    /**
     * Determines whether the specified process is running under WOW64 or an Intel64 of x64 processor.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the PROCESS_QUERY_INFORMATION or PROCESS_QUERY_LIMITED_INFORMATION access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the PROCESS_QUERY_INFORMATION access right.
     * @param {Pointer<BOOL>} Wow64Process A pointer to a value that is set to TRUE if the process is running under WOW64 on an Intel64 or x64 processor. If the process is running under 32-bit Windows, the value is set to FALSE. If the process is a 32-bit application running under 64-bit Windows 10 on ARM, the value is set to FALSE. If the process is a 64-bit application running under 64-bit Windows, the value is also set to FALSE.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wow64apiset/nf-wow64apiset-iswow64process
     * @since windows6.0.6000
     */
    static IsWow64Process(hProcess, Wow64Process) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\IsWow64Process", "ptr", hProcess, "ptr", Wow64Process, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} Machine 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wow64apiset/nf-wow64apiset-wow64setthreaddefaultguestmachine
     */
    static Wow64SetThreadDefaultGuestMachine(Machine) {
        result := DllCall("api-ms-win-core-wow64-l1-1-1.dll\Wow64SetThreadDefaultGuestMachine", "ushort", Machine, "ushort")
        return result
    }

    /**
     * Determines whether the specified process is running under WOW64; also returns additional machine process and architecture information.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Integer>} pProcessMachine On success, returns a pointer to an <a href="https://docs.microsoft.com/windows/desktop/SysInfo/image-file-machine-constants">IMAGE_FILE_MACHINE_*</a> value. The value will be  <b>IMAGE_FILE_MACHINE_UNKNOWN</b> if the target process is not a <a href="https://docs.microsoft.com/windows/desktop/WinProg64/running-32-bit-applications">WOW64</a> process; otherwise, it will identify the type of WoW process.
     * @param {Pointer<Integer>} pNativeMachine On success, returns a pointer to a possible <a href="https://docs.microsoft.com/windows/desktop/SysInfo/image-file-machine-constants">IMAGE_FILE_MACHINE_*</a> value identifying the native architecture of host system.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wow64apiset/nf-wow64apiset-iswow64process2
     * @since windows10.0.10586
     */
    static IsWow64Process2(hProcess, pProcessMachine, pNativeMachine) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        pProcessMachineMarshal := pProcessMachine is VarRef ? "ushort*" : "ptr"
        pNativeMachineMarshal := pNativeMachine is VarRef ? "ushort*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\IsWow64Process2", "ptr", hProcess, pProcessMachineMarshal, pProcessMachine, pNativeMachineMarshal, pNativeMachine, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Suspends the specified WOW64 thread.
     * @param {HANDLE} hThread A handle to the thread that is to be suspended. 
     * 
     * 
     * 
     * 
     * The handle must have the THREAD_SUSPEND_RESUME access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @returns {Integer} If the function succeeds, the return value is the thread's previous suspend count; otherwise, it is (DWORD) -1. To get extended error information, use the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-wow64suspendthread
     * @since windows6.0.6000
     */
    static Wow64SuspendThread(hThread) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\Wow64SuspendThread", "ptr", hThread, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a private namespace.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpPrivateNamespaceAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies the security attributes of the namespace object.
     * @param {Pointer<Void>} lpBoundaryDescriptor A descriptor that defines how the namespace is to be isolated. The caller must be within this boundary. The <a href="https://docs.microsoft.com/windows/desktop/api/namespaceapi/nf-namespaceapi-createboundarydescriptorw">CreateBoundaryDescriptor</a> function creates a boundary descriptor.
     * @param {PWSTR} lpAliasPrefix The prefix for the namespace. To create an object in this namespace, specify the object name as <i>prefix</i>&#92;<i>objectname</i>.
     * 
     * The system supports multiple private namespaces with the same name, as long as they define different boundaries.
     * @returns {HANDLE} If the function succeeds, it returns a handle to the new namespace. 
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//namespaceapi/nf-namespaceapi-createprivatenamespacew
     */
    static CreatePrivateNamespaceW(lpPrivateNamespaceAttributes, lpBoundaryDescriptor, lpAliasPrefix) {
        lpAliasPrefix := lpAliasPrefix is String ? StrPtr(lpAliasPrefix) : lpAliasPrefix

        lpBoundaryDescriptorMarshal := lpBoundaryDescriptor is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\CreatePrivateNamespaceW", "ptr", lpPrivateNamespaceAttributes, lpBoundaryDescriptorMarshal, lpBoundaryDescriptor, "ptr", lpAliasPrefix, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * Opens a private namespace.
     * @param {Pointer<Void>} lpBoundaryDescriptor A descriptor that defines how the namespace is to be isolated. The <a href="https://docs.microsoft.com/windows/desktop/api/namespaceapi/nf-namespaceapi-createboundarydescriptorw">CreateBoundaryDescriptor</a> function creates a boundary descriptor.
     * @param {PWSTR} lpAliasPrefix The prefix for the namespace. To create an object in this namespace, specify the object name as <i>prefix</i>&#92;<i>objectname</i>.
     * @returns {HANDLE} The function returns the handle to the existing namespace.
     * @see https://docs.microsoft.com/windows/win32/api//namespaceapi/nf-namespaceapi-openprivatenamespacew
     */
    static OpenPrivateNamespaceW(lpBoundaryDescriptor, lpAliasPrefix) {
        lpAliasPrefix := lpAliasPrefix is String ? StrPtr(lpAliasPrefix) : lpAliasPrefix

        lpBoundaryDescriptorMarshal := lpBoundaryDescriptor is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\OpenPrivateNamespaceW", lpBoundaryDescriptorMarshal, lpBoundaryDescriptor, "ptr", lpAliasPrefix, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * Closes an open namespace handle.
     * @param {HANDLE} Handle The namespace handle. This handle is created by <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createprivatenamespacea">CreatePrivateNamespace</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openprivatenamespacea">OpenPrivateNamespace</a>.
     * @param {Integer} Flags If this parameter is <b>PRIVATE_NAMESPACE_FLAG_DESTROY</b> (0x00000001), the namespace is destroyed.
     * @returns {BOOLEAN} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//namespaceapi/nf-namespaceapi-closeprivatenamespace
     * @since windows6.0.6000
     */
    static ClosePrivateNamespace(Handle, Flags) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ClosePrivateNamespace", "ptr", Handle, "uint", Flags, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a boundary descriptor.
     * @param {PWSTR} Name The name of the boundary descriptor.
     * @param {Integer} Flags This parameter is reserved for future use.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the boundary descriptor.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//namespaceapi/nf-namespaceapi-createboundarydescriptorw
     */
    static CreateBoundaryDescriptorW(Name, Flags) {
        Name := Name is String ? StrPtr(Name) : Name

        result := DllCall("KERNEL32.dll\CreateBoundaryDescriptorW", "ptr", Name, "uint", Flags, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * Adds a security identifier (SID) to the specified boundary descriptor.
     * @param {Pointer<HANDLE>} BoundaryDescriptor A handle to the boundary descriptor. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createboundarydescriptora">CreateBoundaryDescriptor</a> function returns this handle.
     * @param {PSID} RequiredSid A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//namespaceapi/nf-namespaceapi-addsidtoboundarydescriptor
     * @since windows6.0.6000
     */
    static AddSIDToBoundaryDescriptor(BoundaryDescriptor, RequiredSid) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddSIDToBoundaryDescriptor", "ptr", BoundaryDescriptor, "ptr", RequiredSid, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes the specified boundary descriptor.
     * @remarks
     * 
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0600 or later.
     * 
     * 
     * @param {HANDLE} BoundaryDescriptor A handle to the boundary descriptor. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createboundarydescriptora">CreateBoundaryDescriptor</a> function returns this handle.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//namespaceapi/nf-namespaceapi-deleteboundarydescriptor
     * @since windows6.0.6000
     */
    static DeleteBoundaryDescriptor(BoundaryDescriptor) {
        BoundaryDescriptor := BoundaryDescriptor is Win32Handle ? NumGet(BoundaryDescriptor, "ptr") : BoundaryDescriptor

        DllCall("KERNEL32.dll\DeleteBoundaryDescriptor", "ptr", BoundaryDescriptor)
    }

    /**
     * Retrieves the node that currently has the highest number.
     * @param {Pointer<Integer>} HighestNodeNumber The number of the highest node.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//systemtopologyapi/nf-systemtopologyapi-getnumahighestnodenumber
     * @since windows6.0.6000
     */
    static GetNumaHighestNodeNumber(HighestNodeNumber) {
        HighestNodeNumberMarshal := HighestNodeNumber is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNumaHighestNodeNumber", HighestNodeNumberMarshal, HighestNodeNumber, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the processor mask for a node regardless of the processor group the node belongs to.
     * @param {Integer} Node The node number.
     * @param {Pointer<GROUP_AFFINITY>} ProcessorMask A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-group_affinity">GROUP_AFFINITY</a> structure that receives the processor mask for the specified node. A processor mask is a bit vector in which each bit represents a processor and whether it is in the node.
     * 
     * If the specified node has no processors configured, the <b>Mask</b> member is zero and the <b>Group</b> member is undefined.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//systemtopologyapi/nf-systemtopologyapi-getnumanodeprocessormaskex
     * @since windows6.1
     */
    static GetNumaNodeProcessorMaskEx(Node, ProcessorMask) {
        result := DllCall("KERNEL32.dll\GetNumaNodeProcessorMaskEx", "ushort", Node, "ptr", ProcessorMask, "int")
        return result
    }

    /**
     * Retrieves the multi-group processor mask of the specified node.
     * @param {Integer} NodeNumber Supplies the zero-based node number for the node of interest.
     * @param {Pointer<GROUP_AFFINITY>} ProcessorMasks An array of [GROUP_AFFINITY](../winnt/ns-winnt-group_affinity.md) structures, which upon successful return describes the processor mask of the specified node.
     * 
     * Each element in the array describes a set of processors that belong to the node within a single processor group. There will be one element in the resulting array for each processor group this node has active processors in.
     * @param {Integer} ProcessorMaskCount Specifies the size of the *ProcessorMasks* array, in elements.
     * @param {Pointer<Integer>} RequiredMaskCount On successful return, specifies the number of affinity structures written to the array.
     * 
     * If the input array was too small, the function fails with **ERROR_INSUFFICIENT_BUFFER** and sets the *RequiredMaskCount* parameter to the number of elements required. 
     * 
     * The number of required elements is always less than or equal to the maximum group count returned by [GetMaximumProcessorGroupCount](../winbase/nf-winbase-getmaximumprocessorgroupcount.md).
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero and extended error information can be retrieved by calling [GetLastError](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * 
     * If the array supplied is too small, the error value is **ERROR_INSUFFICIENT_BUFFER** and the RequiredMaskCount parameter is set to the number of elements required.
     * 
     * If the *NodeNumber* supplied is invalid (i.e. greater than the value returned by GetNumaHighestNodeNumber), the error value is **ERROR_INVALID_PARAMETER**.
     * @see https://docs.microsoft.com/windows/win32/api//systemtopologyapi/nf-systemtopologyapi-getnumanodeprocessormask2
     */
    static GetNumaNodeProcessorMask2(NodeNumber, ProcessorMasks, ProcessorMaskCount, RequiredMaskCount) {
        RequiredMaskCountMarshal := RequiredMaskCount is VarRef ? "ushort*" : "ptr"

        result := DllCall("KERNEL32.dll\GetNumaNodeProcessorMask2", "ushort", NodeNumber, "ptr", ProcessorMasks, "ushort", ProcessorMaskCount, RequiredMaskCountMarshal, RequiredMaskCount, "int")
        return result
    }

    /**
     * Retrieves the NUMA node number that corresponds to the specified proximity identifier as a USHORT value.
     * @param {Integer} ProximityId The proximity identifier of the node.
     * @param {Pointer<Integer>} NodeNumber Points to a variable to receive the node number for the specified proximity identifier.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//systemtopologyapi/nf-systemtopologyapi-getnumaproximitynodeex
     * @since windows6.1
     */
    static GetNumaProximityNodeEx(ProximityId, NodeNumber) {
        NodeNumberMarshal := NodeNumber is VarRef ? "ushort*" : "ptr"

        result := DllCall("KERNEL32.dll\GetNumaProximityNodeEx", "uint", ProximityId, NodeNumberMarshal, NodeNumber, "int")
        return result
    }

    /**
     * Retrieves the processor group affinity of the specified process.
     * @param {HANDLE} hProcess A handle to the process.
     * 
     * This handle must have the PROCESS_QUERY_INFORMATION or PROCESS_QUERY_LIMITED_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer<Integer>} GroupCount On input, specifies the number of elements in <i>GroupArray</i> array. On output, specifies the number of processor groups written to the array. If the array is too small, the function fails with ERROR_INSUFFICIENT_BUFFER and sets the <i>GroupCount</i> parameter to the number of elements required.
     * @param {Pointer<Integer>} GroupArray An array of processor group numbers. A group number is included in the array if a thread in the process is assigned to a processor in the group.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, use <a href="/windows/desktop/api/adshlp/nf-adshlp-adsgetlasterror">GetLastError</a>.
     * 
     * If the error value is ERROR_INSUFFICIENT_BUFFER, the <i>GroupCount</i> parameter contains the required buffer size in number of elements.
     * @see https://docs.microsoft.com/windows/win32/api//processtopologyapi/nf-processtopologyapi-getprocessgroupaffinity
     * @since windows6.1
     */
    static GetProcessGroupAffinity(hProcess, GroupCount, GroupArray) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        GroupCountMarshal := GroupCount is VarRef ? "ushort*" : "ptr"
        GroupArrayMarshal := GroupArray is VarRef ? "ushort*" : "ptr"

        result := DllCall("KERNEL32.dll\GetProcessGroupAffinity", "ptr", hProcess, GroupCountMarshal, GroupCount, GroupArrayMarshal, GroupArray, "int")
        return result
    }

    /**
     * Retrieves the processor group affinity of the specified thread.
     * @param {HANDLE} hThread A handle to the thread for which the processor group affinity is desired. 
     * 
     * The handle must have the THREAD_QUERY_INFORMATION or THREAD_QUERY_LIMITED_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Pointer<GROUP_AFFINITY>} GroupAffinity A pointer to a GROUP_AFFINITY structure to receive the group affinity of the thread.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, use <a href="/windows/desktop/api/adshlp/nf-adshlp-adsgetlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processtopologyapi/nf-processtopologyapi-getthreadgroupaffinity
     * @since windows6.1
     */
    static GetThreadGroupAffinity(hThread, GroupAffinity) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        result := DllCall("KERNEL32.dll\GetThreadGroupAffinity", "ptr", hThread, "ptr", GroupAffinity, "int")
        return result
    }

    /**
     * Sets the processor group affinity for the specified thread.
     * @param {HANDLE} hThread A handle to the thread. 
     * 
     * The handle must have the THREAD_SET_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Pointer<GROUP_AFFINITY>} GroupAffinity A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-group_affinity">GROUP_AFFINITY</a> structure that specifies the processor group affinity to be used for the specified thread.
     * @param {Pointer<GROUP_AFFINITY>} PreviousGroupAffinity A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-group_affinity">GROUP_AFFINITY</a> structure to receive the thread's previous group affinity. This parameter can be NULL.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, use <a href="/windows/desktop/api/adshlp/nf-adshlp-adsgetlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processtopologyapi/nf-processtopologyapi-setthreadgroupaffinity
     * @since windows6.1
     */
    static SetThreadGroupAffinity(hThread, GroupAffinity, PreviousGroupAffinity) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        result := DllCall("KERNEL32.dll\SetThreadGroupAffinity", "ptr", hThread, "ptr", GroupAffinity, "ptr", PreviousGroupAffinity, "int")
        return result
    }

    /**
     * Associates the calling thread with the specified task.
     * @param {PSTR} TaskName The name of the task to be performed. This name must match the name of one of the subkeys of the following key <b>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks</b>.
     * @param {Pointer<Integer>} TaskIndex The unique task identifier. The first time this function is called, this value must be 0 on input. The index value is returned on output and can be used as input in subsequent calls.
     * @returns {HANDLE} If the function succeeds, it returns a handle to the task. 
     * 
     * If the function fails, it returns 0. To retrieve extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * 
     * The following are possible error codes.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TASK_INDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either <i>TaskIndex</i> is not 0 on the first call or is not recognized value (on subsequent calls).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TASK_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified task does not match any of the tasks stored in the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PRIVILEGE_NOT_HELD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privilege.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//avrt/nf-avrt-avsetmmthreadcharacteristicsa
     * @since windows6.0.6000
     */
    static AvSetMmThreadCharacteristicsA(TaskName, TaskIndex) {
        TaskName := TaskName is String ? StrPtr(TaskName) : TaskName

        TaskIndexMarshal := TaskIndex is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("AVRT.dll\AvSetMmThreadCharacteristicsA", "ptr", TaskName, TaskIndexMarshal, TaskIndex, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Associates the calling thread with the specified task.
     * @param {PWSTR} TaskName The name of the task to be performed. This name must match the name of one of the subkeys of the following key <b>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks</b>.
     * @param {Pointer<Integer>} TaskIndex The unique task identifier. The first time this function is called, this value must be 0 on input. The index value is returned on output and can be used as input in subsequent calls.
     * @returns {HANDLE} If the function succeeds, it returns a handle to the task. 
     * 
     * If the function fails, it returns 0. To retrieve extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * 
     * The following are possible error codes.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TASK_INDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either <i>TaskIndex</i> is not 0 on the first call or is not recognized value (on subsequent calls).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TASK_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified task does not match any of the tasks stored in the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PRIVILEGE_NOT_HELD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privilege.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//avrt/nf-avrt-avsetmmthreadcharacteristicsw
     * @since windows6.0.6000
     */
    static AvSetMmThreadCharacteristicsW(TaskName, TaskIndex) {
        TaskName := TaskName is String ? StrPtr(TaskName) : TaskName

        TaskIndexMarshal := TaskIndex is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("AVRT.dll\AvSetMmThreadCharacteristicsW", "ptr", TaskName, TaskIndexMarshal, TaskIndex, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Associates the calling thread with the specified tasks.
     * @param {PSTR} FirstTask The name of the first task to be performed. This name must match the name of one of the subkeys of the following key <b>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks</b>.
     * @param {PSTR} SecondTask The name of the second task to be performed. This name must match the name of one of the subkeys of the following key <b>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks</b>.
     * @param {Pointer<Integer>} TaskIndex The unique task identifier. The first time this function is called, this value must be 0 on input. The index value is returned on output and can be used as input in subsequent calls.
     * @returns {HANDLE} If the function succeeds, it returns a handle to the task. 
     * 
     * If the function fails, it returns 0. To retrieve extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * 
     * The following are possible error codes.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TASK_INDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either <i>TaskIndex</i> is not 0 on the first call or is not recognized value (on subsequent calls).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TASK_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified task does not match any of the tasks stored in the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PRIVILEGE_NOT_HELD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privilege.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//avrt/nf-avrt-avsetmmmaxthreadcharacteristicsa
     * @since windows6.0.6000
     */
    static AvSetMmMaxThreadCharacteristicsA(FirstTask, SecondTask, TaskIndex) {
        FirstTask := FirstTask is String ? StrPtr(FirstTask) : FirstTask
        SecondTask := SecondTask is String ? StrPtr(SecondTask) : SecondTask

        TaskIndexMarshal := TaskIndex is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("AVRT.dll\AvSetMmMaxThreadCharacteristicsA", "ptr", FirstTask, "ptr", SecondTask, TaskIndexMarshal, TaskIndex, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Associates the calling thread with the specified tasks.
     * @param {PWSTR} FirstTask The name of the first task to be performed. This name must match the name of one of the subkeys of the following key <b>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks</b>.
     * @param {PWSTR} SecondTask The name of the second task to be performed. This name must match the name of one of the subkeys of the following key <b>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks</b>.
     * @param {Pointer<Integer>} TaskIndex The unique task identifier. The first time this function is called, this value must be 0 on input. The index value is returned on output and can be used as input in subsequent calls.
     * @returns {HANDLE} If the function succeeds, it returns a handle to the task. 
     * 
     * If the function fails, it returns 0. To retrieve extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * 
     * The following are possible error codes.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TASK_INDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either <i>TaskIndex</i> is not 0 on the first call or is not recognized value (on subsequent calls).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TASK_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified task does not match any of the tasks stored in the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PRIVILEGE_NOT_HELD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privilege.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//avrt/nf-avrt-avsetmmmaxthreadcharacteristicsw
     * @since windows6.0.6000
     */
    static AvSetMmMaxThreadCharacteristicsW(FirstTask, SecondTask, TaskIndex) {
        FirstTask := FirstTask is String ? StrPtr(FirstTask) : FirstTask
        SecondTask := SecondTask is String ? StrPtr(SecondTask) : SecondTask

        TaskIndexMarshal := TaskIndex is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("AVRT.dll\AvSetMmMaxThreadCharacteristicsW", "ptr", FirstTask, "ptr", SecondTask, TaskIndexMarshal, TaskIndex, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Indicates that a thread is no longer performing work associated with the specified task.
     * @param {HANDLE} AvrtHandle A handle to the task. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avsetmmthreadcharacteristicsa">AvSetMmThreadCharacteristics</a> or <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avsetmmmaxthreadcharacteristicsa">AvSetMmMaxThreadCharacteristics</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//avrt/nf-avrt-avrevertmmthreadcharacteristics
     * @since windows6.0.6000
     */
    static AvRevertMmThreadCharacteristics(AvrtHandle) {
        AvrtHandle := AvrtHandle is Win32Handle ? NumGet(AvrtHandle, "ptr") : AvrtHandle

        A_LastError := 0

        result := DllCall("AVRT.dll\AvRevertMmThreadCharacteristics", "ptr", AvrtHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adjusts the thread priority of the calling thread relative to other threads performing the same task.
     * @param {HANDLE} AvrtHandle A handle to the task. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avsetmmthreadcharacteristicsa">AvSetMmThreadCharacteristics</a> or <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avsetmmmaxthreadcharacteristicsa">AvSetMmMaxThreadCharacteristics</a> function.
     * @param {Integer} Priority 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//avrt/nf-avrt-avsetmmthreadpriority
     * @since windows6.0.6000
     */
    static AvSetMmThreadPriority(AvrtHandle, Priority) {
        AvrtHandle := AvrtHandle is Win32Handle ? NumGet(AvrtHandle, "ptr") : AvrtHandle

        A_LastError := 0

        result := DllCall("AVRT.dll\AvSetMmThreadPriority", "ptr", AvrtHandle, "int", Priority, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a thread ordering group.
     * @param {Pointer<HANDLE>} Context A pointer to a context handle.
     * @param {Pointer<Integer>} Period A pointer to a value, in 100-nanosecond increments, that specifies the period for the thread ordering group. Each thread in the thread ordering group runs one time during this period. If all threads complete their execution before a period ends, all threads wait until the remainder of the period elapses before any are executed again.
     * 
     * The possible values for this parameter depend on the platform, but this parameter can be as low as 500 microseconds or as high as 0x1FFFFFFFFFFFFFFF. If this parameter is less than 500 microseconds, then it is set to 500 microseconds. If this parameter is greater than the maximum, then it is set to 0x1FFFFFFFFFFFFFFF.
     * @param {Pointer<Guid>} ThreadOrderingGuid A pointer to the unique identifier for the thread ordering group to be created. If this value is not unique to the thread ordering service, the function fails.
     * 
     * If the identifier is GUID_NULL on input, the thread ordering service generates and returns a unique identifier.
     * @param {Pointer<Integer>} Timeout A pointer to a time-out value. All threads within the group should complete their execution within <i>Period</i> plus <i>Timeout</i>.
     * 
     * If a thread fails to complete its processing within the period plus this time-out interval, it is removed from the thread ordering group. If the parent fails to complete its processing within the period plus the time-out interval, the thread ordering group is destroyed.
     * 
     * The possible values for this parameter depend on the platform, but can be as low as 500 microseconds or as high as 0x1FFFFFFFFFFFFFFF. If this parameter is less than 500 microseconds, then it is set to 500 microseconds. If this parameter is greater than the maximum, then it is set to 0x1FFFFFFFFFFFFFFF.
     * 
     * If this parameter is <b>NULL</b> or 0, the default is five times the value of <i>Period</i>.
     * 
     * If this parameter is THREAD_ORDER_GROUP_INFINITE_TIMEOUT, the group is created with an infinite time-out interval. This can be useful for debugging purposes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If a thread ordering group with the specified identifier already exists, the function fails and sets the last error to ERROR_ALREADY_EXISTS.
     * @see https://docs.microsoft.com/windows/win32/api//avrt/nf-avrt-avrtcreatethreadorderinggroup
     * @since windows6.0.6000
     */
    static AvRtCreateThreadOrderingGroup(Context, Period, ThreadOrderingGuid, Timeout) {
        PeriodMarshal := Period is VarRef ? "int64*" : "ptr"
        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        A_LastError := 0

        result := DllCall("AVRT.dll\AvRtCreateThreadOrderingGroup", "ptr", Context, PeriodMarshal, Period, "ptr", ThreadOrderingGuid, TimeoutMarshal, Timeout, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a thread ordering group and associates the server thread with a task.
     * @param {Pointer<HANDLE>} Context A pointer to a context handle.
     * @param {Pointer<Integer>} Period A pointer to a value, in 100-nanosecond increments, that specifies the period for the thread ordering group. Each thread in the thread ordering group runs one time during this period. If all threads complete their execution before a period ends, all threads wait until the remainder of the period elapses before any are executed again.
     * 
     * The possible values for this parameter depend on the platform, but this parameter can be as low as 500 microseconds or as high as 0x1FFFFFFFFFFFFFFF. If this parameter is less than 500 microseconds, then it is set to 500 microseconds. If this parameter is greater than the maximum, then it is set to 0x1FFFFFFFFFFFFFFF.
     * @param {Pointer<Guid>} ThreadOrderingGuid A pointer to the unique identifier for the thread ordering group to be created. If this value is not unique to the thread ordering service, the function fails.
     * 
     * If the identifier is GUID_NULL on input, the thread ordering service generates and returns a unique identifier.
     * @param {Pointer<Integer>} Timeout A pointer to a time-out value. All threads within the group should complete their execution within <i>Period</i> plus <i>Timeout</i>.
     * 
     * If a thread fails to complete its processing within the period plus this time-out interval, it is removed from the thread ordering group. If the parent fails to complete its processing within the period plus the time-out interval, the thread ordering group is destroyed.
     * 
     * The possible values for this parameter depend on the platform, but can be as low as 500 microseconds or as high as 0x1FFFFFFFFFFFFFFF. If this parameter is less than 500 microseconds, then it is set to 500 microseconds. If this parameter is greater than the maximum, then it is set to 0x1FFFFFFFFFFFFFFF.
     * 
     * If this parameter is <b>NULL</b> or 0, the default is five times the value of <i>Period</i>.
     * 
     * If this parameter is THREAD_ORDER_GROUP_INFINITE_TIMEOUT, the group is created with an infinite time-out interval. This can be useful for debugging purposes.
     * @param {PSTR} TaskName The name of the task.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If a thread ordering group with the specified identifier already exists, the function fails and sets the last error to ERROR_ALREADY_EXISTS.
     * @see https://docs.microsoft.com/windows/win32/api//avrt/nf-avrt-avrtcreatethreadorderinggroupexa
     * @since windows6.0.6000
     */
    static AvRtCreateThreadOrderingGroupExA(Context, Period, ThreadOrderingGuid, Timeout, TaskName) {
        TaskName := TaskName is String ? StrPtr(TaskName) : TaskName

        PeriodMarshal := Period is VarRef ? "int64*" : "ptr"
        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        A_LastError := 0

        result := DllCall("AVRT.dll\AvRtCreateThreadOrderingGroupExA", "ptr", Context, PeriodMarshal, Period, "ptr", ThreadOrderingGuid, TimeoutMarshal, Timeout, "ptr", TaskName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a thread ordering group and associates the server thread with a task.
     * @param {Pointer<HANDLE>} Context A pointer to a context handle.
     * @param {Pointer<Integer>} Period A pointer to a value, in 100-nanosecond increments, that specifies the period for the thread ordering group. Each thread in the thread ordering group runs one time during this period. If all threads complete their execution before a period ends, all threads wait until the remainder of the period elapses before any are executed again.
     * 
     * The possible values for this parameter depend on the platform, but this parameter can be as low as 500 microseconds or as high as 0x1FFFFFFFFFFFFFFF. If this parameter is less than 500 microseconds, then it is set to 500 microseconds. If this parameter is greater than the maximum, then it is set to 0x1FFFFFFFFFFFFFFF.
     * @param {Pointer<Guid>} ThreadOrderingGuid A pointer to the unique identifier for the thread ordering group to be created. If this value is not unique to the thread ordering service, the function fails.
     * 
     * If the identifier is GUID_NULL on input, the thread ordering service generates and returns a unique identifier.
     * @param {Pointer<Integer>} Timeout A pointer to a time-out value. All threads within the group should complete their execution within <i>Period</i> plus <i>Timeout</i>.
     * 
     * If a thread fails to complete its processing within the period plus this time-out interval, it is removed from the thread ordering group. If the parent fails to complete its processing within the period plus the time-out interval, the thread ordering group is destroyed.
     * 
     * The possible values for this parameter depend on the platform, but can be as low as 500 microseconds or as high as 0x1FFFFFFFFFFFFFFF. If this parameter is less than 500 microseconds, then it is set to 500 microseconds. If this parameter is greater than the maximum, then it is set to 0x1FFFFFFFFFFFFFFF.
     * 
     * If this parameter is <b>NULL</b> or 0, the default is five times the value of <i>Period</i>.
     * 
     * If this parameter is THREAD_ORDER_GROUP_INFINITE_TIMEOUT, the group is created with an infinite time-out interval. This can be useful for debugging purposes.
     * @param {PWSTR} TaskName The name of the task.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If a thread ordering group with the specified identifier already exists, the function fails and sets the last error to ERROR_ALREADY_EXISTS.
     * @see https://docs.microsoft.com/windows/win32/api//avrt/nf-avrt-avrtcreatethreadorderinggroupexw
     * @since windows6.0.6000
     */
    static AvRtCreateThreadOrderingGroupExW(Context, Period, ThreadOrderingGuid, Timeout, TaskName) {
        TaskName := TaskName is String ? StrPtr(TaskName) : TaskName

        PeriodMarshal := Period is VarRef ? "int64*" : "ptr"
        TimeoutMarshal := Timeout is VarRef ? "int64*" : "ptr"

        A_LastError := 0

        result := DllCall("AVRT.dll\AvRtCreateThreadOrderingGroupExW", "ptr", Context, PeriodMarshal, Period, "ptr", ThreadOrderingGuid, TimeoutMarshal, Timeout, "ptr", TaskName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Joins client threads to a thread ordering group.
     * @param {Pointer<HANDLE>} Context A pointer to a context handle.
     * @param {Pointer<Guid>} ThreadOrderingGuid A pointer to the unique identifier for the thread ordering group.
     * @param {BOOL} Before The thread order. If this parameter is <b>TRUE</b>, the thread is a predecessor thread that is scheduled to run before the parent thread. If this parameter is <b>FALSE</b>, the thread is a successor thread that is scheduled to run after the parent thread.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//avrt/nf-avrt-avrtjointhreadorderinggroup
     * @since windows6.0.6000
     */
    static AvRtJoinThreadOrderingGroup(Context, ThreadOrderingGuid, Before) {
        A_LastError := 0

        result := DllCall("AVRT.dll\AvRtJoinThreadOrderingGroup", "ptr", Context, "ptr", ThreadOrderingGuid, "int", Before, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables client threads of a thread ordering group to wait until they should execute.
     * @param {HANDLE} Context A context handle. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avrtcreatethreadorderinggroup">AvRtCreateThreadOrderingGroup</a> or <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avrtjointhreadorderinggroup">AvRtJoinThreadOrderingGroup</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//avrt/nf-avrt-avrtwaitonthreadorderinggroup
     * @since windows6.0.6000
     */
    static AvRtWaitOnThreadOrderingGroup(Context) {
        Context := Context is Win32Handle ? NumGet(Context, "ptr") : Context

        A_LastError := 0

        result := DllCall("AVRT.dll\AvRtWaitOnThreadOrderingGroup", "ptr", Context, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables client threads to leave a thread ordering group.
     * @param {HANDLE} Context A context handle. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avrtjointhreadorderinggroup">AvRtJoinThreadOrderingGroup</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//avrt/nf-avrt-avrtleavethreadorderinggroup
     * @since windows6.0.6000
     */
    static AvRtLeaveThreadOrderingGroup(Context) {
        Context := Context is Win32Handle ? NumGet(Context, "ptr") : Context

        A_LastError := 0

        result := DllCall("AVRT.dll\AvRtLeaveThreadOrderingGroup", "ptr", Context, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes the specified thread ordering group created by the caller. It cleans up resources for the thread ordering group, including the context information, and returns.
     * @param {HANDLE} Context A context handle. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avrtcreatethreadorderinggroup">AvRtCreateThreadOrderingGroup</a> function when creating the group.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//avrt/nf-avrt-avrtdeletethreadorderinggroup
     * @since windows6.0.6000
     */
    static AvRtDeleteThreadOrderingGroup(Context) {
        Context := Context is Win32Handle ? NumGet(Context, "ptr") : Context

        A_LastError := 0

        result := DllCall("AVRT.dll\AvRtDeleteThreadOrderingGroup", "ptr", Context, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the system responsiveness setting used by the multimedia class scheduler service.
     * @param {HANDLE} AvrtHandle A handle to the task. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avsetmmthreadcharacteristicsa">AvSetMmThreadCharacteristics</a> or <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avsetmmmaxthreadcharacteristicsa">AvSetMmMaxThreadCharacteristics</a> function.
     * @param {Pointer<Integer>} SystemResponsivenessValue The system responsiveness value. This value can range from 10 to 100 percent.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//avrt/nf-avrt-avquerysystemresponsiveness
     * @since windows6.0.6000
     */
    static AvQuerySystemResponsiveness(AvrtHandle, SystemResponsivenessValue) {
        AvrtHandle := AvrtHandle is Win32Handle ? NumGet(AvrtHandle, "ptr") : AvrtHandle

        SystemResponsivenessValueMarshal := SystemResponsivenessValue is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("AVRT.dll\AvQuerySystemResponsiveness", "ptr", AvrtHandle, SystemResponsivenessValueMarshal, SystemResponsivenessValue, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes the platform.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqstartup
     * @since windows8.1
     */
    static RtwqStartup() {
        result := DllCall("RTWorkQ.dll\RtwqStartup", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Shuts down the platform. Call this function once for every call to RtwqStartup. Do not call this function from work queue threads.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqshutdown
     * @since windows8.1
     */
    static RtwqShutdown() {
        result := DllCall("RTWorkQ.dll\RtwqShutdown", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Locks a work queue.
     * @param {Integer} workQueueId The identifier for the work queue. The identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqallocateworkqueue">RtwqAllocateWorkQueue</a> function.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqlockworkqueue
     * @since windows8.1
     */
    static RtwqLockWorkQueue(workQueueId) {
        result := DllCall("RTWorkQ.dll\RtwqLockWorkQueue", "uint", workQueueId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unlocks a work queue.
     * @param {Integer} workQueueId Identifier for the work queue to be unlocked. This identifier is returned by the  <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqallocateserialworkqueue">RtwqAllocateSerialWorkQueue</a>, <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqallocateworkqueue">RtwqAllocateWorkQueue</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqlocksharedworkqueue">RtwqLockSharedWorkQueue</a> functions.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqunlockworkqueue
     * @since windows8.1
     */
    static RtwqUnlockWorkQueue(workQueueId) {
        result := DllCall("RTWorkQ.dll\RtwqUnlockWorkQueue", "uint", workQueueId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Obtains and locks a shared work queue.
     * @param {PWSTR} usageClass The name of the Multimedia Class Scheduler Service (MMCSS) task.
     * @param {Integer} basePriority The base priority of the work-queue threads. If the regular-priority queue is being used (<c>usageClass=""</c>), then the value 0 must be passed in.
     * @param {Pointer<Integer>} taskId The MMCSS task identifier. On input, specify an existing MCCSS task group ID, or use the value zero to create a new task group. If the regular priority queue is being used (<c>usageClass=""</c>), then <b>NULL</b> must be passed in. On output, receives the actual task group ID.
     * @param {Pointer<Integer>} id Receives an identifier for the new work queue. Use this identifier when queuing work items.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqlocksharedworkqueue
     * @since windows8.1
     */
    static RtwqLockSharedWorkQueue(usageClass, basePriority, taskId, id) {
        usageClass := usageClass is String ? StrPtr(usageClass) : usageClass

        taskIdMarshal := taskId is VarRef ? "uint*" : "ptr"
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := DllCall("RTWorkQ.dll\RtwqLockSharedWorkQueue", "ptr", usageClass, "int", basePriority, taskIdMarshal, taskId, idMarshal, id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Associates a work queue with an input/output (I/O) handle.
     * @param {Integer} workQueueId The ID of the work queue to redirect the I/O handle into.
     * @param {HANDLE} hFile The network I/O handle.
     * @param {Pointer<HANDLE>} out A cookie that represents the association between the network and I/O handles.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqjoinworkqueue
     * @since windows8.1
     */
    static RtwqJoinWorkQueue(workQueueId, hFile, out) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        result := DllCall("RTWorkQ.dll\RtwqJoinWorkQueue", "uint", workQueueId, "ptr", hFile, "ptr", out, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Disassociates a work queue from an input/output (I/O) handle.
     * @param {Integer} workQueueId The ID of the work queue to disassociate.
     * @param {HANDLE} hFile The associated  handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqjoinworkqueue">RtwqJoinWorkQueue</a> function.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqunjoinworkqueue
     * @since windows8.1
     */
    static RtwqUnjoinWorkQueue(workQueueId, hFile) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        result := DllCall("RTWorkQ.dll\RtwqUnjoinWorkQueue", "uint", workQueueId, "ptr", hFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an asynchronous result object. Use this function if you are implementing an asynchronous method.
     * @param {IUnknown} appObject Pointer to the object stored in the asynchronous result. This pointer is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-irtwqasyncresult-getobject">IRtwqAsyncResult::GetObject</a> method. This parameter can be <b>NULL</b>.
     * @param {IRtwqAsyncCallback} callback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nn-rtworkq-irtwqasynccallback">IRtwqAsyncCallback</a> interface. This interface is implemented by the caller of the asynchronous method.
     * @param {IUnknown} appState Pointer to the <b>IUnknown</b> interface of a state object. This value is provided by the caller of the asynchronous method. This parameter can be <b>NULL</b>.
     * @param {Pointer<IRtwqAsyncResult>} asyncResult Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nn-rtworkq-irtwqasyncresult">IRtwqAsyncResult</a> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqcreateasyncresult
     * @since windows8.1
     */
    static RtwqCreateAsyncResult(appObject, callback, appState, asyncResult) {
        result := DllCall("RTWorkQ.dll\RtwqCreateAsyncResult", "ptr", appObject, "ptr", callback, "ptr", appState, "ptr*", asyncResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Invokes a callback method to complete an asynchronous operation.
     * @param {IRtwqAsyncResult} result The asynchronous result. To create this object, call <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqcreateasyncresult">RtwqCreateAsyncResult</a>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqinvokecallback
     * @since windows8.1
     */
    static RtwqInvokeCallback(result) {
        result := DllCall("RTWorkQ.dll\RtwqInvokeCallback", "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds a reference to indicate to the platform that there are still pending asynchronous items. Blocks the RtwqShutdown function if there are active asynchronous items.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqlockplatform
     * @since windows8.1
     */
    static RtwqLockPlatform() {
        result := DllCall("RTWorkQ.dll\RtwqLockPlatform", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unlocks the platform after it was locked by a call to the RtwqLockPlatform function.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqunlockplatform
     * @since windows8.1
     */
    static RtwqUnlockPlatform() {
        result := DllCall("RTWorkQ.dll\RtwqUnlockPlatform", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers the standard platform work queues with the Multimedia Class Scheduler Service (MMCSS).
     * @param {PWSTR} usageClass The name of the MMCSS task.
     * @param {Pointer<Integer>} taskId The MMCSS task identifier. On input, specify an existing MCCSS task group ID, or use the value zero to create a new task group. On output, receives the actual task group ID.
     * @param {Integer} lPriority The base priority of the work-queue threads.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqregisterplatformwithmmcss
     * @since windows8.1
     */
    static RtwqRegisterPlatformWithMMCSS(usageClass, taskId, lPriority) {
        usageClass := usageClass is String ? StrPtr(usageClass) : usageClass

        taskIdMarshal := taskId is VarRef ? "uint*" : "ptr"

        result := DllCall("RTWorkQ.dll\RtwqRegisterPlatformWithMMCSS", "ptr", usageClass, taskIdMarshal, taskId, "int", lPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unregisters the platform work queues from a Multimedia Class Scheduler Service (MMCSS) task.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqunregisterplatformfrommmcss
     * @since windows8.1
     */
    static RtwqUnregisterPlatformFromMMCSS() {
        result := DllCall("RTWorkQ.dll\RtwqUnregisterPlatformFromMMCSS", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Puts an asynchronous operation on a work queue.
     * @param {Integer} dwQueue The identifier for the work queue. This value can specify one of the standard work queues, or a work queue created by the app. To access to a work queue, call [RtwqLockSharedWorkQueue](./nf-rtworkq-rtwqlocksharedworkqueue.md).
     * @param {Integer} lPriority The priority of the work item. Work items are performed in order of priority. This value should be -1, 0, or 1, where -1 is the lowest priority and 1 is the highest priority.
     * @param {IRtwqAsyncResult} result A pointer to the callback .  The caller must implement this interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqputworkitem
     * @since windows8.1
     */
    static RtwqPutWorkItem(dwQueue, lPriority, result) {
        result := DllCall("RTWorkQ.dll\RtwqPutWorkItem", "uint", dwQueue, "int", lPriority, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Queues a work item that waits for an event to be signaled.
     * @param {HANDLE} hEvent A handle to an event object, such as an event or timer. To create an event object, call <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventexa">CreateEventEx</a>.
     * @param {Integer} lPriority The priority of the work item. Work items are performed in order of priority.
     * @param {IRtwqAsyncResult} result A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nn-rtworkq-irtwqasyncresult">IRtwqAsyncResult</a> interface of an asynchronous result object. To create the result object, call <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqcreateasyncresult">RtwqCreateAsyncResult</a>.
     * @param {Pointer<Integer>} key Receives a key that can be used to cancel the wait. To cancel the wait, call <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqcancelworkitem">RtwqCancelWorkItem</a> and pass this key in the <i>Key</i> parameter. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqputwaitingworkitem
     * @since windows8.1
     */
    static RtwqPutWaitingWorkItem(hEvent, lPriority, result, key) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        keyMarshal := key is VarRef ? "uint*" : "ptr"

        result := DllCall("RTWorkQ.dll\RtwqPutWaitingWorkItem", "ptr", hEvent, "int", lPriority, "ptr", result, keyMarshal, key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a virtual work queue on top of another work queue that is guaranteed to serialize work items. The serial work queue wraps an existing multithreaded work queue. The serial work queue enforces a first-in, first-out (FIFO) execution order.
     * @param {Integer} workQueueIdIn The identifier of an existing work queue. This must be either a multithreaded queue or another serial work queue. Any of the following can be used:
     * 
     * <ul>
     * <li>The default work queue  (<b>RTWQ_STANDARD_WORKQUEUE</b>).  See <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/ne-rtworkq-rtwq_workqueue_type">RTWQ_WORKQUEUE_TYPE</a>.</li>
     * <li>The platform multithreaded queue (<b>RTWQ_MULTITHREADED_WORKQUEUE</b>). See <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/ne-rtworkq-rtwq_workqueue_type">RTWQ_WORKQUEUE_TYPE</a>.</li>
     * <li>A multithreaded queue returned by the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqlocksharedworkqueue">RtwqLockSharedWorkQueue</a>  function.</li>
     * <li>A serial queue created by the <b>RtwqAllocateSerialWorkQueue</b> function.</li>
     * </ul>
     * @param {Pointer<Integer>} workQueueIdOut Receives an identifier for the new serial work queue. Use this identifier when queuing work items.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application exceeded the maximum number of work queues.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RTWQ_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application did not call <a href="/windows/desktop/api/rtworkq/nf-rtworkq-rtwqstartup">RtwqStartup</a>, or the application has already called <a href="/windows/desktop/api/rtworkq/nf-rtworkq-rtwqshutdown">RtwqShutdown</a>.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqallocateserialworkqueue
     * @since windows8.1
     */
    static RtwqAllocateSerialWorkQueue(workQueueIdIn, workQueueIdOut) {
        workQueueIdOutMarshal := workQueueIdOut is VarRef ? "uint*" : "ptr"

        result := DllCall("RTWorkQ.dll\RtwqAllocateSerialWorkQueue", "uint", workQueueIdIn, workQueueIdOutMarshal, workQueueIdOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Schedules an asynchronous operation to be completed after a specified interval.
     * @param {IRtwqAsyncResult} result A pointer to the callback. The caller must implement this interface.
     * @param {Integer} Timeout Time-out interval, in milliseconds. Set this parameter to a negative value. The callback is invoked after <i>−Timeout</i> milliseconds. For example, if <i>Timeout</i> is −5000, the callback is invoked after 5000 milliseconds.
     * @param {Pointer<Integer>} key Receives a key that can be used to cancel the timer. To cancel the wait, call <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqcancelworkitem">RtwqCancelWorkItem</a> and pass this key in the <i>Key</i> parameter.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqscheduleworkitem
     * @since windows8.1
     */
    static RtwqScheduleWorkItem(result, Timeout, key) {
        keyMarshal := key is VarRef ? "uint*" : "ptr"

        result := DllCall("RTWorkQ.dll\RtwqScheduleWorkItem", "ptr", result, "int64", Timeout, keyMarshal, key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets a callback function to be called at a fixed interval.
     * @param {Pointer<RTWQPERIODICCALLBACK>} Callback Pointer to the callback function.
     * @param {IUnknown} context Pointer to a caller-provided object that implements <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, or <b>NULL</b>. This parameter is passed to the callback function.
     * @param {Pointer<Integer>} key Receives a key that can be used to cancel the callback. To cancel the callback, call <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqremoveperiodiccallback">RtwqRemovePeriodicCallback</a> and pass this key as the <i>dwKey</i> parameter.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqaddperiodiccallback
     * @since windows8.1
     */
    static RtwqAddPeriodicCallback(Callback, context, key) {
        keyMarshal := key is VarRef ? "uint*" : "ptr"

        result := DllCall("RTWorkQ.dll\RtwqAddPeriodicCallback", "ptr", Callback, "ptr", context, keyMarshal, key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Cancels a callback function that was set by the RtwqAddPeriodicCallback function.
     * @param {Integer} dwKey Key that identifies the callback. This value is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqaddperiodiccallback">RtwqAddPeriodicCallback</a> function.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqremoveperiodiccallback
     * @since windows8.1
     */
    static RtwqRemovePeriodicCallback(dwKey) {
        result := DllCall("RTWorkQ.dll\RtwqRemovePeriodicCallback", "uint", dwKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Attempts to cancel an asynchronous operation that was scheduled with RtwqScheduleWorkItem.
     * @param {Integer} Key The key that was received in the <i>key</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqscheduleworkitem">RtwqScheduleWorkItem</a>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqcancelworkitem
     * @since windows8.1
     */
    static RtwqCancelWorkItem(Key) {
        result := DllCall("RTWorkQ.dll\RtwqCancelWorkItem", "uint", Key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new work queue.
     * @param {Integer} WorkQueueType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/ne-rtworkq-rtwq_workqueue_type">RTWQ_WORKQUEUE_TYPE</a> enumeration, specifying the type of work queue to create.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTWQ_MULTITHREADED_WORKQUEUE"></a><a id="rtwq_multithreaded_workqueue"></a><dl>
     * <dt><b>RTWQ_MULTITHREADED_WORKQUEUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create a multithreaded work queue. Generally, applications should not create private multithreaded queues. Use the platform multithreaded queues instead. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTWQ_STANDARD_WORKQUEUE"></a><a id="rtwq_standard_workqueue"></a><dl>
     * <dt><b>RTWQ_STANDARD_WORKQUEUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create a work queue without a message loop. Using this flag is equivalent to calling <b>RtwqAllocateWorkQueue</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RTWQ_WINDOW_WORKQUEUE"></a><a id="rtwq_window_workqueue"></a><dl>
     * <dt><b>RTWQ_WINDOW_WORKQUEUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create a work queue with a message loop. The thread that dispatches the work items for this queue will also call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dispatchmessage">DispatchMessage</a>. Use this option if your callback performs any actions that require a message loop.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} workQueueId Receives an identifier for the work queue that was created.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqallocateworkqueue
     * @since windows8.1
     */
    static RtwqAllocateWorkQueue(WorkQueueType, workQueueId) {
        workQueueIdMarshal := workQueueId is VarRef ? "uint*" : "ptr"

        result := DllCall("RTWorkQ.dll\RtwqAllocateWorkQueue", "int", WorkQueueType, workQueueIdMarshal, workQueueId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Associates a work queue with a Multimedia Class Scheduler Service (MMCSS) task.
     * @param {Integer} workQueueId The identifier of the work queue.  For private work queues, the identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqallocateworkqueue">RtwqAllocateWorkQueue</a> function.
     * @param {PWSTR} usageClass The name of the MMCSS task.
     * @param {Integer} dwTaskId The unique task identifier. To obtain a new task identifier, set this value to zero.
     * @param {Integer} lPriority The base relative priority for the work-queue threads. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avsetmmthreadpriority">AvSetMmThreadPriority</a>.
     * @param {IRtwqAsyncCallback} doneCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nn-rtworkq-irtwqasynccallback">IRtwqAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} doneState A pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqbeginregisterworkqueuewithmmcss
     * @since windows8.1
     */
    static RtwqBeginRegisterWorkQueueWithMMCSS(workQueueId, usageClass, dwTaskId, lPriority, doneCallback, doneState) {
        usageClass := usageClass is String ? StrPtr(usageClass) : usageClass

        result := DllCall("RTWorkQ.dll\RtwqBeginRegisterWorkQueueWithMMCSS", "uint", workQueueId, "ptr", usageClass, "uint", dwTaskId, "int", lPriority, "ptr", doneCallback, "ptr", doneState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unregisters a work queue from a Multimedia Class Scheduler Service (MMCSS) task.
     * @param {Integer} workQueueId The identifier of the work queue.  For private work queues, the identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqallocateworkqueue">RtwqAllocateWorkQueue</a> function.
     * @param {IRtwqAsyncCallback} doneCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nn-rtworkq-irtwqasynccallback">IRtwqAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} doneState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqbeginunregisterworkqueuewithmmcss
     * @since windows8.1
     */
    static RtwqBeginUnregisterWorkQueueWithMMCSS(workQueueId, doneCallback, doneState) {
        result := DllCall("RTWorkQ.dll\RtwqBeginUnregisterWorkQueueWithMMCSS", "uint", workQueueId, "ptr", doneCallback, "ptr", doneState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Completes an asynchronous request to associate a work queue with a Multimedia Class Scheduler Service (MMCSS) task.
     * @param {IRtwqAsyncResult} result Pointer to the asynchronous result. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-irtwqasynccallback-invoke">IRtwqAsyncCallback::Invoke</a> method.
     * @param {Pointer<Integer>} taskId The unique task identifier.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqendregisterworkqueuewithmmcss
     * @since windows8.1
     */
    static RtwqEndRegisterWorkQueueWithMMCSS(result, taskId) {
        taskIdMarshal := taskId is VarRef ? "uint*" : "ptr"

        result := DllCall("RTWorkQ.dll\RtwqEndRegisterWorkQueueWithMMCSS", "ptr", result, taskIdMarshal, taskId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the Multimedia Class Scheduler Service (MMCSS) class currently associated with this work queue.
     * @param {Integer} workQueueId Identifier for the work queue. The identifier is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqallocateworkqueue">RtwqAllocateWorkQueue</a> function.
     * @param {PWSTR} usageClass Pointer to a buffer that receives the name of the MMCSS class. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} usageClassLength On input, specifies the size of the <i>usageClass</i> buffer, in characters. On output, receives the required size of the buffer, in characters. The size includes the terminating null character.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqgetworkqueuemmcssclass
     * @since windows8.1
     */
    static RtwqGetWorkQueueMMCSSClass(workQueueId, usageClass, usageClassLength) {
        usageClass := usageClass is String ? StrPtr(usageClass) : usageClass

        usageClassLengthMarshal := usageClassLength is VarRef ? "uint*" : "ptr"

        result := DllCall("RTWorkQ.dll\RtwqGetWorkQueueMMCSSClass", "uint", workQueueId, "ptr", usageClass, usageClassLengthMarshal, usageClassLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the Multimedia Class Scheduler Service (MMCSS) task identifier currently associated with this work queue.
     * @param {Integer} workQueueId Identifier for the work queue. The identifier is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqallocateworkqueue">RtwqAllocateWorkQueue</a> function.
     * @param {Pointer<Integer>} taskId Receives the task identifier.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqgetworkqueuemmcsstaskid
     * @since windows8.1
     */
    static RtwqGetWorkQueueMMCSSTaskId(workQueueId, taskId) {
        taskIdMarshal := taskId is VarRef ? "uint*" : "ptr"

        result := DllCall("RTWorkQ.dll\RtwqGetWorkQueueMMCSSTaskId", "uint", workQueueId, taskIdMarshal, taskId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets the relative thread priority of a work queue.
     * @param {Integer} workQueueId The identifier of the work queue. For private work queues, the identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqallocateworkqueue">RtwqAllocateWorkQueue</a> function.
     * @param {Pointer<Integer>} priority Receives the relative thread priority.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqgetworkqueuemmcsspriority
     * @since windows8.1
     */
    static RtwqGetWorkQueueMMCSSPriority(workQueueId, priority) {
        priorityMarshal := priority is VarRef ? "int*" : "ptr"

        result := DllCall("RTWorkQ.dll\RtwqGetWorkQueueMMCSSPriority", "uint", workQueueId, priorityMarshal, priority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enables an app to listen to the RtwqStartup and RtwqShutdown functions.
     * @param {IRtwqPlatformEvents} platformEvents Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nn-rtworkq-irtwqplatformevents">IRtwqPlatformEvents</a> object which provides the events.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqregisterplatformevents
     * @since windows8.1
     */
    static RtwqRegisterPlatformEvents(platformEvents) {
        result := DllCall("RTWorkQ.dll\RtwqRegisterPlatformEvents", "ptr", platformEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unregisters a listener event from the callback platform.
     * @param {IRtwqPlatformEvents} platformEvents Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nn-rtworkq-irtwqplatformevents">IRtwqPlatformEvents</a>  object which provides the events.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqunregisterplatformevents
     * @since windows8.1
     */
    static RtwqUnregisterPlatformEvents(platformEvents) {
        result := DllCall("RTWorkQ.dll\RtwqUnregisterPlatformEvents", "ptr", platformEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Indicates that the app will be submitting a hint that long running work will occur on this work queue.
     * @param {Integer} workQueueId The ID of the work queue.
     * @param {BOOL} enable <b>true</b> if the app will be submitting the hint; otherwise, <b>false</b>. The default is <b>false</b>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqsetlongrunning
     * @since windows8.1
     */
    static RtwqSetLongRunning(workQueueId, enable) {
        result := DllCall("RTWorkQ.dll\RtwqSetLongRunning", "uint", workQueueId, "int", enable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets a deadline by which the work in a work queue must be completed.
     * @param {Integer} workQueueId The identifier for the work queue. The identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqallocateworkqueue">RtwqAllocateWorkQueue</a> function.
     * @param {Integer} deadlineInHNS The deadline for the work in the queue to be completed, in milliseconds.
     * @param {Pointer<HANDLE>} pRequest Receives a handle to the request that can be used to cancel the request by calling <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqcanceldeadline">RtwqCancelDeadline</a>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqsetdeadline
     * @since windows10.0.10240
     */
    static RtwqSetDeadline(workQueueId, deadlineInHNS, pRequest) {
        result := DllCall("RTWorkQ.dll\RtwqSetDeadline", "uint", workQueueId, "int64", deadlineInHNS, "ptr", pRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets a deadline by which the work in a work queue must be completed.
     * @param {Integer} workQueueId The identifier for the work queue. The identifier is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqallocateworkqueue">RtwqAllocateWorkQueue</a> function.
     * @param {Integer} deadlineInHNS The deadline for the work in the queue to be completed, in milliseconds.
     * @param {Integer} preDeadlineInHNS The pre-deadline for the work in the queue to be completed, in milliseconds.
     * @param {Pointer<HANDLE>} pRequest Receives a handle to the request that can be used to cancel the request by calling <a href="https://docs.microsoft.com/windows/desktop/api/rtworkq/nf-rtworkq-rtwqcanceldeadline">RtwqCancelDeadline</a>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqsetdeadline2
     * @since windows10.0.10240
     */
    static RtwqSetDeadline2(workQueueId, deadlineInHNS, preDeadlineInHNS, pRequest) {
        result := DllCall("RTWorkQ.dll\RtwqSetDeadline2", "uint", workQueueId, "int64", deadlineInHNS, "int64", preDeadlineInHNS, "ptr", pRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Cancels a deadline that was previously set with RtwqSetDeadline.
     * @param {HANDLE} pRequest Receives a handle to the request that can be used to cancel the request by calling <b>RtwqCancelDeadline</b>.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-rtwqcanceldeadline
     */
    static RtwqCancelDeadline(pRequest) {
        pRequest := pRequest is Win32Handle ? NumGet(pRequest, "ptr") : pRequest

        result := DllCall("RTWorkQ.dll\RtwqCancelDeadline", "ptr", pRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/WinAuto/getprocesshandlefromhwnd
     */
    static GetProcessHandleFromHwnd(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("OLEACC.dll\GetProcessHandleFromHwnd", "ptr", hwnd, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * Attaches or detaches the input processing mechanism of one thread to that of another thread.
     * @param {Integer} idAttach The identifier of the thread to be attached to another thread. The thread to be attached cannot be a system thread.
     * @param {Integer} idAttachTo The identifier of the thread to which <i>idAttach</i> will be attached. This thread cannot be a system thread. 
     * 
     * 
     * 
     * 
     * A thread cannot attach to itself. Therefore, <i>idAttachTo</i> cannot equal <i>idAttach</i>.
     * @param {BOOL} fAttach If this parameter is <b>TRUE</b>, the two threads are attached. If the parameter is <b>FALSE</b>, the threads are detached.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>There is no extended error information; do not call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. This behavior changed as of Windows Vista.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-attachthreadinput
     * @since windows5.1.2600
     */
    static AttachThreadInput(idAttach, idAttachTo, fAttach) {
        result := DllCall("USER32.dll\AttachThreadInput", "uint", idAttach, "uint", idAttachTo, "int", fAttach, "int")
        return result
    }

    /**
     * Waits until the specified process has finished processing its initial input and is waiting for user input with no input pending, or until the time-out interval has elapsed.
     * @param {HANDLE} hProcess A handle to the process. If this process is a console application or does not have a message queue, 
     * <b>WaitForInputIdle</b> returns immediately.
     * @param {Integer} dwMilliseconds The time-out interval, in milliseconds. If <i>dwMilliseconds</i> is INFINITE, the function does not return until the process is idle.
     * @returns {Integer} The following table shows the possible return values for this function.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wait was satisfied successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wait was terminated because the time-out interval elapsed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-waitforinputidle
     * @since windows5.1.2600
     */
    static WaitForInputIdle(hProcess, dwMilliseconds) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        result := DllCall("USER32.dll\WaitForInputIdle", "ptr", hProcess, "uint", dwMilliseconds, "uint")
        return result
    }

    /**
     * Retrieves the count of handles to graphical user interface (GUI) objects in use by the specified process.
     * @param {HANDLE} hProcess A handle to the process. The handle must refer to a process in the current session, and must have the **PROCESS_QUERY_INFORMATION** access right (see [Process security and access rights](/windows/win32/procthread/process-security-and-access-rights)).
     * 
     * If this parameter is the special value **GR_GLOBAL**, then the resource usage is reported across all processes in the current session.
     * 
     * **Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP:** The **GR_GLOBAL** value is not supported until Windows 7 and Windows Server 2008 R2.
     * @param {Integer} uiFlags 
     * @returns {Integer} If the function succeeds, the return value is the count of handles to GUI objects in use by the process. If no GUI objects are in use, the return value is zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getguiresources
     * @since windows5.1.2600
     */
    static GetGuiResources(hProcess, uiFlags) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("USER32.dll\GetGuiResources", "ptr", hProcess, "uint", uiFlags, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether the process belongs to a Windows Store app.
     * @param {HANDLE} hProcess Target process handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-isimmersiveprocess
     * @since windows8.0
     */
    static IsImmersiveProcess(hProcess) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("USER32.dll\IsImmersiveProcess", "ptr", hProcess, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Exempts the calling process from restrictions preventing desktop processes from interacting with the Windows Store app environment. This function is used by development and debugging tools.
     * @param {BOOL} fEnableExemption When set to TRUE, indicates a request to disable exemption for the calling process.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setprocessrestrictionexemption
     * @since windows8.0
     */
    static SetProcessRestrictionExemption(fEnableExemption) {
        A_LastError := 0

        result := DllCall("USER32.dll\SetProcessRestrictionExemption", "int", fEnableExemption, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the process affinity mask for the specified process and the system affinity mask for the system.
     * @param {HANDLE} hProcess A handle to the process whose affinity mask is desired.
     * 
     * This handle must have the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right.
     * @param {Pointer<Pointer>} lpProcessAffinityMask A pointer to a variable that receives the affinity mask for the specified process.
     * @param {Pointer<Pointer>} lpSystemAffinityMask A pointer to a variable that receives the affinity mask for the system.
     * @returns {BOOL} If the function succeeds, the return value is nonzero and the function sets the variables pointed to by <i>lpProcessAffinityMask</i> and <i>lpSystemAffinityMask</i> to the appropriate affinity masks.
     * 
     * On a system with more than 64 processors, if the threads of the calling process are in a single <a href="/windows/desktop/ProcThread/processor-groups">processor group</a>, the function sets the variables pointed to by <i>lpProcessAffinityMask</i> and <i>lpSystemAffinityMask</i> to the process affinity mask and the processor mask of active logical processors for that group. If the calling process contains threads in multiple groups, the function returns zero for both affinity masks.
     * 
     * If the function fails, the return value is zero, and the values of the variables pointed to by <i>lpProcessAffinityMask</i> and <i>lpSystemAffinityMask</i> are undefined. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getprocessaffinitymask
     * @since windows5.1.2600
     */
    static GetProcessAffinityMask(hProcess, lpProcessAffinityMask, lpSystemAffinityMask) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        lpProcessAffinityMaskMarshal := lpProcessAffinityMask is VarRef ? "ptr*" : "ptr"
        lpSystemAffinityMaskMarshal := lpSystemAffinityMask is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessAffinityMask", "ptr", hProcess, lpProcessAffinityMaskMarshal, lpProcessAffinityMask, lpSystemAffinityMaskMarshal, lpSystemAffinityMask, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets a processor affinity mask for the threads of the specified process.
     * @param {HANDLE} hProcess A handle to the process whose affinity mask is to be set. This handle must have the <b>PROCESS_SET_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Pointer} dwProcessAffinityMask The affinity mask for the threads of the process.
     * 
     * On a system with more than 64 processors, the affinity mask must specify processors in a single <a href="https://docs.microsoft.com/windows/desktop/ProcThread/processor-groups">processor group</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the process affinity mask requests a processor that is not configured in the system, the last error code is <b>ERROR_INVALID_PARAMETER</b>.
     * 
     * On a system with more than 64 processors, if the calling process contains threads in more than one processor group, the last error code is <b>ERROR_INVALID_PARAMETER</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setprocessaffinitymask
     * @since windows5.1.2600
     */
    static SetProcessAffinityMask(hProcess, dwProcessAffinityMask) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetProcessAffinityMask", "ptr", hProcess, "ptr", dwProcessAffinityMask, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves accounting information for all I/O operations performed by the specified process.
     * @param {HANDLE} hProcess A handle to the process. The handle must have the <b>PROCESS_QUERY_INFORMATION</b> or <b>PROCESS_QUERY_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>PROCESS_QUERY_INFORMATION</b> access right.
     * @param {Pointer<IO_COUNTERS>} lpIoCounters A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-io_counters">IO_COUNTERS</a> structure that receives the I/O accounting information for the process.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getprocessiocounters
     * @since windows5.1.2600
     */
    static GetProcessIoCounters(hProcess, lpIoCounters) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessIoCounters", "ptr", hProcess, "ptr", lpIoCounters, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Schedules a fiber. The function must be called on a fiber.
     * @remarks
     * 
     * You create fibers with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfiber">CreateFiber</a> function. Before you can schedule fibers associated with a thread, you must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-convertthreadtofiber">ConvertThreadToFiber</a> to set up an area in which to save the fiber state information. The thread is now the currently executing fiber.
     * 
     * The 
     * <b>SwitchToFiber</b> function saves the state information of the current fiber and restores the state of the specified fiber. You can call 
     * <b>SwitchToFiber</b> with the address of a fiber created by a different thread. To do this, you must have the address returned to the other thread when it called 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createfiber">CreateFiber</a> and you must use proper synchronization.
     * 
     * Avoid making the following call:
     * 
     * <pre class="syntax" xml:space="preserve"><c>SwitchToFiber( GetCurrentFiber() );</c></pre>
     * This call can cause unpredictable problems.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0400 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * 
     * @param {Pointer<Void>} lpFiber The address of the fiber to be scheduled.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-switchtofiber
     * @since windows5.1.2600
     */
    static SwitchToFiber(lpFiber) {
        lpFiberMarshal := lpFiber is VarRef ? "ptr" : "ptr"

        DllCall("KERNEL32.dll\SwitchToFiber", lpFiberMarshal, lpFiber)
    }

    /**
     * Deletes an existing fiber.
     * @remarks
     * 
     * The 
     * <b>DeleteFiber</b> function deletes all data associated with the fiber. This data includes the stack, a subset of the registers, and the fiber data.
     * 
     * If the currently running fiber calls 
     * <b>DeleteFiber</b>, its thread calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitthread">ExitThread</a> and terminates. However, if a currently running fiber is deleted by another fiber, the thread running the deleted fiber is likely to terminate abnormally because the fiber stack has been freed.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0400 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * 
     * 
     * @param {Pointer<Void>} lpFiber The address of the fiber to be deleted.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-deletefiber
     * @since windows5.1.2600
     */
    static DeleteFiber(lpFiber) {
        lpFiberMarshal := lpFiber is VarRef ? "ptr" : "ptr"

        DllCall("KERNEL32.dll\DeleteFiber", lpFiberMarshal, lpFiber)
    }

    /**
     * Converts the current fiber into a thread.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-convertfibertothread
     * @since windows6.0.6000
     */
    static ConvertFiberToThread() {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ConvertFiberToThread", "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates a fiber object, assigns it a stack, and sets up execution to begin at the specified start address, typically the fiber function. This function does not schedule the fiber.
     * @param {Pointer} dwStackCommitSize The initial commit size of the stack, in bytes. If this parameter is zero, the new fiber uses the default commit stack size for the executable. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-stack-size">Thread Stack Size</a>.
     * @param {Pointer} dwStackReserveSize The initial reserve size of the stack, in bytes. If this parameter is zero, the new fiber uses the default reserved stack size for the executable. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-stack-size">Thread Stack Size</a>.
     * @param {Integer} dwFlags If this parameter is zero, the floating-point state on x86 systems is not switched and data can be corrupted if a fiber uses floating-point arithmetic. If this parameter is <b>FIBER_FLAG_FLOAT_SWITCH</b>, the floating-point state is switched for the fiber.
     * 
     * <b>Windows XP:  </b>The <b>FIBER_FLAG_FLOAT_SWITCH</b> flag is not supported.
     * @param {Pointer<LPFIBER_START_ROUTINE>} lpStartAddress A pointer to the application-defined function to be executed by the fiber and represents the starting address of the fiber. Execution of the newly created fiber does not begin until another fiber calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-switchtofiber">SwitchToFiber</a> function with this address. For more information on the fiber callback function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nc-winbase-pfiber_start_routine">FiberProc</a>.
     * @param {Pointer<Void>} lpParameter A pointer to a variable that is passed to the fiber. The fiber can retrieve this data by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-getfiberdata">GetFiberData</a> macro.
     * @returns {Pointer<Void>} If the function succeeds, the return value is the address of the fiber.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createfiberex
     * @since windows5.1.2600
     */
    static CreateFiberEx(dwStackCommitSize, dwStackReserveSize, dwFlags, lpStartAddress, lpParameter) {
        lpParameterMarshal := lpParameter is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateFiberEx", "ptr", dwStackCommitSize, "ptr", dwStackReserveSize, "uint", dwFlags, "ptr", lpStartAddress, lpParameterMarshal, lpParameter, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts the current thread into a fiber. You must convert a thread into a fiber before you can schedule other fibers.
     * @param {Pointer<Void>} lpParameter A  pointer to a variable that is passed to the fiber. The fiber can retrieve this data by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-getfiberdata">GetFiberData</a> macro.
     * @param {Integer} dwFlags If this parameter is zero, the floating-point state on x86 systems is not switched and data can be corrupted if a fiber uses floating-point arithmetic. If this parameter is FIBER_FLAG_FLOAT_SWITCH, the floating-point state is switched for the fiber.
     * @returns {Pointer<Void>} If the function succeeds, the return value is the address of the fiber.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-convertthreadtofiberex
     * @since windows6.0.6000
     */
    static ConvertThreadToFiberEx(lpParameter, dwFlags) {
        lpParameterMarshal := lpParameter is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ConvertThreadToFiberEx", lpParameterMarshal, lpParameter, "uint", dwFlags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allocates a fiber object, assigns it a stack, and sets up execution to begin at the specified start address, typically the fiber function. This function does not schedule the fiber.
     * @param {Pointer} dwStackSize The initial committed size of the stack, in bytes. If this parameter is zero, the new fiber uses the default commit stack size for the executable. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-stack-size">Thread Stack Size</a>.
     * @param {Pointer<LPFIBER_START_ROUTINE>} lpStartAddress A pointer to the application-defined function to be executed by the fiber and represents the starting address of the fiber. Execution of the newly created fiber does not begin until another fiber calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-switchtofiber">SwitchToFiber</a> function with this address. For more information of the fiber callback function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nc-winbase-pfiber_start_routine">FiberProc</a>.
     * @param {Pointer<Void>} lpParameter A pointer to a variable that is passed to the fiber. The fiber can retrieve this data by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-getfiberdata">GetFiberData</a> macro.
     * @returns {Pointer<Void>} If the function succeeds, the return value is the address of the fiber.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createfiber
     * @since windows5.1.2600
     */
    static CreateFiber(dwStackSize, lpStartAddress, lpParameter) {
        lpParameterMarshal := lpParameter is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateFiber", "ptr", dwStackSize, "ptr", lpStartAddress, lpParameterMarshal, lpParameter, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts the current thread into a fiber. You must convert a thread into a fiber before you can schedule other fibers.
     * @param {Pointer<Void>} lpParameter A pointer to a variable that is passed to the fiber. The fiber can retrieve this data by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-getfiberdata">GetFiberData</a> macro.
     * @returns {Pointer<Void>} If the function succeeds, the return value is the address of the fiber.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-convertthreadtofiber
     * @since windows5.1.2600
     */
    static ConvertThreadToFiber(lpParameter) {
        lpParameterMarshal := lpParameter is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ConvertThreadToFiber", lpParameterMarshal, lpParameter, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a user-mode scheduling (UMS) completion list.
     * @param {Pointer<Pointer<Void>>} UmsCompletionList A <b>PUMS_COMPLETION_LIST</b> variable. On output, this parameter receives a pointer 
     *       to an empty UMS completion list.
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the 
     *        following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to create the completion list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createumscompletionlist
     * @since windows6.1
     */
    static CreateUmsCompletionList(UmsCompletionList) {
        UmsCompletionListMarshal := UmsCompletionList is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateUmsCompletionList", UmsCompletionListMarshal, UmsCompletionList, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves user-mode scheduling (UMS) worker threads from the specified UMS completion list.
     * @param {Pointer<Void>} UmsCompletionList A pointer to the completion list from which to retrieve worker threads.
     * @param {Integer} WaitTimeOut The time-out interval for the retrieval operation, in milliseconds. The function returns if the interval elapses, even if no worker threads are queued to the completion list.
     * 
     * If the <i>WaitTimeOut</i> parameter is zero, the completion list is checked for available worker threads without waiting for worker threads to become available. If the <i>WaitTimeOut</i> parameter is INFINITE, the function's time-out interval never elapses. This is not recommended, however, because it causes the function to block until one or more worker threads become available.
     * @param {Pointer<Pointer<Void>>} UmsThreadList A pointer to a UMS_CONTEXT variable. On output, this parameter receives a pointer to the first UMS thread context in a list of UMS thread contexts. 
     * 
     * If no worker threads are available before the time-out specified by the <i>WaitTimeOut</i> parameter, this parameter is set to NULL.
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No threads became available before the specified time-out interval elapsed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-dequeueumscompletionlistitems
     * @since windows6.1
     */
    static DequeueUmsCompletionListItems(UmsCompletionList, WaitTimeOut, UmsThreadList) {
        UmsCompletionListMarshal := UmsCompletionList is VarRef ? "ptr" : "ptr"
        UmsThreadListMarshal := UmsThreadList is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\DequeueUmsCompletionListItems", UmsCompletionListMarshal, UmsCompletionList, "uint", WaitTimeOut, UmsThreadListMarshal, UmsThreadList, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a handle to the event associated with the specified user-mode scheduling (UMS) completion list.
     * @param {Pointer<Void>} UmsCompletionList A pointer to a UMS completion list. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createumscompletionlist">CreateUmsCompletionList</a> function provides this pointer.
     * @param {Pointer<HANDLE>} UmsCompletionEvent A pointer to a HANDLE variable. On output, the <i>UmsCompletionEvent</i> parameter is set to a handle to the event associated with the specified completion list.
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getumscompletionlistevent
     * @since windows6.1
     */
    static GetUmsCompletionListEvent(UmsCompletionList, UmsCompletionEvent) {
        UmsCompletionListMarshal := UmsCompletionList is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetUmsCompletionListEvent", UmsCompletionListMarshal, UmsCompletionList, "ptr", UmsCompletionEvent, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Runs the specified UMS worker thread.
     * @param {Pointer<Void>} UmsThread A pointer to the UMS thread context of the worker thread to run.
     * @returns {BOOL} If the function succeeds, it does not return a value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error codes include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RETRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified UMS worker thread is temporarily locked by the system. The caller can retry the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-executeumsthread
     * @since windows6.1
     */
    static ExecuteUmsThread(UmsThread) {
        UmsThreadMarshal := UmsThread is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ExecuteUmsThread", UmsThreadMarshal, UmsThread, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Yields control to the user-mode scheduling (UMS) scheduler thread on which the calling UMS worker thread is running.
     * @param {Pointer<Void>} SchedulerParam A parameter to pass to the scheduler thread's <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nc-winnt-rtl_ums_scheduler_entry_point">UmsSchedulerProc</a> function.
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-umsthreadyield
     * @since windows6.1
     */
    static UmsThreadYield(SchedulerParam) {
        SchedulerParamMarshal := SchedulerParam is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\UmsThreadYield", SchedulerParamMarshal, SchedulerParam, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes the specified user-mode scheduling (UMS) completion list. The list must be empty.
     * @param {Pointer<Void>} UmsCompletionList A pointer to the UMS completion list to be deleted. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createumscompletionlist">CreateUmsCompletionList</a> function provides this pointer.
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-deleteumscompletionlist
     * @since windows6.1
     */
    static DeleteUmsCompletionList(UmsCompletionList) {
        UmsCompletionListMarshal := UmsCompletionList is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\DeleteUmsCompletionList", UmsCompletionListMarshal, UmsCompletionList, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the user-mode scheduling (UMS) thread context of the calling UMS thread.
     * @returns {Pointer<Void>} The function returns a pointer to the UMS thread context of the calling thread.
     * 
     * If calling thread is not a UMS thread, the function returns NULL. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getcurrentumsthread
     * @since windows6.1
     */
    static GetCurrentUmsThread() {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCurrentUmsThread", "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the next user-mode scheduling (UMS) thread context in a list of thread contexts.
     * @param {Pointer<Void>} UmsContext A pointer to a UMS context in a list of thread contexts. This list is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-dequeueumscompletionlistitems">DequeueUmsCompletionListItems</a> function.
     * @returns {Pointer<Void>} If the function succeeds, it returns a pointer to the next thread context in the list.
     * 
     * If there is no thread context after the context specified by the <i>UmsContext</i> parameter,  the function returns NULL. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnextumslistitem
     * @since windows6.1
     */
    static GetNextUmsListItem(UmsContext) {
        UmsContextMarshal := UmsContext is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNextUmsListItem", UmsContextMarshal, UmsContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the specified user-mode scheduling (UMS) worker thread.
     * @param {Pointer<Void>} UmsThread A pointer to a UMS thread context.
     * @param {Integer} UmsThreadInfoClass A UMS_THREAD_INFO_CLASS value that specifies the kind of information to retrieve.
     * @param {Pointer} UmsThreadInformation A pointer to a buffer to receive the specified information. The required size of this buffer depends on the specified information class.
     * 
     * If the information class is <b>UmsThreadContext</b> or <b>UmsThreadTeb</b>, the buffer must be <c>sizeof(PVOID)</c>.
     * 
     * If the information class is <b>UmsThreadIsSuspended</b> or <b>UmsThreadIsTerminated</b>, the buffer must be <c>sizeof(BOOLEAN)</c>.
     * @param {Integer} UmsThreadInformationLength The size of the <i>UmsThreadInformation</i> buffer, in bytes.
     * @param {Pointer<Integer>} ReturnLength A pointer to a ULONG variable. On output, this parameter receives the number of bytes written to the <i>UmsThreadInformation</i> buffer.
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INFO_LENGTH_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small for the requested information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_INFO_CLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified information class is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-queryumsthreadinformation
     * @since windows6.1
     */
    static QueryUmsThreadInformation(UmsThread, UmsThreadInfoClass, UmsThreadInformation, UmsThreadInformationLength, ReturnLength) {
        UmsThreadMarshal := UmsThread is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueryUmsThreadInformation", UmsThreadMarshal, UmsThread, "int", UmsThreadInfoClass, "ptr", UmsThreadInformation, "uint", UmsThreadInformationLength, ReturnLengthMarshal, ReturnLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets application-specific context information for the specified user-mode scheduling (UMS) worker thread.
     * @param {Pointer<Void>} UmsThread A pointer to a UMS thread context.
     * @param {Integer} UmsThreadInfoClass A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-_rtl_ums_thread_info_class">UMS_THREAD_INFO_CLASS</a> value that specifies the kind of information to set. This parameter must be <b>UmsThreadUserContext</b>.
     * @param {Pointer<Void>} UmsThreadInformation A pointer to a buffer that contains the information to set.
     * @param {Integer} UmsThreadInformationLength The size of the <i>UmsThreadInformation</i> buffer, in bytes.
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INFO_LENGTH_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer size does not match the  required size for the specified information class. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_INFO_CLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>UmsThreadInfoClass</i> parameter specifies an information class that is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setumsthreadinformation
     * @since windows6.1
     */
    static SetUmsThreadInformation(UmsThread, UmsThreadInfoClass, UmsThreadInformation, UmsThreadInformationLength) {
        UmsThreadMarshal := UmsThread is VarRef ? "ptr" : "ptr"
        UmsThreadInformationMarshal := UmsThreadInformation is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetUmsThreadInformation", UmsThreadMarshal, UmsThread, "int", UmsThreadInfoClass, UmsThreadInformationMarshal, UmsThreadInformation, "uint", UmsThreadInformationLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes the specified user-mode scheduling (UMS) thread context. The thread must be terminated.
     * @param {Pointer<Void>} UmsThread A pointer to the UMS thread context to be deleted. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createumsthreadcontext">CreateUmsThreadContext</a> function provides this pointer.
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-deleteumsthreadcontext
     * @since windows6.1
     */
    static DeleteUmsThreadContext(UmsThread) {
        UmsThreadMarshal := UmsThread is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\DeleteUmsThreadContext", UmsThreadMarshal, UmsThread, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a user-mode scheduling (UMS) thread context to represent a UMS worker thread.
     * @param {Pointer<Pointer<Void>>} lpUmsThread A PUMS_CONTEXT variable. On output, this parameter receives a pointer to a UMS thread context.
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to create the UMS thread context.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createumsthreadcontext
     * @since windows6.1
     */
    static CreateUmsThreadContext(lpUmsThread) {
        lpUmsThreadMarshal := lpUmsThread is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateUmsThreadContext", lpUmsThreadMarshal, lpUmsThread, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts the calling thread into a user-mode scheduling (UMS) scheduler thread.
     * @param {Pointer<UMS_SCHEDULER_STARTUP_INFO>} SchedulerStartupInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-ums_scheduler_startup_info">UMS_SCHEDULER_STARTUP_INFO</a> structure that specifies UMS attributes for the thread, including a completion list and a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nc-winnt-rtl_ums_scheduler_entry_point">UmsSchedulerProc</a>     entry point function.
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-enterumsschedulingmode
     * @since windows6.1
     */
    static EnterUmsSchedulingMode(SchedulerStartupInfo) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\EnterUmsSchedulingMode", "ptr", SchedulerStartupInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Queries whether the specified thread is a UMS scheduler thread, a UMS worker thread, or a non-UMS thread.
     * @param {HANDLE} ThreadHandle A handle to a thread. The thread handle must have the THREAD_QUERY_INFORMATION access right. For more information, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * @param {Pointer<UMS_SYSTEM_THREAD_INFORMATION>} SystemThreadInfo A pointer to an initialized <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-ums_system_thread_information">UMS_SYSTEM_THREAD_INFORMATION</a> structure that specifies the kind of thread for the query.
     * @returns {BOOL} Returns TRUE if the specified thread matches the kind of thread specified by the <i>SystemThreadInfo</i> parameter. Otherwise, the function returns FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getumssystemthreadinformation
     * @since windows6.1
     */
    static GetUmsSystemThreadInformation(ThreadHandle, SystemThreadInfo) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        result := DllCall("KERNEL32.dll\GetUmsSystemThreadInformation", "ptr", ThreadHandle, "ptr", SystemThreadInfo, "int")
        return result
    }

    /**
     * Sets a processor affinity mask for the specified thread.
     * @param {HANDLE} hThread A handle to the thread whose affinity mask is to be set.
     * 
     * This handle must have the <b>THREAD_SET_INFORMATION</b> or <b>THREAD_SET_LIMITED_INFORMATION</b> access right and the <b>THREAD_QUERY_INFORMATION</b> or <b>THREAD_QUERY_LIMITED_INFORMATION</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/thread-security-and-access-rights">Thread Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The handle must have the <b>THREAD_SET_INFORMATION</b> and <b>THREAD_QUERY_INFORMATION</b> access rights.
     * @param {Pointer} dwThreadAffinityMask The affinity mask for the thread.
     * 
     * On a system with more than 64 processors, the affinity mask must specify processors in the thread's current <a href="https://docs.microsoft.com/windows/desktop/ProcThread/processor-groups">processor group</a>.
     * @returns {Pointer} If the function succeeds, the return value is the thread's previous affinity mask.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the thread affinity mask requests a processor that is not selected for the process affinity mask, the last error code is <b>ERROR_INVALID_PARAMETER</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setthreadaffinitymask
     * @since windows5.1.2600
     */
    static SetThreadAffinityMask(hThread, dwThreadAffinityMask) {
        hThread := hThread is Win32Handle ? NumGet(hThread, "ptr") : hThread

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetThreadAffinityMask", "ptr", hThread, "ptr", dwThreadAffinityMask, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes data execution prevention (DEP) and DEP-ATL thunk emulation settings for a 32-bit process.
     * @param {Integer} dwFlags 
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To retrieve error values defined for this function,  call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setprocessdeppolicy
     * @since windows6.0.6000
     */
    static SetProcessDEPPolicy(dwFlags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetProcessDEPPolicy", "uint", dwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the data execution prevention (DEP) and DEP-ATL thunk emulation settings for the specified 32-bit process.Windows XP with SP3:  Gets the DEP and DEP-ATL thunk emulation settings for the current process.
     * @param {HANDLE} hProcess A handle to the process. <b>PROCESS_QUERY_INFORMATION</b> privilege is required to get the DEP policy of a process. 
     * 
     * <b>Windows XP with SP3:  </b>The <i>hProcess</i> parameter is ignored.
     * @param {Pointer<Integer>} lpFlags A <b>DWORD</b> that receives one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DEP is disabled for the specified process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROCESS_DEP_ENABLE"></a><a id="process_dep_enable"></a><dl>
     * <dt><b>PROCESS_DEP_ENABLE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DEP is enabled for the specified process.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROCESS_DEP_DISABLE_ATL_THUNK_EMULATION"></a><a id="process_dep_disable_atl_thunk_emulation"></a><dl>
     * <dt><b>PROCESS_DEP_DISABLE_ATL_THUNK_EMULATION</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DEP-ATL thunk emulation is disabled for the specified process. For information about DEP-ATL thunk emulation, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setprocessdeppolicy">SetProcessDEPPolicy</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<BOOL>} lpPermanent <b>TRUE</b> if DEP is enabled or disabled permanently for the specified process; otherwise <b>FALSE</b>. If <i>lpPermanent</i> is <b>TRUE</b>, the current DEP setting persists for the life of the process and cannot be changed by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setprocessdeppolicy">SetProcessDEPPolicy</a>.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. To retrieve error values defined for this function,  call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getprocessdeppolicy
     * @since windows6.0.6000
     */
    static GetProcessDEPPolicy(hProcess, lpFlags, lpPermanent) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess

        lpFlagsMarshal := lpFlags is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetProcessDEPPolicy", "ptr", hProcess, lpFlagsMarshal, lpFlags, "ptr", lpPermanent, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the specified event object to the signaled state and then resets it to the nonsignaled state after releasing the appropriate number of waiting threads.
     * @param {HANDLE} hEvent A handle to the event object. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-openeventa">OpenEvent</a> function returns this handle. 
     * 
     * 
     * 
     * 
     * The handle must have the EVENT_MODIFY_STATE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-pulseevent
     * @since windows5.1.2600
     */
    static PulseEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        A_LastError := 0

        result := DllCall("KERNEL32.dll\PulseEvent", "ptr", hEvent, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Runs the specified application.
     * @param {PSTR} lpCmdLine The command line (file name plus optional parameters) for the application to be executed. If the name of the executable file in the <i>lpCmdLine</i> parameter does not contain a directory path, the system searches for the executable file in this sequence: 
     * 
     * 
     * 
     * 
     * <ol>
     * <li>The directory from which the application loaded.</li>
     * <li>The current directory.</li>
     * <li>The Windows system directory. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsystemdirectorya">GetSystemDirectory</a> function retrieves the path of this directory.</li>
     * <li>The Windows directory. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getwindowsdirectorya">GetWindowsDirectory</a> function retrieves the path of this directory.</li>
     * <li>The directories listed in the PATH environment variable.</li>
     * </ol>
     * @param {Integer} uCmdShow The display options. For a list of the acceptable values, see the description of the <i>nCmdShow</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> function.
     * @returns {Integer} If the function succeeds, the return value is greater than 31.
     * 
     * If the function fails, the return value is one of the following error values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory or resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The .exe file is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified file was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified path was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-winexec
     * @since windows5.1.2600
     */
    static WinExec(lpCmdLine, uCmdShow) {
        lpCmdLine := lpCmdLine is String ? StrPtr(lpCmdLine) : lpCmdLine

        result := DllCall("KERNEL32.dll\WinExec", "ptr", lpCmdLine, "uint", uCmdShow, "uint")
        return result
    }

    /**
     * Signals one object and waits on another object as a single operation.
     * @param {HANDLE} hObjectToSignal A handle to the object to be signaled. This object can be a semaphore, a mutex, or an event. 
     * 
     * 
     * 
     * 
     * If the handle is a semaphore, the <b>SEMAPHORE_MODIFY_STATE</b> access right is required. If the handle is an event, the <b>EVENT_MODIFY_STATE</b> access right is required. If the handle is a mutex and the caller does not own the mutex, the function fails with <b>ERROR_NOT_OWNER</b>.
     * @param {HANDLE} hObjectToWaitOn A handle to the object to wait on. The <b>SYNCHRONIZE</b> access right is required; for more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>. For a list of the object types whose handles you can specify, see the Remarks section.
     * @param {Integer} dwMilliseconds The time-out interval, in milliseconds. The function returns if the interval elapses, even if the object's state is nonsignaled and no completion or asynchronous procedure call (APC) objects are queued. If <i>dwMilliseconds</i> is zero, the function tests the object's state, checks for queued completion routines or APCs, and returns immediately. If <i>dwMilliseconds</i> is <b>INFINITE</b>, the function's time-out interval never elapses.
     * @param {BOOL} bAlertable If this parameter is <b>TRUE</b>, the function returns when the system queues an I/O completion routine or APC function, and the thread calls the function. If <b>FALSE</b>, the function does not return, and the thread does not call the completion routine or APC function. 
     * 
     * 
     * 
     * 
     * A completion routine is queued when the 
     * function call that queued the APC has completed. This function returns and the completion routine is called only if <i>bAlertable</i> is <b>TRUE</b>, and the calling thread is the thread that queued the APC.
     * @returns {Integer} If the function succeeds, the return value indicates the event that caused the function to return. It can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_ABANDONED</b></dt>
     * <dt>0x00000080L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object is a mutex object that was not released by the thread that owned the mutex object before the owning thread terminated. Ownership of the mutex object is granted to the calling thread, and the mutex is set to nonsignaled.
     * 
     * If the mutex was protecting persistent state information, you should check it for consistency.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_IO_COMPLETION</b></dt>
     * <dt>0x000000C0L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wait was ended by one or more user-mode 
     * <a href="/windows/desktop/Sync/asynchronous-procedure-calls">asynchronous procedure calls</a> (APC) queued to the thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_OBJECT_0</b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the specified object is signaled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_TIMEOUT</b></dt>
     * <dt>0x00000102L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time-out interval elapsed, and the object's state is nonsignaled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_FAILED</b></dt>
     * <dt>(<b>DWORD</b>)0xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function has failed. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-signalobjectandwait
     * @since windows5.1.2600
     */
    static SignalObjectAndWait(hObjectToSignal, hObjectToWaitOn, dwMilliseconds, bAlertable) {
        hObjectToSignal := hObjectToSignal is Win32Handle ? NumGet(hObjectToSignal, "ptr") : hObjectToSignal
        hObjectToWaitOn := hObjectToWaitOn is Win32Handle ? NumGet(hObjectToWaitOn, "ptr") : hObjectToWaitOn

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SignalObjectAndWait", "ptr", hObjectToSignal, "ptr", hObjectToWaitOn, "uint", dwMilliseconds, "int", bAlertable, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates or opens a named or unnamed semaphore object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSemaphoreAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> 
     *        structure. If this parameter is <b>NULL</b>, the handle cannot be inherited by child 
     *        processes.
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor 
     *        for the new semaphore. If this parameter is <b>NULL</b>, the semaphore gets a default security descriptor. The ACLs in the default security descriptor for a semaphore come from the primary or impersonation token of the creator.
     * @param {Integer} lInitialCount The initial count for the semaphore object. This value must be greater than or equal to zero and less than or equal to <i>lMaximumCount</i>. The state of a semaphore is signaled when its count is greater than zero and nonsignaled when it is zero. The count is decreased by one whenever a wait function releases a thread that was waiting for the semaphore. The count is increased by a specified amount by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-releasesemaphore">ReleaseSemaphore</a> function.
     * @param {Integer} lMaximumCount The maximum count for the semaphore object. This value must be greater than zero.
     * @param {PSTR} lpName The name of the semaphore object. The name is limited to <b>MAX_PATH</b> characters. Name comparison is case sensitive.
     * 
     * If <i>lpName</i> matches the name of an existing named semaphore object, this function requests the <b>SEMAPHORE_ALL_ACCESS</b> access right. In this case, the <i>lInitialCount</i> and <i>lMaximumCount</i> parameters are ignored because they have already been set by the creating process. If the <i>lpSemaphoreAttributes</i> parameter is not <b>NULL</b>, it determines whether the handle can be inherited, but its security-descriptor member is ignored.
     * 
     * If <i>lpName</i> is <b>NULL</b>, the semaphore object is created without a name.
     * 
     * If <i>lpName</i> matches the name of an existing event, mutex, waitable timer, job, or file-mapping object, the function fails and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the semaphore object. If the named semaphore object existed before the function call, the function returns a handle to the existing object and 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createsemaphorea
     * @since windows5.1.2600
     */
    static CreateSemaphoreA(lpSemaphoreAttributes, lInitialCount, lMaximumCount, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateSemaphoreA", "ptr", lpSemaphoreAttributes, "int", lInitialCount, "int", lMaximumCount, "ptr", lpName, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpTimerAttributes 
     * @param {BOOL} bManualReset 
     * @param {PSTR} lpTimerName 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createwaitabletimerw
     */
    static CreateWaitableTimerA(lpTimerAttributes, bManualReset, lpTimerName) {
        lpTimerName := lpTimerName is String ? StrPtr(lpTimerName) : lpTimerName

        result := DllCall("KERNEL32.dll\CreateWaitableTimerA", "ptr", lpTimerAttributes, "int", bManualReset, "ptr", lpTimerName, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {Integer} dwDesiredAccess 
     * @param {BOOL} bInheritHandle 
     * @param {PSTR} lpTimerName 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-openwaitabletimerw
     */
    static OpenWaitableTimerA(dwDesiredAccess, bInheritHandle, lpTimerName) {
        lpTimerName := lpTimerName is String ? StrPtr(lpTimerName) : lpTimerName

        result := DllCall("KERNEL32.dll\OpenWaitableTimerA", "uint", dwDesiredAccess, "int", bInheritHandle, "ptr", lpTimerName, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * Creates or opens a named or unnamed semaphore object and returns a handle to the object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSemaphoreAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. If this parameter is <b>NULL</b>, the semaphore handle cannot be inherited by child processes. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new semaphore. If this parameter is <b>NULL</b>, the semaphore gets a default security descriptor. The ACLs in the default security descriptor for a semaphore come from the primary or impersonation token of the creator.
     * @param {Integer} lInitialCount The initial count for the semaphore object. This value must be greater than or equal to zero and less than or equal to <i>lMaximumCount</i>. The state of a semaphore is signaled when its count is greater than zero and nonsignaled when it is zero. The count is decreased by one whenever a wait function releases a thread that was waiting for the semaphore. The count is increased by a specified amount by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-releasesemaphore">ReleaseSemaphore</a> function.
     * @param {Integer} lMaximumCount The maximum count for the semaphore object. This value must be greater than zero.
     * @param {PSTR} lpName A pointer to a null-terminated string specifying the name of the semaphore object. The name is limited to <b>MAX_PATH</b> characters. Name comparison is case sensitive.
     * 
     * If <i>lpName</i> matches the name of an existing named semaphore object, the <i>lInitialCount</i> and <i>lMaximumCount</i> parameters are ignored because they have already been set by the creating process. If the <i>lpSemaphoreAttributes</i> parameter is not <b>NULL</b>, it determines whether the handle can be inherited.
     * 
     * If <i>lpName</i> is <b>NULL</b>, the semaphore object is created without a name.
     * 
     * If <i>lpName</i> matches the name of an existing event, mutex, waitable timer, job, or file-mapping object, the function fails and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_INVALID_HANDLE</b>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @param {Integer} dwDesiredAccess The access mask for the semaphore object. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the semaphore object. If the named semaphore object existed before the function call, the function returns a handle to the existing object and 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createsemaphoreexa
     * @since windows6.0.6000
     */
    static CreateSemaphoreExA(lpSemaphoreAttributes, lInitialCount, lMaximumCount, lpName, dwDesiredAccess) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        lpName := lpName is String ? StrPtr(lpName) : lpName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateSemaphoreExA", "ptr", lpSemaphoreAttributes, "int", lInitialCount, "int", lMaximumCount, "ptr", lpName, "uint", dwFlags, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpTimerAttributes 
     * @param {PSTR} lpTimerName 
     * @param {Integer} dwFlags 
     * @param {Integer} dwDesiredAccess 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createwaitabletimerexw
     */
    static CreateWaitableTimerExA(lpTimerAttributes, lpTimerName, dwFlags, dwDesiredAccess) {
        lpTimerName := lpTimerName is String ? StrPtr(lpTimerName) : lpTimerName

        result := DllCall("KERNEL32.dll\CreateWaitableTimerExA", "ptr", lpTimerAttributes, "ptr", lpTimerName, "uint", dwFlags, "uint", dwDesiredAccess, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * Retrieves the full name of the executable image for the specified process.
     * @param {HANDLE} hProcess A handle to the process. This handle must be created with the PROCESS_QUERY_INFORMATION or PROCESS_QUERY_LIMITED_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Integer} dwFlags 
     * @param {PSTR} lpExeName The path to the executable image. If the function succeeds, this string is null-terminated.
     * @param {Pointer<Integer>} lpdwSize On input, specifies the size of the <i>lpExeName</i> buffer, in characters. On success, receives the number of characters written to the buffer, not including the null-terminating character.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-queryfullprocessimagenamea
     * @since windows6.0.6000
     */
    static QueryFullProcessImageNameA(hProcess, dwFlags, lpExeName, lpdwSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        lpExeName := lpExeName is String ? StrPtr(lpExeName) : lpExeName

        lpdwSizeMarshal := lpdwSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueryFullProcessImageNameA", "ptr", hProcess, "uint", dwFlags, "ptr", lpExeName, lpdwSizeMarshal, lpdwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the full name of the executable image for the specified process.
     * @param {HANDLE} hProcess A handle to the process. This handle must be created with the PROCESS_QUERY_INFORMATION or PROCESS_QUERY_LIMITED_INFORMATION access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Integer} dwFlags 
     * @param {PWSTR} lpExeName The path to the executable image. If the function succeeds, this string is null-terminated.
     * @param {Pointer<Integer>} lpdwSize On input, specifies the size of the <i>lpExeName</i> buffer, in characters. On success, receives the number of characters written to the buffer, not including the null-terminating character.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-queryfullprocessimagenamew
     * @since windows6.0.6000
     */
    static QueryFullProcessImageNameW(hProcess, dwFlags, lpExeName, lpdwSize) {
        hProcess := hProcess is Win32Handle ? NumGet(hProcess, "ptr") : hProcess
        lpExeName := lpExeName is String ? StrPtr(lpExeName) : lpExeName

        lpdwSizeMarshal := lpdwSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueryFullProcessImageNameW", "ptr", hProcess, "uint", dwFlags, "ptr", lpExeName, lpdwSizeMarshal, lpdwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<STARTUPINFOA>} lpStartupInfo 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getstartupinfow
     */
    static GetStartupInfoA(lpStartupInfo) {
        DllCall("KERNEL32.dll\GetStartupInfoA", "ptr", lpStartupInfo)
    }

    /**
     * Creates a new process and its primary thread. Then the new process runs the specified executable file in the security context of the specified credentials (user, domain, and password). It can optionally load the user profile for a specified user.
     * @param {PWSTR} lpUsername The name of the user. This is the name of the user account to log on to. If you use the UPN format, <i>user</i>@<i>DNS_domain_name</i>, the <i>lpDomain</i> parameter must be NULL. 
     * 
     * 
     * 
     * 
     * The user account must have the Log On Locally permission on the local computer. This permission is granted to all users on workstations and servers, but only to administrators on domain controllers.
     * @param {PWSTR} lpDomain The name of the domain or server whose account database contains the <i>lpUsername</i> account. If this parameter is NULL, the user name must be specified in UPN format.
     * @param {PWSTR} lpPassword The clear-text password for the <i>lpUsername</i> account.
     * @param {Integer} dwLogonFlags 
     * @param {PWSTR} lpApplicationName The name of the module to be executed. This module can be a Windows-based application. It can be some other type of module (for example, MS-DOS or OS/2) if the appropriate subsystem is available on the local computer. 
     * 
     * 
     * 
     * 
     * The string can specify the full path and file name of the module to execute or it can specify a partial name. If it is a partial name, the function uses the current drive and current directory to complete the specification. The function does not use the search path. This parameter must include the file name extension; no default extension is assumed.
     * 
     * The <i>lpApplicationName</i> parameter can be NULL, and the module name must be the first white space–delimited token in the <i>lpCommandLine</i> string. If you are using a long file name that contains a space, use quoted strings to indicate where the file name ends and the arguments begin; otherwise, the file name is ambiguous.
     * 
     * For example, the following string can be interpreted in different ways:
     * 
     * "c:\program files\sub dir\program name"
     * 
     * The system tries to interpret the possibilities in the following order:<ol>
     * <li><b>c:\program.exe</b> files\sub dir\program name</li>
     * <li><b>c:\program files\sub.exe</b> dir\program name</li>
     * <li><b>c:\program files\sub dir\program.exe</b> name</li>
     * <li><b>c:\program files\sub dir\program name.exe</b></li>
     * </ol>
     * 
     * 
     * If the executable module is a 16-bit application, <i>lpApplicationName</i> should be NULL, and the string pointed to by <i>lpCommandLine</i> should specify the executable module and its arguments.
     * @param {PWSTR} lpCommandLine The command line to be executed. The maximum length of this string is 1024 characters. If <i>lpApplicationName</i> is <b>NULL</b>, the module name portion of <i>lpCommandLine</i> is limited to <b>MAX_PATH</b> characters.
     * 
     * The function can modify the contents of this string. Therefore, this parameter cannot be a pointer to read-only memory (such as a <b>const</b> variable or a literal string). If this parameter is a constant string, the function may cause an access violation.
     * 
     * The <i>lpCommandLine</i> parameter can be <b>NULL</b>, and the function uses the string pointed to by <i>lpApplicationName</i> as the command line.
     * 
     * If both <i>lpApplicationName</i> and <i>lpCommandLine</i> are non-<b>NULL</b>, *<i>lpApplicationName</i> specifies the module to execute, and *<i>lpCommandLine</i> specifies the command line. The new process can use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processenv/nf-processenv-getcommandlinea">GetCommandLine</a> to retrieve the entire command line. Console processes written in C can use the <i>argc</i> and <i>argv</i> arguments to parse the command line. Because <i>argv[0]</i> is the module name, C programmers typically repeat the module name as the first token in the command line.
     * 
     * If <i>lpApplicationName</i> is <b>NULL</b>, the first white space–delimited token of the command line specifies the module name. If you are using a long file name that contains a space, use quoted strings to indicate where the file name ends and the arguments begin (see the explanation for the <i>lpApplicationName</i> parameter). If the file name does not contain an extension, .exe is appended. Therefore, if the file name extension is .com, this parameter must include the .com extension. If the file name ends in a period  with no extension, or if the file name contains a path, .exe is not appended. If the file name does not contain a directory path, the system searches for the executable file in the following sequence:
     * 
     * <ol>
     * <li>The directory from which the application loaded.</li>
     * <li>The current directory for the parent process.</li>
     * <li>The 32-bit Windows system directory. Use the <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsystemdirectorya">GetSystemDirectory</a> function to get the path of this directory.</li>
     * <li>The 16-bit Windows system directory. There is no function that obtains the path of this directory, but it is searched.</li>
     * <li>The Windows directory. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getwindowsdirectorya">GetWindowsDirectory</a> function to get the path of this directory.</li>
     * <li>The directories that are listed in the PATH environment variable. Note that this function does not search the per-application path specified by the <b>App Paths</b> registry key. To include this per-application path in the search sequence, use the <a href="https://docs.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shellexecutew">ShellExecute</a> function.</li>
     * </ol>
     * The system adds a null character to the command line string to separate the file name from the arguments. This divides the original string into two strings for internal processing.
     * @param {Integer} dwCreationFlags The flags that control how the process is created. The <b>CREATE_DEFAULT_ERROR_MODE</b>, <b>CREATE_NEW_CONSOLE</b>, and <b>CREATE_NEW_PROCESS_GROUP</b> flags are enabled by default. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-creation-flags">Process Creation Flags</a>.
     * 
     * 
     * This parameter also controls the new process's priority class, which is used to determine the scheduling priorities of the process's threads. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getpriorityclass">GetPriorityClass</a>. If none of the priority class flags is specified, the priority class defaults to <b>NORMAL_PRIORITY_CLASS</b> unless the priority class of the creating process is <b>IDLE_PRIORITY_CLASS</b> or <b>BELOW_NORMAL_PRIORITY_CLASS</b>. In this case, the child process receives the default priority class of the calling process.
     * 
     * If the dwCreationFlags parameter has a value of 0:
     * 
     * - The process gets the default error mode, creates a new console and creates a new process group. 
     * - The environment block for the new process is assumed to contain ANSI characters (see *lpEnvironment* parameter for additional information).
     * - A 16-bit Windows-based application runs in a shared Virtual DOS machine (VDM).
     * @param {Pointer<Void>} lpEnvironment A pointer to an environment block for the new process. If this parameter is <b>NULL</b>, the new process uses an environment created from the profile of the user specified by <i>lpUsername</i>. 
     * 
     * 
     * 
     * 
     * An environment block consists of a null-terminated block of null-terminated strings. Each string is in the following form:
     * 
     * <i>name</i>=<i>value</i>
     * 
     * Because the equal sign (=) is used as a separator, it must not be used in the name of an environment variable.
     * 
     * An environment block can contain Unicode or ANSI characters. If the environment block pointed to by <i>lpEnvironment</i> contains Unicode characters, ensure that <i>dwCreationFlags</i> includes <b>CREATE_UNICODE_ENVIRONMENT</b>.  If this parameter is NULL and the environment block of the parent process contains Unicode characters, you must also ensure that <i>dwCreationFlags</i> includes <b>CREATE_UNICODE_ENVIRONMENT</b>.
     * 
     * An ANSI environment block is terminated by two 0 (zero) bytes: one for the last string and one more to terminate the block. A Unicode environment block is terminated by four zero bytes: two for the last string and two more to terminate the block.
     * 
     * To retrieve a copy of the environment block for a specific user, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-createenvironmentblock">CreateEnvironmentBlock</a> function.
     * @param {PWSTR} lpCurrentDirectory The full path to the current directory for the process. The string can also specify a UNC path. 
     * 
     * If this parameter is <b>NULL</b>, the new process has the same current drive and directory as the calling process. This feature is provided primarily for shells that need to start an application, and specify its initial drive and working directory.
     * @param {Pointer<STARTUPINFOW>} lpStartupInfo A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure. 
     * 
     * 
     * The application must add permission for the specified user account to the specified window station and desktop, even for WinSta0\Default.
     * 
     * If the <b>lpDesktop</b> member is <b>NULL</b> or an empty string, the new process inherits the desktop and window station of its parent process. 
     * The application must add permission for the specified user account to the inherited window station and desktop.
     * 
     * <b>Windows XP:  </b><b>CreateProcessWithLogonW</b> adds permission for the specified user account to the inherited window station and desktop. 
     * 
     * Handles in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> must be closed with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> when they are no longer needed.
     * 
     * <div class="alert"><b>Important</b>  If the <b>dwFlags</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure specifies <b>STARTF_USESTDHANDLES</b>, the standard handle fields are copied unchanged to the child process without validation. The caller is responsible for ensuring that these fields contain valid handle values.  Incorrect values can cause the child process to misbehave or crash. Use the <a href="https://docs.microsoft.com/windows-hardware/drivers/devtest/application-verifier">Application Verifier</a> runtime verification tool to detect invalid handles. </div>
     * <div> </div>
     * @param {Pointer<PROCESS_INFORMATION>} lpProcessInformation A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> structure that receives identification information for the new process, including a handle to the process. 
     * 
     * 
     * 
     * 
     * Handles in 
     * <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> must be closed with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function when they are not needed.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Note that the function returns before the process has finished initialization. If a required DLL cannot be located or fails to initialize, the process is terminated. To get the termination status of a process, call <a href="/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess">GetExitCodeProcess</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createprocesswithlogonw
     * @since windows5.1.2600
     */
    static CreateProcessWithLogonW(lpUsername, lpDomain, lpPassword, dwLogonFlags, lpApplicationName, lpCommandLine, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation) {
        lpUsername := lpUsername is String ? StrPtr(lpUsername) : lpUsername
        lpDomain := lpDomain is String ? StrPtr(lpDomain) : lpDomain
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpApplicationName := lpApplicationName is String ? StrPtr(lpApplicationName) : lpApplicationName
        lpCommandLine := lpCommandLine is String ? StrPtr(lpCommandLine) : lpCommandLine
        lpCurrentDirectory := lpCurrentDirectory is String ? StrPtr(lpCurrentDirectory) : lpCurrentDirectory

        lpEnvironmentMarshal := lpEnvironment is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CreateProcessWithLogonW", "ptr", lpUsername, "ptr", lpDomain, "ptr", lpPassword, "uint", dwLogonFlags, "ptr", lpApplicationName, "ptr", lpCommandLine, "uint", dwCreationFlags, lpEnvironmentMarshal, lpEnvironment, "ptr", lpCurrentDirectory, "ptr", lpStartupInfo, "ptr", lpProcessInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a new process and its primary thread. The new process runs in the security context of the specified token. It can optionally load the user profile for the specified user.
     * @param {HANDLE} hToken A handle to the primary token that represents a user. The handle must have the TOKEN_QUERY, TOKEN_DUPLICATE, and TOKEN_ASSIGN_PRIMARY access rights. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a>. The user represented by the token must have read and execute access to the application specified by the <i>lpApplicationName</i> or the <i>lpCommandLine</i> parameter. 
     * 
     * 
     * 
     * 
     * To get a primary token that represents the specified user, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> function. Alternatively, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetokenex">DuplicateTokenEx</a> function to convert an impersonation token into a primary token. This allows a server application that is impersonating a client to create a process that has the security context of the client.
     * 
     * <b>Terminal Services:  </b>The caller's process always runs in the caller's session, not in the session specified in the token. To run a process in the session specified in the token, use the CreateProcessAsUser function.
     * @param {Integer} dwLogonFlags 
     * @param {PWSTR} lpApplicationName The name of the module to be executed. This module can be a Windows-based application. It can be some other type of module (for example, MS-DOS or OS/2) if the appropriate subsystem is available on the local computer. 
     * 
     * 
     * 
     * 
     * The string can specify the full path and file name of the module to execute or it can specify a partial name. In the case of a partial name, the function uses the current drive and current directory to complete the specification. The function will not use the search path. This parameter must include the file name extension; no default extension is assumed.
     * 
     * The <i>lpApplicationName</i> parameter can be NULL. In that case, the module name must be the first white space–delimited token in the <i>lpCommandLine</i> string. If you are using a long file name that contains a space, use quoted strings to indicate where the file name ends and the arguments begin; otherwise, the file name is ambiguous. For example, consider the string "c:\program files\sub dir\program name". This string can be interpreted in a number of ways. The system tries to interpret the possibilities in the following order:
     * 
     * <b>c:\program.exe</b>
     * <b>c:\program files\sub.exe</b>
     * <b>c:\program files\sub dir\program.exe</b>
     * <b>c:\program files\sub dir\program name.exe</b>
     * If the executable module is a 16-bit application, <i>lpApplicationName</i> should be NULL, and the string pointed to by <i>lpCommandLine</i> should specify the executable module as well as its arguments.
     * @param {PWSTR} lpCommandLine The command line to be executed. 
     * 
     * 
     * The maximum length of this string is 1024 characters. If <i>lpApplicationName</i> is NULL, the module name portion of <i>lpCommandLine</i> is limited to MAX_PATH characters.
     * 
     * The function can modify the contents of this string. Therefore, this parameter cannot be a pointer to read-only memory (such as a <b>const</b> variable or a literal string). If this parameter is a constant string, the function may cause an access violation.
     * 
     * The <i>lpCommandLine</i> parameter can be NULL. In that case, the function uses the string pointed to by <i>lpApplicationName</i> as the command line.
     * 
     * If both <i>lpApplicationName</i> and <i>lpCommandLine</i> are non-NULL, *<i>lpApplicationName</i> specifies the module to execute, and *<i>lpCommandLine</i> specifies the command line. The new process can use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processenv/nf-processenv-getcommandlinea">GetCommandLine</a> to retrieve the entire command line. Console processes written in C can use the <i>argc</i> and <i>argv</i> arguments to parse the command line. Because argv[0] is the module name, C programmers generally repeat the module name as the first token in the command line.
     * 
     * If <i>lpApplicationName</i> is NULL, the first white space–delimited token of the command line specifies the module name. If you are using a long file name that contains a space, use quoted strings to indicate where the file name ends and the arguments begin (see the explanation for the <i>lpApplicationName</i> parameter). If the file name does not contain an extension, .exe is appended. Therefore, if the file name extension is .com, this parameter must include the .com extension. If the file name ends in a period (.) with no extension, or if the file name contains a path, .exe is not appended. If the file name does not contain a directory path, the system searches for the executable file in the following sequence:
     * 
     * <ol>
     * <li>The directory from which the application loaded.</li>
     * <li>The current directory for the parent process.</li>
     * <li>The 32-bit Windows system directory. Use the <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsystemdirectorya">GetSystemDirectory</a> function to get the path of this directory.</li>
     * <li>The 16-bit Windows system directory. There is no function that obtains the path of this directory, but it is searched.</li>
     * <li>The Windows directory. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getwindowsdirectorya">GetWindowsDirectory</a> function to get the path of this directory.</li>
     * <li>The directories that are listed in the PATH environment variable. Note that this function does not search the per-application path specified by the <b>App Paths</b> registry key. To include this per-application path in the search sequence, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/axe/shellexecute">ShellExecute</a> function.</li>
     * </ol>
     * The system adds a null character to the command line string to separate the file name from the arguments. This divides the original string into two strings for internal processing.
     * @param {Integer} dwCreationFlags The flags that control how the process is created. The CREATE_DEFAULT_ERROR_MODE, CREATE_NEW_CONSOLE, and CREATE_NEW_PROCESS_GROUP flags are enabled by default. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-creation-flags">Process Creation Flags</a>.
     * 
     * 
     * This parameter also controls the new process's priority class, which is used to determine the scheduling priorities of the process's threads. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getpriorityclass">GetPriorityClass</a>. If none of the priority class flags is specified, the priority class defaults to NORMAL_PRIORITY_CLASS unless the priority class of the creating process is IDLE_PRIORITY_CLASS or BELOW_NORMAL_PRIORITY_CLASS. In this case, the child process receives the default priority class of the calling process.
     * 
     * If the dwCreationFlags parameter has a value of 0:
     * 
     * - The process gets the default error mode, creates a new console and creates a new process group. 
     * - The environment block for the new process is assumed to contain ANSI characters (see *lpEnvironment* parameter for additional information).
     * - A 16-bit Windows-based application runs in a shared Virtual DOS machine (VDM).
     * @param {Pointer<Void>} lpEnvironment A pointer to an environment block for the new process. If this parameter is NULL, the new process uses an environment created from the profile of the user specified by <i>lpUsername</i>. 
     * 
     * 
     * 
     * 
     * An environment block consists of a null-terminated block of null-terminated strings. Each string is in the following form:
     * 
     * <i>name</i>=<i>value</i>
     * 
     * Because the equal sign (=) is used as a separator, it must not be used in the name of an environment variable.
     * 
     * An environment block can contain Unicode or ANSI characters. If the environment block pointed to by <i>lpEnvironment</i> contains Unicode characters, be sure that <i>dwCreationFlags</i> includes CREATE_UNICODE_ENVIRONMENT.  If this parameter is NULL and the environment block of the parent process contains Unicode characters, you must also ensure that <i>dwCreationFlags</i> includes CREATE_UNICODE_ENVIRONMENT.
     * 
     * An ANSI environment block is terminated by two zero bytes: one for the last string, one more to terminate the block. A Unicode environment block is terminated by four zero bytes: two for the last string and two more to terminate the block.
     * 
     * To retrieve a copy of the environment block for a specific user, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nf-userenv-createenvironmentblock">CreateEnvironmentBlock</a> function.
     * @param {PWSTR} lpCurrentDirectory The full path to the current directory for the process. The string can also specify a UNC path. 
     * 
     * If this parameter is NULL, the new process will have the same current drive and directory as the calling process. (This feature is provided primarily for shells that need to start an application and specify its initial drive and working directory.)
     * @param {Pointer<STARTUPINFOW>} lpStartupInfo A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-startupinfoexa">STARTUPINFOEX</a> structure. 
     * 
     * 
     * 
     * 
     * If the <b>lpDesktop</b> member is NULL or an empty string, the new process inherits the desktop and window station of its parent process. The function adds permission for the specified user account to the inherited window station and desktop. Otherwise, if this member specifies a desktop, it is the responsibility of the application to add permission for the specified user account to the specified window station and desktop, even for WinSta0\Default.
     * 
     * Handles in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-startupinfoexa">STARTUPINFOEX</a> must be closed with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> when they are no longer needed.
     * 
     * <div class="alert"><b>Important</b>  If the <b>dwFlags</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure specifies <b>STARTF_USESTDHANDLES</b>, the standard handle fields are copied unchanged to the child process without validation. The caller is responsible for ensuring that these fields contain valid handle values.  Incorrect values can cause the child process to misbehave or crash. Use the <a href="https://docs.microsoft.com/windows-hardware/drivers/devtest/application-verifier">Application Verifier</a> runtime verification tool to detect invalid handles. </div>
     * <div> </div>
     * @param {Pointer<PROCESS_INFORMATION>} lpProcessInformation A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> structure that receives identification information for the new process, including a handle to the process. 
     * 
     * 
     * 
     * 
     * Handles in 
     * <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> must be closed with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function when they are no longer needed.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Note that the function returns before the process has finished initialization. If a required DLL cannot be located or fails to initialize, the process is terminated. To get the termination status of a process, call <a href="/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess">GetExitCodeProcess</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createprocesswithtokenw
     * @since windows6.0.6000
     */
    static CreateProcessWithTokenW(hToken, dwLogonFlags, lpApplicationName, lpCommandLine, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken
        lpApplicationName := lpApplicationName is String ? StrPtr(lpApplicationName) : lpApplicationName
        lpCommandLine := lpCommandLine is String ? StrPtr(lpCommandLine) : lpCommandLine
        lpCurrentDirectory := lpCurrentDirectory is String ? StrPtr(lpCurrentDirectory) : lpCurrentDirectory

        lpEnvironmentMarshal := lpEnvironment is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CreateProcessWithTokenW", "ptr", hToken, "uint", dwLogonFlags, "ptr", lpApplicationName, "ptr", lpCommandLine, "uint", dwCreationFlags, lpEnvironmentMarshal, lpEnvironment, "ptr", lpCurrentDirectory, "ptr", lpStartupInfo, "ptr", lpProcessInformation, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Directs a wait thread in the thread pool to wait on the object.
     * @param {Pointer<HANDLE>} phNewWaitObject A pointer to a variable that receives a wait handle on return. Note that a wait handle cannot be used in functions that require an object handle, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
     * @param {HANDLE} hObject A handle to the object. For a list of the object types whose handles can be specified, see the following Remarks section. 
     * 
     * 
     * 
     * 
     * If this handle is closed while the wait is still pending, the function's behavior is undefined.
     * 
     * The handles must have the <b>SYNCHRONIZE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">Standard Access Rights</a>.
     * @param {Pointer<WAITORTIMERCALLBACK>} Callback A pointer to the application-defined function of type <b>WAITORTIMERCALLBACK</b> to be executed when <i>hObject</i> is in the signaled state, or <i>dwMilliseconds</i> elapses. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms687066(v=vs.85)">WaitOrTimerCallback</a>.
     * @param {Pointer<Void>} Context A single value that is passed to the callback function.
     * @param {Integer} dwMilliseconds The time-out interval, in milliseconds. The function returns if the interval elapses, even if the object's state is nonsignaled. If <i>dwMilliseconds</i> is zero, the function tests the object's state and returns immediately. If <i>dwMilliseconds</i> is <b>INFINITE</b>, the function's time-out interval never elapses.
     * @param {Integer} dwFlags 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call  
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-registerwaitforsingleobject
     * @since windows5.1.2600
     */
    static RegisterWaitForSingleObject(phNewWaitObject, hObject, Callback, Context, dwMilliseconds, dwFlags) {
        hObject := hObject is Win32Handle ? NumGet(hObject, "ptr") : hObject

        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\RegisterWaitForSingleObject", "ptr", phNewWaitObject, "ptr", hObject, "ptr", Callback, ContextMarshal, Context, "uint", dwMilliseconds, "uint", dwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Cancels a registered wait operation issued by the RegisterWaitForSingleObject function.
     * @param {HANDLE} WaitHandle The wait handle. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-registerwaitforsingleobject">RegisterWaitForSingleObject</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-unregisterwait
     * @since windows5.1.2600
     */
    static UnregisterWait(WaitHandle) {
        WaitHandle := WaitHandle is Win32Handle ? NumGet(WaitHandle, "ptr") : WaitHandle

        A_LastError := 0

        result := DllCall("KERNEL32.dll\UnregisterWait", "ptr", WaitHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} TimerQueue 
     * @param {Pointer<WAITORTIMERCALLBACK>} Callback 
     * @param {Pointer<Void>} Parameter 
     * @param {Integer} DueTime 
     * @param {Integer} Period 
     * @param {BOOL} PreferIo 
     * @returns {HANDLE} 
     */
    static SetTimerQueueTimer(TimerQueue, Callback, Parameter, DueTime, Period, PreferIo) {
        TimerQueue := TimerQueue is Win32Handle ? NumGet(TimerQueue, "ptr") : TimerQueue

        ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\SetTimerQueueTimer", "ptr", TimerQueue, "ptr", Callback, ParameterMarshal, Parameter, "uint", DueTime, "uint", Period, "int", PreferIo, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {HANDLE} TimerQueue 
     * @param {HANDLE} Timer 
     * @returns {BOOL} 
     */
    static CancelTimerQueueTimer(TimerQueue, Timer) {
        TimerQueue := TimerQueue is Win32Handle ? NumGet(TimerQueue, "ptr") : TimerQueue
        Timer := Timer is Win32Handle ? NumGet(Timer, "ptr") : Timer

        result := DllCall("KERNEL32.dll\CancelTimerQueueTimer", "ptr", TimerQueue, "ptr", Timer, "int")
        return result
    }

    /**
     * Creates a private namespace.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpPrivateNamespaceAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies the security attributes of the namespace object.
     * @param {Pointer<Void>} lpBoundaryDescriptor A descriptor that defines how the namespace is to be isolated. The caller must be within this boundary. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createboundarydescriptora">CreateBoundaryDescriptor</a> function creates a boundary descriptor.
     * @param {PSTR} lpAliasPrefix The prefix for the namespace. To create an object in this namespace, specify the object name as <i>prefix</i>&#92;<i>objectname</i>.
     * 
     * The system supports multiple private namespaces with the same name, as long as they define different boundaries.
     * @returns {HANDLE} If the function succeeds, it returns a handle to the new namespace. 
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createprivatenamespacea
     * @since windows6.0.6000
     */
    static CreatePrivateNamespaceA(lpPrivateNamespaceAttributes, lpBoundaryDescriptor, lpAliasPrefix) {
        lpAliasPrefix := lpAliasPrefix is String ? StrPtr(lpAliasPrefix) : lpAliasPrefix

        lpBoundaryDescriptorMarshal := lpBoundaryDescriptor is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreatePrivateNamespaceA", "ptr", lpPrivateNamespaceAttributes, lpBoundaryDescriptorMarshal, lpBoundaryDescriptor, "ptr", lpAliasPrefix, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Opens a private namespace.
     * @param {Pointer<Void>} lpBoundaryDescriptor A descriptor that defines how the namespace is to be isolated. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createboundarydescriptora">CreateBoundaryDescriptor</a> function creates a boundary descriptor.
     * @param {PSTR} lpAliasPrefix The prefix for the namespace. To create an object in this namespace, specify the object name as <i>prefix</i>&#92;<i>objectname</i>.
     * @returns {HANDLE} The function returns the handle to the existing namespace.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-openprivatenamespacea
     * @since windows6.0.6000
     */
    static OpenPrivateNamespaceA(lpBoundaryDescriptor, lpAliasPrefix) {
        lpAliasPrefix := lpAliasPrefix is String ? StrPtr(lpAliasPrefix) : lpAliasPrefix

        lpBoundaryDescriptorMarshal := lpBoundaryDescriptor is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\OpenPrivateNamespaceA", lpBoundaryDescriptorMarshal, lpBoundaryDescriptor, "ptr", lpAliasPrefix, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * Creates a boundary descriptor.
     * @param {PSTR} Name The name of the boundary descriptor.
     * @param {Integer} Flags This parameter is reserved for future use.
     * @returns {HANDLE} If the function succeeds, the return value is a handle to the boundary descriptor.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createboundarydescriptora
     * @since windows6.0.6000
     */
    static CreateBoundaryDescriptorA(Name, Flags) {
        Name := Name is String ? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CreateBoundaryDescriptorA", "ptr", Name, "uint", Flags, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Adds a new required security identifier (SID) to the specified boundary descriptor.
     * @param {Pointer<HANDLE>} BoundaryDescriptor A handle to the boundary descriptor. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createboundarydescriptora">CreateBoundaryDescriptor</a> function returns this handle.
     * @param {PSID} IntegrityLabel A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that represents the mandatory integrity level for the namespace. Use one of the following RID values to create the SID:
     * 
     * <b>SECURITY_MANDATORY_UNTRUSTED_RID</b>
     * <b>SECURITY_MANDATORY_LOW_RID</b>
     * <b>SECURITY_MANDATORY_MEDIUM_RID</b>
     * <b>SECURITY_MANDATORY_SYSTEM_RID</b>
     * <b>SECURITY_MANDATORY_PROTECTED_PROCESS_RID</b>
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/well-known-sids">Well-Known SIDs</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-addintegritylabeltoboundarydescriptor
     * @since windows6.1
     */
    static AddIntegrityLabelToBoundaryDescriptor(BoundaryDescriptor, IntegrityLabel) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddIntegrityLabelToBoundaryDescriptor", "ptr", BoundaryDescriptor, "ptr", IntegrityLabel, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the number of active processor groups in the system.
     * @returns {Integer} If the function succeeds, the return value is the number of active processor groups in the system.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getactiveprocessorgroupcount
     * @since windows6.1
     */
    static GetActiveProcessorGroupCount() {
        result := DllCall("KERNEL32.dll\GetActiveProcessorGroupCount", "ushort")
        return result
    }

    /**
     * Returns the maximum number of processor groups that the system can have.
     * @returns {Integer} If the function succeeds, the return value is the maximum number of processor groups that the system can have.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getmaximumprocessorgroupcount
     * @since windows6.1
     */
    static GetMaximumProcessorGroupCount() {
        result := DllCall("KERNEL32.dll\GetMaximumProcessorGroupCount", "ushort")
        return result
    }

    /**
     * Returns the number of active processors in a processor group or in the system.
     * @param {Integer} GroupNumber The processor group number. If this parameter is ALL_PROCESSOR_GROUPS, the function returns the number of active processors in the system.
     * @returns {Integer} If the function succeeds, the return value is the number of active processors in the specified group.
     * 
     * If the function fails, the return value is zero. To get extended error information, use <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getactiveprocessorcount
     * @since windows6.1
     */
    static GetActiveProcessorCount(GroupNumber) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetActiveProcessorCount", "ushort", GroupNumber, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the maximum number of logical processors that a processor group or the system can have.
     * @param {Integer} GroupNumber The processor group number. If this parameter is ALL_PROCESSOR_GROUPS, the function returns the maximum number of processors that the system can have.
     * @returns {Integer} If the function succeeds, the return value is the maximum number of processors that the specified group can have.
     * 
     * If the function fails, the return value is zero. To get extended error information, use <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getmaximumprocessorcount
     * @since windows6.1
     */
    static GetMaximumProcessorCount(GroupNumber) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetMaximumProcessorCount", "ushort", GroupNumber, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the node number for the specified processor.
     * @param {Integer} Processor The processor number.
     * 
     * On a system with more than 64 logical processors, the processor number is relative to the <a href="https://docs.microsoft.com/windows/desktop/ProcThread/processor-groups">processor group</a> that contains the processor on which the calling thread is running.
     * @param {Pointer<Integer>} NodeNumber The node number. If the processor does not exist, this parameter is 0xFF.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnumaprocessornode
     * @since windows6.0.6000
     */
    static GetNumaProcessorNode(Processor, NodeNumber) {
        NodeNumberMarshal := NodeNumber is VarRef ? "char*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNumaProcessorNode", "char", Processor, NodeNumberMarshal, NodeNumber, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the NUMA node associated with the file or I/O device represented by the specified file handle.
     * @param {HANDLE} hFile A handle to a file or I/O device. Examples of I/O devices include files, file streams, volumes, physical disks, and sockets. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
     * @param {Pointer<Integer>} NodeNumber A pointer to a variable to receive the number of the NUMA node associated with the specified file handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, use <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnumanodenumberfromhandle
     * @since windows6.1
     */
    static GetNumaNodeNumberFromHandle(hFile, NodeNumber) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        NodeNumberMarshal := NodeNumber is VarRef ? "ushort*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNumaNodeNumberFromHandle", "ptr", hFile, NodeNumberMarshal, NodeNumber, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the node number as a USHORT value for the specified logical processor.
     * @param {Pointer<PROCESSOR_NUMBER>} Processor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_number">PROCESSOR_NUMBER</a> structure that represents the logical processor and the processor group to which it is assigned.
     * @param {Pointer<Integer>} NodeNumber A pointer  to a variable to receive the node number. If the specified processor does not exist, this parameter is set to MAXUSHORT.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnumaprocessornodeex
     * @since windows6.1
     */
    static GetNumaProcessorNodeEx(Processor, NodeNumber) {
        NodeNumberMarshal := NodeNumber is VarRef ? "ushort*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNumaProcessorNodeEx", "ptr", Processor, NodeNumberMarshal, NodeNumber, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the processor mask for the specified node.
     * @param {Integer} Node The number of the node.
     * @param {Pointer<Integer>} ProcessorMask The processor mask for the node. A processor mask is a bit vector in which each bit represents a processor and whether it is in the node.
     * 
     * If the node has no processors configured, the processor mask is zero.
     * 
     * On systems with more than 64 processors, this parameter is set to the processor mask for the node only if the node is in the same <a href="https://docs.microsoft.com/windows/desktop/ProcThread/processor-groups">processor group</a> as the calling thread. Otherwise, the parameter is set to zero.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnumanodeprocessormask
     * @since windows6.0.6000
     */
    static GetNumaNodeProcessorMask(Node, ProcessorMask) {
        ProcessorMaskMarshal := ProcessorMask is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNumaNodeProcessorMask", "char", Node, ProcessorMaskMarshal, ProcessorMask, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the amount of memory available in the specified node.
     * @param {Integer} Node The number of the node.
     * @param {Pointer<Integer>} AvailableBytes The amount of available memory for the node, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnumaavailablememorynode
     * @since windows6.0.6000
     */
    static GetNumaAvailableMemoryNode(Node, AvailableBytes) {
        AvailableBytesMarshal := AvailableBytes is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNumaAvailableMemoryNode", "char", Node, AvailableBytesMarshal, AvailableBytes, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the amount of memory that is available in a node specified as a USHORT value.
     * @param {Integer} Node The number of the node.
     * @param {Pointer<Integer>} AvailableBytes The amount of available memory for the node, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnumaavailablememorynodeex
     * @since windows6.1
     */
    static GetNumaAvailableMemoryNodeEx(Node, AvailableBytes) {
        AvailableBytesMarshal := AvailableBytes is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNumaAvailableMemoryNodeEx", "ushort", Node, AvailableBytesMarshal, AvailableBytes, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the NUMA node number that corresponds to the specified proximity domain identifier.
     * @param {Integer} ProximityId The proximity domain identifier of the node.
     * @param {Pointer<Integer>} NodeNumber The node number. If the processor does not exist, this parameter is 0xFF.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error  information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getnumaproximitynode
     * @since windows6.0.6000
     */
    static GetNumaProximityNode(ProximityId, NodeNumber) {
        NodeNumberMarshal := NodeNumber is VarRef ? "char*" : "ptr"

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetNumaProximityNode", "uint", ProximityId, NodeNumberMarshal, NodeNumber, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
