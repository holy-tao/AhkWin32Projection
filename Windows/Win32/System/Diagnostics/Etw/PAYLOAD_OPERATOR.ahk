#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the supported payload operators for a trace data helper (TDH).
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ne-tdh-payload_operator
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct PAYLOAD_OPERATOR {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_EQ => 0

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_NE => 1

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_LE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_GT => 3

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_LT => 4

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_GE => 5

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_BETWEEN => 6

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_NOTBETWEEN => 7

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_MODULO => 8

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_CONTAINS => 20

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_DOESNTCONTAIN => 21

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_IS => 30

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_ISNOT => 31

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_INVALID => 32
}
