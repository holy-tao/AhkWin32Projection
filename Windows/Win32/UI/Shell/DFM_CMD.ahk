#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DFM_CMD {
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
    static DFM_CMD_DELETE => -1

    /**
     * @type {Integer (Int32)}
     */
    static DFM_CMD_MOVE => -2

    /**
     * @type {Integer (Int32)}
     */
    static DFM_CMD_COPY => -3

    /**
     * @type {Integer (Int32)}
     */
    static DFM_CMD_LINK => -4

    /**
     * @type {Integer (Int32)}
     */
    static DFM_CMD_PROPERTIES => -5

    /**
     * @type {Integer (Int32)}
     */
    static DFM_CMD_NEWFOLDER => -6

    /**
     * @type {Integer (Int32)}
     */
    static DFM_CMD_PASTE => -7

    /**
     * @type {Integer (Int32)}
     */
    static DFM_CMD_VIEWLIST => -8

    /**
     * @type {Integer (Int32)}
     */
    static DFM_CMD_VIEWDETAILS => -9

    /**
     * @type {Integer (Int32)}
     */
    static DFM_CMD_PASTELINK => -10

    /**
     * @type {Integer (Int32)}
     */
    static DFM_CMD_PASTESPECIAL => -11

    /**
     * @type {Integer (Int32)}
     */
    static DFM_CMD_MODALPROP => -12

    /**
     * @type {Integer (Int32)}
     */
    static DFM_CMD_RENAME => -13
}
