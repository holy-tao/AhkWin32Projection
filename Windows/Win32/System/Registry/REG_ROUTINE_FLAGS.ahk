#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Registry
 */
export default struct REG_ROUTINE_FLAGS {
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
    static RRF_RT_DWORD => 24

    /**
     * @type {Integer (UInt32)}
     */
    static RRF_RT_QWORD => 72

    /**
     * @type {Integer (UInt32)}
     */
    static RRF_RT_REG_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RRF_RT_REG_SZ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RRF_RT_REG_EXPAND_SZ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RRF_RT_REG_BINARY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RRF_RT_REG_DWORD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RRF_RT_REG_MULTI_SZ => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RRF_RT_REG_QWORD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RRF_RT_ANY => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static RRF_SUBKEY_WOW6464KEY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static RRF_SUBKEY_WOW6432KEY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static RRF_WOW64_MASK => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static RRF_NOEXPAND => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static RRF_ZEROONFAILURE => 536870912
}
