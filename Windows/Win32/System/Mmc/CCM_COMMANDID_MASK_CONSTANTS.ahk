#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Mmc
 */
export default struct CCM_COMMANDID_MASK_CONSTANTS {
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
    static CCM_COMMANDID_MASK_RESERVED => 4294901760
}
