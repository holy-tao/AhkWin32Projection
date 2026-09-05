#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IRQ_DEVICE_POLICY extends Win32Enum {

    /**
     * Native name: IrqPolicyMachineDefault
     * @type {Integer (Int32)}
     */
    static MachineDefault => 0

    /**
     * Native name: IrqPolicyAllCloseProcessors
     * @type {Integer (Int32)}
     */
    static AllCloseProcessors => 1

    /**
     * Native name: IrqPolicyOneCloseProcessor
     * @type {Integer (Int32)}
     */
    static OneCloseProcessor => 2

    /**
     * Native name: IrqPolicyAllProcessorsInMachine
     * @type {Integer (Int32)}
     */
    static AllProcessorsInMachine => 3

    /**
     * Native name: IrqPolicySpecifiedProcessors
     * @type {Integer (Int32)}
     */
    static SpecifiedProcessors => 4

    /**
     * Native name: IrqPolicySpreadMessagesAcrossAllProcessors
     * @type {Integer (Int32)}
     */
    static SpreadMessagesAcrossAllProcessors => 5

    /**
     * Native name: IrqPolicyAllProcessorsInMachineWhenSteered
     * @type {Integer (Int32)}
     */
    static AllProcessorsInMachineWhenSteered => 6
}
