#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TAB_CONTROL_ITEM_STATE {
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
    static TCIS_BUTTONPRESSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TCIS_HIGHLIGHTED => 2
}
