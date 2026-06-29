#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct CONNECTDLGSTRUCT_FLAGS {
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
    static CONNDLG_RO_PATH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONNDLG_CONN_POINT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CONNDLG_USE_MRU => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CONNDLG_HIDE_BOX => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CONNDLG_PERSIST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CONNDLG_NOT_PERSIST => 32
}
