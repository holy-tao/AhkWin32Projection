#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHCNF_FLAGS {
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
    static SHCNF_IDLIST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNF_PATHA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNF_PRINTERA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNF_DWORD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNF_PATHW => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNF_PRINTERW => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNF_TYPE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNF_FLUSH => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNF_FLUSHNOWAIT => 12288

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNF_NOTIFYRECURSIVE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNF_PATH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNF_PRINTER => 6
}
