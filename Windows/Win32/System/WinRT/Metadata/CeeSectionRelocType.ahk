#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CeeSectionRelocType {
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
    static srRelocAbsolute => 0

    /**
     * @type {Integer (Int32)}
     */
    static srRelocHighLow => 3

    /**
     * @type {Integer (Int32)}
     */
    static srRelocHighAdj => 4

    /**
     * @type {Integer (Int32)}
     */
    static srRelocMapToken => 5

    /**
     * @type {Integer (Int32)}
     */
    static srRelocRelative => 6

    /**
     * @type {Integer (Int32)}
     */
    static srRelocFilePos => 7

    /**
     * @type {Integer (Int32)}
     */
    static srRelocCodeRelative => 8

    /**
     * @type {Integer (Int32)}
     */
    static srRelocIA64Imm64 => 9

    /**
     * @type {Integer (Int32)}
     */
    static srRelocDir64 => 10

    /**
     * @type {Integer (Int32)}
     */
    static srRelocIA64PcRel25 => 11

    /**
     * @type {Integer (Int32)}
     */
    static srRelocIA64PcRel64 => 12

    /**
     * @type {Integer (Int32)}
     */
    static srRelocAbsoluteTagged => 13

    /**
     * @type {Integer (Int32)}
     */
    static srRelocSentinel => 14

    /**
     * @type {Integer (Int32)}
     */
    static srNoBaseReloc => 16384

    /**
     * @type {Integer (Int32)}
     */
    static srRelocPtr => 32768

    /**
     * @type {Integer (Int32)}
     */
    static srRelocAbsolutePtr => 32768

    /**
     * @type {Integer (Int32)}
     */
    static srRelocHighLowPtr => 32771

    /**
     * @type {Integer (Int32)}
     */
    static srRelocRelativePtr => 32774

    /**
     * @type {Integer (Int32)}
     */
    static srRelocIA64Imm64Ptr => 32777

    /**
     * @type {Integer (Int32)}
     */
    static srRelocDir64Ptr => 32778
}
