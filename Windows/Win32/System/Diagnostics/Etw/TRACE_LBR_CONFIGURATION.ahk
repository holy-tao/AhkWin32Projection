#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TRACE_LBR_CONFIGURATION {
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
    static TRACE_LBR_CONFIGURATION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static TRACE_LBR_CONFIGURATION_EXCLUDE_KERNEL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TRACE_LBR_CONFIGURATION_EXCLUDE_USER => 2

    /**
     * @type {Integer (Int32)}
     */
    static TRACE_LBR_CONFIGURATION_EXCLUDE_JCC => 4

    /**
     * @type {Integer (Int32)}
     */
    static TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_REL_CALL => 8

    /**
     * @type {Integer (Int32)}
     */
    static TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_IND_CALL => 16

    /**
     * @type {Integer (Int32)}
     */
    static TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_RET => 32

    /**
     * @type {Integer (Int32)}
     */
    static TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_IND_JMP => 64

    /**
     * @type {Integer (Int32)}
     */
    static TRACE_LBR_CONFIGURATION_EXCLUDE_NEAR_REL_JMP => 128

    /**
     * @type {Integer (Int32)}
     */
    static TRACE_LBR_CONFIGURATION_EXCLUDE_FAR_BRANCH => 256

    /**
     * @type {Integer (Int32)}
     */
    static TRACE_LBR_CONFIGURATION_CALLSTACK_ENABLE => 512

    /**
     * @type {Integer (Int32)}
     */
    static TRACE_LBR_CONFIGURATION_SAMPLED => 1024
}
