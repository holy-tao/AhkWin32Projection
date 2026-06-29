#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct EDIT_LINKS_FLAGS {
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
    static ELF_SHOWHELP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ELF_DISABLEUPDATENOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ELF_DISABLEOPENSOURCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ELF_DISABLECHANGESOURCE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ELF_DISABLECANCELLINK => 16
}
