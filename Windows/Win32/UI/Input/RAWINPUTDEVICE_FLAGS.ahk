#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input
 */
export default struct RAWINPUTDEVICE_FLAGS {
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
    static RIDEV_REMOVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_EXCLUDE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_PAGEONLY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_NOLEGACY => 48

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_INPUTSINK => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_CAPTUREMOUSE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_NOHOTKEYS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_APPKEYS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_EXINPUTSINK => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static RIDEV_DEVNOTIFY => 8192
}
