#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct PAGING_MODE {
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
    static Paging_Invalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static Paging_NonPaged => 1

    /**
     * @type {Integer (Int32)}
     */
    static Paging_32Bit => 2

    /**
     * @type {Integer (Int32)}
     */
    static Paging_Pae => 3

    /**
     * @type {Integer (Int32)}
     */
    static Paging_Long => 4

    /**
     * @type {Integer (Int32)}
     */
    static Paging_Armv8 => 5
}
