#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct LoadHintEnum {
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
    static LoadDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static LoadAlways => 1

    /**
     * @type {Integer (Int32)}
     */
    static LoadSometimes => 2

    /**
     * @type {Integer (Int32)}
     */
    static LoadNever => 3
}
