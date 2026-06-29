#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct UNMAP_VIEW_OF_FILE_FLAGS {
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
    static MEM_UNMAP_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_UNMAP_WITH_TRANSIENT_BOOST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_PRESERVE_PLACEHOLDER => 2
}
