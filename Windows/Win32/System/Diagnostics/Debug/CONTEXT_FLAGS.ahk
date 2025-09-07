#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class CONTEXT_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_AMD64 => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_CONTROL_AMD64 => 1048577

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_INTEGER_AMD64 => 1048578

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_SEGMENTS_AMD64 => 1048580

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_FLOATING_POINT_AMD64 => 1048584

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_DEBUG_REGISTERS_AMD64 => 1048592

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_FULL_AMD64 => 1048587

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_ALL_AMD64 => 1048607

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_XSTATE_AMD64 => 1048640

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_KERNEL_CET_AMD64 => 1048704

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_KERNEL_DEBUGGER_AMD64 => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_EXCEPTION_ACTIVE_AMD64 => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_SERVICE_ACTIVE_AMD64 => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_EXCEPTION_REQUEST_AMD64 => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_EXCEPTION_REPORTING_AMD64 => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_UNWOUND_TO_CALL_AMD64 => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_X86 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_CONTROL_X86 => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_INTEGER_X86 => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_SEGMENTS_X86 => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_FLOATING_POINT_X86 => 65544

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_DEBUG_REGISTERS_X86 => 65552

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_EXTENDED_REGISTERS_X86 => 65568

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_FULL_X86 => 65543

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_ALL_X86 => 65599

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_XSTATE_X86 => 65600

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_EXCEPTION_ACTIVE_X86 => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_SERVICE_ACTIVE_X86 => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_EXCEPTION_REQUEST_X86 => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_EXCEPTION_REPORTING_X86 => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_ARM64 => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_CONTROL_ARM64 => 4194305

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_INTEGER_ARM64 => 4194306

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_FLOATING_POINT_ARM64 => 4194308

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_DEBUG_REGISTERS_ARM64 => 4194312

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_X18_ARM64 => 4194320

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_FULL_ARM64 => 4194311

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_ALL_ARM64 => 4194335

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_EXCEPTION_ACTIVE_ARM64 => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_SERVICE_ACTIVE_ARM64 => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_EXCEPTION_REQUEST_ARM64 => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_EXCEPTION_REPORTING_ARM64 => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_UNWOUND_TO_CALL_ARM64 => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_RET_TO_GUEST_ARM64 => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_ARM => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_CONTROL_ARM => 2097153

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_INTEGER_ARM => 2097154

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_FLOATING_POINT_ARM => 2097156

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_DEBUG_REGISTERS_ARM => 2097160

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_FULL_ARM => 2097159

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_ALL_ARM => 2097167

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_EXCEPTION_ACTIVE_ARM => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_SERVICE_ACTIVE_ARM => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_EXCEPTION_REQUEST_ARM => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_EXCEPTION_REPORTING_ARM => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CONTEXT_UNWOUND_TO_CALL_ARM => 536870912
}
