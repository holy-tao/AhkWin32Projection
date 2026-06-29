#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct DRAW_THEME_PARENT_BACKGROUND_FLAGS {
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
    static DTPB_WINDOWDC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DTPB_USECTLCOLORSTATIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DTPB_USEERASEBKGND => 4
}
