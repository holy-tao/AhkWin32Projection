#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct EXPLORERBARPARTS {
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
    static EBP_HEADERBACKGROUND => 1

    /**
     * @type {Integer (Int32)}
     */
    static EBP_HEADERCLOSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static EBP_HEADERPIN => 3

    /**
     * @type {Integer (Int32)}
     */
    static EBP_IEBARMENU => 4

    /**
     * @type {Integer (Int32)}
     */
    static EBP_NORMALGROUPBACKGROUND => 5

    /**
     * @type {Integer (Int32)}
     */
    static EBP_NORMALGROUPCOLLAPSE => 6

    /**
     * @type {Integer (Int32)}
     */
    static EBP_NORMALGROUPEXPAND => 7

    /**
     * @type {Integer (Int32)}
     */
    static EBP_NORMALGROUPHEAD => 8

    /**
     * @type {Integer (Int32)}
     */
    static EBP_SPECIALGROUPBACKGROUND => 9

    /**
     * @type {Integer (Int32)}
     */
    static EBP_SPECIALGROUPCOLLAPSE => 10

    /**
     * @type {Integer (Int32)}
     */
    static EBP_SPECIALGROUPEXPAND => 11

    /**
     * @type {Integer (Int32)}
     */
    static EBP_SPECIALGROUPHEAD => 12
}
