#Requires AutoHotkey v2.0.0 64-bit

/**
 * The rendering priority affects the extent to which Direct2D will throttle its rendering workload.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_2/ne-d2d1_2-d2d1_rendering_priority
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_RENDERING_PRIORITY{

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
