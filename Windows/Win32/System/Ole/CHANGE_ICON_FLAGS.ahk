#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct CHANGE_ICON_FLAGS {
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
    static CIF_SHOWHELP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CIF_SELECTCURRENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CIF_SELECTDEFAULT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CIF_SELECTFROMFILE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CIF_USEICONEXE => 16
}
