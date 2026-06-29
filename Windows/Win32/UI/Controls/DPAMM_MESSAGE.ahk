#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct DPAMM_MESSAGE {
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
    static DPAMM_MERGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DPAMM_DELETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DPAMM_INSERT => 3
}
