#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct ICM_MODE {
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
    static ICM_OFF => 1

    /**
     * @type {Integer (Int32)}
     */
    static ICM_ON => 2

    /**
     * @type {Integer (Int32)}
     */
    static ICM_QUERY => 3

    /**
     * @type {Integer (Int32)}
     */
    static ICM_DONE_OUTSIDEDC => 4
}
