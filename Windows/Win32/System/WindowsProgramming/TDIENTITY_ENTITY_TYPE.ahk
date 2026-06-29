#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct TDIENTITY_ENTITY_TYPE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static GENERIC_ENTITY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AT_ENTITY => 640

    /**
     * @type {Integer (UInt32)}
     */
    static CL_NL_ENTITY => 769

    /**
     * @type {Integer (UInt32)}
     */
    static CO_NL_ENTITY => 768

    /**
     * @type {Integer (UInt32)}
     */
    static CL_TL_ENTITY => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static CO_TL_ENTITY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ER_ENTITY => 896

    /**
     * @type {Integer (UInt32)}
     */
    static IF_ENTITY => 512
}
