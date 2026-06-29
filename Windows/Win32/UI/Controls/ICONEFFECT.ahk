#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct ICONEFFECT {
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
    static ICE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ICE_GLOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static ICE_SHADOW => 2

    /**
     * @type {Integer (Int32)}
     */
    static ICE_PULSE => 3

    /**
     * @type {Integer (Int32)}
     */
    static ICE_ALPHA => 4
}
