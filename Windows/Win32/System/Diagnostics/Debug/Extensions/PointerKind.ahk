#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PointerKind {
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
    static PointerStandard => 0

    /**
     * @type {Integer (Int32)}
     */
    static PointerReference => 1

    /**
     * @type {Integer (Int32)}
     */
    static PointerRValueReference => 2

    /**
     * @type {Integer (Int32)}
     */
    static PointerCXHat => 3

    /**
     * @type {Integer (Int32)}
     */
    static PointerManagedReference => 4
}
