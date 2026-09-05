#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class WOW64_CONTEXT_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: WOW64_CONTEXT_X86
     * @type {Integer (UInt32)}
     */
    static X86 => 65536

    /**
     * Native name: WOW64_CONTEXT_CONTROL
     * @type {Integer (UInt32)}
     */
    static CONTROL => 65537

    /**
     * Native name: WOW64_CONTEXT_INTEGER
     * @type {Integer (UInt32)}
     */
    static INTEGER => 65538

    /**
     * Native name: WOW64_CONTEXT_SEGMENTS
     * @type {Integer (UInt32)}
     */
    static SEGMENTS => 65540

    /**
     * Native name: WOW64_CONTEXT_FLOATING_POINT
     * @type {Integer (UInt32)}
     */
    static FLOATING_POINT => 65544

    /**
     * Native name: WOW64_CONTEXT_DEBUG_REGISTERS
     * @type {Integer (UInt32)}
     */
    static DEBUG_REGISTERS => 65552

    /**
     * Native name: WOW64_CONTEXT_EXTENDED_REGISTERS
     * @type {Integer (UInt32)}
     */
    static EXTENDED_REGISTERS => 65568

    /**
     * Native name: WOW64_CONTEXT_FULL
     * @type {Integer (UInt32)}
     */
    static FULL => 65543

    /**
     * Native name: WOW64_CONTEXT_ALL
     * @type {Integer (UInt32)}
     */
    static ALL => 65599

    /**
     * Native name: WOW64_CONTEXT_XSTATE
     * @type {Integer (UInt32)}
     */
    static XSTATE => 65600

    /**
     * Native name: WOW64_CONTEXT_EXCEPTION_ACTIVE
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_ACTIVE => 134217728

    /**
     * Native name: WOW64_CONTEXT_SERVICE_ACTIVE
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACTIVE => 268435456

    /**
     * Native name: WOW64_CONTEXT_EXCEPTION_REQUEST
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_REQUEST => 1073741824

    /**
     * Native name: WOW64_CONTEXT_EXCEPTION_REPORTING
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_REPORTING => 2147483648
}
