#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 */
export default struct CREATE_TOOLHELP_SNAPSHOT_FLAGS {
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
    static TH32CS_INHERIT => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static TH32CS_SNAPALL => 15

    /**
     * @type {Integer (UInt32)}
     */
    static TH32CS_SNAPHEAPLIST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TH32CS_SNAPMODULE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TH32CS_SNAPMODULE32 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TH32CS_SNAPPROCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TH32CS_SNAPTHREAD => 4
}
