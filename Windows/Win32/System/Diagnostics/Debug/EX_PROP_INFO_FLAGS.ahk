#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct EX_PROP_INFO_FLAGS {
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
    static EX_PROP_INFO_ID => 256

    /**
     * @type {Integer (Int32)}
     */
    static EX_PROP_INFO_NTYPE => 512

    /**
     * @type {Integer (Int32)}
     */
    static EX_PROP_INFO_NVALUE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static EX_PROP_INFO_LOCKBYTES => 2048

    /**
     * @type {Integer (Int32)}
     */
    static EX_PROP_INFO_DEBUGEXTPROP => 4096
}
