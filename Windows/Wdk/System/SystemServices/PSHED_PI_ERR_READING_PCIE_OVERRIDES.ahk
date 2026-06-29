#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PSHED_PI_ERR_READING_PCIE_OVERRIDES {
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
    static PshedPiErrReadingPcieOverridesNoErr => 0

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiErrReadingPcieOverridesNoMemory => 1

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiErrReadingPcieOverridesQueryErr => 2

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiErrReadingPcieOverridesBadSize => 3

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiErrReadingPcieOverridesBadSignature => 4

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiErrReadingPcieOverridesNoCapOffset => 5

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiErrReadingPcieOverridesNotBinary => 6
}
