#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorNativeLinkType {
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
    static nltNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static nltAnsi => 2

    /**
     * @type {Integer (Int32)}
     */
    static nltUnicode => 3

    /**
     * @type {Integer (Int32)}
     */
    static nltAuto => 4

    /**
     * @type {Integer (Int32)}
     */
    static nltOle => 5

    /**
     * @type {Integer (Int32)}
     */
    static nltMaxValue => 7
}
