#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_INTERFACE_TYPE {
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
    static NdisInterfaceInternal => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfaceIsa => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfaceEisa => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfaceMca => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfaceTurboChannel => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfacePci => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfacePcMcia => 8

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfaceCBus => 9

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfaceMPIBus => 10

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfaceMPSABus => 11

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfaceProcessorInternal => 12

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfaceInternalPowerBus => 13

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfacePNPISABus => 14

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfacePNPBus => 15

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfaceUSB => 16

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterfaceIrda => 17

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterface1394 => 18

    /**
     * @type {Integer (Int32)}
     */
    static NdisMaximumInterfaceType => 19
}
