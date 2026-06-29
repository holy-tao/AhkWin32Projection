#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_RUN_VP_EXIT_REASON {
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
    static WHvRunVpExitReasonNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonMemoryAccess => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonX64IoPortAccess => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonUnrecoverableException => 4

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonInvalidVpRegisterValue => 5

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonUnsupportedFeature => 6

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonX64InterruptWindow => 7

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonX64Halt => 8

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonX64ApicEoi => 9

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonSynicSintDeliverable => 10

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonX64MsrAccess => 4096

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonX64Cpuid => 4097

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonException => 4098

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonX64Rdtsc => 4099

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonX64ApicSmiTrap => 4100

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonHypercall => 4101

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonX64ApicInitSipiTrap => 4102

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonX64ApicWriteTrap => 4103

    /**
     * @type {Integer (Int32)}
     */
    static WHvRunVpExitReasonCanceled => 8193
}
