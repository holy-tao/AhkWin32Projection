#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MEM_SECTION_EXTENDED_PARAMETER_TYPE {
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
    static MemSectionExtendedParameterInvalidType => 0

    /**
     * @type {Integer (Int32)}
     */
    static MemSectionExtendedParameterUserPhysicalFlags => 1

    /**
     * @type {Integer (Int32)}
     */
    static MemSectionExtendedParameterNumaNode => 2

    /**
     * @type {Integer (Int32)}
     */
    static MemSectionExtendedParameterSigningLevel => 3

    /**
     * @type {Integer (Int32)}
     */
    static MemSectionExtendedParameterMax => 4
}
