#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct LOAD_PICTURE_FLAGS {
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
    static LP_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LP_MONOCHROME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LP_VGACOLOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LP_COLOR => 4
}
