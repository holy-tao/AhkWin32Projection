#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_INTERFACE_TYPE extends Win32Enum {

    /**
     * Native name: NdisInterfaceInternal
     * @type {Integer (Int32)}
     */
    static Internal => 0

    /**
     * Native name: NdisInterfaceIsa
     * @type {Integer (Int32)}
     */
    static Isa => 1

    /**
     * Native name: NdisInterfaceEisa
     * @type {Integer (Int32)}
     */
    static Eisa => 2

    /**
     * Native name: NdisInterfaceMca
     * @type {Integer (Int32)}
     */
    static Mca => 3

    /**
     * Native name: NdisInterfaceTurboChannel
     * @type {Integer (Int32)}
     */
    static TurboChannel => 4

    /**
     * Native name: NdisInterfacePci
     * @type {Integer (Int32)}
     */
    static Pci => 5

    /**
     * Native name: NdisInterfacePcMcia
     * @type {Integer (Int32)}
     */
    static PcMcia => 8

    /**
     * Native name: NdisInterfaceCBus
     * @type {Integer (Int32)}
     */
    static InterfaceCBus => 9

    /**
     * Native name: NdisInterfaceMPIBus
     * @type {Integer (Int32)}
     */
    static InterfaceMPIBus => 10

    /**
     * Native name: NdisInterfaceMPSABus
     * @type {Integer (Int32)}
     */
    static InterfaceMPSABus => 11

    /**
     * Native name: NdisInterfaceProcessorInternal
     * @type {Integer (Int32)}
     */
    static ProcessorInternal => 12

    /**
     * Native name: NdisInterfaceInternalPowerBus
     * @type {Integer (Int32)}
     */
    static InternalPowerBus => 13

    /**
     * Native name: NdisInterfacePNPISABus
     * @type {Integer (Int32)}
     */
    static InterfacePNPISABus => 14

    /**
     * Native name: NdisInterfacePNPBus
     * @type {Integer (Int32)}
     */
    static InterfacePNPBus => 15

    /**
     * Native name: NdisInterfaceUSB
     * @type {Integer (Int32)}
     */
    static InterfaceUSB => 16

    /**
     * Native name: NdisInterfaceIrda
     * @type {Integer (Int32)}
     */
    static Irda => 17

    /**
     * Native name: NdisInterface1394
     * @type {Integer (Int32)}
     */
    static Interface1394 => 18

    /**
     * Native name: NdisMaximumInterfaceType
     * @type {Integer (Int32)}
     */
    static MaximumInterfaceType => 19
}
