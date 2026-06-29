#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_DLL_CHARACTERISTICS {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_HIGH_ENTROPY_VA => 32

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE => 64

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY => 128

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_NX_COMPAT => 256

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_NO_ISOLATION => 512

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_NO_SEH => 1024

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_NO_BIND => 2048

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_APPCONTAINER => 4096

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_WDM_DRIVER => 8192

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_GUARD_CF => 16384

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE => 32768

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_EX_CET_COMPAT => 1

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_EX_CET_COMPAT_STRICT_MODE => 2

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_EX_CET_SET_CONTEXT_IP_VALIDATION_RELAXED_MODE => 4

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_EX_CET_DYNAMIC_APIS_ALLOW_IN_PROC => 8

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_EX_CET_RESERVED_1 => 16

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_EX_CET_RESERVED_2 => 32

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT => 64

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DLLCHARACTERISTICS_EX_HOTPATCH_COMPATIBLE => 128
}
