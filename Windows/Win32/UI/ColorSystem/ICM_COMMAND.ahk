#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct ICM_COMMAND {
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
    static ICM_ADDPROFILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_DELETEPROFILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_QUERYPROFILE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_SETDEFAULTPROFILE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_REGISTERICMATCHER => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_UNREGISTERICMATCHER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ICM_QUERYMATCH => 7
}
