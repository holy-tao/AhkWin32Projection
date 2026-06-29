#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct PROPERTYUI_NAME_FLAGS {
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
    static PUIFNF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static PUIFNF_MNEMONIC => 1
}
