#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct LANG_BAR_ITEM_ICON_MODE_FLAGS {
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
    static TF_DTLBI_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TF_DTLBI_USEPROFILEICON => 1
}
