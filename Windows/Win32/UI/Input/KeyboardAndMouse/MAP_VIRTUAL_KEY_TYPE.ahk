#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct MAP_VIRTUAL_KEY_TYPE {
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
    static MAPVK_VK_TO_VSC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MAPVK_VSC_TO_VK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAPVK_VK_TO_CHAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAPVK_VSC_TO_VK_EX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MAPVK_VK_TO_VSC_EX => 4
}
