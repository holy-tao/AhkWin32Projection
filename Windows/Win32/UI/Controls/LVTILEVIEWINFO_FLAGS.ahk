#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVTILEVIEWINFO_FLAGS {
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
    static LVTVIF_AUTOSIZE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LVTVIF_FIXEDWIDTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVTVIF_FIXEDHEIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVTVIF_FIXEDSIZE => 3
}
