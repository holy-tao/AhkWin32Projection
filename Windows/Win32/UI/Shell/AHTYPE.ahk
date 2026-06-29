#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct AHTYPE {
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
    static AHTYPE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_USER_APPLICATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_ANY_APPLICATION => 16

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_MACHINEDEFAULT => 32

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_PROGID => 64

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_APPLICATION => 128

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_CLASS_APPLICATION => 256

    /**
     * @type {Integer (Int32)}
     */
    static AHTYPE_ANY_PROGID => 512
}
