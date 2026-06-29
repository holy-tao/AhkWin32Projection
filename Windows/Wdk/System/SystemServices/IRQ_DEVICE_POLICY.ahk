#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IRQ_DEVICE_POLICY {
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
