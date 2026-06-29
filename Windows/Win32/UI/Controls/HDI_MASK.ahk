#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct HDI_MASK {
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
    static HDI_WIDTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_HEIGHT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_TEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_FORMAT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_LPARAM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_BITMAP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_IMAGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_DI_SETITEM => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_ORDER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_FILTER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HDI_STATE => 512
}
