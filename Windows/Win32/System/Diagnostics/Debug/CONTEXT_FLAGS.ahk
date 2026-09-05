#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class CONTEXT_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CONTEXT_AMD64
     * @type {Integer (UInt32)}
     */
    static AMD64 => 1048576

    /**
     * Native name: CONTEXT_CONTROL_AMD64
     * @type {Integer (UInt32)}
     */
    static CONTROL_AMD64 => 1048577

    /**
     * Native name: CONTEXT_INTEGER_AMD64
     * @type {Integer (UInt32)}
     */
    static INTEGER_AMD64 => 1048578

    /**
     * Native name: CONTEXT_SEGMENTS_AMD64
     * @type {Integer (UInt32)}
     */
    static SEGMENTS_AMD64 => 1048580

    /**
     * Native name: CONTEXT_FLOATING_POINT_AMD64
     * @type {Integer (UInt32)}
     */
    static FLOATING_POINT_AMD64 => 1048584

    /**
     * Native name: CONTEXT_DEBUG_REGISTERS_AMD64
     * @type {Integer (UInt32)}
     */
    static DEBUG_REGISTERS_AMD64 => 1048592

    /**
     * Native name: CONTEXT_FULL_AMD64
     * @type {Integer (UInt32)}
     */
    static FULL_AMD64 => 1048587

    /**
     * Native name: CONTEXT_ALL_AMD64
     * @type {Integer (UInt32)}
     */
    static ALL_AMD64 => 1048607

    /**
     * Native name: CONTEXT_XSTATE_AMD64
     * @type {Integer (UInt32)}
     */
    static XSTATE_AMD64 => 1048640

    /**
     * Native name: CONTEXT_KERNEL_CET_AMD64
     * @type {Integer (UInt32)}
     */
    static KERNEL_CET_AMD64 => 1048704

    /**
     * Native name: CONTEXT_KERNEL_DEBUGGER_AMD64
     * @type {Integer (UInt32)}
     */
    static KERNEL_DEBUGGER_AMD64 => 67108864

    /**
     * Native name: CONTEXT_EXCEPTION_ACTIVE_AMD64
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_ACTIVE_AMD64 => 134217728

    /**
     * Native name: CONTEXT_SERVICE_ACTIVE_AMD64
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACTIVE_AMD64 => 268435456

    /**
     * Native name: CONTEXT_EXCEPTION_REQUEST_AMD64
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_REQUEST_AMD64 => 1073741824

    /**
     * Native name: CONTEXT_EXCEPTION_REPORTING_AMD64
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_REPORTING_AMD64 => 2147483648

    /**
     * Native name: CONTEXT_UNWOUND_TO_CALL_AMD64
     * @type {Integer (UInt32)}
     */
    static UNWOUND_TO_CALL_AMD64 => 536870912

    /**
     * Native name: CONTEXT_X86
     * @type {Integer (UInt32)}
     */
    static X86 => 65536

    /**
     * Native name: CONTEXT_CONTROL_X86
     * @type {Integer (UInt32)}
     */
    static CONTROL_X86 => 65537

    /**
     * Native name: CONTEXT_INTEGER_X86
     * @type {Integer (UInt32)}
     */
    static INTEGER_X86 => 65538

    /**
     * Native name: CONTEXT_SEGMENTS_X86
     * @type {Integer (UInt32)}
     */
    static SEGMENTS_X86 => 65540

    /**
     * Native name: CONTEXT_FLOATING_POINT_X86
     * @type {Integer (UInt32)}
     */
    static FLOATING_POINT_X86 => 65544

    /**
     * Native name: CONTEXT_DEBUG_REGISTERS_X86
     * @type {Integer (UInt32)}
     */
    static DEBUG_REGISTERS_X86 => 65552

    /**
     * Native name: CONTEXT_EXTENDED_REGISTERS_X86
     * @type {Integer (UInt32)}
     */
    static EXTENDED_REGISTERS_X86 => 65568

    /**
     * Native name: CONTEXT_FULL_X86
     * @type {Integer (UInt32)}
     */
    static FULL_X86 => 65543

    /**
     * Native name: CONTEXT_ALL_X86
     * @type {Integer (UInt32)}
     */
    static ALL_X86 => 65599

    /**
     * Native name: CONTEXT_XSTATE_X86
     * @type {Integer (UInt32)}
     */
    static XSTATE_X86 => 65600

    /**
     * Native name: CONTEXT_EXCEPTION_ACTIVE_X86
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_ACTIVE_X86 => 134217728

    /**
     * Native name: CONTEXT_SERVICE_ACTIVE_X86
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACTIVE_X86 => 268435456

    /**
     * Native name: CONTEXT_EXCEPTION_REQUEST_X86
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_REQUEST_X86 => 1073741824

    /**
     * Native name: CONTEXT_EXCEPTION_REPORTING_X86
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_REPORTING_X86 => 2147483648

    /**
     * Native name: CONTEXT_ARM64
     * @type {Integer (UInt32)}
     */
    static ARM64 => 4194304

    /**
     * Native name: CONTEXT_CONTROL_ARM64
     * @type {Integer (UInt32)}
     */
    static CONTROL_ARM64 => 4194305

    /**
     * Native name: CONTEXT_INTEGER_ARM64
     * @type {Integer (UInt32)}
     */
    static INTEGER_ARM64 => 4194306

    /**
     * Native name: CONTEXT_FLOATING_POINT_ARM64
     * @type {Integer (UInt32)}
     */
    static FLOATING_POINT_ARM64 => 4194308

    /**
     * Native name: CONTEXT_DEBUG_REGISTERS_ARM64
     * @type {Integer (UInt32)}
     */
    static DEBUG_REGISTERS_ARM64 => 4194312

    /**
     * Native name: CONTEXT_X18_ARM64
     * @type {Integer (UInt32)}
     */
    static X18_ARM64 => 4194320

    /**
     * Native name: CONTEXT_FULL_ARM64
     * @type {Integer (UInt32)}
     */
    static FULL_ARM64 => 4194311

    /**
     * Native name: CONTEXT_ALL_ARM64
     * @type {Integer (UInt32)}
     */
    static ALL_ARM64 => 4194335

    /**
     * Native name: CONTEXT_EXCEPTION_ACTIVE_ARM64
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_ACTIVE_ARM64 => 134217728

    /**
     * Native name: CONTEXT_SERVICE_ACTIVE_ARM64
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACTIVE_ARM64 => 268435456

    /**
     * Native name: CONTEXT_EXCEPTION_REQUEST_ARM64
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_REQUEST_ARM64 => 1073741824

    /**
     * Native name: CONTEXT_EXCEPTION_REPORTING_ARM64
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_REPORTING_ARM64 => 2147483648

    /**
     * Native name: CONTEXT_UNWOUND_TO_CALL_ARM64
     * @type {Integer (UInt32)}
     */
    static UNWOUND_TO_CALL_ARM64 => 536870912

    /**
     * Native name: CONTEXT_RET_TO_GUEST_ARM64
     * @type {Integer (UInt32)}
     */
    static RET_TO_GUEST_ARM64 => 1073741824

    /**
     * Native name: CONTEXT_ARM
     * @type {Integer (UInt32)}
     */
    static ARM => 2097152

    /**
     * Native name: CONTEXT_CONTROL_ARM
     * @type {Integer (UInt32)}
     */
    static CONTROL_ARM => 2097153

    /**
     * Native name: CONTEXT_INTEGER_ARM
     * @type {Integer (UInt32)}
     */
    static INTEGER_ARM => 2097154

    /**
     * Native name: CONTEXT_FLOATING_POINT_ARM
     * @type {Integer (UInt32)}
     */
    static FLOATING_POINT_ARM => 2097156

    /**
     * Native name: CONTEXT_DEBUG_REGISTERS_ARM
     * @type {Integer (UInt32)}
     */
    static DEBUG_REGISTERS_ARM => 2097160

    /**
     * Native name: CONTEXT_FULL_ARM
     * @type {Integer (UInt32)}
     */
    static FULL_ARM => 2097159

    /**
     * Native name: CONTEXT_ALL_ARM
     * @type {Integer (UInt32)}
     */
    static ALL_ARM => 2097167

    /**
     * Native name: CONTEXT_EXCEPTION_ACTIVE_ARM
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_ACTIVE_ARM => 134217728

    /**
     * Native name: CONTEXT_SERVICE_ACTIVE_ARM
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACTIVE_ARM => 268435456

    /**
     * Native name: CONTEXT_EXCEPTION_REQUEST_ARM
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_REQUEST_ARM => 1073741824

    /**
     * Native name: CONTEXT_EXCEPTION_REPORTING_ARM
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_REPORTING_ARM => 2147483648

    /**
     * Native name: CONTEXT_UNWOUND_TO_CALL_ARM
     * @type {Integer (UInt32)}
     */
    static UNWOUND_TO_CALL_ARM => 536870912
}
