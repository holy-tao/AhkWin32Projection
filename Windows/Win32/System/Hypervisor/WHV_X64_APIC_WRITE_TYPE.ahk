#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_APIC_WRITE_TYPE {
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
    static WHvX64ApicWriteTypeLdr => 208

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ApicWriteTypeDfr => 224

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ApicWriteTypeSvr => 240

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ApicWriteTypeLint0 => 848

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64ApicWriteTypeLint1 => 864
}
