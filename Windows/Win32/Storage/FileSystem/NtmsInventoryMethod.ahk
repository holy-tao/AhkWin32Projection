#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsInventoryMethod {
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
    static NTMS_INVENTORY_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_INVENTORY_FAST => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_INVENTORY_OMID => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_INVENTORY_DEFAULT => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_INVENTORY_SLOT => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_INVENTORY_STOP => 5

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_INVENTORY_MAX => 6
}
