#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorILMethodSect {
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
    static CorILMethod_Sect_Reserved => 0

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_Sect_EHTable => 1

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_Sect_OptILTable => 2

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_Sect_KindMask => 63

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_Sect_FatFormat => 64

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_Sect_MoreSects => 128
}
