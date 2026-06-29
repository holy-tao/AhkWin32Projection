#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SERVICE_NODE_TYPE {
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
    static DriverType => 1

    /**
     * @type {Integer (Int32)}
     */
    static FileSystemType => 2

    /**
     * @type {Integer (Int32)}
     */
    static Win32ServiceOwnProcess => 16

    /**
     * @type {Integer (Int32)}
     */
    static Win32ServiceShareProcess => 32

    /**
     * @type {Integer (Int32)}
     */
    static AdapterType => 4

    /**
     * @type {Integer (Int32)}
     */
    static RecognizerType => 8
}
