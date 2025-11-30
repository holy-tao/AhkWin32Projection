#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IRQ_DEVICE_POLICY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IrqPolicyMachineDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static IrqPolicyAllCloseProcessors => 1

    /**
     * @type {Integer (Int32)}
     */
    static IrqPolicyOneCloseProcessor => 2

    /**
     * @type {Integer (Int32)}
     */
    static IrqPolicyAllProcessorsInMachine => 3

    /**
     * @type {Integer (Int32)}
     */
    static IrqPolicySpecifiedProcessors => 4

    /**
     * @type {Integer (Int32)}
     */
    static IrqPolicySpreadMessagesAcrossAllProcessors => 5

    /**
     * @type {Integer (Int32)}
     */
    static IrqPolicyAllProcessorsInMachineWhenSteered => 6
}
