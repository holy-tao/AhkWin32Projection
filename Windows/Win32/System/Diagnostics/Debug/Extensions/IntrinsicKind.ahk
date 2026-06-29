#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IntrinsicKind {
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
    static IntrinsicVoid => 0

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicBool => 1

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicChar => 2

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicWChar => 3

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicInt => 4

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicUInt => 5

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicLong => 6

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicULong => 7

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicFloat => 8

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicHRESULT => 9

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicChar16 => 10

    /**
     * @type {Integer (Int32)}
     */
    static IntrinsicChar32 => 11
}
