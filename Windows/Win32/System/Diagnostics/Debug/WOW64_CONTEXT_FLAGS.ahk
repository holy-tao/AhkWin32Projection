#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WOW64_CONTEXT_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_CONTEXT_X86 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_CONTEXT_CONTROL => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_CONTEXT_INTEGER => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_CONTEXT_SEGMENTS => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_CONTEXT_FLOATING_POINT => 65544

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_CONTEXT_DEBUG_REGISTERS => 65552

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_CONTEXT_EXTENDED_REGISTERS => 65568

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_CONTEXT_FULL => 65543

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_CONTEXT_ALL => 65599

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_CONTEXT_XSTATE => 65600

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_CONTEXT_EXCEPTION_ACTIVE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_CONTEXT_SERVICE_ACTIVE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_CONTEXT_EXCEPTION_REQUEST => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static WOW64_CONTEXT_EXCEPTION_REPORTING => 2147483648
}
