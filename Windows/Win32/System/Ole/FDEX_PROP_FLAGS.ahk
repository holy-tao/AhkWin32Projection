#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct FDEX_PROP_FLAGS {
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
    static fdexPropCanGet => 1

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCannotGet => 2

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCanPut => 4

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCannotPut => 8

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCanPutRef => 16

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCannotPutRef => 32

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropNoSideEffects => 64

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropDynamicType => 128

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCanCall => 256

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCannotCall => 512

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCanConstruct => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCannotConstruct => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCanSourceEvents => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static fdexPropCannotSourceEvents => 8192
}
