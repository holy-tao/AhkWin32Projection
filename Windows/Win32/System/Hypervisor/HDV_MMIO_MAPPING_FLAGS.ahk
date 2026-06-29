#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct HDV_MMIO_MAPPING_FLAGS {
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
    static HdvMmioMappingFlagNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static HdvMmioMappingFlagWriteable => 1

    /**
     * @type {Integer (Int32)}
     */
    static HdvMmioMappingFlagExecutable => 2
}
