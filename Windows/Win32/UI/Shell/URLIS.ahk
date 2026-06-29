#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct URLIS {
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
    static URLIS_URL => 0

    /**
     * @type {Integer (Int32)}
     */
    static URLIS_OPAQUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static URLIS_NOHISTORY => 2

    /**
     * @type {Integer (Int32)}
     */
    static URLIS_FILEURL => 3

    /**
     * @type {Integer (Int32)}
     */
    static URLIS_APPLIABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static URLIS_DIRECTORY => 5

    /**
     * @type {Integer (Int32)}
     */
    static URLIS_HASQUERY => 6
}
