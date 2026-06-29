#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NAVIGATIONPARTS {
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
    static NAV_BACKBUTTON => 1

    /**
     * @type {Integer (Int32)}
     */
    static NAV_FORWARDBUTTON => 2

    /**
     * @type {Integer (Int32)}
     */
    static NAV_MENUBUTTON => 3
}
