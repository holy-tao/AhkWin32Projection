#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class INTERFACE_TYPE extends Win32Enum{

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
