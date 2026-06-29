#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.StationsAndDesktops
 */
export default struct DESKTOP_ACCESS_FLAGS {
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
    static DESKTOP_DELETE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_READ_CONTROL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_WRITE_DAC => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_WRITE_OWNER => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_SYNCHRONIZE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_READOBJECTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_CREATEWINDOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_CREATEMENU => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_HOOKCONTROL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_JOURNALRECORD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_JOURNALPLAYBACK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_ENUMERATE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_WRITEOBJECTS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_SWITCHDESKTOP => 256
}
