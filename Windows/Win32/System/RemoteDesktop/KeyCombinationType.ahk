#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct KeyCombinationType {
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
    static KeyCombinationHome => 0

    /**
     * @type {Integer (Int32)}
     */
    static KeyCombinationLeft => 1

    /**
     * @type {Integer (Int32)}
     */
    static KeyCombinationUp => 2

    /**
     * @type {Integer (Int32)}
     */
    static KeyCombinationRight => 3

    /**
     * @type {Integer (Int32)}
     */
    static KeyCombinationDown => 4

    /**
     * @type {Integer (Int32)}
     */
    static KeyCombinationScroll => 5
}
