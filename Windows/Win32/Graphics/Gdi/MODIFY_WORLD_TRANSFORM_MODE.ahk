#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct MODIFY_WORLD_TRANSFORM_MODE {
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
    static MWT_IDENTITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MWT_LEFTMULTIPLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MWT_RIGHTMULTIPLY => 3
}
