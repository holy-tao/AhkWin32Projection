#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorPEKind {
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
    static peNot => 0

    /**
     * @type {Integer (Int32)}
     */
    static peILonly => 1

    /**
     * @type {Integer (Int32)}
     */
    static pe32BitRequired => 2

    /**
     * @type {Integer (Int32)}
     */
    static pe32Plus => 4

    /**
     * @type {Integer (Int32)}
     */
    static pe32Unmanaged => 8

    /**
     * @type {Integer (Int32)}
     */
    static pe32BitPreferred => 16
}
