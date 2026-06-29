#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input
 */
export default struct RID_DEVICE_INFO_TYPE {
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
    static RIM_TYPEMOUSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RIM_TYPEKEYBOARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RIM_TYPEHID => 2
}
