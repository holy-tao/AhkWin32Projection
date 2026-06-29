#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct INTERFACE_TYPE {
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
    static InterfaceTypeUndefined => -1

    /**
     * @type {Integer (Int32)}
     */
    static Internal => 0

    /**
     * @type {Integer (Int32)}
     */
    static Isa => 1

    /**
     * @type {Integer (Int32)}
     */
    static Eisa => 2

    /**
     * @type {Integer (Int32)}
     */
    static MicroChannel => 3

    /**
     * @type {Integer (Int32)}
     */
    static TurboChannel => 4

    /**
     * @type {Integer (Int32)}
     */
    static PCIBus => 5

    /**
     * @type {Integer (Int32)}
     */
    static VMEBus => 6

    /**
     * @type {Integer (Int32)}
     */
    static NuBus => 7

    /**
     * @type {Integer (Int32)}
     */
    static PCMCIABus => 8

    /**
     * @type {Integer (Int32)}
     */
    static CBus => 9

    /**
     * @type {Integer (Int32)}
     */
    static MPIBus => 10

    /**
     * @type {Integer (Int32)}
     */
    static MPSABus => 11

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorInternal => 12

    /**
     * @type {Integer (Int32)}
     */
    static InternalPowerBus => 13

    /**
     * @type {Integer (Int32)}
     */
    static PNPISABus => 14

    /**
     * @type {Integer (Int32)}
     */
    static PNPBus => 15

    /**
     * @type {Integer (Int32)}
     */
    static Vmcs => 16

    /**
     * @type {Integer (Int32)}
     */
    static ACPIBus => 17

    /**
     * @type {Integer (Int32)}
     */
    static MaximumInterfaceType => 18
}
