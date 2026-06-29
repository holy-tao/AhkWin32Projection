#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct LOCAL_ALLOC_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static LHND => 66

    /**
     * @type {Integer (UInt32)}
     */
    static LMEM_FIXED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LMEM_MOVEABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LMEM_ZEROINIT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LPTR => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NONZEROLHND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NONZEROLPTR => 0
}
