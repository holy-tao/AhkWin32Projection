#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorILMethodFlags {
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
    static CorILMethod_InitLocals => 16

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_MoreSects => 8

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_CompressedIL => 64

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_FormatShift => 3

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_FormatMask => 7

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_TinyFormat => 2

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_SmallFormat => 0

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_FatFormat => 3

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_TinyFormat1 => 6
}
