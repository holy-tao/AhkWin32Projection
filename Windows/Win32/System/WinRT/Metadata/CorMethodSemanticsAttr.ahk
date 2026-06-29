#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorMethodSemanticsAttr {
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
    static msSetter => 1

    /**
     * @type {Integer (Int32)}
     */
    static msGetter => 2

    /**
     * @type {Integer (Int32)}
     */
    static msOther => 4

    /**
     * @type {Integer (Int32)}
     */
    static msAddOn => 8

    /**
     * @type {Integer (Int32)}
     */
    static msRemoveOn => 16

    /**
     * @type {Integer (Int32)}
     */
    static msFire => 32
}
