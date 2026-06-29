#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The rendering priority affects the extent to which Direct2D will throttle its rendering workload.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_2/ne-d2d1_2-d2d1_rendering_priority
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_RENDERING_PRIORITY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No change in rendering workload priority.
     * @type {Integer (Int32)}
     */
    static D2D1_RENDERING_PRIORITY_NORMAL => 0

    /**
     * The device and its associated device contexts are given a lower priority than others.
     * @type {Integer (Int32)}
     */
    static D2D1_RENDERING_PRIORITY_LOW => 1
}
